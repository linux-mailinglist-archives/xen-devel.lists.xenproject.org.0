Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCDECAC7E1
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180137.1503375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWZ4-00056B-1x; Mon, 08 Dec 2025 08:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180137.1503375; Mon, 08 Dec 2025 08:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWZ3-00054k-V3; Mon, 08 Dec 2025 08:25:49 +0000
Received: by outflank-mailman (input) for mailman id 1180137;
 Mon, 08 Dec 2025 08:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSWZ3-00053h-AM
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:25:49 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fd5de5a-d40f-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 09:25:48 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b47f662a0so2571901f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:25:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8fdcsm24588603f8f.6.2025.12.08.00.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:25:47 -0800 (PST)
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
X-Inumbo-ID: 7fd5de5a-d40f-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765182348; x=1765787148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2liWEgwaFy40M3UoN6VqRV3SWRFz6UKB88Oxkv2TA0w=;
        b=PGhSuQA17SwpV7JMdiB7n7CKDIH00DgEqeGCadit24AZYTmwwUOs3IT+KMeKym06c4
         DCTfKl+ll+C3g09HZdx+7PfUxDdAZILBTWBeL3f1tmOHQLysPt3tlKtgkV1PVrQR6Vxa
         CS5xihbMJ8o0EZzNmaWNCHbss5MbfQ5IjnOiKpaEmiH4l58WeXZ6C8n2u1V1URVq9gyV
         v0tqwHUK5GnH9toBpAZXNrnBSAaH+NlVbP90xbhA8Zfe1ogDqPi0kIChKgkAe4Eu1xEo
         DTuqt3gIARaYaEZIKHe9dsUMvKOMsj/Gd1DAqYiwkQV3F5BgRaUF+KxkDGTjKroYKTMU
         zyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765182348; x=1765787148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2liWEgwaFy40M3UoN6VqRV3SWRFz6UKB88Oxkv2TA0w=;
        b=Jj62wGgy4StvlKt3EyoIb4lEWKSy5/sGSWVEtbN31EZH2gIdq0J+giz48Mv4ZLVBLT
         nN9W6sDqKoDNE0LBDmI12Ot/rtgGk3RwRWkGsbWcOysB/NU6ej1v5fL/VlOaEO9kxftt
         FU26QrG3uEbu/UeNvXVrCcyXPhidnJPR2hLJz/7+Y5NLxXZG8wB94d5Qu0XnaCX1kt9p
         QYjBg/8CbH0jLb0/aBxZFaSQX2K9YNxYw3u3Y98ExnzVJv+SLbXGAz+DpzW0IxUSz/Yq
         ZXPbm+8U37vD4zNm94KDfBr6BeYkuh+O9Htu5gdx7UHwR8pbpD+UIVHC/lXix4DiavKX
         v28Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSAgjRQNv/eWoZ0QBbjyzXxEgzbrAEqWmgqaMTyaqkUlzn7Pt8rJpFOP95G9iC/ZQd2ZVb0rkSZoY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzg7Hb7ImAdyq+DG/nlzj2FJnlN1vJJLU2s53ZARf2TZbSt2UFZ
	LXgnCC2TSiG7L2YTUq1BkzpBK1s5RyDDyTUCstE3xnYG5j4iCGI7bUHERJwlud6lPw==
X-Gm-Gg: ASbGncukVUGAhk3TMWCiKQ+cyQnWzejlmMCeAhW2igXrlBi19THfSM48CLhNVM6R3/v
	l1lKCekeQC3aKOeS7jMorrbbrv4TUyOFJYZhvunlum+joggR0jKqDAaID5pPK1K06NbUxIlfg2I
	ohzadrCNo2G9n6ORD/3lWxYXN754YGGonGADkIy77ldvV10SrBh1Kh51phivcqyKWRM/1UfKOol
	jOdjfU9kjh/+B0iW2/dg17hLH/hmAacRxtfpbCJUJDqjXBVpli7N95ZOMDufAjj+ntTy6wr0wwX
	KpQGFqLG9B/0Dv+Qxp9PaYV3g9ceKnRAz3OssGLDpHAqpypN/fWJWLQzoCIzOmFjbZWJeVouQ/v
	xt2U1UAV0omSp1F8wT8DvjZg4rC2GnZLRcc/sZzkifckAApzLTqZbo9e/KDiFtfwJBNjZVueyBA
	hlBmV425oEUzpZynJecrwnEGfo2D2TzqGyzrZj7njK7TOZq+RpEGaVaHwp4D5u6c95bhNy9DllN
	vo=
X-Google-Smtp-Source: AGHT+IFHgQwWbNupnQHA0eskobloI6jLVuTEA9TQCzvQBkn1DYmEYMuUVPbcVIU8ZBl3nAhntDEUuw==
X-Received: by 2002:a05:6000:2404:b0:425:86da:325f with SMTP id ffacd0b85a97d-42f89ef1876mr7219678f8f.27.1765182347784;
        Mon, 08 Dec 2025 00:25:47 -0800 (PST)
Message-ID: <4fb15575-cbfc-4842-b48b-4113fe658137@suse.com>
Date: Mon, 8 Dec 2025 09:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
 <20251205160942.46694-3-frediano.ziglio@citrix.com>
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
In-Reply-To: <20251205160942.46694-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 17:09, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> For xen.gz file we strip all symbols and have an additional
> xen-syms.efi file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - avoid leaving target if some command fails.
> 
> Changes since v2:
> - do not convert type but retain PE format;
> - use xen-syms.efi for new file name, more consistent with ELF.
> 
> Changes since v3:
> - update documentation;
> - do not remove xen.efi.elf;
> - check endbr instruction before generating final target.
> 
> Changes since v4:
> - simplify condition check;
> - avoid reuse of $@.tmp file.
> 
> Changes since v5:
> - avoid creation of temporary file.
> 
> Changes since v6:
> - install xen-syms.efi;
> - always strip xen.efi;
> - restore EFI_LDFLAGS check during rule execution;
> - update CHANGELOG.md;
> - added xen-syms.efi to .gitignore.
> 
> Changes since v7:
> - move and improve CHANGELOG.md changes.
> 
> Changes since v8:
> - rebase on master;
> - clean xen-syms.efi file.

I.e. not addressing my prior, more fundamental comments.

Jan

