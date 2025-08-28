Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79506B3983A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097966.1452135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYv3-0001Mt-4R; Thu, 28 Aug 2025 09:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097966.1452135; Thu, 28 Aug 2025 09:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYv3-0001LG-1l; Thu, 28 Aug 2025 09:27:45 +0000
Received: by outflank-mailman (input) for mailman id 1097966;
 Thu, 28 Aug 2025 09:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzch=3I=bounce.vates.tech=bounce-md_30504962.68b0210a.v1-947482cc2ddd4de2adb74fda615c2dfb@srs-se1.protection.inumbo.net>)
 id 1urYv1-0001LA-4N
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:27:43 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3db32db5-83f1-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 11:27:40 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4cCGJp4hxQzBsTy7V
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 09:27:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 947482cc2ddd4de2adb74fda615c2dfb; Thu, 28 Aug 2025 09:27:38 +0000
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
X-Inumbo-ID: 3db32db5-83f1-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756373258; x=1756643258;
	bh=I8D5/yrOObDbnAapnurzQSp9tBHvRWSwFBG3zm8syfw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MYE0Z6WgAg2+MOEl1M2DJFvq+EL3MGXh9K4v05z7HWmNv6kdrPhPdVg/0NdItPIu2
	 G4LTq7eYpjMStcL6zh2KwacJu2oa+yanW8s+hb1LMUTo+afyFJnIIq/0QmkDyj9KC6
	 Lgj4zg4tzdbOrTeOjeSVKYUVs2OtOnVTGsJW2LbjER7i3JAdRUHLKiHVmIwz+xJHza
	 KBRzUVAO3UJGDzyd8fdASNOrJUXquqOtMq9xhBkAPPRxkjRwB9HjAkm8Wn/T6mRxwP
	 HdniRJVYhOd9qAtZQC2BbYagxv9NtE4oMi2WDxBgTRI2LgFrPjyvLH6IOHjQw2xJV1
	 fM6B4fIfRaqPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756373258; x=1756633758; i=teddy.astie@vates.tech;
	bh=I8D5/yrOObDbnAapnurzQSp9tBHvRWSwFBG3zm8syfw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hz5fwKIQjsz/LFVchIETU3VPn3nC1cGrfuJH+ZH+cUP1biOCe5zfkJ+DZ7+GOSahl
	 HJVaOf3u1dUUL6VqIuOUd8jPI3/fb/V81ugPVD+gXazKvGzHVPswg/wnVKj5OCpUUH
	 8fpapZkBZg0usJnPdYhtA6pvt6zgNN4m0Te3E7lDnAFfV2o/YdDir6XBjh3kUmnxSQ
	 y5Ta0l9qrp764WQA+qWKYgzHXeiPjTnYZ8XXoCJa1lU1MVBb9MY4XpodNpGpi4d3BA
	 hNeWbZoBs+2pLB6FsuWMoBSJGGY+OmRzoJDJ572VX58r62GuQFmdcML+CgMu+ktcsf
	 aq+APBWn3Blkg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20hvmloader:=20Update=20to=20SMBIOS=202.6?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756373257509
Message-Id: <64f08648-4ef2-457f-a81f-0c003e3e9601@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech> <0e47cfed-75e6-4cd3-8ee2-ed8ea000a376@suse.com>
In-Reply-To: <0e47cfed-75e6-4cd3-8ee2-ed8ea000a376@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.947482cc2ddd4de2adb74fda615c2dfb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250828:md
Date: Thu, 28 Aug 2025 09:27:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/08/2025 =C3=A0 09:08, Jan Beulich a =C3=A9crit=C2=A0:
> On 22.08.2025 15:47, Teddy Astie wrote:
>> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
>> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
>>
>> In Linux, if the SMBIOS version is >=3D 2.6, the GUID format is used, el=
se
>> (undefined as per SMBIOS spec), big endian is used (used by Xen). Theref=
ore,
>> you have a endian mismatch causing the UUIDs to mismatch in the guest.
>>
>> $ cat /sys/hypervisor/uuid
>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>> $ cat /sys/devices/virtual/dmi/id/product_uuid
>> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
>> $ cat /sys/devices/virtual/dmi/id/product_serial
>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>
>> This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
>> written in the table; which effectively fix this endianness mismatch wit=
h
>> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.
> 
> To update to 2.6, fields new in 2.6 (compared to 2.4) need adding to the
> various structures. First example I ran into is type 4, gaining 5 new
> fields in 2.5.
> 

Yes, I add them in a new version along with 2.6 entries for the newly 
introduced SMBIOS tables (notably type 9).

> Jan
> 

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



