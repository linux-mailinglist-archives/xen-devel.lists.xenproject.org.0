Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D760530241C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 12:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74021.133047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3zkp-0003ay-15; Mon, 25 Jan 2021 11:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74021.133047; Mon, 25 Jan 2021 11:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3zko-0003aZ-U5; Mon, 25 Jan 2021 11:09:54 +0000
Received: by outflank-mailman (input) for mailman id 74021;
 Mon, 25 Jan 2021 11:09:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3zkn-0003aU-8x
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:09:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70082ea4-afad-42c3-8ebc-a18680745a82;
 Mon, 25 Jan 2021 11:09:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89744B8F5;
 Mon, 25 Jan 2021 11:09:51 +0000 (UTC)
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
X-Inumbo-ID: 70082ea4-afad-42c3-8ebc-a18680745a82
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611572991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ROjV2mQJTeGT53+ouaUlkPLW9IdZOeuI2Ik/UaFukPA=;
	b=aea5q/XQBeLP/CJShC9dhievNSRiOuHbDFKBlEr4OwUMJ5SXTvMEovf3gK0dKk6Fm6Cpig
	j+xbT3/0MPXLms/bweklY4V4ErfxQFSSpfZAPDBL4LDV81FRJ/zyIbdn4xvvUeUgjKjQgC
	5KiLrKVq+so+bifouYxPEBeInODFdMI=
Subject: Re: [PATCH 15/17] x86/shadow: drop SH_type_l2h_pae_shadow
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <c412bbe4-d555-7d36-997c-92274679d9ae@suse.com>
 <YArPAicNIR0H5Q0y@deinos.phlegethon.org>
 <c8de294c-ae72-aebf-a893-790c84efdc97@suse.com>
 <YAsvVUUqSQ9bUK32@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <052d05be-2bd8-cf7e-6cdf-1ea3b37719fe@suse.com>
Date: Mon, 25 Jan 2021 12:09:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAsvVUUqSQ9bUK32@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 21:02, Tim Deegan wrote:
> At 17:31 +0100 on 22 Jan (1611336662), Jan Beulich wrote:
>> On 22.01.2021 14:11, Tim Deegan wrote:
>>> At 16:10 +0100 on 14 Jan (1610640627), Jan Beulich wrote:
>>>> hash_{domain,vcpu}_foreach() have a use each of literal 15. It's not
>>>> clear to me what the proper replacement constant would be, as it
>>>> doesn't look as if SH_type_monitor_table was meant.
>>>
>>> Good spot.  I think the '<= 15' should be replaced with '< SH_type_unused'.
>>> It originally matched the callback arrays all being coded as
>>> "static hash_callback_t callbacks[16]".
>>
>> So are you saying this was off by one then prior to this patch
>> (when SH_type_unused was still 17), albeit in apparently a
>> benign way?
> 
> Yes - this assertion is just to catch overruns of the callback table,
> and so it was OK for its limit to be too low.  The new types that were
> added since then are never put in the hash table, so don't trigger
> this assertion.
> 
>> And the comments in sh_remove_write_access(),
>> sh_remove_all_mappings(), sh_remove_shadows(), and
>> sh_reset_l3_up_pointers() are then wrong as well, and would
>> instead better be like in shadow_audit_tables()?
> 
> Yes, it looks like those comments are also out of date where they
> mention 'unused'.

For this, which likely will end up being part of ...

>> Because of this having been benign (due to none of the callback
>> tables specifying non-NULL entries there), wouldn't it make
>> sense to dimension the tables by SH_type_max_shadow + 1 only?
>> Or would you consider this too risky?
> 
> Yes, I think that would be fine, also changing '<= 15' to
> '<= SH_type_max_shadow'.  Maybe add a matching
> ASSERT(t <= SH_type_max_shadow) in shadow_hash_insert as well?

... this, I'll send a patch for 4.16 going beyond the more
immediate one sent, which I'll ask Ian to consider for 4.15
(assuming of course you consider it okay in the first place).

Jan

