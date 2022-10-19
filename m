Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FDF604A37
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 17:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425862.673948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olAXo-0001gd-PZ; Wed, 19 Oct 2022 14:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425862.673948; Wed, 19 Oct 2022 14:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olAXo-0001db-Lo; Wed, 19 Oct 2022 14:59:44 +0000
Received: by outflank-mailman (input) for mailman id 425862;
 Wed, 19 Oct 2022 14:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6HZ=2U=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1olAXm-0001dR-Vq
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 14:59:43 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9309e3e-4fbe-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 16:59:42 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so188112wma.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 07:59:42 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a1c440b000000b003c6f8d30e40sm129706wma.31.2022.10.19.07.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 07:59:41 -0700 (PDT)
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
X-Inumbo-ID: a9309e3e-4fbe-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XoEeh4KZ31p8n/r4n57cbRW8eoKncmT5vVUmUJK3abU=;
        b=L2sw2TPWXnqend4GkIKrF70tZItmzrLiaR/2OxEAg0eEOWbsDkU+J71PF1nwWAXkKy
         TMYU66e/b8bVfDOFP/mQffjSfG647G2OvnnQp8MZFK1wHmTaknqYRn627H0qmxQINxQz
         /eeeh+pR+6u7+lgO5SVaGrGvg5tJ71Yt2SoNn2wgl6DNnzIxxW6hUzHXBVd589K6lvOT
         QgkoSDDcIsHBvaUo2FaSKsVYBjyk9p3Dav+pmplR12Luct8YHut+kXxR3TEa/pa5E1dA
         XAKxgoGxUwwEaFzyxoeQLyu4HVrLSelYPf603CRwYtM3V+HTtfGDorFabAjdWd0jP3Cb
         lFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XoEeh4KZ31p8n/r4n57cbRW8eoKncmT5vVUmUJK3abU=;
        b=7fPhfXhoENA5XgRexwkkdFZs6vaPNLfOB3iF9iQ+uOWd+LrVt/EpcIe28Nr1FasXKN
         3y9GN4N1cV+wtCVE1bNtVPz0q5rPTSxMrmusxYS1P29KXP3sj/PY+ybIddVqJfrExFCC
         orJjWc73xazW1SPvealxZQqWc1mxFUuUn9Hh8MJh0gy4z3ovNycvs60B/SVL7cRTEX0z
         rmdUXnCn5o7fkBazzL0HXNHynLg+5//KgSfXHO72tHpDM+9IxFTx1Aic46/9/6AcsTfz
         x69/SyaNtaip9vjnMSDLEck38rWPXImj3UnC8C4zg+Vs037Sc4Hx7/tJJ9eZEGBksLhJ
         jz8Q==
X-Gm-Message-State: ACrzQf1Fd6Ud8o/9/3+tYGvNSQbGQ8JYP/0RSphcj8AqX6Yn3OcRvkx6
	GkIo4mjxRdmpdAT0Kohc0oE=
X-Google-Smtp-Source: AMsMyM5akBAxdTLdyO602pWu43D5XtULy0iuDq8UgMPWYLOzH8BUZI8IchS6XWDc7Z4GwjkwpFHKeg==
X-Received: by 2002:a05:600c:3d08:b0:3c6:fb56:ac9f with SMTP id bh8-20020a05600c3d0800b003c6fb56ac9fmr8946745wmb.193.1666191581617;
        Wed, 19 Oct 2022 07:59:41 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <50fc4560-1658-f6c7-6617-9ae37b0cffab@xen.org>
Date: Wed, 19 Oct 2022 15:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 03/12] hw/i386/xen: rearrange xen_hvm_init_pc
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-4-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-4-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2022 06:07, Vikram Garhwal wrote:
> In preparation to moving most of xen-hvm code to an arch-neutral location,
> move non IOREQ references to:
> - xen_get_vmport_regs_pfn
> - xen_suspend_notifier
> - xen_wakeup_notifier
> - xen_ram_init
> 
> towards the end of the xen_hvm_init_pc() function.
> 
> This is done to keep the common ioreq functions in one place which will be
> moved to new function in next patch in order to make it common to both x86 and
> aarch64 machines.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>


