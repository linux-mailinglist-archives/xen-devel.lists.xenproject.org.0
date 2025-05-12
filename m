Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA44AB3564
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981261.1367659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQrT-0004lA-QM; Mon, 12 May 2025 10:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981261.1367659; Mon, 12 May 2025 10:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQrT-0004iJ-NW; Mon, 12 May 2025 10:58:19 +0000
Received: by outflank-mailman (input) for mailman id 981261;
 Mon, 12 May 2025 10:58:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQrS-0004iD-Kj
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:58:18 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01d10449-2f20-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:58:16 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad24b7e0331so203978466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:58:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d7016b4sm5606383a12.49.2025.05.12.03.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:58:15 -0700 (PDT)
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
X-Inumbo-ID: 01d10449-2f20-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747047496; x=1747652296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sU8IqMrzuksqrF54Hs2THJoM1tfZUvrHJnHHfcY8zM8=;
        b=BDImeEIhbsSdwL/5wSvDPEsStMMnQYw3UrJWi3mVtDEpMTHz3DZGvsSFhNBVmdribl
         nWw84d4N3MRjCVK5XHCcxEm8eYP8haImqcJ6HTuvtXjcwGS9OHTxUrmWVrANVLnwP2Ah
         xCqhqMRCyH+lWaCnLu6Aj/h/evcuiL/gfIsvQkjImtHgRdccQIGkPgad6Stq+0nN6x7p
         ERWF5TVGWNxj4m+t1oSNK3J28MH0oLle+UNpeamKKloKGZJHB/EaoG5ykIQ5F18gh6Lb
         WXsYT7oIudbePeN+Igof375iyqkMDjx+0GrTj6kpoNq+uuYW184WnoQ37CHuoBoOqK7h
         HuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747047496; x=1747652296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sU8IqMrzuksqrF54Hs2THJoM1tfZUvrHJnHHfcY8zM8=;
        b=YWu+XJ1XiO6TAyN7F08kLsDKJ8fn/xLA2AS2P5cvixgJ79Ry46vlEKw2/hM8PqF9Jq
         sOsecpyByuRKAnIUF1U2ukmP3tU5i14TrIeWQqWWOlAgnWxNOMnplCkRy9OtnERE9TJF
         oy8ORIAa+mdAx8MQ8pKpjUqLAuro59Qs/ntD1WwfICP0ErFNn9N5xoqJJfXQpxi7w35Q
         QO//Mho7xPTBeXxSHrKKHQyPDiAml8Yqm5g6sEmg43ghldinTqEj3MfZ/E4IXIuXdMMe
         z5zz4w8AsxyNFIRdDYPc6u4KN6R1tQt9ru5U63h8dLZVd9DvKuWGYnkL2O48iH04/8ep
         BN3A==
X-Forwarded-Encrypted: i=1; AJvYcCWAGhMWw9cUDkY/9n6Lf7SvHssl3o6GuhX1bfPn3+G5tF/xXjpta8bSC/4X5xHywxCnpfEkOgkeZCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwIe5CClLm54s9Ixk8WyDpZ2aqdmoZzDqNcBwMRcs+NDmKkkRB
	M8poQFdQ1eYEgoli3y95IockbxX8u0cqYXDTgznJ45Gb3R2/rqN+vUbpjIYA7Q==
X-Gm-Gg: ASbGncvNITtPIid1jTxo3IzwoveMBEVv3LwvT3EbP4pRwc3lyI4uKCo4CiLIoEtpPkp
	9sRo7T0kK7gxkBp+nLJ9RFw2R9jOZDy0FBrJeCk7nN2lSYiwaqHBOuS4LrMN1ow0ohyD3MMBn53
	m9+EvSdYY99g7abciFtjdzHc35RQBQsvUoabF3uAxvdjnlcuTMq2UyRf6GL+0gW0shH0JYE7IMT
	DubuMTpfLWX6aTeSWt9SVXrToKlW2oe109Emqx8AndWYeEvpVJrj9CkTw6SiXsDKsIdXgv2R7U5
	xYNsvyya69L3qQTlYUDXjq5v9J5lVD74oROGIasJeFqXLnZM/D91oLBR7E7kewAYqa9008ZtxqY
	iZH0Ymv/Wh9CUnMULKdKX6ccDogHpa8zcdMaC
X-Google-Smtp-Source: AGHT+IGw+L61ZHJpkaQr/+fzTChmU6aS5hpeTKheQEP2Tenw4Il53V2FslNlS8todAATczkzE4Es8Q==
X-Received: by 2002:a17:907:72d0:b0:ace:6d5b:e785 with SMTP id a640c23a62f3a-ad2192b6b17mr1133728266b.47.1747047495965;
        Mon, 12 May 2025 03:58:15 -0700 (PDT)
Message-ID: <18f73078-c512-416b-9406-c76f8db178eb@suse.com>
Date: Mon, 12 May 2025 12:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/Kconfig: Improve help test for speculative options
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250508160336.2232152-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250508160336.2232152-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.05.2025 18:03, Andrew Cooper wrote:
> The text for CONFIG_INDIRECT_THUNK isn't really correct, and was already stale
> by the time speculative vulnerabilities hit the headlines in 2018.  It is
> specifically an out-of-line-ing mechansim, and repoline is one of several
> safety sequences used.
> 
> Some of this boilerplate has been copied into all other options, and isn't
> interesting for the target audience given that they're all in a "Speculative
> Hardning" menu.
> 
> Reword it to be more concise.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> CONFIG_SPECULATIVE_HARDEN_BRANCH really ought to be named
> CONFIG_SPECULATIVE_HARDEN_CONDITIONAL, but this would be a (minor) functional
> change.

Hmm, so you're suggesting all the straight-line speculation changes then ought
to be conditional upon a separate, new Kconfig control? So far I've keyed them
all to this one.

Jan

