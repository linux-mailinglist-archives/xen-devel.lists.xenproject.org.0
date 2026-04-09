Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHB8Mnyf12kUQQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:45:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367863CA921
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277263.1562479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAokd-00014L-63; Thu, 09 Apr 2026 12:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277263.1562479; Thu, 09 Apr 2026 12:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAokd-00012B-3S; Thu, 09 Apr 2026 12:44:51 +0000
Received: by outflank-mailman (input) for mailman id 1277263;
 Thu, 09 Apr 2026 12:44:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAokb-000125-GX
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:44:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAoka-008ls8-Sg
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:44:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d79f3b-bab6-0a2a0a5309dd-0a2a450cdd42-8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:44:48 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d79f40-f40c-0a2a450c0019-d1558035b10a-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:44:48 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4888375f735so8437905e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 05:44:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cf9e8be9sm51492565e9.6.2026.04.09.05.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 05:44:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1775738688; x=1776343488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RViNgMzmAK8LSo3OUVO2YPvKAVfRLJNIelYr33XiRq4=;
        b=c+YjCwmAevwX+tpwdlDG7Z0ctB/AUaIKPs6LY8tEPXmcQsa2mzhJp3EdAXSjMs8ZFr
         p0mU6B7rTNyjvlA3n4xYxPI/JrNs2v8sexmje/DPftLU6BIM8mB85cPiQ9l0UWI49ujD
         /AnxtHdbEFdMidV+54oDJayhs+0/y29oitz1rpO2SzfPDbMSflo334xJPua5Q1bukhOI
         BWOc2LaV2A6Mz+Z16tQo2A9bhyxRqGQ6hAVQ5XtVzNyikUOqgn/ytV+AB23pr5AIt10V
         2toBqJ6Ia0L7nSsojQ93Tmdk0Wi2f0ouoYYv4xLpqI6EKTYiQwRSDETakP2UZX7Xsmfe
         sSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775738688; x=1776343488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RViNgMzmAK8LSo3OUVO2YPvKAVfRLJNIelYr33XiRq4=;
        b=ZSCIanRR0BUGStXgiZOVmk2lbqEio1z53MLMl+j6KaLYEZs2gz2vN/lc4YhOrv/JGF
         uDhX8cI9Z7hMkVq5oJN/ctgc4vcawPXC/TCP5yrZAyoZhjBg80oLsMLf0bWXCeYTmSel
         Ec8zfjIHVt32a3IB4DE/Rdmk8XU2oH+j/WRX35/oNW7d1p5LJG9tJhcWXcdL0jImY9B0
         yIGWyIzcYfE2LIkO7WuEX81JnQQvy0GYyoKfqeoaDF4oZ2g72ZwCDzKhtPLB1PaFyHPN
         RcHzrGubg5HI8dYiVcThfRxVPDnZcGQhhk69qjYalBdrFo31q43GUgtxTUzn+PrF0/XN
         /m/g==
X-Forwarded-Encrypted: i=1; AJvYcCUt0UX4GypdB1j+GUltq1qW43KvhXAf+xBLQFyol2KejDCOwcPWHg4SWqpmVl5NQgmbNJqZNCZD/AI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuKUY07Aj1S5GYtQY3r1qF9lp1N4MJGCarqkYd0xOqibiOsZEO
	88wBfxxEY3aMSJ5jh+irKzDLPh81vXRydtqOmPwrnj+udOzbSPrH/NFB8tLWrIHNbA==
X-Gm-Gg: AeBDievZcZHHYpS2zyc2EHyOwds9ZVD2sKiOpzwZBA9D1YjjmBMDYKwLuylPFPSSvuG
	4vEnCRG0gFZuNyuqPEGsAwa9MBlaZXpE3X+woJBJ8K4m2zx0tjnXmpljacP/hsigBcw9qTgwQpJ
	v1NssOUEYxRd6LQQ6DWGVTGGmctjpk0+1n2sUnRRDCsAzLEqeguFD2r2SO4cOvmLEetTsj2jW1w
	LNVKbtLEGFTosKsqSn54C2KehaQPRq7RVJhciMqR94L9QXYZwjojMsoncRZAOirJffoygParGLg
	ZVB7NhLIUvMefv+jlIL4zIoJNqYZ5kVc71jLIlxw8mxYSfpuFiiEPH1CuALp6Yq4/RC8AhhWEQb
	zf7UJzBKt9QVwe2Yw0V0P+SLiVwj8y36639GbVdtmx0j4KBWA5fgBvBosz7RZ/rblIwr0Dmnlqm
	VIGb10dBFhlVP7Uoi4Pufadf29JumnUCrS6f10NrN5kzBZWvx2+vwbVyCajUXeoVzsNwhrcuA0F
	BNrRpddhIGZZ8k=
X-Received: by 2002:a05:600c:8908:b0:488:a916:14a8 with SMTP id 5b1f17b1804b1-488a91614fdmr203842785e9.10.1775738687613;
        Thu, 09 Apr 2026 05:44:47 -0700 (PDT)
Message-ID: <d24e943d-1e2a-47ba-85b8-a2f9f9523ed7@suse.com>
Date: Thu, 9 Apr 2026 14:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86: record SSP at non-guest entry points
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
 <de873764-c803-4f56-b88a-936cb948c382@suse.com>
 <f08e0fbf-3570-4760-9977-4e99e651a3a4@citrix.com>
 <868b63e6-c551-49b6-b177-cfadb29a69b1@suse.com>
 <5d3472ff-77ff-466d-9461-3b33ef0815aa@citrix.com>
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
In-Reply-To: <5d3472ff-77ff-466d-9461-3b33ef0815aa@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775738688-83D43A3D-5353A34B/0/0
X-purgate-type: clean
X-purgate-size: 1353
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 367863CA921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 13:22, Andrew Cooper wrote:
> On 09/04/2026 9:13 am, Jan Beulich wrote:
>> On 08.04.2026 18:58, Andrew Cooper wrote:
>>>   It would be an rdssp;push on
>>> one side, and a pop into any register on the other side.  Furthermore,
>>> given that the ssp= doesn't exclude storing it for some user frames,
>>> just store it for all.  It's one push/pop into a hot cacheline, and
>>> makes a substantial reduction in complexity.
>> I'm having significant reservations against that. I use the 0 put there
>> in subsequent patches, to identify absence of that data being available.
> 
> Well, that's not safe then.
> 
> You've already got non-zero values there on entry-from-PV because
> there's no CPL check gating RDSPP the common IDT paths.

In that case we get safe values (as read from the MSR during the privilege
level switch). And wait - no, the latter two patches don't make any such
assumptions, I don't think. I may have mis-remembered, or I may have
remembered how things were at a very early stage. So really the concern is
with RDSSPQ's resource use. This could in principle be as cheap as MOV,
but how do I know? (The latency/throughput data I can find doesn't include
this insn.) Plus for the purely PV entrypoints I don't see why we would
want/need the slightly larger code size that would result.

Jan

