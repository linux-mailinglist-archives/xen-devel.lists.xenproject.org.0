Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761858FFD96
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 09:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736349.1142411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUQx-0004DE-0Z; Fri, 07 Jun 2024 07:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736349.1142411; Fri, 07 Jun 2024 07:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFUQw-0004AN-U7; Fri, 07 Jun 2024 07:54:46 +0000
Received: by outflank-mailman (input) for mailman id 736349;
 Fri, 07 Jun 2024 07:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sFUQv-0004AH-Pe
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 07:54:45 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33a0a160-24a3-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 09:54:43 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4215fc19abfso12634355e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 00:54:43 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4214bf49109sm75516875e9.1.2024.06.07.00.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 00:54:42 -0700 (PDT)
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
X-Inumbo-ID: 33a0a160-24a3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717746883; x=1718351683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMi1ZLx6N9ad2DtJveP/Z7aipRapZgTbdPmqvyj0eNk=;
        b=M93wr90bPqsFDQEI3BdH/n6oh/8+o9BahqLyRDyL7z/jJrEzPf/ApnkEch2MVIUWvD
         f0QlKEcC9ZBY6aDLWzig7NHAW0mkmhcn6yMLyYzUnzA8Cfkf8t4Hl9S19jfvih96VC0v
         /FKq8OIYQ22WTL4WNKvmbccZoxA03R3TTmqR3Rp4ZPLpT03Fd3qe6MZV2Gqpp7Prpz76
         tjuF5EWfS1o5b/8EFs0hr+rTrzj/KuzPR+Nz80i8XMZJq+LcejszMvz+QiCdW6bztr2m
         73i3LAWJNwgi7zB1bEQbPDIuztsgnfVot7yJY3sCe/zW2CsEwOJH+MxB8C7pjQLf0I07
         fvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717746883; x=1718351683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMi1ZLx6N9ad2DtJveP/Z7aipRapZgTbdPmqvyj0eNk=;
        b=l2hyfGaP7Tl0b52ZeuPV0LK8IAi4HdrsK/plJvOx/RT9en4PY50IjnF2fOHYCGkdIM
         +6ZLH2J/Ik2DNT0rjl7ZFYYKebYl0JopRIsNeV0EVSVy3r6NF8S0fyhd0NrzfcSVUpE7
         QmuVTQrATUvNJeTYqVyfYKOxs9bE00zzDmFJ9RSylPFJ+S+/8FvDrjEB+3Uyk2A7YsxE
         I5mTeedpS/vurFDHM/NVEHN7eBA/T+915v3YuNrHRV17ueM3xS2QSN8fzmRf5SorRDSx
         Xlzl1bXyV6dI9B7yDmuDZlSbpFkhNjlbncBZmcvtdIJGrDs6yBXKRK646P9wIU+gVO/C
         Glzg==
X-Forwarded-Encrypted: i=1; AJvYcCVenAT3Pwl+WKFrU/W5kIwmhLQhXFWS868tFUmoorXFbCbtcRRFo/BNb8L06Fo2C13qC7OYg9LmhXhfO1nVL7NOBg3ZNfVwpEiXzUY93qQ=
X-Gm-Message-State: AOJu0Yx3TeIZLo8Q7irMcyAdB74dbAaUm/sHLXuGPf9iJSyJxxGI4t4/
	IrXrUbmiijGqFuvTNgpJJbGGR8HDQ5weBKWkhfT/6ojWb/LZTiRu08FF3XgMWw==
X-Google-Smtp-Source: AGHT+IGJ2rz1WInx9PnJALnkieAqRf+1CjxI3tyPu8ItDxQY28yQDvd/kOFTtNiYxHHeQxWX1HW08w==
X-Received: by 2002:a05:600c:a69d:b0:420:98d:e101 with SMTP id 5b1f17b1804b1-421649f4ea5mr16065065e9.15.1717746883165;
        Fri, 07 Jun 2024 00:54:43 -0700 (PDT)
Message-ID: <30228bc4-fc42-45fc-915e-cf66be05314c@suse.com>
Date: Fri, 7 Jun 2024 09:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 05/16] x86: introduce using_{svm,vmx} macros
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <9860c4b497038abda71084ea3bce698eab3b277c.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9860c4b497038abda71084ea3bce698eab3b277c.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:16, Sergiy Kibrik wrote:
> As we now have SVM/VMX config options for enabling/disabling these features
> completely in the build, we need some build-time checks to ensure that vmx/svm
> code can be used and things compile. Macros cpu_has_{svm,vmx} used to be doing
> such checks at runtime, however they do not check if SVM/VMX support is
> enabled in the build.
> 
> Also cpu_has_{svm,vmx} can potentially be called from non-{VMX,SVM} build
> yet running on {VMX,SVM}-enabled CPU, so would correctly indicate that VMX/SVM
> is indeed supported by CPU, but code to drive it can't be used.
> 
> New macros using_{vmx,svm} indicates that both CPU _and_ build provide
> corresponding technology support, while cpu_has_{vmx,svm} still remains for
> informational runtime purpose, just as their naming suggests.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> Here I've followed Jan's suggestion on not touching cpu_has_{vmx,svm} but
> adding separate macros for solving build problems, and then using these
> where required.

As an isolated change this then may want expressing via Suggested-by:.
However, I question whether these wouldn't better be introduced
together with their (first) uses (and then perhaps no such tag).

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -26,6 +26,9 @@ extern bool opt_hvm_fep;
>  #define opt_hvm_fep 0
>  #endif
>  
> +#define using_vmx ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx )
> +#define using_svm ( IS_ENABLED(CONFIG_SVM) && cpu_has_svm )

Nit: Stray blanks immediately next to the parentheses.

Jan

