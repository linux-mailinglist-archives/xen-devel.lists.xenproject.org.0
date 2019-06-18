Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09214AE21
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 00:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdMrm-0001g8-SF; Tue, 18 Jun 2019 22:46:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PyOf=UR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdMrl-0001g3-9x
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 22:46:13 +0000
X-Inumbo-ID: df58f10c-921a-11e9-bd92-ef6844416f0a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df58f10c-921a-11e9-bd92-ef6844416f0a;
 Tue, 18 Jun 2019 22:46:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03C682084D;
 Tue, 18 Jun 2019 22:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560897972;
 bh=IBek55LRJJCuWFHhldXVfgtWvSSwe3kK624GkL4HsLQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=NKFvd5BpAelUDYXUYlzSakWneQIaG/M2+EJVFQAojEiw6EJUhBJc+4cmcWTWi3zRJ
 3xwWdtXXQa44bIj/3nM7PJ2IKwWkEVBMqOI4HN6bVFIH8/y3KmzVWWENHDm1adkNj5
 Z3XuH11s7C2tDDH5zkgiQpREcC3c5VXQqeczNhZY=
Date: Tue, 18 Jun 2019 15:46:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@gmail.com>
In-Reply-To: <CAF3u54CHbQo82D18LTOdhbLgq4YfHkVin1c4YDkv0QLuqwUL3Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1906181545590.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-5-git-send-email-sstabellini@kernel.org>
 <bff15c1a-1eaf-4bde-c5dc-a5ada63b4d9f@arm.com>
 <alpine.DEB.2.21.1906181415510.2072@sstabellini-ThinkPad-T480s>
 <CAF3u54CHbQo82D18LTOdhbLgq4YfHkVin1c4YDkv0QLuqwUL3Q@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1204619354-1560897972=:2072"
Subject: Re: [Xen-devel] [PATCH v2 05/10] libxl/xl: add memory policy option
 to iomem
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com,
 ian.jackson@eu.citrix.com, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1204619354-1560897972=:2072
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 18 Jun 2019, Julien Grall wrote:
> Sorry for the formatting.
> 
> On Tue, 18 Jun 2019, 23:09 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Tue, 18 Jun 2019, Julien Grall wrote:
>       > On 30/04/2019 22:02, Stefano Stabellini wrote:
>       > > diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
>       > > index 89fe80f..a6c5e30 100644
>       > > --- a/tools/libxl/libxl_create.c
>       > > +++ b/tools/libxl/libxl_create.c
>       > > @@ -415,6 +415,21 @@ static void init_console_info(libxl__gc *gc,
>       > >          Only 'channels' when mapped to consoles have a string name. */
>       > >   }
>       > >   +static uint32_t libxl__memory_policy_to_xc(libxl_memory_policy c)
>       > > +{
>       > > +    switch (c) {
>       > > +    case LIBXL_MEMORY_POLICY_ARM_MEM_WB:
>       > > +        return MEMORY_POLICY_ARM_MEM_WB;
>       > > +    case LIBXL_MEMORY_POLICY_ARM_DEV_NGRE:
>       > > +        return MEMORY_POLICY_ARM_DEV_nGRE;
>       > > +    case LIBXL_MEMORY_POLICY_X86_UC:
>       > > +        return MEMORY_POLICY_X86_UC;
>       > > +    case LIBXL_MEMORY_POLICY_DEFAULT:
>       > > +    default:
>       >
>       > Looking at this again, don't we want to bail out if the policy is unknown? My
>       > concern here is the user may configure with something it didn't expect. The
>       > risk is the problem will be hard to debug.
>       >
>       > I also believe this could be part of libxl_{arm,x86}.c allowing us to filter
>       > misuse early.
> 
>       This sounds like a good idea, I can do that. Then, I can also #ifdef the
>       hypercalls defines, although for some reason today libxl doesn't have
>       CONFIG_X86 or CONFIG_ARM set so I would also have to do the following in
>       the libxl Makefile:
> 
>       ifeq ($(CONFIG_X86),y)
>       CFLAGS_LIBXL += -DCONFIG_X86
>       else
>       CFLAGS_LIBXL += -DCONFIG_ARM
>       endif
> 
> 
> Or just follow what we do today in other public headers:
> 
> #if defined(__arm__) || defined(__aarch64__)
> 
> You need to double check the exact syntax as I wrote it by memory.

Doh! Thank you
--8323329-1204619354-1560897972=:2072
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1204619354-1560897972=:2072--

