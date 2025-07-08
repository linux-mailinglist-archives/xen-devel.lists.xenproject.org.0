Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DDAAFBF45
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 02:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035902.1408326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYwPE-0006qX-87; Tue, 08 Jul 2025 00:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035902.1408326; Tue, 08 Jul 2025 00:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYwPE-0006oA-5C; Tue, 08 Jul 2025 00:41:56 +0000
Received: by outflank-mailman (input) for mailman id 1035902;
 Tue, 08 Jul 2025 00:41:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bk39=ZV=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uYwPC-0006o2-RP
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 00:41:55 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5395f7ce-5b94-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 02:41:47 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1751935293059381.52548638991027;
 Mon, 7 Jul 2025 17:41:33 -0700 (PDT)
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
X-Inumbo-ID: 5395f7ce-5b94-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; t=1751935295; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PEbZv/mqNqr94q2/xKmWx+aXU1fYLSIUGVT/vRgvZ/S8qgDiAhbl+MtOs06oTDGcYlvCcNBWVsNI5RQxrzcwpcwcFJ918EPInqpfi8/AMEhK2LadJKkr6u8DNvDWPzfdCD/pEIbbB+ZLwFLwS4vW3L3TBoveZXjPmOnmg62YLNg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751935295; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5OWmvob7MRMFze+zbVVuPlswwn/mvjZxsZ/ylgEvlPY=; 
	b=a7NG49qY1tz368+jmX/FhHwcJsp3D48rWr/kPtXg6ZaNLNcTHRrh1DxzYTS44MgLAq9vK44JcKlT0mjqU9c+/R+/Kqm8bHhztmPv+57vooR4v5RqbpuNkTmpDj6bUp7N7D8Cu1UPB4cmxTxVj5frkAN3H4ShdvZKYdi7TrRJ8ZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751935295;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5OWmvob7MRMFze+zbVVuPlswwn/mvjZxsZ/ylgEvlPY=;
	b=pYcvtAW3h94AJHzx+abheHm9+tnsr1KV/48k5Z7YrHrNbDUwRE7y51YoDTO82cX0
	tPJKhFFgrTrwx1ItCWxMkMzxquNkpHvK4FqyuhMTX5gwJXlB/ei9UT/cbIqyPKFZuTE
	5uSkyNLMTYPlUz8hJqqCzNUi6n3CUscBVu+cJBTI=
Message-ID: <43f7a80a-a0d9-4b34-9a4d-aa3114ebc80e@apertussolutions.com>
Date: Mon, 7 Jul 2025 20:41:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/flask: estimate max sidtable size
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250630085559.554334-1-Sergiy_Kibrik@epam.com>
 <d562251a-a6ec-4e2f-b1f7-dd87a97d4005@suse.com>
 <71ca3126-d311-4ed2-8d6d-3ffcb90a222e@epam.com>
 <65b5f767-5ed3-4a7d-a471-4e3f07a354e7@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <65b5f767-5ed3-4a7d-a471-4e3f07a354e7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/4/25 06:48, Jan Beulich wrote:
> On 04.07.2025 12:10, Sergiy Kibrik wrote:
>> 01.07.25 13:42, Jan Beulich:
>>> On 30.06.2025 10:55, Sergiy Kibrik wrote:
>>>> @@ -54,4 +54,7 @@ $(obj)/policy.bin: FORCE
>>>>    	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
>>>>    	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
>>>>    
>>>> +$(obj)/%/se_limits.h: $(obj)/policy.bin
>>>> +	$(srcdir)/policy/mkselim.sh $^ $@
>>>
>>> Hmm, that's using the built-in policy, isn't it? What if later another
>>> policy is loaded? Wouldn't it be possible to have ...
>>>
>>>> --- a/xen/xsm/flask/ss/sidtab.c
>>>> +++ b/xen/xsm/flask/ss/sidtab.c
>>>> @@ -13,6 +13,7 @@
>>>>    #include "flask.h"
>>>>    #include "security.h"
>>>>    #include "sidtab.h"
>>>> +#include "se_limits.h"
>>>>    
>>>>    #define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
>>>>    
>>>> @@ -228,7 +229,7 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context,
>>>>            if ( sid )
>>>>                goto unlock_out;
>>>>            /* No SID exists for the context.  Allocate a new one. */
>>>> -        if ( s->next_sid == UINT_MAX || s->shutdown )
>>>> +        if ( s->next_sid == SEPOL_SID_LIMIT || s->shutdown )
>>>
>>> ... more than this many SIDs? What if CONFIG_XSM_FLASK_POLICY isn't even set?
>>>
>>
>> It's using a policy from tools/flask/policy, yes. But not a built-in
>> policy, just reusing a bit of code from that code. The idea is that we
>> can have CONFIG_XSM_FLASK_POLICY option disabled yet still be able to
>> calculate SEPOL_SID_LIMIT.
>>
>> As for loading another policy at runtime -- the calculated
>> SEPOL_SID_LIMIT=384 for current master flask policy is still pretty big
>> limit. From what I can see -- much less No. contexts are being used on a
>> running system, because most of calculated combinations of
>> user/role/type are not really usable (e.g. contexts with xen_t or
>> xenboot_t types and user_1 user are not expected etc). So there should
>> be enough room even for more complex custom policies.
> 
> But still there could be odd ones. Imo such a static limit can then only be
> introduced via Kconfig option.

Jan, thank you for adding me on as the CC.

Not having seen the original patch, but based on the discussion, I would 
say this should be a Kconfig option that by default maintains the 
existing bounds/limits allowing for the distro maintainer to impose 
tighter restrictions. Additionally, any there was dynamic allocation, 
this should remain (being the default) and static allocation should only 
happen via Kconfig system.

v/r,
dps


