Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3E98A854
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807486.1218976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svICc-0001gI-1k; Mon, 30 Sep 2024 15:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807486.1218976; Mon, 30 Sep 2024 15:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svICb-0001e9-Uf; Mon, 30 Sep 2024 15:20:45 +0000
Received: by outflank-mailman (input) for mailman id 807486;
 Mon, 30 Sep 2024 15:20:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svICa-0001e3-Vl
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:20:44 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f462940-7f3f-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 17:20:43 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c88c9e45c2so3089939a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:20:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27770desm542341766b.32.2024.09.30.08.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 08:20:42 -0700 (PDT)
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
X-Inumbo-ID: 8f462940-7f3f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727709643; x=1728314443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6ls8Z/xFLF3mpp/3oF7fMwOhwjqbTG8NRc6/LYlOxbA=;
        b=D/2xU2OkBi5/7fCIyRBDsyG/7E9xUGNsdFMzLN6XztGKhSMMJULpt2TsHZDTMfSGe6
         tFdd3x5FquoSxZMsNBvR4OM4SsB1YJIhTn/fFNeZWgtUoY+pNIeVe+L9C1ircnGw1QDD
         xf/zrzKOHJYDcXmHCZVEtnKOFDZNH40vqmouabUxw21bQWw9XQWwjzmB48wfk4RQGe0j
         O4eq4+lSikAnNIuESURCf+03YZWv23D5Rm/gfFj2uTHHXlw58zrMigMvajs/WflkA8UN
         1PfPgzRIpPVnTjJxwOJNnvZP3Xao/NVBEwaC9LC+zQGYatE4TksXWd5ChwVeaE1q9dx/
         1z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727709643; x=1728314443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ls8Z/xFLF3mpp/3oF7fMwOhwjqbTG8NRc6/LYlOxbA=;
        b=V0v/tT0Hks0IwsCS/J80vWXti26EZvKg9N/faO7DKTuWWM7y8QoVamAma2sXXTku4U
         owzaWrfjdmZARJK3pcZKb9oL2QeZp2RCvMipfp8O8Zh3Hzfa8MFTxewftqwNd6vbYtwz
         MemHuvgeHVzIPjtvqq410h7M6V4uYF5BoQkd1kvUR1i4Z3GDorXViy5+LlcAtX84GsVw
         lZI1O3PVQIZCz6Dde7l84j31seGGFhf4gVAxMJQMfSk1TmWAwx53PjMjcHTp8Bvd0Box
         OUeBKHtY95HvKhCwsQMPYhqUKVxXEs8zgGDKoN+qqJeQ8xlnRzdA9UU9/YjoupGl3zOM
         bliQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcICUy4A8FREAwhTKCKLk6He8DwBR0ogfJrWhiHXK4A212VWP+RjKEwpzqLx+4zwkuqtCP9LmixgE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHobO+uHQE6IGdUx3hATDsBZ7cs3IiQzIy0drGVAemtPuw2KG7
	p0vqqI1DIXS2n5VQPNZHLw27bzn7NSrWWZQ2Azlj4Yj14TI5EsMNMUMv4odphhhfDit65HVvN+8
	=
X-Google-Smtp-Source: AGHT+IHOYciwQtkn//50RGvfFAYiVD86MGRvcvYlMZFVvnPTtOfB7MxL3GlU6doWGAoMfpeQcFo1Cw==
X-Received: by 2002:a17:907:31ce:b0:a72:7a71:7f4f with SMTP id a640c23a62f3a-a93c3094b53mr1448596466b.7.1727709643106;
        Mon, 30 Sep 2024 08:20:43 -0700 (PDT)
Message-ID: <801c913a-d915-4dd0-9ed2-f89c6717b1cb@suse.com>
Date: Mon, 30 Sep 2024 17:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] xen/ppc: mm-radix: Allocate all paging structures
 at runtime
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
 <c34ab55cd5ccc7658216e9122eb30569815958d3.1727388925.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <c34ab55cd5ccc7658216e9122eb30569815958d3.1727388925.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 00:24, Shawn Anastasio wrote:
> In the initial mm-radix implementation, the in-memory partition and
> process tables required to configure the MMU, as well as the page tables
> themselves were all allocated statically since the boot allocator was
> not yet available.
> 
> Now that it is, allocate these structures at runtime and bump the size
> of the Process Table to its maximum supported value (on POWER9).
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

On the assumption that the (theoretical only?) case of there being gaps
in [min_alloc_mfn,max_alloc_mfn] if deemed okay, with it being just more
memory being mapped in such a case:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

