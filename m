Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2AE19D99B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 16:57:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNkU-0007VC-JC; Fri, 03 Apr 2020 14:56:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jKNkT-0007V5-4S
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 14:56:45 +0000
X-Inumbo-ID: 5534275a-75bb-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5534275a-75bb-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 14:56:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0709BABF4;
 Fri,  3 Apr 2020 14:56:43 +0000 (UTC)
Subject: Re: [PATCH v7 01/12] xen/vmx: let opt_ept_ad always reflect the
 current setting
To: Jan Beulich <jbeulich@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-2-jgross@suse.com>
 <ad4beba2-3759-bd86-f6e3-670683083b0a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <57c83aae-9ad0-19c0-b447-6c12ca0f3ff6@suse.com>
Date: Fri, 3 Apr 2020 16:56:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ad4beba2-3759-bd86-f6e3-670683083b0a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.20 16:05, Jan Beulich wrote:
> On 02.04.2020 17:46, Juergen Gross wrote:
>> In case opt_ept_ad has not been set explicitly by the user via command
>> line or runtime parameter, it is treated as "no" on Avoton cpus.
>>
>> Change that handling by setting opt_ept_ad to 0 for this cpu type
>> explicitly if no user value has been set.
>>
>> By putting this into the (renamed) boot time initialization of vmcs.c
>> _vmx_cpu_up() can be made static.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit preferably with ...
> 
>> @@ -2108,9 +2104,21 @@ static void vmcs_dump(unsigned char ch)
>>       printk("**************************************\n");
>>   }
>>   
>> -void __init setup_vmcs_dump(void)
>> +int __init vmx_vmcs_init(void)
>>   {
>> -    register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
>> +    int ret;
>> +
>> +    if ( opt_ept_ad < 0 )
>> +        /* Work around Erratum AVR41 on Avoton processors. */
>> +        opt_ept_ad = (boot_cpu_data.x86 == 6 &&
>> +                      boot_cpu_data.x86_model == 0x4d) ? 0 : 1;
> 
> ... no use of the conditional operator here - the result of the
> && (or its logical inversion to be precise) would be quite fine
> to use directly here.

Okay.


Juergen


