Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E581368D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654709.1021945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDons-0006NM-LL; Thu, 14 Dec 2023 16:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654709.1021945; Thu, 14 Dec 2023 16:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDons-0006LX-Ik; Thu, 14 Dec 2023 16:43:16 +0000
Received: by outflank-mailman (input) for mailman id 654709;
 Thu, 14 Dec 2023 16:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDonr-0006LR-Gm
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:43:15 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dff1f64b-9a9f-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 17:43:14 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54f4f7d082cso9451680a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:43:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 er22-20020a056402449600b0055291f03be2sm147803edb.83.2023.12.14.08.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 08:43:13 -0800 (PST)
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
X-Inumbo-ID: dff1f64b-9a9f-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702572194; x=1703176994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p59r0OwJ2c/bXFSnnK6lECJNx+J4L0BqUsqOUHTNUyA=;
        b=dlgTCeqUGITeJeyNtke8AxHy6w0Fdui4XrbmZ1KDeSsQnEkgfZOt198ihnWreYvUmn
         LFoQcQfGUUDkGClzqvwoO+BMQvianXLQMluwAu66es8tktp2tJFvyMpU6CWpMo5HtW0H
         lq3Jhg9Ne9xDSedq5OXekEguXkBLpH1P5Q13jkYYqLgamvioqxHCOj2AMBxx0NLKNlkP
         azacQT9gB3MvfO2bpeRW2pfV1C0e9d9vyeuwQQv39udpFFvyyGwL1Y9H+IWDSBFCamtK
         PFPDQFmkb79e0lWEDP7GrYn3Op0bh5CNXlvXjLw+G1vHU/VbBjJxSypGA+E8awiEx6mi
         K1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572194; x=1703176994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p59r0OwJ2c/bXFSnnK6lECJNx+J4L0BqUsqOUHTNUyA=;
        b=tC7wTdOwu5Pb8P/vRPpvv70ldy9WFXBD1K+lf2L+ER1JCesQFDPIEvIBZ3Bz5+AxfA
         jrut1N2BN7GObf+AQBFbY5XfF2ACA4/ATnAcQuavPg4IRTPfQfNoAygCRnJTxpYTKgLt
         n54mIgJmio6nepa3KXi3hWkvAw1feMsdN9AG+H8wIqiMRAbwTtXRdge2Zsxtakx7U5WT
         +CPmo3m9W5YsuzOVZQTO68WmSjaJazyZavHndKr7NlmpQwZbPsDl9weoYPITPJAsIBrx
         0aiBJ/32K9I81L/Ex7Wc95wixqeo1molTvsuqrJdCDGqi3LeqOZVvFvxBMx4MDCtkRnF
         ZUbw==
X-Gm-Message-State: AOJu0YxyrBZFbEjHBCUDzoYIc9eFTkqbTw69Kr85C5oqH4pwzvQ9Y8O+
	i16KYACmoZzDNhtgPnXlh7gr
X-Google-Smtp-Source: AGHT+IHCSJa7986FsQocuLUjhuRSr1fleGUvOa4gGos5KdhSYCj7whANhFt2044LkoVGAkMtc8NMYA==
X-Received: by 2002:a50:d706:0:b0:552:3530:2f88 with SMTP id t6-20020a50d706000000b0055235302f88mr1569749edi.68.1702572193932;
        Thu, 14 Dec 2023 08:43:13 -0800 (PST)
Message-ID: <97004f27-8b57-490a-aa02-48dfa724c593@suse.com>
Date: Thu, 14 Dec 2023 17:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] x86/hvm: address violations of MISRA C:2012 Rule 11.8
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <bfdd8f021230224e3bb1aea2aceaf2c712615ba7.1702555387.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <bfdd8f021230224e3bb1aea2aceaf2c712615ba7.1702555387.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 13:07, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Remove unnecessary cast.
> from is a const-qualified pointer to void and the function hvm_copy_to_guest_linear
> requires a const void* type argument, therefore the cast to void* is not necessary.
> 
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



