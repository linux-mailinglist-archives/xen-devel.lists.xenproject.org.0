Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC2207773
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 17:33:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo7Na-000166-Fa; Wed, 24 Jun 2020 15:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hC7e=AF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jo7NZ-000161-7I
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 15:32:01 +0000
X-Inumbo-ID: d86be108-b62f-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d86be108-b62f-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 15:32:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD65DAD1F;
 Wed, 24 Jun 2020 15:31:58 +0000 (UTC)
Subject: Ping: [PATCH v3 1/1] x86/acpi: Use FADT flags to determine the PMTMR
 width
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>
References: <cover.1592603468.git.gorbak25@gmail.com>
 <de0e33d2be0924e66a220678a7683098df70c2b5.1592603468.git.gorbak25@gmail.com>
 <5993e716-d71d-cbc0-a186-5325e2bdeba4@suse.com>
Message-ID: <2c3e8cd2-b74f-52b6-4df8-057e8d000455@suse.com>
Date: Wed, 24 Jun 2020 17:31:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <5993e716-d71d-cbc0-a186-5325e2bdeba4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 10:49, Jan Beulich wrote:
> On 20.06.2020 00:00, Grzegorz Uriasz wrote:
>> @@ -490,8 +497,12 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>>   	 */
>>  	if (!pmtmr_ioport) {
>>  		pmtmr_ioport = fadt->pm_timer_block;
>> -		pmtmr_width = fadt->pm_timer_length == 4 ? 24 : 0;
>> +		pmtmr_width = fadt->pm_timer_length == 4 ? 32 : 0;
>>  	}
>> +	if (pmtmr_width < 32 && fadt->flags & ACPI_FADT_32BIT_TIMER)
>> +        printk(KERN_WARNING PREFIX "PM-Timer is too short\n");
> 
> Indentation is screwed up here.
> 
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -457,16 +457,13 @@ static u64 read_pmtimer_count(void)
>>  static s64 __init init_pmtimer(struct platform_timesource *pts)
>>  {
>>      u64 start;
>> -    u32 count, target, mask = 0xffffff;
>> +    u32 count, target, mask;
>>  
>> -    if ( !pmtmr_ioport || !pmtmr_width )
>> +    if ( !pmtmr_ioport || (pmtmr_width != 24 && pmtmr_width != 32) )
>>          return 0;
>>  
>> -    if ( pmtmr_width == 32 )
>> -    {
>> -        pts->counter_bits = 32;
>> -        mask = 0xffffffff;
>> -    }
>> +    pts->counter_bits = pmtmr_width;
>> +    mask = (1ull << pmtmr_width) - 1;
> 
> "mask" being of "u32" type, the use of 1ull is certainly a little odd
> here, and one of the reasons why I think this extra "cleanup" would
> better go in a separate patch.
> 
> Seeing that besides cosmetic aspects the patch looks okay now, I'd be
> willing to leave the bigger adjustment mostly as is, albeit I'd
> prefer the 1ull to go away, by instead switching to e.g.
> 
>     mask = 0xffffffff >> (32 - pmtmr_width);
> 
> With the adjustments (which I'd be happy to make while committing,
> provided you agree)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Also Cc-ing Paul for a possible release ack (considering this is a
> backporting candidate).

Paul?

Thanks, Jan

