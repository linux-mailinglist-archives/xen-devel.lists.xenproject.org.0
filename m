Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D098D146A
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 08:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731010.1136310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBqNG-0000Ca-GU; Tue, 28 May 2024 06:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731010.1136310; Tue, 28 May 2024 06:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBqNG-00009a-Cl; Tue, 28 May 2024 06:31:54 +0000
Received: by outflank-mailman (input) for mailman id 731010;
 Tue, 28 May 2024 06:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tjWx=M7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBqNF-00009U-06
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 06:31:53 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f80e481a-1cbb-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 08:31:51 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e95a74d51fso4677381fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 23:31:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc4fe7csm572324666b.112.2024.05.27.23.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 23:31:50 -0700 (PDT)
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
X-Inumbo-ID: f80e481a-1cbb-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716877911; x=1717482711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gASJJ4wNyPdL+cvjolySShMRc6uB1G+SwsB4kMeBM/s=;
        b=OkoSlPaxSOuEbIqD6z9vSm2k9G+4SOhbFy5OHY3t9VLqjfl98BACzr9G/Ni/A17gC3
         b2mMrlq9Gl7dioftNAHsUSFVTE+PWbejz4aMolyUsZjRBTmuxteUEpPuU3qx6yIfW5Jl
         /spRsVgAZYj7mlcD8LCV8VbC053ezuc1+g3Oks8UhXTcCFhOa96e+83+s/MU5K5jFXQk
         9Hgq96ZIWEeRAABlrInRvRApn9KOr4OoCM+AtqRdzMxnYUS27Q5n3wwAYn1g0zoEUO5b
         ht12o0/rDx0URj94IyEjuHrh/YvHjKweH2BEtryPiMQHXpi8S6u7Gtl+7zwQIwBZl7Lv
         Yw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716877911; x=1717482711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gASJJ4wNyPdL+cvjolySShMRc6uB1G+SwsB4kMeBM/s=;
        b=iYYlN2eCb7EmUTRbxLtUkGrEetNF7kXl8wvHwcaPCBrVLMqOgv+3QtithRpCY13h2P
         KU59S999ouEE8fqlcZl+1bkJo7NjI0ifxi8l9fc1x9DuEVE4UNgBIj8dI+z0DJf0pUCW
         FTv4HU+CkZIx4Cik25PlRmqPz8KAW1OubeJw7ROSiC0yFJKAM8WjhsMy/B3uyY+bG60M
         bGjKUr8U4CMDRkP+LKsuLJJSE66D95jrraa39Dt+5e3pnNV1P1zfPCfEKjZ+44Zh8+3P
         ctCDUZWlQ2hV4cWErVlDsvQXOo3cZ59rM2T53+XfRPPmSS/7+v9Inq71jv9yzt0fLDpb
         zHLg==
X-Forwarded-Encrypted: i=1; AJvYcCVYET0rckQVj0nVIcRnz2UdTXhkctPqiPuvl1ugBuyx/H7WR4hWOyDBxXu8mI2A90qdoEB/fK4cWtn0qku7ZO0TbWtfmNXAjdQrGWtwVZ4=
X-Gm-Message-State: AOJu0YxjK8wlQ+EBpGjlkxvmqT8VBA8XiDGuEPh/PY3mWhWcKoSalo8f
	fEn6YGHOoSo8uwrnoIoGuts9YECmDmlc/pt/MbCkNjy8E/9atHE7wV11xHTw7mn8cBXmQHIHsPI
	=
X-Google-Smtp-Source: AGHT+IFkY58S4aBJS/bzhpJ/8Rsgw+8ELk1wEjYBCXs/yJud+DCp1dZ/jvao9T5VkBD3XPy5XSZ1aQ==
X-Received: by 2002:a2e:b005:0:b0:2e0:c363:f9dc with SMTP id 38308e7fff4ca-2e95b256611mr95075341fa.40.1716877911197;
        Mon, 27 May 2024 23:31:51 -0700 (PDT)
Message-ID: <7260c3e6-9e25-4493-991d-affdb593fa81@suse.com>
Date: Tue, 28 May 2024 08:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/4] x86/traps: address violation of MISRA C Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1716814609.git.nicola.vetrini@bugseng.com>
 <9d33b2c2aeb59ca67136ed1b65c06e6ef4fd1ed8.1716814609.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <9d33b2c2aeb59ca67136ed1b65c06e6ef4fd1ed8.1716814609.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 16:53, Nicola Vetrini wrote:
> Rule 8.4 states: "A compatible declaration shall be visible when
> an object or function with external linkage is defined".
> 
> The function do_general_protection is either used is asm code
> or only within this unit, so there is no risk of this getting
> out of sync with its definition, but the function must remain
> extern.
> 
> Therefore, this function is deviated using a comment-based deviation.
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit here, too, I'm not entirely happy with the wording, but I'll let
it go as is. While "there is no risk of this getting out of sync with
its definition" is true for the C side, there's always the risk of
assembly going out of sync with C, simply because the two cannot be
properly connected by any means.

Jan

