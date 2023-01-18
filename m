Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D9C6718A8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 11:13:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480439.744869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5RT-0006tS-Pz; Wed, 18 Jan 2023 10:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480439.744869; Wed, 18 Jan 2023 10:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5RT-0006qd-Mx; Wed, 18 Jan 2023 10:13:15 +0000
Received: by outflank-mailman (input) for mailman id 480439;
 Wed, 18 Jan 2023 10:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FJ6X=5P=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pI5RR-0006Xw-OC
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 10:13:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b63baf53-9718-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 11:13:12 +0100 (CET)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-1TIaP4bENWC2iqbZ3swxhg-1; Wed, 18 Jan 2023 05:13:09 -0500
Received: by mail-wr1-f69.google.com with SMTP id
 s20-20020adfa294000000b002b81849101eso6764197wra.16
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jan 2023 02:13:09 -0800 (PST)
Received: from redhat.com ([2.52.28.74]) by smtp.gmail.com with ESMTPSA id
 z4-20020a1cf404000000b003da2932bde0sm1700355wma.23.2023.01.18.02.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 02:13:07 -0800 (PST)
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
X-Inumbo-ID: b63baf53-9718-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674036790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRjJcGcIJeRz3HV0dfr6+yOWYOH/Jreqd5wo9IIEYVE=;
	b=S1HttiMWFk4rWddO+v12N01coH1/H9lymIQlB5LYSo0p0BfczsHhECeMlPKNUYTg50hzAx
	zeL9GkFDkClcuRCGPB1lse7sAXgEPYXvK4EAoW6q/cCBgGFProJVaplMBIKv9zWZaXSGkU
	OnRbTBWPSUOtMJbJc5CCebzgVP/xsrM=
X-MC-Unique: 1TIaP4bENWC2iqbZ3swxhg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRjJcGcIJeRz3HV0dfr6+yOWYOH/Jreqd5wo9IIEYVE=;
        b=4OL9yDoOsVCgIaijheObfRyd/+4qMFKkoBc4YoM7GTEVl0uwgtr+HN/wl8FlcD5+ks
         ywNWZ5QXDwhptRtUwNn1/Ij66oy2JVKTA4E6+2oDwStswkqpM2D9TNO8AaHpHmiQM3IR
         hC41YUmEtREozP+xfOr3MKfn7s89ur1VArX4RDd+lTQVZ1GqO2ELw2yWf37H7jQE6a6H
         l9kd3eRcgWTd4IZ9KyIo7aNE+XDfFC7KKxg0+l7cqrWSxlzZkSw1r05r4TtzzA5k9eZt
         NvuprFT69jlIq5kVpxgBwzBY2vp+5wq4UGfC+XrQGZalugioTP781toTL5rD0lupG9Z9
         ACeQ==
X-Gm-Message-State: AFqh2kpFVRfAVnEIPrnmmYB6qASO12lqmoJv15ES4tMXHNQHO7u8AA2w
	Y7jajj1cFXB/ArysJLFbfhZblu5PWu6A3Vs1+qtZbFYhjvFj7hs27qHEugAn/nKnRylz2ZWYs8u
	Id0+3hnqb6etqD92MjpPixyoJccQ=
X-Received: by 2002:a05:600c:3ca0:b0:3da:fc15:740c with SMTP id bg32-20020a05600c3ca000b003dafc15740cmr6168764wmb.19.1674036788251;
        Wed, 18 Jan 2023 02:13:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtPeaEuZcdoxm8td8K7KjvHiWcT8LazBuqb1MG4N7vId7zMUQX+86m6izbLliR3bAA1shRznA==
X-Received: by 2002:a05:600c:3ca0:b0:3da:fc15:740c with SMTP id bg32-20020a05600c3ca000b003dafc15740cmr6168742wmb.19.1674036788038;
        Wed, 18 Jan 2023 02:13:08 -0800 (PST)
Date: Wed, 18 Jan 2023 05:13:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Message-ID: <20230118051230-mutt-send-email-mst@kernel.org>
References: <20230104144437.27479-1-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
> This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally removes
> it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in the PC
> machine agnostic to the precise southbridge being used. 2/ will become
> particularily interesting once PIIX4 becomes usable in the PC machine, avoiding
> the "Frankenstein" use of PIIX4_ACPI in PIIX3.

Looks ok to me.
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Feel free to merge through Xen tree.

> v2:
> - xen_piix3_set_irq() is already generic. Just rename it. (Chuck)
> 
> Testing done:
> None, because I don't know how to conduct this properly :(
> 
> Based-on: <20221221170003.2929-1-shentey@gmail.com>
>           "[PATCH v4 00/30] Consolidate PIIX south bridges"
> 
> Bernhard Beschow (6):
>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
>   hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
>   hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
>   hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
>   hw/isa/piix: Resolve redundant k->config_write assignments
>   hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
> 
>  hw/i386/pc_piix.c             | 34 ++++++++++++++++--
>  hw/i386/xen/xen-hvm.c         |  2 +-
>  hw/isa/piix.c                 | 66 +----------------------------------
>  include/hw/southbridge/piix.h |  1 -
>  include/hw/xen/xen.h          |  2 +-
>  stubs/xen-hw-stub.c           |  2 +-
>  6 files changed, 35 insertions(+), 72 deletions(-)
> 
> -- 
> 2.39.0
> 


