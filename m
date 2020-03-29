Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58DB196E3D
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 17:57:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIaGO-0006OE-PM; Sun, 29 Mar 2020 15:54:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fisU=5O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIaGO-0006O9-0a
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 15:54:16 +0000
X-Inumbo-ID: 8a918382-71d5-11ea-8dd5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a918382-71d5-11ea-8dd5-12813bfff9fa;
 Sun, 29 Mar 2020 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=173xMHLykQsoNy5X+BhQ2Hr7bBn2D2IcAeOUQLxx/Zw=; b=N5dFjowWUmuGnkbDTwaPLzXkUs
 Lt5/QWHPnjuHS9s0ullpvxGXkWgd4PpPoRiJlpPwU4eV6wpru+UWziXYzRs8LruwcqB5JY4ZpWslE
 1NfoEkfmAvejDWnaSyRTufWQZeAtPqFXoaiqbKqquXrqNsO+sEiQ+yHxKWRYXELQ8ays=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIaGK-0006Eu-2h; Sun, 29 Mar 2020 15:54:12 +0000
Received: from cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net
 ([81.100.41.95] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIaGJ-0007LF-S3; Sun, 29 Mar 2020 15:54:12 +0000
To: Wei Liu <wl@xen.org>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-4-julien@xen.org>
 <20200329143510.mn7esll6nzzxwmqo@debian>
From: Julien Grall <julien@xen.org>
Message-ID: <569c9a7e-7d60-03a5-315b-30224be2cc07@xen.org>
Date: Sun, 29 Mar 2020 16:54:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200329143510.mn7esll6nzzxwmqo@debian>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 3/3] xen/x86: ioapic: Simplify ioapic_init()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Wei,

On 29/03/2020 15:35, Wei Liu wrote:
> On Fri, Mar 27, 2020 at 07:05:46PM +0000, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since commit 9facd54a45 "x86/ioapic: Add register level checks to detect
>> bogus io-apic entries", Xen is able to cope with IO APICs not mapped in
>> the fixmap.
>>
>> Therefore the whole logic to allocate a fake page for some IO APICs is
>> unnecessary.
>>
>> With the logic removed, the code can be simplified a lot as we don't
>> need to go through all the IO APIC if SMP has not been detected or a
>> bogus zero IO-APIC address has been detected.
>>
>> To avoid another level of tabulation, the simplification is now moved in
>> its own function.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/x86/io_apic.c | 63 ++++++++++++++++++++----------------------
>>   1 file changed, 30 insertions(+), 33 deletions(-)
>>
>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>> index 9a11ee8342..3d52e4daf1 100644
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -2537,34 +2537,25 @@ static __init bool bad_ioapic_register(unsigned int idx)
>>       return false;
>>   }
>>   
>> -void __init init_ioapic(void)
>> +static void __init init_ioapic_mappings(void)
>>   {
>> -    unsigned long ioapic_phys;
>>       unsigned int i, idx = FIX_IO_APIC_BASE_0;
>> -    union IO_APIC_reg_01 reg_01;
>>   
>> -    if ( smp_found_config )
>> -        nr_irqs_gsi = 0;
>>       for ( i = 0; i < nr_ioapics; i++ )
>>       {
>> -        if ( smp_found_config )
>> -        {
>> -            ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>> -            if ( !ioapic_phys )
>> -            {
>> -                printk(KERN_ERR "WARNING: bogus zero IO-APIC address "
>> -                       "found in MPTABLE, disabling IO/APIC support!\n");
>> -                smp_found_config = false;
>> -                skip_ioapic_setup = true;
>> -                goto fake_ioapic_page;
>> -            }
>> -        }
>> -        else
>> +        union IO_APIC_reg_01 reg_01;
>> +        unsigned long ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>> +
>> +        ioapic_phys = mp_ioapics[i].mpc_apicaddr;
> 
> ioapic_phys is set a second time here. See the line before.

Good spot! I will drop the line.

Cheers,

-- 
Julien Grall

