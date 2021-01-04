Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE34A2E96DF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 15:10:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61237.107566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQYW-0005PD-AA; Mon, 04 Jan 2021 14:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61237.107566; Mon, 04 Jan 2021 14:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQYW-0005Os-7H; Mon, 04 Jan 2021 14:09:56 +0000
Received: by outflank-mailman (input) for mailman id 61237;
 Mon, 04 Jan 2021 14:09:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwQYU-0005On-VJ
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:09:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1149988e-44e5-4242-9154-06df4fb82273;
 Mon, 04 Jan 2021 14:09:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95E3AACAF;
 Mon,  4 Jan 2021 14:09:51 +0000 (UTC)
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
X-Inumbo-ID: 1149988e-44e5-4242-9154-06df4fb82273
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609769391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bblBJJU4wiQUE7NbSJHa9CfvQGx3US1F0oUT9+sLo3E=;
	b=KbL2N1HBWpFjvfccP4jxsMDWKwHyQiXFg7Js7YnnUl6tScLWV+05PWhWnINTs0j2S6Pwpo
	MDru6lKoDOAnQ0IEQQXADhzigmIgrXMKRXiz30sovAna+3QzgdI6rC6Ct9rvoIYUg+X39c
	gv8M6dHof/3g15/iAcQmJDGQXqy/g3g=
Subject: Re: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
 <20201229105116.hfg3mtjzsga7dia3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c1fd6e1-2b20-a2e7-1fad-3216d4ea6b23@suse.com>
Date: Mon, 4 Jan 2021 15:10:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201229105116.hfg3mtjzsga7dia3@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.12.2020 11:51, Roger Pau Monné wrote:
> On Mon, Nov 23, 2020 at 01:40:12PM +0100, Jan Beulich wrote:
>> Use of __acpi_map_table() here was at least close to an abuse already
>> before, but it will now consistently return NULL here. Drop the layering
>> violation and use set_fixmap() directly. Re-use of the ACPI fixmap area
>> is hopefully going to remain "fine" for the time being.
>>
>> Add checks to acpi_enter_sleep(): The vector now needs to be contained
>> within a single page, but the ACPI spec requires 64-byte alignment of
>> FACS anyway. Also bail if no wakeup vector was determined in the first
>> place, in part as preparation for a subsequent relaxation change.
>>
>> Fixes: 1c4aa69ca1e1 ("xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> See below for a comment.

For this please also note ...

>> --- a/xen/arch/x86/acpi/boot.c
>> +++ b/xen/arch/x86/acpi/boot.c
>> @@ -443,6 +443,11 @@ acpi_fadt_parse_sleep_info(struct acpi_t
>>  			"FACS is shorter than ACPI spec allow: %#x",
>>  			facs->length);
>>  
>> +	if (facs_pa % 64)
>> +		printk(KERN_WARNING PREFIX
>> +			"FACS is not 64-byte aligned: %#lx",
>> +			facs_pa);
>> +
>>  	acpi_sinfo.wakeup_vector = facs_pa + 
>>  		offsetof(struct acpi_table_facs, firmware_waking_vector);
>>  	acpi_sinfo.vector_width = 32;

... the printk() getting added here. Violation of the spec here
implies entering S3 may fail because of ...

>> @@ -331,6 +334,12 @@ static long enter_state_helper(void *dat
>>   */
>>  int acpi_enter_sleep(struct xenpf_enter_acpi_sleep *sleep)
>>  {
>> +    if ( sleep->sleep_state == ACPI_STATE_S3 &&
>> +         (!acpi_sinfo.wakeup_vector || !acpi_sinfo.vector_width ||
>> +          (PAGE_OFFSET(acpi_sinfo.wakeup_vector) >
>> +           PAGE_SIZE - acpi_sinfo.vector_width / 8)) )
> 
> Shouldn't this last check better be done in acpi_fadt_parse_sleep_info
> and then avoid setting wakeup_vector in the first place?

... the check you talk about here, albeit these are independent
aspects: The spec requires even more strict alignment, and what
gets checked here is merely a precondition for the specific
implementation of ours, not tolerating the storage for the
vector to cross a page boundary. As such, I consider it more
appropriate for the check to live here, but yes, it could in
principle also be put there.

Jan

