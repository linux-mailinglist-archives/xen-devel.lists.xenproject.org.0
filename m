Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55237604C8C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 18:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425908.674030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBUU-0004gv-To; Wed, 19 Oct 2022 16:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425908.674030; Wed, 19 Oct 2022 16:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBUU-0004eJ-Qa; Wed, 19 Oct 2022 16:00:22 +0000
Received: by outflank-mailman (input) for mailman id 425908;
 Wed, 19 Oct 2022 16:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6HZ=2U=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1olBUT-0004eD-VY
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 16:00:21 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 221effb9-4fc7-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 18:00:21 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id y10so13241976wma.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 09:00:21 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a7bc3d5000000b003b4a699ce8esm359817wmj.6.2022.10.19.09.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:00:18 -0700 (PDT)
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
X-Inumbo-ID: 221effb9-4fc7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVupMUX+AbKGeudOf3VM2f3d4o9emAy/RsXvFXsgs1k=;
        b=JPTArh3Fo4mWtWDttlA0ClC01c7R8sZVod1y+p1Vsv9eXhEmp7db4MDO3syoY38G8y
         6THKAaVIYgz0zUEhaoeCW5TIff2CcMwjO5dz4MuXHAOGz+xjc9ECk+MIuGrooHCDJ7k9
         icRRACR79bQCsajRphZgSqapgH7ZFXEQ++sgb6shptuPXECUSxuJnXTs1G2ZMVKQzT8c
         2dxBLtpkSRdMO7irWPyXajs8V+kmrUQKU9hh8lFqeRBWabbaFRECGxaorFxl95RgrNag
         74fEYSmWbmQwEnhmnA+Jwk/P3uNf36vaJIEj7d/qffkS2H0X7KgtxGWL91D1j6EvvipS
         J9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVupMUX+AbKGeudOf3VM2f3d4o9emAy/RsXvFXsgs1k=;
        b=F273JFbHaLKhJLvbOY3HPBZfTUDlkDF/D6YI9VuJ7B+ui6KvVDdq6jEDts0CiuMAUQ
         /SkpcDCXBmvD88+Vy4A+PjuteJzguHmiYw8JF+/dWZiuxj5vVKUSgpBAw52Oj5diiraF
         UZE/oRWNUd2TfTfAIJkDvT2lAeR9gQod97pR2H/CJGZYZVQyLEoPLSAZ4Sormkxkrv/T
         QjZO644Di+bciGah2x/wcdRIAxQiYTTLrb+8ruP8I5mU1yGqgQ+LX5uqeQfNpd3nN1kk
         e4duFCnb45+UOWrf+SYKoh8W9/ePp8cgWnNl81eOe4v9yX8c26qKLMyuVe2XdOeJRkDO
         6V8g==
X-Gm-Message-State: ACrzQf0wySDu/E7oWhWZe1jgbgSuRV9E/v7yklFfU6bySaQvT9HJMQgz
	8rj2VnL5MjYSpE3EVN92fT4=
X-Google-Smtp-Source: AMsMyM56wfRKb1W4RRWfr9a44/7FKXWWZbg3jEH/nJzz4jN0Z367Bev8MYCgZc5kmwy9tTq2PTMK2Q==
X-Received: by 2002:a05:600c:3148:b0:3c6:eefa:fa5 with SMTP id h8-20020a05600c314800b003c6eefa0fa5mr6640215wmo.88.1666195219222;
        Wed, 19 Oct 2022 09:00:19 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6ccbd834-b7c5-3209-008e-a2ede8427986@xen.org>
Date: Wed, 19 Oct 2022 17:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 04/12] hw/i386/xen/xen-hvm: move x86-specific fields
 out of XenIOState
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-5-vikram.garhwal@amd.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20221015050750.4185-5-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2022 06:07, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> In preparation to moving most of xen-hvm code to an arch-neutral location, move:
> - shared_vmport_page
> - log_for_dirtybit
> - dirty_bitmap
> - suspend
> - wakeup
> 
> out of XenIOState struct as these are only used on x86, especially the ones
> related to dirty logging.
> Updated XenIOState can be used for both aarch64 and x86.
> 
> Also, remove free_phys_offset as it was unused.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>


