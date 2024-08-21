Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D1C95A298
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781373.1190933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgo1b-0002NH-68; Wed, 21 Aug 2024 16:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781373.1190933; Wed, 21 Aug 2024 16:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgo1b-0002La-2B; Wed, 21 Aug 2024 16:17:31 +0000
Received: by outflank-mailman (input) for mailman id 781373;
 Wed, 21 Aug 2024 16:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YIGS=PU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgnrj-0003sE-H7
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:07:19 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70dfe655-5fd7-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 18:07:18 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a8a4f21aeso841033766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:07:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868a37732dsm4681166b.48.2024.08.21.09.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 09:07:17 -0700 (PDT)
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
X-Inumbo-ID: 70dfe655-5fd7-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724256438; x=1724861238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tmYxxokZc1hpO63BId6nvFeSKw1mDHmJPw2JVqiLm0Q=;
        b=S4blOtoxi/GfSIUyDYOqrGrAqSvsUfcLC7kuBe7b29PTsWwIVNmoZs1NVOG2ehYm7a
         5o8C1KCjjPmZU7ySVrjUw5hX5YBXrILGIUjCKD5pKFqRutHcIJ0pMb4AQZaYXDR7laPG
         oq9sgjd7zYR6YOsbdWHAqY6DsGX4nzgXHndsimx8kJnRHJVmsGrD2P8ZXvpe/VfpjE3I
         D3UpP5DPK4KNCANYE5Lme8cjHTr7Y+lTvEsTvu2kuNCjpzazEb5czOGq8KstoZ4rWeNw
         WpoBOo9iQor4umTksLDZk6T+XNjR6cdFL7DqrxRm4KPUTxkBwj5TcJxZzjj5pE9nVXWw
         ZTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256438; x=1724861238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmYxxokZc1hpO63BId6nvFeSKw1mDHmJPw2JVqiLm0Q=;
        b=RW9updwb0UKNnT9K7PrVJ9DeeLLSJVSfz8hm5UbNxxFJ9pyulS7a4gCIjAHssBoX7J
         82cb2k5/BvtHmVM79AkcrtL36lZAm2qG0NIb1oYQgDsYQqk3vHHg1A6U16VDHfWFxWbU
         aLeHbMnsZz1ggKjK7w69yQELBE0kkeITt8n4ypJMuw0qCjF08nMQYS6VnfIyi9gpgKAY
         bodLiHuzmQSxYTPTgOJvTU7/5KUgRJ8pmzxbKUM9a7iQ+kZm+TthKjAPiUi9MvISxCOI
         M7oom9G0IZMJIKdCvlLFRPA1cwVGT0qhrj4K6GGZmrs8llT8eWWVuWGLb3pZmxf7cizI
         9PLw==
X-Forwarded-Encrypted: i=1; AJvYcCU7b3boZ5v2jiKo+UEamKn2aK9GpRPlmegRNfOKNfBBSgyoc+2ec2Ub52EH/iPeLVOlP0fryZ1K4Ds=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUyox9Wl0Rp2nkUfiF5hgw7FSvoqJf0RA+/ale1oLR/cx1xGA3
	Jl6ETCq9GV3f6d3Vx/YiTdLAxffHdR/YRpgGJj/mmKPqSnuwy+oE6Hnoyi5jig==
X-Google-Smtp-Source: AGHT+IFys5vfZbuVcA0N/jmxIstk/gTgrtjyOLX8D5bq8bcTe3dMzO65vaQKfG1wRKFZSQtUMrklWQ==
X-Received: by 2002:a17:907:e2d6:b0:a7d:35d7:4aa9 with SMTP id a640c23a62f3a-a866f385ff1mr217211366b.34.1724256438276;
        Wed, 21 Aug 2024 09:07:18 -0700 (PDT)
Message-ID: <88f54c3f-a81b-4323-a7cf-3a6be41a9207@suse.com>
Date: Wed, 21 Aug 2024 18:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/cpufeatures: Add new cpuid features in SPR to
 featureset
To: Matthew Barnes <matthew.barnes@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <248b4ea259aa78a17b7b05043ed211a00863bf94.1724247366.git.matthew.barnes@cloud.com>
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
In-Reply-To: <248b4ea259aa78a17b7b05043ed211a00863bf94.1724247366.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2024 17:34, Matthew Barnes wrote:
> Upon running `xen-cpuid -v` on a host machine with Sapphire Rapids
> within Dom0, there exist unrecognised features.
> 
> This patch adds these features as macros to the CPU featureset,
> disabled by default.
> 
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

I don't strictly mind the patch in this shape, but ...

> @@ -276,10 +283,13 @@ XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
>  XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
>  XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
>  XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
> +XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   PCONFIG insn */
>  XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
>  XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
> +XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   Tile computational operations on bfloat16 numbers */
>  XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
>  XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX Tile architecture */
> +XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   Tile computational operations on 8-bit integers */
>  XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
>  XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
>  XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */

... having had a respective (more complete) patch pending for years I really
wonder if it shouldn't be that one to be taken. While it would need adjustment
to go ahead of other stuff (as posted in v3), I don't think it has any true
dependency on earlier patches in the AMX series. IOW I could re-post v4
standalone, and then we'd have a more complete view on AMX as well as proper
dependencies in place.

Thoughts?

Jan

