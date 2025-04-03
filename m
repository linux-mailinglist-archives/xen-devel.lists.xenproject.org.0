Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839FBA7AAE7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 21:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937190.1338208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Q3K-0000h7-Fb; Thu, 03 Apr 2025 19:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937190.1338208; Thu, 03 Apr 2025 19:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Q3K-0000eo-D1; Thu, 03 Apr 2025 19:16:38 +0000
Received: by outflank-mailman (input) for mailman id 937190;
 Thu, 03 Apr 2025 19:16:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0Q3J-0000eh-1V
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 19:16:37 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28368531-10c0-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 21:16:35 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so713706f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 12:16:34 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a67a1sm2483502f8f.24.2025.04.03.12.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 12:16:33 -0700 (PDT)
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
X-Inumbo-ID: 28368531-10c0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743707794; x=1744312594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0JnEDoYlTFRHgSnQxnYJjeyx6TDcDB2dZ0/ffJJWSFQ=;
        b=Xs0qVTWI+0sCAmthGySOc3U/8jJb2HYuIQe/kuF+E+Ic0hiNNUOi8LCUkGc75F2Uhn
         jGfQdylkoqJizG5IUj2LRZ8UX+xi0oPIccfYWF159Ma0Cp2b1L6VCWQSQl+X3vZeHHGG
         FAQiTyqdKQLgv5SmFrBdF53AWke4ppWX3ULEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707794; x=1744312594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JnEDoYlTFRHgSnQxnYJjeyx6TDcDB2dZ0/ffJJWSFQ=;
        b=X+M+8kPwgd8NFDOle3XUqGSS5h0G+QB14n21ddgPLWROlcbVlEiPp46KKUd3ZHkYjy
         mqVwydDmVYJWpxpkdcMfXSU4TvV5sy1jwtltaqC3/EVAfJlxgoZqrfj6QdP0tLeQ6p4g
         TF1wRcP2Xqpq0nldTn5Ouzbgr19CiCizV1XDAKhW8Mqy9tkrNEP7KkEc3dW/9kkPpyVZ
         ZsaytF4jSsF/aoytex1Pb28+B4FLYWNo5CirQ7PXyB7x8LifbJndzV3qx45QGDsKU81z
         ue3OadiHbT4CAE6i8GV+e4FgyZZhjG14myaDL4IhChxEtWlJu9hxyKoTacmIVCfjKXBo
         7ecA==
X-Forwarded-Encrypted: i=1; AJvYcCVbCPPQ9pRrBditNatCk66kKoZa2PM2viKep7KW2hLHdYBlf7kgO7lxuOJw7jXL2SGYSwIDYStiB/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyigh2SsAk1SuV3Ffb6dmP0E3j/HpwQb7yBrcn0r7EvSlVWHwx7
	F9An0Riy1Q/eK9afN6iv1iaKkKaCewCZEiIh7HmS4BaachuDHtDhYBtYeUeDlV8=
X-Gm-Gg: ASbGncuGJ8ifw4b0GzcxZ/CfsQdRbIeW3yxFnlrLihsifQqN73epDdZYwzD+zTD2cwr
	3AuhByRfMcoiOr09U9eoOvopoD7mPxeclyicFY7dc45uQwg5x2CUyIywLEJXo+ypXSh1C/II8cP
	thoJmfHG+XhJT19PUA4NxixkEVT7PGzvdjxRgr00ETyu4oUSVG8esQ69qZuVSyxA3AJe6eqB8f1
	FSlKXRQV/8hYMOiNNK2Cs0r/EyemKQzY3JmgxOu69inA4E5JfAVMO3/+4z8JAiZWzT8Y7/h9/kz
	pQMV5XsotJJH9KDo9h5WLe8y5Fbn6IE+iWZM4IBU2GjoJddJYYfw6SmrXj8lfMmizttILYhPjYN
	vDMrySk2nWw==
X-Google-Smtp-Source: AGHT+IHEl8m8cA2rMU1EYJf/p24ZniZRUAT42WV0uEALlU5L0kv5wpl8oEnqbzsEeTTlJ/cT781rdw==
X-Received: by 2002:a5d:64ec:0:b0:39c:1efb:ec9a with SMTP id ffacd0b85a97d-39d07ad8ab2mr38421f8f.6.1743707793838;
        Thu, 03 Apr 2025 12:16:33 -0700 (PDT)
Message-ID: <539dde2f-8b48-430a-9534-76a58b4c1b4f@citrix.com>
Date: Thu, 3 Apr 2025 20:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] x86/msr: remove HAVE_AS_FSGSBASE
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250403182250.3329498-1-dmukhin@ford.com>
 <20250403182250.3329498-3-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250403182250.3329498-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2025 7:23 pm, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> The new toolchain baseline knows the {rd,wr}{f,g}sbase instructions,
> no need to carry the workaround in the code.
>
> Resolves: https://gitlab.com/xen-project/xen/-/work_items/207
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

