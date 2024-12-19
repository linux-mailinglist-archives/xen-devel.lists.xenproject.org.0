Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF479F7BF3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 14:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861241.1273206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOGCO-00044B-MG; Thu, 19 Dec 2024 13:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861241.1273206; Thu, 19 Dec 2024 13:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOGCO-000411-JI; Thu, 19 Dec 2024 13:04:16 +0000
Received: by outflank-mailman (input) for mailman id 861241;
 Thu, 19 Dec 2024 13:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muAN=TM=bounce.vates.tech=bounce-md_30504962.676419ca.v1-fb5187bdd4024b7cb86f6582bd936f4a@srs-se1.protection.inumbo.net>)
 id 1tOGCM-00040v-P1
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 13:04:14 +0000
Received: from mail132-21.atl131.mandrillapp.com
 (mail132-21.atl131.mandrillapp.com [198.2.132.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd8d9f71-be09-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 14:04:12 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4YDW2y4fstz1XLFNg
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 13:04:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fb5187bdd4024b7cb86f6582bd936f4a; Thu, 19 Dec 2024 13:04:10 +0000
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
X-Inumbo-ID: bd8d9f71-be09-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1734613450; x=1734873950;
	bh=nVJ8VvNsU8HHIJgIwu49gG2Hx+R/KL9Zo6XJNXdqpS0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PSj5NwCmHCeIMlml+QT4FesIB84RdbJodbT4RgPjlT87Y8KX1yTNOODz0E9b0H9l0
	 /RJFv/8z03xEuQB4G4B7tcoQK8uv2L7uM2EDwSVhgzzir4IKbIo88o1YuBEHh6A6+N
	 jW+ABVLZaKzZxSqRM1PwGp3hR7xvlRKBUwovM8USJBqpNg0Pw8zUhqyAhAQkLdWh10
	 YL94+4OT26mYGk4L76YDNeCKlwdFH0e0Bp751OR1gRIjMKJPvCdYnPKmdrc4hGZYN7
	 U9iiJNvaMsSsSzefLmib8z0aA8SZGzlXL5CQ8W+24VUypbw1NB2ZA5U0y4mGIjMR3D
	 xV/05OWMj1YcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1734613450; x=1734873950; i=teddy.astie@vates.tech;
	bh=nVJ8VvNsU8HHIJgIwu49gG2Hx+R/KL9Zo6XJNXdqpS0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=d8VAzqIgJqykjWpKq+u1FC4XfNiz1IBkF6sUWRF/Mcg5ZpZw+EV6898Bo6C2oYMap
	 WUM1nAVPI0WzKNb2EJT8Us9831msR3ljYbECAeN8JJqgXgaBzx+hkC2/BNKTZBlvwp
	 TfxE8GECHzW5jTI9ax2Ns+kecgRDPogrwtQgclqt6FCvxDVin3/cXLWBaJQY7rcVWW
	 VEiyj/Y+JU4+EAJK9n0S6F3D7M1/WQmTq+ZXg5oOw8j2m8p2V5SdLIk4p0sEAcgdvG
	 dBqadk9rljiIR65BJrmYBsKRylz0Cy/0RajwM6LYRrQp5vKZBnLbuNtI33E2XphthC
	 FTN3UG+BTk5cw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20x86/hvm:=20Use=20constants=20for=20x86=20modes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1734613447781
Message-Id: <2b9c9b05-a582-4e70-8246-fde4b37bc669@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <JBeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech> <20241218170820.364253-1-andrew.cooper3@citrix.com> <2d6ce1c9-dac4-4b00-9157-07ab6987232f@vates.tech> <c0d6b3ad-b8b6-4346-b7ee-aef520a7ea27@citrix.com>
In-Reply-To: <c0d6b3ad-b8b6-4346-b7ee-aef520a7ea27@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fb5187bdd4024b7cb86f6582bd936f4a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241219:md
Date: Thu, 19 Dec 2024 13:04:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 19/12/2024 =C3=A0 12:35, Andrew Cooper a =C3=A9crit=C2=A0:
> On 19/12/2024 10:46 am, Teddy Astie wrote:
>> Hello,
>>
>> Le 18/12/2024 =C3=A0 18:08, Andrew Cooper a =C3=A9crit=C2=A0:
>>> From: Teddy Astie <teddy.astie@vates.tech>
>>>
>>> In many places of x86 HVM code, constants integer are used to indicate =
in what mode is
>>> running the CPU (real, vm86, 16-bits, 32-bits, 64-bits). However, these=
 constants are
>>> are written directly as integer which hides the actual meaning of these=
 modes.
>>>
>>> This patch introduces X86_MODE_* macros and replace those occurences wi=
th it.
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Teddy Astie <teddy.astie@vates.tech>
> 
> Thanks, but as you're not a maintainer of this code, Ack doesn't carry
> any weight.=C2=A0 Reviewed-by OTOH would, if you're happy with that adjus=
tment?
> 
> ~Andrew

Yes, I meant Reviewed-by in my Acked-by.

So,

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


