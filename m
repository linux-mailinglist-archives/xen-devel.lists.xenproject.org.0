Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D379CB45012
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 09:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111445.1460171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuR2q-00039e-8G; Fri, 05 Sep 2025 07:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111445.1460171; Fri, 05 Sep 2025 07:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuR2q-00036V-5J; Fri, 05 Sep 2025 07:39:40 +0000
Received: by outflank-mailman (input) for mailman id 1111445;
 Fri, 05 Sep 2025 07:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uuR2o-00036C-Sy
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 07:39:38 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7916f9c8-8a2b-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 09:39:37 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b0418f6fc27so285613966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 00:39:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff15fccad1sm1599532166b.108.2025.09.05.00.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 00:39:36 -0700 (PDT)
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
X-Inumbo-ID: 7916f9c8-8a2b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757057976; x=1757662776; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bxBl2+ipg4oH2IDTr8qT5pfOuU6yISDJu4FyOB9afXU=;
        b=fG3BcqRJMFhdWFEFFEoFzadPD8w3G7WCvnkbsJszzQtuuzRSlWif7iqh6FxJ+k2OVA
         r8OldJXGTZGXtYdhGOAiIvHptCx1Ulr47DSqU1bWj6r6ySkcY2ZvGbG3jDXwSLZbTeAL
         hCW3kszq6KO8PHq2WoPqerFb8p3Qg/bvLROQDU6AiEkzm1gz0id0Cy2Auq6HDLVR5uKR
         th2syas34aDay6flEXsiBH0HEceIPRAFYPUZ25j9w2GZXsnKzuMzKMv8icUFF1oRn0Ij
         OQUs8hYWRAk5r3mqPBuvZ6hi66LF/C0aNA8w1BvYUvqds4OkvYZp+Na2AOoWx7Rq17kc
         htCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757057976; x=1757662776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxBl2+ipg4oH2IDTr8qT5pfOuU6yISDJu4FyOB9afXU=;
        b=ttXYMRyBabQjYjO5mGyLIaAMhXUiD01F9rQhZc7maGxVgpU2Kp7BW1vC7UAxJGw5ll
         WAxYLDYNafydX8rECdA0N16kfPPlfzu52b4rwSraWHKWRav7cyXNi6Pp9Q+DBN3Vkxno
         fVy2gMjDED1tZG/YPybnLKN7FewlSarkXOQd4SNA+MNHrvsiYENhho5LzBQr4MI7hdSv
         93SSytkNzWK3+ojGsiFjubb1puJ+TY53Iyb0x/IwLOo+sPH2OoJpUzlPfVcuKLqWfxRJ
         htvmJyITpo33PO23QD9OBd0GMHPvwV1MM93DXdHA84ZttHcIujnakZbFKS7VmUMttpqk
         Wkpw==
X-Forwarded-Encrypted: i=1; AJvYcCU1UKwRKWGd4bPr+TMootTAJ5anDPpr2cFQGMV8LMrJeM0yVFiCiXe3RaAfpJv6cjzkx84co+NDvTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSplUvA+ZFha/IruLcN2W/3tbwFMh7lN5uFPMpXr9pNcpSLcfY
	LOcw79UsxPDzwvSQZ6umCGhjJL56/tmYnTZzSoq2VLm0XfU+v3rQerUXe4Yg5dVlDQ==
X-Gm-Gg: ASbGncvUTDmEyWl/2pxROGUUw0dK39B9qChckEo4aA1X8poeTb/vcvabi0PR9Xy431s
	hqe1uWFWwgUIIrYGq8eAJQYWyOMpK5V9mrjW1FZT1AHm9aipcTBUYXZTWDLkBT7vIDlvg1zR3Cd
	e2Vxv0E+xDWp5P7TJWIXKFI/EJsanUaI6pBxISKTPHx2NomTqlpO9CiZVn5OwJiLpmjSh5ScKPN
	7xwCPCqV44GLpci0HMDWBWqsMKdGKg7LxwntNlvxId1BCpsau7Vs8H0AjfNbdHq/embboxD3cgE
	bBAqp3ip8ICfA9ep5Vsp2W7yfPqLBIn55bOAF5pQSVzeN9J0ox0cmHo4xoXsbKnyK/UGmSGsXzS
	1TPsIo9voVd6csLf/KoiP9H3czLukmBc8Tl/UjcVLSlFogMeuJeeJWb6FNV1iAiWy+6MeQ7d96H
	3SbYk5JOJ/aAjIqp9iKQ==
X-Google-Smtp-Source: AGHT+IHzooTQPQZReUjjuhvLyKkqPUEUG27QiHszwkIqz3kc0qVgX5iNh7WmeM93i8N/6xFJncdUYA==
X-Received: by 2002:a17:907:7f89:b0:afe:d62a:f053 with SMTP id a640c23a62f3a-b01d8a322c4mr2213506966b.10.1757057976376;
        Fri, 05 Sep 2025 00:39:36 -0700 (PDT)
Message-ID: <57fedb53-18b7-4d81-acc8-2756a899ef90@suse.com>
Date: Fri, 5 Sep 2025 09:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250904215137.135529-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250904215137.135529-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 23:51, Jason Andryuk wrote:
> io_apic_level_ack_pending() will end up in an infinite loop if
> entry->pin == -1.  entry does not change, so it will keep reading -1.
> 
> Switched to breaking out of the loop.
> 
> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Noticed during code inspection.

Well spotted, just that ...

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1715,7 +1715,7 @@ static bool io_apic_level_ack_pending(unsigned int irq)
>  
>          pin = entry->pin;
>          if (pin == -1)
> -            continue;
> +            break;

... we shouldn't terminate the loop here, but rather continue with the next
entry in the list (if any). Hence presumably why "continue" was used, without
achieving the intended effect.

Jan

