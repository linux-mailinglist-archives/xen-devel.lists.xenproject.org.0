Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7CD7ADDBD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 19:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607982.946278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkpE9-0000od-TN; Mon, 25 Sep 2023 17:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607982.946278; Mon, 25 Sep 2023 17:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkpE9-0000j8-Qi; Mon, 25 Sep 2023 17:18:33 +0000
Received: by outflank-mailman (input) for mailman id 607982;
 Mon, 25 Sep 2023 17:18:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1il/=FJ=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1qkpE8-0000do-IJ
 for xen-devel@lists.xen.org; Mon, 25 Sep 2023 17:18:32 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88238663-5bc7-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 19:18:28 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qkpDs-0004vH-06; Mon, 25 Sep 2023 17:18:16 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qkpDr-0005W1-UI; Mon, 25 Sep 2023 17:18:15 +0000
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
X-Inumbo-ID: 88238663-5bc7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=1SeR4xn+wsNgQw8XgwMb9lXe9y838lCWovJEFN+RunU=; b=oxJl0jPqT1ibAXYpXztu3+sfO+
	+Vnlx+Mgz6IB0NtzNPsMWkmHd1s/ePd8uilCSY73JsDYmDJ4MTJV6fv4oNq+AfgHxJsLKXwj7Uun0
	spLxfMmtZOJa95Tz0zWY4XifMlQWrH0kIGUh2TauM22i/XZglUrQs+9teUPo1n0eiUN4=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 439 v2 (CVE-2023-20588) - x86/AMD: Divide
 speculative information leak
Message-Id: <E1qkpDr-0005W1-UI@xenbits.xenproject.org>
Date: Mon, 25 Sep 2023 17:18:15 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-20588 / XSA-439
                               version 2

             x86/AMD: Divide speculative information leak

UPDATES IN VERSION 2
====================

Version 1 accidentally linked to the wrong AMD bulletin.  This has been
corrected in v2.  All other information in v1 is believed to be correct.

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
 * https://www.amd.com/en/resources/product-security/bulletin/amd-sb-7007.html

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmURwLwMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZMjgIAI+pm7OnUq8EbuD6eyB7yDKBRwm9U7Hu2yrO47f0
CHO/HdMANfx0nCbpKS8+7GXa2gooJXgp3Fo0NGri2G0+hzXNQTsaGnMEMgBV7O0M
OXYzao39dhPATP4hi5bm0xPTZ+3zMaP06xvl7JqNqsPK8GFz/cZr/Hsz5r2boZRO
3FXEmbgsG2KTR5+HrSNoeA3LM9aoUqEiIq6oGxLaTr7UI6xK4FL5VFloWhS0r9yp
gD7HHP6NlV1Ysxt1xKCxf109HrzWEvih/Gd8hG6eqiHR+i2zyS1hna8Ll/sRFkOO
x9FpYHljtb3WKX9bUh4aZXdoAWRW0aR+SWcXToPSk5aFJiE=
=W6vz
-----END PGP SIGNATURE-----

--=separator--

