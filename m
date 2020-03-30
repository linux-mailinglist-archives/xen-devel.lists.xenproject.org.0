Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA0A197C54
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 14:59:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jItx3-0005LV-K0; Mon, 30 Mar 2020 12:55:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jItx2-0005LQ-5F
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 12:55:36 +0000
X-Inumbo-ID: bed6bbf2-7285-11ea-b9d4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bed6bbf2-7285-11ea-b9d4-12813bfff9fa;
 Mon, 30 Mar 2020 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rNAyH7gwT1vEWBaALtV5a5rOxNnHRajXKf5v3+IuNRI=; b=37WKJ8v/IyOd5xButrEy0KxQL8
 J3myHZ6/5SgQT1YELBe7LJ765phJ7b1eAjHU5Up0z/SDw3RIxIYTPZFCoCOa8VFZAceiEVZ6K9w6R
 jEQhuPj7uk4rcfi9+HXgJRQsxX3Mcz52fK/Qkc7bayBM4wf2gT5I6A9SEQ0C8Ow85PxE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jItwy-00046C-I3; Mon, 30 Mar 2020 12:55:32 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jItwy-0005eq-BF; Mon, 30 Mar 2020 12:55:32 +0000
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-3-julien@xen.org> <20200330103724.GQ28601@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <7d680cef-4f86-86d1-b6a4-46f38f5229dd@xen.org>
Date: Mon, 30 Mar 2020 13:55:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330103724.GQ28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 2/3] xen/x86: ioapic: Rename
 init_ioapic_mappings() to init_ioapic()
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
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 30/03/2020 11:37, Roger Pau Monné wrote:
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
>>   xen/arch/x86/apic.c           | 2 +-
>>   xen/arch/x86/io_apic.c        | 2 +-
>>   xen/include/asm-x86/io_apic.h | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
>> index cde67cd87e..c7a54cafc3 100644
>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -978,7 +978,7 @@ __next:
>>           boot_cpu_physical_apicid = get_apic_id();
>>       x86_cpu_to_apicid[0] = get_apic_id();
>>   
>> -    init_ioapic_mappings();
>> +    init_ioapic();
> 
> I would rename this to ioapic_init instead since you are already
> changing it. I usually prefer the subsystem name to be prefixed to the
> action the function performs instead of the other way around.

I will do it.

Cheers,

-- 
Julien Grall

