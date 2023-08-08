Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752877403C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 19:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580138.908539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ4V-0001EJ-5H; Tue, 08 Aug 2023 17:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580138.908539; Tue, 08 Aug 2023 17:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ4U-00012T-Eh; Tue, 08 Aug 2023 17:00:38 +0000
Received: by outflank-mailman (input) for mailman id 580138;
 Tue, 08 Aug 2023 17:00:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T7Ie=DZ=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1qTQ4R-0007KP-Ny
 for xen-devel@lists.xen.org; Tue, 08 Aug 2023 17:00:35 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 141b2db0-360d-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 19:00:30 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qTQ4E-0002EB-Ly; Tue, 08 Aug 2023 17:00:22 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qTQ4E-0002Mq-KX; Tue, 08 Aug 2023 17:00:22 +0000
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
X-Inumbo-ID: 141b2db0-360d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=XF+UrQzxCsQAO1ziUVnoWjoX2Wjp8D0sLL+ai1kpVc8=; b=pwUzTpFpAOwLBfHDBG7djxbQM4
	mREzvolVB1T3ZIfsnyjjGMkT/B+fTcsuD7VhpYtCCAZNS96m/098QIRxLlkXVmFn20J4I+/sPmHpx
	J1cwyy6tGPdnkTtnXoAV/aPTQ13vad0Cl5z3AwoJOSTGUzVOOnXTgoBGmiqJ8jMc2P20=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 434 v1 (CVE-2023-20569) - x86/AMD:
 Speculative Return Stack Overflow
Message-Id: <E1qTQ4E-0002Mq-KX@xenbits.xenproject.org>
Date: Tue, 08 Aug 2023 17:00:22 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-20569 / XSA-434

               x86/AMD: Speculative Return Stack Overflow

ISSUE DESCRIPTION
=================

Researchers from ETH Zurich have extended their prior research (XSA-422,
Branch Type Confusion, a.k.a Retbleed) and have discovered INCEPTION,
also know as RAS (Return Address Stack) Poisoning, and Speculative
Return Stack Overflow.

The RAS is updated when a CALL instruction is predicted, rather than at
a later point in the pipeline.  However, the RAS is still fundamentally
a circular stack.

It is possible to poison the branch type and target predictions such
that, at a point of the attackers choosing, the branch predictor
predicts enough CALLs back-to-back to wrap around the entire RAS and
overwrite a correct return prediction with one of the attackers
choosing.

This allows the attacker to control RET speculation in a victim context,
and leak arbitrary data as a result.

For more details, see:
  https://comsec.ethz.ch/inception
  https://www.amd.com/en/corporate/product-security/bulletin/amd-sb-7005

IMPACT
======

An attacker might be able to infer the contents of memory belonging to
other guests.

VULNERABLE SYSTEMS
==================

Only CPUs from AMD are believed to be potentially vulnerable.  CPUs from
other manufacturers are not believed to be impacted.

At the time of writing, all in-support AMD CPUs (that is, Zen1 thru Zen4
microarchitectures) are believed to be potentially vulnerable.  Older
CPUs have not been analysed.

By default following XSA-422, Xen mitigates BTC on AMD Zen2 and older
CPUs by issuing an IBPB on entry to Xen.  On Zen2 and older CPUs, this
is believed to be sufficient to protect against SRSO too.

AMD Zen3 and Zen4 CPUs are susceptible to SRSO too.  All versions of Xen
are vulnerable on these CPUs.

MITIGATION
==========

On Zen3 and Zen4, there is no mitigation.

RESOLUTION
==========

AMD are producing microcode updates for Zen3 and Zen4.  Consult your
dom0 OS vendor.

With the microcode update applied, booting Xen with
`spec-ctrl=ibpb-entry` is sufficient to protect against SRSO.

The appropriate set of patches will default to using IBPB-on-entry on
Zen3 and Zen4 CPUs, as well as synthesise new CPUID bits for guests to
use in order to determine their susceptibility in a migration-safe way.

The patches for this issue interact texturally but not logically with
the fixes for XSA-435, which itself has complexities.  See XSA-435 for
details of how to obtain the fixes.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmTSZOsMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ8uMIAL2xBV/B3O0t90aFhX75dOWZBUkujMN0xHDjyI+c
lnEmy44QnX+jI9IBSuc4qaJmLXnUO71WsMU1XeKucOnh9E1kjgHB2H0GgS+GI6dG
LtAVxn+RRK39YIO0CHAXvr/tlX/eyodvxtmxOKLRY47J0hHLToXBEdc2VfXrUEfk
8AZn4hhHDGfRMX7jguxPFnrKCS3sZCFn1FYPtUxNGi2BbUzFacc+zZ2OISR7C59H
24q9UIgUVoVwOnUWBEzW6oHmjP44Q0kG3E8LhZQhr1YkAG++KapgTPllc3cU4xja
G8ozTeMeyVbM29EMS7QknOlkvMSUmtgzNg7Pt6El9oSyuH4=
=rrcN
-----END PGP SIGNATURE-----

--=separator--

