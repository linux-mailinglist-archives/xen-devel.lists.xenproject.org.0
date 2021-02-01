Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D630A35E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 09:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79608.144937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ufh-0000Bw-NF; Mon, 01 Feb 2021 08:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79608.144937; Mon, 01 Feb 2021 08:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Ufh-0000BX-K6; Mon, 01 Feb 2021 08:34:57 +0000
Received: by outflank-mailman (input) for mailman id 79608;
 Mon, 01 Feb 2021 08:34:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDK9=HD=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1l6Uff-0000BS-Qo
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 08:34:56 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 78dbbe63-da5c-4660-899e-f04534398690;
 Mon, 01 Feb 2021 08:34:54 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-deOd4GvMNliiokeHwSxqtQ-1; Mon, 01 Feb 2021 03:34:52 -0500
Received: by mail-ed1-f71.google.com with SMTP id x13so7592458edi.7
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 00:34:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s3sm7441126ejn.47.2021.02.01.00.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 00:34:50 -0800 (PST)
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
X-Inumbo-ID: 78dbbe63-da5c-4660-899e-f04534398690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612168494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gm47NOdsiA8w3zVE9sHPDHTLG06a6IG1aKDU8XTax/o=;
	b=Rt6pH9jEf+lxIveAbPeurtv00oSKx4RWB8gAilzVD+ViBfyhFQNE8u/Vp6qL2D8FP5kRgi
	rISzvS1uefL5eYM+dhlFe/5EyebTmp44uQQkA+6xov0vJ6DxouJgDd7YuJG4skIoS8w19l
	9+juDp2NQk3Ta2dYbokEyxG+yRC2UKs=
X-MC-Unique: deOd4GvMNliiokeHwSxqtQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gm47NOdsiA8w3zVE9sHPDHTLG06a6IG1aKDU8XTax/o=;
        b=B9KZgbVj+cp+gASzJKPAqoxNX7Rt37c8I/9Q9rBv6Ie9eVeBps36c09Bw+UoA9RIPa
         iduwZnpruo2RW6rXuDfsl9z39/L1KlQ1MAccVCrI3boktoY9bVELvrimicavqbYJiti/
         lGlONz1u8TgMcvEKWLsfzsrhUB7X3JQK2hkvdVe7DXFcWWDcKcBVmCkLs6ETIoqnbs7n
         eCGKeIPIeRFGSJXFNECD80E73PqgUfQKoi5qXtvuhEYfi6rKCYkoPbP/qm+NOZYwe3j7
         GJVy3Nf2Jxqptk9JD1BsWnh8RJx3zNIJ2L2h36S0H1GNkECbOy9A9JFXPTNNxLoN0k0e
         NWOQ==
X-Gm-Message-State: AOAM531PFaNnfXCstpLQt4g7eq1tthjTBJpfk3VhQ/vdHvOp9xJyf1uk
	L63+qFEfsXxiH9ojQy42HElrPbiwxYFBr5/4fzdeg87NoehxWJfoJPQ4+gg49tOVUAydVn/N/L9
	ovgrPLioFqyvJ9TIS1Bx1uwPoZDk=
X-Received: by 2002:a05:6402:35c2:: with SMTP id z2mr17435958edc.34.1612168491491;
        Mon, 01 Feb 2021 00:34:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyZ391Du2eae4AAvhEk4ICQIr9fen9gbN1LB/IKhx59RWxvtv3goadRgPEg3msphjMcEQPQg==
X-Received: by 2002:a05:6402:35c2:: with SMTP id z2mr17435937edc.34.1612168491260;
        Mon, 01 Feb 2021 00:34:51 -0800 (PST)
Subject: Re: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant
 <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-5-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
Date: Mon, 1 Feb 2021 09:34:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131141810.293186-5-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31/01/21 15:18, Philippe Mathieu-Daudé wrote:
> 9pfs is not an accelerator feature but a machine one,
> move the selection on the machine Kconfig (in hw/).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/Kconfig       | 1 -
>   hw/i386/xen/Kconfig | 1 +
>   hw/xen/Kconfig      | 1 +
>   3 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/Kconfig b/accel/Kconfig
> index 461104c7715..b9e9a2d35b0 100644
> --- a/accel/Kconfig
> +++ b/accel/Kconfig
> @@ -15,4 +15,3 @@ config KVM
>   
>   config XEN
>       bool
> -    select FSDEV_9P if VIRTFS
> diff --git a/hw/i386/xen/Kconfig b/hw/i386/xen/Kconfig
> index ad9d774b9ea..4affd842f28 100644
> --- a/hw/i386/xen/Kconfig
> +++ b/hw/i386/xen/Kconfig
> @@ -3,3 +3,4 @@ config XEN_FV
>       default y if XEN
>       depends on XEN
>       select I440FX
> +    select FSDEV_9P if VIRTFS
> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
> index 0b8427d6bd1..825277969fa 100644
> --- a/hw/xen/Kconfig
> +++ b/hw/xen/Kconfig
> @@ -5,3 +5,4 @@ config XEN_PV
>       select PCI
>       select USB
>       select IDE_PIIX
> +    select FSDEV_9P if VIRTFS
> 

I think you can compile without FSDEV_9P selected?  If so, this should 
be "imply".

If on the other hand you cannot, and that is because of some other file 
brought in by CONFIG_XEN, this patch shouldn't be there.

I can queue the series once you resolve this doubt.

Paolo


