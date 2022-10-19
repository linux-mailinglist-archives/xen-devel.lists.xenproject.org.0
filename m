Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8304D604C7C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 17:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425902.674020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBRC-0002kH-EJ; Wed, 19 Oct 2022 15:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425902.674020; Wed, 19 Oct 2022 15:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBRC-0002hl-B3; Wed, 19 Oct 2022 15:56:58 +0000
Received: by outflank-mailman (input) for mailman id 425902;
 Wed, 19 Oct 2022 15:56:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6HZ=2U=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1olBRB-0002hd-46
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 15:56:57 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a74e0162-4fc6-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 17:56:55 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id iv17so13223019wmb.4
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 08:56:55 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adff10c000000b00225239d9265sm14250557wro.74.2022.10.19.08.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 08:56:53 -0700 (PDT)
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
X-Inumbo-ID: a74e0162-4fc6-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVupMUX+AbKGeudOf3VM2f3d4o9emAy/RsXvFXsgs1k=;
        b=Hoz1h64VhbNtpfHkg2GnQ43QHYEysX6x8fWmjZbb3LYmUCk3yEE2xhj57LzJqjNNEm
         l8X3Q2z2FN8ZK7xzhI4P/lZN8isM5sv++uF0MDnOx9+3GYx8mOd0X7Ruiug7ey05Zu9A
         0IQBNwMILplU/EC+FQw6L9mb7kh38zH/oj9dj4gVqP2l7i7u/N9o4I4wcJ8p1sHMw/aA
         jm670VNGNkZEo9Ay3FFC5XIb5wv+jPAnWxc82or4Yct/C7xiHxGLurgcuSmOCnqeY2LK
         sLfSQ/iYLW5Bpp6jjiDPyx/u6AyEm7w/3J4+x5Z4Kh8qRiQQxeC0sxYUTB4LAL/0yoxA
         mGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVupMUX+AbKGeudOf3VM2f3d4o9emAy/RsXvFXsgs1k=;
        b=DiY6JdpcRIP8FC+dKUfyJS1RICbQigQaZNjfvGkUpmnyzfSXfY9W26LoYCb7bDSsWt
         7swUclvoT6nXFAEWEab/0nVP2arkuNCLt4/N0TdAnwd3vTT3Ul4FtjHiXY6CxDe47ru3
         GiJ60UoDtdpZOJAAjFihE+xfoi0dzYnn1ir/X5K2ntW88D3b+xwUXzRS7C2DmWrDcfmk
         ESKewXLqQf21mmk9nLVRev++8sl21UYCalfm41Y2n3ZbnD4rJV23eiA2iqDnspxpSEqD
         xrawPXVBPD4oaHLAEmKgSuyVDy4dqnvOJthJzRIpzrKcoldYxMvSMPnFBOrRw6mrlfRz
         6Zeg==
X-Gm-Message-State: ACrzQf2e3DRuM+6pyfzm1bdJCE6pInAL2V6MJgTbWTl+K06ugoOcsPlv
	t2sJfj7f3EOm+eZSNEScPS8=
X-Google-Smtp-Source: AMsMyM7RcuUsQvVHd7FHqJ0owLc1kucQ4TcSIdeJKxzL9l0FF0hwuPxWV4qgGZiNjL+DS4GtbOU2DA==
X-Received: by 2002:a05:600c:3d8a:b0:3c6:f241:cb36 with SMTP id bi10-20020a05600c3d8a00b003c6f241cb36mr6231312wmb.115.1666195014489;
        Wed, 19 Oct 2022 08:56:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <1fe17e03-dd7b-b705-4730-7b8556af014b@xen.org>
Date: Wed, 19 Oct 2022 16:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 04/12] hw/i386/xen/xen-hvm: move x86-specific fields
 out of XenIOState
Content-Language: en-US
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



