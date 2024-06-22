Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DF39133EE
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 14:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745860.1152923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKzl7-0001YT-Po; Sat, 22 Jun 2024 12:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745860.1152923; Sat, 22 Jun 2024 12:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKzl7-0001Vv-Mj; Sat, 22 Jun 2024 12:22:21 +0000
Received: by outflank-mailman (input) for mailman id 745860;
 Sat, 22 Jun 2024 12:22:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O0zD=NY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKzl7-0001Vm-8C
 for xen-devel@lists.xenproject.org; Sat, 22 Jun 2024 12:22:21 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1182efe0-3092-11ef-90a3-e314d9c70b13;
 Sat, 22 Jun 2024 14:22:19 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42172ed3487so21606445e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 22 Jun 2024 05:22:19 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42481747c76sm63506205e9.0.2024.06.22.05.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Jun 2024 05:22:18 -0700 (PDT)
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
X-Inumbo-ID: 1182efe0-3092-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719058938; x=1719663738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OskZSA95z4SLwpyXDqrqW8BgeB6DkJ/Y0wrFrK2f5Gk=;
        b=RX1hSlwphwSxtt/EOBtvZ6p8wmIUuDeKnXTNGXyD9xodPsDNi+miSHGe3tHBQKfmFg
         vp7wQR+W+H3BbmYPsezI57GJHMvs6OCW+7oDfoPQpk2I+L8o615Vw7cxXdUSuNM3Ft4p
         TrNCTt82ujZ+909KVgm6/WXGtp6h2To+mZMyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719058938; x=1719663738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OskZSA95z4SLwpyXDqrqW8BgeB6DkJ/Y0wrFrK2f5Gk=;
        b=efcyW3wzPrL0RoZBoIoRrQ24bPsDe4R8hTrU9ocvcpyLBT/9sFtk2fmTcKK/uKp2rJ
         Rm1jiSauSAxw032Ctv12HlEBNl2dSZ4xxjrjirbGNvY0Hnd3XT2on1CyoMqWGfVIA0y5
         eiB7ot/W05YxvFUV5ZSOPodXz8Lvw0uHZzpn5jjYvtAEuEADkeXG0B1fvmrDickP2D6J
         7oh7e2S/3AFvuW57+kD5AstKW9e27Q8EbtXI9V1P0gxpUv1AzsX7EpLmdtpBMjIJqB++
         +nFP7AN4CoqU6jwSxPpHVKpjCN3arqiXaBJQxqqa47TMzbFSNHOLoZD7rHQWihK27LS2
         BhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrBwj02Rj9PdOb5kMuRTLcBqCO+hdcUUy3dB+RM2LSaXurkQLUDax5uhiHkYOtW+N32hwvjUnPQQtZpci4BbKJDfU+TXfOJ/XbmvGFHnM=
X-Gm-Message-State: AOJu0YxGGl1LTHj0lR9LeDqyGCBHIzr6ZLuRlarPBsX0ChqumaKPPf3n
	fdQoHeaGnix52U5TwTAm6G7CS/RnY2PfCpjuQ/u7diLZmpS8XGiceLG0QBWZb2w=
X-Google-Smtp-Source: AGHT+IHJWspt2GfyfZPYEhtSiwimIdER4I5suxvT/z/dIxUD8liW2TytBf/ogipZRT7RxfPslCTJqQ==
X-Received: by 2002:a05:600c:489a:b0:424:8b0e:be07 with SMTP id 5b1f17b1804b1-4248b0ebf6dmr3996185e9.5.1719058938400;
        Sat, 22 Jun 2024 05:22:18 -0700 (PDT)
Message-ID: <e8ca39e4-dd44-4399-9712-e1737f98bd0e@citrix.com>
Date: Sat, 22 Jun 2024 13:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: configure Rule 13.6 and custom
 service B.UNEVALEFF
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <73b4105bf007e5bd0f351ec70711ba7219f31eb3.1719053209.git.federico.serafini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <73b4105bf007e5bd0f351ec70711ba7219f31eb3.1719053209.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/06/2024 11:48 am, Federico Serafini wrote:
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index e2653f77eb..6bdfe7c883 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -328,6 +328,16 @@ of the short-circuit evaluation strategy of such logical operators."
>  -config=MC3R1.R13.5,reports+={disapplied,"any()"}
>  -doc_end
>  
> +-doc_begin="Macros alternative_v?call[0-9] use sizeof and typeof to check that th argument types match the corresponding parameter ones."

Typo "th" => "the".  Can be fixed on commit.

> +-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))&&file(^xen/arch/x86.*$)))"}
> +-config=B.UNEVALEFF,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_v?call[0-9]$))&&file(^xen/arch/x86.*$)))"}

There will be expansions of these macros outside of arch/x86/. 
drivers/iommu/ as an example.

Is the file() clause targetting the source of the macro (in which it
probably wants making more specific to alternative_call.h), or the
expansions of the macro (in which case it probably wants dropping
entirely) ?

> +-doc_end
> +
> +-doc_begin="Macro chk_fld is only used to introduce BUILD_BUG_ON checks in very specific cases where the usage is correct and can be checked by code inspection.
> +The BUILD_BUG_ON checks check that EFI_TIME and struct xenpf_efi_time fields match."
> +-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^chk_fld$))&&file(^xen/common/efi/runtime\\.c$)))"}
> +-doc_end

It's just occurred to me.  Anything, no matter how complicated, inside a
BUILD_BUG_ON() is clearly a compile time thing so has no relevant side
effects.

Is it possible to generally exclude any sizeof/alignof/typeof inside a
BUILD_BUG_ON()?  That would be better than identifying every user locally.

~Andrew

