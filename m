Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDICLklavWkA9QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 15:31:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB52DBD26
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 15:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258077.1552242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3asE-0005VS-6Q; Fri, 20 Mar 2026 14:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258077.1552242; Fri, 20 Mar 2026 14:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3asE-0005Sp-3M; Fri, 20 Mar 2026 14:30:50 +0000
Received: by outflank-mailman (input) for mailman id 1258077;
 Fri, 20 Mar 2026 14:30:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X43w=BU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w3asC-0005Sj-3x
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 14:30:48 +0000
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61d221dc-2469-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 15:30:45 +0100 (CET)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso514536f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 07:30:45 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-146-121.play-internet.pl.
 [109.243.146.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64717e97sm7051545f8f.35.2026.03.20.07.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2026 07:30:44 -0700 (PDT)
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
X-Inumbo-ID: 61d221dc-2469-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774017045; x=1774621845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwgfdF4QVqtMsrH3JfJKyHvtzCZOz5DQUkw+D8MeQeA=;
        b=PLn6s97RY2HxWQLQwHOAXOYKMjhVplpBgLVTrErASqIxl81ZyPVFeRKcWngB7oO/Lt
         8WmlpfhPWv4+aOD47U9/dcKVXzZ6WE83h+Ro+2yvGMQ3/7Qtftmxg4hvklSg/mrOsmOO
         fx83IsHoY0Fbs7ESlFAW8MIFZKJ05ucAoh5ndtYthH0h/bZVAfEE/VZP+uub3xTCxEnv
         zDDbMEUKTVRs771orUErVkCzzk/niW3NIATtcdHa++nvT+fPxNYk5n/AtraqWlIDA5nx
         Ac98acGllaAvMmRjHy91chLvivhxIWJjVnGMcQeJH1g5OKSXDjne4YGFu7Ht7SWxYv1p
         oIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017045; x=1774621845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwgfdF4QVqtMsrH3JfJKyHvtzCZOz5DQUkw+D8MeQeA=;
        b=nuRCJvpI0f1t3WerSQQN89OuP/aFm3vKuYrVjWXdoK4DDi5hveVNFf6pvZKltrISeO
         +mXtlbLoW3t5swdQTa2u7BCqDpgVBntP9wjOGhCnMg+1FsyMGYGQE02DPxc6tcbM0K+h
         pXR9sapo8y8Eo6BoIwPCV2QthugmDqp55LG77v8hla56HVCB0cxUV6m0wKJbkAWytR63
         cj8LMKSjAVoRMlRb8esAPT1e6GGEQTjDKAEcuLluCkJ7zkEpXHVaauIFxplxbnhD3zec
         fdePQT1Yxw2eDuDFZKQPaUf3jTwu0i3FDMcjQB38bzVsKjt3HphAx7Xofo58YMXxZ+tJ
         Duug==
X-Forwarded-Encrypted: i=1; AJvYcCUnoL82iVk35imqk4cyBFOdQDS/1/BnJ4xlU5BMRnnUPMA7LZh+C9n7DLHy/4uTd9lUNNz6nfm/Tm0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXZrFvdTsuyCoQMixulJXxobwhuc+KOGkyMHZPIT1PDlXjlyU2
	s16ACfar9rzxt09yUshkSjbIP/Q+D5lJ2ATspQ8j9sdnJe6VRiYDm5n9
X-Gm-Gg: ATEYQzwMSjUX0tTWtDHu4e/b8rs+A/U/ojcH70dNpyifTVVJ/ZVL1rdFANt8oKldk24
	SBAslEhvXAEkjpzzbMN6Ks1D17mqhoOZ1/rP/YLlTqPcaIQv+UMD/GdeLHqFWtgwtH6tyg3GgW9
	n6jMYcL/KRlnNZJNL+fOZHPilVjrzCGnDbtgXXLvOVm9871S4SWo949KcvRY19NBL5sEvIWCbKD
	mZVfqmR4CNWo7KbXwuYDOSbpVVZqCIQFMJyen2aq/7JXP41L9y/LIPJVhKDgNgCpKu4cUkMXr+H
	wyC+2sExXEw4Z/Exd5k6IHiN+bhuaMGy8gQEPBY5HKXPD53gQw/O10egDcH0NB+ICufzX2HgWaC
	XOWRd6/PJLPdvAQVHAvFlsC9ucp7rdI0I+fh+YdWa6tYZCFO8xHgUMZK6FxfU4i+p81RxxZmOdG
	M0cfIc7Uz6xLuCIo12IyudWxarAe0xGkbh5iK6yVcH/samY/1Ge2SdW5NDe3PMemgesQFKpR2ky
	AYIuw==
X-Received: by 2002:a05:6000:2584:b0:43b:4e01:4aa9 with SMTP id ffacd0b85a97d-43b64242a6emr5920740f8f.10.1774017044866;
        Fri, 20 Mar 2026 07:30:44 -0700 (PDT)
Message-ID: <1b56d49d-f12e-4e6d-ae78-d5d76552297f@gmail.com>
Date: Fri, 20 Mar 2026 15:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
 <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
 <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
 <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
 <ad59c5ea-ae8c-4e6e-8b49-dcd0eefc3197@gmail.com>
 <1efcb5eb-1b59-4def-a527-254a31efe2b7@suse.com>
 <a8e3b6fe-d1cc-44d5-b286-b59b65e25320@gmail.com>
 <92becfa8-1f61-4137-b0ec-ee7160913c5c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <92becfa8-1f61-4137-b0ec-ee7160913c5c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2CEB52DBD26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/26 2:19 PM, Jan Beulich wrote:
> On 20.03.2026 10:58, Oleksii Kurochko wrote:
>> On 3/19/26 8:58 AM, Jan Beulich wrote:
>>> On 17.03.2026 13:49, Oleksii Kurochko wrote:
>>>> On 2/13/26 2:11 PM, Jan Beulich wrote:
>>>>>>>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>>>>>>>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>>>>>>>> +
>>>>>>>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>>>>>>>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
>>>> (cut)
>>>>
>>>>> If all you want are 2Gb guests, why would such guests be 64-bit? And with
>>>>> (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide), perhaps
>>>>> even a 32-bit hypervisor would suffice?
>>>> Btw, shouldn't we look at VPN width?
>>>>
>>>> My understanding is that we should take GUEST_RAM0_BASE as sgfn address
>>>> and then map it to mfn's page (allocated by alloc_domheap_pages())? And then
>>>> repeat this process until we won't map GUEST_RAM0_SIZE.
>>>>
>>>> In this case for RV32 VPN (which is GFN in the current context) is 32-bit
>>>> wide as RV32 supports only Sv32, what is 2^32 - 1, what is almost 4gb.
>>> ??? (IOW - I fear I'm confused enough by the question that I don't know how
>>> to respond.)
>>
>> You mentioned above that:
>>     "... And with (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide) ..."
>>
>> I wanted to clarify why you use PPN here in the context of GUEST_RAM0_BASE definition.
>> (and maybe I just misinterpreted incorrectly your original message)
>> GUEST_RAM0_BASE is the address at which the guest believes RAM starts in its physical
>> address space, i.e. it is a GPA, which is then translated to an MPA.
>>
>>   From the MMU's perspective, the GPA looks like:
>>     VPN[1] | VPN[0] | page_offset   (in Sv32x4 mode)
>>
>> In Sv32x4, the GPA is 34 bits wide (or 22 bits wide in terms of GFNs), and the MPA is
>> also 32 bits wide (or 22 bits wide in terms of PPN).
> 
> You mentioning Sv32x4 may point at part of the problem: For the guest physical
> memory layout (and hence size), paging and hence virtual addresses don't matter
> at all. What matters is what the guest can put in the page table entries it
> writes. Addresses there are represented as PPNs, aren't they? Hence my use of
> that acronym.

That's is what I came to after wrote and sent an e-mail. Now you 
confirmed that.

> 
>> The distinction is not significant in Sv32x4, since PPN width equals VPN width, but
>> in other modes VPN < PPN (in terms of bit width).
>> So when we want to run a guest in Sv39x4 mode and want to give the guest the full
>> Sv39x4 address space, setting GUEST_RAM0_SIZE to the maximum possible value for
>> Sv39x4, shouldn't we look at the VPN width rather than the PPN width?
> 
> No, why? The guest can arrange to map more than 2^39 bytes. Not all at the same
> time, sure, but by suitable switching page tables (or merely entries) around.
> 
Good point. Then the right limit is therefore the PPN width which 
reflects the actual physical addressing capability.

Thanks a lot.

~ Oleksii


