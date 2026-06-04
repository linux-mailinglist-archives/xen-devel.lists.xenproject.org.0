Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ujD+CfJIIWobCgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 11:44:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E263EA2E
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 11:44:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kFLMSx5Y;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327567.1592408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV4cB-0004kd-Ma; Thu, 04 Jun 2026 09:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327567.1592408; Thu, 04 Jun 2026 09:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV4cB-0004iB-Jk; Thu, 04 Jun 2026 09:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1327567;
 Thu, 04 Jun 2026 09:43:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV4cA-0004i2-Go
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 09:43:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV4c9-009jPU-Tq
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 11:43:49 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2148b6-e002-0a2a0a5209dd-0a2a45018420-36
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 11:43:49 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2148d5-c1f2-0a2a45010019-d1558031a531-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 11:43:49 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so3926545e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 02:43:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda363bsm2180639f8f.31.2026.06.04.02.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 02:43:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780566229; x=1781171029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsQduqihCW9isuZ/5cHmEh+xC5U5FNEQ67jyZWEZpVE=;
        b=kFLMSx5Yd62A5tBWcuIOgZ7VVpwuBvvg+5eBLqq/6QeQAJOkAVNwobIhF86iHixk3R
         I8igTv3UTjsZSVBzZ00LNqntz/bQb/jLOfjupw/gkxJRGQ8nFHChETuFby0w8k7Wgum9
         p2VYst0gHy+wvLxOdWC6yQueE2R5/xxeVpsfTfEaOKGjeT+aYQHvH1CoED9budP30DH8
         rE8pLMR6GKdlUAuR5Gf9zw6/5uE5n5vI9K8JOIaYwpI0MvaSqbM4mCuaTz+FtR3+8cTd
         4q9ar0odFkzN9MKu6+4gaGxiVwRQy7WOyuV8Gpkixs9gV/i92X7Rw0Ri5xJwOTeTIVDi
         O8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780566229; x=1781171029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsQduqihCW9isuZ/5cHmEh+xC5U5FNEQ67jyZWEZpVE=;
        b=WnQHre27/DJ33hFtOin2i2BsSvLmP/7lm70qD7vg1gQHxW2Tq+RARAurAkUm1a23kS
         FYzVJRqhbxqh6SWLie7s9wR1NyxcM7Cd4/QLBrS/FyZMqQ7dhPrardKARbFVK3LvAB4w
         TGNNThh5izxwLfDI3uqr+jXxSkwDcY6QRf031P7fjEkzwzJnRp+B60OofF5fGhv9v4Dt
         HwYMWK353cNtb2JPE14FytqyI95pJHC2X0Sphv0XSHtEXiG6HHOFUgvgWzeMVcgOKGBR
         W3UTTI3qLCtPMqAu7h+Asst2inKxbSGtEejYBw85XgV5W+SNLqDFC1a3iuKqCfcFJJ8b
         5G9g==
X-Forwarded-Encrypted: i=1; AFNElJ/30ljyqBDd4Q3O4xl8ORmvlLvy0NMYjtJwiBkZ6Ezqpn8K58Vna1+Msu//KNHNheV8NVJrra5oCKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxgrF0oUl1f9aVX575XB+sRAGBybTfn1opiq+38YN8f09IWNvg
	szrRX10i5wouOXEnLgCzwgxIEPzlBKBthHClXk1N3UidVOIwhUFgm37m
X-Gm-Gg: Acq92OESk3tyDA+ME9qZlQO3YvOde3PnSGoOENqTwoc54eAtUtLra/Jkve/LImLn7N2
	jqKoBgJ3RwzABLHWcPbA/hIeJuvqddFojudCp4/ar+oxMKv5eD4rJdnW83eRVISbASVZWjWmusN
	snqzy4ZcdY+Q/igT9ysEWuk2CU2AaGGERO6+Y7j7M/GuTqSuTqrhifVlc52KbPdvW5uC7shfubT
	iu/LoVzdlppPx8fAS+KIhwD42fVAT0iAXFtwFz4NSfii6eg2HahWBwmumlW9yuP8t2+Jet/ldxQ
	eRltM0qu+fscPoA8jwMPXV75wjKfKJ+yYoaqnoQrM+U71yvI6s70X0yHMzwflAYdBajXLKAwgM7
	X6uRtNq8cjnDcjPatQyysaVMrWRyyYyatghn4Kcx3muMmjLNitBFinM6IuBQ2Yz9ismszr/znF6
	3U2Mg3TtUSljVR55eiaFpAo9oZPjMKPcQSQRoS5zE0U1s9ztAqsm4hfNWjONtKUInTLivAUG5zv
	G+PtqUpZrhMZjTE
X-Received: by 2002:a05:600c:4c19:b0:48a:5236:7f38 with SMTP id 5b1f17b1804b1-490bc5166a0mr26221185e9.14.1780566228918;
        Thu, 04 Jun 2026 02:43:48 -0700 (PDT)
Message-ID: <85270d7d-d374-4d31-ac88-d6d9aed397c9@gmail.com>
Date: Thu, 4 Jun 2026 11:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/mm: Fix off-by-one preventing tail merge in
 reserve_offlined_page()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1780496798.git.bernhard.kaindl@citrix.com>
 <f2ed440fa3d2ca62c77868a60061168630d9fb6d.1780496798.git.bernhard.kaindl@citrix.com>
 <3f81a6e6-0c14-42de-9386-7820e68b16c8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3f81a6e6-0c14-42de-9386-7820e68b16c8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1780566229-B7957FF4-F6C8F6B2/10/73395122804
X-purgate-type: spam
X-purgate-size: 2322
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 730E263EA2E



On 6/3/26 4:33 PM, Jan Beulich wrote:
> On 03.06.2026 16:27, Bernhard Kaindl wrote:
>> reserve_offlined_page() reserves pages marked for offlining and
>> returns free buddies from the remaining healthy tail pages back
>> to the free list.
>>
>> Consider an order-2 buddy (4 pages) with the following layout:
>> +---------------+---------------+---------------+---------------+
>> | head page       tail page 1,    tail page 2     tail page 3   |
>> | PFN_ORDER(pg)   marked as to                                  |
>> | == 2            be offlined                                   |
>> +---------------+---------------+---------------+---------------+
>>
>> The expected result after removing tail page 1 and returning the
>> remaining healthy pages to the free list would be:
>>
>> +---------------+               +---------------+---------------+
>> | single page   | offlined page | head page       tail page     |
>> | PFN_ORDER(pg) | not returned  | PFN_ORDER(pg)                 |
>> | == 0          | to the heap   | == 1                          |
>> +---------------+               +---------------+---------------+
>>
>> A trivial off-by-one error in the growth loop stops the growth loop
>> early before the tail end of the original buddy and we end up with:
>>
>> +---------------+               +---------------+---------------+
>> | single page   | offlined page | single page   | single page   |
>> | PFN_ORDER(pg) | not returned  | PFN_ORDER(pg) | PFN_ORDER(pg) |
>> | == 0          | to the heap   | == 0          | == 0          |
>> +---------------+               +---------------+---------------+
>>
>> If the offlined page was in a much larger buddy, this would lead
>> to much more memory not available for higher order allocations
>> requiring the full tail end of the original buddy for allocation.
>>
>> Fix the growth loop to correctly grow the buddy to the tail end
>> to make the full allocation unit available for future allocation.
>>
>> Fixes: e4865c2315 ('Page offline support in Xen side')
>> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Oleksii, same question again here.
> 


Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


