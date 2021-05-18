Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879B63877AB
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 13:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129104.242360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixue-0001Dp-4t; Tue, 18 May 2021 11:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129104.242360; Tue, 18 May 2021 11:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixue-0001By-0V; Tue, 18 May 2021 11:29:24 +0000
Received: by outflank-mailman (input) for mailman id 129104;
 Tue, 18 May 2021 11:29:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lixuc-0001Bq-HQ
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 11:29:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ea88734-0ca4-4121-b0fe-cc4cd09d1d43;
 Tue, 18 May 2021 11:29:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F213BB04F;
 Tue, 18 May 2021 11:29:20 +0000 (UTC)
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
X-Inumbo-ID: 9ea88734-0ca4-4121-b0fe-cc4cd09d1d43
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621337361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QS1dyKvU5PR13HDIroM5cBXtzcLgTIiPnIdw7zsAE+c=;
	b=sWOqAsPaPCBQhsYYvovA3RVHfl/VSu2pX8Q9BDUIetAKgpxANS28QGxUaUZdX+hBXE4lvL
	/ga/GWZfkEWuCC0YUHeqGT4x1uGVlTqyyUSFFrtahtjH/fn3jYtz66SKUriXX+Ybm28JPe
	ADECJkJ+7gEwZpnTwgIvh4tDbY928V8=
Subject: Re: [PATCH v4 03/10] libx86: introduce helper to fetch msr entry
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20210507110422.24608-1-roger.pau@citrix.com>
 <20210507110422.24608-4-roger.pau@citrix.com>
 <035cc783-6083-f141-d4a3-db7a6adc36f5@suse.com>
 <YKOb2hn9XHPGhM5g@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea4477df-9360-7a45-e0b5-2ebc7052b451@suse.com>
Date: Tue, 18 May 2021 13:29:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKOb2hn9XHPGhM5g@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.05.2021 12:50, Roger Pau Monné wrote:
> On Mon, May 17, 2021 at 05:43:33PM +0200, Jan Beulich wrote:
>> On 07.05.2021 13:04, Roger Pau Monne wrote:
>>> @@ -91,6 +91,21 @@ int x86_msr_copy_from_buffer(struct msr_policy *policy,
>>>                               const msr_entry_buffer_t msrs, uint32_t nr_entries,
>>>                               uint32_t *err_msr);
>>>  
>>> +/**
>>> + * Get a MSR entry from a policy object.
>>> + *
>>> + * @param policy      The msr_policy object.
>>> + * @param idx         The index.
>>> + * @returns a pointer to the requested leaf or NULL in case of error.
>>> + *
>>> + * Do not call this function directly and instead use x86_msr_get_entry that
>>> + * will deal with both const and non-const policies returning a pointer with
>>> + * constness matching that of the input.
>>> + */
>>> +const uint64_t *_x86_msr_get_entry(const struct msr_policy *policy,
>>> +                                   uint32_t idx);
>>> +#define x86_msr_get_entry(p, i) \
>>> +    ((__typeof__(&(p)->platform_info.raw))_x86_msr_get_entry(p, i))
>>>  #endif /* !XEN_LIB_X86_MSR_H */
>>
>> Just two nits: I think it would be nice to retain a blank line ahead of
>> the #endif. And here as well as in the CPUID counterpart you introduce,
>> strictly speaking, name space violations (via the leading underscore).
> 
> I guess another option would be to name the function
> x86_msr_get_entry_const, and keep the x86_msr_get_entry macro as-is.
> 
> Does that seem better?

This would be fine with me, as would be a trailing underscore or a
double underscore after e.g. the first name component.

Jan

