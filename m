Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC577403A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 19:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580137.908543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ4V-0001Sh-Mc; Tue, 08 Aug 2023 17:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580137.908543; Tue, 08 Aug 2023 17:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ4V-0001Cv-4B; Tue, 08 Aug 2023 17:00:39 +0000
Received: by outflank-mailman (input) for mailman id 580137;
 Tue, 08 Aug 2023 17:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T7Ie=DZ=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1qTQ4R-0008Pg-HR
 for xen-devel@lists.xen.org; Tue, 08 Aug 2023 17:00:35 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15ac9c68-360d-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 19:00:33 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qTQ4I-0002EZ-BA; Tue, 08 Aug 2023 17:00:26 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qTQ4I-0002Ny-AH; Tue, 08 Aug 2023 17:00:26 +0000
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
X-Inumbo-ID: 15ac9c68-360d-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=en5sf8iDi6wMkkzej5Amgs+r5p4GVNXHBgZi2MSJb+Y=; b=MPKkG5jYUN1tO1svplxiF31itS
	EfRa7qABXTT6mdyJmfkzEiCeGh5QCYMrshVCbcsWvIX4jERLUo2cWdKnhrclAI/UVwb1RBiK7fOtQ
	ffUNRwKar3WoVhwdaOwzqdlBce6uDGTNfeRu1D1JuxEEmTV07FG3UNJGgqPEUEEMhfDo=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 435 v1 (CVE-2022-40982) - x86/Intel: Gather
 Data Sampling
Message-Id: <E1qTQ4I-0002Ny-AH@xenbits.xenproject.org>
Date: Tue, 08 Aug 2023 17:00:26 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-40982 / XSA-435

                    x86/Intel: Gather Data Sampling

ISSUE DESCRIPTION
=================

A researcher has discovered Gather Data Sampling, a transient execution
side-channel whereby the AVX GATHER instructions can forward the content
of stale vector registers to dependent instructions.

The physical register file is a structure competitively shared between
sibling threads.  Therefore an attacker can infer data from the sibling
thread, or from a more privileged context.

For more details, see:
  https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/gather-data-sampling.html

IMPACT
======

An attacker can infer data from different contexts on the same core.
Examples of such data includes key material, cipher and plaintext from
the AES-NI instructions, or the contents of REP-MOVS instructions,
commonly used to implement memcpy().

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.

See the Intel documentation for a list of affected processors.

CPUs from other hardware vendors are not believed to be affected.

MITIGATION
==========

This issue can be mitigated by disabling AVX, either by booting Xen with
`cpuid=no-avx` on the command line, or by specifying `cpuid="host:avx=0"`
in the vm.cfg file of all untrusted VMs.  However, this may come with a
significant performance impact on the system and is not recommended for
anyone able to deploy the microcode and patch described below.

RESOLUTION
==========

Intel are producing microcode updates to address the issue for most
affected CPUs.  Consult your dom0 OS vendor.  This microcode is
effective when late-loaded, which can be performed on a live system
without reboot.

Without microcode, disabling AVX is the only mitigation.  This is
implemented by the patches to Xen on hardware believed to be vulnerable.

In addition, to indicate safety to guest kernels, Xen needs to
synthesise new bits for guests to see, which depends on MSR_ARCH_CAPS
being visible to guests.  The work to support MSR_ARCH_CAPS is extensive
and has been going on in public in earnest since March.  The backports
to security trees are more-extensive still.

Therefore, we have decided to produce new releases on all stable trees.
Please find fixes in the respective branches under the following release
tags:

  RELEASE-4.17.2
  RELEASE-4.16.5
  RELEASE-4.15.5
  RELEASE-4.14.6

Other release activities (tarballs, announcements, etc) will happen in
due course.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmTSZQcMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZoMQH/RAjt/wZHCg/aFunhbiAbdzWmJo36Cz6KL+R2G+v
sBiPMsBvZxSikl6yeYAADgEUFKqNWQhLCAl6oaqgPbtDhFOxeZ72DRhgwZIx2KNL
85ECXk3rFhipiai6oHHbOemjPglXsyz+B5+NE64gOjpjdms9cfvfWnMnSQRF+NKa
vbpEeP+KIK1EcmKOp/xfzjjgEzg7VmJ8jnct0A77sUQYi3Ll1+ENLEcqDElP+Qob
wmM6QYkz78q/xO+R+bT+NNJ33q6JXQdixXa3ddiWrcvL/A3SveqtQh78u9daKmFM
aaivBTgJSWk0348aelEF8UjLNKx8rVRc4Dk2elioiE1PCe8=
=05gz
-----END PGP SIGNATURE-----

--=separator--

