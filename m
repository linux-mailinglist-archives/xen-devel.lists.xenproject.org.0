Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EUIABiSgT2oZlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 15:20:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323773180A
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 15:20:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Kfd9yjUg;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358160.1612412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whofy-0000p4-Fr; Thu, 09 Jul 2026 13:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358160.1612412; Thu, 09 Jul 2026 13:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whofy-0000ne-CV; Thu, 09 Jul 2026 13:20:26 +0000
Received: by outflank-mailman (input) for mailman id 1358160;
 Thu, 09 Jul 2026 13:20:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1whofx-0000nY-Jt
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:20:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whofx-002yOs-0c
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:20:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4fa018-bab6-0a2a0a5309dd-0a2a4509a00a-0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:20:24 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a4fa018-b440-0a2a45090019-d155dd34d0d4-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:20:24 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4799b3f7c83so1212545f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 06:20:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6fb526sm70944845e9.15.2026.07.09.06.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 06:20:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1783603224; x=1784208024; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmPylVVDl3kFQZhOh+UmJvXKvxwmZV4PJRxXYchgqNI=;
        b=Kfd9yjUgNYFuGMx3W9Zf4niguDTzBrI9o/3cUXquX3eNsSGBCIW4xTW01EIeCVXFPY
         N/P8QkrGqjf93C7V4LO1XjdofkbD9gH76fqmhalxcmYNAgQjA40x7VC99xDRve7byDk7
         XlizQNVFv+JhLDD3RIvyZEWpps7F5iGut7cLEPbWf4RBZIFyNUvinmzOhKV/SNBXk1G6
         flacJea3izZxBpRFeuh2ljXicTTSszixuaHw+UFEGxMELNfmQEJ3j+WN5LCx1Hb/gQfJ
         LYVEjdtuTyNyeIbZw3tkbW/VPHjx9rZrYUdRgIZu1ewOhKDNZe/JcqwOxj9F7qR2VZH2
         440w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603224; x=1784208024;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmPylVVDl3kFQZhOh+UmJvXKvxwmZV4PJRxXYchgqNI=;
        b=gj5kQtf9bTJUEX9GI5R6YsCdYeek5b+noMF2OmxGnvZrly+sEv1XiVF8zSM2QaV4/k
         e4ZpFxRgWelFTCN2JTwFnKncwWxaAr7cZuk9DOf5tkP/GEkxGwx3qSW39vWl9p+QqzNc
         tp8uh2AwivUst4Tsvp8CKBHHl7KOLQxl9eaQcCJCCm/UhnofXqo7P02T4zADuQ98PrNA
         hz19lvYep7qGOrNUZPku4UnTpXk8QfE4roqV0OTRzaGRncLrRo6OzDtg8DXAxs7SOUgZ
         LiQjWpN1dy+xL7RE2SaPbU4nS3S2gPcTE9fxwEm3vFHU7HI7Uc68yIULPcKGRLCSgck7
         RZiA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3xP03mD/lbPyW+m2YGndPTFDrGHTxrlKUngavSO2EtN/EA6an4yyXXOdIyDivH/ddeaEUc8cbTx8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtlxhjmMmm1iDkO2LAlHEfwDvCukQFDb/sZC+8W8g0sQpZgRky
	z7yV73d/70/c79fukPkJPxaWaDxh7RGgOCpuB5ZRyprA2tjirHAQ+RQJsFw/XDODVg==
X-Gm-Gg: AfdE7cmO0R6T04zlEiUw6ZuW6VT8/HJGDob947Ttd3TmK5kV3xmYMeMSIFlzkpWIkzq
	BizD01gpzxRv7G7uWUslyffnNlDiyYpEMpfyRw9UgyE5ZhgPwAlLahqXB9mC4qRK0KUELcElGV4
	KfvQbp05PL3UeZt0WVEsMNEVPTdRIBg4KHtZBPBD0AvpxDSAJMDaE6o5jYkYlmKbwW/AW7X4PjX
	9MB+PVXPK6qejkh49ZVsXEFnXJ4VF8qhmX58pdxkvgiYn3tAV0mTQYbvJUGXaFRNlRRXS45qiV5
	P2sSQTps4FB2kMf35QN2YVgvyk87oTdXAx3vvf2w5XDwacgyIRvVMmVt2wqbWIcmy1pPv5fdUNA
	NmghQhTPZEBQQyz8oSV5Jqp3q0TA0b+mmm6Ndi/AoaUErEGWyQQILlVprJHnJAoGHnM7jb0GWxq
	qP54wO7B2cK1ij59dzDXZGVaQPVK6aVbZcSnW5aNjnJmejBFHaZzn7OzfR2MHjCXechgrH6vNz9
	7kI
X-Received: by 2002:a05:600c:6291:b0:493:f069:d205 with SMTP id 5b1f17b1804b1-493f069d233mr8444525e9.19.1783603224270;
        Thu, 09 Jul 2026 06:20:24 -0700 (PDT)
Message-ID: <0c65cc0a-76c6-4ca3-8d39-7f6d82b7f54b@suse.com>
Date: Thu, 9 Jul 2026 15:20:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/26] xen/riscv: implement make_cpus_node()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <d8e17abcf195ca97056c8ed078ad968f68fa4ca9.1783331040.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d8e17abcf195ca97056c8ed078ad968f68fa4ca9.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1783603224-5676AA0B-B0663ACE/10/73395122804
X-purgate-type: spam
X-purgate-size: 2195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,citrix.com,amd.com,xen.org,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7323773180A

On 06.07.2026 17:57, Oleksii Kurochko wrote:
> Implement make_cpus_node() to create cpus node for a guest domain.
> 
> This function is going to be use by common dom0less code during
> construction domain.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v5:
> - Drop Acked-by: Jan Beulich <jbeulich@suse.com> as extra changes were done
>   because of the changed in prev. patch.
> - Move isa_str allocation and construction out of arch_domain_create() and
>   into make_cpus_node() as a local variable, since the string is only
>   needed during FDT generation. Use a two-call build_guest_isa_str()
>   pattern (size probe, then fill) with xvmalloc_array, and convert all
>   post-allocation error returns to goto out so xvfree() runs on every path.
> ---
> Changes in v4:
>  - Update the comment in make_cpus_node() to match code style.
>  - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
> ---
> Changes in v3:
>  - Add blank line above make_cpus_node() function definition.
>  - Move 'unsigned int cpu' from function-level declarations into the for loop.
>  - Drop 'uint32_t reg = cpu_to_fdt32(cpu)'; use fdt_property_cell(fdt, "reg", cpu)
>    instead of fdt_property(fdt, "reg", &reg, sizeof(reg)) so byte-order adjustment
>    is handled internally.
>  - Add matching /* interrupt-controller */ start comment; fix end comment to
>    /* end interrupt-controller */.
>  - Update d->arch.guest_isa_str to ->isa_str in make_cpus_node() function.
> ---
> Changes in v2:
>  - s/u32/uint32_t for timebase_frequency local variable.
>  - Drop +1 from BUILD_BUG_ON().
>  - return fdt_end_node(fdt); instead of res at the end of the function.
> ---
> ---
>  build/tools/fixdep            | Bin 0 -> 13632 bytes

There was a stray file in the v4 series iirc. Now there again is a stray file
in v5. Can you please make sure to take a look yourself before posting a
series? Are you doing out-of-tree hypervisor builds, but with a build directory
within the source repo? There is an entry in .gitignore after all, just for
xen/tools/fixdep.

With this properly dropped:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

