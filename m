Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ0NFqzU02nGmgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 17:43:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B387D3A4D9A
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 17:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274238.1560408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9m6j-0003iG-J9; Mon, 06 Apr 2026 15:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274238.1560408; Mon, 06 Apr 2026 15:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9m6j-0003g5-Ga; Mon, 06 Apr 2026 15:43:21 +0000
Received: by outflank-mailman (input) for mailman id 1274238;
 Mon, 06 Apr 2026 15:43:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w9m6h-0003fz-At
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 15:43:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9m6g-001FUV-8x
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 17:43:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d3d465-2eae-0a2a0a5409dd-0a2a4501e4ba-40
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 17:43:18 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d3d496-6fc9-0a2a45010019-d1558034b4a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 17:43:18 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so15926475e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 08:43:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48899e49229sm98976505e9.15.2026.04.06.08.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 08:43:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775490198; x=1776094998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qp9xvCexd+og9CWs2NBxRDicMXJNAJsIGHdkUhjLJDY=;
        b=ry1H4Ms3BCf3jKsKykgJNYO1kaRN0zv3731TVMf/e2Shf0h1qyATNQOmu45EZSEaMc
         c5FJReCMT8oT/rCDY0DyMvxGEv4WUWSC8FedEKpPh9E393Fdla501CVyaV78CbulF24Q
         EOfq6//3CNguAoUMjDdsT+pl+e/V9Eb/uHL6EUBEb1Pqm+1P0kbOd+3EBneUlaNyC6Hp
         PURocFYe/mPrfjlV0AcNcmyTIzqTqDghx5hKBrr8CMGuVaxDigzdGEv7qdySEBpUJi0D
         MqQq4GS8VKDlVor/fjHkzElfU64dCBqhRtqjHbp9vWsHzqspD2e3RVXRX8281wtBVjgQ
         X+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775490198; x=1776094998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qp9xvCexd+og9CWs2NBxRDicMXJNAJsIGHdkUhjLJDY=;
        b=L4xqivsy5WnYIs8n+/d53SJzWX/fawlat/UtJCJuxFL1BdDZkgkHx86sEjc7QVBX76
         lvL0m3qUYaKL22fx5tHWWc8I9JH+9rw1+5mtciWrTtpHV++je7IeINVWaGWShv+nphLv
         iJwKOY5E40QTfi66XYygTeXrrpGUnKC5B7q0T+7jcXv33Iac55/IeaJaKnsGkwt4DY1+
         Nv5zRwlvUa9upY0UJCMyUGdDp7DrvhCB9LymXqG5s7rM07aeYO9ICncRM1ODAkQFTsax
         J3jqNhKYTlCz6gKYTIfJtGoGnRlj2vGSL4ttrT3Wfyea6x6GgJeY5fGy/c54/FZVGmeC
         XddA==
X-Forwarded-Encrypted: i=1; AJvYcCUCiO/5GWbpje6vUk+29XzLdwV3ns8HwYUxomOUaF+WyR6WoLgMIZJNfw6eVoHDcUsoggeWyJdISU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgmHNCG3emi+G2gq0Q/0/gwkCEmPeKGdvR4OY85WTA5BqeSogS
	K/CvRQJgj1pQoF4aJz3R72mcIYW4Opi4DR2qpzHfAwxLN+3mhEg5g8hE
X-Gm-Gg: AeBDietHCcoFBjv5sR/4UEBIFEyciX/MhPMUz2NgxCdHnqznwX5jQhahL+zC9MuLsce
	7SoXHW3mbkBiAF52xHiUv0bz42Bupi7ywEuVmRszK+r83nv9T8cypx+9NA8MC5XabpU1S5CJreq
	fcUf3bBcSR1QC2568WOHFadljh04QrjReAh5WhopBKKLabeKhbfLNwP8SJ0jA13CPbW3Kc/scLY
	IeOiUfgQgrD7tWRZdUTbn86f2PwJRfluqpz9VPoNpED9mNWmddBHkrPZbCY84GPAnA821sAP5Aw
	z3YI7yNblKJ7eDSOzDrnlKXQoSnmQbUj+mb7FNNt2NkJsoWbxtIEbwhKekbzm2cmfzQ3QtInDh3
	BSwG0HFAfzbjNvC9punXffMtNgPnCtPxxucGLa4hZMO35x8iwbqUH+TAoV1M3c0Wcq9chwD3FXR
	NCEn7DfFE04ThODyCOyVODrj1l/UBbAZxNu0+LmLBxPKMhjz/IeNXjuCsJhx+NYAMXDdEmnQbrU
	fj5jOgyhh8LlQ==
X-Received: by 2002:a05:600c:8599:b0:488:aff1:a7cc with SMTP id 5b1f17b1804b1-488aff1a9ebmr54576975e9.9.1775490197429;
        Mon, 06 Apr 2026 08:43:17 -0700 (PDT)
Message-ID: <912263a2-8dff-414e-bea4-64428ce2ec36@gmail.com>
Date: Mon, 6 Apr 2026 17:43:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
 <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
 <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
 <2bae9e12-8f71-4ff0-b077-bfb4215e5e14@gmail.com>
 <ffd3a7cd-8c47-4a9b-864a-26a053b5b7d2@suse.com>
 <bc5a9826-c1ff-43b2-a3d1-1a4862301aea@gmail.com>
 <0e37083a-42ab-4c99-83fc-b77f519394b9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0e37083a-42ab-4c99-83fc-b77f519394b9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1775490198-156EF185-1987B9D1/10/73395122804
X-purgate-type: spam
X-purgate-size: 2515
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B387D3A4D9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 5:10 PM, Jan Beulich wrote:
> On 01.04.2026 16:53, Oleksii Kurochko wrote:
>>
>>
>> On 4/1/26 4:22 PM, Jan Beulich wrote:
>>> On 01.04.2026 15:57, Oleksii Kurochko wrote:
>>>> On 4/1/26 8:17 AM, Jan Beulich wrote:
>>>>> On 31.03.2026 18:14, Oleksii Kurochko wrote:
>>>>>> On 3/30/26 5:51 PM, Jan Beulich wrote:
>>>>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>>>>> The dom0less solution uses defined RAM banks as compile-time constants,
>>>>>>>> so introduce macros to describe guest RAM banks.
>>>>>>>>
>>>>>>>> The reason for 2 banks is that there is typically always a use case for
>>>>>>>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>>>>>>>> there are other things under 4 GB it can conflict with (interrupt
>>>>>>>> controller, PCI BARs, etc.).
>>>>>>> Fixed layouts like the one you suggest come with (potentially severe)
>>>>>>> downsides. For example, what if more than 2Gb of MMIO space are needed
>>>>>>> for non-64-bit BARs?
>>>>>> It looks where usually RAM on RISC-V boards start, so I expect that 2gb
>>>>>> before RAM start is enough for MMIO space.
>>>>> Likely in the common case. Board designers aren't constrained by this,
>>>>> though (aiui). Whereas you set in stone a single, fixed layout.
>>>>>
>>>>> Arm maintainers - since a similar fixed layout is used there iirc,
>>>>> could you chime in here, please?
>>>>>
>>>>>> Answering your question it will be an issue or it will also use some
>>>>>> space before banks, no?
>>>>> I fear I don't understand what you're trying to tell me.
>>>> I meant that there is also some space between banks and pretty big which
>>>> could be used for MMIO which could be used for non-64-bit BARs.
>>> I don't follow: Bank 0 extends to 4G. There's no space above it, below
>>> bank 1, which could be use for non-64-bit BARs.
>>
>> So we have two banks:
>> bank[0] -> [0x80000000, 0x100000000)
>> bank[1] -> [0x0200000000, 10000000000)
>>
>> So i think we have some space between them [0x100000000, 0x0200000000)
>> -> 4gb to be used for non-64-bit BARs.
> 
> But a non-64-bit BAR need to be assigned an address below 0x100000000?

Right, I had in mind that RV32 uses for guest Sv32x4 which could 
translate 34-bit GPA into 34-bit MPA and automatically applied that to 
32-bit BAR...

I can keep first 4gb for MMIO purpose and start bank[0] at 4gb as 34 MPA 
address space is more then enough to cover reserved 2gb of bank[0] after 
4gb.

~ Oleksii



