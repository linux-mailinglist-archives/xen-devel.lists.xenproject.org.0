Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A927B1D796D
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 15:14:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jafaD-0006Ww-1R; Mon, 18 May 2020 13:13:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jafaB-0006Wr-TV
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:13:27 +0000
X-Inumbo-ID: 5bafc226-9909-11ea-a860-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bafc226-9909-11ea-a860-12813bfff9fa;
 Mon, 18 May 2020 13:13:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0491BB1F7;
 Mon, 18 May 2020 13:13:27 +0000 (UTC)
Subject: Re: [PATCH v4] x86: clear RDRAND CPUID bit on AMD family 15h/16h
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <69382ba7-b562-2c8c-1843-b17ce6c512f1@suse.com>
 <20200515151838.GU54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4c23fcb-0a09-4e8c-eabe-ff7040427376@suse.com>
Date: Mon, 18 May 2020 15:13:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515151838.GU54375@Air-de-Roger>
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

On 15.05.2020 17:18, Roger Pau Monné wrote:
> On Mon, Mar 09, 2020 at 10:08:50AM +0100, Jan Beulich wrote:
>> Inspired by Linux commit c49a0a80137c7ca7d6ced4c812c9e07a949f6f24:
>>
>>     There have been reports of RDRAND issues after resuming from suspend on
>>     some AMD family 15h and family 16h systems. This issue stems from a BIOS
>>     not performing the proper steps during resume to ensure RDRAND continues
>>     to function properly.
>>
>>     Update the CPU initialization to clear the RDRAND CPUID bit for any family
>>     15h and 16h processor that supports RDRAND. If it is known that the family
>>     15h or family 16h system does not have an RDRAND resume issue or that the
>>     system will not be placed in suspend, the "cpuid=rdrand" kernel parameter
>>     can be used to stop the clearing of the RDRAND CPUID bit.
>>
>>     Note, that clearing the RDRAND CPUID bit does not prevent a processor
>>     that normally supports the RDRAND instruction from executing it. So any
>>     code that determined the support based on family and model won't #UD.
>>
>> Warn if no explicit choice was given on affected hardware.
>>
>> Check RDRAND functions at boot as well as after S3 resume (the retry
>> limit chosen is entirely arbitrary).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks much.

>> @@ -646,6 +647,25 @@ static void init_amd(struct cpuinfo_x86
>>  		if (acpi_smi_cmd && (acpi_enable_value | acpi_disable_value))
>>  			amd_acpi_c1e_quirk = true;
>>  		break;
>> +
>> +	case 0x15: case 0x16:
>> +		/*
>> +		 * There are too many Fam15/Fam16 systems where upon resume
>> +		 * from S3 firmware fails to re-setup properly functioning
>> +		 * RDRAND.  Clear the feature unless force-enabled on the
>> +		 * command line.
>> +		 */
>> +		if (c == &boot_cpu_data &&
>> +		    cpu_has(c, X86_FEATURE_RDRAND) &&
>> +		    !is_forced_cpu_cap(X86_FEATURE_RDRAND)) {
> 
> Given this is the only user of is_forced_cpu_cap...
> 
>> +			static const char __initconst text[] =
>> +				"RDRAND may cease to work on this hardware upon resume from S3.\n"
>> +				"Please choose an explicit cpuid={no-}rdrand setting.\n";
>> +
>> +			setup_clear_cpu_cap(X86_FEATURE_RDRAND);
>> +			warning_add(text);
>> +		}
>> +		break;
>>  	}
>>  
>>  	display_cacheinfo(c);
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -11,6 +11,7 @@
>>  #include <asm/io.h>
>>  #include <asm/mpspec.h>
>>  #include <asm/apic.h>
>> +#include <asm/random.h>
>>  #include <asm/setup.h>
>>  #include <mach_apic.h>
>>  #include <public/sysctl.h> /* for XEN_INVALID_{SOCKET,CORE}_ID */
>> @@ -98,6 +99,11 @@ void __init setup_force_cpu_cap(unsigned
>>  	__set_bit(cap, boot_cpu_data.x86_capability);
>>  }
>>  
>> +bool is_forced_cpu_cap(unsigned int cap)
> 
> ... I think this could be made __init?

Ah, now it can be again, yes. It was an endless back and forth between
the various versions (some not even posted).

Jan

