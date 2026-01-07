Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC620CFF3EA
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 18:58:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197094.1514750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXnN-0002TE-LK; Wed, 07 Jan 2026 17:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197094.1514750; Wed, 07 Jan 2026 17:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdXnN-0002Qx-Gr; Wed, 07 Jan 2026 17:58:09 +0000
Received: by outflank-mailman (input) for mailman id 1197094;
 Wed, 07 Jan 2026 17:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO3T=7M=bounce.vates.tech=bounce-md_30504962.695e9eac.v1-d6733da72a414c6aa7f71906780df762@srs-se1.protection.inumbo.net>)
 id 1vdXnM-0002Qr-VN
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 17:58:09 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac21179-ebf2-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 18:58:06 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4dmbNr1q5qzlfkp6
 for <xen-devel@lists.xenproject.org>; Wed,  7 Jan 2026 17:58:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d6733da72a414c6aa7f71906780df762; Wed, 07 Jan 2026 17:58:04 +0000
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
X-Inumbo-ID: 6ac21179-ebf2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767808684; x=1768078684;
	bh=4w9uqCFwveWg3bIxapTLy2bd4m7YU3VR9BNCoCXsIFM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EYFZuk8MrmFIbOGOO4PqWgkIuGualypc4q87h6dniRtmv2xjx3oYLXGgSh7Cpv4n/
	 lPnC4h0/EoWiq0FwqZw6XtllF0RS5emI/utdrw95tIu/jk8jzTvsQre8PicaEf/ZRd
	 SD61L+e7xL3i+4imQvbZT9BOfSnYhnGmMwLLnOyKjt7KmBBwrtadbe8NkO62Z2H/WA
	 YHIZu2fCxYR7mJSvRLuO5ITgiJhkFSXJWFVraq9SW+5+DTdtQuYqYS+/fc5m15sTJJ
	 zZuQIg7dnpL5yMHgRXKxv3sgBpwHmqtlM0a/AQ2Sdn/I9WE4ydGr2IToHBTGr6eWp4
	 lFaScZL7xvX2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767808684; x=1768069184; i=teddy.astie@vates.tech;
	bh=4w9uqCFwveWg3bIxapTLy2bd4m7YU3VR9BNCoCXsIFM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=g8g10w3Hf2KEyWHAeu7OveByzzIpmHGPR7HZjQ2tMZsyUR6yvfujz3sFu038ojF3L
	 jwjN7Cr9+/NpJNt0cL6IRWkLOXC9UIwHZJxmZKxwXBZ7PxTbeRHt7DHT51WMzPlLx+
	 Hq411TXSAmbDs/9NwmuR3jV9nO4FDYYrb5iTJSgx/JVEx7Tw1+PduhIlLJEtHfGb64
	 8QuLS1uyKqFAGeDEzGcHHPBBEirbRLNMZPAcbpptXMBZVpJcthKIQzgCEZmglFfGq7
	 D8kwJPyPAr7Oj6y18NzY8ultEYfoJeSc6gqAbW/+dg2LRr0ARCZjY+ZRTTkPArDOZz
	 VbSkHgCuKSDmg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=200/2]=20x86/pci:=20MMCFG=20improvements=20and=20always=20use=20it=20if=20available?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767808683144
Message-Id: <104d15d0-9f58-403b-ac61-dc02f4a2e097@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <cover.1767804090.git.teddy.astie@vates.tech> <aV6WPQlni-gkRCVo@Mac.lan>
In-Reply-To: <aV6WPQlni-gkRCVo@Mac.lan>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d6733da72a414c6aa7f71906780df762?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260107:md
Date: Wed, 07 Jan 2026 17:58:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 07/01/2026 =C3=A0 18:25, Roger Pau Monn=C3=A9 a =C3=A9crit=C2=A0:
> On Wed, Jan 07, 2026 at 04:54:55PM +0000, Teddy Astie wrote:
>> Currently, Xen uses legacy method to access the configuration space unle=
ss the
>> access cannot be made with it, where Xen fallbacks to MMCFG. This is not=
 really
>> great, as MMCFG is more flexible and doesn't require a dedicated lock, s=
o it would
>> be preferable to use it whenever possible.
>>
>> Teddy Astie (2):
>>    x86/pci: Improve pci_mmcfg_{read,write} error handling
>>    x86/pci: Prefer using mmcfg for accessing configuration space
> 
> AFAICT Linux is using the same approach as Xen to perform PCI
> accesses.  Registers below 256 on segment 0 are accessed using the
> legacy method (IO ports), while the extended space is accessed using
> MMCFG.  Do you know the reason for this?  I fear there might be
> legacy devices/bridges (or root complexes?) where MMCFG is not
> working as expected?
> 

There is apparently a errata on some K8 chipset according to FreeBSD 
code that uses MMCFG whenever possible.

https://github.com/freebsd/freebsd-src/blob/main/sys/amd64/pci/pci_cfgreg.c=
#L261-L277

> I think we need to understand why Xen (and Linux) do it this way so it
> can be properly justified why it's safe to switch to a different
> approach.
> 
> Thanks, Roger.
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



