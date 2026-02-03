Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJYQM1QqgmnFPwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:03:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00DEDC709
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:03:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219475.1528354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJnc-0001u6-VR; Tue, 03 Feb 2026 17:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219475.1528354; Tue, 03 Feb 2026 17:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJnc-0001rR-SH; Tue, 03 Feb 2026 17:02:48 +0000
Received: by outflank-mailman (input) for mailman id 1219475;
 Tue, 03 Feb 2026 17:02:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnJnb-0001rL-70
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:02:47 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a5084a-0122-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:02:44 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so5573590f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 09:02:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e135422csm55571856f8f.40.2026.02.03.09.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 09:02:43 -0800 (PST)
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
X-Inumbo-ID: 28a5084a-0122-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770138164; x=1770742964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XbcbPTbamxacRkAgnHsPn1/o/XGwaQUY0Vgs+c4ndB8=;
        b=eZCykOfXcdKA57EKTBoWtW8C6OedzRt8dSuMqH1OisydBgWYBdkOQNZ6wobbK/SFU6
         KyRg8hTpFb0xGkqEZSOAMp5u6cS9zHGzt9Y9I/DTgCBA8FwWOMqsWcBH5WKXjm8RtwnG
         Y2EM9+GqmiyAi2dcXqhI02blIDVCNgcS4Gj+VV75YtiP9hBhwqk2neX7KCbAm2g22+Nm
         kQV9R6Gn+DL5PuATSxQS7o9qf9cZV9JwrpdmhzmQqzmXf5/5P5mmMHPYljo99LLY+PvH
         1hG7Q6ktWu1wvaHLxc+XM+kPVchg8KwNtBFgdM6PFH4DR5H4X89tbfq43BgThrywNZBK
         AcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770138164; x=1770742964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbcbPTbamxacRkAgnHsPn1/o/XGwaQUY0Vgs+c4ndB8=;
        b=XaWfny24Gd0ChZNqf9Uik2mK/DRk1YrLJ6YN972zW/bIw3m8xf9F0lvAISqbRczn0F
         fJ8jO2IvJ2OLZZuE15FwGtK0OZVFux45or1576LFUj34KRhZMmd1c66XW2n2lWBXQJ9E
         vR3M8hfXZKroCXCLLq90aFpInw5vWoX9bWARPHL9jfvmi7VOwYqzOFGmAuod6ggbvLQ0
         tP+FlvOZDr/XPnLc3bDwcYDhBylQwYykZEfvrEP5N1fdtUSbHBfvYKLTGCxK36wzlTwn
         VQDJkl/oYieA01cI8o9Oe+ofLEgJHPmRLZ2b/hVTNVY/SkRHc+t1AcD0EP6SJtBL+90C
         QfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjlnalYeq69Sw8BhMapD6Tj/+ZZ7dqMpfS4I08+hCEsHo4+rv8IuGzCDa3l0HUQaU8K5V7vCHN1is=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL9gkVdlxSZvgWAFF/MAn1xj4r/kViPD6sVym98pOOyqfWt2uG
	wCMOp/+ks1eTqF8pY/G4DPoc8wmeJd3ssi0k/O8+mjuoNJoe24AWHuoT9gtD5Oe05Q==
X-Gm-Gg: AZuq6aLSneWMaiEhA8Wz97yIc2qHJyeQax2vZJQ5XLBtycijggZLcrgelN70WkKYYHn
	kvS8t92BUdPYWq7LF/+lZAvfXDHY3yji0eIQQuq7RuIB4FCEWO7zUqJNJElED9OkKxGORtc9uLL
	diviq4zHa54jZA/U14zU8vnB42x02Uz/WzhyTbyyxz6SaiVGB+PWzTrsV+1O/l1UcVd+1tF42cH
	pMXV7u6nvl1AWA2nnQnG9lLZFb3Isuo6w8B4CkNIcKnC/t2WWTdb6d1OMnKDRl/saA89rVHSOoV
	MHEPcamlbUHJcoKLtdAfVvDD6zbNJr5erYD9Bz0Dhsr9oKF56fkKg7eBKZd06UMmCwoLzY/yYq2
	TnOUZaze0d9d3nv1ZFRqKRrhyt0PV/Opeg72Zuft2UFoUL0AyouLEBImdrm8q5sOmlnFKGBk7H1
	L4+7Bm6WwMFdr7miOs1C58fasxkO+/XV/GAN0dfdjuMPe99/WtR9jKNiPKaCU0uzic7gF9Be6zC
	5s=
X-Received: by 2002:a05:6000:2881:b0:435:db94:1933 with SMTP id ffacd0b85a97d-43617e3402cmr24338f8f.1.1770138164175;
        Tue, 03 Feb 2026 09:02:44 -0800 (PST)
Message-ID: <9f2b3559-0658-4343-abec-1a35e7d6da44@suse.com>
Date: Tue, 3 Feb 2026 18:02:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] xen/riscv: introduce sbi_set_timer()
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
 <2fd4da2ad7c4af2241368edba739b24d0e976552.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2fd4da2ad7c4af2241368edba739b24d0e976552.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D00DEDC709
X-Rspamd-Action: no action

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/sbi.c
> +++ b/xen/arch/riscv/sbi.c
> @@ -249,6 +249,38 @@ static int (* __ro_after_init sbi_rfence)(unsigned long fid,
>                                            unsigned long arg4,
>                                            unsigned long arg5);
>  
> +static int cf_check sbi_set_timer_v02(uint64_t stime_value)
> +{
> +    struct sbiret ret;
> +
> +    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
> +#ifdef CONFIG_RISCV_32
> +                    stime_value >> 32,
> +#else
> +                    0,
> +#endif
> +                    0, 0, 0, 0);
> +
> +    return sbi_err_map_xen_errno(ret.error);
> +}
> +
> +static int cf_check sbi_set_timer_v01(uint64_t stime_value)
> +{
> +    struct sbiret ret;
> +
> +    ret = sbi_ecall(SBI_EXT_0_1_SET_TIMER, 0, stime_value,

From this name I'm judging version 0.1 is meant. How does this fit with ...

> @@ -326,6 +358,14 @@ int __init sbi_init(void)
>              sbi_rfence = sbi_rfence_v02;
>              printk("SBI v0.2 RFENCE extension detected\n");
>          }
> +
> +        if ( sbi_probe_extension(SBI_EXT_TIME) > 0 )
> +        {
> +            sbi_set_timer = sbi_set_timer_v02;
> +            printk("SBI v0.2 TIME extension detected\n");
> +        }
> +        else
> +            sbi_set_timer = sbi_set_timer_v01;
>      }
>      else
>          panic("Ooops. SBI spec version 0.1 detected. Need to add support");

... the panic() here?

Jan

