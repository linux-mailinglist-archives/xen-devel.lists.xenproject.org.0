Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453BF809F56
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650483.1016064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXAX-0007Bp-Ez; Fri, 08 Dec 2023 09:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650483.1016064; Fri, 08 Dec 2023 09:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXAX-000798-CL; Fri, 08 Dec 2023 09:29:13 +0000
Received: by outflank-mailman (input) for mailman id 650483;
 Fri, 08 Dec 2023 09:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBXAW-000792-8U
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:29:12 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ea3b9a7-95ac-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:29:11 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54f4fa5002cso479326a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:29:11 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h28-20020a50cddc000000b0054c72a6a07csm658637edj.84.2023.12.08.01.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:29:10 -0800 (PST)
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
X-Inumbo-ID: 3ea3b9a7-95ac-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702027751; x=1702632551; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JMjA1wtJJqbSWKD0AMloJDqfI3uGTSgWvPpQB3f2m4k=;
        b=l7/6ZRRuL0w/olrrMMWw0RJelMt4LP+frpafcDiKkgnHVaCzLbZlS+6XLEgIOjzvmi
         Oo/Z8XzMc2JuP6EvTc69S0T2f0tBqQ+KV/0Z3UCgqxXUSEOQlf0xV8Y26f3DD9AJIVTN
         z0LrtV3KiCc7fX8mjJXmFvCX/G+XNaK/u0iblzOTDBDJVG43DoB01OK7OADjjb4MuVTB
         4QAS9RVVSexwkggAcAx+UDYuVO0Jzy2iE2M4/iYC5KodvFNR3D21g2GTxSsc/ws/v0BI
         JtEDWrzXKRm+2j4uzPboIQt1hA4kZIEP4VZWrsnWPBnr5oTejmyOrzKiFNBYOVylRNAQ
         Sy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702027751; x=1702632551;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JMjA1wtJJqbSWKD0AMloJDqfI3uGTSgWvPpQB3f2m4k=;
        b=sMs9Y7Bd/ufTsBCfrQyV0Kl+MFy79QqwMCKmSuXRw0TFRj+y/JJmxEKHbGymPNW7ev
         sw4N3gBq+pLxkzwYk8j3/+O3MsfAHvTQHXUbCxQ2qftnorkqlvX8eqft30GfAVvwxE6L
         IRNUh1CFPDqB/XRWdiQgQka6IdwVabsI/9mOWrAyHeRaw0MZMXtjamA5nQR9noLNlJyV
         2OIFrZdgzdwzQNXvKPGJiyVSDcWdOVftBIDwKMo+tjk+7k+hkAsEc1AmafMxZQOZW2j6
         hcYUyTWdSCuLew4NVdKy2MTiQ4fuz+I0qDOq4Z0x6Vh7WqmDvTiH+/sHvWFNCJtadzX/
         b+1Q==
X-Gm-Message-State: AOJu0Yy5VsUniR7wtjW2TGLNNt2YJSLjJN54d4po0q9WT2482nG2x3Pi
	9B2QZLYxXmpajVTgld2G8T8=
X-Google-Smtp-Source: AGHT+IEM809BkAsjafgHqTC7TqRqM9CAnTzoNKn37+iR6rBDkU3+2j+7xEjJR3Mtw5ju+z4a5Z38pQ==
X-Received: by 2002:aa7:d3c1:0:b0:54c:f2ff:a540 with SMTP id o1-20020aa7d3c1000000b0054cf2ffa540mr2636469edr.67.1702027750654;
        Fri, 08 Dec 2023 01:29:10 -0800 (PST)
Message-ID: <cdc3fe19d7e9e60c348eb1c25c716ecb9486a664.camel@gmail.com>
Subject: Re: [PATCH v2 10/39] xen/riscv: introduce asm/iommu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 08 Dec 2023 11:29:09 +0200
In-Reply-To: <ca13b1b0-8b96-47b0-abc5-9711f96ccca0@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <68be3d368bf6ed96b0bb53b51a2fd07696cb338d.1700761381.git.oleksii.kurochko@gmail.com>
	 <ca13b1b0-8b96-47b0-abc5-9711f96ccca0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 15:22 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/iommu.h
> > @@ -0,0 +1,7 @@
> > +#ifndef __ASM_RISCV_IOMMU_H__
> > +#define __ASM_RISCV_IOMMU_H__
> > +
> > +struct arch_iommu {
> > +};
> > +
> > +#endif /* __ASM_IOMMU_H__ */
>=20
> Instead of adding this header, didn't we discuss to make the #include
> in
> xen/iommu.h depend on CONFIG_HAS_PASSTHROUGH? Also - no SPDX or
> footer
> here?
We had discussion about some stuff in device.h, but we can apply it
here too. Only to place will be needed to update:


+ #ifdef CONFIG_HAS_PASSTHROUGH
#include <asm/iommu.h>
+ #endif

#ifndef iommu_call
# define iommu_call(ops, fn, args...) ((ops)->fn(args))
# define iommu_vcall iommu_call
#endif

struct domain_iommu {
+ #ifdef CONFIG_HAS_PASSTHROUGH
    struct arch_iommu arch;
+ #endif
...

I'll do that in the next iteration of this patch series.

Thanks.

~ Oleksii


