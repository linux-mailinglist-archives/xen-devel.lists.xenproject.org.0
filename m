Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07039A67739
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919247.1323746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYVz-0000xW-Ki; Tue, 18 Mar 2025 15:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919247.1323746; Tue, 18 Mar 2025 15:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYVz-0000w6-Hb; Tue, 18 Mar 2025 15:05:59 +0000
Received: by outflank-mailman (input) for mailman id 919247;
 Tue, 18 Mar 2025 15:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuYVy-0000vy-1A
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:05:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eb30a22-040a-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 16:05:57 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so22794815e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:05:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe658d4sm136462025e9.33.2025.03.18.08.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 08:05:54 -0700 (PDT)
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
X-Inumbo-ID: 7eb30a22-040a-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742310357; x=1742915157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fZFqpmQ+QmfhbHvZbAvJfBunAr2xux630iuFhrwc7TM=;
        b=bQpWpiviTyRmhdH5BZFNQyr7jNlA2wuZ0ZjbfZSg6FZP88ABfBbYUgIKJHC3HBeska
         HbUot/v89hPAJH4Oet5i/lZt79ShoAbezvxd+zS7ZtXm0Dl2i4szMv19S0HwvTURd5bC
         Nl3WsugB+cPN0UazPWTGnSHao8Y6hdWa5qo9289qARN7eEjsKzClqGQjnBGlw2gfvWhM
         n3dWfTgILCKNyivVld9iCc2iD/mOmKyX9itRx/HhKCP2r/cI0k51/6oj3M0LHMMVX/UV
         Z3YbX9tWZfBJ321uewOTGlsZY1aF2ZMs5ju7Kc8MWN4ODAo9n2ECUxBF2Fua2CqzhvVG
         Z5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310357; x=1742915157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZFqpmQ+QmfhbHvZbAvJfBunAr2xux630iuFhrwc7TM=;
        b=biTKfdZqFXlPDIDLxxgmC4io5Eog5l8XtAsUHW5unc3IPPW+IANV6fIs1iRJ9Or6Ow
         mtfzCwYRA+SgCK6NN4+MWaLhmt/+bIhbJwJeSZSh938iFHkSQWL41ZroR7sqSCmZmK0R
         YUB1Fty4iy8PcWN7NByaTvRGAjrpv5KBC8tAnRFprlQXONJL2jNrZYbsykQGefY/XNIC
         JzkU5TmpP/frRu8gQSG3/U27W1m2JPoXce7Nq/CZso8AT9i1kwJkiVupEoFYoFOeFYvP
         3nHhL8lVKKYVvVk4p5LMhmsEJb4KQ7duSh9Ga9rfQzc1XiFW/HBrGt5cUofaJfgKL2bv
         8hAA==
X-Forwarded-Encrypted: i=1; AJvYcCWmdrvQiCKFAGgebHNuZf5BP6E+tWO25SezLAL28WM4yY7Na3E+B1OMIZCoFHD3bd7Cgq0me4M4Hac=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxhj8XB51m51T9V8fABMCyoE5xXZxJyNbBk0rdPplfqOIDRi/3I
	2CjOg37Z4MbPa0GXy+i95aRGtkXqaOfrr+Gt8JnAnG9WDABog9F6blyGPZI81A==
X-Gm-Gg: ASbGncttKq2rQTV5+KHVrVQTVc3z6zatgUc4HPqbtt7lGaEk03/sFM21N/IDA+W6cCB
	7oJzMaCdwjPnsLUs/PEcDUv3TYR7qEgh45WGtq8gjhGwQzWYsx4qaSA9KNP8TrOE5+ob7F3/QSD
	/8KBj8V8eyuX+Dno/j7Fo2MAA++XniXgcw9b6waYOxfR7WAzSBxmkE0HaMq/SEQyKa9d8uNyhzk
	TDVH+S4V1IYR4oM7dgDr7LXcJ5e99La4qfNZszxu6vqlgGDEhM8Lt3GVf/oIRR6zxnsMqPcNi0u
	vu35ulsn6/htz08r9GJrG5UZ6zFK6L4ka2gioEWf0ydgYBrCsHtdzXChskAuLjWJVv4d0Yth+j6
	4L1Gxm9v8iGkLMwdLWe8vL+5YFNYdkgDg1eD7q2vB
X-Google-Smtp-Source: AGHT+IGKeXIh9KRifzQd9q/OInlHJbvie2o5r3js3nmaXOBNPNv/FnpMODlxEGhQ9WYl0wLO7S4hWQ==
X-Received: by 2002:a05:600c:3586:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-43d3b9bcf30mr19244525e9.20.1742310354529;
        Tue, 18 Mar 2025 08:05:54 -0700 (PDT)
Message-ID: <288a3902-0290-44cc-9227-3eb7c5eb78c6@suse.com>
Date: Tue, 18 Mar 2025 16:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/traps: Move trap_init() into traps-setup.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
 <20250317192023.568432-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250317192023.568432-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.03.2025 20:20, Andrew Cooper wrote:
> ... and rename to traps_init() for consistency.  Move the declaration from
> asm/system.h into asm/traps.h.
> 
> This also involves moving init_ler() and variables.  Move the declaration of
> ler_msr from asm/msr.h to asm/traps.h.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



