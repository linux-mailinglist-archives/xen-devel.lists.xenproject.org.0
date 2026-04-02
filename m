Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Bg1ARyEzmm4oAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:58:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6962938AE0B
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 16:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272063.1559962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JUz-0002im-Cj; Thu, 02 Apr 2026 14:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272063.1559962; Thu, 02 Apr 2026 14:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8JUz-0002fu-9i; Thu, 02 Apr 2026 14:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1272063;
 Thu, 02 Apr 2026 14:58:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8JUy-0002fo-3p
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:58:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8JUx-005QZB-Gd
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 16:58:19 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce8405-2eae-0a2a0a5409dd-0a2a4506df86-20
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:58:19 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce840b-0df0-0a2a45060019-d155dd29a936-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 16:58:19 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43cf3ee0fc1so1527574f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 07:58:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f08sm9966660f8f.6.2026.04.02.07.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 07:58:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1775141899; x=1775746699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kSwcmUGlWSvHjg16bVFgvYlXHPpn/x1Y+S982f7nVuI=;
        b=G+7+DslEQ4NCN/nYYfumfjiM8VHGOEI7eq2suQINln7Nt6R1Mnb8L+s/yy3zd7q+sF
         fALNClsv8OoYec0FxCIv8E2YAfekAI/LFxDaAXNGcF1FR2fVHjdRAVk0e9kY4/14dKDQ
         OK6THZfQtfp8HXLlQ2mT5e+my8Y4ZrpGRoytvSmMMcHY6dTWLlX1vyS8HoSvpaajWd7F
         fFCdzjn6fFyxpKxSH7Pk1lWojAExkxWEp+nbMZMRPzyRUCZGrAR1ye7PGjSEP99/oGCL
         VF6ShZ7AuWYSKMe5Lut+diCRnx2NacjdSF8a6js2hh2oGPi2Ig3VFALGzxM4dTNbpCPo
         +7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141899; x=1775746699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSwcmUGlWSvHjg16bVFgvYlXHPpn/x1Y+S982f7nVuI=;
        b=PT4z5td3MdVablRJ4RtWZu2rDNsMCslxh8oCtOn1eyuP2QDDkjQwXyIoEYC0XHgPid
         mgnIpvAQT96EXO5m3kX8ggLhEcCt2cWnlc4t0VaqPsS5VZzd/9nBb8Ag+hV8LqtQTKBg
         RxZ3kaDuQowC6fSh6/kBSteSwiPNKPOxkkOK9KdPbLV2ckHA0qXUlUyXVP9+i0eOImUi
         9jJwI1Ewt9mZhk9pgda6yT3b9yg89QZwHr3NnmQUdKFvyV/ByfgTr3YPfTH9mJbKlQnA
         zEJoY5a2BPoUY8O55js6FluUlG2KBuBo/TsHZWG5DWagcUaFZL1uvOSB9fqg50NG2r26
         gY+w==
X-Forwarded-Encrypted: i=1; AJvYcCUgio2NyRfaXFueSFh7gIQudqKQGtwn1vMjoANTFhiR+VBm4gqioTolU3xYafdoY5uLJqHFsBv6F1I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCY0O1tFw54sHVinJ2Kve4BGNJmHMWOH8A+IilaQNm9d6kFsmV
	FCYR2Oak9K1c2nZQd1vMTFjlCDpc/8QliTVnH2V0/L6MUVZhKFqYLa5iPcyHvYPtRQ==
X-Gm-Gg: AeBDietDrCImLzNnJNEoDCBr/qvw2Js0VjIssdHkHJwJqXDsQClONw/Zb7fwLPJZGGv
	WgmO0l3udybYiwFCB4HnN4Mz4uyBiQGD4rz5t9p9jNX2fODOrfZ6Ck+lhDmjsiW32QkQZuDgmfX
	2yAazNEVYxjGwT184CmONiWTvncgtRWvTuF8DsCBR7CqcAzm9IXzNfOFBoOiPgnDIUG4qHYVnJT
	SKAd1qPEt0pkUYfpSm8AWYQicbz7RL9eXRzFWH0ExgwsqUA2sEywSyKSE2Ik5ZX6+t67OE/V7sd
	bEd3uO043oJV565WBZBhelNnrsysZ8GmQ0y2E3ehpfrV91cTRg8dGRkvJz8YdHtpLBpoXzLxceq
	ETuZZNHhwfkxhHU72SKr4PAq3gmNWnkggloTkMnUdFVK58BbpnulQrxt0PdkMDZVymaV8kAnouA
	ZZvHfkG4T3Mnn7D++igVJ0rIIYzIAA6jaO817BfmeQKTATgnj/pvucXBu7IcJc5O5HyJFNXblT7
	J1l1TmonGHwkMA=
X-Received: by 2002:a05:6000:4a07:b0:43b:4461:7adc with SMTP id ffacd0b85a97d-43d2124cd7bmr4123083f8f.20.1775141898700;
        Thu, 02 Apr 2026 07:58:18 -0700 (PDT)
Message-ID: <cf20ebc8-ff58-456d-a7f6-c844cb427306@suse.com>
Date: Thu, 2 Apr 2026 16:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 21/27] xen/riscv: introduce (de)initialization helpers
 for vINTC
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
 <61311834fef7cf8a736a8fa972b6461bbfd46e6d.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <61311834fef7cf8a736a8fa972b6461bbfd46e6d.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775141899-5C9223D8-47B1F03A/0/0
X-purgate-type: clean
X-purgate-size: 729
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6962938AE0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> @@ -96,4 +97,7 @@ void intc_handle_external_irqs(struct cpu_user_regs *regs);
>  
>  int intc_make_domu_dt_node(const struct kernel_info *kinfo);
>  
> +int domain_vintc_init(struct domain *d);
> +void domain_vintc_deinit(struct domain *d);

The former has a caller added, but the later hasn't.

> @@ -87,3 +88,42 @@ int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>      return d->arch.vintc->ops->map_device_irqs_to_domain(d, dev, need_mapping,
>                                                           irq_ranges);
>  }
> +
> +int __init domain_vintc_init(struct domain *d)

The __init here and below is questionable again.

Jan

