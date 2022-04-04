Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C014F17B3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 16:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298390.508309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbO8R-0002oE-CJ; Mon, 04 Apr 2022 14:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298390.508309; Mon, 04 Apr 2022 14:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbO8R-0002kr-8K; Mon, 04 Apr 2022 14:56:51 +0000
Received: by outflank-mailman (input) for mailman id 298390;
 Mon, 04 Apr 2022 14:56:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIUK=UO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nbO8P-0002kl-Tn
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 14:56:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72c36287-b427-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 16:56:48 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1649084197983204.3092203976147;
 Mon, 4 Apr 2022 07:56:37 -0700 (PDT)
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
X-Inumbo-ID: 72c36287-b427-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1649084200; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ShqYNoKYZx66XfZ6O5DbKl7Rg1VAkJS6qqXeXwQlwt2dsbacqjLorak/gAZ7pGWfeX1khRrQmHYKxPHggjYli1J3S4UHg2vIPzLB1Iz4x7WP8cPT4MglBaoTP3tzl1io3fhAfxU1d2K24FcgLNNeAwiJqFefOfd+C29WDGsyFLM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1649084200; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=nMNcmVrf2F6pgJCVlrEQLsJYEWaCohoN0zG8AdD682k=; 
	b=DBFHs5CYB4CZkuIzUV7uDVSWtZoV5I8yREhO/eosEX6KgI6FIYMtuwub9VXdYRDpwQbnz5jhr+VYQd8OiRs78O0lj2bzpwwhURJ79ay89RKbC3p0/o2YKui682IMJaE8wfRrcnqK4MU/qwBurONhisGFbyT42125fLgbRWVCaho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649084200;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nMNcmVrf2F6pgJCVlrEQLsJYEWaCohoN0zG8AdD682k=;
	b=hZlNGJ1bWt8MIR17g3M3oln6v/vMJIFPkTiw/y1xKu0n10YxJA3WjhuI7SUyvAzC
	rB3dfHtOAQazknAFngr9I5qNAYz+py7abLTaz/+0zuS2Vm3ToSq2o1ztaaHkoqyZn2T
	UBN4NKMR3U0Sgu5lnjsIao74ykF92UWzckTFWetw=
Message-ID: <4ca5a90f-17f7-791d-ffa2-f48d37ac4675@apertussolutions.com>
Date: Mon, 4 Apr 2022 10:56:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, scott.davis@starlab.io, jandryuk@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-3-dpsmith@apertussolutions.com>
 <YkWijXX9P1FSs61W@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/2] arch: ensure idle domain is not left privileged
In-Reply-To: <YkWijXX9P1FSs61W@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 3/31/22 08:46, Roger Pau Monné wrote:
> On Wed, Mar 30, 2022 at 07:05:49PM -0400, Daniel P. Smith wrote:
>> It is now possible to promote the idle domain to privileged during setup.  It
>> is not desirable for the idle domain to still be privileged when moving into a
>> running state. If the idle domain was elevated and not properly demoted, it is
>> desirable to fail at this point. This commit adds an assert for both x86 and
>> Arm just before transitioning to a running state that ensures the idle is not
>> privileged.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>  xen/arch/arm/setup.c | 3 +++
>>  xen/arch/x86/setup.c | 3 +++
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 7968cee47d..3de394e946 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -973,6 +973,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>>      /* Hide UART from DOM0 if we're using it */
>>      serial_endboot();
>>  
>> +    /* Ensure idle domain was not left privileged */
>> +    ASSERT(current->domain->is_privileged == false) ;
>> +
>>      system_state = SYS_STATE_active;
>>  
>>      create_domUs();
> 
> Hm, I think you want to use the permission promotion of the idle
> domain in create_domUs() likely?

Apologies, I cherry-picked this onto a branch of staging of what I
thought was an up to date remote, but as Julien pointed out I was not.

> At which point the check should be after create_domUs, and it would
> seem that logically SYS_STATE_active should be set after creating the
> domUs.
> 
> Also, FWIW, I'm not seeing this create_domUs() call in my context,
> maybe you have other patches on your queue?
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 885919d5c3..b868463f83 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -589,6 +589,9 @@ static void noinline init_done(void)
>>      void *va;
>>      unsigned long start, end;
>>  
>> +    /* Ensure idle domain was not left privileged */
>> +    ASSERT(current->domain->is_privileged == false) ;
>                                                       ^ extra space.
> 
> I think you could squash this patch with the previous one and also
> squash it with a patch that actually makes use of the introduced
> permission promotion functions (or at least in a patch series where
> further patches make use the introduced functions).

Ack, I can squash them together.

v/r,
dps

