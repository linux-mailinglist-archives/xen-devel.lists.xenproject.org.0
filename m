Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB0FB172BE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 16:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065679.1431029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTrg-0006Yd-M9; Thu, 31 Jul 2025 14:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065679.1431029; Thu, 31 Jul 2025 14:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTrg-0006WL-JM; Thu, 31 Jul 2025 14:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1065679;
 Thu, 31 Jul 2025 14:02:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojLh=2M=bounce.vates.tech=bounce-md_30504962.688b7776.v1-50b7b791e4af45a6936ddc3510b0135e@srs-se1.protection.inumbo.net>)
 id 1uhTre-0006WF-VG
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 14:02:35 +0000
Received: from mail177-1.suw61.mandrillapp.com
 (mail177-1.suw61.mandrillapp.com [198.2.177.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000b0b98-6e17-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 16:02:32 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-1.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4bt9kt5P3pzBsV2gH
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 14:02:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 50b7b791e4af45a6936ddc3510b0135e; Thu, 31 Jul 2025 14:02:30 +0000
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
X-Inumbo-ID: 000b0b98-6e17-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753970550; x=1754240550;
	bh=bLOMILBek0v/9uzVRvLGkqqqM6Fazf9T37SLb2Cn15Y=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Rp9azMQ/4WYd8ePvBD0BZRLg1nSVTCJmgy0dJCWFZEMlHzza4LCVMYN26AsuI7D0J
	 jesDaL4srCu2Y/41Sa28LS/ZxmWBAJYmzSjDmLvxTcHyUTE4KHCvpWWTN7uoClqZn1
	 LAoWu/17O0hVQlIf+AU0nQviYZ8ven3EcZ/WeButmBAaDSoiygWdK0x2JKJv2uLHMM
	 O1OHAR3sv1TzBHzmcFf046t+yQQWh8YoVXYPBq2tIS2QWKb99GkL/Qa+WI3zTGcLrz
	 OzUQF2XeOg09DSzWKFJ9gitRP04pXFyXXRObAHp2Iacy8GbH3+GNcM1WCD2TcFlr/k
	 0zIJ49r36r4CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753970550; x=1754231050; i=teddy.astie@vates.tech;
	bh=bLOMILBek0v/9uzVRvLGkqqqM6Fazf9T37SLb2Cn15Y=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=th3K+RR0h76mz3dWK8dAmIMBD4TvO1q8i9gBGGNMFLMmpPNQ/38piRZtRql4/J3oX
	 QD5Yx5CUfgpQkCaJGin1RuQmV0khaCXfxqyYiYv9PQHWBgoEi3crhhTAqkCC2qBJ2z
	 Ih7khjBF6esurx86KtbzGHs52gIcLvykemP3q8MtEkodsUT5MzRcjjNVdw3jbA2eSF
	 mEGbvgH3RHKaEemO6xgS+9Ht4OU5uDoF5IzrOhEimVWNb20+hVaYcuKSW/LAPep4ul
	 /KYcZrRbHt1BsbjrXbSMlMh2sSm6QMmHCTHOfSczWrvqhGu11NJV2QPUeaYn/2uInf
	 TJweDc3R9crPw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN][PATCH=202/7]=20xen/domctl:=20introduce=20XEN=5FDOMCTL=5FCDF=5Fis=5F32bits?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753970548364
Message-Id: <3288f8dc-55a2-4c58-b77c-3e24ffe0c657@vates.tech>
To: "Grygorii Strashko" <grygorii_strashko@epam.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20250731094234.996684-1-grygorii_strashko@epam.com> <20250731094234.996684-3-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-3-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.50b7b791e4af45a6936ddc3510b0135e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250731:md
Date: Thu, 31 Jul 2025 14:02:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 31/07/2025 =C3=A0 11:44, Grygorii Strashko a =C3=A9crit=C2=A0:
> Hence, this patch introduces extra "XEN_DOMCTL_CDF_is_32bits" flag which =
is
> intended to be used by 64bit Arches for proper configuration of domain ty=
pe
> when domain is created.
> 
> Now it adds initial support for this flag for Arm64 arch only. The defaul=
t
> Arm64 domain type is changed to 64bit:
> - the Arm Xen boot code is handling this case properly already;
> - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
> updated to forcibly configure domain type regardless of current domain ty=
pe
> configuration. Hence toolstack configures vcpus and memory after
> configuring domain type it allows to start with domain default AArch64 ty=
pe
> and then switch to requested domain type and ensures all required domain
> settings applied.
> 
> For Arm32 this flag is ignored.
> 
> Note. For Arm64, Once toolstack is updated to probe guest binary before
> creating domain the XEN_DOMCTL_set_address_size will become obsolete.
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01647.html
> [2] https://lists.xen.org/archives/html/xen-devel/2025-07/msg01648.html
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---

I would prefer it be better presented as a platform-specific enum. 
Something like

```
enum xen_arch_subarch {
   XEN_ARM_SUBARCH_NATIVE =3D 0,
   XEN_ARM_SUBARCH_ARMV7 =3D 1,
   XEN_ARM_SUBARCH_AARCH64 =3D 2,
   // ...
}
```

As there could be cases of limited backward compatibility, or multiple 
diverging subarchs variants.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



