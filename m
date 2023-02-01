Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2240C686160
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 09:14:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488166.756126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8G2-0007rz-BN; Wed, 01 Feb 2023 08:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488166.756126; Wed, 01 Feb 2023 08:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8G2-0007q5-8U; Wed, 01 Feb 2023 08:14:18 +0000
Received: by outflank-mailman (input) for mailman id 488166;
 Wed, 01 Feb 2023 08:14:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYYs=55=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pN8G1-0007py-Gw
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 08:14:17 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b6fc810-a208-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 09:14:16 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso708680wms.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 00:14:16 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c17d500b003dc5b59ed7asm908852wmo.11.2023.02.01.00.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:14:15 -0800 (PST)
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
X-Inumbo-ID: 6b6fc810-a208-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/Vw/HJ9804TPjURiNeMztP8GKmGdQ0ZmBWYFwpo6sU=;
        b=ZlfifIyYcmm5osq4qaA8KWeuTssdtaKbzI/RxY9BNRRxJdulfcKxI6RCF67Sg0HEjw
         33uA6ueES666tBkvQCRFXxSvGDmvKPpm1fofdsA9pYbDV06C1SHaIWzRvFMYn3xxiDSM
         2u10WnEyeMXV3flwSzSHXkW7fSmEtnqJVAZqAZuPnbvviJdQ4txp6BhDTvSN61betrMk
         mlh/AsHTHef0/Z28IwContLr5JlV5ActEY7xbeQnVaEhOkQL9MIWfvL4kZwMfbvzSCkf
         M+MEaxrJ5eDEeZHZnp/PLfC2Gc9dsHb2pnOUk+P9G++yvtD0Z7tfP5+HJPpC7v0UcH+C
         jdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/Vw/HJ9804TPjURiNeMztP8GKmGdQ0ZmBWYFwpo6sU=;
        b=HeikW5a/3KPip/MrVOV5OJH8d+ej05am1GSj3YJ3FRejlwier6nu+N9bmpnjEe56ur
         wii5tQT2Z3MD8OYvcMNnIJUzSDzU1zvYUQZo7u+iETf9hWzfSaRUy7qhcveZUNrYVoBR
         jxyG75vVdKgngcWdh8PWUmtIyAUS9NhtSEciAV0Gj0+75QIV5Z2H8nvmCB8H9CpznimA
         ZaIGy/04Ed7J5Y/r1/TeNgfNRX7uvqSX7woqKet+PkRy00NsaXMh5X06v9OTL4sNLL54
         t6TpJXReXufTBKzUrjeFEEFChBoZS0p/jYbEwMSbaZH4h+ZVdV/MDaSaaBf4LUdy/0KK
         W2/w==
X-Gm-Message-State: AO0yUKUPbgwkvicZj0qrCI+KqT9FJ38mQIk2SFEaUY2W27rDDfrNTRhz
	oIlbbJxvs7dw/4yS/TJ1Imw=
X-Google-Smtp-Source: AK7set8FYyYat2mEAdrY3TWWOr2r1XU7G6WQmgtbej6WHPHtT9bkmmiNACZfL1ZRdyn4QWCiJ9vWCg==
X-Received: by 2002:a05:600c:4e09:b0:3dc:4633:9844 with SMTP id b9-20020a05600c4e0900b003dc46339844mr1219238wmq.17.1675239256096;
        Wed, 01 Feb 2023 00:14:16 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <38dbb7bf-91aa-8254-728e-53001a4f0439@xen.org>
Date: Wed, 1 Feb 2023 08:14:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [QEMU][PATCH v5 06/10] hw/xen/xen-hvm-common: skip ioreq creation
 on ioreq registration failure
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-7-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-7-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/2023 22:51, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails continue
> to the PV backends initialization.
> 
> Also, moved the IOREQ registration and mapping subroutine to new function
> xen_do_ioreq_register().
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   hw/xen/xen-hvm-common.c | 53 ++++++++++++++++++++++++++++-------------
>   1 file changed, 36 insertions(+), 17 deletions(-)

Reviewed-by: Paul Durrant <paul@xen.org>


