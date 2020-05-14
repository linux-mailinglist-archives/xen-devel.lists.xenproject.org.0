Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7801D2FD4
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 14:32:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZD1W-00063z-3P; Thu, 14 May 2020 12:31:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZD1U-00063u-KD
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 12:31:36 +0000
X-Inumbo-ID: d986612e-95de-11ea-a482-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d986612e-95de-11ea-a482-12813bfff9fa;
 Thu, 14 May 2020 12:31:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 553DCAC22;
 Thu, 14 May 2020 12:31:37 +0000 (UTC)
Subject: Re: [PATCH 4/4] x86/APIC: restrict certain messages to BSP
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <513e4f93-a8a0-ae72-abcc-aa28531eca97@suse.com>
 <20200514100145.GA54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c4ac126d-6f37-4c93-7189-35128bcd3e04@suse.com>
Date: Thu, 14 May 2020 14:31:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514100145.GA54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 12:01, Roger Pau Monné wrote:
> On Fri, Mar 13, 2020 at 10:26:47AM +0100, Jan Beulich wrote:
>> All CPUs get an equal setting of EOI broadcast suppression; no need to
>> log one message per CPU, even if it's only in verbose APIC mode.
>>
>> Only the BSP is eligible to possibly get ExtINT enabled; no need to log
>> that it gets disabled on all APs, even if - again - it's only in verbose
>> APIC mode.
>>
>> Take the opportunity and introduce a "bsp" parameter to the function, to
>> stop using smp_processor_id() to tell BSP from APs.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> LGTM:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> AFAICT this doesn't introduce any functional change in APIC setup or
> behavior, the only functional change is the log message reduction.
> Might be good to add a note to that effect to make this clear, since
> the change from smp_processor_id() -> bsp might make this not obvious.

I've added "No functional change from this" to the last paragraph.

>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -499,7 +499,7 @@ static void resume_x2apic(void)
>>      __enable_x2apic();
>>  }
>>  
>> -void setup_local_APIC(void)
>> +void setup_local_APIC(bool bsp)
>>  {
>>      unsigned long oldvalue, value, maxlvt;
>>      int i, j;
>> @@ -598,8 +598,8 @@ void setup_local_APIC(void)
>>      if ( directed_eoi_enabled )
>>      {
>>          value |= APIC_SPIV_DIRECTED_EOI;
>> -        apic_printk(APIC_VERBOSE, "Suppress EOI broadcast on CPU#%d\n",
>> -                    smp_processor_id());
>> +        if ( bsp )
>> +            apic_printk(APIC_VERBOSE, "Suppressing EOI broadcast\n");
>>      }
>>  
>>      apic_write(APIC_SPIV, value);
>> @@ -615,21 +615,22 @@ void setup_local_APIC(void)
>>       * TODO: set up through-local-APIC from through-I/O-APIC? --macro
>>       */
>>      value = apic_read(APIC_LVT0) & APIC_LVT_MASKED;
>> -    if (!smp_processor_id() && (pic_mode || !value)) {
>> +    if (bsp && (pic_mode || !value)) {
>>          value = APIC_DM_EXTINT;
>>          apic_printk(APIC_VERBOSE, "enabled ExtINT on CPU#%d\n",
>>                      smp_processor_id());
>>      } else {
>>          value = APIC_DM_EXTINT | APIC_LVT_MASKED;
>> -        apic_printk(APIC_VERBOSE, "masked ExtINT on CPU#%d\n",
>> -                    smp_processor_id());
>> +        if (bsp)
>> +            apic_printk(APIC_VERBOSE, "masked ExtINT on CPU#%d\n",
>> +                        smp_processor_id());
> 
> You might want to also drop the CPU#%d from the above messages, since
> they would only be printed for the BSP.

I want to specifically keep them, so that once (if ever) we introduce
hot-unplug support for the BSP, the same or similar messages can be
used and matched against earlier ones in the log.

>>      }
>>      apic_write(APIC_LVT0, value);
>>  
>>      /*
>>       * only the BP should see the LINT1 NMI signal, obviously.
>>       */
>> -    if (!smp_processor_id())
>> +    if (bsp)
>>          value = APIC_DM_NMI;
>>      else
>>          value = APIC_DM_NMI | APIC_LVT_MASKED;
> 
> This would be shorter as:
> 
> value = APIC_DM_NMI | (bsp ? 0 : APIC_LVT_MASKED);

Indeed, at the expense of larger code churn. Seems like an at least
partially unrelated change to me (at risk of obscuring the actual
purpose of the change here).

Jan

