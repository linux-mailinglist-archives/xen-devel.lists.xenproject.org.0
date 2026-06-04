Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rlb2HZZLIWrmCgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 11:55:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D193963EB7F
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 11:55:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q1hsVQjJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327593.1592426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV4nJ-0007QQ-0l; Thu, 04 Jun 2026 09:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327593.1592426; Thu, 04 Jun 2026 09:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV4nI-0007Nc-U9; Thu, 04 Jun 2026 09:55:20 +0000
Received: by outflank-mailman (input) for mailman id 1327593;
 Thu, 04 Jun 2026 09:55:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV4nH-0007NW-Gr
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 09:55:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV4nG-009LAl-Ms
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 11:55:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a214b77-2eae-0a2a0a5409dd-0a2a4507d64a-42
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 11:55:18 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a214b86-229c-0a2a45070019-d155da2be115-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 11:55:18 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-bf1cdcfd6deso51194566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 02:55:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf051d82a31sm292292766b.19.2026.06.04.02.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 02:55:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780566918; x=1781171718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3j9V65sqG9VRnw5C+XVKCgGFWn2OCgl6AaD40h7pY8s=;
        b=q1hsVQjJjrEc6Wx/vw+2T1LQXHkQFVL/BLsnmR06Ek0BqCRUFGG+PFP4nk3+AKzMVt
         GwwvvW5U49ruhLKWg+6nF/bxQ8RFBWTE2Uuja5pbEX6AnGGlgu7ydsVVhLfAJ6UAnck6
         l/96+rduzPvx6S1KFg9nJPfTXUFIVMfN/I4sTE6SgJKTBqLyvtHMtQHqMdHhgkSIKoSx
         j+LjyjQo16AxMvVOAfxqT20p2yzH2oOgamSGNF13aUDMCOGqJGMyFuW2us0vOIwSQp2Q
         /FH09HG4h+wGTNN6ifTUoh8ODBrrwvAK2M/ggIi0h6KhEe9nGEAk0sN5smJ5gF3RyNdr
         FUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780566918; x=1781171718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3j9V65sqG9VRnw5C+XVKCgGFWn2OCgl6AaD40h7pY8s=;
        b=CnFPBcM6z3QczwBCuV4a42OQ7E0lq1TJoFGIpx9/25J3P1wrhRuoTY2e3ZScqmt3X/
         ZBQl2gsDjs0TnT6+mj1sA3r00bRoTSlX9UaZfS4tJ/hIyanb1u2lebjWvYkk6LcASQ1l
         13aX+M93krw7wGkPpfwXKVRCJE8DdN0kZRHJt+402JdagYmGl+LRdfHLLf7DnZU1HC1c
         T6iKbdMDMXytLbtIsjR8V4wNngYqcjlYKoME3sNp3jexKFEMbLm5yQAwG3CN+4xWRkUJ
         yl6nWWp7lj9hUlm2sv2W9aHGdBDmexK93uyilat7syiIr3I9JzEN14Ifaeb9dXQUkQme
         Zw4A==
X-Forwarded-Encrypted: i=1; AFNElJ+fDqWV0MsK64VBEVmK2PbUPfjj5/Uz3ipGGxj/1hic+MQ/4Dk1b/RAnNeUQGvMQvdWeQbnjtnYjM0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfXgl6wPZfrFYcbIQgNFZwqa8lF5QymkP6KqMrNz8mAlems4RP
	QN6ZpBrRYlW6PL0mKD11YpJvO10EAO+u6yw6IFPdVIZS96+zQ6VWVuMWKDshtg==
X-Gm-Gg: Acq92OH2kcFX7cFmzktsNcp/cR6qDG9DrqORoPcJNwehLzOWI0+Et069FMZHPPUpNGi
	BD3xjrPG9OSPn1jOUb8u5XSvcJg8op8HGIO+fzGP2rkqUmN8kWJZDI5cW53+N0WOv9ujWu0dSSq
	N/AkLaN/fav/i9QqAv584Rf9RwPQ9/rjCs+ITcNNeumvOg/CFCrJ9s4IJ/a+gbkiR2fDgv+0RfQ
	yp5rEgwRV288GhvOsfrWmtlP0EaUYIppWACbaTnyWJ81Ykr8t0lXUZdeN8iz6X9a1zacycraFPA
	XRQm6jp80jbXWfqslIEGh5zQh0FOToWnqEjmx+cexS27u+5AAuI9nDZs6m7U64uCdxPoe/mKKs9
	lPuX555tpvigURjiiKm+nNYgfImNS3J64qsgr9ps9A3zyCirDCxnq2U1v7NgFe3my1Q/8h0znsC
	GJkFjtAilOLrC2ik1K/xIaJLSBO9In3o268f12+bShc6SyEzeWLG0+WGMSnJNPKbGpFpWP7NYle
	dULCRsRpf55iYGumplxYlxWymg=
X-Received: by 2002:a17:907:160f:b0:bed:25a6:1c89 with SMTP id a640c23a62f3a-bf0ae5f5188mr360349466b.25.1780566917781;
        Thu, 04 Jun 2026 02:55:17 -0700 (PDT)
Message-ID: <b274cb6e-0045-488f-bfd2-211e22dbaae4@gmail.com>
Date: Thu, 4 Jun 2026 11:55:16 +0200
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
X-purgate-ID: tlsNG-ef75cf/1780566918-20563C48-5D510F33/10/73395122804
X-purgate-type: spam
X-purgate-size: 2307
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: D193963EB7F



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

~ Oleksii


