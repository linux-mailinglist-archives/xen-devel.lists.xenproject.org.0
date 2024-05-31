Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161898D5EED
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733535.1139842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCywN-0000pC-Lt; Fri, 31 May 2024 09:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733535.1139842; Fri, 31 May 2024 09:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCywN-0000mf-IZ; Fri, 31 May 2024 09:52:51 +0000
Received: by outflank-mailman (input) for mailman id 733535;
 Fri, 31 May 2024 09:52:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Umgu=NC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sCywM-0000mZ-Ct
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:52:50 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a20d834-1f33-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 11:52:49 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-35dd0c06577so760864f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:52:49 -0700 (PDT)
Received: from [192.168.3.251] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04caf05sm1456441f8f.42.2024.05.31.02.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:52:48 -0700 (PDT)
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
X-Inumbo-ID: 8a20d834-1f33-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717149169; x=1717753969; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hf6kJtuim518JzfO4xCI8JR2wSGNLAwFB/Bm4BXuuKY=;
        b=hMUU6SVIH+4Lz9sj0cqHV1NmjzbaaQKWsbcJzx3l52IB3KJl+OdtTMsPd/5y8vkEYj
         xt9n90m0rUz/qSd4XT478TRzu85Q1NZX2QPC3nV0O/6zhsHD2+3BlTPwrDdhY75RaDoh
         +8AMf1S/7IqfQkpROSAw+M7+r1IgXHE9doN92lblwRpQMXqWDxQ/6npuDrrASJZ9lYH+
         PqAIysBUqbGITrYp49pkx0VcJMdIEC0CaNoCF2rgHpKSoX86QrychXiyVpjyU42p3vHt
         /jap7BeAt3RPJOx6u+3UWz9qwkNFdPEsQWl5EuZ68CWfFUbph1yFq1JLqWAPBIcdipHV
         FvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149169; x=1717753969;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf6kJtuim518JzfO4xCI8JR2wSGNLAwFB/Bm4BXuuKY=;
        b=B3ytWNiIeoLCy7+7OTv62Vrnoom27hVb2ESW8w8G2s6GaGicg3gpqTRDhJSihVDvis
         hj6HQToIfqBCzQuHEa0+47+euI/DIg8ePEluKtPbz8Hri+8amQuiRxFbYzbneCX5ixRw
         k+y6Agag/2A518I7DJSZh77Sv3VAC0uEmV/KfAvV6ZBI2GU1EKVMEaPs5Tu29uhtVuCO
         Wqd0LFBlFTtCOaO1terVL4SUiNc4XoOtkjD67aNk1bE2RKQoyJcgyE50l61caY3cShhO
         2jjo6pmRAV7zsFNTZWRLi2pFBqm3QmYfleWnLELaiqxcXhgd3iTtCvistEYvYZIEdqh2
         rXdw==
X-Forwarded-Encrypted: i=1; AJvYcCUJKlCltih6dOEkaBgGpBVHXa2DrLr2tC3UoX+I1FyxrC5f3Nz2OO1RbIVaFCdV1CYoJj8mu5zAXlMn63FJHcpsQIbge63GFh3DRpb7RkY=
X-Gm-Message-State: AOJu0YwNSxtQpPO+qYwvjewTx5LhzUn8CVOSeD7CPS63B9myz87yo3vk
	n/xruFmxp/T2RwCICVNku4A2pggKgizYEVAxhDO3Inh2pfKm1Xog
X-Google-Smtp-Source: AGHT+IEmAqd0XCpRFy8zmJwHnoCNgGkDW2xaUrnVWSz6NQR69vAe7JyIAXDN4o/nuWE0i9HYxGE4Aw==
X-Received: by 2002:adf:face:0:b0:34c:d5e8:faad with SMTP id ffacd0b85a97d-35e0f337d0dmr844739f8f.58.1717149168693;
        Fri, 31 May 2024 02:52:48 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3c1d9624-90d4-4248-97ac-4bfea2ee273c@xen.org>
Date: Fri, 31 May 2024 10:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 4/7] hw/xen: Make XenDevOps structures const
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
 <20240510104908.76908-5-philmd@linaro.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240510104908.76908-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/05/2024 11:49, Philippe Mathieu-Daudé wrote:
> Keep XenDevOps structures in .rodata.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/xen/xen-legacy-backend.h | 8 ++++----
>   hw/9pfs/xen-9p-backend.c            | 2 +-
>   hw/display/xenfb.c                  | 4 ++--
>   hw/usb/xen-usb.c                    | 4 ++--
>   4 files changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


