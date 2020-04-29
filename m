Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577941BD728
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 10:22:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jThzC-0002Kg-1B; Wed, 29 Apr 2020 08:22:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jThzB-0002Ka-D4
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 08:22:29 +0000
X-Inumbo-ID: 8f764a7e-89f2-11ea-991b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f764a7e-89f2-11ea-991b-12813bfff9fa;
 Wed, 29 Apr 2020 08:22:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44278AD4F;
 Wed, 29 Apr 2020 08:22:25 +0000 (UTC)
Subject: Re: [PATCH v4] x86: clear RDRAND CPUID bit on AMD family 15h/16h
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <69382ba7-b562-2c8c-1843-b17ce6c512f1@suse.com>
 <68aa71c6-a41b-9f7c-f3ca-94060fae5db0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c150ef54-4519-2b9f-6029-cdefb13ef6c2@suse.com>
Date: Wed, 29 Apr 2020 10:22:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <68aa71c6-a41b-9f7c-f3ca-94060fae5db0@citrix.com>
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
 Paul Durrant <Paul.Durrant@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.04.2020 16:25, Andrew Cooper wrote:
> On 09/03/2020 09:08, Jan Beulich wrote:
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
> 
> I'm not sure what is best to do here.  The type suggests that this is a
> verbatim copy of the Linux commit message, but this tiny detail is Xen
> specific.

It simply didn't seem to make sense to leave the Linux way of
specifying this in here, just to then say further down what the
correct (Xen) way is.

>> ---
>> Still slightly RFC, and still in particular because of the change to
>> parse_xen_cpuid():
> 
> FWIW, that is very similar to XenServer's AVX512 off-by-default bodge
> until the default vs max policy work is ready.
> 
> I don't have a better suggestion right now, but hopefully something
> better might become obvious when we've got more users.  Either way, I'm
> expecting it to turn into a "switch ( mid->bit )" expression in due course.

IOW do you want me to use switch() right away?

>> @@ -646,6 +647,25 @@ static void init_amd(struct cpuinfo_x86
>>  		if (acpi_smi_cmd && (acpi_enable_value | acpi_disable_value))
>>  			amd_acpi_c1e_quirk = true;
>>  		break;
>> +
>> +	case 0x15: case 0x16:
>> +		/*
>> +		 * There are too many Fam15/Fam16 systems where upon resume
> 
> "some" systems.
> 
>> +		 * from S3 firmware fails to re-setup properly functioning
>> +		 * RDRAND.
> 
> I think this needs another sentence of explanation.
> 
> By the time we can spot the problem, it is too late to take evasive
> action, and there is nothing Xen can do to repair the problem.

Sure, added.

>>   Clear the feature unless force-enabled on the
>> +		 * command line.
>> +		 */
>> +		if (c == &boot_cpu_data &&
>> +		    cpu_has(c, X86_FEATURE_RDRAND) &&
>> +		    !is_forced_cpu_cap(X86_FEATURE_RDRAND)) {
>> +			static const char __initconst text[] =
>> +				"RDRAND may cease to work on this hardware upon resume from S3.\n"
>> +				"Please choose an explicit cpuid={no-}rdrand setting.\n";
>> +
>> +			setup_clear_cpu_cap(X86_FEATURE_RDRAND);
>> +			warning_add(text);
> 
> What do you think to clobbering RDRAND via the CPUMASK registers in this
> case?  We've got full control there, and it would stop PV userspace as well.

Why would such be needed? The host_policy -> pv_max_cpuid_policy
-> recalculate_cpuid_policy() propagation already causes the flag
to get zapped from guest policies once it got cleared here. And
it's the guest policy that controls what gets put in the masking
MSRs for PV guests, isn't it?

>> @@ -498,6 +504,28 @@ void identify_cpu(struct cpuinfo_x86 *c)
>>  	printk("\n");
>>  #endif
>>  
>> +	/*
>> +	 * If RDRAND is available, make an attempt to check that it actually
>> +	 * (still) works.
>> +	 */
> 
> Do you think it would be helpful to test in the opposite case as well. 
> If we come back from S3 and find that RDRAND does actually work, then it
> is safe to tell the user that they can re-enable.

I'd view this as a nice-to-have that isn't all that obvious how to
actually implement in a sufficiently clean way. For example, we
can't use arch_get_random() in that case. Therefore I'd prefer if
this extra courtesy could be left out of here for now, and - if
indeed deemed useful - be added later.

>> +	if (cpu_has(c, X86_FEATURE_RDRAND)) {
>> +		unsigned int prev = 0;
>> +
>> +		for (i = 0; i < 5; ++i)
>> +		{
>> +			unsigned int cur = arch_get_random();
>> +
>> +			if (prev && cur != prev)
>> +				break;
>> +			prev = cur;
>> +			cpu_relax();
> 
> Why the relax?  We're not polling hammering the memory bus waiting for
> an unknown period of time until something changes.
> 
> We simply need up to 5 random numbers as fast as the RNG can produce
> them (which is actually quite slow.  RDRAND has ~350 cycle latency minimum.)

Dropped; I put it there simply to give the hardware some breathing
room between adjacent requests.

Jan

