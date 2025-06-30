Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B31AED652
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 09:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028887.1402561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9Oi-0000Is-2B; Mon, 30 Jun 2025 07:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028887.1402561; Mon, 30 Jun 2025 07:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9Oh-0000GO-Vc; Mon, 30 Jun 2025 07:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1028887;
 Mon, 30 Jun 2025 07:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uW9Oh-0000GI-2c
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 07:57:51 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5374c88-5587-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 09:57:40 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so1577785f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 00:57:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e3200fedsm7454481a12.73.2025.06.30.00.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 00:57:39 -0700 (PDT)
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
X-Inumbo-ID: e5374c88-5587-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751270260; x=1751875060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9uTUQF15Koei34hJ1I+xq/5U9YI/aWamKphGGc7rMdw=;
        b=CbZqUFSfsl5+hXWQzmoosc44wJxJjpEzwH+Um4VveMF3LkfRN7Dnq0yzxA0MkdNADh
         DGxc2n/QAChee0Jj6zMqudwalxga7u37haYFW1TiYvxiJfixR6qHghyDprMZvrXaYSYP
         KSKY64KW2VIVoTdrj1U2hy0E+P0EG+5PWouM7Kv2OVmC9htmtMqpOsbMbEIpSaLmLY0x
         WsC7ly7NuhRUepvY3fXApvjcwPGCBbwuksZgR1I739IJURk2azpSxFqMwxXs7izW242v
         LkdQ9dITnbZmbLfaOnRF0OcpzHJGwzTiRtirvH7zyWbrWBMReXFJYitDcE6GtU2wVB/y
         NOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270260; x=1751875060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uTUQF15Koei34hJ1I+xq/5U9YI/aWamKphGGc7rMdw=;
        b=pZSRGZhDolvcWU0AQpQcmDWWLIVEkoRk4cR+qlyoIB/Le1iF5wgTmF7l/cgMMJ1bOj
         y+doFeu5+qIAr5aEvYBO9ApWw3usgMZl16sAAgRk8DIURz44XL+NZG/q9JTWkQllIMZ0
         mjMzIrWBhkrGWv4zHXeWup1cnxYgCoXpDwwYmWYp27YeGqvePp56NOJ129A59af5lYpG
         eO9Ga/TXaSpzIpBB8Sn3KXWo0hmWhcNDX/8JF+NZ8j7cY+lbKDGbVSk6ECqABE6I6c9D
         LWNc3//bLeLxi5Co94DV23gXvuv1q09W8/tKCvkOvLExKSuWvjowA+g6HR0gYmB6yfj/
         4p5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNrlorwWzQbfGZ/Pw4Xc4bQUHAe2sYQS6Y5OtiSrf84HyjMgmNBCb10DKxlcYFx5GZToxrW4y81w4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNHdvtjkU5tCNR904jYDLQL7+eRtCWn6Mr/8HWv4M6fCt9we4L
	AcBmNPwnOGHiI5xiczsCYnPyC9Hh83v7X4SjjRUVfaQbMsJTX2gXyVwM9NlAD73mHQ==
X-Gm-Gg: ASbGnctLRLAAt+e7fHFPoHpg7jXUtDeZQ6kvNadLJdDJ/67qyJBiMX9bqWC5BPDe1Fo
	t77IIz7KV3DxKiOyYULqOL68OTSZ4NZL3qdVcvhQaTDrcvb1wycXk9QXABhKlB57/i2lHXgvVnv
	BBWaNE+ZmhLkSm/sZGcnmDZQ7kPwucc+Fde1OMVETZkYoeM9lvejK1GeNFoOyN9eteeENyfW1H1
	cgg+gbBnza/fuMphSIXnB9kednngzI6kJ7OAWN358BOHbQ6r8fnTL2bNDFEr6CiQ6zCWMoYU8+B
	azvgyjmJW57rLCubb7BgWXHIUEU2VUyiswc+VD88PpSGDZBoyMsSeStHrRA71ek+O6piRK5/n9r
	L6HTMbFrW00ESt1mvpinSkBJKqGhJ9lEKvMGq+rm8R0XGJUU=
X-Google-Smtp-Source: AGHT+IFFjr6hm53/vwRg2fpm9ukw4HF7RwOREfTxaPBjMHNYimMGsgkGqNiaa3eC3ha17YyV7ePXoA==
X-Received: by 2002:adf:9d91:0:b0:3a5:2cf3:d6ab with SMTP id ffacd0b85a97d-3a8ff51fd1dmr9550580f8f.39.1751270259789;
        Mon, 30 Jun 2025 00:57:39 -0700 (PDT)
Message-ID: <5a423869-d67f-4a98-9fa4-e854bc84e2c7@suse.com>
Date: Mon, 30 Jun 2025 09:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] stubdom/grub: avoid relying on start_info
 definition
To: Juergen Gross <jgross@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250626151344.6971-1-jgross@suse.com>
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
In-Reply-To: <20250626151344.6971-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2025 17:13, Juergen Gross wrote:
> With the related change having been added to Mini-OS, the single V1
> patch can now be expanded to a 3 patch series, especially meant to
> untangle the close dependencies between grub-pv and Mini-OS internals.
> 
> Changes in V2:
> - add comment to patch 1
> - added patches 2+3
> 
> Juergen Gross (3):
>   stubdom/grub: avoid relying on start_info definition
>   Config: update Mini-OS commit id
>   stubdom/grub: swap start_info usage with start_info_ptr

As patches 1 and 3 are still waiting for a maintainer ack, is patch 2 okay
to put in ahead of patch 1?

Jan

