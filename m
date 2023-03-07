Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E63F6AE64D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507581.781273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZa4M-00034A-1I; Tue, 07 Mar 2023 16:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507581.781273; Tue, 07 Mar 2023 16:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZa4L-00030m-Ue; Tue, 07 Mar 2023 16:21:41 +0000
Received: by outflank-mailman (input) for mailman id 507581;
 Tue, 07 Mar 2023 16:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZa4K-00030b-1Q
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:21:40 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 231d1b34-bd04-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 17:21:38 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id bx12so12684144wrb.11
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 08:21:38 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 z1-20020adff1c1000000b002c70c99db74sm12995127wro.86.2023.03.07.08.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:21:37 -0800 (PST)
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
X-Inumbo-ID: 231d1b34-bd04-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678206098;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KZYphWhdVAnvWbr1j7QS/cc1nY/OgAy/9gY36WtPWI=;
        b=duGi6ChPks1NvHE4h27ex6WPEMMvNMfP2+x1WIy3UlfnGH2+Ij/4ZlcNxSKIhDBKgA
         AdExmMYXJqNS+04U5BXXrD9W2a/oNousIf/in9oBon62M20O8c2aO4pcc33gXfSIfZcM
         ZsJMLvXFwkaOJqcJPYE0xpeVRDqaiVpFEmU11bf+f0Yu2gwlZyYDlKcfZ0ZUhzXhfdwL
         jI2PWs860DotTqcJz0yrRMxRkztlWDc0q4iyfPL0XJyVY4JKHxOb/P0aMgkfNx8x1AvS
         oHNQ5kLrxeZ/N+FMoSYvUWKGjg25o5/JdntYq3MqIcj3ok7/rE18x5ADMXdqNqhipiFK
         WT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206098;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KZYphWhdVAnvWbr1j7QS/cc1nY/OgAy/9gY36WtPWI=;
        b=jJ6T2SZWKR1vUK09zHrzkJGXdntSpLf7MWuOxV5RylutAwblMh4gjR9JAFNXNOdwzN
         csTTxtLUP3DKltuUIo2oLHkR1pMlSZxlAXHaBChbBXIfCn+7TO+q+iosbyEwPN+EA3jo
         n8BSY3en29Ip9xNUrj/p6Ckal8zSF3GMsqly8a13gpTaI/EbcuthOnVtoyUB+L6ZCHSW
         JY4S6+ZalJfDxcQp597W7OuWdxpOVpWXPltHWYQ104dJCJ+YyIrlxlK0sCIpI+S35gT4
         jWjUBCQrlOtGLqlnXFmPeBdGCykA/e6N3XgKzzLWz8nMxgfIcjzR0sF0UmDn+7Q2K9A2
         Q53w==
X-Gm-Message-State: AO0yUKVr8VM29f4H78w4IlIsiN0kMnBLGG4iAUBg/BNczQ7iYkk7jq9N
	MZFXONsLab5GzqRwdalWrp8=
X-Google-Smtp-Source: AK7set8Pip1A75xuZnNQJFUj1hyUMwO0SBfJbPEaTxxl9w7OUPd+9KViTpH6IT8JdSgOGMaYHrsISw==
X-Received: by 2002:a5d:63c9:0:b0:2c3:d707:7339 with SMTP id c9-20020a5d63c9000000b002c3d7077339mr12850070wrw.6.1678206098214;
        Tue, 07 Mar 2023 08:21:38 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <7c77dee8-a7b6-b41a-bf0a-ddec69ad0d48@xen.org>
Date: Tue, 7 Mar 2023 16:21:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 22/25] hw/xen: Add emulated implementation of
 XenStore operations
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-23-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-23-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Now that we have an internal implementation of XenStore, we can populate
> the xenstore_backend_ops to allow PV backends to talk to it.
> 
> Watches can't be processed with immediate callbacks because that would
> call back into XenBus code recursively. Defer them to a QEMUBH to be run
> as appropriate from the main loop. We use a QEMUBH per XS handle, and it
> walks all the watches (there shouldn't be many per handle) to fire any
> which have pending events. We *could* have done it differently but this
> allows us to use the same struct watch_event as we have for the guest
> side, and keeps things relatively simple.

Yes, it's more consistent with watch events on real Xen this way.

> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 273 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 269 insertions(+), 4 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


