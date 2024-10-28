Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23929B378A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 18:20:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826896.1241342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TPj-0003U3-Kk; Mon, 28 Oct 2024 17:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826896.1241342; Mon, 28 Oct 2024 17:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TPj-0003R7-Hs; Mon, 28 Oct 2024 17:20:23 +0000
Received: by outflank-mailman (input) for mailman id 826896;
 Mon, 28 Oct 2024 17:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5TPh-0003R1-Kc
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 17:20:21 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8b81ba2-9550-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 18:20:20 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a2209bd7fso680857766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 10:20:20 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1dec8169sm393895666b.34.2024.10.28.10.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 10:20:19 -0700 (PDT)
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
X-Inumbo-ID: e8b81ba2-9550-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730136020; x=1730740820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wLHV839vVLTXRRhKD2tZguxdsN+9yysZwUdPDCClAW8=;
        b=pZ0qN41YxNgvXZGxU2Ouae1/8rsRrqR+/KU9cHFEz0GDF01FFfUxFF9R2GxILZ2tMp
         GSAR3erarlYGl+Si/GWUdS9oz88RXpF4COsRXo+YZnyVybLdR8Mv1L3ju/ex+428UiXi
         Z1oQ3Rs+PZrfUvMFAa/GJesaNb1/ahZGYn/ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730136020; x=1730740820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLHV839vVLTXRRhKD2tZguxdsN+9yysZwUdPDCClAW8=;
        b=fAAdMrm/ry4PCLgC8Il/kTdF082giwCvNGRluWiyWIKJwXu19jVtQkLVxlI9bZxaL8
         80/xbyRsvmuCHCEzYx+AcJmNVnLoyvrleH9j5p3xCK1Kmwlrrd7bFRcg2XoLuJshD9Gq
         3efqjHobMTGvbqb6B62vvB8iaq8sFJN/5Bxatrm95artdb0pfEZgYoDSxKrEgquwgKZF
         qPMjmB4CcZDBC18Ye04jlvIML3vwCbtOpzqTHXGMQ1aK3PnoAGcd25+rsybAd2PCwEN7
         l/V2SsMHXqiSqCXkdTi8wPsaOw2rOoDvDltD2VYG+zAtRncVtqRA9Doj8Orfz1/FMQuj
         MIqA==
X-Forwarded-Encrypted: i=1; AJvYcCUgtx4U3crEfCMiUUiohrmTVWfHf8uCjdqpCJF4te45Xo5Aim+hBaJ37GcBG5DBjEIk71U7QYlkgxk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyb5ahc1GyoCU/9zq7uJ4q+pwIUkP1D5/mZ26Q0MhmshoAi1ISC
	N3jYhsmDtajVPPfyI4JZniHB5RXG09hBO72wDGXEuCBhyLhmmc7EP0AHTa6UPhQ=
X-Google-Smtp-Source: AGHT+IGV+S1CEX32VTrHnM1WaJUXrhETl1VyagLcGKLGVmfcEunV5fGnSLbb17dBGo4C3dUbRTGGNQ==
X-Received: by 2002:a17:907:7245:b0:a99:f8e2:edec with SMTP id a640c23a62f3a-a9de5d6f21cmr969172266b.21.1730136020187;
        Mon, 28 Oct 2024 10:20:20 -0700 (PDT)
Message-ID: <0a644e0d-b7dc-49b5-b4ba-943f809286a8@citrix.com>
Date: Mon, 28 Oct 2024 17:20:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] x86/xstate: Create map/unmap primitives for xsave
 areas
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-3-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241028154932.6797-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2024 3:49 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
> index 07017cc4edfd..36260459667c 100644
> --- a/xen/arch/x86/include/asm/xstate.h
> +++ b/xen/arch/x86/include/asm/xstate.h
> @@ -143,4 +143,24 @@ static inline bool xstate_all(const struct vcpu *v)
>             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
>  }
>  
> +/*
> + * Fetch a pointer to the XSAVE area of a vCPU
> + *
> + * If ASI is enabled for the domain, this mapping is pCPU-local.
> + *
> + * @param v Owner of the XSAVE area
> + */
> +#define vcpu_map_xsave_area(v) ((v)->arch.xsave_area)
> +
> +/*
> + * Drops the XSAVE area of a vCPU and nullifies its pointer on exit.
> + *
> + * If ASI is enabled and v is not the currently scheduled vCPU then the
> + * per-pCPU mapping is removed from the address space.
> + *
> + * @param v           vCPU logically owning xsave_area
> + * @param xsave_area  XSAVE blob of v
> + */
> +#define vcpu_unmap_xsave_area(v, x) ({ (x) = NULL; })
> +

Is there a preview of how these will end up looking with the real ASI
bits in place?

Having a macro-that-reads-like-a-function mutating x by name, rather
than by pointer, is somewhat rude.  This is why we capitalise
XFREE()/etc which have a similar pattern; to make it clear it's a macro
and potentially doing weird things with scopes.

~Andrew

