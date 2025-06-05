Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF9DACED54
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:10:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006494.1385670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7YA-0006mI-Li; Thu, 05 Jun 2025 10:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006494.1385670; Thu, 05 Jun 2025 10:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7YA-0006jH-Hl; Thu, 05 Jun 2025 10:10:18 +0000
Received: by outflank-mailman (input) for mailman id 1006494;
 Thu, 05 Jun 2025 10:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN7Y9-0006jB-73
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:10:17 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43e3cc47-41f5-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 12:10:11 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a4f78ebec8so448798f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:10:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb029fbsm10019616a12.13.2025.06.05.03.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:10:10 -0700 (PDT)
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
X-Inumbo-ID: 43e3cc47-41f5-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749118210; x=1749723010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hyb8pyb5E0pGicxrf2oKxF8Vsob7n2tNZHEM8CYsMIo=;
        b=YC8BPOMJP1jxrFxCw0yr3J3ELGzmEkLglYfRH2RZgkuZg3RD1BIXRKmJ2Fuiq99k/0
         NosKZv2PwGRqhSXF/UzHd9Vhhlz/qwanI9MAoNjPFCKhtY72uxT5858YRW30UZ7vFHWh
         Ji/QU2qxhQvl6Oj3ava8aeN6OwllJ94dhqLQazj9lahX4nYfgx+gloZFfaTPORKACFC+
         6UHnALqZTU9cWimc0Eb3kDWl6USe8/eaM+VtbUyM6MsJyfSPMIKlR1EHoPuGPp4jxWNB
         BlXrHgUg6AV6StLcTWxpxN4IFxQjjYwJSxEYaItUHdwXlhhTCZOCXef4UnLTin4s4IAw
         zK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749118210; x=1749723010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hyb8pyb5E0pGicxrf2oKxF8Vsob7n2tNZHEM8CYsMIo=;
        b=af+5gugM8pS4crHfwVuqAZvO6o1sGiSxIxZnlrZuNwL8RcMs+hOFk7t+OY3v0OW4ku
         o2yok98G7AX+67EFCmcY5oHnzLsDHPXqiLtzF1EBz2WLhWsK1qgmJCURSBV+cV5yAevf
         jeMnLzlnIaLElAJFDKbjm9CGX+Iy6KLtS8d2AYkoKRoYiM2zSMBrhQ9+4QfLLl2o2RST
         tQJX7dRpTmeF5t7UAicJtqnQ4G8+5OuaBrEwNHxF+0SPxuvDwTOthTFFamjARxTblUy0
         xTxdQRcq0W917AZfaGAb52zNPCs+jPDKC1idRRJC9xFvRodBb3YEHvaIXHN4vp4McIyq
         pR/A==
X-Forwarded-Encrypted: i=1; AJvYcCWu2pnEGQrp84qtqmmDc6MlgV2iNcc2M5cpNPc+fgGQqqN4XqWwVd80VWDfwcEih66b1TsHaD3fTAk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyikffQMqZEJd7fK5aZjVgorTw64+dHItGGkpwXpmYGVeDhwCg+
	OubhTkjI+j7uU+n3sAiWxclUthW8Mmq9fx8oOUUszOa773kYRh3ICjpe1X68omBicw==
X-Gm-Gg: ASbGnctn3Gz0pouOhkJNl+xDvECWR+nw4G7dYRcHk6q9bncMnQnBdzl699o66+cPSIy
	ZpmF7QmIaUw8g6B3slkZjRSke86UredAw2KKEvfeL9xkdNDlACz13Xi3tCnhZ7whpTlWhFyx4D3
	bl+eOkjxScNzvzmjfSimDBOxC1RnfXEU73FAP3mO0tKmzCTiol6175qijxT+FeDOmoI3xPw1K9F
	DoBE/EGI4LlpcZyWIGZLxWcqYWGyID9876UAmLpMADMPU0Eq+H1gbDyjk/KeWD1wofILsbj3qnO
	328TWa5uOml+pSItgV7HOlU5MCjbnIDk4J5M6oNVtgX2VjER117MP9CKB+KXcHj2iclCSTI2ruc
	RKffEm2HjH1OVT9koFa3zZjvntbcLjiZcXf1z
X-Google-Smtp-Source: AGHT+IHRVNj6tJIbyrXX9xmMq8Uq+owAhF3uE47tuWhTg8lakzvIaKUixg4LS3yh27G1Q7cnwPPeUw==
X-Received: by 2002:a05:6000:24c8:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a51d98c2b3mr5111189f8f.57.1749118210605;
        Thu, 05 Jun 2025 03:10:10 -0700 (PDT)
Message-ID: <202b9b4f-edd1-4bb4-a61a-a1fcf8333108@suse.com>
Date: Thu, 5 Jun 2025 12:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] x86/pmstat: Check size of PMSTAT_get_pxstat
 buffers
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
 <20250527152635.2451449-2-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250527152635.2451449-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 17:26, Ross Lagerwall wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -215,11 +215,22 @@ typedef struct pm_px_val pm_px_val_t;
>  DEFINE_XEN_GUEST_HANDLE(pm_px_val_t);
>  
>  struct pm_px_stat {
> -    uint8_t total;        /* total Px states */
> +    /*
> +     * IN: Number of elements in pt, number of rows/columns in trans_pt
> +     *     (PMSTAT_get_pxstat)
> +     * OUT: total Px states (PMSTAT_get_max_px, PMSTAT_get_pxstat)
> +     */
> +    uint8_t total;
>      uint8_t usable;       /* usable Px states */
>      uint8_t last;         /* last Px state */
>      uint8_t cur;          /* current Px state */
> -    XEN_GUEST_HANDLE_64(uint64) trans_pt;   /* Px transition table */
> +    /*
> +     * OUT: Px transition table. This should have total * total elements.
> +     *      As it is a 2-D array, this will not be copied if it is smaller than
> +     *      the hypervisor's Px transition table. (PMSTAT_get_pxstat)
> +     */
> +    XEN_GUEST_HANDLE_64(uint64) trans_pt;
> +    /* OUT: This should have total elements (PMSTAT_get_pxstat) */
>      XEN_GUEST_HANDLE_64(pm_px_val_t) pt;
>  };

Commentary here is still confusing imo: Since "total" now has two meanings,
saying "This should have .." in OUT: descriptions is ambiguous. Imo for
trans_pt you want to say something like "will not be copied if input total is
less than output total", and for pt "the number of elements copied is the
smaller of input and output total".

If that's okay with you, I can edit things along these lines while committing,
at which point
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

