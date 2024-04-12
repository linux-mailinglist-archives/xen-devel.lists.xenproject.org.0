Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C058A321D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 17:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704769.1101340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIg9-0004MA-3K; Fri, 12 Apr 2024 15:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704769.1101340; Fri, 12 Apr 2024 15:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIg8-0004Jf-WC; Fri, 12 Apr 2024 15:19:01 +0000
Received: by outflank-mailman (input) for mailman id 704769;
 Fri, 12 Apr 2024 15:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHrI=LR=bounce.vates.tech=bounce-md_30504962.661950df.v1-4b3b6470d4ae42d982f3773ae2922d63@srs-se1.protection.inumbo.net>)
 id 1rvIg7-0004JZ-1x
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 15:18:59 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faedc99a-f8df-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 17:18:57 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VGKwJ0GtnzDRHxRY
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 15:18:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4b3b6470d4ae42d982f3773ae2922d63; Fri, 12 Apr 2024 15:18:55 +0000
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
X-Inumbo-ID: faedc99a-f8df-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712935136; x=1713195636;
	bh=K08HFUcBhXN8aSqW6xd9xivhzm9bYCg0sX7MBc+VEsA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CcESwrk8hVdi4iBJ5d3zcdUVZ+/pBTdNkErAyMWqWFqqAPPuU10fevtiEntR5ow3V
	 K2diCBJ5etYiI4ekdJIYJzyxfuDprKcAns+mU22Nh5L86Sw6PBacRafzpqIGEzHd3U
	 jwC9Baad8C+0dUd0gy8Iy4o3KbCuIVbZpNHZAvxZIFvM6CGkhGXLMU23Z13c139TrE
	 VTJDxpa7Ytu0o2uqG5eaI0USmdVXusJF4jCHHUI4F1aD3yWkCsaO2w2bBULZ2Oy70L
	 KY5E535JzUeVS2Pn59HlZTZcynxRUjifNp64Qput8JDn/Nt52cogkC0Q4Mmd+b8y1a
	 iu+7PRAwBul6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712935136; x=1713195636; i=vaishali.thakkar@vates.tech;
	bh=K08HFUcBhXN8aSqW6xd9xivhzm9bYCg0sX7MBc+VEsA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IZbLCtlOdIC551Lb1P5ABlqq+5lo3hiC9ZDoqGTirRtPqTBXR5G28W/sajxmLQLl8
	 R2egHLdSxjz5eTX+prSo+S77XpbCcK1IWdy8BfyP66hBy60mlPI/vlvxcKTIZiDjSg
	 stGgUYGmrD9WLl0p9t9/6yltBuyKIQghshrhFLdA7z2R/Mnqg4P1hH3qWB5RrP2fjQ
	 LesahlQ+YwGfkYaO/YpV8QDO9DdMchWkiSym8tibWqArfknlhU0DPRG2tF3R5u/Vr5
	 GSAmzNDFAZVsKkZlMxqtq7JN+gl18U4Iu4P0Yd8eXSJguiUPNGoe0rCDtUUPJe8s35
	 RjeXvnd0HVFkA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=201/2]=20Implemented=20AMD=20SEV=20discovery=20and=20enabling.?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712935134854
Message-Id: <33072ee1-667f-4c05-a110-bc5d8395bc39@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Andrei Semenov <andrei.semenov@vates.fr>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1712759753.git.andrei.semenov@vates.fr> <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr> <a9638611-8348-462a-a25d-a9efe3fabf9a@citrix.com> <ede83752-6151-4c23-a8c0-883aa7bee129@vates.fr> <51d5395e-7341-438f-8472-3391531c5bb0@vates.tech> <97cb014b-de7d-4368-a685-fe3fd95acbdc@citrix.com>
In-Reply-To: <97cb014b-de7d-4368-a685-fe3fd95acbdc@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4b3b6470d4ae42d982f3773ae2922d63?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240412:md
Date: Fri, 12 Apr 2024 15:18:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/12/24 5:07 PM, Andrew Cooper wrote:
> On 12/04/2024 3:38 pm, Vaishali Thakkar wrote:
>> On 4/12/24 4:06 PM, Andrei Semenov wrote:
>>> On 4/11/24 20:32, Andrew Cooper wrote:
>>>> On 10/04/2024 4:36 pm, Andrei Semenov wrote:
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (!(cpu_has_sme || cpu_has_sev))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (!smp_processor_id()) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cpu_has_sev)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
rintk(XENLOG_INFO "SEV: ASID range [0x%x - 0x%x]\n",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m=
in_sev_asid, max_sev_asid);
>>>> Why do we have a min as well as a max?=C2=A0 Isn't min always 1?
>>
>> In the case of SEV, it's not true. Some BIOS allow to set the
>> min_asid. So yeah Xen will also need to adapted for the same.
>> I've a WIP patch for allowing dynamic generation of asid in such
>> a case.
> 
> I also got an answer to this out of a contact of mine at AMD.
> 
> The ASID space is divided, 1->$N for SEV-ES/SNP guest, and $N->$M for
> SEV guests.
> 
> It is a security issue to start a guest as ES/SNP, then "migrate" it to
> being SEV-only, so the different types are tracked explicitly.

Aha, yeah that seems like a better explanation. Thanks for checking with
the AMD person.

> ~Andrew


