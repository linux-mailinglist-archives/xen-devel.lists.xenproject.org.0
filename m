Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DE739D510
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 08:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137674.255055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8rw-00014o-Aw; Mon, 07 Jun 2021 06:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137674.255055; Mon, 07 Jun 2021 06:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq8rw-00012b-6s; Mon, 07 Jun 2021 06:36:16 +0000
Received: by outflank-mailman (input) for mailman id 137674;
 Mon, 07 Jun 2021 06:36:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7O+=LB=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1lq8ru-00012V-Rh
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 06:36:15 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1441298f-3931-46d7-bf21-13792a4ed3c7;
 Mon, 07 Jun 2021 06:36:13 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-fxn78dn7OMiun1Xqh1ufiQ-1; Mon, 07 Jun 2021 02:36:10 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso7433964wrh.12
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jun 2021 23:36:10 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id i15sm4425627wmq.23.2021.06.06.23.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 23:36:08 -0700 (PDT)
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
X-Inumbo-ID: 1441298f-3931-46d7-bf21-13792a4ed3c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623047773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=thJrtqAEZWgLsa5T9uUPgNMHYTXTQwSguSbLhPSvi3M=;
	b=LZRtFo68RZw+3buDEpIpVRMmS6vgQ709xnixuj/HOSrtjGiuUbJ+K+iC0YKPJUT6pY/ouM
	w4/jdn0KJnOAp6RY6GCLg5ni2g0nOIUZgsC30cmZN2d86ZskmVgJ6JQMTmq9XoWuNhO3cw
	3ZA6B0IJEnpxi32fnZq1G5iUN/34ioU=
X-MC-Unique: fxn78dn7OMiun1Xqh1ufiQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=thJrtqAEZWgLsa5T9uUPgNMHYTXTQwSguSbLhPSvi3M=;
        b=NhOPuO/a6s4USKpAj5U5CUAQwYqCpoa7LwC+oT+UtFlnPXs1BrtlRAJz3ZGCGXy1Uo
         G4RzAFxZhGiFJUJxMwfKZSbcUuddMo/04ugtE5HnsyZyW0O+kyy15kD2hMExWtPKHaHr
         CQXq6YRPEOQFDDHOs2EFw8N90Do+vAg/kBwO7vv/M/nJHirFWDLb53hgwURe8Hs4YhVT
         T0okS8M+bLnIqef7rX7EG40SvhmMPdwoj/erMTmatKNKCvc38DWfMMw8N19kX2D8VWSd
         Zu0ofEBPVO0NRQM/a5e0PxBmMKw2ROxz11smYyMyLji7CtBtPWCxbxQvVqLsxqJjKakw
         tpKg==
X-Gm-Message-State: AOAM530/cwQaKfBNodIDnqiUCXpNQcruk6Ds62Drb64SlaJOD+KPsBdZ
	nMqNhC5pme6AblQCFO3aMRbUcGS1ccf6a/maK+tqig0aiz+g8I5TczrmoEcHuUhAJIX+6EaSxuI
	QioBJMlEvyOhkRRfkoCSnrhk1mE/NJevgXaorvWUKwJugyWcToh4XL6eTFTEfzqQVMNLSAGt26r
	A=
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr15330464wmf.7.1623047769521;
        Sun, 06 Jun 2021 23:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylIkmTDkwgmIQM4R2Pny1BX6EiFV+JC8gjufLOIUNCoJ8dJnFVzgajFrArTMLPjOqGd59ivw==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr15330437wmf.7.1623047769298;
        Sun, 06 Jun 2021 23:36:09 -0700 (PDT)
Subject: Re: [PATCH 2/2] Remove leading underscores from Xen defines
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20210605175001.13836-1-email@aabouzied.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <01ba2176-b559-1078-8a9f-39553989d9d3@redhat.com>
Date: Mon, 7 Jun 2021 08:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210605175001.13836-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/06/2021 19.50, Ahmed Abouzied wrote:
> Identifiers with leading underscores followed by capital letters or
> underscores are reserved for C standards.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/369
> 
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>   include/hw/xen/interface/grant_table.h  | 4 ++--
>   include/hw/xen/interface/io/blkif.h     | 4 ++--
>   include/hw/xen/interface/io/console.h   | 4 ++--
>   include/hw/xen/interface/io/fbif.h      | 4 ++--
>   include/hw/xen/interface/io/kbdif.h     | 4 ++--
>   include/hw/xen/interface/io/netif.h     | 4 ++--
>   include/hw/xen/interface/io/protocols.h | 4 ++--
>   include/hw/xen/interface/io/ring.h      | 4 ++--
>   include/hw/xen/interface/io/usbif.h     | 4 ++--
>   9 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/include/hw/xen/interface/grant_table.h b/include/hw/xen/interface/grant_table.h
> index 2af0cbdde3..c0a09dadad 100644
> --- a/include/hw/xen/interface/grant_table.h
> +++ b/include/hw/xen/interface/grant_table.h
> @@ -25,8 +25,8 @@
>    * Copyright (c) 2004, K A Fraser
>    */
>   
> -#ifndef __XEN_PUBLIC_GRANT_TABLE_H__
> -#define __XEN_PUBLIC_GRANT_TABLE_H__
> +#ifndef XEN_PUBLIC_GRANT_TABLE_H
> +#define XEN_PUBLIC_GRANT_TABLE_H
>   
>   /*
>    * Reference to a grant entry in a specified domain's grant table.
> diff --git a/include/hw/xen/interface/io/blkif.h b/include/hw/xen/interface/io/blkif.h
> index d07fa1e078..680914571f 100644
> --- a/include/hw/xen/interface/io/blkif.h
> +++ b/include/hw/xen/interface/io/blkif.h
> @@ -25,8 +25,8 @@
>    * Copyright (c) 2012, Spectra Logic Corporation
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_BLKIF_H__
> -#define __XEN_PUBLIC_IO_BLKIF_H__
> +#ifndef XEN_PUBLIC_IO_BLKIF_H
> +#define XEN_PUBLIC_IO_BLKIF_H
>   
>   #include "ring.h"
>   #include "../grant_table.h"
> diff --git a/include/hw/xen/interface/io/console.h b/include/hw/xen/interface/io/console.h
> index e2155d1cf5..0d4a72456e 100644
> --- a/include/hw/xen/interface/io/console.h
> +++ b/include/hw/xen/interface/io/console.h
> @@ -24,8 +24,8 @@
>    * Copyright (c) 2005, Keir Fraser
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_CONSOLE_H__
> -#define __XEN_PUBLIC_IO_CONSOLE_H__
> +#ifndef XEN_PUBLIC_IO_CONSOLE_H
> +#define XEN_PUBLIC_IO_CONSOLE_H
>   
>   typedef uint32_t XENCONS_RING_IDX;
>   
> diff --git a/include/hw/xen/interface/io/fbif.h b/include/hw/xen/interface/io/fbif.h
> index ea87ebec0a..4e25423490 100644
> --- a/include/hw/xen/interface/io/fbif.h
> +++ b/include/hw/xen/interface/io/fbif.h
> @@ -23,8 +23,8 @@
>    * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_FBIF_H__
> -#define __XEN_PUBLIC_IO_FBIF_H__
> +#ifndef XEN_PUBLIC_IO_FBIF_H
> +#define XEN_PUBLIC_IO_FBIF_H
>   
>   /* Out events (frontend -> backend) */
>   
> diff --git a/include/hw/xen/interface/io/kbdif.h b/include/hw/xen/interface/io/kbdif.h
> index 1d68cd458e..a952c77bf2 100644
> --- a/include/hw/xen/interface/io/kbdif.h
> +++ b/include/hw/xen/interface/io/kbdif.h
> @@ -23,8 +23,8 @@
>    * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_KBDIF_H__
> -#define __XEN_PUBLIC_IO_KBDIF_H__
> +#ifndef XEN_PUBLIC_IO_KBDIF_H
> +#define XEN_PUBLIC_IO_KBDIF_H
>   
>   /*
>    *****************************************************************************
> diff --git a/include/hw/xen/interface/io/netif.h b/include/hw/xen/interface/io/netif.h
> index 48fa530950..f4a28a43b1 100644
> --- a/include/hw/xen/interface/io/netif.h
> +++ b/include/hw/xen/interface/io/netif.h
> @@ -24,8 +24,8 @@
>    * Copyright (c) 2003-2004, Keir Fraser
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_NETIF_H__
> -#define __XEN_PUBLIC_IO_NETIF_H__
> +#ifndef XEN_PUBLIC_IO_NETIF_H
> +#define XEN_PUBLIC_IO_NETIF_H
>   
>   #include "ring.h"
>   #include "../grant_table.h"
> diff --git a/include/hw/xen/interface/io/protocols.h b/include/hw/xen/interface/io/protocols.h
> index 52b4de0f81..3d1cac322b 100644
> --- a/include/hw/xen/interface/io/protocols.h
> +++ b/include/hw/xen/interface/io/protocols.h
> @@ -22,8 +22,8 @@
>    * Copyright (c) 2008, Keir Fraser
>    */
>   
> -#ifndef __XEN_PROTOCOLS_H__
> -#define __XEN_PROTOCOLS_H__
> +#ifndef XEN_PROTOCOLS_H
> +#define XEN_PROTOCOLS_H
>   
>   #define XEN_IO_PROTO_ABI_X86_32     "x86_32-abi"
>   #define XEN_IO_PROTO_ABI_X86_64     "x86_64-abi"
> diff --git a/include/hw/xen/interface/io/ring.h b/include/hw/xen/interface/io/ring.h
> index 115705f3f4..ea324c5a62 100644
> --- a/include/hw/xen/interface/io/ring.h
> +++ b/include/hw/xen/interface/io/ring.h
> @@ -24,8 +24,8 @@
>    * Tim Deegan and Andrew Warfield November 2004.
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_RING_H__
> -#define __XEN_PUBLIC_IO_RING_H__
> +#ifndef XEN_PUBLIC_IO_RING_H
> +#define XEN_PUBLIC_IO_RING_H
>   
>   /*
>    * When #include'ing this header, you need to provide the following
> diff --git a/include/hw/xen/interface/io/usbif.h b/include/hw/xen/interface/io/usbif.h
> index c6a58639d6..564c0115e8 100644
> --- a/include/hw/xen/interface/io/usbif.h
> +++ b/include/hw/xen/interface/io/usbif.h
> @@ -25,8 +25,8 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> -#ifndef __XEN_PUBLIC_IO_USBIF_H__
> -#define __XEN_PUBLIC_IO_USBIF_H__
> +#ifndef XEN_PUBLIC_IO_USBIF_H
> +#define XEN_PUBLIC_IO_USBIF_H
>   
>   #include "ring.h"
>   #include "../grant_table.h"
> 

I hope the Xen people can comment on whether the underscores had a purpose 
here or whether it's ok to remove them, thus:

Cc: xen-devel@lists.xenproject.org

 From my QEMU-developer's side of view:

Reviewed-by: Thomas Huth <thuth@redhat.com>


