Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4894CADC70
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:40:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180993.1504085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeHq-0002ff-Kg; Mon, 08 Dec 2025 16:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180993.1504085; Mon, 08 Dec 2025 16:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeHq-0002dZ-HI; Mon, 08 Dec 2025 16:40:34 +0000
Received: by outflank-mailman (input) for mailman id 1180993;
 Mon, 08 Dec 2025 16:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSeHp-0002dT-NA
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:40:33 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ceb2964-d454-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 17:40:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so30228035e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 08:40:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311e712fsm256653615e9.9.2025.12.08.08.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 08:40:30 -0800 (PST)
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
X-Inumbo-ID: 9ceb2964-d454-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765212032; x=1765816832; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rTtWllHYA62w7VlcuiZIpXkl1SBHzN8+ONW4oNpSPVM=;
        b=Ls38D8ylzUE7ynU5MfehfQLfjQIFCGpRbt8wGWewR1h64BJ244RmvquFwLaa8G+QE3
         d+LXwA8Dxo2yLzOGlxbTLuhbLYSICtOShxPmJoCQLALzx+UvgXxjnm01vkvww4A05/Ul
         xCfacYY3WRTbgpn7IubNx4Njl5uqZTSQaRg1890YkaX7huHmrYkCuug0rr2vrJ8HTjij
         MTm9vRvSw+yomccbpHz/K3cFczu+w6yMQW7Xn3jh85qvWuOivJ9RKGi8Sm1Hz1Iu6RDQ
         8i7bBMDyJy6UnqEMnaa8Qvze/0bv92gVA4hHiHAFPNj6wMD36OpckNFGv/1KeYhJdGos
         YFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765212032; x=1765816832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTtWllHYA62w7VlcuiZIpXkl1SBHzN8+ONW4oNpSPVM=;
        b=Hklb+FcEO8dEllEw+51KwYizKiMPSqBHncm95c9X6PwSBlQQTi4l2N1WvxhC0npxnL
         gB22hmBVgltjiXysRfrUxZdLb28BREofCpe+yseF/1bt9Vs/6Zb2ccL3zDaLz9jWfk9v
         qlK4wnGE6XmRC3J90nRebGd0+LbfcJW+9RLCZEXRmZ+WxQYy+D9LgflB+9ARYSpVblQz
         8BH1bwEy1i5hFe7XY3e8kBx2I869LMfJ269c7AI2QoHDi9NDJowD0SCTDZIeRjAA70xw
         zBS/8y49TOBljBR3MIsLsAoYTp1Gs7nuNnCRkaQB+WLeJeEi5T0YkWYUbKXEbYGnA5Q+
         QyGg==
X-Forwarded-Encrypted: i=1; AJvYcCUyMQUAUkxo3hg7tWDZQ1OMAPSdStiXE9h8f/6bgTW/JGciA46MCyjyW40b9TzHixX/B/4vO9loMpU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5CYoceQNa9jK9NLXslXsiiakwCNjpw6OHlRAAGaKpwQewlGxa
	TEN3BoH0B6G22C5GKCYMdZbpcVEiic2P99KQOlOkUgSXPRfTbddcUnbc/3q2YCJe3A==
X-Gm-Gg: ASbGncuF3tUdhiocmqTWxAtesiHiHfh7VX1QMziMqbDayfr2sTso/d4HuI+Es2wlbvL
	NLfgtUpQ9va+9y2tytQs0fQuJ0tB1c3iiOpiwh6YI4WlsnCWeLlyHYZW0b1fOB5HlvqGkIa94KZ
	5BSySBfOTt2d/rA48S9CvPf68kqkKGB5JIwUdcKgGuwWs82efNbvITUGPCRSmps3eiTnbS9Mskr
	pyabLbhK9kU11S848BZW1dWL2R3UPFncISMT1Jybp3zMYNSCXvD45cKdBrh5Ojduct4LsAGO1y/
	MsAq/6OMQN4I3OzufW3wROfPsbC0F1UpGtYU3rvf2RgfKOtlaKHyT0b3Ai8CM3fu37oOI3hV3tP
	RiAXKB3RBYxsgJLfQGlxZT8s0snocaseF1A2hbWqIB3l+S1OA9L24sTIHLbvaYNyhSeNXOmtgXc
	EpQVVbGYMS4pI5ubW3JckAIrmA/TLPDyRpRwW0UBAGlER2uF9oZrHBR7ttNbQSSjOzcuPWUq3hb
	VM=
X-Google-Smtp-Source: AGHT+IGGbkUt5VkmSpLSuTJVagMvVzZSi8WOukoJTdG7air4eB+Oqs5H0s8SQscIL2j987gZiusSFQ==
X-Received: by 2002:a05:600c:c4ac:b0:471:9da:5252 with SMTP id 5b1f17b1804b1-47939e3992cmr76489305e9.29.1765212031865;
        Mon, 08 Dec 2025 08:40:31 -0800 (PST)
Message-ID: <6f9ba762-ba97-4cdb-85aa-ae4886599d19@suse.com>
Date: Mon, 8 Dec 2025 17:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/19] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <fc5db52dc3076b19d0b7cfa6e5cb541b1ad5d545.1763986955.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fc5db52dc3076b19d0b7cfa6e5cb541b1ad5d545.1763986955.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 13:33, Oleksii Kurochko wrote:
> Introduce support for allocating and initializing the root page table
> required for RISC-V stage-2 address translation.
> 
> To implement root page table allocation the following is introduced:
> - p2m_get_clean_page() and p2m_alloc_root_table(), p2m_allocate_root()
>   helpers to allocate and zero a 16 KiB root page table, as mandated
>   by the RISC-V privileged specification for Sv32x4/Sv39x4/Sv48x4/Sv57x4
>   modes.
> - Update p2m_init() to inititialize p2m_root_order.
> - Add maddr_to_page() and page_to_maddr() macros for easier address
>   manipulation.
> - Introduce paging_ret_to_domheap() to return some pages before
>   allocate 16 KiB pages for root page table.
> - Allocate root p2m table after p2m pool is initialized.
> - Add construct_hgatp() to construct the hgatp register value based on
>   p2m->root, p2m->hgatp_mode and VMID.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


