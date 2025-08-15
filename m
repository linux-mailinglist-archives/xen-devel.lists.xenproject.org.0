Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE71CB27B4D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083036.1442700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpyy-0000ry-4Y; Fri, 15 Aug 2025 08:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083036.1442700; Fri, 15 Aug 2025 08:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpyy-0000po-1R; Fri, 15 Aug 2025 08:40:16 +0000
Received: by outflank-mailman (input) for mailman id 1083036;
 Fri, 15 Aug 2025 08:40:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZXrH=23=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umpyw-0000pi-Vu
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:40:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 762fb800-79b3-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:40:13 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C96E24EE0742;
 Fri, 15 Aug 2025 10:40:12 +0200 (CEST)
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
X-Inumbo-ID: 762fb800-79b3-11f0-a328-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755247212;
	b=cEk+yBtUZ7MIO9XLbsl8uG1LqBJNlQSZw7CmcA7Uz0kc1K/B5r17T/ZI+/6ev38MGgrd
	 zoSyhGzJRqUgbynffIpD3wOOreVIUjSMffkFrDiFY7QXLrxtCwnJelXrTvHxD7k8+Qq0Q
	 6I//vqM82c3CMprYph2PpOYFs7i/NNJyYCkW8rp9DIu9c2P50vo4RkPICMN/1vtA5Y2QL
	 MMTQLHxGHW5Jgdo8oJUw00TaOlEyniQEL/5TVO30MZb5oXSR+pLz4aVvnbp+JqhmSpCv7
	 k112opJxqbL6xMMqkKDzU7kwhD7mkJv0fzCXt5AtWepCf+dDVgGbBPhoxMZwfltMNsG9/
	 J1b1Dwo6UnphK8NZyxB2JgoYBafJdhVg3B+FtO+HpSrFY9Y9LPdvY9H2VFO3N0hnNcJuM
	 JSVzlzf/LTj70mYrigyJt17Ql7XFiK4wceuBOgaY8lQVW8y+rsuVEGS2evxln/n70x8s9
	 K8B91QkItXjwBE2GVWukN98ir7eU0NaBYnY9sX0pe8WPqxY6RkqehYwGWJN/19a1mtGeS
	 ozAHIUNWnCaQ76aT9bFgFspdk9dishDpJmhVkyPStoA9WfGv3e/Indtcgafx3CmGDtqMh
	 X5PQxP2XWyiR2WqTyFXwb6qUXVbvk9uZoQnU9jVMnvpaop+oED6L8q8faGYbqfI=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755247212;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=y3MHDgRKmuqaGju4Zy5thsD6qx9/BTglp6ydF5MPld0=;
	b=icQ2liYMAjXEeeakC12qL+jXR1qMQd8DTU6JVcNL+M4UbCU7lXLQkYb/xOv7b24a0LDt
	 fxU7Ku8Ed9qvEowvVtrZ4epQq3C6Y3HcH7fdFXHdtNg4K2xGxKD7YsRrlHHGkjtdZejEf
	 sB1ndDK01IGj8jYheEz5yX9HrNfLbSHct0TJwKzLU18VZDzAWjZSYBXrJ99RxC1hP7FE7
	 oTi5Ip/2IEJFH/voJXCHCCLGsG1dhe8Vm+OepfTYTVa3hys3bUL41GbUJJ9dRVR3AVWZ7
	 VrR7Yk+9GWKmqKwG9dIE43sIDiAyxAmaA1fTkDFRlR/DwkO131yPtTbDJJzDhY9sh9tih
	 5QWgGkbWUI2MRxJt7B1+cmV3Nr0+wA3XTuVyjJ7J5tKwv5tWOBJmKI0W+UdJ14DbTaubP
	 0YWNY3WSD3Vzx3D5iyf863cKhSrzQFgPEwit/HOoj5E6sytt3+oWG6ywbco3wn/cWBJYB
	 UKlQdfMVwkpg/kambcZUYZ2aUd9z1vnrD1rtoMWA2XZG+jutSW5OcA7yFi7rnMKVjUj8B
	 rWCfgQSmP5LUxCOKtyXVYVdMxU/QwEjFiyDXI0//t94xzPXO4NoHFTflxKDysdzi+KzOT
	 uySEcPGiXVaiCPI2q38tT8IDGkCbTXQk3kUE7jyaLWQeHD3Y6wlEN+GtXTHe6CQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755247212; bh=LDTDOa/knwMX1qgNK++W+iWoxR6W7dbFUcBUV2ig83A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iRXjvZNS9folroxFD9wTo3iTxbHbvFKArPv0YvHQEzDuYTSiRZnkY/YB0vH6DgIWG
	 ihM5aSXAAuaYfOJYDtNoNUTCZLKcYhqIXsX1dcWjT8nSbNFq39sXVEmGx7ARVUiBtT
	 iWREcHORcpn7ps1oddAHOgn3loMCxl9TodkK4V40W/+BXhs6tpOEiDWuD+G9v1AsgJ
	 k26Brqp6KHQAcaAaoE2dpiZhnXSbIBbNsCNaYH3x4t9LjtdUgWPaFNxhG+LD30ZcWi
	 EEn8j/+HwHczAwrtycTF+HAwtB+taM2Y4LbwP3cxqm9nZbo1tzsjl2uDoyF98v5yH5
	 WX5jns9vIDVPA==
MIME-Version: 1.0
Date: Fri, 15 Aug 2025 10:40:12 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
In-Reply-To: <75886e26-29b3-4aab-9780-7301330b4bb1@suse.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <80285a06f5d4fb3bd3e378317cca61ca@bugseng.com>
 <7e906964-b07d-4205-a683-e665f19d5edc@citrix.com>
 <aab37ec2-33bf-403b-978a-dc3c4bc282f7@suse.com>
 <0af415c5-df96-4715-a7e6-0d645e2e3a96@citrix.com>
 <75886e26-29b3-4aab-9780-7301330b4bb1@suse.com>
Message-ID: <219ecea713dd9dac4c788d91c727f401@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-15 10:30, Jan Beulich wrote:
> On 14.08.2025 20:20, Andrew Cooper wrote:
>> On 14/08/2025 8:26 am, Jan Beulich wrote:
>>> On 13.08.2025 13:36, Andrew Cooper wrote:
>>>> On 12/08/2025 10:43 am, Nicola Vetrini wrote:
>>>>> On 2025-08-08 22:23, Andrew Cooper wrote:
>>>>>> diff --git a/xen/arch/x86/traps-setup.c 
>>>>>> b/xen/arch/x86/traps-setup.c
>>>>>> index 8ca379c9e4cb..13b8fcf0ba51 100644
>>>>>> --- a/xen/arch/x86/traps-setup.c
>>>>>> +++ b/xen/arch/x86/traps-setup.c
>>>>>> @@ -19,6 +20,124 @@ boolean_param("ler", opt_ler);
>>>>>> 
>>>>>>  void nocall entry_PF(void);
>>>>>> 
>>>>>> +/*
>>>>>> + * Sets up system tables and descriptors for IDT devliery.
>>>>>> + *
>>>>>> + * - Sets up TSS with stack pointers, including ISTs
>>>>>> + * - Inserts TSS selector into regular and compat GDTs
>>>>>> + * - Loads GDT, IDT, TR then null LDT
>>>>>> + * - Sets up IST references in the IDT
>>>>>> + */
>>>>>> +static void load_system_tables(void)
>>>>>> +{
>>>>>> +    unsigned int i, cpu = smp_processor_id();
>>>>>> +    unsigned long stack_bottom = get_stack_bottom(),
>>>>>> +        stack_top = stack_bottom & ~(STACK_SIZE - 1);
>>>>>> +    /*
>>>>>> +     * NB: define tss_page as a local variable because clang 3.5
>>>>>> doesn't
>>>>>> +     * support using ARRAY_SIZE against per-cpu variables.
>>>>>> +     */
>>>>>> +    struct tss_page *tss_page = &this_cpu(tss_page);
>>>>>> +    idt_entry_t *idt = this_cpu(idt);
>>>>>> +
>>>>> Given the clang baseline this might not be needed anymore?
>>>> Hmm.  While true, looking at 51461114e26, the code is definitely 
>>>> better
>>>> written with the tss_page variable and we wouldn't want to go back 
>>>> to
>>>> the old form.
>>>> 
>>>> I think that I'll simply drop the comment.
>>>> 
>>>> ~Andrew
>>>> 
>>>> P.S.
>>>> 
>>>> Generally speaking, because of the RELOC_HIDE() in this_cpu(), any 
>>>> time
>>>> you ever want two accesses to a variable, it's better (code gen 
>>>> wise) to
>>>> construct a pointer to it and use the point multiple times.
>>>> 
>>>> I don't understand why there's a RELOC_HIDE() in this_cpu().  The
>>>> justification doesn't make sense, but I've not had time to explore 
>>>> what
>>>> happens if we take it out.
>>> There's no justification in xen/percpu.h?
>> 
>> Well, it's given in compiler.h by RELOC_HIDE().
>> 
>> /* This macro obfuscates arithmetic on a variable address so that gcc
>>    shouldn't recognize the original var, and make assumptions about it 
>> */
>> 
>> 
>> But this is far from convincing.
>> 
>>> 
>>> My understanding is that we simply may not expose any accesses to 
>>> per_cpu_*
>>> variables directly to the compiler, or there's a risk that it might 
>>> access
>>> the "master" variable (i.e. CPU0's on at least x86).
>> 
>> RELOC_HIDE() doesn't do anything about the correctness of the pointer
>> arithmetic expression to make the access work.
>> 
>> I don't see how a correct expression can ever access CPU0's data by
>> accident.
> 
> Hmm, upon another look I agree. I wonder whether we inherited this from
> Linux, where in turn it may have been merely a workaround to deal with
> preemptible code not correctly accessing per-CPU data (i.e. not
> accounting for get_per_cpu_offset() not being stable across 
> preemption).
> Yet then per_cpu() would have been of similar concern when "cpu" isn't
> properly re-fetched after any possible preemption point ...
> 
> Jan

Probably inherited with a stripped-down comment on top of RELOC_HIDE, 
see [1]. In a way it does make sense that the compiler may decide to 
optimize based on this assumption, though I don't know whether wrapping 
is meant to happen with per-CPU variables.

[1] 
https://elixir.bootlin.com/linux/v6.16/source/include/linux/compiler-gcc.h#L31

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

