Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE6BAB55EF
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 15:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982829.1369182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpco-000814-V3; Tue, 13 May 2025 13:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982829.1369182; Tue, 13 May 2025 13:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpco-0007yH-S6; Tue, 13 May 2025 13:24:50 +0000
Received: by outflank-mailman (input) for mailman id 982829;
 Tue, 13 May 2025 13:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEpcn-0007y7-2b
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 13:24:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ba308b0-2ffd-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 15:24:33 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad21cc2594eso39432666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 06:24:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad240b9eef6sm521604466b.18.2025.05.13.06.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 06:24:32 -0700 (PDT)
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
X-Inumbo-ID: 9ba308b0-2ffd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747142673; x=1747747473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Szsem0vjoKRmGaJdXPSsANG4HF1hiEVt+argooWFnto=;
        b=K6QuuTGAd4bUoghvJ+sLfzAttejSe9xVz3VfxhMLB+RmIe2a/9Tv1zuRiOhys0a3vK
         zTgdojBfSWOYJ0XYUr4r2KMZlWblQ8n81UyrpVEBJCto1SHvOun2bjctZfwRcCQMenPc
         ReCqeXpU3r7ElhrwgBNfYiq9t3R35YWYQBVgMneCL8ANhJn21wBO6GZf/q2S4hr49aSE
         XvuHit+mxkUbpAZ2OX3MgvPsSYa7IKWV1LybkbIxfy1OJhfgPv8MCjzF+XJahwDkK3Gy
         ffNFRK097DbJlHTiZ0W9SxBhggIpVu++IybPO1w5RGECY/BWQDs68piPQ84aI4eEMosr
         WYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142673; x=1747747473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szsem0vjoKRmGaJdXPSsANG4HF1hiEVt+argooWFnto=;
        b=FUiiTi8GCFqx4DhGXA2BvWvZFvkKWAn5185DxOIhagM2qN3fNZQ0u5OQMcG+H1+uG8
         Jn5abrg4QVzzRxcUWMyOhfjILCaZlg1IMG8aTPcnBReBGx4X+6xohVbDjhvkIExW4OJ1
         syChIvLHca0wEA7grMEHII00YMSa534oeKylk0dtSiQ9s8BG93gFzKv7T3ZB5aYGVMfQ
         uFi52dK9f7HX9zK02cN7rxbSsfhhNwIPt+os7W+pIn1+t2gx32REbEPWC3EWyuhBqoDn
         FStIo6GQAq1IIVZRW8Rx45jACK1NGAMvnndRZYKNZQOtUVEDXxBNq0Qe2ELli8Y5qxcd
         ieHw==
X-Forwarded-Encrypted: i=1; AJvYcCVo9hWOwkmgg8V4BxdmluaTQUtskxpsHvuwKV0iCoIB+57LeQVo9Iq75Q++PU70mXKbaFLtdJkrbic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywr+S66sY8L5nek9XcsJ//r93fwdeEWZD8xF1sF22jC+W08xjfm
	95CMUXMj4zdJeFnMsRrKQQZdoRjMNIy20lKLGif0G0koirCNR31LGTR9MMMrbg==
X-Gm-Gg: ASbGncvIG/eCY2dbzEVXCgkiEnR2vbUO8ctN1xKx0cXS/QGIaqYVbG5vxQ17gJFPeq8
	rWBhsx4BvB4MTH42N61x9fvL5/dIvNdBuAEpW/Cup3bCufQBUS5wMdenhXZfBXWVD5Ae36RFuoa
	66Czw3LJ0EoEDgxO5uSM0+9yKCsY1Zh4rCJNYFHbq5E4SgP9HyNTkzyfpYDYxzuxZ7ZdNNru1hj
	3JCbRzJzF4sTNLOzMj/v/Gc5Ddl3LN3BCP1CztsgW2tcJ/sl1Y49WkK4sJy3bJ15XgmR/JvMbHf
	riUuTxKK6+2S4Y5iCdocSjzKqcvhzYbwnqC7nCv/Mlji47ngOR5dIJfvoz1dK3U3F959UxTusE7
	nGlD6u9wtklJKhxdFE3gnYkoNuj3LguUnmLTS
X-Google-Smtp-Source: AGHT+IFqcbwCTmFalhTMPwWfZZLf+7DaKL20v+ss4JtWCWDsvjX+VF/yo4sn/Vt6iAvYx00E9h8pwQ==
X-Received: by 2002:a17:906:5415:b0:ad2:1cd7:cefc with SMTP id a640c23a62f3a-ad21cd7d3f1mr1155521266b.13.1747142672837;
        Tue, 13 May 2025 06:24:32 -0700 (PDT)
Message-ID: <25448dec-63f1-4b24-a8be-f5d0a1e7ca6b@suse.com>
Date: Tue, 13 May 2025 15:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] x86/HVM: restrict guest-induced WBINVD to cache
 writeback
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
 <e42bc3e8-a92c-4c2a-81f4-6557cb97f03c@citrix.com>
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
In-Reply-To: <e42bc3e8-a92c-4c2a-81f4-6557cb97f03c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2025 15:12, Andrew Cooper wrote:
> On 03/05/2023 10:45 am, Jan Beulich wrote:
>> We allow its use for writeback purposes only anyway, so let's also carry
>> these out that way on capable hardware.

By implication of what you say ...

>> With it now known that WBNOINVD uses the same VM exit code as WBINVD for
>> both SVM and VT-x, we can now also expose the feature that way without
>> further distinguishing the specific cases of those VM exits. Note that
>> on SVM this builds upon INSTR_WBINVD also covering WBNOINVD, as the
>> decoder won't set prefix related bits for this encoding in the resulting
>> canonicalized opcode.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I realise this is an old series,

Well, it's old because no-one cared to look at the v2 posting in over 2
years.

> but this patch is unsafe with AMD SEV-SNP, and with CLX devices.
> 
> Both have cases needing "genuinely evicted from the cache" semantics.

... here, are you suggesting that our present behavior is wrong? We don't
have SEV-SNP support yet, so there it would only be "latently wrong" (and
hence the change here would still be correct for now). What CLX is in
this context I'm afraid I don't know (since surely you're not talking
about vapes, the closest I can spot in search results is something gaming
related, yet still not becoming very clear). I might have guessed
Cascade Lake X, but then why would just that one model be a problem?

Jan

