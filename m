Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30ED73F517
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555866.868011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE2rZ-00009z-S6; Tue, 27 Jun 2023 07:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555866.868011; Tue, 27 Jun 2023 07:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE2rZ-00007g-P4; Tue, 27 Jun 2023 07:11:45 +0000
Received: by outflank-mailman (input) for mailman id 555866;
 Tue, 27 Jun 2023 07:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dlp8=CP=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1qE2rY-00007a-1V
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:11:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd8879f2-14b9-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 09:11:42 +0200 (CEST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596--n1mgtHqOKakQh3derAS-A-1; Tue, 27 Jun 2023 03:11:36 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-313f5021d9bso716170f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 00:11:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 d1-20020a5d6dc1000000b00304adbeeabbsm9439847wrz.99.2023.06.27.00.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 00:11:34 -0700 (PDT)
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
X-Inumbo-ID: dd8879f2-14b9-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687849901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6VVhVzXs6+8xF41LtPYoUG8bj5MGwR49pfsVcwj9t1w=;
	b=ae/hp4jhSRfUl5G6DwDNti9TB1MPxovKGZlejGro1PLOs5MIqZz2o3iBIrtM4+gjYOYVBe
	oDEYJVI8qz8gwnh0tQBe3xTry4X0JnsQeCLSHy1gD934P4zKlNxuaSz9Amgm8NJzeBxYj8
	t4DkMAGO8DoRzZJWfP20zZ3+6CCTnK4=
X-MC-Unique: -n1mgtHqOKakQh3derAS-A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687849895; x=1690441895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VVhVzXs6+8xF41LtPYoUG8bj5MGwR49pfsVcwj9t1w=;
        b=jaH8QLP42ehsuhlT36P8HUPF66sLK8X5MusYBULm2CYjo0KDtuC6DxAbpjDhKTcSVK
         1UtW3T2mTkHEeZtuWZLEfnB5KGoqjYJKsak7C9AXylz7slP+mrw/xjlYT4UakCEEYSI1
         ZXe6Rn8B/sQWGX/DU4bTSDr0qES+TwalmwewV4WbtnmHFMVkPdQRNBhjwkBFOHT7k9Fj
         AO/n+5WiFkFu4Xu8gnf1XNYiIVq9/JB7WSL7j1nc0lsKdhZiFvrtB7DWQM2Dx2qYvEtV
         pg8wCQjoMyNzX4mourvDXpod4JhfFPjlt+srAeX135em7CwfLfTDH4/HHbDTax+ADK5A
         /FZg==
X-Gm-Message-State: AC+VfDxnHFvnBQvyFIPb67jj+9KFQYmnCW+mA+WvJldiTLmhq1Ghtf68
	jbUaYIjb0guWkflZRc4qK8guqdRiNcx7rBRZKMVp/7YXuX0IZyXSH+9kVWD2uCxgyNusUFMfSZY
	GafBHpeEgg0/31T0I7fk/1+5QvbQ=
X-Received: by 2002:adf:f24c:0:b0:313:f152:d7f2 with SMTP id b12-20020adff24c000000b00313f152d7f2mr3411359wrp.36.1687849895422;
        Tue, 27 Jun 2023 00:11:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4J0rxCyrrQw+AA+6R0HF8+A45hIRxv5L1efnDXk13eePybHu/MGpnTkhS12Kw8pRPV67ZBeg==
X-Received: by 2002:adf:f24c:0:b0:313:f152:d7f2 with SMTP id b12-20020adff24c000000b00313f152d7f2mr3411352wrp.36.1687849895119;
        Tue, 27 Jun 2023 00:11:35 -0700 (PDT)
Message-ID: <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com>
Date: Tue, 27 Jun 2023 09:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
To: Olaf Hering <olaf@aepfle.de>, John Snow <jsnow@redhat.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
References: <20210317070046.17860-1-olaf@aepfle.de>
 <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
 <20210325121219.7b5daf76.olaf@aepfle.de>
 <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
 <20230509225818.GA16290@aepfle.de> <20230626231901.5b5d11c1.olaf@aepfle.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230626231901.5b5d11c1.olaf@aepfle.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/23 23:19, Olaf Hering wrote:
> I need advice on how to debug this.
> 
> One thing that stands out is uhci_irq().
> It reads a u16 from the USBSTS register.
> 
> On the qemu side, this read is served from bmdma_read. Since the read
> size is 2, the result is ~0, and uhci_irq() turns the controller off.
> In other words, memory_region_ops_read from addr=0xc102 is served from "piix-bmdma"
> 
> If the pci_set_word calls in piix_ide_reset are skipped, the read is
> served from uhci_port_write. This is the expected behavior.
> In other words, memory_region_ops_read from addr=0xc102 is served from "uhci".

I think what's happening is that

     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */

is setting the BAR to 0xC100, therefore overlapping the UHCI device's 
region.  In principle this line shouldn't be necessary at all though; 
it's enough to clear the COMMAND register.

Can you check the value of the COMMAND register (pci_conf + 0x04, 16 
bits, little endian)?  Something might be causing the register to be set 
back to a nonzero value, therefore re-enabling the I/O at the address 
that overlaps the UHCI device.

Paolo


