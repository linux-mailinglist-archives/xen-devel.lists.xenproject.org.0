Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PMjDX5Ud2nMeAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:48:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3587D06
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 12:48:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213642.1524098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkL3z-0003bS-5A; Mon, 26 Jan 2026 11:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213642.1524098; Mon, 26 Jan 2026 11:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkL3z-0003Yl-0n; Mon, 26 Jan 2026 11:47:23 +0000
Received: by outflank-mailman (input) for mailman id 1213642;
 Mon, 26 Jan 2026 11:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkL3y-0003Yf-Eq
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 11:47:22 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5a6be27-faac-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 12:47:20 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so2973042f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 03:47:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c30293sm30200691f8f.19.2026.01.26.03.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 03:47:19 -0800 (PST)
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
X-Inumbo-ID: c5a6be27-faac-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769428040; x=1770032840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HTObMXn7wSRtyVd/M2UxW0yIkWZk2pIs1ewM2Lx12NI=;
        b=AMQZO0uBevw8RK7y5x/Zd3GWP98EMyK+kSiW92AZXWga0nTmabzVe80EH19vbG+T0k
         LxqDTKjHQRq3X5dRcxBs3eN/tTN5u2mgYbLKYxSAHenZ8CyUhL2bz3K+1+kasUqC8Mn0
         T5+HxqGSGszEw4/7srOJeQoXoYBGNc96HTppDLpDV3r+aTCs2LpqvO+uo12DsPMQKECk
         FYDx744evPvTNglnxe3h96YV5c9cUDn11JLXyEzPZnCb+pt115CRw6BQ43kkmhZ+d1uq
         9iOSvFcs2GY/rQywI8gkvzycPH/QPwD1kqFI4ZElfRZA5LSCx0mj21f8JAAEMM2nZTGm
         GUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428040; x=1770032840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTObMXn7wSRtyVd/M2UxW0yIkWZk2pIs1ewM2Lx12NI=;
        b=CF/XhMKCuYaVJVSxzAt6lu3H/BWvIyMg1crUHv36pwRcdxLizYCcODZrJUJVwYcFTo
         PwvjNShIeTZjxSnxq6/vm2b+7sPX2YqdwsfV+NRYaIFCNVuPznL+64g39MqpcXX5zBvD
         qr6TMfO62W62eLoI2+QhxtwCpT1ePJAlVJmh/goMkUx058eeny1fg9LCVtp4MJQw12SE
         o79FkJFaSq1N/rSjaUh+I4Av0s+R7FxwjsAYDv5WCE/R+cNyxG0NbOhT+HN6MXczhs7g
         bnwJyGslhDD872IbiBVRzsV2QU+M9NZ3/1AD2XGOkEZAKDIViZqLWdWarrTGwywV5c+P
         0rhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOA2YnluZNisAyMQpgl2/6kSc9Ly8lqM8XZEGmNkxnvoVQOWIQFDmUBDYzVnPQhrhqkO86jjO+ZFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yximm4kadZE8tZwy9ZDxT7FjiRUiOtGcv0mWe7bLu3wSYVb9kmR
	cU37+oOnEMeIZ0ttPENcfoID8Cg/xRCkooF52wv2DhBQfD9vgBNUyLXwlqbtm6gs3g==
X-Gm-Gg: AZuq6aK9M6YikB1mds6A17vcP84604E8QJP+TyEJk2lC6+TqJ7D3DlN/HkUSPBpX6IL
	1nQkrXxUFkoKkinairIctINAH4wzrKAlmao2k6Wg4gjlSpTUiSYHyEHrg04A4wHFj3KDq4hTypS
	t3vDdEQg3X1NRR7BryE4AOZql0+XR8OKir4AwSnHPwnOMsN/Uou3tD955JIUaoVUouM/+09pb1D
	s+gbN1ge2i++PPmC3GIsdMQYkDRXoDpwl8qheBWjtMXrsPm9nzGY4WJBhUy6Rsqb8MVQYoYXw4p
	7i0GAEVMLY8uo6eLHXi6vyWBw73q0xOO41pH8MbqwtHDDAvZtYJKtd8KgOkefT7dWPBCXsIOasb
	gDx9quG/YmcQ4pC7JJFwJigDzGQ5IlH6buRvgdop2sOY7V/BJdtfmZbEG1Cz1mb7Ow0nv+fq0Px
	nEzV64DAq8uXrGQ7H7VkvaiYbnguh/QSADyEG4K34JOQBbERZ3Iyn16+Pn7IDvhf7bS096e+dkc
	pwbx5+tNeDQVg==
X-Received: by 2002:a05:6000:40cb:b0:432:4c01:db00 with SMTP id ffacd0b85a97d-435ca145762mr7288100f8f.27.1769428040062;
        Mon, 26 Jan 2026 03:47:20 -0800 (PST)
Message-ID: <d3d3a894-4d84-47b4-b40f-604b2d3b5848@suse.com>
Date: Mon, 26 Jan 2026 12:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] xen/riscv: implement
 arch_vcpu_{create,destroy}()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <08b582179ebc4241140000972d89209c84c90fa4.1769099885.git.oleksii.kurochko@gmail.com>
 <4e2bf819-81f6-40f8-9bc3-c53aabf0967c@vates.tech>
 <06ee98c0-ec69-4955-a070-b0f611c8152e@gmail.com>
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
In-Reply-To: <06ee98c0-ec69-4955-a070-b0f611c8152e@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 98D3587D06
X-Rspamd-Action: no action

On 26.01.2026 10:00, Oleksii Kurochko wrote:
> On 1/23/26 12:30 PM, Teddy Astie wrote:
>> Le 22/01/2026 à 17:49, Oleksii Kurochko a écrit :
>>> +    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
>>> +    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
>>> +
>> You probably also want to set the first parameter of continue_new_vcpu
>> (struct vcpu *prev), or otherwise I don't think we want the "prev"
>> parameter in continue_new_vcpu if it's always going to be 0.
> 
> It will be set by RISC-V ABI (prev will be stored in a0) when __context_switch()
> will be called in context_switch():
>    void context_switch(struct vcpu *prev, struct vcpu *next)
>    {
>      ASSERT(local_irq_is_enabled());
>      ASSERT(prev != next);
>      ASSERT(!vcpu_cpu_dirty(next));
> 
>      local_irq_disable();
> 
>      set_current(next);
> 
>      prev = __context_switch(prev, next);
> 
>      schedule_tail(prev);
>    }
> First call of the __context_switch() will lead to jump to continue_new_vcpu()
> function which will have a0=prev.

Problem being that none of this code exists yet, and hence it's rather hard to
see how things will eventually fit together.

Jan

