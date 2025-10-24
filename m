Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8CC065C7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 14:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150293.1481492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCHJ9-000892-4u; Fri, 24 Oct 2025 12:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150293.1481492; Fri, 24 Oct 2025 12:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCHJ9-00086Z-2M; Fri, 24 Oct 2025 12:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1150293;
 Fri, 24 Oct 2025 12:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JByM=5B=bounce.vates.tech=bounce-md_30504962.68fb76f1.v1-e0b9cda4ec3245deac49e5747e2b1fa7@srs-se1.protection.inumbo.net>)
 id 1vCHJ6-00086P-Pm
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 12:54:12 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 889947ae-b0d8-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 14:54:10 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4ctNBn3LP8zBsVdN8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Oct 2025 12:54:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e0b9cda4ec3245deac49e5747e2b1fa7; Fri, 24 Oct 2025 12:54:09 +0000
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
X-Inumbo-ID: 889947ae-b0d8-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761310449; x=1761580449;
	bh=q2RFmwZnM4aWV0w3Iiv1+6cCmev1FJjAH10GRNtWo0k=;
	h=From:Subject:Message-Id:References:To:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MSlay0iWTxYyMb4318x+sjuJlAN4NBJu16J0J54vPWyVj/tDrpFy3ymCjHU+oyQiB
	 Dc1rTpHDrm/jxWME4RiWlWUR2RbDKvsCsV0oZYlJ5k5pWcOQL5GMAQxix6ZDUixbar
	 fPsOUb6jOJyzc/2/YKUlzfkgQ44ODh3pgcwy012a9hET40/buribsbLRXGwRgArwHw
	 GO3vCkerRyv1GZuz+3+QEXpPnSF/etwb6M+4J15dfz+89knLgn19AD+J0Uwr1U15eX
	 238a6cXAqxUJER9duQ6PwM356kybLGOBKpS+DvuyAk/VGjI+3kMcL2tcfU35GKgKQM
	 wertyTRMd5I/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761310449; x=1761570949; i=teddy.astie@vates.tech;
	bh=q2RFmwZnM4aWV0w3Iiv1+6cCmev1FJjAH10GRNtWo0k=;
	h=From:Subject:Message-Id:References:To:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Uwz296j00pmu6rElR7wCys9DorzZ5W94JNhe9VeC1ZBnoH0t8DE42DU5LuOYRwA+A
	 +fpmZDH36tLv2XWqN6MC7w4ab7UlQwyMlgR7bqX9rUv6niGuQ0ggQE2Izjxrp3XN4c
	 sGFTZ9uNmHaZj0HMKGwrLiMFfk4d+SxTeqblDtqx/cy+7o6oJUkc1ySc8ZjePtZKhg
	 PEA2Ckx+i820o6GpN4+Z3K2IGYfgyc78scnLdRyVkrx+jk5xFvo5WvmR9FAVOzkJNl
	 vXd7Uxh8Ls3FvhhAQSmR0Vp4zqdIwxec9TQdOqq3Sdb6bXXgFYn9GAAHehT73dTwAV
	 2QqUeevakbclQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Xen=20Security=20Advisory=20476=20v1=20(CVE-2025-58149)=20-=20Incorrect=20removal=20of=20permissions=20on=20PCI=20device=20unplug?=
X-Forwarded-Message-Id: <83f26924-64cf-4825-9a9c-8e212452ff47@vates.tech>
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761310448800
Message-Id: <df6ca4cb-a764-48e6-b78f-3122ac587048@vates.tech>
References: <83f26924-64cf-4825-9a9c-8e212452ff47@vates.tech>
To: Xen-devel <xen-devel@lists.xenproject.org>
In-Reply-To: <83f26924-64cf-4825-9a9c-8e212452ff47@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e0b9cda4ec3245deac49e5747e2b1fa7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251024:md
Date: Fri, 24 Oct 2025 12:54:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 24/10/2025 =C3=A0 14:14, Xen.org security team a =C3=A9crit :
>              Xen Security Advisory CVE-2025-58149 / XSA-476
> 
>           Incorrect removal of permissions on PCI device unplug
> 
> ISSUE DESCRIPTION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> When passing through PCI devices, the detach logic in libxl won't remove
> access permissions to any 64bit memory BARs the device might have.  As a
> result a domain can still have access any 64bit memory BAR when such
> device is no longer assigned to the domain.
> 

It it exclusive to devices where bar is above 32-bits (which requires 
things like Above 4G Decoding / Resizable BAR) or all devices are affected =
?

> For PV domains the permission leak allows the domain itself to map the me=
mory
> in the page-tables.  For HVM it would require a compromised device model =
or
> stubdomain to map the leaked memory into the HVM domain p2m.
> 

Do HVM guests actually needs the device model to perform this ?

> IMPACT
> =3D=3D=3D=3D=3D=3D
> 
> A buggy or malicious PV guest can access memory of PCI devices no longer
> assigned to it.
> 
> VULNERABLE SYSTEMS
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Xen versions 4.0 and newer are vulnerable.
> 
> Only PV guests with PCI passthrough devices can leverage the vulnerabilit=
y.
> 
> Only domains whose PCI devices are managed by the libxl library are affec=
ted.
> This includes the xl toolstack and xapi, which uses the xl toolstack when
> dealing with PCI devices.
> 

XAPI doesn't appears to have PCI hotplug facilities, so shouldn't be 
able to trigger this vulnerability. Unless I missed something.

> HVM guests are also affected, but accessing the leaked memory requires an
> additional compromised component on the system.
> 
> MITIGATION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 
> Not doing hot unplug of PCI devices will avoid the vulnerability.
> 
> Passing through PCI devices to HVM domains only will also limit the impac=
t, as
> an attacker would require another compromised component to exploit it.
> 
> CREDITS
> =3D=3D=3D=3D=3D=3D=3D
> 
> This issue was discovered by Jiqian Chen of AMD and diagnosed as a
> security issue by Roger Pau Monn=C3=A9 of XenServer.
> 
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
> xsa476.patch           xen-unstable
> xsa476-4.20.patch      Xen 4.20.x - Xen 4.18.x
> xsa476-4.17.patch      Xen 4.17.x
> 
> $ sha256sum xsa476*
> ee4c2fa73d38c5c699006b6317ba53f20343af0593ff9a8c38e7e59b69a0beca  xsa476.=
patch
> 3b921545f023dc7d9d943d0d661e677711458a917630de14f0871b03db0f2148  xsa476-=
4.17.patch
> 5babfaa3680de9950d3391a78e4956b5c18d54eaac9938c6cde2433a2ad3f27d  xsa476-=
4.20.patch
> $
> 
> NOTE REGARDING LACK OF EMBARGO
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> 
> This issue was discussed in public already.


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



