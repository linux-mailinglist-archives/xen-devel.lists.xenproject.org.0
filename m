Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKSlGfoC+2kbVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:59:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61014D8397
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301350.1575637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKY6I-0006dT-Uk; Wed, 06 May 2026 08:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301350.1575637; Wed, 06 May 2026 08:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKY6I-0006aV-Ry; Wed, 06 May 2026 08:59:26 +0000
Received: by outflank-mailman (input) for mailman id 1301350;
 Wed, 06 May 2026 08:59:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKY6H-0006aN-L8
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:59:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKY6H-008z7q-1j
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:59:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb02e8-bab6-0a2a0a5309dd-0a2a450791d8-26
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:59:25 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb02ec-229c-0a2a45070019-d155da31c140-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:59:24 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-bc356898256so451185366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 01:59:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc55b17c5e0sm58332766b.11.2026.05.06.01.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 01:59:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778057964; x=1778662764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5XCGPLK5bivVYUwSdUTtTDeIce95c1OMHGCGkwMsMI=;
        b=saQjDVe72bBlLIU6m17zpgDryoEHPT9RnDyGYRizp+1wq9La0uh0vNxnWADWKaTfti
         GOMvh6e+OTeSdyW1yXWOgboqSsFwlWks/tjZ+qZfqi0jX8PoKKrtD2goiy3IKkmHP9pe
         AWygwlbDQdbvzwYhGZx66OElbc9emtJJf+CfvTIUpWpqDNd+Ibp48M/FYMyJXwWWnjIP
         H14uTyfUlHPQpNnP/VEti/tuekxGWwcKW1ZDCE62qQnYQor6Rm40SLAHnCmOWrcmQ+PM
         XvBXnq8SftKEzwqntth+EfPQtkEi33RCvi1bPl3G8+AwzKW877oQpASJ6JOT7ERT6D92
         b5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057964; x=1778662764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5XCGPLK5bivVYUwSdUTtTDeIce95c1OMHGCGkwMsMI=;
        b=hHUsoOpJimTxJFbJSzt0RrafrZ2kMbmJjuH9jf/Zcwe/fAOqb5ppAdyigSAhGiUnWu
         MiSyhUEkdoGmohTq4ylc5kg/ZvZPKl+6WwSd5BCc9ikg62x7C55oRm31gMhthwGoKv60
         FxRUdQHTP9ijFkvVo9jNnLYB6g1nznV8kTl2zK3VINsyTG/TjPLt6662XwDVZVNWHAx8
         /KaP8nTo8vKHPX9cz74wkslfYG05hDp/fEs9+MAW1RApY1wgHIAWfwzeQ8FRx7dkX3uh
         mXL652Cr2zm0eUvRcrXeajrrVmzTSpboQ2ylHqtZrfOhkHFEZr/Z3xfEHMMOoFN4S28q
         fkOg==
X-Forwarded-Encrypted: i=1; AFNElJ/J79GumTv4rH8+pe/msKGc7yZefNX/Y7Vs2EBConYeW60+RZ4kOyCQr1i1mcpg4hj9vYS46PjM9xE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdpLVp8V6jrPM1h/hWzLRU0B2Gl+3sd8ZyRUbgBxyFNCaUa9P7
	guHsAtq2OKEGVAXepOfuBlS0JYkP5auSQobXpDfZHGFeFMnxk4DR8uj+
X-Gm-Gg: AeBDietbljHxph2SXwLp23taF0k6AKEj2PQ8zuho/4zoYEsrW80hinJdTvKHEC4KtZN
	Vzrr1ypSXauf76aSjlpI9kkk6gYNfEx9/DqYJv35vePpsul6qrQK66WUvWtlcI2c0W6clxie3FP
	7lAReQ+Qw3wMANb0SKJYeiaLsgF8LPBC65yY5miZ8FiRDQQjE4h2GHhmdLQdj9DUl8fEWdrojpY
	O0bdk/88es0eyPSqoGS6D6hTKDYhoZCL1EAhWZ0RxJoLz94Iw910jKPUUVTegOZgu5SAkbDlXb6
	e4d3hD53ltxqTOr16mNNMKGqDEl7syU08pFff+Mn3FJp3Dyza10bV7qSHMyHRme8VAwXiAL8bJT
	NuEEKqjR4HXOv0oXZXfx6BPUih6BJ1I5zP0S9pajpjDcnlBKh2QknVkoK6lajGwWx0MNX8lw6kj
	mvJ/GsfJrfVoVvF8FbETz614O1vwuNV9bTsn9J5CsJERbGr61jA90umRG5HKBCxkXCMr9mlT/Mw
	JRXtEVYWdELmw==
X-Received: by 2002:a17:906:4fd0:b0:ba7:f5fd:edd6 with SMTP id a640c23a62f3a-bc56b52facdmr105961166b.10.1778057964147;
        Wed, 06 May 2026 01:59:24 -0700 (PDT)
Message-ID: <e5d60b8f-3ba8-49d9-80b1-0b4ebb0f9296@gmail.com>
Date: Wed, 6 May 2026 10:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>
References: <cover.1777296786.git.oleksii.kurochko@gmail.com>
 <7c91e1a705e1046be4af1c5671a8d91cf3557013.1777296786.git.oleksii.kurochko@gmail.com>
 <5daeb8f7-cf0f-4ea7-a686-93df36b43a30@suse.com>
 <2ec5eec1-0a7d-445f-9d96-99b3070afeb1@gmail.com>
 <8ae99c06-5523-41f6-a34f-d34934e23a39@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8ae99c06-5523-41f6-a34f-d34934e23a39@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778057965-AF374C48-40FC6CA6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2122
X-Rspamd-Queue-Id: C61014D8397
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]



On 5/6/26 10:10 AM, Jan Beulich wrote:
> On 06.05.2026 09:44, Oleksii Kurochko wrote:
>> On 5/4/26 2:21 PM, Jan Beulich wrote:
>>> On 27.04.2026 17:34, Oleksii Kurochko wrote:
>>>> @@ -69,6 +70,14 @@ static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
>>>>        return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
>>>>    }
>>>>    
>>>> +static inline void set_domain_type(struct domain *d, struct kernel_info *kinfo)
>>>
>>> Pointer-to-const for the 2nd parameter?
>>
>> I will apply this comment and comment above.
>>
>>>
>>>> +{
>>>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>>>> +    /* Type must be set before allocate memory */
>>>
>>> This comment would be more prominent if it lived outside of the #ifdef,
>>> perhaps (read on) ahead of the function. I wonder though why it's only
>>> a comment, and not e.g. an assertion. If an assertion was possible to
>>> add, the comment would want to live next to it. Without an assertion
>>> putting it ahead of the function may be better.
>>>
>>> Depending on how far to go, changes could be made while committing, or a
>>> proper v5 may want submitting.
>>
>> I think that instead of comment or just after comment the following
>> could be added:
>>     ASSERT(!domain_tot_pages(d));
>>
>> Jan, Michal, do you see any concern with that ASSERT() or I could add it
>> and keep your Ack-by and R-by.
> 
> I'm okay with it being added, as long as you have made sure that it is
> legitimate to have. IOW (as pointed out numerous times before) you may
> not assert on state that's user/admin controlled, and that isn't covered
> by another, earlier check. In such a case an error would need returning
> instead.

All callers of set_domain_type() are in the domain build path, before 
any memory allocation, so domain_tot_pages(d) being zero at this point 
is an internal code invariant, not user-controlled.

Also, I checked CI and it looks okay except ARM64 randcondig I mentioned 
in xen-devel matrix channel:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2503536959

~ Oleksii

