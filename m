Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3547D4FDF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621907.968800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGdL-000633-PU; Tue, 24 Oct 2023 12:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621907.968800; Tue, 24 Oct 2023 12:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGdL-00061Y-Md; Tue, 24 Oct 2023 12:35:43 +0000
Received: by outflank-mailman (input) for mailman id 621907;
 Tue, 24 Oct 2023 12:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvGdJ-00060A-PT
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:35:41 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6db0273-7269-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 14:35:39 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so36561275e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 05:35:39 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b00402d34ea099sm16729462wms.29.2023.10.24.05.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 05:35:38 -0700 (PDT)
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
X-Inumbo-ID: d6db0273-7269-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698150939; x=1698755739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jt2cxa6ddwVCH4+7Ko2rashlvH36j0rjOEJrfGyoF5I=;
        b=F2aBjGnK99INZi0E7V4kGwgCcKHjgaocRCrU58h62NCM8lPQf3kFoiHGfF4Vms3dRS
         lKLR/TGK8+C3p6heFC6ALEu8Dy0rnwybmclGE4U7bklQ1INxVevKNOmPMnR4o3xbIvbC
         DhxI6YEpYgMXTNKPnzokJUlqW/baBF64QgNOi8OqCUcpbyaR8GDBSoYwtiVE2soCCN8a
         Ot6cmFq7+yW4oDaDfPTuXcFERihAykMjCMY4a2IwnMeVdvI1p5PiSaANcr95a6dST7ti
         KbC1ll+jw6pwyZT79iIdbdCJizyy69UTvxWiWNoCQLjnZWLzOnTa7l5Hitu0R9Z4ZbSJ
         6cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698150939; x=1698755739;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jt2cxa6ddwVCH4+7Ko2rashlvH36j0rjOEJrfGyoF5I=;
        b=GyohpFwkQpmnys8bwia+Q2WWwp5ARLZfpATA9KmbSd2DT4jb1/LersHm4UaQ5VDKv5
         I3PVhw5yTx6MMnCSdhNrXujIrBPhTD8VGnOPkVeUYEa1ELY1fM/cT2tP5FaBQTAxHObH
         qZXqE5GClEDAOeIfl+I07QMXU9zCeXUvDIIpKp7M25UrOnJ3ZQHNjAVFkCotLadU9QvW
         kiuHyEcLJ2XMWcBor6fGaAWRioao89xJJ5mpSaNAmyee/2+3j0nYJ05ynkf06qNfZXcU
         wDiE/adnCY12Kv40sMqK9K68sKjE50COaBazpImIq0tFLK5T8nsx1QN9R/fDh84eIYAM
         fcvg==
X-Gm-Message-State: AOJu0YzwEqpO8jOCX1WRs5bylAGT+NtCRHZ98EdWvL/cpMDvNFBEHcCQ
	pNj6ZvbTvNrYewWkCfJTE0sqTO76A46lBQ==
X-Google-Smtp-Source: AGHT+IHcviZwp5sEUV8HujATdN4eCJmLKJnxtVpxw/CtGmvUMvR85yAd1lcelMOmu9e8/DWbEGFBkQ==
X-Received: by 2002:a05:600c:154e:b0:405:4a78:a890 with SMTP id f14-20020a05600c154e00b004054a78a890mr9583548wmg.8.1698150939091;
        Tue, 24 Oct 2023 05:35:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <84ac7780-e17a-4957-b49b-46a8307eb9da@xen.org>
Date: Tue, 24 Oct 2023 13:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 05/12] hw/xen: populate store frontend nodes with XenStore
 PFN/port
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-6-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231016151909.22133-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:19, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This is kind of redundant since without being able to get these through
> ome other method (HVMOP_get_param) the guest wouldn't be able to access

^ typo

> XenStore in order to find them. But Xen populates them, and it does
> allow guests to *rebind* to the event channel port after a reset.
> 

... although this can also be done by querying the remote end of the 
port before reset.

> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


