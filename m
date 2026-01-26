Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKJRLpInd2kUcwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:36:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B08F85866
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 09:36:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213367.1523847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkI55-0000TV-MN; Mon, 26 Jan 2026 08:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213367.1523847; Mon, 26 Jan 2026 08:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkI55-0000Qk-JP; Mon, 26 Jan 2026 08:36:19 +0000
Received: by outflank-mailman (input) for mailman id 1213367;
 Mon, 26 Jan 2026 08:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkI53-0000Qe-Kd
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 08:36:17 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13b8b789-fa92-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 09:36:15 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso48649015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 00:36:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e7156dsm29163703f8f.20.2026.01.26.00.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 00:36:14 -0800 (PST)
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
X-Inumbo-ID: 13b8b789-fa92-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769416575; x=1770021375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ihiBLSLqAknhmu2ulqYkz+lh8oJuDITWiAx4INnpdlc=;
        b=eglHDApxGdp6dqdXVHPPDNz9L4XLW8LgRRYC5P8XcT+e9gfITrbE6PRtxl+at0I5Rj
         FJdfyi1LI+37mOjKreWwd6wKzcG6jTvrRtDx9O30XoqV4k/VoYAZVTuhuMWc7ezhjfd6
         AiHc1xuMnwbFBQJ2fW/oIAELEloSoBqvom3k4uiVCqe6QkZLwkMNrBgD2edJPMkZMa+e
         rSkivUnsDeXaHicfAa0aa+t44B/34qG8K+/m9CUGujW2/1JFmyCe88vpc9fwL2NAfc0X
         uCmmTGAyWEuBgxnTsoWS4pCrseTn528x/jSnWngTYOar6qWBGtHq4/8BXn1vWxCROqhn
         OR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769416575; x=1770021375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihiBLSLqAknhmu2ulqYkz+lh8oJuDITWiAx4INnpdlc=;
        b=UlMATTrGNgAwGyhimKFE83fmEdAVxm+0N0HHWwvKNTxYwbvGm0FTOKreEEF756yMgi
         GSS3mg7+6wRiIbOet2HaM/9pECbVdjd4NNl4XjRnGK9xsi+xW5GsSPgm3JACR7o9Ey+C
         70vgv2wbgFWFFpfgyNHberj+pFEVDLFylEMKvtxuK3O0eEXsO8EIOScry3owTwqj+7Z/
         k2/lKvMlqyhVOj/VNhJ9AQ6/EzEtHT1hGXKxLrzS/NClizzq7SLEDCJ6hyUFYnhDB6lu
         VY1lJ5a7/Ij3J558hNFtpZgeKyLU6E38sJ6OPakO8T/xOMBc2JDeBELxbaOheNMsiEvB
         4RSA==
X-Forwarded-Encrypted: i=1; AJvYcCWTf679/RG8CymJXusdxZ4qLnM4dLBnMpnY32hg4RjoGSx7pq19sOrzHdZzgNB2+nYB9xTxw0/6z6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+5gC1nb5GsBLA4M4p9G21qHBgB+q8u2EzOuIV5JBBsFLdx3hZ
	eQ4pZvP+0ywcxzQ9SMeAQDMEw3g/Ky3GKO/v+GlW4Zdr6ZiN7gtR6Om3yn0ACNOOeQ==
X-Gm-Gg: AZuq6aK4j60lK73YygH7y0iI2vEBrJSsoT6bTU7VohEAaQgJ7RTR9bPeW/0ul4z2st6
	2OGBbPHei+pdWjvC48P2GNdbh5Xlx1cLSdakdKgBZyI0zG7UofdrOLkok+/ivblmsbY9pzLtq0n
	rpqC/r+NQCS+wO/tEvHdpg3JLPaNOdLRghxp9+oA1ZpBkWawgDUWOaGQOBh1Jc2xpOUuT6yRnY7
	7HpfL2cyoE4s1OwFuVTGeuvSAW877jt0N1zWCRS0r6ot5IsaMEd7B2oq/egPB1HEicxNHOqiE48
	TQppWIAY7fqRoW2o+6v93edtM+jUh/sjIyw0DUfgww91mQaWJcsBIi1O11OJ0aoXffgpuY81IKX
	eN6AjoLGaHA6LaaNiSaiCFArtB1nXRhPbaUMJw+ZIZ2v5nFix0l4ABBioa6GbFXusMjMxBx5CyE
	6WopHisG4e0ZoykZuZCFkHCr0uISepCAMezbeNjbiQAXOQcKQLOjbw1VAaqkMNTjMl7G1rE9bm1
	bo=
X-Received: by 2002:a05:600c:64c4:b0:480:1e9e:f9d with SMTP id 5b1f17b1804b1-4805ce40062mr58383325e9.8.1769416574659;
        Mon, 26 Jan 2026 00:36:14 -0800 (PST)
Message-ID: <da0a5819-f811-4eac-95dc-9c8d33ea91fb@suse.com>
Date: Mon, 26 Jan 2026 09:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] xen/riscv: implement vcpu_csr_init()
To: Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <57ef3bcff854d4b50641641d300b3e8aa715c3c3.1769099885.git.oleksii.kurochko@gmail.com>
 <99289a63-b4be-42f8-974b-7445a6a479dc@vates.tech>
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
In-Reply-To: <99289a63-b4be-42f8-974b-7445a6a479dc@vates.tech>
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
	FREEMAIL_TO(0.00)[vates.tech,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 2B08F85866
X-Rspamd-Action: no action

On 24.01.2026 23:44, Teddy Astie wrote:
> Le 22/01/2026 à 17:49, Oleksii Kurochko a écrit :
>> +static void vcpu_csr_init(struct vcpu *v)
>> +{
>> +    register_t hstateen0;
>> +
>> +    csr_write(CSR_HEDELEG, HEDELEG_DEFAULT);
>> +    v->arch.hedeleg = csr_read(CSR_HEDELEG);
>> +
>> +    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>> +
>> +    csr_write(CSR_HIDELEG, HIDELEG_DEFAULT);
>> +    v->arch.hideleg = csr_read(CSR_HIDELEG);
>> +
> 
> To me, that feels odd to set machine CSR here. Especially if (I guess) 
> that we would update them anyway during context switches.
> 
> I think it would be better to have :
> - vcpu_csr_init -> sets initial state CSR in vcpu structure, doesn't 
> touch machine CSR
> - context switching logic -> loads vcpu-specific machine CSR from vcpu 
> structure
> 
> We would have to make a context switch to enter the vcpu for the first 
> time; but that's to be expected.
> 
> With my proposal, we would also want to move the vcpu_csr_init() 
> invocation to the place we initialize the vcpu_arch structure rather 
> than the first time we schedule inside that vcpu.

Aiui the writes were put here to be able to cope with r/o-zero bits. Yet
indeed it can't be cone like this. While it may work for domains created
during boot, these CSRs would be changed under the feet of a running vCPU
when done this way for domain creation later at runtime.

Instead, as I think I had also suggested earlier on, the r/o-zero-ness of
bits in particular CSRs wants determining once during boot, and then that
mask wants using when setting up vCPU-s.

Jan

