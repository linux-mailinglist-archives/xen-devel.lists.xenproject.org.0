Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBGVO4ME5mkJqgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 12:48:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A242990E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 12:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285667.1566787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEmAN-0005dz-HY; Mon, 20 Apr 2026 10:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285667.1566787; Mon, 20 Apr 2026 10:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEmAN-0005bc-Eq; Mon, 20 Apr 2026 10:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1285667;
 Mon, 20 Apr 2026 10:47:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEmAL-0005bV-Hs
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 10:47:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEmAK-00HXRL-Fp
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 12:47:44 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e60446-e002-0a2a0a5209dd-0a2a4506cea2-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 12:47:44 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e60450-7371-0a2a45060019-d1558035cd91-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 12:47:44 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso30702775e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 03:47:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7b2803sm87799535e9.27.2026.04.20.03.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 03:47:43 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776682064; x=1777286864; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eBk6RUWWRHLEWMddUcOKpPdnDrjhxsPfqVLTl6Z4wQg=;
        b=T6RS56E49oclLH3GcD2mhI27NwfqbQwVvGnTVWGTjk3k94mBk7haYm8v8WwJx3GKy9
         jrRFDe162bBIg3BlERUsBQctPuDbO3kdOzb/L3OYsyi5y91usvvwMZNlnti2vC6Mu1uU
         C4mPTu25h1zNxyGnPbJkR0Lw7kh1+CzpJ8gcOdlgkVA3HGWD0wO2sYYljaJMl9iYytkp
         H7VvDwNF+GTfNFF85f7UXFbY6O8BXHrFKpGwRLD/wUa4jBxazSFR4hHviNOZNaDq+Ncv
         Ti2613azSjVq7AWcjxbfqsBo0JhjhH1RgtX/rERuXoLtvW+RJP4GhWSTKAE8zV/QasWB
         u0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776682064; x=1777286864;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBk6RUWWRHLEWMddUcOKpPdnDrjhxsPfqVLTl6Z4wQg=;
        b=G7mgOG1p4k1s3mVjFMTCnIJuZK41lb7CX3GYVZ3IH5P9bispebK0ITvYmriKqsSo9E
         jl1X6H7BGIfeY62ugBuagAZmgLmAudth3waBUnW4xQnyvVBMINJkuD1C4db7HGIILwDd
         dR6cMCWi71OI1Zasv0uFaklVwlSunnbizkJMugEY7ZLquFZHV50VxgAEQyI56GQysapw
         LZQKofCzTPEttis8Tw/hjF0hW5BPDmz6+lyB9mIu9x9dtLvTVpgHon5zOY0ZEmGq0gPa
         kCf1st4RGDDce3zPFTs+hIHOFqdKycxQ7fyo69s71W8EeJIlxVtB9pziR6V0be86OstH
         7Iog==
X-Forwarded-Encrypted: i=1; AFNElJ8ue3esRzhZywha5XMes9eFFGYS02pOMa4lUxIIXE9Ro/19skz9KEYUD9Pi3Tik9locxTGEOD3YW8Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzi4LoY+sg4yrOQcJfAzJ7WYfwi08zqq5XWgLVP9AtraaSErHX4
	jhvgI7sgwxyP1vEhhg3Yp1u41Ar46QQ3nnFPYdk4OdQK/wp3supfmvOngxFiav/k9w==
X-Gm-Gg: AeBDievMwCGnqT6uVJn2fuoAYfhxzVzfGkZtFCosCY+4qUlObGD5jCl0h2nYl3FAYTJ
	MkwxBOR9sBgmxi/ha4UqdRt2P/FiN/3Ledf0VtJbm8UFUNq5Bwf5Q0peDtrhknknQ/uP4HY7JRP
	N2K2W+SLv9/QlIrcqtIG5COkcW8DazdY3uTOlv1K3wOXlcWLp8x1dqKzxQ1M87tk90qriqse/Nf
	F2WeXtKDx2nSXXWFm5RQ2Pu+61ULuvgOMRhSsdpkynMWWrdBFXAAnURiPQ85o4eO1gYyl80AwtP
	KJbGj+7FFAWwa3OOogAEIXKiGmOffKgvzxdaYXtIOK6sc67OyAsEZRe1Eo6Q2zH+w+QBwEo52gW
	X+m6dcq+LaDWQr0K2fFbygVH/nwRQrX2rT+pQuAV89Y0pKNXu4C+4KeI5+6F9abTEPKRT8x9oE5
	bsR2TPJf/hAz5SJZcyJPOiE9EkBsrlpiM/lXJAKULVRrkW7/J/6e0AqLSLxzeeq0lEBB2v6Okt/
	aMLhdwSxNSvdggSg9GHnY3gtMVYEbQWQ4on
X-Received: by 2002:a05:600c:5246:b0:488:a639:b787 with SMTP id 5b1f17b1804b1-488fb74fc0dmr191835225e9.11.1776682063502;
        Mon, 20 Apr 2026 03:47:43 -0700 (PDT)
Message-ID: <285f231b-a16f-4eb3-9c84-cbdfc336eab6@suse.com>
Date: Mon, 20 Apr 2026 12:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/27] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <e8bcf5618a19fb44d4391410f2f67ffd98a96647.1773157782.git.oleksii.kurochko@gmail.com>
 <44cb3124-8972-4a0c-b785-64f2022f178b@suse.com>
 <a324161d-f8b4-47fe-b5ac-52df6060e45b@gmail.com>
 <da07da74-220a-4dbb-84fc-2e7aeb6b19df@suse.com>
 <c6bef180-5d54-4527-94ca-20ed9729d475@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <c6bef180-5d54-4527-94ca-20ed9729d475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776682064-91985D75-80A83D7F/0/0
X-purgate-type: clean
X-purgate-size: 1966
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 659A242990E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.04.2026 12:25, Oleksii Kurochko wrote:
> On 4/16/26 2:42 PM, Jan Beulich wrote:
>> On 14.04.2026 12:27, Oleksii Kurochko wrote:
>>> On 4/2/26 1:58 PM, Jan Beulich wrote:
>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>> @@ -47,6 +48,19 @@ struct intc_hw_operations {
>>>>>                                const struct dt_device_node *intc);
>>>>>    };
>>>>> +
>>>>> +struct vintc {
>>>>> +    const struct intc_info *info;
>>>>
>>>> Isn't this referencing a physical INTC's structure? Why would the virtual
>>>> one's properties have to match that of the physical one?
>>>
>>> It is because of how vAPLIC emulation load and store is working.
>>
>> Thank you very much. This fully explains things, the more that of course
>> emulation of loads and stores comes earlier in this series. Oleksii,
>> really, please.
> 
> Sorry for that. Let me add some extra details where I think that pointer 
> to physical APLIC regs are needed.
> 
> When APLIC tries to access TARGET register it is necessary to update 
> real APLIC as inside this register it is coded information about Hart 
> index, Guest Index (guest interrupt file id) and EIID (External 
> Interrupt Identity). So to do that vintc should have access to physical 
> APLIC registers.
> 
> The similar things I expected to be with some of other register, for 
> example, that one which are stands for turning on/of interrupts (SETIE, 
> CLRIE). If vAPLIC is requesting an enablement of an interrupt then I 
> expect that correspondent physical APLIC register should be updated too 
> as otherwise how then device interrupt will start to occur. So again it
> is needed a pointer to physical APLIC to access these registers.
> 
> Does it make sense at least a little bit now?

Yes. Just that there's a "but": I can't spot any use of the field in this
patch. Hence I still can't say whether I actually agree. Introduce the
field when it's actually needed?

Jan

