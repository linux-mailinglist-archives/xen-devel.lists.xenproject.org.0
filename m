Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248826002AB
	for <lists+xen-devel@lfdr.de>; Sun, 16 Oct 2022 20:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423908.670996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ok83H-0003ku-Dx; Sun, 16 Oct 2022 18:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423908.670996; Sun, 16 Oct 2022 18:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ok83H-0003hk-BG; Sun, 16 Oct 2022 18:07:55 +0000
Received: by outflank-mailman (input) for mailman id 423908;
 Sun, 16 Oct 2022 18:07:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ok83G-0003he-0x
 for xen-devel@lists.xenproject.org; Sun, 16 Oct 2022 18:07:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok839-0003kh-GA; Sun, 16 Oct 2022 18:07:47 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.141])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok839-0003qH-9L; Sun, 16 Oct 2022 18:07:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=CuGOnrDMtV5vDQ/7F1e9NAArcg8H+cC0WxXQP5snmQs=; b=wlR1SUifYbJbzN0B+SnCKsa/jD
	IFHUcR1/0r26ctoxccVcK3/juFMuqM32llxWh/hgPFD3eKVPtVxXH9+Vx3S45DQkyUO65rsXIWP8x
	PNCwMLXk9ORoZ6A6uaPTjSJbkoWUnVNp8aahibDNBecoz/FYfotN6aEv79yzaD49AxhE=;
Message-ID: <31c4102e-372e-85f9-301e-7fdc18b29bd7@xen.org>
Date: Sun, 16 Oct 2022 19:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v1 06/12] xen-hvm: move common functions to
 hw/xen/xen-hvm-common.c
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-7-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221015050750.4185-7-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 15/10/2022 06:07, Vikram Garhwal wrote:
> +void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> +                        MemoryListener xen_memory_listener)
> +{


[...]

> +
> +    xen_bus_init();
> +
> +    /* Initialize backend core & drivers */
> +    if (xen_be_init() != 0) {
> +        error_report("xen backend core setup failed");
> +        goto err;
> +    }
> +    xen_be_register_common();

Calling xen_be_init() and xen_be_register_common() from 
xen_register_ioreq() sounds wrong to me. There are no dependency between 
the two. I think it would be better to create a new function to register 
backends.

Cheers,

-- 
Julien Grall

