Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B0A48307
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 16:33:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898258.1306846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnft5-0005J1-7J; Thu, 27 Feb 2025 15:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898258.1306846; Thu, 27 Feb 2025 15:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnft5-0005GF-4C; Thu, 27 Feb 2025 15:33:23 +0000
Received: by outflank-mailman (input) for mailman id 898258;
 Thu, 27 Feb 2025 15:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFCm=VS=bounce.vates.tech=bounce-md_30504962.67c085be.v1-62c912fe07e24d038813849dca840bfd@srs-se1.protection.inumbo.net>)
 id 1tnft4-0005G9-ED
 for xen-devel@lists.xen.org; Thu, 27 Feb 2025 15:33:22 +0000
Received: from mail145-26.atl61.mandrillapp.com
 (mail145-26.atl61.mandrillapp.com [198.2.145.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bd58dbd-f520-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 16:33:20 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-26.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4Z3b2k5Nq0zJKF6Dh
 for <xen-devel@lists.xen.org>; Thu, 27 Feb 2025 15:33:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 62c912fe07e24d038813849dca840bfd; Thu, 27 Feb 2025 15:33:18 +0000
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
X-Inumbo-ID: 2bd58dbd-f520-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1740670398; x=1740940398;
	bh=dBZBuubQa/S8+YBv2cd4IjhfRktslY9IUjteuJ0fU1c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mTBsk0ZdtBn7+sKrbaoPqIBUnE0UdqgXKHQR1ujW/HRVpk+zWwnhlPPSZcgJ6REbL
	 K59VSMcv7Gs3YIS1GqLPRyToIIsBxzrLuI2VZKBgZdeHJgihtvfC4cYs8GB8WMT+BB
	 OqhLaOw+K47i2BDFiQ2YYk7mR3fTIh8o4LlmbUgaaJWAUOpWL8ZpbtI8xpqEHp2VUx
	 YyxYSd7V+/gTBb1ezxN8UjGZdIa0257HzvoUCvu51NdOZbqdAXzFxQHjj+Wld7Ea61
	 /bXC0TYJVV6wfynABF63TpxNmzk1JGCdgE9TPvRddhmdtpA7ScER8MOdP897d7hFu4
	 Qsw5MLVUgmM3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1740670398; x=1740930898; i=teddy.astie@vates.tech;
	bh=dBZBuubQa/S8+YBv2cd4IjhfRktslY9IUjteuJ0fU1c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lO09eHDfRFa11vVah+O9Yd7KF92UUHe15eXQa/y5Sw/sQC+ALBn6J3EWPPIxOGgqF
	 jXeo2O1+75zviMOCIRLkERvqQCDtuElaWyBsSztQ+8pHxi+gRGoulJNUKt5s7MtTph
	 ciKwFfyE6G9ZYcXngusjuBr4RqnjBwx62ND47GGkV74paWwerKvIBqBv9k7x+/wyJi
	 gMK+wTMLZQzKfeLiovqwXYBylrhNnkcrQQL6drtHs3cI6JpHSRi9t55WJE8tX2jPc6
	 nfvr5iyEb4XCic5ynzPE+Fui+B0RHfjOdAN2PpcHTXGCF+JRyenruwtwDBxUP+nwKa
	 1g5T02hNpBclQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Xen=20Security=20Advisory=20467=20v1=20(CVE-2025-1713)=20-=20deadlock=20potential=20with=20VT-d=20and=20legacy=20PCI=20device=20pass-through?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1740670397704
Message-Id: <5ecf18f8-e8e9-431d-bb59-4631a598574e@vates.tech>
To: "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org, xen-devel@lists.xen.org, xen-users@lists.xen.org, oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
References: <E1tndOO-00CM3B-2R@xenbits.xenproject.org>
In-Reply-To: <E1tndOO-00CM3B-2R@xenbits.xenproject.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.62c912fe07e24d038813849dca840bfd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250227:md
Date: Thu, 27 Feb 2025 15:33:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 27/02/2025 =C3=A0 13:57, Xen.org security team a =C3=A9crit :
>              Xen Security Advisory CVE-2025-1713 / XSA-467
> 
>      deadlock potential with VT-d and legacy PCI device pass-through
> 
> ISSUE DESCRIPTION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> When setting up interrupt remapping for legacy PCI(-X) devices,
> including PCI(-X) bridges, a lookup of the upstream bridge is required.
> This lookup, itself involving acquiring of a lock, is done in a context
> where acquiring that lock is unsafe.  This can lead to a deadlock.
> 
> IMPACT
> =3D=3D=3D=3D=3D=3D
> 
> The passing through of certain kinds of devices to an unprivileged guest
> can result in a Denial of Service (DoS) affecting the entire host.
> 
> Note: Normal usage of such devices by a privileged domain can also
>        trigger the issue.  In such a scenario, the deadlock is not
>        considered a security issue, but just a plain bug.
> 
> VULNERABLE SYSTEMS
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Xen versions 4.0 and later are affected.  Xen versions 3.4 and earlier
> are not directly affected, but had other issues.
> 
> Systems with Intel IOMMU hardware (VT-d) are affected.  Systems using
> AMD or non-x86 hardware are not affected.
> 
> Only systems where certain kinds of devices are passed through to an
> unprivileged guest are vulnerable.
> 
> MITIGATION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Avoiding the passing through of the affected device types will avoid
> the vulnerability.
> 

Is disabling interrupt remapping another way of mitigating this 
vulnerability (e.g iommu=3Dno-intremap) ?

> RESOLUTION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Applying the attached patch resolves this issue.
> 
> Note that patches for released versions are generally prepared to
> apply to the stable branches, and may not apply cleanly to the most
> recent release tarball.  Downstreams are encouraged to update to the
> tip of the stable branch before applying these patches.
> 
> xsa467.patch           xen-unstable - Xen 4.17.x
> 
> $ sha256sum xsa467*
> 2fffaa8892b3daecd698b4af95701045874a76edc2e18c8d2abbec85a39aa05c  xsa467.=
patch
> $
> 
> NOTE REGARDING LACK OF EMBARGO
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> 
> The issue was reported initially on a public bug tracker and discussed in
> public before it was realized that there was a security aspect.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


