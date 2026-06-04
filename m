Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ym/tHvVIIWocCgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 11:44:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFE963EA31
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 11:44:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ron1bsGr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327563.1592398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV4bg-0004Mr-Hv; Thu, 04 Jun 2026 09:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327563.1592398; Thu, 04 Jun 2026 09:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV4bg-0004K6-B9; Thu, 04 Jun 2026 09:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1327563;
 Thu, 04 Jun 2026 09:43:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV4bf-0004K0-Dn
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 09:43:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV4be-009jD4-N3
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 11:43:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2148b2-5cb7-0a2a0a5109dd-0a2a4505a642-10
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 11:43:18 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2148b6-aaa8-0a2a45050019-d1558034d0c7-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 11:43:18 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso5321885e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 02:43:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3529e0sm14937855f8f.28.2026.06.04.02.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 02:43:16 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780566198; x=1781170998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RbOAcJp2nqPFni4qEom1A6eLui9QB8SNcMm42yDoNEU=;
        b=ron1bsGrLcNR7OTHqs8mED9fu5ALQH+5EMdnBhIy2FjczP/cdTIQp1k/Yq9hfJ/gDn
         xlWlDwjEJU68qoZNzq0lAh7cSlC6t/QUjlzVrGqDcONhuoUinVu/fOiOSnw+82dV7U7D
         2zGiAw9LS6lzzNQbM4SCcqWQPZyfRwczO9LLr3n3cWINvqY9VzJ0U+BO4rw/c62ZO3c3
         86YAzmsTV7qK1/aq3ZN/I072zIuSlAKRbOaO8iGEsd1TNXHcNFiUJhm5jDJNuOScSaql
         qUydICnOt8w9mSV9qzpi0SawLl6jl5qnyPzHJlntcBbWwb4bLUfg77ajQHiIdW4exXEP
         vtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780566198; x=1781170998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbOAcJp2nqPFni4qEom1A6eLui9QB8SNcMm42yDoNEU=;
        b=M0AIHfwjgZpe0MVvmtP270jAb237FsBbN4efhSOZi5106/Ap1sY1Jpb3YjA218ilLX
         bK2BWQEchRCQOHxaj9MoXGH56gmQnD11aYHgWQteMseYako1sXVVTZ1AQAG3CP1i1JAl
         3ebO7Xp0v3cBgfISxyXZhqM6iJGNPZDjQ9ZfiPyEcYNP/soDF1OvPLg0tCdWszQBs0zh
         mWwvRIoylB1s5eIuQJOGIj7LfWQSD9/raL+VVc31LoxOdEiMt/RsBahjDQpICIWT6YoS
         egKzDKoQNLD1LsYq9r58PKmjeDvTE65dIrx/cJ2CLtAaeO8lPO0ihYX/0Kzg5xOQGxrf
         M8HA==
X-Forwarded-Encrypted: i=1; AFNElJ8AZwoeygzzlZXPKkPoyVM3lKShq6A9gfJ51tcalieGz8eZmqpdzO2Mk3wfd1+pzrexeAMHdiW67zs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSLtCFy8ciuTufCGrJuO3UOncW6G77ezu9gO/PSrhlWrorV1+7
	e1GuUIeIO4byUKB1P+QGQ0RCdwYrCxKVsYTl97uVf4vuyI3W+L32znSv
X-Gm-Gg: Acq92OFRYNOZDIwMM6+jxQ2su26LaHsCYrU4kIHQkV00MRZ4UW80j5E12mzSmErZBFh
	6g1/IBRvL4YH5b8RM1kC+vGxmo7MwZRK4l50JMUoOarusJCWhEnFTxD5oUMtcX469nI67HSKMh7
	DyiPCK9v3ahhnxuJpsnbtNkS3ZbtpfIk3M6LkgD9/1mYV0CPP9Y/Ks/eW+HG3Rxg8jKZBCFwC3a
	JJmB+9Kp3dW18E0CJN+s9ac6/vZEq9zw59kG1WUvP8vIh6KYanlbEJ9HJ1623SUZmGczh+XnXZV
	inL4g+bdFlD4zRn7vwv5V11LTDKVbhH0opjike8ZUpXhUhFyF0OE7USK22RuC5physp1F1meFUw
	lbxeOQytey9ULupFqnvIjiqoh7AzaYiPBqp7iDKv6X0XgKQjpG3gAHP3MzCS3SeKbE88IBMITYl
	zLljndcykyf7jpBf23nUvhyFpfqiWw13K7LI+ke9Mnm6HUiUprDpbhKIehKg7zhC2EqS5/RQWDC
	uUeyhJSw66urtLP
X-Received: by 2002:a05:600c:3490:b0:48a:7a10:4f17 with SMTP id 5b1f17b1804b1-490b5e732f4mr109464735e9.6.1780566197719;
        Thu, 04 Jun 2026 02:43:17 -0700 (PDT)
Message-ID: <ff4ecb07-7e97-4858-bdec-d85f25ad232d@gmail.com>
Date: Thu, 4 Jun 2026 11:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/page_alloc: verify buddy alignment in
 reserve_offlined_page()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>
References: <cover.1780495548.git.bernhard.kaindl@citrix.com>
 <6eaed95df4e5cb369a91281051ca9b5a2be564f9.1780495548.git.bernhard.kaindl@citrix.com>
 <a78c20d0-e894-467e-9eb8-4486bbdd1ac9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a78c20d0-e894-467e-9eb8-4486bbdd1ac9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780566198-DB36C443-0979016E/10/73395122804
X-purgate-type: spam
X-purgate-size: 2457
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CFE963EA31



On 6/3/26 4:30 PM, Jan Beulich wrote:
> On 03.06.2026 16:17, Bernhard Kaindl wrote:
>> reserve_offlined_page() fails to verify alignment when growing
>> buddies around offlined pages. Consequently, misaligned buddies
>> may be constructed from non-offlined page ranges and returned to
>> the free lists.
>>
>> After a particular sequence of allocations and frees, pages
>> from such a misaligned buddy may be allocated more than once,
>> eventually triggering a Xen BUG() in alloc_heap_pages().
>>
>> Fixes: e4865c2315 ('Page offline support in Xen side')
>> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Oleksii, thoughts towards 4.22?

I've waited for v2 of this patch series to R-Ack, I see patches 
separately but they aren't grouped into one patch series for some reason.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> 
> Jan
> 
>> ---
>> v2:
>> - Updated the title for clarity.
>> - Bugfix isolated from the test case for backporting.
>> - Removed excess parentheses from the alignment check if() expression.
>> - Simplified the alignment check to use '& (1UL << cur_order)'. Because
>>    the covering buddy head is size-aligned, cur_head is also aligned to
>>    cur_order, making this reduction safe (verified against extended tests).
>> - Updated the inline code comment to accurately state that only the upper
>>    half of the next_order range is checked for offlined pages.
>> ---
>>   xen/common/page_alloc.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index 2c4ff2c34c70..2767376a710b 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1202,6 +1202,11 @@ static int reserve_offlined_page(struct page_info *head)
>>               if ( (cur_head + (1 << next_order)) >= (head + ( 1 << head_order)) )
>>                   goto merge;
>>   
>> +            /* Do not grow to next_order if cur_head is not aligned to it. */
>> +            if ( mfn_x(page_to_mfn(cur_head)) & (1UL << cur_order) )
>> +                goto merge;
>> +
>> +            /* Check for offlined pages in upper half of next_order range. */
>>               for ( i = (1 << cur_order), pg = cur_head + (1 << cur_order );
>>                     i < (1 << next_order);
>>                     i++, pg++ )
> 


