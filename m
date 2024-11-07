Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE2D9BFAE6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 01:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831455.1246764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qi1-00062F-TU; Thu, 07 Nov 2024 00:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831455.1246764; Thu, 07 Nov 2024 00:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qi1-000603-Pw; Thu, 07 Nov 2024 00:49:13 +0000
Received: by outflank-mailman (input) for mailman id 831455;
 Thu, 07 Nov 2024 00:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8qi0-0005zt-OG
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 00:49:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18b6f306-9ca2-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 01:49:10 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730940541055346.34239794619634;
 Wed, 6 Nov 2024 16:49:01 -0800 (PST)
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
X-Inumbo-ID: 18b6f306-9ca2-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE4YjZmMzA2LTljYTItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTQwNTUwLjQyMTA2Mywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730940543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TFuoOlA/jjvPC8K1/xiManxGkV9Zw6/hp03Jd3yPj56GvxDfSYq4Jy+Q0Kr40EnTMCKNzGS3JqadiOFDjSd54F4INTexG0w42CLo6qH7F3LscnMrLGi6tA3Bjh9CrRcV2amOF/nS3uV4QrqXKoV6jD4pc+Pk6IC8oZeTj4vzla0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730940543; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Bjl+qG1q3ezB4Ua6CgqxSOZczqOC9SVgseum+rwTgjw=; 
	b=UQZtrwI8EVbmnrj2XVtNxKkvptcSOmeHp0aj1nQe10sP5twFFRU/9d/v+P8M2LZl+AKdbXBvIT0YVFTqRXIjAcyF/pXMyes8y4GRaxEOzxkUzIp3PAn1e6T+F/gHx6MmyHfb0s4L2A4mnXW4aeDc6hcfcTlPCtmNVWqHyStxBmg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730940543;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Bjl+qG1q3ezB4Ua6CgqxSOZczqOC9SVgseum+rwTgjw=;
	b=MHjShEplncReh5e454AeMfStiSarB8GA3e6I3IJoY1v8z8IsQwMSb/MLGSpiWT7f
	y5XZCrZy/BghPtgNLa2Iud9NwxyTyEH9iuaCK7RALHAkO1tRzf4zbH5naHM6VI37y0d
	gwUhabMIqgb3woJcpNhFAs+Y/fLyyW1Wj8+oEFfA=
Message-ID: <4279aa2b-035b-47cc-8e7c-53a5db4774ed@apertussolutions.com>
Date: Wed, 6 Nov 2024 19:48:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/12] x86/boot: introduce module release
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-5-dpsmith@apertussolutions.com>
 <773dbe75-d1d3-41ea-8ff7-c031e0e9a920@amd.com>
 <f592170a-6cb3-4bfc-9486-2253a6443e33@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <f592170a-6cb3-4bfc-9486-2253a6443e33@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/6/24 17:46, Andrew Cooper wrote:
> On 06/11/2024 10:16 pm, Jason Andryuk wrote:
>> On 2024-11-02 13:25, Daniel P. Smith wrote:
>>> @@ -2122,6 +2152,11 @@ void asmlinkage __init noreturn __start_xen(void)
>>>        if ( !dom0 )
>>>            panic("Could not set up DOM0 guest OS\n");
>>>    +    /* Check and warn if any modules did not get released */
>>> +    for ( i = 0; i < bi->nr_modules; i++ )
>>> +        if ( !bi->mods[i].released )
>>> +            printk(XENLOG_ERR "Boot module %d not released, memory
>>> leaked", i);
>>> +
>>
>> Why not release the memory here instead of leaking it?
>>
>> I feel like the corner case of mapping the dom0 initrd is leading to
>> this manual approach or releasing modules individually.  That logic
>> then has to be spread around.  discard_initial_images() kept the logic
>> centralized.  Maybe just replace the mod_end == 0 special case with a
>> "don't release me" flag that is checked in discard_initial_images()?
> 
> I've been conflicted on this for ages, but I agree.
> 
> There are many wonky things with the current arrangement.
> 
> First(ish), discard_initial_images() should be named
> discard_boot_modules() (if it's saying a separate function).
> 
> Second, the individual dom0_build.c's should not be calling this
> directly.  They're both right at the end of construction, so it would
> make far more sense for __start_xen() to do this after create_dom0().
> That also avoids needing to export the function.
> 
> And yes, as Jason says, the "initrd mapped instead of copied" is a weird
> corner case, and the other path manually releasing and also saying
> "don't free" is just pointless complexity.  I do like the idea of a
> "dont_free" flag.
> 
> Thoughts?

How about the ref count I suggested in response to Jason?

> I know this would be moving back to a more v7-like approach, but I think
> the end approach is cleaner.

No worries, the series is looking better each time.

v/r,
dps

