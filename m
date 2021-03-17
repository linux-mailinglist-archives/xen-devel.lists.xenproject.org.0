Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CDC33E290
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 01:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98518.186933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMJrs-0005yq-JB; Wed, 17 Mar 2021 00:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98518.186933; Wed, 17 Mar 2021 00:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMJrs-0005yR-Fy; Wed, 17 Mar 2021 00:16:56 +0000
Received: by outflank-mailman (input) for mailman id 98518;
 Wed, 17 Mar 2021 00:16:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KDYS=IP=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lMJrq-0005yM-W8
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 00:16:55 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fada098a-140c-4350-9092-4232696fd056;
 Wed, 17 Mar 2021 00:16:53 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-yQR7w5CNN8-zDj-kcLmRSQ-1; Tue, 16 Mar 2021 20:16:51 -0400
Received: by mail-wr1-f72.google.com with SMTP id r6so4212882wrt.20
 for <xen-devel@lists.xenproject.org>; Tue, 16 Mar 2021 17:16:51 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h20sm787637wmm.19.2021.03.16.17.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:16:50 -0700 (PDT)
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
X-Inumbo-ID: fada098a-140c-4350-9092-4232696fd056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615940213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPxaUrgJTpkqTxod0daPMNseXWx1OJaVOiNLeL0Mjq4=;
	b=Kz84s+y+KUhR1o+Mt1xXDfjfegrBOP7BJFeNtmC/4p84pCS8DviHSKsn7w6Yqo5hrYAg6K
	O527Ew4GHOY1i+2LlAcxUCuibZXMv/VfVfX7T4zgqkKBxp8mqd3Mu5G/6rGAVt+QfWo4EG
	lk8m0Q4V6qsnZnmOrdK1rLUojQUBebY=
X-MC-Unique: yQR7w5CNN8-zDj-kcLmRSQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gPxaUrgJTpkqTxod0daPMNseXWx1OJaVOiNLeL0Mjq4=;
        b=MfP4vPxiD9MMCstj3y93RCxTf+mIb9EPpLKnPFAGrmk8vEEfS4DtBN2En9IFZ1uPtg
         toWOcTZTke+/ljyqMJLRyDESCi722ELA15xGGJamx7OLG9BvMpTL4juNW5FYW74U51YT
         9813PRelPILLLvTI5WOeAhI0P45eOrgMDMEq6QDB3/4SYHrNxmNTyEsqLCGlm/lcTrey
         MPVnjjr3qnqjAmGton07OVXgyLtLaCHsojlwuEnjq56Q6lMlfF3JtkriWBVzDHuIqttW
         DUdNINPdrOstOX219d6RO46faGlg0Qz/z5JoyHUUn5ETSX1AUGCjnjWxwiQ4M0WjVUYI
         5UzA==
X-Gm-Message-State: AOAM532SgV1nIqw7pl6l/aUpiBC5ON8YbO7sh+TI5WoSRTmBoE2drevg
	6jNoMeOCunKcxZMA1sgVH0DxvgW/yw3lyZbEWEq+0QK2oShDfCq4J656pO61kgzXMkgiRvUE1+R
	YNPoriJoi7w9ikU5uCBR+ov8Z9h8=
X-Received: by 2002:a5d:4708:: with SMTP id y8mr1552623wrq.382.1615940210686;
        Tue, 16 Mar 2021 17:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrocL9jUxEN3TUc5sZWquXWQ0lm0uzy5CHm2VrcOCniDMwIAcG+Q/hYU0MwBofCcAkc0t9cA==
X-Received: by 2002:a5d:4708:: with SMTP id y8mr1552616wrq.382.1615940210563;
        Tue, 16 Mar 2021 17:16:50 -0700 (PDT)
Subject: Re: [PATCH v1] piix: fix regression during unplug in Xen HVM domUs
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
References: <20210316224412.11609-1-olaf@aepfle.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d8bc9849-8ffc-78aa-b39c-3fe9d6d9c6c0@redhat.com>
Date: Wed, 17 Mar 2021 01:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316224412.11609-1-olaf@aepfle.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/16/21 11:44 PM, Olaf Hering wrote:
> Commit ee358e919e385fdc79d59d0d47b4a81e349cd5c9 causes a regression in
> Xen HVM domUs which run xenlinux based kernels.
> 
> If the domU has an USB device assigned, for example with
> "usbdevice=['tablet']" in domU.cfg, the late unplug of devices will
> kill the emulated USB host. As a result the khubd thread hangs, and as
> a result the entire boot process.
> 
> For some reason this does not affect pvops based kernels. This is
> most likely caused by the fact that unplugging happens very early
> during boot.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  hw/ide/piix.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index b9860e35a5..2a380a90e9 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -34,6 +34,7 @@
>  #include "hw/ide/pci.h"
>  #include "trace.h"
>  
> +static bool pci_piix3_xen_ide_unplug_done;

This field belongs to the device state (PCIIDEState or BMDMAState).

>  static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
>  {
>      BMDMAState *bm = opaque;
> @@ -109,6 +110,8 @@ static void piix_ide_reset(DeviceState *dev)
>      uint8_t *pci_conf = pd->config;
>      int i;
>  
> +    if (pci_piix3_xen_ide_unplug_done == true)
> +        return;
>      for (i = 0; i < 2; i++) {
>          ide_bus_reset(&d->bus[i]);
>      }
> @@ -169,6 +172,7 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
>      IDEBus *idebus;
>      BlockBackend *blk;
>  
> +    pci_piix3_xen_ide_unplug_done = true;
>      pci_ide = PCI_IDE(dev);
>  
>      for (i = aux ? 1 : 0; i < 4; i++) {
> @@ -259,6 +263,7 @@ static const TypeInfo piix4_ide_info = {
>  
>  static void piix_ide_register_types(void)
>  {
> +    pci_piix3_xen_ide_unplug_done = false;
>      type_register_static(&piix3_ide_info);
>      type_register_static(&piix3_ide_xen_info);
>      type_register_static(&piix4_ide_info);
> 


