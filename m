Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99747ABF826
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992007.1375789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkjb-0002oP-Lj; Wed, 21 May 2025 14:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992007.1375789; Wed, 21 May 2025 14:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkjb-0002le-Iz; Wed, 21 May 2025 14:47:55 +0000
Received: by outflank-mailman (input) for mailman id 992007;
 Wed, 21 May 2025 14:47:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHkjZ-0002lW-Oj
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:47:53 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92c813f9-3652-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 16:47:52 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so1237531066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 07:47:52 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca358sm913936766b.159.2025.05.21.07.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 07:47:51 -0700 (PDT)
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
X-Inumbo-ID: 92c813f9-3652-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747838872; x=1748443672; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I11EPxNNEPGD7g2jhrcCT0d4xhyVr3ZAmyjybLrYLBk=;
        b=WSMVuF4fKiPg6HZehKOWSU8TXgtMumOkkEDYYyLLq4nNokAIqAYX4vJDy8m6DVjjFp
         fvqfpdMxVsXqmsxsbVxp2aIGSqhWDTCL//uJZb0M9790cyJFy9dDzyf4Bze0jiy5wgIY
         g5w9jP8aB7CGtbOyqk2JyiF40wIit8Bb3xtsXmLG/ytDIT+9jd0e2+zM9Elr4IVzmZuv
         1kWFwgKTcJZ3mCw9ZHitalb45LQXJvtGSwaNYnudYnRq6BRFfBxo2uqcTFI6imqZZ5Fj
         OFe2FYbbj4Ky667015KRZ379+j260GXDYopSgzLKV/SsAy7wAxA06qa+mDs7ORZZWqKZ
         M5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838872; x=1748443672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I11EPxNNEPGD7g2jhrcCT0d4xhyVr3ZAmyjybLrYLBk=;
        b=WgngR4odUAUnIzteKOTcqg8ZT2r0V7W+6K8poohWa64pt1jEJwp0fOTb2vgi3+kVzK
         5CGW/BImvkpn5tR6TuUmk7RA0DLFrMDsyXYdLfvj2Z55YT+uIQXhlMO3xKLOtpeEEwDP
         V7jUeC7Dljc2UQ2mH4C96PV4mbba+djCRL46u8VsTCweB9t+ufDcJPh4ZCBYLHcBaE4g
         7z3bDYbkZ2tfF1saTvSwtGmmgOKnrQ0aV87ZwjK1jX6r6MUKYjbbPjAlIpRv8rpmlf7h
         JzCUCMoZBUc6g7L8EzI+uoM7Jcq6o/snyh/vIeF7i+JVfFVpHJkFfiv4nf8a0Btg/Dgv
         02bw==
X-Forwarded-Encrypted: i=1; AJvYcCXZm7u/JhsmwJD4BcP4DmuhV7JithfIrxFKY15To1NvRuh1xZFZVF05+Le+Us17RDf2OOXCPfRk9Oc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnZzfDQhYS7sBc/iAzRwbWAFGn/d0MVizUyjjTLz4Ll1xfAF1z
	CYP9E/iT65IR93iqEhC6A3Xf8R+jAuxVS+WIHeB11HMokSRNBxa80xv+P0/lI5iqZQ==
X-Gm-Gg: ASbGncvc8pB6YasmwRi+vGTC3k+RqdwHfdvW3yuPegXNvxQ5VT4Z70kq0INbOkLPG8Q
	wMs9hhHTK5YRcVcFEskps2mu/Vr7INDvisL64nbQirRGQRnkMm/cfDDJzXzkkYr5KQo+4QPTKru
	yoLfA+j0OUKD/WCfV261l3GlybPWtFE52BJ8yv2RbtUguyNvULTNeUOwtz0x3rTzp7G+1ZWI5OY
	azGGWb13f6rmBzjgcbSHmavoCAsf4qQ170zzMlyaEMPp7o80LPfkM5g+brMffcaVjLcHfsXrz+O
	Mg4eXfRbODo8zf62TbUcNBV2VywxkBjupxuWo7nJ6Jw2rTiY8l3M0CgPIUth5g==
X-Google-Smtp-Source: AGHT+IGZHZccmCQs0Jn3cIQNzAIMXuwLc0gthHUvMDJhxfOVtkc//+W9fidYfngK2riTbbpr9KKQEw==
X-Received: by 2002:a17:907:9814:b0:acb:b1be:4873 with SMTP id a640c23a62f3a-ad52d45ac94mr1761083866b.2.1747838872053;
        Wed, 21 May 2025 07:47:52 -0700 (PDT)
Message-ID: <bfca0457-709d-418f-a060-adf2749d52c7@suse.com>
Date: Wed, 21 May 2025 16:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msr: Rework wrmsr_safe() using asm goto()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250521143658.312514-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250521143658.312514-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 16:36, Andrew Cooper wrote:
> This avoids needing to hold rc in a register across the WRMSR, and in most
> cases removes direct testing and branching based on rc, as the fault label can
> be rearranged to directly land on the out-of-line block.
> 
> No functional change.
> 
> Resolves: https://gitlab.com/xen-project/xen/-/work_items/214
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


