Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB54A71484
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 11:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927490.1330228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNlw-0001TD-M5; Wed, 26 Mar 2025 10:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927490.1330228; Wed, 26 Mar 2025 10:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNlw-0001QQ-JH; Wed, 26 Mar 2025 10:14:08 +0000
Received: by outflank-mailman (input) for mailman id 927490;
 Wed, 26 Mar 2025 10:14:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MSYx=WN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1txNlu-0001QI-AC
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 10:14:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b5107fc-0a2b-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 11:14:04 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 222954EF54C1;
 Wed, 26 Mar 2025 11:14:03 +0100 (CET)
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
X-Inumbo-ID: 0b5107fc-0a2b-11f0-9ffa-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1742984043;
	b=5N40C8DwNP9wRqlVdb000yHKuWh4YVElxxngD9w1HFElNb/BEHWmgJEB3uZaluQt8cYX
	 MKrssO82qkTgDLSFhRKTer2Q15O7JQGOwYxqw5UdgePFY7cBp3tNpf7AVi9GEVUjAMqHM
	 9jKgL98FR/pkqzAKEhLNz+ItP8PPAEf2ejUPmsLE6BhsAXtJ3gixVARPKOqP3Ejip94mR
	 1MUq/WAgAoZJGQq5n3DG4C3DfyWmofocMslrVZ58MFrTg8S4rm4Modjbhd8NN+V8/spTq
	 Dp5jcDZTDlv1lq3pddOGRd2j53/X6vx2Ila/uCgMY2PklT756NCyDuC4pN3wdTJv3Kb+v
	 ik9n8VAujbLLd2OjUw4OuE3JOUDBOfJ3IVjaeSP6IQLyJ6n0pzdYrEGFsBOk6bg3+D8zQ
	 dkJzLq5aKqjPZpBizkmziD7Udy/Dpmxzec+OLTO3Nb8qsmBVB3ajt1i0bwgov9lS06+RE
	 XxgpjXDS/MLT0FdqmwhfxNkjiTDFr459xm7xwvOALskiAcSBvkYNDHiJ9WsP1atGaOZ7y
	 ryQJVMusAIYQlfWpeGPdCSoo5vSHTkGp4TfzVi0QxFFchU9sDmxK7txaC05x9U/JRUdiM
	 wOlYfuRHSL3vqW0VZ3xvZZqFXR/wexYVcR5Du2obuuaU1SzH1dHHOZK/QvL5e8I=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1742984043;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=DdK4HC7iE54y+adqKmx4zHivQDPXky7roNxw5cClheM=;
	b=x+wBI30WQqkYdMfK20wQAMasuYgWA/73ZPu5dSG2uO1E1LJAsh2OXADfv5tJz7if9Edw
	 MwmV5V4Vi25Nblqf+sz9rVF+wnmSMrm+NTaHolWBtA7TWj84Oqtlu2dyCEwq2gzVIHJfc
	 rHblPWnTzJuoykq7RzZRHFdIT/3kEhnomgQn7qXMajB9iZfnD0e9VXOWXsN7L5YfVmRwG
	 StpiwP+ePD+4E/jLpR0gn+YcNVBlRbmM1AL8YJR5VK+m+cDhTrhtywcSWf8wD/nnFqdJt
	 krCVqqtUjAZtnZbn4OntF513dxOCb4Hn3BD8xRzZFMBPCrAwtktARA5ptZk//fVPg7aM0
	 LD7MjVmCci6JkB3o8gdOnIQcfU4gTdIVmxOXcRfimMizLYxoR5rGPMbFx8SV+2GAYuj/1
	 oLR0TtlTQIq9TqqVYgyxn9W7mdctXDKtyoCWuin5Qs/eQ3x6+W5SkhiEUv3OLpELARMBX
	 Cc3q8iR6im8wrDLuoepqokCcZnZXR/EcRTTyp10vOVJ0NEe6RHHeaXdmw0iWcvCvkyGnn
	 GBO5OAwuM5DijQg01LPghWuGo2HY/mTQVzm+GfueHDOLP4YZe4/lcRzGapuGk0I16X0iX
	 9yo86QOPhsLy+ZWhbaJVmygY8KXORn5Wm8WwIAVuSIKoGJTGxNARqKg2BJ9L2lg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1742984043; bh=Y2Copzs7EacwFlYJXhOu5Vgi8SEO+XWIAsWG4caQKgc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bn/QbvPfMJl/4wQ60v922xXlZrUYHagzfifKuAVVSYo8jyQn2r2FGOdD3c1JcXH7a
	 SDdmegQr3Cp+i4JN165CKL4xeI5F+X3EbdQGZ4GVr7US9WiMXTV41Z4O5ydDfZcuGJ
	 RzoYkhaf6QIKdWLUpDmjXSA6ylWq0nWrxASvn9wmlZ1FzJtmflBxqxWW9hvfweyDlu
	 KGJwBv93/LG0BvmsD8pyEBTnjUofeJZlwbjEtURUsnmmsdjyfrNwqRuB++tz9/nGvE
	 Rt62Jga16MXb4Kc1zVHxUKv7ZSCNW4dkR1LA1tNQb/uz5UxGvhf5JhoYBX2ZvXW8sG
	 Xxkso+tBrasDw==
MIME-Version: 1.0
Date: Wed, 26 Mar 2025 11:14:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
In-Reply-To: <DM4PR12MB84515BDB3E64C4AEA561B266E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-8-Penny.Zheng@amd.com>
 <0b340303-db4e-4723-b53d-178b2676a36c@suse.com>
 <DM4PR12MB84515BDB3E64C4AEA561B266E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
Message-ID: <3e0155aeee7a8629801adbc9c78a5bb6@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-03-26 10:54, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, March 24, 2025 11:48 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; 
>> xen-
>> devel@lists.xenproject.org; Nicola Vetrini 
>> <nicola.vetrini@bugseng.com>
>> Subject: Re: [PATCH v3 07/15] xen/cpufreq: fix core frequency 
>> calculation for AMD
>> Family 1Ah CPUs
>> 
>> On 06.03.2025 09:39, Penny Zheng wrote:
>> > This commit fixes core frequency calculation for AMD Family 1Ah CPUs,
>> > due to a change in the PStateDef MSR layout in AMD Family 1Ah+.
>> > In AMD Family 1Ah+, Core current operating frequency in MHz is
>> > calculated as
>> > follows:
>> 
>> Why 1Ah+? In the code you correctly limit to just 1Ah.
>> 
>> > --- a/xen/arch/x86/cpu/amd.c
>> > +++ b/xen/arch/x86/cpu/amd.c
>> > @@ -572,12 +572,24 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
>> >                                                            :
>> > c->cpu_core_id);  }
>> >
>> > +static uint64_t amd_parse_freq(const struct cpuinfo_x86 *c, uint64_t
>> > +value) {
>> > +   ASSERT(c->x86 <= 0x1A);
>> > +
>> > +   if (c->x86 < 0x17)
>> > +           return (((value & 0x3f) + 0x10) * 100) >> ((value >> 6) & 7);
>> > +   else if (c->x86 <= 0x19)
>> > +           return ((value & 0xff) * 25 * 8) / ((value >> 8) & 0x3f);
>> > +   else
>> > +           return (value & 0xfff) * 5;
>> > +}
>> 
>> Could I talk you into omitting the unnecessary "else" in cases like 
>> this one?
>> (This may also make sense to express as switch().)
>> 
> 
> Sorry, bad habit... will change it to switch
> 
>> > @@ -658,19 +670,20 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>> >     if (!(lo >> 63))
>> >             return;
>> >
>> > -#define FREQ(v) (c->x86 < 0x17 ? ((((v) & 0x3f) + 0x10) * 100) >> (((v) >> 6) &
>> 7) \
>> > -                                : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 0x3f))
>> >     if (idx && idx < h &&
>> >         !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
>> >         !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
>> >             printk("CPU%u: %lu (%lu ... %lu) MHz\n",
>> > -                  smp_processor_id(), FREQ(val), FREQ(lo), FREQ(hi));
>> > +                  smp_processor_id(),
>> > +                  amd_parse_freq(c, val),
>> > +                  amd_parse_freq(c, lo), amd_parse_freq(c, hi));
>> 
>> I fear Misra won't like multiple function calls to evaluate the 
>> parameters to pass to
>> another function. Iirc smp_process_id() has special exception, so 
>> that's okay here.
>> This may be possible to alleviate by marking the new helper pure or 
>> even const
>> (see gcc doc as to caveats with passing pointers to const functions). 
>> Cc-ing Nicola
>> for possible clarification or correction.
>> 
> 
> Maybe we shall declare the function __pure. Having checked the gcc doc,
> ``
> a function that has pointer arguments must not be declared const
> ``
> Otherwise we store the "c->x86" value to avoid using the pointer
> 

Either way could work. ECLAIR will automatically pick up 
__attribute__((pure)) or __attribute__((const)) from the declaration. 
Maybe it could be const, as from a cursory look I don't think the gcc 
restriction on pointer arguments applies, as the pointee is not modified 
between successive calls, but I might be mistaken.

>> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

