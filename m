Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB336AE331
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507470.781011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYcI-0002O7-Un; Tue, 07 Mar 2023 14:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507470.781011; Tue, 07 Mar 2023 14:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYcI-0002MO-Rq; Tue, 07 Mar 2023 14:48:38 +0000
Received: by outflank-mailman (input) for mailman id 507470;
 Tue, 07 Mar 2023 14:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZYcH-0002Lz-RQ
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:48:37 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2395120c-bcf7-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 15:48:36 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id j2so12361051wrh.9
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:48:36 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b002c703d59fa7sm12750392wrx.12.2023.03.07.06.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:48:35 -0800 (PST)
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
X-Inumbo-ID: 2395120c-bcf7-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678200515;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJV8X1ahMrwunc4I9nebCaoiX6hr9jR3+0dd1Yu8Uhk=;
        b=CrhWd3j/9hc/yzuu/AXDjfdbsI6i9Gul7zANq1FlfIjwYGAFkAVP9Fg3BP5uwQslNp
         hppBNBYJ402bnr6+mDBcrGND/dAXnEvibsFKH806PuoKguTQx2DilO6gy8jNgVGsQ4UR
         8tDS5uJxlUejZOcefYZhiN+chK2KjW9QppOpaHZXQ8Cbi5TBWeb5i0GjoPCvYxhWCPc1
         IZCjO6v7FRg07CcFR0J+Fuf7IKncGDNRKwzOb+9PGDNJRPa1Hk9zz5f0gChXcdFzIl1L
         IAvPZpj9WWtXRzjlCcHPqNlXIGB/EarWHgBhXmbBxDR9YioSmSVr4Rsmx4WmemO4d1Bv
         xzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678200515;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJV8X1ahMrwunc4I9nebCaoiX6hr9jR3+0dd1Yu8Uhk=;
        b=F/fqhVXYledjArUxS1urhY00gHsQz9+9kBRgJxFNqekimdPTwUO9g1GzD/lGxZ0FAd
         Ildc0mQs5saGhqHOHGd1OXPB08bGQDbydNHvxCY30KcmQcJXONijDVz+CFEm2U4fnBO7
         lxnxAYT7SMsj4rdeZmx4A/QsCQpPi9tIH6xjAN69dPsjKYpZc44udldU999UwWDiZdiO
         Swi8l8hB77uxGZfF3Rjufl7PKRnXjTuuWtnNJp+SoUuJ6qME+A14O1zEmy6EQmlnIdxU
         pbjWh2LmtFqIob1Z/moInvvv1SHMTriANDzkWYyyZotLmcZ835I91PElRc5oKYiWWHOL
         xeqA==
X-Gm-Message-State: AO0yUKWAzYB4LFNwijtClrbW6eIbPM24Y9H+zic6YdInla7Mec1hj6r9
	O4N8z8JWMByPeNM0Ms5e+ig=
X-Google-Smtp-Source: AK7set+QLpMeKjKDmL7zyyrzOxGL27KoFw6yVMrfR59U9/0wom9sKE5L/9llGVFsGi4zqDHS0OChcw==
X-Received: by 2002:adf:dc90:0:b0:2c5:4c1f:3c9 with SMTP id r16-20020adfdc90000000b002c54c1f03c9mr8856131wrj.49.1678200515429;
        Tue, 07 Mar 2023 06:48:35 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9aba8f4d-0572-b6b4-44c8-a4f5f88e1477@xen.org>
Date: Tue, 7 Mar 2023 14:48:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 15/25] hw/xen: Use XEN_PAGE_SIZE in PV backend
 drivers
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-16-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-16-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> XC_PAGE_SIZE comes from the actual Xen libraries, while XEN_PAGE_SIZE is
> provided by QEMU itself in xen_backend_ops.h. For backends which may be
> built for emulation mode, use the latter.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/block/dataplane/xen-block.c |  8 ++++----
>   hw/display/xenfb.c             | 12 ++++++------
>   hw/net/xen_nic.c               | 12 ++++++------
>   hw/usb/xen-usb.c               |  8 ++++----
>   4 files changed, 20 insertions(+), 20 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


