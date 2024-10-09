Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240669969FE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 14:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814444.1228006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syVo1-0004Mr-UD; Wed, 09 Oct 2024 12:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814444.1228006; Wed, 09 Oct 2024 12:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syVo1-0004Jl-Rh; Wed, 09 Oct 2024 12:28:41 +0000
Received: by outflank-mailman (input) for mailman id 814444;
 Wed, 09 Oct 2024 12:28:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjKG=RF=bounce.vates.tech=bounce-md_30504962.670676f4.v1-ae3cd4ec4963448a8aeedbe6be5b8416@srs-se1.protection.inumbo.net>)
 id 1syVo0-0004JX-HZ
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 12:28:40 +0000
Received: from mail136-19.atl41.mandrillapp.com
 (mail136-19.atl41.mandrillapp.com [198.2.136.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0221d004-863a-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 14:28:38 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-19.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XNsch3kkWzRKLrmh
 for <xen-devel@lists.xenproject.org>; Wed,  9 Oct 2024 12:28:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ae3cd4ec4963448a8aeedbe6be5b8416; Wed, 09 Oct 2024 12:28:36 +0000
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
X-Inumbo-ID: 0221d004-863a-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728476916; x=1728737416;
	bh=+Fp0i7llVEruvS/tILDWdGCxj1Am3SdqBXzCWapIZ6U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xt21RAESFP3ovQo+U6IbtytRV6ZYg+FpTR7Lh71PFIM5OHJJ3PbfLDM0ovmSIqMZV
	 2ryTUoV4ifVmwjowDfKSUZ8fn4nWj6BZeuBKz5u8SQ/aSiSbk6x0Rx2Z67BNbWHVr4
	 vQ0hCWdwbcP0/ZBAxZhdnR1/LFUSFkXMjiHkDHkOehNxOXYTkM5jLgL53AITgfT/hU
	 maViRHuuIiLrEFqD3ZdZUcazIO/MW8X+kHgi+SCnslcN16TtuKm8JQnYjd/xA0QgmK
	 lgS+7MqHsXo90oK6yGxvpwMYY5OoOwveqyXXW4npPvXSMgqWdeIrXg5zuW1iTK237x
	 8QBVkp38oH4KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728476916; x=1728737416; i=teddy.astie@vates.tech;
	bh=+Fp0i7llVEruvS/tILDWdGCxj1Am3SdqBXzCWapIZ6U=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HrYhw/rm1FaaP+p7vo9IJzQHsq1usapow04nl20wSqN7j/llm5HQhi0x3GGbBlnyR
	 Emtu/PTpfOpnAdZx2O8G74p0eg/N4ktkaACsXX+oXEiucT/GZxwUPO7EYk35xt6Hm2
	 o0P3MJ55y9wLPYILcN9Oh0msZ7I/xZfhudUtET+IYOdSfw1riSrl/qlylZ4nLW2c5C
	 1felks50sTBgGq6rLivCVbiVFZbPuwvFO7ywY3UQBt73bZABOUJQ7ZhhhZSbQqQstH
	 jAn4RgJTQYuGuH9TMe9iwCZz4KH6iIviu8JONkpziNBQtcSqn1aXXFhEgVhhbcNt+w
	 ftBgq24Rlbm6Q==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20iommu/amd-vi:=20do=20not=20error=20if=20device=20referenced=20in=20IVMD=20is=20not=20behind=20any=20IOMMU?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728476914452
Message-Id: <33525b82-04bf-4d66-b917-8c2c71ff4ef2@vates.tech>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga <xenproject@ymy.be>, xen-devel@lists.xenproject.org
References: <20241008104706.74001-1-roger.pau@citrix.com> <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com> <ZwY4ym2Gnlx4tytP@macbook.local> <5a2a4ff4-a2c7-46f6-bd18-a4837fe8d4c1@suse.com> <ZwZlVlU2nHkBedyo@macbook.local> <703fa416-c7d5-4862-a871-5831125c2e25@suse.com> <ZwZtR6ZTl2gUWN2T@macbook.local> <34f73ec6-0e10-41f4-8894-c367264afefc@suse.com>
In-Reply-To: <34f73ec6-0e10-41f4-8894-c367264afefc@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ae3cd4ec4963448a8aeedbe6be5b8416?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241009:md
Date: Wed, 09 Oct 2024 12:28:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 09/10/2024 =C3=A0 14:09, Jan Beulich a =C3=A9crit=C2=A0:
> On 09.10.2024 13:47, Roger Pau Monn=C3=A9 wrote:
>> On Wed, Oct 09, 2024 at 01:28:19PM +0200, Jan Beulich wrote:
>>> On 09.10.2024 13:13, Roger Pau Monn=C3=A9 wrote:
>>>> I also think returning an error when no device in the IVMD range is
>>>> covered by an IOMMU is dubious.  Xen will already print warning
>>>> messages about such firmware inconsistencies, but refusing to boot is
>>>> too strict.
>>>
>>> I disagree. We shouldn't enable DMA remapping in such an event. Whereas
>>
>> I'm not sure I understand why you would go as far as refusing to
>> enable DMA remapping.  How is a IVMD block having references to some
>> devices not assigned to any IOMMU different to all devices referenced
>> not assigned to any IOMMU?  We should deal with both in the same
>> way.
> 
> Precisely because of ...
> 
>> If all devices in the IVMD block are not covered by an IOMMU, the
>> IVMD block is useless.
> 
> ... this. We simply can't judge whether such a useless block really was
> meant to cover something. If it was, we're hosed. Or maybe we screwed up
> and wrongly conclude it's useless.
> 
>>   But there's nothing for Xen to action, due to
>> the devices not having an IOMMU assigned.  IOW: it would be the same
>> as booting natively without parsing the IVRS in the first place.
> 
> Not really, no. Not parsing IVRS means not turning on any IOMMU. We
> then know we can't pass through any devices. We can't assess the
> security of passing through devices (as far as it's under our control)
> if we enable the IOMMU in perhaps a flawed way.
> 
> A formally valid IVMD we can't make sense of is imo no different from
> a formally invalid IVMD, for which we would return ENODEV as well (and
> hence fail to enable the IOMMU). Whereas what you're suggesting is, if
> I take it further, to basically ignore (almost) all errors in table
> parsing, and enable the IOMMU(s) in a best effort manner, no matter
> whether that leads to a functional (let alone secure [to the degree
> possible]) system.
> 
> What I don't really understand is why you want to relax our checking
> beyond what's necessary for the one issue at hand.
> 
>>> the "refusing to boot" is interrupt remapping related iirc, if x2APIC
>>> is already enabled. We need to properly separate the two (and the
>>> discussion there was started quite a long time ago, but it got stuck at
>>> some point); until such time it is simply an undesirable side effect of
>>> the inappropriate implementation that in certain case we fail boot when
>>> we shouldn't.
>>
>> Yes, but that's a different topic, and not something I plan to fix as
>> the scope of this patch :).
> 
> Sure, I'm merely asking to accept that, until that's resolved, issues
> with boot failure can result here, and need to be lived with.
> 
> Jan
> 

Would it be possible to find a middle-ground by adding a "non-security 
supported" xen command-line option to allow a workaround on this issue ?

Something like iommu=3Damd-skip-unknown-ivmd ?

And preventing boot otherwise.

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


