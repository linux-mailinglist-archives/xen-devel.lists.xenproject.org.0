Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6C09AE575
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825215.1239399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xR9-0008LP-3C; Thu, 24 Oct 2024 12:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825215.1239399; Thu, 24 Oct 2024 12:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xR8-0008JE-W6; Thu, 24 Oct 2024 12:59:34 +0000
Received: by outflank-mailman (input) for mailman id 825215;
 Thu, 24 Oct 2024 12:59:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dalx=RU=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t3xR7-0008J8-Qm
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 12:59:33 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfab66d6-9207-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 14:59:31 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-539e6c754bdso780305e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 05:59:31 -0700 (PDT)
Received: from premium-test ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c6b4d9sm5650793a12.65.2024.10.24.05.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 05:59:30 -0700 (PDT)
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
X-Inumbo-ID: cfab66d6-9207-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729774771; x=1730379571; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ixXW3PLR//Gz4PUYGLxickYN42Ir9FIiRkOqEjBxNQE=;
        b=JKpJvp7MRNOJions7esfT+8A9x2XJ4Y52huQUX890nLHWk2gwkSVYikSmULwXIvwd2
         jxPquJfywhiwuTG/ayTwIQ2RiDkSG7e16FYrNHDaBgXiN962siSaEMJztLix3fD2sSOs
         +N9nYpCDICeXX2uKDeJGwecK3fHrhS+xoMAD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729774771; x=1730379571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixXW3PLR//Gz4PUYGLxickYN42Ir9FIiRkOqEjBxNQE=;
        b=Br8hUP8z3ZSOeqpxdgf2/KRcKiXAzeHwcWIPfEd3+CnEyHmv9HSNYxJS3JmN5SShHp
         zaaVsXKgWe2XQmQItvczbhFZIKAsckAPmT/6Fnt82PAx4A+n071EBqs4G/INVPRYFCSK
         bRb05Ut9tk+2wl5NKoXTh8j1oRTohuz9YzYFtvtE16fZG/RhOhMW5SdIZ9g+A41zXLHw
         yiP/bQpvmMWCjzgJeixniXVmKwo3I+cEBhSrDf9ms531jlvujuQdfUcl8k8hYgCwm2cz
         lhTsF6pgaj4ye8BPn3JkRXUX+VsTSSxLnDMxK/ACiudkE/6GKbusi1mgSZ0GJJ9/PODc
         I+zQ==
X-Gm-Message-State: AOJu0YygFoFH/0gMBPED2fgA/zRiXDMdOBPul04A5c33awLDTzQJdjBo
	lbHsnPBPQWZCqT+Yoj88+BOvAFBdp+7l07xwNuDJefAvHE8vNBhQbG1c0EE+ec0=
X-Google-Smtp-Source: AGHT+IEL2/2WFhAWQolmDwxuV3fhBtcMI8LRQ/ivzZIIDRZPPt4axjxYmfxEHW5pYu7tvJztCS4YPg==
X-Received: by 2002:a05:6512:1246:b0:536:9f72:c427 with SMTP id 2adb3069b0e04-53b1a343cfamr3234459e87.28.1729774771217;
        Thu, 24 Oct 2024 05:59:31 -0700 (PDT)
Date: Thu, 24 Oct 2024 13:59:29 +0100
From: Javi Merino <javi.merino@cloud.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 4/6] CI: Refresh the Debian 12 arm32 cross compile
 container
Message-ID: <lbwnnoofdxpjigteesd4bn7tdtmint7wh2rpu6e4zmpkqpzcwi@y6ycrhnpomjh>
References: <cover.1729760501.git.javi.merino@cloud.com>
 <762312efd58aa1b41cfcb5439f2fd35580b8bba6.1729760501.git.javi.merino@cloud.com>
 <Zxo0s72TBQtuWTXS@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zxo0s72TBQtuWTXS@l14>

On Thu, Oct 24, 2024 at 11:51:16AM +0000, Anthony PERARD wrote:
> On Thu, Oct 24, 2024 at 11:04:19AM +0100, Javi Merino wrote:
> > diff --git a/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile b/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
> > new file mode 100644
> > index 000000000000..bdc935706bfa
> > --- /dev/null
> > +++ b/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
> > @@ -0,0 +1,28 @@
> > +# syntax=docker/dockerfile:1
> > +FROM --platform=linux/arm64/v8 debian:bookworm
> > +LABEL maintainer.name="The Xen Project" \
> > +      maintainer.email="xen-devel@lists.xenproject.org"
> 
> Recent update of other dockerfile was repeating the "LABEL" intruction
> for each label, maybe we should continue to do that (which avoid the
> backslash at the end of lines).

Sure. I  will do that if there's a v2 (or for other dockerfiles).

> > +ENV DEBIAN_FRONTEND=noninteractive
> > +ENV CROSS_COMPILE /usr/bin/arm-linux-gnueabihf-
> 
> While the syntax "ENV VAR value" is supported, it's been discouraged by
> docker's doc (https://docs.docker.com/reference/dockerfile/#env). Also,
> here we have two ENV instructions with two different syntax, could you
> use the = for declaring CROSS_COMPILE as well?

I hadn't even noticed that they were using different syntax.  I'll use
ENV VAR=value from now on.

Thanks,
Javi

