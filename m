Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDgCOn6Ac2ncwwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 15:06:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A2F76ACE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 15:06:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212296.1523527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjHnJ-0007dn-OC; Fri, 23 Jan 2026 14:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212296.1523527; Fri, 23 Jan 2026 14:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjHnJ-0007bA-Kk; Fri, 23 Jan 2026 14:05:49 +0000
Received: by outflank-mailman (input) for mailman id 1212296;
 Fri, 23 Jan 2026 14:05:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vjHnI-0007b4-FS
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 14:05:48 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d30e8f7-f864-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 15:05:46 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso25989655e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Jan 2026 06:05:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d84588fsm60601255e9.2.2026.01.23.06.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 06:05:45 -0800 (PST)
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
X-Inumbo-ID: 9d30e8f7-f864-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769177146; x=1769781946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwj9MUYMGKw0NGDt0d9VtkRjNnHxjHBhx+jYG4Q/qHc=;
        b=KjV2RLV9dDwLMR1pwR1yDl5jiKV8HVsMq0nS2fDTja9GkAXwc6+fPQTqVDK3wQeTPJ
         CeRIGCx71dQ6g+UnkKs+Iuj4jAjkP65lp4bx1zIfwTrEQUIyclU9SbYZRvDt6syyHTcF
         LcpaO1oO3vA0Dm13D64yp31jkb05Y1GFfy1cD969VaGvX7EQHtw9JPK2ZTT68LvAYQn+
         QAlqhrQsVn/W0zK7HSm5V1A95G1Nf7FSyMKsoGXxxzQDyQF0ps4+ZluFKIbuD9LnvO1V
         oFt16Y05Z2ayMGxzWE5u0CkICWqMGVqDRnrIMOMFLpPS6h7fHPa+GKyNahO5H/WR0OR2
         2upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769177146; x=1769781946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwj9MUYMGKw0NGDt0d9VtkRjNnHxjHBhx+jYG4Q/qHc=;
        b=h2AdNCFK2DFbXDfy2CIedRh+NM4ssauvYaRz61h8H01YQQaBlnBDY+bJ7H9vgQSrHa
         nxMHPxdvbXutWGPvTBMKXzAjyUk1qE/BRGeQkcoyVnDoH3/XD7pvy2vyLi6KTg87IOEM
         t9ENxuWz+rFpZZCvPbkN1+NKVBpGfZoHjgCBAXT8tJh22Y0m0LdzMHbr3VlzV6JaxURt
         hzR/mFlGHVx/KGzNeIf8dHEsE02ntLq4JJzLr6wK2/l/+aXV6Ht7X7zCM6WcQ+h++OLT
         ovuaLxccel/xbs3gUt/L4dei2DBmEY5CQLDDXYwlUbuxa/MK1jkaxv4nTjibcgHv/9mb
         j84g==
X-Forwarded-Encrypted: i=1; AJvYcCXfUsyNuMnJQqtaP4BvCf3RHlVrCYHV32V88ipLpAg9xeiDpWYUzFo6FbIVon9BB0sT6by666DDOHU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVFdWoctLv11Km1S4knB8i7dcCtrj6aYQDx1wdZ1tofTfg/NDe
	jFZVpqjyESTfss8KVtU+xqMkD+a/j8xaeTm4dD6RWJNhnl+oy20D6saK4IN/f8VRCw==
X-Gm-Gg: AZuq6aJ4LI+l4V2yM4+zeQYOcWFzKQoFxWtolP79os6tInbSuxLTb7va9x31paLPIda
	V+IMhdTUgWuphWOYJNUlL9EMLPxUR4rlXUT5cTALV4L8nCSvfC/JXVGDzpEyw/6bJsqbi63vgjE
	0uUnUDiWPuCfaFPXoBQTWDXEYoI88X2N7UZ0Xu2WJ9wIkbI/Nid2MAh0aK1Nwt7t8t7RALBRvaS
	wwBnDhHXWkIyoaO+Rx9DdewqqZcu4llBwwf1D0Th98FaDWwBdFvEnB2x/rrvJwuD9SuKrTvm8Em
	GcTsEGg0FRYQLK2gjk3zW3TMWLJDrPaP3a6Y98BG3vLqstSwjvfaNNc8f4IJW2Nuk8dWIgYMGUu
	RWiS8+++KZcTSM8uGxEnbvH8RnOHJLq/gLCNuuVkdRe7llZLWGywTH0I/8YuO/GLEOFosqpHwkX
	tzhy1Rz3AGu4SqKvmAbQbpz4a+MNPNR1zHU9DTq5saMza+kc7vcGmyTy3UAQYKEl+6lz1HsjBLz
	v8=
X-Received: by 2002:a05:600c:5494:b0:480:1e9e:f9d with SMTP id 5b1f17b1804b1-4804c94810fmr48857995e9.8.1769177146162;
        Fri, 23 Jan 2026 06:05:46 -0800 (PST)
Message-ID: <c7b98309-849f-4a8f-8898-7e7c0dfd04a5@suse.com>
Date: Fri, 23 Jan 2026 15:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] x86: Drop cross-vendor support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com>
 <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
 <26c416ea-1c4b-464a-bcb9-d34f0600eaac@vates.tech>
 <DFVYHZSG5YAX.3U4HA3MGMT19C@amd.com>
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
In-Reply-To: <DFVYHZSG5YAX.3U4HA3MGMT19C@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,amd.com,vates.tech,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.935];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 48A2F76ACE
X-Rspamd-Action: no action

On 23.01.2026 13:10, Alejandro Vallejo wrote:
> On Thu Jan 22, 2026 at 7:16 PM CET, Teddy Astie wrote:
>> Le 22/01/2026 à 18:44, Alejandro Vallejo a écrit :
>>> On Thu Jan 22, 2026 at 6:10 PM CET, Andrew Cooper wrote:
>>>> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>>>>> Open question unrelated to the series: Does it make sense to conditionalise the
>>>>> MSR handlers for non intercepted MSRs on HVM_FEP?
>>>>
>>>> I'm not quite sure what you're asking here.
>>>>
>>>> ~Andrew
>>>
>>> The handlers for LSTAR and the like are dead code with !CONFIG_HVM_FEP as far
>>> as I can tell. The question I'm asking is whether there is another code path
>>> that might invoke MSR handlers for non-intercepted MSRs. I can't see it, but
>>> I'm not sure.
>>>
>>> If there isn't I'm considering (conditionally) getting rid of them.
>>>
>>
>> I think you can enter this path by making the guest execute directly or 
>> indirectly a rdmsr in a emulated path (there are some cases like certain 
>> cases of real mode or maybe vm introspection). I don't think that FEP is 
>> the only way to do that.
> 
> For the emulation path, I think HVM_FEP is the only means to trigger it, as
> neither {rd,wr}msr access memory. VMI (as you mention) and nSVM (as Andrew did)
> do make sense, but I don't see any others. I don't see how real mode could cause
> anything (I'm fuzzy on VMX, but I _think_ instructions do execute, just in
> a weird paging-on mode akin to v8086).

Iirc there's still the situation where for PAE shadow code tries to emulate up
to 4 insns in a row, in the hope to find the other half of a full PTE update.

Jan

