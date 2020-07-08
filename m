Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A921854B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 12:53:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt7hJ-00030N-8x; Wed, 08 Jul 2020 10:53:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAq=AT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jt7hH-00030H-Nx
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 10:53:03 +0000
X-Inumbo-ID: 31e595ec-c109-11ea-b7bb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31e595ec-c109-11ea-b7bb-bc764e2007e4;
 Wed, 08 Jul 2020 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594205582;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dJYE+lAWD82IJCGRw/dF/vl314HHpf6JGSZL40tuNkE=;
 b=f91+ispgLcG5y79Q6HFMw9UIxaA62lIE2u/X67DQKJH4dSMG3gvvmQ+l
 FQDNBwFq4d1ERS33wDZeowN5Z+tH+77mHyyLAUHogL0JapwXQY/lTGp7M
 93N+zlUQ2Ee8W7J5VLwFj/Ay+1H83v4pd9q90BarzVUbrNlM3qFTHF2/7 k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: px4yTnfH5mWopo2kT1HqDZOMMJGbDfRLN3R+tZgPrQgSVr6awm6WgNA/6/k5qYXvzPAhRfw5fp
 B895dWBT3wALOjZEQnFPRr8zwIulKu6IGIfstja0zS0PEERvz/e+sS5McxOj1baC30wBfzd+XM
 MMSRyMAkh49mddKSTy2+AUeMzCkFGonOo0dS8c5Py9NYse3VUu47WivBvu/yYh79n6KtyZ9aEh
 lyjCxmedZO5zwILBMRYlA+9VkVLBscoP9t1EaOX/RlGAzwkHxmufUnwq1/ej2kRtCk88qX/wxv
 lAQ=
X-SBRS: 2.7
X-MesageID: 22195081
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,327,1589256000"; d="scan'208";a="22195081"
Subject: Re: [PATCH] x86/mtrr: Drop workaround for old 32bit CPUs
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200708101443.27321-1-andrew.cooper3@citrix.com>
 <20200708104826.GB7191@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <12874bc4-39e8-5ed4-3893-79154a206293@citrix.com>
Date: Wed, 8 Jul 2020 11:52:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708104826.GB7191@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08/07/2020 11:48, Roger Pau Monné wrote:
> On Wed, Jul 08, 2020 at 11:14:43AM +0100, Andrew Cooper wrote:
>> This logic is dead as Xen is 64bit-only these days.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks,

>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/cpu/mtrr/generic.c | 17 -----------------
>>  1 file changed, 17 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
>> index 89634f918f..06fa0c0420 100644
>> --- a/xen/arch/x86/cpu/mtrr/generic.c
>> +++ b/xen/arch/x86/cpu/mtrr/generic.c
>> @@ -570,23 +570,6 @@ int generic_validate_add_page(unsigned long base, unsigned long size, unsigned i
>>  {
>>  	unsigned long lbase, last;
>>  
>> -	/*  For Intel PPro stepping <= 7, must be 4 MiB aligned 
>> -	    and not touch 0x70000000->0x7003FFFF */
>> -	if (is_cpu(INTEL) && boot_cpu_data.x86 == 6 &&
>> -	    boot_cpu_data.x86_model == 1 &&
>> -	    boot_cpu_data.x86_mask <= 7) {
>> -		if (base & ((1 << (22 - PAGE_SHIFT)) - 1)) {
>> -			printk(KERN_WARNING "mtrr: base(%#lx000) is not 4 MiB aligned\n", base);
>> -			return -EINVAL;
>> -		}
>> -		if (!(base + size < 0x70000 || base > 0x7003F) &&
>> -		    (type == MTRR_TYPE_WRCOMB
>> -		     || type == MTRR_TYPE_WRBACK)) {
>> -			printk(KERN_WARNING "mtrr: writable mtrr between 0x70000000 and 0x7003FFFF may hang the CPU.\n");
>> -			return -EINVAL;
>> -		}
>> -	}
>> -
>>  	/*  Check upper bits of base and last are equal and lower bits are 0
>>  	    for base and 1 for last  */
>>  	last = base + size - 1;
> FWIW, you could also initialize last at definition time.

I've got some very different cleanup in mind for that code, seeing as it
can be simplified to a single test expression.

~Andrew

