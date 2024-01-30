Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B1842039
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 10:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673267.1047575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkrc-0006Mj-9k; Tue, 30 Jan 2024 09:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673267.1047575; Tue, 30 Jan 2024 09:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkrc-0006KW-6o; Tue, 30 Jan 2024 09:57:08 +0000
Received: by outflank-mailman (input) for mailman id 673267;
 Tue, 30 Jan 2024 09:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUkra-0006KM-LV
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 09:57:06 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec7ba174-bf55-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 10:57:05 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d051fb89fbso17618271fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 01:57:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x13-20020a056638010d00b00470b336b56bsm1501494jao.106.2024.01.30.01.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 01:57:04 -0800 (PST)
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
X-Inumbo-ID: ec7ba174-bf55-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706608625; x=1707213425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiTvkDEA12sWOdI1NNDDfA1B3SEp0Xr55KevseQSkoE=;
        b=Y6BSLwkhsCVMFqiwgSnkqvWLN3sxg3nGVrRNaUMS+fO8IrwFs/CTRuuk8H9pzFQI1h
         9v+KgFHo4hUmBuOE/1gh33WbyB09cwpj6iusfgkOJ+804OdMgl69Csz6HsfOAGBnK86f
         FPkq7YlEVqLQSHGRnQ6hA/oJMIulBj7+t9Yw4m+FoSbYzu/5yllrV+Vfd70IBsvnWFk4
         NFvmiuvOpEkYsVC34WdvFhJEkQKVoDMzORVSPJ5LC2+kCwJFu7K0MLo90Fo1J5mFImQb
         7GdCdk8ooCr8OO15HDBmWhuUqLA54wYtAAoiEIwor+0OILPRf0vj3TMwzdDKiy884Ve2
         DfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608625; x=1707213425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IiTvkDEA12sWOdI1NNDDfA1B3SEp0Xr55KevseQSkoE=;
        b=rsL90WdekpSsrinADedta81w4q+cENR7WkPiAUSmQrm5Dd0c0eMOagvsUn8oo5RRvC
         enVdz0sWIF05VULhHc7lYQiZOCFWBTa9xlEwnniFTLvflHBuoTs3Ar/Y42sURfhBPDTu
         qmAmj/8TH1+jpgN39Cnepfeu8Vg2D9+tIOlBirfeS+b3P+sbp3nQImY5VnTXxQXbomCX
         1PPSFmnNvloZsa1g5Lp4tnNW6xqxkafpWnvp2jKrZ4D0wJDhRn8OoU6rtCoRX3mWyev6
         TvmRoj0Ht9TzUzoYW1mWz88ouWhkFGTIIXzMvAAZtN1wbabT1HkIJu2qLpMOstKvy9Vs
         QbdQ==
X-Gm-Message-State: AOJu0YzGZMhigQQWSLiaxlcEYMDEBicfPkzt9a8RyHh05V66glsYfoNN
	2bnTI4g75dpLm9E7O2T4Wg40nVNbzIoh2IzbfG7/LTQDXEqUPf5lK2reRG2ExA==
X-Google-Smtp-Source: AGHT+IFLjR+lWQjXicfSuC3gCG7/Ar0nWSfxFusyz/vgSjHYX8CFsIoplbpheWskJdSRqs0RPt9Sbw==
X-Received: by 2002:a2e:984d:0:b0:2cd:e963:b6c1 with SMTP id e13-20020a2e984d000000b002cde963b6c1mr5443925ljj.13.1706608625184;
        Tue, 30 Jan 2024 01:57:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWmOaFmfiuUBYckBTTjot70AfnAWSP8FR/jID3GK8c3qtfz2+C0GltPetd+FM+IMgbU+QVmwgKriehdBIe9ifMeCwQqhdg+poAFTx0yyjrIAYj0kY5klkhRYhGOjUxvxYXr+zKky6jnMjhGOElcACemYH3YAWnU
Message-ID: <9ccb27a5-7946-4c16-8307-f4b124a33021@suse.com>
Date: Tue, 30 Jan 2024 10:57:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86: Remove gdbstub
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240126205418.3587177-1-andrew.cooper3@citrix.com>
 <20240126205418.3587177-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240126205418.3587177-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.01.2024 21:54, Andrew Cooper wrote:
> In 13y of working on Xen, I've never seen seen it used.  The implementation
> was introduced (commit b69f92f3012e, Jul 28 2004) with known issues such as:
> 
>   /* Resuming after we've stopped used to work, but more through luck
>      than any actual intention.  It doesn't at the moment. */

As mentioned elsewhere, this alone might constitute a valid use of gdb.
Hence I'm a little hesitant here, but given no indication of even this
narrow use case having been employed by anyone at any time ...

> which appear to have gone unfixed for the 20 years since.
> 
> Nowadays there are more robust ways of inspecting crashed state, such as a
> kexec crash kernel, or running Xen in a VM.
> 
> This will allow us to clean up some hooks around the codebase which are
> proving awkward for other tasks.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


