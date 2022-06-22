Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362BD55459F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 13:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353785.580770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3yEe-00079b-5w; Wed, 22 Jun 2022 11:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353785.580770; Wed, 22 Jun 2022 11:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3yEe-000774-1t; Wed, 22 Jun 2022 11:09:24 +0000
Received: by outflank-mailman (input) for mailman id 353785;
 Wed, 22 Jun 2022 11:09:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/ZK=W5=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3yEc-00076y-Gw
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 11:09:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c33dca3b-f21b-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 13:09:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D71013D5;
 Wed, 22 Jun 2022 04:09:19 -0700 (PDT)
Received: from [10.57.38.102] (unknown [10.57.38.102])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 658DB3F66F;
 Wed, 22 Jun 2022 04:09:18 -0700 (PDT)
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
X-Inumbo-ID: c33dca3b-f21b-11ec-b725-ed86ccbb4733
Message-ID: <b8510774-f000-8b66-ebab-4286567f7747@arm.com>
Date: Wed, 22 Jun 2022 13:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 9/9] drivers/acpi: Use explicitly specified types
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-10-michal.orzel@arm.com>
 <155d8f62-aece-8fb8-8be2-6d21d20926d7@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <155d8f62-aece-8fb8-8be2-6d21d20926d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22.06.2022 12:36, Jan Beulich wrote:
> On 20.06.2022 09:02, Michal Orzel wrote:
>> According to MISRA C 2012 Rule 8.1, types shall be explicitly
>> specified. Fix all the findings reported by cppcheck with misra addon
>> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>> This patch may not be applicable as these files come from Linux.
> 
> We've diverged quite far, so the Linux origin isn't really a concern
> (anymore).
> 
Ok.
>> --- a/xen/drivers/acpi/tables/tbfadt.c
>> +++ b/xen/drivers/acpi/tables/tbfadt.c
>> @@ -235,7 +235,7 @@ void __init acpi_tb_create_local_fadt(struct acpi_table_header *table, u32 lengt
>>  		ACPI_WARNING((AE_INFO,
>>  			      "FADT (revision %u) is longer than ACPI 5.0 version,"
>>  			      " truncating length %u to %zu",
>> -			      table->revision, (unsigned)length,
>> +			      table->revision, (unsigned int)length,
> 
> Since we generally try to avoid casts where not needed - did you consider
> dropping the cast here instead of fiddling with it? Aiui this wouldn't be
> a problem since we assume sizeof(int) >= 4 and since types more narrow
> than int would be converted to int (which in turn is generally printing
> okay with %u). Strictly speaking it would want to be PRIu32 ...
> 
The reason I did not consider it was to make the review process easier by performing only
the mechanical change being part of fixing 8.1 rule. However I'm fully ok to drop the cast.

Changing the format specifier to PRIu32 for length would require using PRIu8 for table->revision
to be coherent.

>> --- a/xen/drivers/acpi/tables/tbutils.c
>> +++ b/xen/drivers/acpi/tables/tbutils.c
>> @@ -481,7 +481,7 @@ acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags)
>>  			if (ACPI_FAILURE(status)) {
>>  				ACPI_WARNING((AE_INFO,
>>  					      "Truncating %u table entries!",
>> -					      (unsigned)
>> +					      (unsigned int)
>>  					      (acpi_gbl_root_table_list.size -
>>  					       acpi_gbl_root_table_list.
>>  					       count)));
> 
> Same here then, except PRIu32 wouldn't be correct to use in this case.
> 
Why is it so given that both size and count are of type u32?

> Jan

Cheers,
Michal

