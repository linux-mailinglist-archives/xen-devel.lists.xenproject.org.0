Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF19604CE8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 18:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425920.674054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBkN-0006uG-H5; Wed, 19 Oct 2022 16:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425920.674054; Wed, 19 Oct 2022 16:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olBkN-0006qn-Ck; Wed, 19 Oct 2022 16:16:47 +0000
Received: by outflank-mailman (input) for mailman id 425920;
 Wed, 19 Oct 2022 16:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6HZ=2U=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1olBkM-0006qh-48
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 16:16:46 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ca64eac-4fc9-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 18:16:45 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id a10so29885149wrm.12
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 09:16:45 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c315100b003b4a68645e9sm323180wmo.34.2022.10.19.09.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:16:43 -0700 (PDT)
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
X-Inumbo-ID: 6ca64eac-4fc9-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WIgq7KUkYAZufLZT/vJOKCqP4ihn+JSpnSvPKstMd2Y=;
        b=AOOTzFFJZ+yUIMjgdeHf1D7JPZg8t95Tpk6QQ128iQoHJYFSXGZ4qacujs2ESTOisC
         A5QXDcD+360J+dV93ampTlklhgXeKHieLNMAz1Dg0irNgJENEsyPoVaSKP9J3xICpF94
         1uWhLHMUt9oHnaJpDkFVEZefu7sGXaKLNDAyUZFO1rAx9u+jP34xnsalh59QQ9nxyltk
         R69AbDDKwfaqwbKuEzlgY2QLdERmGfwQg4DtZZr1oeAR06ierQY1VXpit3aIvY1Mbj+R
         B6b8Es/lh5tRjquy6f1+5vLnfQGlYD2dU2UNCcb1343tS+O8RXj6ZvVpumfnrbL7eeXE
         tM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIgq7KUkYAZufLZT/vJOKCqP4ihn+JSpnSvPKstMd2Y=;
        b=t/9sg1VJbsC7QEkqXQc0UPrk1Y6NbTrSd3fFalCrcsXIMcasCCtvT8N+j0ugJioLWb
         IhNIeZEtd7JlNFZa72NIzUIK9C9LjRyNdQ3o7DwtlYPeFkyncAdOKo4qHbvRKVhXry4l
         x59fA3BrAtlGw+g+rbXPBBnvxsCErfWCdRJQrqb96AEDxSqfV3Lg2Vinr46wwxs6Dc0h
         nT42ap7nvQ5mftqdICgz06qXokTmfJ3YxHh0rf69zvSCdS+JALOjky48IHxI7kLKKbWm
         ArFErzK89QtHjdQx90gTkxvpajolZOX/UrhZNJmtknoV3zeAEkaebWhtsW2m1B9BG3FA
         aETA==
X-Gm-Message-State: ACrzQf3U0ymMi1nadkNdIURGOPmuEVgg4m7hTbaaFHP2CIKMUYudxiUb
	GKdDEbP54H9eVplX+mSY1bM=
X-Google-Smtp-Source: AMsMyM70BAGn+ITDttNygqHII8IscaYNZml+iS8aG88q+Uj1/vKaPUkqZHfITZl9ve2GqS+zJReXkg==
X-Received: by 2002:a05:6000:78a:b0:22e:4c41:9e36 with SMTP id bu10-20020a056000078a00b0022e4c419e36mr5641977wrb.160.1666196204511;
        Wed, 19 Oct 2022 09:16:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <7b8e645c-90c7-a4ff-4405-51df6df2e508@xen.org>
Date: Wed, 19 Oct 2022 17:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 06/12] xen-hvm: move common functions to
 hw/xen/xen-hvm-common.c
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
 <20221015050750.4185-7-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-7-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2022 06:07, Vikram Garhwal wrote:
[snip]
> +    qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state);
> +
> +    state->memory_listener = xen_memory_listener;
> +    memory_listener_register(&state->memory_listener, &address_space_memory);
> +
> +    state->io_listener = xen_io_listener;
> +    memory_listener_register(&state->io_listener, &address_space_io);
> +
> +    state->device_listener = xen_device_listener;
> +    QLIST_INIT(&state->dev_list);
> +    device_listener_register(&state->device_listener);
> +

As Julien said, these do not belong here. These are the (current and 
legacy) PV backend setup functions; they most certainly have nothing to 
do with device emulation.

   Paul


