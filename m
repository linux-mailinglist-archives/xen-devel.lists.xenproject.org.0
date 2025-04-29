Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E1FAA0867
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971852.1360269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9i7R-0007ik-Kw; Tue, 29 Apr 2025 10:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971852.1360269; Tue, 29 Apr 2025 10:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9i7R-0007ff-He; Tue, 29 Apr 2025 10:23:17 +0000
Received: by outflank-mailman (input) for mailman id 971852;
 Tue, 29 Apr 2025 10:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9i7Q-0007fC-IS
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:23:16 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1120688-24e3-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 12:23:07 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aca99fc253bso877272266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:23:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edafbb3sm765185566b.173.2025.04.29.03.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 03:23:06 -0700 (PDT)
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
X-Inumbo-ID: f1120688-24e3-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745922186; x=1746526986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K8NoPCwcNzLhmODUTSy7Op7dzjgkswj0YyGKBc81Xbk=;
        b=SxSXbNMNTaBsQN2MvzAMmky7iquhyK+y9OmbcayjgyOGR5ljajdXzvJqpJI+UE2Kd+
         FlUU1Og4J4c8Ms1zIUkKGUmuCdN9lYxK3oOzncNnCgweMDxBA5VbQ4wLyqUqP/ADoiBU
         ZJAaZb6D8fRBXoYU49AgYG3ZTHwudnzjCJCJ8LLlQYt+0XuIquht8NY0zh4aHYcICxHD
         2pF0iLe5RLz53WPZj09GTrlVcWgBaDIIvk/hfsMRSKTfRa8f9zT6NhbvYtxq/0WPjIi6
         HEFVYwaPe3ZD9m/SqW/JTQH5AJDtUt+yIwGQ2EFeWfs2jkUF1HMdwGsHl7DrWIMvU9MW
         ilzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922186; x=1746526986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8NoPCwcNzLhmODUTSy7Op7dzjgkswj0YyGKBc81Xbk=;
        b=QiSZApqkNqvFYFo+hnJWk8ru3vt+ls0FT4nsxKF5jgjLoXd/xH7Lf9hQ02Ia5W/SEB
         WPcb6mawOm0U4r5ZbJNbJShEitdqic8wrMsYQvbxIxsgEIvmTfPY49yaOJx2BHdWdQdQ
         rD7DgKKm+QT1NpssQ+T2K3DnblXp0M8BSJRm7iimb53K/8l/iNHQ+4YOD1USp+DTzmom
         noxRbHNKZfxFmOKSIbcNbYFk3ln6yYVAItY2fix8rEFlT9GW9cDTGD4j7W+AZcYain34
         OxDP/vP9CDELw2D+9jXVR4gl0+SQctawiyKwu+Fusi2xrRWp6+UpiBEvkfpnSZBO14dL
         BTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2M9cFXoNh9bcZyio8MCyo0+W6IjKCemw0y0AtQj1QIXvXHfV3bTZ+HBN1AHG/FGcnrLU38TZKGuI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHrrp/OoNsn60AqxWJ99sai/qQC2qHdbBAmk2PHwuwqHL6mfPp
	AkBTxLiNvsCREwXS6WM7RB0OPEM1oCxUk3UnwApw+0/h7kxsdn364lvPWqZGLA==
X-Gm-Gg: ASbGncvQB9b2RNJBzyzsceQQ8k53UZvysZuxDVovXYq1EqMKkMjXwbd6btoaiQ2/Ybr
	rwQULlXiUDNJbzbHm097FJ/xducLLPbqAxfgmG6rppkO+NuIkeC2eH6Ql1g/ErMeqkm6gHS4qOl
	+FTtrOiafNIZGyI5LYH2FLsPUkwO3zyqkPVXAmkF64N+6LDCVKUex2od/z69kWZ+r2Cb9pTAPBk
	fSfBridpOMVfzdbBu8bNOAVRxiYiTHY6gZvVRsX4jBPrHuYNX1kzXmOlW2AUdhFWoE+Rr8r+4Vx
	7mvcprP4UdeEKaPLMa5wq2KcwYV234wOzZK1X1ltw0WrAknZ8BwvK/az+zTWm/0g3WBcxYbC5JZ
	NrocR3qozph4OPtJPAMJMcRnw3g==
X-Google-Smtp-Source: AGHT+IF4ZHcmOgXDd4/a1/Bcn/HfCAeiFkwtT0FzXViCgfFffwbm4AkHoExxPJReZttaTPbe3RtOSA==
X-Received: by 2002:a17:906:9fcc:b0:ac3:4373:e8bf with SMTP id a640c23a62f3a-ace848c0212mr1208355666b.10.1745922186525;
        Tue, 29 Apr 2025 03:23:06 -0700 (PDT)
Message-ID: <08d550d4-2283-4177-b812-fd87c0fa511d@suse.com>
Date: Tue, 29 Apr 2025 12:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] xen/io: provide helpers for multi size MMIO
 accesses
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250429101252.50071-1-roger.pau@citrix.com>
 <20250429101252.50071-2-roger.pau@citrix.com>
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
In-Reply-To: <20250429101252.50071-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.04.2025 12:12, Roger Pau Monne wrote:
> Several handlers have the same necessity of reading or writing from or to
> an MMIO region using 1, 2, 4 or 8 bytes accesses.  So far this has been
> open-coded in the function itself.  Instead provide a new set of handlers
> that encapsulate the accesses.
> 
> Since the added helpers are not architecture specific, introduce a new
> generic io.h header.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> @@ -5185,6 +5167,7 @@ int cf_check mmio_ro_emulated_write(
>      struct x86_emulate_ctxt *ctxt)
>  {
>      struct mmio_ro_emulate_ctxt *mmio_ro_ctxt = ctxt->data;
> +    unsigned long data = 0;


... this moved ...

> @@ -5195,9 +5178,12 @@ int cf_check mmio_ro_emulated_write(
>          return X86EMUL_UNHANDLEABLE;
>      }
>  
> -    if ( bytes <= 8 )
> +    if ( bytes <= sizeof(data) )
> +    {
> +        memcpy(&data, p_data, bytes);
>          subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
> -                                   p_data, bytes);
> +                                   data, bytes);
> +    }

... into this more narrow scope.

Jan

