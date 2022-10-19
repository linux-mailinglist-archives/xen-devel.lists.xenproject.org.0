Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472E2604D0C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 18:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425929.674065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBo1-0008N8-6b; Wed, 19 Oct 2022 16:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425929.674065; Wed, 19 Oct 2022 16:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBo1-0008Jf-3f; Wed, 19 Oct 2022 16:20:33 +0000
Received: by outflank-mailman (input) for mailman id 425929;
 Wed, 19 Oct 2022 16:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6HZ=2U=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1olBnz-0008JZ-Mj
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 16:20:31 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f31ad909-4fc9-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 18:20:30 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id v11so3254095wmd.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 09:20:30 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adfe889000000b00223b8168b15sm14188174wrm.66.2022.10.19.09.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:20:29 -0700 (PDT)
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
X-Inumbo-ID: f31ad909-4fc9-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwmw9PMnCNDtKtpfuQSnL7/aFDgNl4A9sE5A7TitH6M=;
        b=cfwe++AiGE7jqAH8ujUv1LRlfnr91OEW85b2hJqJxKubegALAtGBYQHoXwYNqkvG5U
         dr9osH3qXP/K19r41hRnNwYkMI5UOHBaQlZ6VClAq5+rG0EMPSz5tHaw/4ixEBDpsbvR
         sg7W9/cMx462lV746LZUum7LAMZXp/6cbF0h3bRILiwzF5+nub9BVR9GwftOVG1V/9MW
         0xroRkr1gc7+V/BCHyIxFJUm7If8jmkjI4DhaT5DexWIG1HpMQpfimG40ejemxXJtbIP
         Dnz2btsel0Ip3P//ZJCMfyJZZ6QtCgyZnmLf/Lpmby5ePOBF+Vb9GJ/bMgFe45HSCQt9
         Z8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwmw9PMnCNDtKtpfuQSnL7/aFDgNl4A9sE5A7TitH6M=;
        b=jZlhtZnkVO7U5CJ5koj8TNhB+fsJwCDNpheEKaUH6/PAhxFAGjYBOMGE7g5PD5LGlM
         SQcu7Sp1kF5uhnreBH0Eb+nEFmIGTYpC2Cu+84FwZtLimUa3EMLStxR5QcoxZKkIj2/c
         zTg7564n+1F9XpqvG6pND24oq7KVkAUcFLu97ZHCgNw/eqsgBXrZSs9O0egf4+G5VTU2
         q0v8nbbajKvYBzpXaLlK78RzGMjgieoLEI32YjniLYb9qt7arVjvZdm2qPXT3LUgPUl0
         wDkhc78xX+ROhzhl+yPyXIXCX2Chh4sTknfS3opl2IC8yN/oAQqHjQjETc4+lJxRkIos
         oLIg==
X-Gm-Message-State: ACrzQf143nVK9dSLZ9qyd9yONLLHItcQlyqgpiFumAc+9RylK588afn/
	23c1NVXXNtsqmw2VbyA8twrP5HeQPQMkSw==
X-Google-Smtp-Source: AMsMyM56y348l/ISeOIYUF1NaaK8V1VIBgfBhdJf3+3om/ZwuaQWqDea3kef/AjLmL6gQvD8BjrdDw==
X-Received: by 2002:a05:600c:3c84:b0:3b4:eff4:ab69 with SMTP id bg4-20020a05600c3c8400b003b4eff4ab69mr27107411wmb.104.1666196430326;
        Wed, 19 Oct 2022 09:20:30 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <03aa5254-18f3-d8f0-edc9-7e8cfadaf434@xen.org>
Date: Wed, 19 Oct 2022 17:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-10-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2022 06:07, Vikram Garhwal wrote:
> xenstore_record_dm_state() will also be used in aarch64 xenpv machine.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>


