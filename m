Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651589F4BF1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 14:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859128.1271270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXWO-0000yN-JA; Tue, 17 Dec 2024 13:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859128.1271270; Tue, 17 Dec 2024 13:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNXWO-0000wA-Fw; Tue, 17 Dec 2024 13:21:56 +0000
Received: by outflank-mailman (input) for mailman id 859128;
 Tue, 17 Dec 2024 13:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+S0=TK=bounce.vates.tech=bounce-md_30504962.67617aef.v1-650f076e19e44eb5947ea701a3f246be@srs-se1.protection.inumbo.net>)
 id 1tNXWM-0000w4-EF
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 13:21:54 +0000
Received: from mail179-16.suw41.mandrillapp.com
 (mail179-16.suw41.mandrillapp.com [198.2.179.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0cc4649-bc79-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 14:21:52 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-16.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4YCHXH3HbPzB5pL2L
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 13:21:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 650f076e19e44eb5947ea701a3f246be; Tue, 17 Dec 2024 13:21:51 +0000
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
X-Inumbo-ID: e0cc4649-bc79-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1734441711; x=1734702211;
	bh=rYIwv/TK1wI4Tb+V65fQt+ZmbiUsozT8p/Au4/qBMXs=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MH2Gd92OwhO5fCDZ0X4ZpU8x0bl7q3OcX0g/4KKHFCGX9VZspl05klEncvFPf2OVt
	 ZT6ai5mX/MBoEzdPlMrAHDF+Sp80bIFI2hLdKpV5g0G5ASr9RJ2bvvSxEfYahRaFFB
	 mwI2sew+Om+e4vQtkfdZUawK4MXLY4e0MLZWBynAz8hoq1kqKWBXMF7lE9wq6E0551
	 1qDL61Nrgod+k7FAjjp2W6FQuvhHCaG9u8iW3iLBrudX7zYex8xVZgmmgf9Mx68JTC
	 jQg/WcaTXiWmZrBg+SkJgLFOHUpIK37APkkNv3mrOVC4813KmOiLTo77e9rF213WAv
	 WVtx1DUC8BCYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1734441711; x=1734702211; i=teddy.astie@vates.tech;
	bh=rYIwv/TK1wI4Tb+V65fQt+ZmbiUsozT8p/Au4/qBMXs=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ae223K+UN2eiUe68D0IqTl0zL4aQ1BNP+El6KwOg4c2aJBdqHbMjKN8rKWDMkKIId
	 /dTc/FV2OjMhA/ofizPA82INOZ+JZDTTnc4Vcg7WU8T4MotHYvVfdlkGcldiUUZk7y
	 T72ntZk0D0JdwpNh1o3lhSTei2gQ6+ugLrgAlelixNq27WNCMX7zvTnIppTsUroT3r
	 R5drZGgZU6CalXFP3KbbWNMrvZ4Z8WWmGFminWzDMkFRm5Am8nLVy/uiPStbsmGm6m
	 ZqJ6J0d0qNSiccbsGwULYVn4RxNMZZZ1BooJ1/0YJPJKLeMCq78LFwwbaxqZ9Asyxh
	 hSK3hNfs417BQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Xen=20Security=20Advisory=20466=20v3=20(CVE-2024-53241)=20-=20Xen=20hypercall=20page=20unsafe=20against=20speculative=20attacks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1734441710814
Message-Id: <96775ba9-19c6-4467-848a-5b4625c70583@vates.tech>
To: xen-devel@lists.xenproject.org
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
In-Reply-To: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.650f076e19e44eb5947ea701a3f246be?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241217:md
Date: Tue, 17 Dec 2024 13:21:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 17/12/2024 =C3=A0 13:18, Xen.org security team a =C3=A9crit :
> Xen guests need to use different processor instructions to make explicit
> calls into the Xen hypervisor depending on guest type and/or CPU
> vendor. In order to hide those differences, the hypervisor can fill a
> hypercall page with the needed instruction sequences, allowing the guest
> operating system to call into the hypercall page instead of having to
> choose the correct instructions.
> 
> The hypercall page contains whole functions, which are written by the
> hypervisor and executed by the guest. With the lack of an interface
> between the guest OS and the hypervisor specifying how a potential
> modification of those functions should look like, the Xen hypervisor has
> no knowledge how any potential mitigation should look like or which
> hardening features should be put into place.
> 

Should we consider adding a interface to know how to the guest is 
supposed to make hypercalls (what hypercall instruction/flavor) ? Such 
as the guest can have its own hypercall implementations but knows which 
one to use.

> This results in potential vulnerabilities if the guest OS is using any
> speculative mitigation that performs a compiler transform on "ret"
> instructions in order to work (e.g. the Linux kernel rethunk or safe-ret
> mitigations).
> 
> Furthermore, the hypercall page has no provision for Control-flow
> Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
> malfunction in such configurations.
> 
> IMPACT
> =3D=3D=3D=3D=3D=3D
> 
> Some mitigations for hardware vulnerabilities the guest OS is relying on =
to
> work might not be fully functional, resulting in e.g. guest user processe=
s
> being able to read data they ought not have access to.
> 
> VULNERABLE SYSTEMS
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Only x86 systems are potentially vulnerable, Arm systems are not vulnerab=
le.
> 
> All guest types (PV, PVH and HVM) are potentially vulnerable.
> 
> Linux guests are known to be vulnerable, guests using other operating
> systems might be vulnerable, too.
> 
> MITIGATION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Running only Linux guest kernels not relying on "ret" assembler instructi=
on
> patching (kernel config option CONFIG_MITIGATION_RETHUNK/CONFIG_RETHUNK
> disabled) will avoid the vulnerability, as long as this option isn't
> required to be safe on the underlying hardware.
> 
> CREDITS
> =3D=3D=3D=3D=3D=3D=3D
> 
> This issue was discovered by Andrew Cooper of XenServer.
> 
> RESOLUTION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Applying the set of attached patches resolves this issue.
> 
> The patch to Xen is simply a documentation update to clarify that an OS a=
uthor
> might not want to use a hypercall page.
> 
> xsa466-linux-*.patch    Linux
> xsa466-xen.patch        xen-unstable
> 
> $ sha256sum xsa466*
> 498fb2538f650d694bbd6b7d2333dcf9a12d0bdfcba65257a7d14c88f5b86801  xsa466-=
linux-01.patch
> 1e0d5f68d1cb4a0ef8914ae6bdeb4e18bae94c6d19659708ad707da784c0aa5c  xsa466-=
linux-02.patch
> b3056b34c1565f901cb4ba11c03a51d4f045b5de7cd16c6e510e0bcee8cc6cd7  xsa466-=
linux-03.patch
> 0215e56739ab5b0d0ec0125f3d1806c3a0a0dcb3f562014f59b5145184a41467  xsa466-=
linux-04.patch
> 314e67060ab4f47883cf2b124d54ce3cd4b0363f0545ad907a7b754a4405aacd  xsa466-=
linux-05.patch
> adbef75416379d96ebb72463872f993e9d8b7d119091480ad1e70fd448481733  xsa466-=
linux-06.patch
> 36874014cee5d5213610a6ffdd0e3e67d0258d28f2587b8470fdd0cef96e5013  xsa466-=
linux-07.patch
> 367f981ef8adc11b99cc6999b784305bcdcd55db0358fd6a2171509bf7f64345  xsa466-=
xen.patch
> $
> 
> DEPLOYMENT DURING EMBARGO
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> 
> Deployment of patches or mitigations is NOT permitted (except where
> all the affected systems and VMs are administered and used only by
> organisations which are members of the Xen Project Security Issues
> Predisclosure List).  Specifically, deployment on public cloud systems
> is NOT permitted.
> 
> This is because the mitigation or patches need to be applied to the guest=
s.
> 
> Deployment is permitted only AFTER the embargo ends.
> 
> (Note: this during-embargo deployment notice is retained in
> post-embargo publicly released Xen Project advisories, even though it
> is then no longer applicable.  This is to enable the community to have
> oversight of the Xen Project Security Team's decisionmaking.)
> 
> For more information about permissible uses of embargoed information,
> consult the Xen Project community's agreed Security Policy:
>    http://www.xenproject.org/security-policy.html


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


