Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHh8CJL1cWmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:01:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0057464F16
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210674.1522300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virVL-0006Vn-A9; Thu, 22 Jan 2026 10:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210674.1522300; Thu, 22 Jan 2026 10:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virVL-0006Sg-7W; Thu, 22 Jan 2026 10:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1210674;
 Thu, 22 Jan 2026 10:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1virVK-0006Sa-BP
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 10:01:30 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5168a8cf-f779-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 11:01:27 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so8574025e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 02:01:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804702fab2sm54081865e9.1.2026.01.22.02.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 02:01:26 -0800 (PST)
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
X-Inumbo-ID: 5168a8cf-f779-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769076087; x=1769680887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz3q4wptmIgWHxWg3eFEYGpWgJA5shrc0daZoi+lUQs=;
        b=XNKRlTP31yzBgOjeS6T04SwNNtHsmJFFlw78jP7w/+2okHDhIQ5psvtszQjSCtjY+8
         eSpPR8FRXkBkBPXKGbvAhZHMyG808fxGwylk3cDlprKff2VgR4ngtoQ0KuF1tjAZSbBP
         tIbrqlvQ6eLoGxcHBmXgJkkAx7zhk8hSwKXzNXlUG1tO5s2TCDeCA0GRsfXilYWiKuxq
         Ia3QaJzwMT0CdFq4WoIn+3Qe/MZuEIxAiB6GqIGxKNyZTdU+/kvT19xgwRoKXuBhjc3k
         9hgBPwGOciWgZZk49yF1Cttv9FZBRuBfNm80Qd+mXxN/nGLC6LrHJe20gbjjMroIHmeV
         oXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769076087; x=1769680887;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bz3q4wptmIgWHxWg3eFEYGpWgJA5shrc0daZoi+lUQs=;
        b=jTPoRGDK5EtxZctYO/Y4dPO+hSsqGUJoqdrLB9IlD4GSmu1tEoRz1PTRlcq4bZU3uz
         WfafNmCImlQA+rLQhXkrdXHOdNgoJpIrXSUSTMWC3bVAjOXHiusGUGSQ2tJ2ZiuQmFxe
         d1+83rCjUUDtIbQcOx8jcjk4ihpWBnThvZonwkdmXujF+spL7j56sJT395rm+87sPvgy
         XbeWH6B1bpkTzM6aWeimrFIwzv8Pj1T+OpXsG2eQJyG+qQ+GPHkLacjHsAbVr3KiLqti
         ohe2867HSroPXnQ8/T9qXMqckG3WyZ6Zox3dPvxb6xkMMKR9kswr1x+ZjHJR0OMQF2bb
         Vm3w==
X-Forwarded-Encrypted: i=1; AJvYcCVlfn1thbSp9seMqkJXypp9HnhpeXgraSEfl09Lz/8WfvAB9y1eHlycfXBkdTNvzdyjmuNROgBoypA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgXKvOTim8tUoR5uWzbam2euPrkAtTWcBU/6ABoz8sNs/n9Yff
	pTOZ3xgBtmvJ+VVc2SU6RRbkixA7j+3xUwOarGcejFAdFaLYMDZ3MslGY55zAgg1oA==
X-Gm-Gg: AZuq6aKyIW803eBE5OiBky6IMWn7WE/JFTSHaxAVSgISmDXbbrfeP+LIKYozpGXf2G5
	DUWskg0CMq/kecSEtRWWd/uph+e463E0/YScvXByK+UgEuDKgPAh0TL/fYWZww9oQhaUXtNEK1R
	eFMPtU5x0QGyNRDm5Bl/WqWg9Xp+ZPAicMRtyMWUg+csWvO8RMxkchlm++GyicOlu4WF60E3FKq
	GK/4DOdaqgu/4Ted8YsmHp7precFw3+ZcZ3I+88EM5yJ2PnhB7kFGG0oQhtndu5pT6exXT+l4t7
	qEelZnaVTB/QfplkgyOhmLdqT3T0uu1WknQYkkItKt0IId57OI9I1vo9IPlnbwpy/KgRhwei3QK
	E9iIa+JK9fM3indzbMFagfYak+62CpuKkyeHDGsszXE3a5abgC1vvB4wxrW8TxdlhfJySj1ViIb
	3GBjFN9AiaRDI+3KQmWFYn5lr3+bPMvD0t+vXo7k7yJCdaRHprU/EHe8YjXobVcVWnZyXZRlrIA
	PI=
X-Received: by 2002:a05:600c:3e12:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-4803e78ff26mr116539645e9.2.1769076087216;
        Thu, 22 Jan 2026 02:01:27 -0800 (PST)
Message-ID: <b7475771-3ae3-426e-9255-d886ec0b2ba9@suse.com>
Date: Thu, 22 Jan 2026 11:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen: Allow lib-y targets to also be .init.o
From: Jan Beulich <jbeulich@suse.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
 <526ef477-0730-4e22-a82f-4c598ad78e0a@suse.com>
Content-Language: en-US
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
In-Reply-To: <526ef477-0730-4e22-a82f-4c598ad78e0a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0057464F16
X-Rspamd-Action: no action

On 22.01.2026 10:49, Jan Beulich wrote:
> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>> There's some assumptions as to which targets may be init-only. But
>> there's little reason to preclude libraries from being init-only.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I can't tell (yet) what it is, but as per CI something's clearly wrong with this
> change. Both xilinx-smoke-dom0less-arm64-* and qemu-smoke-dom0*-debug* fail with
> it in place. qemu-smoke-dom0-arm64-gcc (no "debug") was fine, suggesting it may
> be an early assertion triggering.

Or an early UBSAN failure. I think ...

>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -130,9 +130,9 @@ endif
>>  
>>  targets += $(targets-for-builtin)
>>  
>> -$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
>> +$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
>>  
>> -non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>> +non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y))

... this is the problem: You're _adding_ library files here which weren't there
before. Why $(lib-y) isn't here I don't really known, but as per the CI results
there must be a reason for this.

Jan

