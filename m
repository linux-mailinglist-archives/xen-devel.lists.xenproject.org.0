Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9108BCB48
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717409.1119583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v3N-0002jS-04; Mon, 06 May 2024 09:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717409.1119583; Mon, 06 May 2024 09:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v3M-0002hL-TT; Mon, 06 May 2024 09:54:36 +0000
Received: by outflank-mailman (input) for mailman id 717409;
 Mon, 06 May 2024 09:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0G4=MJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s3v3K-0002fU-Lt
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:54:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a352faf7-0b8e-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 11:54:32 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41b7a26326eso12140975e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:54:32 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05600c474f00b0041ea90d11edsm5565124wmo.31.2024.05.06.02.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:54:31 -0700 (PDT)
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
X-Inumbo-ID: a352faf7-0b8e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714989272; x=1715594072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OcltWuGCNsBV8ToL0ISlYCII+KDrnOLMgxIJIBcpP0=;
        b=qPYmNMekrovadYmOvMYgWtFHrNfcG5Dmkzl3jBnjcbv0vMFHE4i8x6bNYocyPLweBJ
         6i3OzMldBZhnyxZhW4E+VSOf7n6SiiC6Iu36zF2Yq7ifc+7h6YvTnLLKtw4zLBXMCBFM
         QVKMXnsRGTlrXPfATW9fBAhphd3vYr5p0yiDaApdoqR7tXdFOpA/kTbtlBzL8rZfjZXj
         kGWz4WtsnJGBRFAaswiGfoF3cO9q9/s46ErCe/fxvhdxS2fiu4s4GHw2RoN9ZO549OYK
         fK27UzDysfcmeJfySMAzveB/pRzbfSIJuv1/CYqkIx0zZAOTLDd3svP58uG4dQBLaQOj
         QKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989272; x=1715594072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OcltWuGCNsBV8ToL0ISlYCII+KDrnOLMgxIJIBcpP0=;
        b=qduYCRIPDXlDprfeWyZPk5tC0RSs0kVssWNiBW6FzU4q+khlX0Bpj2mwe7RlggtxNu
         zp0fdpa/CGNpFvu/cMAv/kMDapAoQi/fRXtj0lI8kyFjNwMEqBMs1JhzI9BX3vwxejqe
         1VgxfmHPzpXPZhCV16DCNLzRTvtnHpbL29zAdyVz1eqdBKQJawxVN2cGql3H0G/opbj8
         ia7M7LnpyBDwwbHKMw5lsUMqNNHbtU6e1MvtKpceUWF0JX1B6r95K+aLaBXYAf/L8AJR
         NYPuAJUFDd29xdnh31o1SqYQSpMeMG+9tGe3MjBl3S9DkOpep72lrm5kmiVKFoGtPHXR
         vMTw==
X-Forwarded-Encrypted: i=1; AJvYcCX2KAXtB42yV5u3aiUM7vVQsjUCTJzhPm56xS5D6RaFt2bnz4vCPr7wm7mT0DuiSABhGhwJSm+J/O9Rxbi0TaOt9S/+pM0CFhVCPLfo4rQ=
X-Gm-Message-State: AOJu0YxoCP3Y+gDw1J/caFhBYPQ2TsMEi7VY6+/QkyxtndAkzscSLjIb
	lzFxeTq5GA+7vOPLpcGyBM5iqHKjVMzBoMf30gw9fOSFAg/adKhLGSI2h11MqN8=
X-Google-Smtp-Source: AGHT+IFylmkAkvUEoW5CaLT55WPTEepSZxq4J7hnQLGB3yYct+OA5rehhF3zB38+LrV0wF4/FHmvcw==
X-Received: by 2002:a05:600c:1546:b0:41b:4c6a:fa24 with SMTP id f6-20020a05600c154600b0041b4c6afa24mr7329339wmg.40.1714989272270;
        Mon, 06 May 2024 02:54:32 -0700 (PDT)
Message-ID: <28f9b937-454f-4a99-a362-5e50756e0e1b@linaro.org>
Date: Mon, 6 May 2024 11:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/17] xen: mapcache: Refactor xen_remap_bucket for
 multi-instance
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-6-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240430164939.925307-6-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/24 18:49, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add MapCache argument to xen_remap_bucket in preparation
> to support multiple map caches.
> 
> No functional changes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/xen/xen-mapcache.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


