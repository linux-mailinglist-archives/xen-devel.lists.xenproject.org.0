Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B57ADCAB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 18:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607899.946217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qko5m-0004Oe-GN; Mon, 25 Sep 2023 16:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607899.946217; Mon, 25 Sep 2023 16:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qko5m-0004Lo-DU; Mon, 25 Sep 2023 16:05:50 +0000
Received: by outflank-mailman (input) for mailman id 607899;
 Mon, 25 Sep 2023 16:05:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1il/=FJ=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1qko5l-0004LH-1e
 for xen-devel@lists.xen.org; Mon, 25 Sep 2023 16:05:49 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 624eabf2-5bbd-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 18:05:47 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qko5Z-0002z9-Od; Mon, 25 Sep 2023 16:05:37 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qko5Z-0003cF-KD; Mon, 25 Sep 2023 16:05:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 624eabf2-5bbd-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=lPmB8qQQXXuq9W/r6/iH+aRzO+9NkrUlusE1Zq/F/90=; b=v3AGhr0xJI5Z01nn0CKPu9Yp+S
	96eNghllz9dalMVS1WAZrKpjGWgqjM9aSNDEGe+QMDu9RXQZ/01hVnYkFnUg4+ok2lkxzA7VSJ5R6
	QmGVJf6I/Arru2hOcWi9ccFN/n6O3Bv1D7j8SZ4568C5/igjCI1xIqVHFOEtNQetSAbw=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 439 v1 (CVE-2023-20588) - x86/AMD: Divide
 speculative information leak
Message-Id: <E1qko5Z-0003cF-KD@xenbits.xenproject.org>
Date: Mon, 25 Sep 2023 16:05:37 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-20588 / XSA-439

             x86/AMD: Divide speculative information leak

ISSUE DESCRIPTION
=================

In the Zen1 microarchitecure, there is one divider in the pipeline which
services uops from both threads.  In the case of #DE, the latched result
from the previous DIV to execute will be forwarded speculatively.

This is a covert channel that allows two threads to communicate without
any system calls.  In also allows userspace to obtain the result of the
most recent DIV instruction executed (even speculatively) in the core,
which can be from a higher privilege context.

For more information, see:
 * https://www.amd.com/en/resources/product-security/bulletin/amd-sb-7008.html

IMPACT
======

An attacker might be able to infer data from a different execution
context on the same CPU core.

VULNERABLE SYSTEMS
==================

All versions of Xen are vulnerable.

Only AMD Zen1 CPUs are believed to be vulnerable.

MITIGATION
==========

There is no mitigation.

RESOLUTION
==========

The patches for Xen overwrite the buffer in the divider on the
return-to-guest path.

However, as with some prior speculative vulnerabilities, the fix is only
effective in combination with disabling SMT.  For the same reasons as
before, Xen does not disable SMT by default.

The system administrator is required to risk-assess their workload, and
choose whether to enable or disable SMT.  Xen will issue a warning if
SMT is active and the user has not provided an explicit choice via the
smt=<bool> command line option.

Details of the vulnerability became public before the Xen patches were
complete.  Hence the patches are already applied to the appropriate
trees.  They are:

Xen-unstable: 1c18d7377453^..b5926c6ecf05
Xen 4.17:     d2d2dcae879c^..9ac2f49f5fa3
Xen 4.16:     08539e8315fd^..de751c3d906d
Xen 4.15:     db3386e6cad6^..d7b78041dc81
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmURr2UMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZA1QH/RNSR1O6QJjd7z2gSGA9Yka7VWyYOMB2J01AaIl7
69zCRkpqg+baF1aQaAVR0fj39aF7M7xXrd/LSk+E4BBiCRSxxRzbWUGYn9qTLR9w
srbpGXqy0aWod9MiwfbTuEzf9uG8XpwOGoRg6p6YBRYE3WrQxIVnYY+KjeeToTEs
+UXZ0iZPrjaGaqKnF+PpkX4CMsqHhxk3iJw+ZFX2V4fVNRYgCOpjejmMjbWM4ABr
eSsCjTU92/YZvFOsTeIzu74h5yM6SH+XTPW2S8Ve5j3mk7sM8nIiYbIyTMWNCJID
HXeodt6eHjhZzV2z7f+/zEngnoITIqz+X3tRcTkHB9+H5jU=
=AtsG
-----END PGP SIGNATURE-----

--=separator--

