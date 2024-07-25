Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E2293BE13
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 10:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764859.1175426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWu2A-00042D-KK; Thu, 25 Jul 2024 08:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764859.1175426; Thu, 25 Jul 2024 08:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWu2A-0003zI-Hl; Thu, 25 Jul 2024 08:41:10 +0000
Received: by outflank-mailman (input) for mailman id 764859;
 Thu, 25 Jul 2024 08:41:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1nn=OZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWu28-0003zC-RI
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 08:41:08 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a253c5ec-4a61-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 10:41:06 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-58f9874aeb4so717189a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 01:41:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acac60f14sm47927466b.91.2024.07.25.01.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 01:41:06 -0700 (PDT)
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
X-Inumbo-ID: a253c5ec-4a61-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721896866; x=1722501666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Gak7R+79LwKvGqU9BLyAey2IZ5rU+hPjw4/obE8YM0=;
        b=QoO9g5pcBqKetNR+FW3FVtiGmJ/FcLnvjEMm27YNYZmxWvYQWuqm+bBLl1JcE5VMNb
         kVj+Px/q886vxMO6jZm8OVsDAMIL6dJT6R3QMERCsQhCBIT4ruEZkERtiRleFpn4YAfy
         KWsZ5Iegn2kKctD3jZjdFclOf7XDWGsLiMDzKvjyxHQS1QW+GteISsZpXU4QK8E/TsZ9
         M5cNVTKMwO4ErnD9oH7KpYMSMuOE0HpmcNnA6D/iOCqq7zkfO7jsmCng+Ogzp0Y9eMN4
         87p5oGwTTHv2QLDycXb25uCz+iYurQD2FYiS2ryhf77heCd2vvMGWyWKMIsk7zeck/+H
         Ingg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721896866; x=1722501666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Gak7R+79LwKvGqU9BLyAey2IZ5rU+hPjw4/obE8YM0=;
        b=F741unfaM7xRROHCfgHli0o8YedK/RLWgALSYythVsvr3JyhgBvYPi6qeiDwK8cBa2
         fKmfgt/wCuUJuYzeaBenAsp4clxvxgIcqswDXJx4PZRvthEoJTkp4EtXRmo86aoKYZ0J
         USzwSe08XluAalgu1PX1Dr9tswGlL+K9MhCYO5qtP0DZae7yr+UkMUrOpszCPlkaYnk7
         tTiNir6Jx4OcrzFWFVitgxty4eufHBr/8ogtMmBuOqZCCsO4cVjDIVn7EJkAzPR4tvY/
         ZHAEyJHUZnL5hqkUUKd5uhqo0iTQ/torUGpa0kM95AliIRM0689UM+9JVSm+V3ySFvfJ
         axZg==
X-Forwarded-Encrypted: i=1; AJvYcCXLYPcUBdCVClUM4u7XfmwmM5LmWN/p54l7lp7Q9hdA1PEZ5D1Mxty7J+ESlAGGRbhRAjslH7wPS0rHWhKikBOoyGc50m0uzvoiLc6KnzE=
X-Gm-Message-State: AOJu0YyUcxLJKJfTOpj7GPdto0irSHWjabUmwKTK5aGu7/0k0J4p5cs6
	j03b+vT25R1eWgV/vrl/gcvTrJOCOWstahelB665cvCHuuijkppE1uL0GWwJHML+gCEKaEYqVaw
	=
X-Google-Smtp-Source: AGHT+IGR1AXm6/WAd3SPeKz5cV/bEopuuQ69EMO0jnPt2A57LVAoXLWZ0SkgqAwfzjAs5StCVFAljg==
X-Received: by 2002:a17:907:845:b0:a7a:a46e:dc37 with SMTP id a640c23a62f3a-a7acb92ebd4mr89483066b.57.1721896866367;
        Thu, 25 Jul 2024 01:41:06 -0700 (PDT)
Message-ID: <e2d2244d-66ac-46bd-b047-044c9860c955@suse.com>
Date: Thu, 25 Jul 2024 10:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] x86/ucode: refactor xen-ucode to utilize getopt
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
 <20240725082725.2685481-3-fouad.hilly@cloud.com>
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
In-Reply-To: <20240725082725.2685481-3-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2024 10:27, Fouad Hilly wrote:
> @@ -71,12 +72,29 @@ static void show_curr_cpu(FILE *f)
>      }
>  }
>  
> +static void usage(FILE *stream, const char *name)
> +{
> +    fprintf(stream,
> +            "%s: Xen microcode updating tool\n"
> +            "options:\n"
> +            "  -h, --help            display this help\n"
> +            "  -s, --show-cpu-info   show CPU information\n"
> +            "Usage: %s [microcode file | options]\n", name, name);

Oh, and: While I gave this precise layout as an outline, it wasn't really
meant to be used literally. Note how "microcode" and "file" now suggest
there need to be two separate command line elements. Perhaps using
"microcode-file" instead may already make this less ambiguous.

Jan

