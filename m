Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07276C0D80D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 13:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151576.1482094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDMI8-0002xe-VD; Mon, 27 Oct 2025 12:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151576.1482094; Mon, 27 Oct 2025 12:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDMI8-0002wC-RW; Mon, 27 Oct 2025 12:25:40 +0000
Received: by outflank-mailman (input) for mailman id 1151576;
 Mon, 27 Oct 2025 12:25:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDMI7-0002w6-Hh
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 12:25:39 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ae3c89f-b330-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 13:25:37 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47112a73785so29022075e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 05:25:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd489e6dsm132995905e9.6.2025.10.27.05.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:25:36 -0700 (PDT)
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
X-Inumbo-ID: 0ae3c89f-b330-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761567936; x=1762172736; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SkwRuxwjBWAX4EHC0ocil+cJFvCSQACmhtofw/IlD2c=;
        b=DPTC3avRmiw+P46ONxu9jrgI7a5pOeQjFGIB5rXR5JJ6u5eU9plunlbzg07MQI52ub
         qSCrjko2eGB13kKFCS+jsC/DtZ2cYIlJx5GZYqD3ScjbxlVLpqKUPTKR63leQk96+FRq
         gasyIW2BrzStlT7bMKgual6ga79Ic2HUB8dBD+JEyPL4ITuULnsneTBYlQ8cCDhHo0r3
         2Qf+Bx4ChLoffvc2jKoAdOdjK00GQTP6opqzYPIKGCuBV6pAyn8xHxXl8rTgxACzLTan
         ZUv54ib40Jq+rdXWnx2Ph7o/hMjv9R6B/drts01qCsh7AaqCB6kO5c/6kf4C9f0wZHsR
         NtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567936; x=1762172736;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkwRuxwjBWAX4EHC0ocil+cJFvCSQACmhtofw/IlD2c=;
        b=Cu2ctK20pKe8lfwpZyXgkb5xPEyCo3uBA6eMaNP6n6DuJiDeFHVUI2xxN64Ce1uSS7
         kFTj76iSFTzuHE8bxR/mcVQuIAn2AEHlvgTLf03kyaVvDAkCHqJcQEMKuv9IFjhLcF3r
         boGFxkqDpCxAOggoVC6votynBqymNnfhNsH3SVQ8oJogauQPEpLL7ADujevsPhkEU29J
         L4i0XC349f+svO5X0Qm5cPlQ557n9loNL7MDB1vG5S751Y56eLO7ojoq9h/XUKLg6OK6
         u3Ch3zB/8uJsTscWDwT2I2oUvPFHURKcGfsb9cIGq+wlg8sbXuQw9aEyQ+Mg5LDDkk+V
         Y4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuJJOUvEW7v+kPCNAKF8X53S0UzbgBM/M4rom9Kr6XJNT7yE/GFYZADrxMaORJbeRB/5ZsdhL/f+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6m0fpyxD2S2BUI03xUzYWR8MB5T5HZL/yFJCLXxqaM6pFLeFT
	LaJ1bLS9qn84tqSGtfJ+suGkGLjDXwClvY5WNF0+2ucGG/57DjKjGoOPbPDtWPAajw==
X-Gm-Gg: ASbGnct/emXOLA+RCfYfJt/HcEf1h9dr2dejk2d/S5bvRRZb2V3UA71sTUQxfj1/smu
	VJQf3JtJ9meyDrO2oIC38y/TKWFx1ja+pGL/Ef9hYnuZpgbM0DPhssA4sP3/twhWTWaJot6Ld/1
	LTxM+klPpZU8Z5wG2vxLXgQ/J4Nr7flIZBCSJCUo5r5yAz1jEfzdWET7TO7utmn137HMVmYMztc
	s2IgH+FML7vC40p+j+2LA6auw+wvgZwdU7QsJIJjMEZTVcTyoGUGd0+ozYSyQRWV2WPT1Wqu5DZ
	bKqMl6BJwrUhzH4hP6LRN28LZFiPwR0hYH/nMVPlMKqJ/epmq6FwhuriHBeGLWYTqgXnqI1ystY
	a7g/9dz/UHPQlv6IFRITCITxpa7kPAcpd6wnQpFvuS+UtDkaOKPdPbHOVUSqW2RTKR6z8M04x/3
	K+RPOnfipij/SxEl7WN8Srv3nrv1XzVj9AO7x25WkoWiHKqAh0Mr9/O0giF1a3
X-Google-Smtp-Source: AGHT+IHXFjQC1QIiOhrHAvgEA/ZuZSeqb1BnemUnk0mP5BZ2q6Z4IN0ITphrFF2WoWqBiYTNnWCHrg==
X-Received: by 2002:a05:600d:41cc:b0:471:13dd:baef with SMTP id 5b1f17b1804b1-4711791beadmr231053875e9.26.1761567936496;
        Mon, 27 Oct 2025 05:25:36 -0700 (PDT)
Message-ID: <b10cd3de-0449-483e-bc84-791ddda59c53@suse.com>
Date: Mon, 27 Oct 2025 13:25:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.21 3/9] x86/HPET: replace
 handle_hpet_broadcast()'s on-stack cpumask_t
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
 <dcea0975-8642-46b6-ad79-ec76cb8a76f1@suse.com>
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
In-Reply-To: <dcea0975-8642-46b6-ad79-ec76cb8a76f1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.10.2025 17:51, Jan Beulich wrote:
> With large NR_CPUS on-stack cpumask_t variables are problematic. Now that
> the IRQ handler can't be invoked in a nested manner anymore, we can
> instead use a per-CPU variable. While we can't use scratch_cpumask in code
> invoked from IRQ handlers, simply amend that one with a HPET-special form.
> (Note that only one of the two IRQ handling functions can come into play
> at any one time.)
> 
> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Views towards 4.21?

Jan

