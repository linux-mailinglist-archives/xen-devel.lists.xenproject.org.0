Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A58D5DC8
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733491.1139772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyGc-0005SY-3A; Fri, 31 May 2024 09:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733491.1139772; Fri, 31 May 2024 09:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyGb-0005QB-W8; Fri, 31 May 2024 09:09:41 +0000
Received: by outflank-mailman (input) for mailman id 733491;
 Fri, 31 May 2024 09:09:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Umgu=NC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sCyGa-0004Eb-1c
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:09:40 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82833119-1f2d-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 11:09:39 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e95a60dfcdso21579541fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:09:39 -0700 (PDT)
Received: from [192.168.3.251] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b83d5c7sm18847855e9.8.2024.05.31.02.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:09:38 -0700 (PDT)
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
X-Inumbo-ID: 82833119-1f2d-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146579; x=1717751379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nHLqWeneXgssP+00AwHJM3tHuDqX/2jS/REuWoSHIw=;
        b=mlDNHnC4Gji218IjrB5oOQ73chGvvlVNtAIaI8v+okPGK0fy7o7UQLn1175JQSCGmH
         YrQ0KTk1Bjwst/ggO4G9E/k0ktzpKhdaBTBTujG0R9rNrOeiFJrkSNPrRud067atjROc
         0lybD/1SyYKfAXUQjJh6+NavxEulR6hfEV+qniAWzbZgatRYOMgn/5LgLdNE2FowCVb5
         qXI2DL4gWLsYwjCP/JseYTtm7N7WfgIUFUDbXnaYWZs5YB+B9CbdxEo7XBGZxHc28qrR
         Z/q6akl2irKgLkCnT8ceEef9o3FtDe2AsZVgITYzqcCtKFQC0nT9uUAZk35ty1RPqNPh
         PPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146579; x=1717751379;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nHLqWeneXgssP+00AwHJM3tHuDqX/2jS/REuWoSHIw=;
        b=NhPSUrnRL871/e+PlniZ6CX3wg6NhpMikbi/VhWkYcnJCJKplJYXhdDen2YvbBEqJe
         H2VPQvnE6AB7lyof2XFaCv1+20c0ndTOU/gpYhMOu0fTJBA37dDagMvPVZjJ8+Y3c7Pg
         +duPq9opmo79aqmfJXO77VO4BP8449rGJ5JhPcOyUOPDy27MRBCowIqdcjnj7STbwQoU
         oHWoNVa9PUHpSMr6A1L1Ig9RGkCXVU1dpWCaB9r3n0WWXxvk0YQZmN58aGdvXxcDVy8o
         ZkhPLNKzGzI1GODrHj6K6E76n7JDCM5DkN+KvfIIPpNukk8lgzSrNVDswcc47SN8K6g4
         UKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP0mcQpVs7KJWRXYbfmQIMvlWSSf3YK8QGzPDFAGkvwHbR4Gw9qFxahv+c6SjO+dj3whzSxeYLeAP+77my+SlTWRIyOx62HhafEfmE7lE=
X-Gm-Message-State: AOJu0YwPLlXzCz4oTULw++CWQIWfQQCo9a3eFYNjlixDVaoEPPC1+C1W
	KKFFR/dKERfHjbF2iSq8Q1oZIXPDOf55mGQfx719zAjhPg2Ji747
X-Google-Smtp-Source: AGHT+IH88NdbdF6pEzhBNUimRkWJPQqdY0qzX+TwohQvgXS4DJe6CtPrF9PW//10pZ/crdnVcStzaw==
X-Received: by 2002:a05:6512:45b:b0:52a:daba:f7f0 with SMTP id 2adb3069b0e04-52b896dc4abmr679253e87.62.1717146578471;
        Fri, 31 May 2024 02:09:38 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e1451535-b62a-473d-bb6c-00e91274aace@xen.org>
Date: Fri, 31 May 2024 10:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 2/7] hw/xen: Constify XenLegacyDevice::XenDevOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
 <20240510104908.76908-3-philmd@linaro.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240510104908.76908-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/05/2024 11:49, Philippe Mathieu-Daudé wrote:
> XenDevOps @ops is not updated, mark it const.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/xen/xen_pvdev.h  | 2 +-
>   hw/xen/xen-legacy-backend.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


