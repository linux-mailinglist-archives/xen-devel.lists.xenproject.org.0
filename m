Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1F653FE8B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 14:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343219.568459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyY84-0001ak-O3; Tue, 07 Jun 2022 12:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343219.568459; Tue, 07 Jun 2022 12:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyY84-0001Yy-L3; Tue, 07 Jun 2022 12:16:12 +0000
Received: by outflank-mailman (input) for mailman id 343219;
 Tue, 07 Jun 2022 12:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dSew=WO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nyY83-0001Ys-Q3
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 12:16:11 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cfb4696-e65b-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 14:16:10 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654604158771316.67427795343394;
 Tue, 7 Jun 2022 05:15:58 -0700 (PDT)
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
X-Inumbo-ID: 9cfb4696-e65b-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; t=1654604165; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ggJv8rlHPL9u04m2KPPkaH+voFIJIw6qfNNHk5w0n8a9cg5m6z040O1FrxStQ27jH0ozJSFJ5ANG8XMVkFRhwDMxjbdIBWn+G1Rkh8mDXz/e+MlLVuEAO8sSNDfy9uCgdh6pvOvqkHOPkKpigHFnFOGcgcdQMsmDKKvhp7vI8+Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654604165; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=EkEJdzTn5wsupDMSIaSNG6LmQ+ASAiYE6Uzwve0WIJE=; 
	b=jWr599UIyhQbZ8Q8Q8Bt9FmrxG4SrN1RAZvgkDiiEolmp0pW+uHFYkCKqlVjnu4Uvox66ch1GJnhPKGR37hJcHlCQLXxuYdC67MtZGhoEhZymVKLYhaIM2HbyvcO2MsHHTdCFHuXaOiuKPELf9Bx4yynOV5SLsfkcyL6kuLec0w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654604165;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EkEJdzTn5wsupDMSIaSNG6LmQ+ASAiYE6Uzwve0WIJE=;
	b=c4gCprB/pMp792NIlbB5zJnJg8pMmFU/48HiAfmjWo/NF26NTkLgQp73xkxI/1Oo
	SlKFVbWXO6A4CyVtF52G0Cd1cs+DD5IZvkulGnU0N94xyFozfOi0rl4baIHWBwvcfyL
	gIkDBE+AcCSJVjeoaWLrQajMj9/x1M7nOM17cokU=
Message-ID: <a1f633c1-f494-e59d-d5eb-f84c478e5b53@apertussolutions.com>
Date: Tue, 7 Jun 2022 08:14:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-4-dpsmith@apertussolutions.com>
 <e7582bd3-1a3b-49e9-7d3f-f86ae3d4ab2b@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 3/3] xsm: properly handle error from XSM init
In-Reply-To: <e7582bd3-1a3b-49e9-7d3f-f86ae3d4ab2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 6/1/22 02:14, Jan Beulich wrote:
> On 31.05.2022 17:08, Daniel P. Smith wrote:
>> @@ -1690,7 +1691,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>  
>>      open_softirq(NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ, new_tlbflush_clock_period);
>>  
>> -    if ( opt_watchdog ) 
>> +    if ( opt_watchdog )
>>          nmi_watchdog = NMI_LOCAL_APIC;
>>  
>>      find_smp_config();
> 
> Please omit formatting changes to entirely unrelated pieces of code.

Ack. this was in simliar vein of the other patches where I cleaned
nearby trailing space.

>> @@ -1700,7 +1701,11 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>>                                    RANGESETF_prettyprint_hex);
>>  
>> -    xsm_multiboot_init(module_map, mbi);
>> +    if ( xsm_multiboot_init(module_map, mbi) )
>> +        warning_add("WARNING: XSM failed to initialize.\n"
>> +                    "This has implications on the security of the system,\n"
>> +                    "as uncontrolled communications between trusted and\n"
>> +                    "untrusted domains may occur.\n");
> 
> Uncontrolled communication isn't the only thing that could occur, aiui.
> So at the very least "e.g." or some such would want adding imo.

Agreed, this was a reuse of the existing message and honestly I would
like to believe this was the original author's attempt at brevity versus
writing a detailed message of every implication to the security of the
system.

> Now that return values are checked, I think that in addition to what
> you already do the two function declarations may want decorating with
> __must_check.

Understood but likely not necessary based on Andy's review suggestion to
move these functions to void.

v/r,
dps

