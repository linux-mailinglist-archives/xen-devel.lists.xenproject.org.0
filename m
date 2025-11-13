Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539ACC569DA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 10:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160816.1488868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTjX-0003h5-25; Thu, 13 Nov 2025 09:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160816.1488868; Thu, 13 Nov 2025 09:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTjW-0003f7-Vg; Thu, 13 Nov 2025 09:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1160816;
 Thu, 13 Nov 2025 09:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJTjU-0003f1-Q0
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 09:35:12 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c22ed61-c074-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 10:35:10 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b729a941e35so86096966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 01:35:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a49884dsm1043134a12.20.2025.11.13.01.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:35:09 -0800 (PST)
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
X-Inumbo-ID: 0c22ed61-c074-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763026510; x=1763631310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YG9oWxQDB0T28MDS53X67Wp77jXQH/URljytmECbxiI=;
        b=Ll2GVfW+euxyQ7AId61PWbx/Q5FtUfFmnCbfpl9VArJPCYALBJ0A61EPYAVMqM31e+
         B4Btf3FaSjJiYqUaMiEphRAsYmL87HStCH5FG0W3jmE2luv4BiMVJBIWOLP+ol+m9nT0
         hGzbVoEMguOJcDatUMHMO5aY8p2v0qCwmmvMTNv63WZtvofon60NxDntOPcZvQsFu2g9
         YW0l9MHWX1ze1OQ+y6TjEDRcIIzA6jjlEMvg8pIFEIplyYm/9rfQy5VfoifEqBdFoho6
         V07dtoXYHNN6lwqFWK/QWBE/A91YeNi23+vqPlu4Ko3vCnwmgfL3uG4xiImttCyVHAnk
         4yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026510; x=1763631310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG9oWxQDB0T28MDS53X67Wp77jXQH/URljytmECbxiI=;
        b=MI/BIgk8na5f1K8QK6el4urSvC8MdGgl/vHBPOZybKmeHhBz4/PpubGnDN93gQFPN/
         8WMWMxqgZZGMX69pmoPzZx7/UxjjlDJ8JRZExldY9EQJujtN2cNKcPvNlShIt6tufbhX
         nZD3ojHJE5Uj/PYbZssIP905FNwqlwD5DPH/XkXMJZu5zhaajRJrlaFZpfe1StqjiDeJ
         z9ne+c2UCw16n6SceegBytS/D5o/yUrD1cx6VfqXUDmz4qzfZ0UtS76SRC9yJujLjHaC
         uQNLXqe88kAh2knsImOTSDf7BwnhWQOqAgTvNFF4UfbDlJWYMiQIGp3WobtFohI4ooN7
         DltQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB8gxTQydItMDmTqZ2xyrS2K966ox8Aa6yZcFzt3tO4ylkEDBTrc4cFLWMo+x/K6HxhUSKg+vS+b4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAlD0M2Toslq3vM4mthEoD2oqXFg2iodTr7RranyVS/EQO4oS/
	uJqPKqoVh09JZMkUema+XO8z0AJEHATmARG78YB0FReXkb/vjkkH33zVIsXbqH1HPQ==
X-Gm-Gg: ASbGncvi+8646CrugkJP94CPH+P1itpU9GeJa9TGg9cTom9mwb8iHLyuNyLNDMHIy/e
	6f8S8G89sciT/6mcabnCldArxDmga2ylIrCwFYVWeP+I/QbJKhn9Pfen0EDOEQVxoEaU4ICLp/C
	bQtQxX3HvCGHid+hR6Pqu+DbFOPjTAJNZG3JcdmOP7UUpjz99s2aitvIBstUNNdgbxQZ996C/1R
	KU3KSakFyQuiI0uF/9o/PVLyMi2xuZqgZfLHg+KyXXg7Qu8AN1K1lp3WaVGTXHatwwgqITZaXKB
	R28qd6kLYe2D5R1Xv0jcTk/Ueex/njo/RBbAa1n3+YytPq+YYksuGjqsg33k3yyja3cvLHRnRrA
	Lcju33UGeDiPTV6gtwaiANTSuF4dw3ZYuHgQLRayTOGl2pioR91lG9v9zW+0CNkAhqL29NTKA3Z
	tAeWIJmoynzpCB0647PHAwmSou8rnudbG7wd9wvqu1soGZzn+WR8vSNaytsxMyLWqO
X-Google-Smtp-Source: AGHT+IGbP609jo4Jxn/0MtRsp0M++k9Ekz5xs7+FXeeKtYHY5i5iVePZfCjHa2VGFVa9GmrJ2nKoGg==
X-Received: by 2002:a17:907:9709:b0:b46:abad:430e with SMTP id a640c23a62f3a-b7331a972abmr636309666b.37.1763026509636;
        Thu, 13 Nov 2025 01:35:09 -0800 (PST)
Message-ID: <136416d6-ea2b-444d-b331-8aef1881ed91@suse.com>
Date: Thu, 13 Nov 2025 10:35:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/7] xen/x86: move declaration from mem_access.h to
 altp2m.h
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20251113031630.1465599-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 04:16, Penny Zheng wrote:
> Memory access and ALTP2M are two seperate features, and each could be
> controlled via VM_EVENT or ALTP2M. In order to avoid implicit declaration
> when ALTP2M=y and VM_EVENT=n on compiling hvm.o/altp2m.o, we move declaration
> of the following functions from <asm/mem_access.h> to <asm/altp2m.h>:
> - p2m_set_suppress_ve
> - p2m_set_suppress_ve_multi
> - p2m_get_suppress_ve
> Potential error on altp2m.c also breaks Misra Rule 8.4.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

This looks to be independent of all earlier changes, and hence could go in ahead
of any of them?

Jan

