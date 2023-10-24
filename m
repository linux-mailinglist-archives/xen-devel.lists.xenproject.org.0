Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5317D541C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622051.969181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvISG-0000Jv-VU; Tue, 24 Oct 2023 14:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622051.969181; Tue, 24 Oct 2023 14:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvISG-0000H3-Rs; Tue, 24 Oct 2023 14:32:24 +0000
Received: by outflank-mailman (input) for mailman id 622051;
 Tue, 24 Oct 2023 14:32:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvISE-0006O8-MO
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:32:22 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23dc358e-727a-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 16:32:21 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso26527565e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 07:32:21 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b004068def185asm2868465wmo.28.2023.10.24.07.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 07:32:19 -0700 (PDT)
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
X-Inumbo-ID: 23dc358e-727a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698157940; x=1698762740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ASkYfBT83DzI2Y3E+QUpM/rSYztNN2Dn3OWclTYnN8=;
        b=SUhb0pa/IcwbR8w8MXgxtZtRqx0MarqgbK2211T6c/8o8NjFkgNowl7TVWwCmFSrVq
         MvtRlayhub5JdqS9UpJWzFM7/kEUQ1ZpYdRaM9a6805jUC4jFLSK40vYfU3iGgmwcxhb
         mzJxji4NrXEujgmS+nTFL43QiU1IPypH7IpmzwdRxyXupMpX0HTRTyTXdcNhCW0DJLze
         BQ/rpqMCcGPD0rQZXqmivr1XWKF1KfbgycfiFYUED6HURvjMHAyxp8/VFctMKh3QM2J8
         DovcOi5t03nd5pIEJ74VLuASRIadjn/KETzp2pqt8c7JoAnXoySOQNmTVGRKLMiaZ/Lh
         gZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157940; x=1698762740;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ASkYfBT83DzI2Y3E+QUpM/rSYztNN2Dn3OWclTYnN8=;
        b=adCqAg1OMz7shazZFpMgHhkdDBAGAo54Ziokt3vH8jXnwmMLOkC4n+Ka0RnKTy8Uvn
         p8yC8PWVmjXnme6FpMw5wGeU/ynYDmqcGiX8r8I+Moj/jA9feL987T99QiA68CDRfeAL
         DaFIT0r0Euzv+DHBtqiabFgUC4bOZloQQpLRobpd8ySS4TPYn0XL8GwOr/Ii/9tJTxw+
         FDaTsjYma1AKxJfQmZ3LCmVPKMTm+Dajuh/vaZzvbhmNmZvneM3OmWP6assjTozLk4+G
         QDNSljlKY+UZ9x8w1eGeDKnn3X+x1EqZrLJXiu5iuIPbMJcI5953jbv8/u28JpxF3NPs
         A2Uw==
X-Gm-Message-State: AOJu0Ywp46KrWb3crEP5op4SKkkPJFFf364hOC00rm1BfJ70d0O/rtId
	Ly7dFV8KYnai7uBOjvogvKfZpww4CB0Oxw==
X-Google-Smtp-Source: AGHT+IH3S3oghRgfgbsQqo86KSVXvTtoeL3gUJvVrDNxZr+FihJ6lz9hqg6acdcxsulSLEku5uUYmA==
X-Received: by 2002:a05:600c:154c:b0:408:3634:b81e with SMTP id f12-20020a05600c154c00b004083634b81emr11099647wmg.13.1698157940248;
        Tue, 24 Oct 2023 07:32:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <1408fb32-3d91-4eb2-b0e7-4eba0f449906@xen.org>
Date: Tue, 24 Oct 2023 15:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 1/4] hw/xen: only remove peers of PCI NICs on unplug
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Jason Wang
 <jasowang@redhat.com>, xen-devel@lists.xenproject.org
References: <20231017182545.97973-1-dwmw2@infradead.org>
 <20231017182545.97973-2-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231017182545.97973-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2023 19:25, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When the Xen guest asks to unplug *emulated* NICs, it's kind of unhelpful
> also to unplug the peer of the *Xen* PV NIC.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/xen_platform.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 17457ff3de..e2dd1b536a 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -140,9 +140,14 @@ static void unplug_nic(PCIBus *b, PCIDevice *d, void *o)
>   /* Remove the peer of the NIC device. Normally, this would be a tap device. */
>   static void del_nic_peer(NICState *nic, void *opaque)
>   {
> -    NetClientState *nc;
> +    NetClientState *nc = qemu_get_queue(nic);
> +    ObjectClass *klass = module_object_class_by_name(nc->model);
> +
> +    /* Only delete peers of PCI NICs that we're about to delete */
> +    if (!klass || !object_class_dynamic_cast(klass, TYPE_PCI_DEVICE)) {

Would it not be better to test for object_class_dynamic_cast(klass, 
TYPE_XEN_DEVICE)?

   Paul

> +        return;
> +    }
>   
> -    nc = qemu_get_queue(nic);
>       if (nc->peer)
>           qemu_del_net_client(nc->peer);
>   }


