Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549FA2C0ED0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 16:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34703.65896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDn7-0008Tk-3H; Mon, 23 Nov 2020 15:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34703.65896; Mon, 23 Nov 2020 15:30:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khDn6-0008TL-Vk; Mon, 23 Nov 2020 15:30:08 +0000
Received: by outflank-mailman (input) for mailman id 34703;
 Mon, 23 Nov 2020 15:30:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khDn5-0008PW-PQ
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:30:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5aef0e5-ecb5-42af-8cfc-c36dde18149d;
 Mon, 23 Nov 2020 15:30:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C92FAFFA;
 Mon, 23 Nov 2020 15:30:06 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khDn5-0008PW-PQ
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 15:30:07 +0000
X-Inumbo-ID: d5aef0e5-ecb5-42af-8cfc-c36dde18149d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d5aef0e5-ecb5-42af-8cfc-c36dde18149d;
	Mon, 23 Nov 2020 15:30:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606145406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+iUpz5dQLBuIyN2tKisN5WrWt6YFNR4JXd+JNMkhks=;
	b=NFkr9zxXBXUqFA42/vKh1+G+0M6+89ryUTlgh501Xys7DhHWj7LgRAxrXMvN/8NONZptmX
	bzJdjSctfRz3BlZwgmG1smbXdOZdeNKydRzyUtU7vY+qM33C51XpAMNUjhbIv67oujsBuK
	zRt/ecBG1+VDUI3bFPc1yrTDpnh7ZAw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0C92FAFFA;
	Mon, 23 Nov 2020 15:30:06 +0000 (UTC)
Subject: Re: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
 <20201123152454.yjr3jgvsyucftrff@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <79776889-c566-5f07-abfe-2cb79cfa78fa@suse.com>
Date: Mon, 23 Nov 2020 16:30:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123152454.yjr3jgvsyucftrff@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.11.2020 16:24, Roger Pau Monné wrote:
> On Mon, Nov 23, 2020 at 01:40:12PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/acpi/power.c
>> +++ b/xen/arch/x86/acpi/power.c
>> @@ -174,17 +174,20 @@ static void acpi_sleep_prepare(u32 state
>>      if ( state != ACPI_STATE_S3 )
>>          return;
>>  
>> -    wakeup_vector_va = __acpi_map_table(
>> -        acpi_sinfo.wakeup_vector, sizeof(uint64_t));
>> -
>>      /* TBoot will set resume vector itself (when it is safe to do so). */
>>      if ( tboot_in_measured_env() )
>>          return;
>>  
>> +    set_fixmap(FIX_ACPI_END, acpi_sinfo.wakeup_vector);
>> +    wakeup_vector_va = fix_to_virt(FIX_ACPI_END) +
>> +                       PAGE_OFFSET(acpi_sinfo.wakeup_vector);
>> +
>>      if ( acpi_sinfo.vector_width == 32 )
>>          *(uint32_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
>>      else
>>          *(uint64_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
>> +
>> +    clear_fixmap(FIX_ACPI_END);
> 
> Why not use vmap here instead of the fixmap?

Considering the S3 path is relatively fragile (as in: we end up
breaking it more often than about anything else) I wanted to
make as little of a change as possible. Hence I decided to stick
to the fixmap use that was (indirectly) used before as well.

Jan

