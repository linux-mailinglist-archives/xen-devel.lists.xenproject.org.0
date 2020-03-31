Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C841994CC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 13:11:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEkp-0005Yp-C5; Tue, 31 Mar 2020 11:08:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJEkn-0005Yi-Fo
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 11:08:21 +0000
X-Inumbo-ID: ee157272-733f-11ea-ba0c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee157272-733f-11ea-ba0c-12813bfff9fa;
 Tue, 31 Mar 2020 11:08:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 043FCAF8F;
 Tue, 31 Mar 2020 11:08:20 +0000 (UTC)
Subject: Re: [PATCH 2/3] xen/x86: ioapic: Rename init_ioapic_mappings() to
 init_ioapic()
To: Julien Grall <julien@xen.org>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-3-julien@xen.org> <20200330103724.GQ28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95b7b860-bb55-d984-2bf9-54c4a481a357@suse.com>
Date: Tue, 31 Mar 2020 13:08:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330103724.GQ28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.03.2020 12:37, Roger Pau Monné wrote:
> On Fri, Mar 27, 2020 at 07:05:45PM +0000, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The function init_ioapic_mappings() is doing more than initialization
>> mappings. It is also initialization the number of IRQs/GSIs supported.
>>
>> So rename the function to init_ioapic(). This will allow us to re-use
>> the name in a follow-up patch.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I've got one comment/request however.
> 
>> ---
>>  xen/arch/x86/apic.c           | 2 +-
>>  xen/arch/x86/io_apic.c        | 2 +-
>>  xen/include/asm-x86/io_apic.h | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
>> index cde67cd87e..c7a54cafc3 100644
>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -978,7 +978,7 @@ __next:
>>          boot_cpu_physical_apicid = get_apic_id();
>>      x86_cpu_to_apicid[0] = get_apic_id();
>>  
>> -    init_ioapic_mappings();
>> +    init_ioapic();
> 
> I would rename this to ioapic_init instead since you are already
> changing it. I usually prefer the subsystem name to be prefixed to the
> action the function performs instead of the other way around.

With this adjustment
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

