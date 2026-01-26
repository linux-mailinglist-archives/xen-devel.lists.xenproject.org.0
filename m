Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHVeB+E5d2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:54:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDB986405
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 10:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213458.1523926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJId-0005oa-Sh; Mon, 26 Jan 2026 09:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213458.1523926; Mon, 26 Jan 2026 09:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJId-0005mV-Ps; Mon, 26 Jan 2026 09:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1213458;
 Mon, 26 Jan 2026 09:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkJIc-0005mP-66
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 09:54:22 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbb899da-fa9c-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 10:54:19 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so3918005f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 01:54:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d84ebb9sm235909645e9.4.2026.01.26.01.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 01:54:18 -0800 (PST)
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
X-Inumbo-ID: fbb899da-fa9c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769421259; x=1770026059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vqs3yXOIVelZMGZPOqu1S/alAIdQFNs2IhkLK3/smII=;
        b=MrVM3suS1JYeCTCUffqQN+lOqE0F+6f7SqQwzbFNmT2F3xWXnUHzcFHGi4/Eg6yjPV
         ZK0PjC0gy3T1fZJgwgBPhbzu+2ralWvIpkxpGRdODHfa2telJOdn5jTE7GLcch4AdRpi
         ioFx0ztAv2wZE6uGVEjHgvSfZskJPGy3qXSrEY3n2yqvp4CVPV70fHI3uyo2a/ZghlIy
         Vnk4X1QcL3dFHHkdADJBy1ZLXmPr2efYZEIONqmtlz3eNFBGIGuHDLIuUbvIBMrwheKo
         AhAi8qtAy9LDH1Z7ZQOk/sskaqMzBTkrCWstxiww+gJNVo9QfWMQwFrzeJcwTUgcfDUm
         wsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421259; x=1770026059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vqs3yXOIVelZMGZPOqu1S/alAIdQFNs2IhkLK3/smII=;
        b=viSryiwRIAR/qQaWwYn/jf2dTPbigIT0o72Y5S5DsWY1M9r7zUVL2rLEJaeQOqKM9Y
         dtZskvwNXwMgVo6ef2qxoGy7Cjk8HEJLiqL10bRtclotTBcB5ZDRlioa6Cca0wn/puli
         myh7bs/7kdrffwysASldql6H6OKzqzYb9vCWxx59P6f3tzGOShVt5SHdOpAWs1FzJfmW
         Czq5KTJhP7FkwZaZJxPSstDYjMlOpbTkpgQ1tnJsNzbZ3mg3JccgMOsMl1r3l7Tg+315
         JJONry2b8O0Ki5WdvBwh9Z255Nc2+MmdfzZ2fn70bubF0KjtLz44Efdy1IaAIoiZjdhV
         O0GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSQV3U7meABPB1FmjPbYgJTlR+ERVMfYBzKiDJswuiB8LmEK63oFezpB0MgjlK+p2O5ynRbbFRrYI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHn3CkPo+Upac6xoV1h2o92OGmlS2CVOLvd9rJHdLHGjY6egbK
	OTdC0WL5y6h00pnxyh8BhAmLrgA0OMI/nM3HejH7vFB6vjT/3P1oY/+GBi2aayYm7Q==
X-Gm-Gg: AZuq6aIc+4VxkvQaw0N3xeE0kzUt1G55OK5mdNMibkqnCHp0DWD3gmRzxqvrMRoJ1CM
	oJWaRI3RogYxvoXrlilDGGSRHlHAMoPnESKLLcYoSK+ub3L7QgPBZAiKj4763LsNzwx45rHZttj
	9oejwa3OCKZH4/Qoht2HNikIAusljoxL3oDJn6PieWNolxrbj801zOeUmgy6/ZLIrzZl5gdkzY/
	QkOZObTYfUX21qW3JcYpbLgeZXCvxmrcaysZe+P96NbssxAd0wb/T+Y9/anxLxGBBFTTNqgbRNd
	pGFqLwJF+FCjNO/h4xiCudMDwbNIYyC/ZGrpty9UuHBsR6RTYSp7JBork2aqy2r6s31N3Ir0RLl
	xSL2212ltSP6SEpsmxbnVjcTFOrvYewrsiU5e5mMh86zMg46UQ3BeEtzwJ2B3AQTxndhqYyHSGz
	Duee4ezgeMT/Lv4mrmKYE6/vB7nFxQUcFc3eYD7xKSuNUx5TsHYJDmQ6SrHENnpesERlz4IabK2
	H8=
X-Received: by 2002:a05:600c:530e:b0:47e:de9c:92ec with SMTP id 5b1f17b1804b1-4805ce4e568mr63723705e9.14.1769421258814;
        Mon, 26 Jan 2026 01:54:18 -0800 (PST)
Message-ID: <66c43a69-f534-471e-8cc9-f549f8ad4649@suse.com>
Date: Mon, 26 Jan 2026 10:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] xen/riscv: implement vcpu_csr_init()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 xen-devel@lists.xenproject.org, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <57ef3bcff854d4b50641641d300b3e8aa715c3c3.1769099885.git.oleksii.kurochko@gmail.com>
 <99289a63-b4be-42f8-974b-7445a6a479dc@vates.tech>
 <da0a5819-f811-4eac-95dc-9c8d33ea91fb@suse.com>
 <e184e146-b7f9-4ea1-bd14-af51c5ab201b@gmail.com>
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
In-Reply-To: <e184e146-b7f9-4ea1-bd14-af51c5ab201b@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7DDB986405
X-Rspamd-Action: no action

On 26.01.2026 10:47, Oleksii Kurochko wrote:
> 
> On 1/26/26 9:36 AM, Jan Beulich wrote:
>> On 24.01.2026 23:44, Teddy Astie wrote:
>>> Le 22/01/2026 à 17:49, Oleksii Kurochko a écrit :
>>>> +static void vcpu_csr_init(struct vcpu *v)
>>>> +{
>>>> +    register_t hstateen0;
>>>> +
>>>> +    csr_write(CSR_HEDELEG, HEDELEG_DEFAULT);
>>>> +    v->arch.hedeleg = csr_read(CSR_HEDELEG);
>>>> +
>>>> +    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>>>> +
>>>> +    csr_write(CSR_HIDELEG, HIDELEG_DEFAULT);
>>>> +    v->arch.hideleg = csr_read(CSR_HIDELEG);
>>>> +
>>> To me, that feels odd to set machine CSR here. Especially if (I guess)
>>> that we would update them anyway during context switches.
>>>
>>> I think it would be better to have :
>>> - vcpu_csr_init -> sets initial state CSR in vcpu structure, doesn't
>>> touch machine CSR
>>> - context switching logic -> loads vcpu-specific machine CSR from vcpu
>>> structure
>>>
>>> We would have to make a context switch to enter the vcpu for the first
>>> time; but that's to be expected.
>>>
>>> With my proposal, we would also want to move the vcpu_csr_init()
>>> invocation to the place we initialize the vcpu_arch structure rather
>>> than the first time we schedule inside that vcpu.
>> Aiui the writes were put here to be able to cope with r/o-zero bits. Yet
>> indeed it can't be cone like this. While it may work for domains created
>> during boot, these CSRs would be changed under the feet of a running vCPU
>> when done this way for domain creation later at runtime.
> 
> Why these CSRs would want to be changed when we have already running vCPU?
> 
> Even they will be changed what is an issue, they will be sync-ed during
> context switch.

Which is too late (plus on ctxt-switch-out I assume they'll be synced from
HW to internal structures). The problem here is that a vCPU, having invoked
a hypercall resulting in a new vCPU (for another domain) to be created, will
observe a change of some of the CSRs controlling its own behavior.

>> Instead, as I think I had also suggested earlier on, the r/o-zero-ness of
>> bits in particular CSRs wants determining once during boot, and then that
>> mask wants using when setting up vCPU-s.
> 
> Somewhere even before create_domUs() will be called?

Yes, before any domains (and in particular vCPU-s) are created. The idle
domain may be an exception here, and system domains (not having vCPU-s) may
also be unaffected and hence not depend on particular ordering.

Jan

