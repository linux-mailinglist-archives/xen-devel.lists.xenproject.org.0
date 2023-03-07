Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA6B6AE0DC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:40:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507397.780832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXYO-0002Ry-H8; Tue, 07 Mar 2023 13:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507397.780832; Tue, 07 Mar 2023 13:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXYO-0002OX-Dz; Tue, 07 Mar 2023 13:40:32 +0000
Received: by outflank-mailman (input) for mailman id 507397;
 Tue, 07 Mar 2023 13:40:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZXYM-0002ON-OJ
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 13:40:30 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f6f270b-bced-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 14:40:28 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so921562wms.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 05:40:28 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b003e20970175dsm18819769wms.32.2023.03.07.05.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 05:40:27 -0800 (PST)
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
X-Inumbo-ID: 9f6f270b-bced-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678196428;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNICl/NyVJukFnVn6RmR6QpZM8fyn1UqtyTmNPAEbyo=;
        b=hdn8Y7R39GmvpdRZY10YxOr6oayLFTMnukmy84ND49jcL2labjwnK7GPvYowZahppt
         y/N6YpIj7c1xwBa4OKcVa8Bk/eMt2WAc8UbkUZLu4XnOfVUGohWuaj8DHie9dZX/cCSU
         mHKBprsJLkxyeOH4Zzcl+CK3oM4MwYK8dLiZAX3uGLaOdb3Z98MrYClgMRilZAuGv5Ro
         WEhFkek1SXfG9txDHVD9sj6FDq7uT5kDyN8gxrb91hweDi6BDuTSMDwUrsxTzaoH3HWJ
         gYRw3RzguTUgVyKhVgRJh9nXMAuv3w8tdRp491NS6v4gmZ1WgqPnTW56DhGy0iQy2igS
         xQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196428;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNICl/NyVJukFnVn6RmR6QpZM8fyn1UqtyTmNPAEbyo=;
        b=z2vY7MiOy975IIe5ruGma+YsKs4gJlyNhw4pBHFnjjJkaG6qQbUts6ahiVV55fMn5/
         8lhG+k/Le0vMeieZSptw6aw/clUIbpJjkhcgwXPYV8Hua99yu/XufDdJO9KJomVrurK/
         ABZIaBvAjJfzN6bp7hJw8uduTSoIlhsktsUy29431MN794puLm3qeR+3G5Pisj79az+V
         FSVZU9TvEWX3XE9/0GwQGgaYC1Nen3yzYNOfFNrNV8t0JQcxskemiqZqTQ3qGQVwF8co
         OtfuvDJZISZjMQna8o/eU1+zPXDNZo/XqypTMSWaBqjjkuUeXgwBCT84Vf97uxsbHs8b
         7u1A==
X-Gm-Message-State: AO0yUKV0lzsFQEzbkYcVzg3MDml55Wu+ulOklvpQGvhh5STnxnkvzjmU
	XliBt+3LqSXEaYCStSZwA9k=
X-Google-Smtp-Source: AK7set9yGcoS7orl6s6X+QorQrZ+Wi6unxTHJGCLiXxioA3KnRgKc/BJ8RBynR3npr1YSyHmW33uJA==
X-Received: by 2002:a1c:750a:0:b0:3ea:e834:d0d1 with SMTP id o10-20020a1c750a000000b003eae834d0d1mr12496383wmc.36.1678196428403;
        Tue, 07 Mar 2023 05:40:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <69d9c353-8bb3-b184-4cbe-1bcacf71b49b@xen.org>
Date: Tue, 7 Mar 2023 13:40:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 06/25] hw/xen: Implement XenStore permissions
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-7-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Store perms as a GList of strings, check permissions.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c  |   2 +-
>   hw/i386/kvm/xenstore_impl.c | 259 +++++++++++++++++++++++++++++++++---
>   hw/i386/kvm/xenstore_impl.h |   8 +-
>   tests/unit/test-xs-node.c   |  27 +++-
>   4 files changed, 275 insertions(+), 21 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


