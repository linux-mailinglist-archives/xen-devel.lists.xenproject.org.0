Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B217D4FC7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621887.968781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGYj-00044J-VP; Tue, 24 Oct 2023 12:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621887.968781; Tue, 24 Oct 2023 12:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGYj-000431-Ql; Tue, 24 Oct 2023 12:30:57 +0000
Received: by outflank-mailman (input) for mailman id 621887;
 Tue, 24 Oct 2023 12:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvGYi-00042t-Sl
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:30:56 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d0f41ad-7269-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 14:30:54 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso63252841fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 05:30:54 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a05600c189600b004083a105f27sm16404394wmp.26.2023.10.24.05.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 05:30:53 -0700 (PDT)
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
X-Inumbo-ID: 2d0f41ad-7269-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698150654; x=1698755454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkkKPtB+0MYb68gtsi8LcLr9VZV4vaP8LHEM7IjFw7M=;
        b=Fo6/WR0xfsTsid19hmlGsptXEWny9HvC4xeoiLmVqaJ9f36KB03ZLWlbEcH2jkYYrk
         fAryS0dAtmMVe1devqgWj+DXexAOwZCXd94WolkxXghgF/7oi8x9surBJx1DqtHR6/v1
         NnEAucyHPvptSc2CLmIBvsGZb/QL18zwkp2HUZ0zDZGsSHx+OL8pIVMFf+cZOvHBVyx4
         rwWlaWuFdS2a6qYkkuiJgIiZPGTv6wC4oHaB6X1PjHn2qRXfJys/MPY1DJmQsUmhNK5B
         aLPpLJLhUDCd5I/YuhcS7s6dcUdCSszQGhnOsjzUIFj8nX5sPnp1v4+19Flno/V9tFsL
         6N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698150654; x=1698755454;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkkKPtB+0MYb68gtsi8LcLr9VZV4vaP8LHEM7IjFw7M=;
        b=e0aY1+L85Igv5mU6rD36/IH3ANrdiWwZLGnGLXpVSIz/cWAnabDQjk9W49i+rezc4T
         ydM0ACsDeKKLd57t1RjTaf1EZA6f9IEIhQEXqkGBkdyyj2A8CtNJxU7Hn89cRQ2HfAer
         IAVld+oLSfvHcLvyHAUnrSUgNXcHo5XmhL/T7mk6vVVHrI0/Uy7QcL4vjFKBknwWZCLD
         ByHavZuH/aqAQNrin6m6xkt8M28lyC6Mko9tsPIWBIyjqoRF7h/1kjWASnhvvgOk5/yy
         Kv24XvM72kCxNGpvgGAN2yikZujYAh9p1JAwrPNNqBbyRYWyj5ixZSh8e/zRqoz5F59X
         AzYA==
X-Gm-Message-State: AOJu0YzR4N3J1Ujen/5IVJY4CdbFS1P6hf1JpDAWaoFid6C3Ieh/dTfK
	QN29Btp74bP3UdrbzaRqOTM=
X-Google-Smtp-Source: AGHT+IE/mzlKG6p6MNuMkl5KdeR+gdKt/64A9xubv6BdiuV2Bc68YaEih+Wh7ICweIO/TGve36ruQA==
X-Received: by 2002:a2e:a7cc:0:b0:2c5:fb9:49b6 with SMTP id x12-20020a2ea7cc000000b002c50fb949b6mr11630710ljp.10.1698150654333;
        Tue, 24 Oct 2023 05:30:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d6db2c5d-da65-4f93-a340-2ca4772e86db@xen.org>
Date: Tue, 24 Oct 2023 13:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 03/12] include: update Xen public headers to Xen 4.17.2
 release
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-4-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231016151909.22133-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:19, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> ... in order to advertise the XEN_HVM_CPUID_UPCALL_VECTOR feature,
> which will come in a subsequent commit.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c                    |  2 +-
>   include/hw/xen/interface/arch-arm.h           | 37 +++++++-------
>   include/hw/xen/interface/arch-x86/cpuid.h     | 31 +++++-------
>   .../hw/xen/interface/arch-x86/xen-x86_32.h    | 19 +------
>   .../hw/xen/interface/arch-x86/xen-x86_64.h    | 19 +------
>   include/hw/xen/interface/arch-x86/xen.h       | 26 ++--------
>   include/hw/xen/interface/event_channel.h      | 19 +------
>   include/hw/xen/interface/features.h           | 19 +------
>   include/hw/xen/interface/grant_table.h        | 19 +------
>   include/hw/xen/interface/hvm/hvm_op.h         | 19 +------
>   include/hw/xen/interface/hvm/params.h         | 19 +------
>   include/hw/xen/interface/io/blkif.h           | 27 ++++------
>   include/hw/xen/interface/io/console.h         | 19 +------
>   include/hw/xen/interface/io/fbif.h            | 19 +------
>   include/hw/xen/interface/io/kbdif.h           | 19 +------
>   include/hw/xen/interface/io/netif.h           | 25 +++-------
>   include/hw/xen/interface/io/protocols.h       | 19 +------
>   include/hw/xen/interface/io/ring.h            | 49 ++++++++++---------
>   include/hw/xen/interface/io/usbif.h           | 19 +------
>   include/hw/xen/interface/io/xenbus.h          | 19 +------
>   include/hw/xen/interface/io/xs_wire.h         | 36 ++++++--------
>   include/hw/xen/interface/memory.h             | 30 +++++-------
>   include/hw/xen/interface/physdev.h            | 23 ++-------
>   include/hw/xen/interface/sched.h              | 19 +------
>   include/hw/xen/interface/trace.h              | 19 +------
>   include/hw/xen/interface/vcpu.h               | 19 +------
>   include/hw/xen/interface/version.h            | 19 +------
>   include/hw/xen/interface/xen-compat.h         | 19 +------
>   include/hw/xen/interface/xen.h                | 19 +------
>   29 files changed, 124 insertions(+), 523 deletions(-)
> 

Acked-by: Paul Durrant <paul@xen.org>


