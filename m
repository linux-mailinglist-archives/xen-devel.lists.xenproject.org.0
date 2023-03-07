Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4FD6AE51E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:43:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507532.781151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZTF-0008Cp-EB; Tue, 07 Mar 2023 15:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507532.781151; Tue, 07 Mar 2023 15:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZTF-00089v-Av; Tue, 07 Mar 2023 15:43:21 +0000
Received: by outflank-mailman (input) for mailman id 507532;
 Tue, 07 Mar 2023 15:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZZTE-00089l-36
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:43:20 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c891b633-bcfe-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 16:43:19 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id r18so12588519wrx.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 07:43:19 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5945000000b002c3f9404c45sm12808536wri.7.2023.03.07.07.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:43:18 -0800 (PST)
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
X-Inumbo-ID: c891b633-bcfe-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678203799;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2kGRmcPQfXmhNBAcM1NELXheCNXcNQIOEudfaQKrvbk=;
        b=CKRCeHP9CceVcZiXAWiuW5iGE9iYz2wAJCrxawLyk3t+WwyAE2uZMWmicOYRLqwoE/
         7VXjn/8bqhfr7VcLV0njk9491mfDjbSEE3a8NSgycDoq1ZzFSyqKz3IKT2fsWMr62utz
         dOrYfcDxy6W2Untx3j7jdsUuhGq1nnhEkMWb1G+VhNnb4rsXCK0NxY4fVnj2D552CjV+
         JZyzEW1VY/bSViSIZbypP5HHdwEUdmXGNlNygua1QfwkRAK2+/Pg1t18+n/1LWBEdKfb
         JtWd+r2yqB2FHbZczUhWZJTkfXPTCcmrrUq6TIN26N5DfEANGRA2XBDb1KRfc7sM7QDv
         zR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203799;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kGRmcPQfXmhNBAcM1NELXheCNXcNQIOEudfaQKrvbk=;
        b=DNFBuiwChSPzArEv3au9xyBkjKYXp0bRjGLG/cHrZqumUveeO6z+bdkDouVj30ltBK
         O/zwKWdLaXqbztFPGDzWle9p0Cecl9iMytyVqy6J1G5hzGAP2Hwhr7zlZYEiLP7Rl9VM
         KlAMVvFVgmH9Y9UgaGWDzf5SDmjivt6+W8uDzyCFrSLWW7bY/I4RdV08LXzGyOLFsKUa
         pWm0hpgaM2GLVS1e2k8o0/gBK6LX/J8h5IowleCPPeITNuxLB4lu1yseKb8CAGdE/siz
         R6mXiaLxeGACUIKErfS3/AsJdBeylu/Zj7e6MYWYrjyR79IShnLYWEkKe++vD1c5x49X
         aN1w==
X-Gm-Message-State: AO0yUKV/LWXeS/40FzI35gUl71T10KJvPPJys+0w943ZJ/QVGqdl5pp/
	2UjRxSj+8r1THGykSSzmnaM=
X-Google-Smtp-Source: AK7set+VqiNW2e9+7lxKKxmINTlQmiZWcfel3GBq1alupg3FTk/mwEkf1apbIO7Prt5VWWYGRb+EtQ==
X-Received: by 2002:a5d:5917:0:b0:2c7:69b:317f with SMTP id v23-20020a5d5917000000b002c7069b317fmr9412876wrd.60.1678203798778;
        Tue, 07 Mar 2023 07:43:18 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <66f5a996-7783-ec98-51f4-829a1ab82890@xen.org>
Date: Tue, 7 Mar 2023 15:43:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 18/25] hw/xen: Avoid crash when backend watch fires
 too early
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-19-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-19-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The xen-block code ends up calling aio_poll() through blkconf_geometry(),
> which means we see watch events during the indirect call to
> xendev_class->realize() in xen_device_realize(). Unfortunately this call
> is made before populating the initial frontend and backend device nodes
> in xenstore and hence xen_block_frontend_changed() (which is called from
> a watch event) fails to read the frontend's 'state' node, and hence
> believes the device is being torn down. This in-turn sets the backend
> state to XenbusStateClosed and causes the device to be deleted before it
> is fully set up, leading to the crash.
> By simply moving the call to xendev_class->realize() after the initial
> xenstore nodes are populated, this sorry state of affairs is avoided.
> 
> Reported-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-bus.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


