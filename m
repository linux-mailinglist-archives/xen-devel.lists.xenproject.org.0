Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3200F8D86BE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 17:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734978.1141129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEA46-0002Qp-DK; Mon, 03 Jun 2024 15:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734978.1141129; Mon, 03 Jun 2024 15:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEA46-0002PK-Ae; Mon, 03 Jun 2024 15:57:42 +0000
Received: by outflank-mailman (input) for mailman id 734978;
 Mon, 03 Jun 2024 15:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YA0q=NF=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1sEA44-0002PE-Nl
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 15:57:40 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 004e8db4-21c2-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 17:57:38 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-35dbfe31905so58347f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 08:57:38 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0667366sm8975604f8f.111.2024.06.03.08.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 08:57:37 -0700 (PDT)
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
X-Inumbo-ID: 004e8db4-21c2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717430258; x=1718035058; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfqXv9O156k/qVlRPORBHveRYZBimdALutURsiXGVic=;
        b=DMhi96OyNNRWjBA/KtxI5GauPu9nIsfAtZq5xAQq7gblKWfEP5k7xOjbdHYl/8hYeR
         gkZj9ez+j3YkqOCU5c1FM/fLwJujzB5IUBBPwE1bfsS3SDr3KFU+GrZ4qHuruRKFVrDR
         38X5KGWarITmqGd+pUBpFT3n6fbBTVFMTdVlnYyLaSAVksJ0Spa8i3sMjRO2nsHr1vnL
         q678NdxpWFH55JJnXglQQ2FCvLqydR7KE5CtuH3HWzA5VpNWTQEBFzgJ+JOEq+qF51Ho
         /uU+6i4bkjaxC8ukGxELPUn5muOHxurpSXbcJmQzhtNevmMpbt+E51vRXSXmk1puqiF/
         1HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717430258; x=1718035058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfqXv9O156k/qVlRPORBHveRYZBimdALutURsiXGVic=;
        b=M18t7kj0ZbEEwVpsyfqY72kvkfuLWYp0tu+J6jTVXDfU1EHHgFT50uMaywcRiJxUHe
         sTu4K585gb2aA/EKLgMe1Ql+4OtgYSQze3RnWuxmODEK5JsoE1hAB3Y4DCSii2AIkowj
         WxIT05O5ucRVTqN9QNQ9usK663kGAOBNdG/jDI/kBfMY1fD11l/KAV4r2h/j4Pq/XxAK
         9WjaBmT7od+ne1tk1yjmad6mNlj1rKzOYknl91ZykWJfqqDV0Dk306e/nxWR9OOL+cx7
         P7VNpmEqYreobPnIGQJOuHhI6m0oO3jiVGCJo015vyxzQG/SxM9JO5KEthIF2Pz6FKxn
         z/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVumatO+kSSG9MiasrDebL53sPdfsNh59Cy/gr2So+4uyzyYBS3pFWOTYw80tBUFIh0V3blzVOa8OTM2t2YRlmD3ilah0vEO9U/oPpUfE=
X-Gm-Message-State: AOJu0YzfRZ4x3VfXbImia63BcYWUc3rghlpCEnLkOW9XV5uPc9IQYcVt
	9DwhX5OLbS7BaDxQsJCIVYRDWNuXAADPdnV+daT04WuXhBkp/AGbwsLiWMI9GS8=
X-Google-Smtp-Source: AGHT+IG0AwImAZQCWL5EcwF+xN/h0jceBRg8jiE8riT+hg2DO7rDBxMnf5lD3Tad7RQSC7AjUj7+Fw==
X-Received: by 2002:a5d:5272:0:b0:354:de21:2145 with SMTP id ffacd0b85a97d-35e0f271297mr7022282f8f.22.1717430258024;
        Mon, 03 Jun 2024 08:57:38 -0700 (PDT)
Message-ID: <abf1c6da-71fe-483d-8edb-0ebfef14dbcc@linaro.org>
Date: Mon, 3 Jun 2024 17:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/8] xen: mapcache: Make MCACHE_BUCKET_SHIFT runtime
 configurable
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240529140739.1387692-1-edgar.iglesias@gmail.com>
 <20240529140739.1387692-2-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240529140739.1387692-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/5/24 16:07, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Make MCACHE_BUCKET_SHIFT runtime configurable per cache instance.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   hw/xen/xen-mapcache.c | 54 ++++++++++++++++++++++++++-----------------
>   1 file changed, 33 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


