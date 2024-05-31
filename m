Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42F8D5DCF
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733497.1139782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyHM-00078f-Bo; Fri, 31 May 2024 09:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733497.1139782; Fri, 31 May 2024 09:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyHM-00075a-8f; Fri, 31 May 2024 09:10:28 +0000
Received: by outflank-mailman (input) for mailman id 733497;
 Fri, 31 May 2024 09:10:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Umgu=NC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sCyHK-00073w-Bf
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:10:26 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d7f7cc7-1f2d-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 11:10:24 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso1051111e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:10:24 -0700 (PDT)
Received: from [192.168.3.251] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421270ad598sm48564345e9.41.2024.05.31.02.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:10:23 -0700 (PDT)
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
X-Inumbo-ID: 9d7f7cc7-1f2d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146624; x=1717751424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kipgqKIxTWjiY1J4diBph0ORkE9vgc6ZqFETK6Cxncw=;
        b=EImHCa05JtLaZL3prsnaLyNaFm6QZBPa8xIKNMUYpYyWoNNjPMTXzg/REGjFlQsXKO
         d/yep5LtnIIBEQBS/CR2SjlVyWkRVusxTpjFDmT5beruP6lDsK8/6XI9KS5Iq/oMN4yd
         KzbeNOHNPykLpj22fp/l/iN68QWHtusAn7Cj+nGmXjW3dcDxt5DIbWvC+4euecNUr8s1
         LI1fN2k70kMytOD5l4fUrAxbLBCnU7ksL9wQ6z2CCBlqU84antl/+sHz7fJyX5aO4YKv
         t+YnpKr0r2qXcPaNir5qncxlnPv4iG0pWRLFGrRsZ4rUatB8d990eD7ZJPvJIh9O/6so
         XXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146624; x=1717751424;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kipgqKIxTWjiY1J4diBph0ORkE9vgc6ZqFETK6Cxncw=;
        b=iAPYOgmeiCKnOD2bOtc/H670FwQqiaTzEfJ6XiB8Y51+uPPTfepofNB8kxZLmJLE2A
         F/qcmJT4TE1/EyezPyznieiAO9ZnYaRo9HaUVVA9JDoa+Flx9xniYWKvy1E+NHHneYIs
         NL6Z1o8EYq7RKNOX9fZnFKV0tG2ceXUKvpiVB8IPBnNx+SoDMQZHQKPCJMXfX389gDKn
         ak63s1V1yWQOBMIvoCSky2lOGyad8j0dig65Yw4dscd1R4ymcO7PbUjscyMp2RR/vVev
         3keeLNj93MxvSGZLUL5/c1VEdeI90QyugdVATFVVv7CXfpyae974gUv9r6Bt/urnNqxk
         viWA==
X-Forwarded-Encrypted: i=1; AJvYcCUQFEwMeWidTMZEnAtMlY1g20eOCt26Y5ZCprobkLBx5O4Od50kB/Eyau0GWiVURz7S7lft4sWt9Kme9yAf9nOxwnzaigML3/JWNkVgB54=
X-Gm-Message-State: AOJu0YwQewp1W8rfo1wxPwwz1/+cG6LHTeu/64+uOmMZlhDT0bys/rmX
	datmRLUMle8ztNQXCi7+lBESG163MwX3JgznR9R+6e5TJDQUjjM+
X-Google-Smtp-Source: AGHT+IG7vTACSFJneASAY6oepgxD0uTbsNdLpJPk2wq3sK792UuWxkKyL5fSGa5cotd0sdJt1GNwgA==
X-Received: by 2002:ac2:4a72:0:b0:519:1047:7eac with SMTP id 2adb3069b0e04-52b89571166mr724613e87.23.1717146624171;
        Fri, 31 May 2024 02:10:24 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <98ef7ab5-5c8f-45e8-9bd0-50e014b981ea@xen.org>
Date: Fri, 31 May 2024 10:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 3/7] hw/xen: Constify xenstore_be::XenDevOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
 <20240510104908.76908-4-philmd@linaro.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240510104908.76908-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/05/2024 11:49, Philippe Mathieu-Daudé wrote:
> XenDevOps @ops is not updated, mark it const.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/xen/xen-legacy-backend.h | 2 +-
>   hw/xen/xen-legacy-backend.c         | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


