Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688A1BF187F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146356.1478791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApud-0003aZ-CV; Mon, 20 Oct 2025 13:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146356.1478791; Mon, 20 Oct 2025 13:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApud-0003Ye-9B; Mon, 20 Oct 2025 13:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1146356;
 Mon, 20 Oct 2025 13:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Uvc=45=bounce.vates.tech=bounce-md_30504962.68f6389f.v1-3969df7e5a8d4dc99235918e0b0fd196@srs-se1.protection.inumbo.net>)
 id 1vApuc-0003YF-98
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:26:58 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72b48e63-adb8-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 15:26:56 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4cqx6R0skzzDRJ8cB
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 13:26:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3969df7e5a8d4dc99235918e0b0fd196; Mon, 20 Oct 2025 13:26:55 +0000
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
X-Inumbo-ID: 72b48e63-adb8-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1760966815; x=1761236815;
	bh=TQ69rgke9Gtn1nU23PxTlEo99KasN/5F5Gy2vl8dnTc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=u7rZxn4sdiJpHNKmowEkF6GWTOS3dnUrAVwaKiChEkF5TK/JRYhTj1TypW5egSDE+
	 +3JfPAGsNh/LyM9doRmnyYWEBurVHFXdJ2lf/51coakjoS6XCVyCy3jpcrIm/NCq5c
	 MGv2wCk26CNwJOnVSFcYE0C2BQQ1FsP8OO2MC3v+Wx+OgK2dAfCHgp2CMkoUYXRePi
	 gvPPLsSk7+/gxOs+OEw7479x++jerQuVBhE1+rQtNO4zE0QLuIy7Y0tKTMWooNDdYm
	 sM20q3JX7BqyPc98/u3xEDSBFrAX/l+/tJj/S5lmc2ke+f3dETED2p4v0ywXTprTYW
	 W8scBmyup1CUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1760966815; x=1761227315; i=teddy.astie@vates.tech;
	bh=TQ69rgke9Gtn1nU23PxTlEo99KasN/5F5Gy2vl8dnTc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=l5QPv2M6q/ReWWM36vjkM0VX0ixjwrV/W8qrRwiBhnfl0p1uy0VlHaBgUZMQPO1Yb
	 Ww47EMBxzRsMAZuy9LGLzDZXkUcc0yLsTGNnlHKNmxDo7+a1PSFOjf4C2++u0BlEBc
	 L1yfhcWK1lR2p0uS7eYY+SCFTjNb1xxwyzh7OqRdpZ7QHD9GYv+BOoLFt1PkrpzNBu
	 WjbY8VOpuHzfg+yObsldci1QouzQh4NrhcfKaVFHTIfyntfOhED2BkCSGUzAPnrGAt
	 BQbylpWMs+Zvg5IlXuR5k6Ulk8hhQvdU7Z+grFdutswcene+kQncaxQfRI1FvDCNI6
	 yjf31msgb8IwQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=204/9]=20hvm:=20Introduce=20"fixed=20memory=20layout"=20feature?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1760966813599
Message-Id: <c29f65b9-c513-4e91-a083-0773fa502b97@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech> <640223e5e7ee18a73f62152dd27883bf5978fbfe.1755785258.git.teddy.astie@vates.tech> <5ba550db-5e36-4d98-bce7-cbb3e2d874b9@suse.com> <b3c490fc-e1ca-488e-b96c-e059bdbdb466@vates.tech> <0fa33a24-a6a4-40d9-88a8-af48350e1f4f@suse.com>
In-Reply-To: <0fa33a24-a6a4-40d9-88a8-af48350e1f4f@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3969df7e5a8d4dc99235918e0b0fd196?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251020:md
Date: Mon, 20 Oct 2025 13:26:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 01/09/2025 =C3=A0 17:50, Jan Beulich a =C3=A9crit=C2=A0:
> On 29.08.2025 15:32, Teddy Astie wrote:
>> Le 28/08/2025 =C3=A0 14:30, Jan Beulich a =C3=A9crit=C2=A0:
>>> On 21.08.2025 17:25, Teddy Astie wrote:
>>>> --- a/xen/include/public/arch-x86/hvm/start_info.h
>>>> +++ b/xen/include/public/arch-x86/hvm/start_info.h
>>>> @@ -99,6 +99,13 @@
>>>>    #define XEN_HVM_MEMMAP_TYPE_DISABLED  6
>>>>    #define XEN_HVM_MEMMAP_TYPE_PMEM      7
>>>>    
>>>> +/* Xen-specific types (OEM-specific range of the ACPI spec) */
>>>> +#define XEN_HVM_MEMMAP_TYPE_SHARED_INFO   0xF0000001 /* Shared info p=
age */
>>>> +#define XEN_HVM_MEMMAP_TYPE_GRANT_TABLE   0xF0000002 /* Grant table p=
ages */
>>>> +#define XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS 0xF0000003 /* Grant table s=
tatus page (v2) */
>>>> +#define XEN_HVM_MEMMAP_TYPE_FOREIGN_REG   0xF0000004 /* Suitable regi=
on for grant mappings */
>>>> +                                                     /* and foreign m=
appings */
>>>
>>> I question it being legitimate for us to introduce new E820 types.
>>
>> These E820 types are (at least in ACPI specification) in the OEM-defined
>> range which seems appropriate for me to use for Xen-specific mappings.
> 
> Just that we're not an OEM.

How should such information be provided alternatively ?

Currently, premapped pages (xenstore, PV console, ...) locations are 
provided through hvm parameters, but I don't think introducing new hvm 
parameters is very wise.

One way of another, we would need to provide to the guest a xen-specific 
memory map for implementing this.

> 
> Jan
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



