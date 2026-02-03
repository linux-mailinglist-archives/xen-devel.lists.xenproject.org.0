Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLZbDMgqgmnFPwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:05:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB64DC79F
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:05:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219485.1528364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJpm-0002Qb-8x; Tue, 03 Feb 2026 17:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219485.1528364; Tue, 03 Feb 2026 17:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJpm-0002Ox-6D; Tue, 03 Feb 2026 17:05:02 +0000
Received: by outflank-mailman (input) for mailman id 1219485;
 Tue, 03 Feb 2026 17:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnJpj-0002Op-Tv
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:04:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f2013a-0122-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 18:04:58 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-480142406b3so43887245e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 09:04:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25683sm33725f8f.6.2026.02.03.09.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 09:04:56 -0800 (PST)
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
X-Inumbo-ID: 77f2013a-0122-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770138297; x=1770743097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mdBD9bdROZlyxJWX657+l7mQ6lQ2j5qsZw1IPMZECAc=;
        b=gF2VUzai4R9nvvnV+P0+zrHJ68CSF0bqGkybkq9QL2PYKc2VT1yAAmkjjwaq2klr98
         xwdSZyMIR3PZXskCdQBkOWJoLGLN1tPCJ7R8+EX3t8z2p0hZ89sk9bQ7LEVzYxoKYMb0
         nf1gUniO/nWkouXIzvDSV/OpKN4JmZqLN8L9rtpfKJ7n8314FGJr/2gTnVQSURqBSoAt
         6ojSmJhSzRNucVI6IhjPgtIGVAMCF0XIxUEwCe+guzj/kepJoNwcvMsU4kjB5Ea3Yh08
         fz/USGQD4HS5vQSqI9PeZ1lNY+nl9zQMSASJkKVtUxOYt02VKWbob0TLGfb8yTRF/Uj/
         RxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770138297; x=1770743097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdBD9bdROZlyxJWX657+l7mQ6lQ2j5qsZw1IPMZECAc=;
        b=D2G6jfiinzz5hpZaRk+/0Gaxk8ccDhgyzNpNRuHUm/Cl/s0rf5wj7NUTiTobPR3yuY
         lKBg1RJn/XXzSZVOGwS8BlGwsCeD4ftFJoTFzhzmgBOTMSzTR/k+OkASFkS+AXYGcFgl
         upk25AfsPDbxZ/WOXXosLtzQCXaddBsX0pF6TpVJjVMDrfaFeUpqQm0O3PG5hvx9cuBA
         Dl+VuYm+p446YbTJjJMI0UQq+hHlKQRwPmtTaLlIneYBQViyx5AMQHYxP/vvhdZGRhgc
         Ez7kv3ksjDn1bbGs2aHDmfRMGURjQ4zYJQaOkBQRFfCrtE/hoEry2o5AURE1hGgxYcVl
         qiMw==
X-Forwarded-Encrypted: i=1; AJvYcCX3bg8QYkFu0Kv/2+b4xYHtGKsIf1jqJretsbZT/IVnxAs1Nr48e0IlxU6AsRm6H62qzMr/UOYFDug=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2iCLYa8j0AJm1vgLeVT5CSC2U4ZQ3hsQQFgNZ6fawcxEyv3B1
	ySlLE+OLqyvLByLPltXlWf0+B18RZWMnYKSJl0y4RUmdQ6G+beepRZbYZ+x1t758Hg==
X-Gm-Gg: AZuq6aJ75PhU5Lg0hi7fSHwdf19P03SdanNev8szlXHsx9xB5ScqE8NL/p90F9R2hvH
	z+vsmd5VfXVs7K6CbE+tbFM7MPOyazXDAOrPjN2ct0PFAzpFW+NKQqCyy7ZIpOUi+muOvfT+wSi
	4nwnAP4hqV9GdnW2cDlkdXTOPOxnVlaBVq4uyv/qQ+dvNteGmRC8NqP9OK7cCwOeJMLqJGdTgbW
	DXWRsPrRlqZ8MTMPihLuINd6mdeXUVA/mZmOk0gK/U+r2llR672KDcoJ6sLwYtvzlA7M26Iw+cp
	s+LmR3SoLRQggTwdUz9+Ig+yjcv9ynGWcVJK2vzxWUpTqiXAtFuP8YEmU53ytKWbmixnFgfGwnb
	qPJHjAHHY6FQvEPzb9R/OoradBk2w9Yy2u4IosG9I94KBCQSK2nBr928BoqgTzXhYSGIDyBoegD
	8IeYy/0IXQCQX5CQTz0v1tWfUUhwUP1Z/hcZln5OwBx22x8Onn5kvQjp1p8co598vVxqxctSMhq
	DVZ/koaT8p1LQ==
X-Received: by 2002:a05:600c:3555:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4830e93eaa6mr5313325e9.3.1770138297326;
        Tue, 03 Feb 2026 09:04:57 -0800 (PST)
Message-ID: <abbbdb42-76b0-4317-b19e-30e01639e125@suse.com>
Date: Tue, 3 Feb 2026 18:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] xen/riscv: introduce basic vtimer infrastructure
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <381c200edaff013d999c6314c20e8cc8bdb5b041.1769099885.git.oleksii.kurochko@gmail.com>
 <ee928798-73b6-461b-9c43-b34778a4f89b@suse.com>
 <63655a5f-1259-43bb-914d-9e1a79638abb@gmail.com>
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
In-Reply-To: <63655a5f-1259-43bb-914d-9e1a79638abb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8AB64DC79F
X-Rspamd-Action: no action

On 03.02.2026 17:55, Oleksii Kurochko wrote:
> On 2/3/26 4:47 PM, Jan Beulich wrote:
>> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>>> +void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
>>> +{
>>> +    struct arch_vcpu *avcpu = container_of(t, struct arch_vcpu, vtimer);
>>> +    struct vcpu *v = container_of(avcpu, struct vcpu, arch);
>> Why two container_of() when one will do? (Same again further down.)
> 
> I didn't think that container_of(t, struct vcpu, arch.vtimer) would work
> (as arch.vtimer is embedded inside struct vcpu. Is my assumption correct that
> if it was arch->vtimer then it won't work?)

Please simply go look at the container_of() definition.

Jan

