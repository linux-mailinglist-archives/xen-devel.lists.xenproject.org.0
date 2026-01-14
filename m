Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568ABD21C80
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 00:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203923.1518842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgAVK-0006uI-6A; Wed, 14 Jan 2026 23:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203923.1518842; Wed, 14 Jan 2026 23:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgAVK-0006s3-2t; Wed, 14 Jan 2026 23:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1203923;
 Wed, 14 Jan 2026 23:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpCS=7T=proton.me=milky_way_303030@srs-se1.protection.inumbo.net>)
 id 1vgAVH-0006rx-C3
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 23:42:20 +0000
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a84ee0bc-f1a2-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 00:42:16 +0100 (CET)
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
X-Inumbo-ID: a84ee0bc-f1a2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1768434134; x=1768693334;
	bh=cLPq9bZJS+JUThg6WIQjstfs+bSetaFzbcl08dElefg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IW5D+PCxYLVdiP86Pz7uUv46fIUYUsVUqddvsNRjkTePcd3QiDeEE1MHxJ4RdiTCZ
	 XG93lj/bi1o4lTX+v90qUGcZD7aC1KLHaRylMUIFVBKwMCsV95NVK0LlqyMiptI9dF
	 zpOkCDie1Xk3LYQxL0qoNiXu7et1nDXXajDeYDW5unF9KS+6lIBYDpanPIKIjRavrz
	 BC/YlAFLzs8x0yTMn2ZLgZ4DaxTyqRNHhbse7aijcRxM+j65twWq0efdJcGEEL0nin
	 rYiX94NM3l0Ftg9oVpEdJWmhkuU+vmnC8h2Hr4G6NCMXsytLIc8+S92Pf4Xb7Oo5+T
	 ul1Lix59UDGHA==
Date: Wed, 14 Jan 2026 23:42:12 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: Cpufreq drivers not working on T480S
Message-ID: <f7_mi42KcNcLkQfNwAwz-wjxWoXv_gbqEKrmEeFp43XDrFgoWBrSAP2doOzxvIUUM21AAXV3duZB_gZT03x5S8iT6WmU6A24H32vOu40iIc=@proton.me>
In-Reply-To: <c713530f-5f54-44e0-9f45-8df8329c7aef@suse.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me> <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com> <unRhWiUKUGc3G4yBmJJ2Pc0JOSbM4HC0b-fTBaf1f0RYJEi_aIHV3-il1EafrSE9c77-tZNUV386xdg3UANDdeonG_zecEVq7HrG2COheJ8=@proton.me> <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com> <qo8wx-b_cpRuzol0X0mW_NHY1mu3tOBCzMvy5Y_8IASOkmy1oxPdJWdbrndDL63d5lMbw1FDMkI9gCSH9BS2UFWiuyjhycfqWpJWueeHq2E=@proton.me> <8a2125c7-c5ec-4be1-a7a5-61b2936cc90f@suse.com> <rhr8suTtSGv9hTwateK8Tx8Cm9xetzvaOsOIzexIaY-VaPyxsgzA3K0pYTeyyrKFtkc5gHJ3SrJ0I5VKjGsxBKdQm-QKPRVF_bugbAHM9uI=@proton.me> <FEKky8EG7uaCBf24_kJ7c8fNFwXgajV7RH98tbwxsty3gGkFcMJuI4plVzNAVqiLYKWFGwCUo6HsOFKD_abqWU9wZtxgTNXPJz8w7vv-PYI=@proton.me> <c713530f-5f54-44e0-9f45-8df8329c7aef@suse.com>
Feedback-ID: 171106842:user:proton
X-Pm-Message-ID: a87867e7ad09838aebac1fcafbc67dc4b8ff44a9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wednesday, January 14th, 2026 at 11:12 AM, Jan Beulich <jbeulich@suse.co=
m> wrote:

>
>
> On 14.01.2026 11:58, Milky wrote:
>
> > Just wanted to update this thread to say that now another T480 user (th=
e T480 is a very similar model to my T480S) using the release builds of lib=
reboot (as of 26.01 RC1) also has the entries missing from the ACPI tables.=
 That discussion was here https://codeberg.org/libreboot/lbmk/issues/394. S=
o this confirms that I'm running a standard libreboot, rather than a bad bu=
ild.
> >
> > Do you think there is any way to avoid the underclocking issue with Xen=
 on such devices/firmware?
>
>
> In principle there is, but in the absence of ACPI data that means holding=
 model-
> specific data in Xen. Which iirc is what the intel-pstate driver in Linux=
 does
> (using ACPI info nowadays only as "auxiliary" data). But I may be wrong t=
here,
> as it has been a long time since I last looked at that driver.
>
> Jan



In that case, would you say this is settled now? Would it make sense to rep=
ort back to the QubesOS community that librebooted T480/S will run underclo=
cked, due to the missing data in ACPI tables and lack of native support in =
Xen? This information is important, as the device is only barely usable.


