Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108757DBDF9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625308.974492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVDW-000120-FC; Mon, 30 Oct 2023 16:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625308.974492; Mon, 30 Oct 2023 16:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVDW-0000zA-CT; Mon, 30 Oct 2023 16:34:18 +0000
Received: by outflank-mailman (input) for mailman id 625308;
 Mon, 30 Oct 2023 16:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFdh=GM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qxVDU-0000z2-OF
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:34:16 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a749fa4-7742-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 17:34:15 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5082a874098so4535167e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 09:34:15 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ep13-20020a056512484d00b00502ae6b8ebcsm1494412lfb.304.2023.10.30.09.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 09:34:14 -0700 (PDT)
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
X-Inumbo-ID: 2a749fa4-7742-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698683655; x=1699288455; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GI8n9+UuQ5kno4Bg3saXjQ5HUWMHSj5s7RxPryZtNQM=;
        b=ZnXs8wMAUWwlHaYm4N74nmis+8I79eYJplomG9G0oZvBcKPb6VmWEgfOnaoWc0tFwG
         Ln1jg7FDhrazRFk6nlJ1CiKNBvudvdsEvrZcFk9j/y2JCUE0TtGM+GA9zO9deQjUF3AB
         yTt78r7BFF+wFdSGC5TJQHa2mXhAaq4/NfxNKlEDMljDKrEWsNyOCJ88fAXSwzMynuIL
         sJVgOJGhVbFtJN5DbK71xdNwCI0VYEXITYCU2Xlr4jGPnf9UnW8ELMbRFnSKeFqa15Px
         tEsC39dvxswS4UGI0IH9UZXxfKRsmc07U7QQ1Msq/RIKZlDmscpu5JGCcWKN26ja9Hao
         KelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683655; x=1699288455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GI8n9+UuQ5kno4Bg3saXjQ5HUWMHSj5s7RxPryZtNQM=;
        b=FSClwb4a7Afu9eMVw1b/Rzkb8mRJEJrJ9RplfEeNGuuA220ZimpY4iSEjNepanbPCb
         R7alKHmrD7/Na3dF7DZVnUTgiRczeEqyRfy+VPp/UtJZDmv66bZtU/oHnIM4WDBWbftk
         PmA6eLIMmG+t512E1D9cdajqgzfI7EM6W9KSk1wfsuvLHo9a2yWzAqNRToVnTQsd5BrB
         jd/VqkbFLYEzNuf7XPb9EHrX+YFtJSqEy/pOdMPe/iqMdGthJCkJmANGo62x8QoG08CZ
         DqpVBHbJeLfBYou53+MAdDZzyE3y5vnD5JRe94UQ5hDwAajdDD28+tJUwFT9EJ1aeNC2
         fCKA==
X-Gm-Message-State: AOJu0YxlYxVIxxRzcCqHbKLoXndugd8cB1YHmP8hqrpUAg4cbeZd/+sY
	hwYWFs8M+Jo2IWBH2R66A94=
X-Google-Smtp-Source: AGHT+IEnZGIXHJOAazhrdrDijJ4CvGNjyeADfIKNYO6ZZpuNU/6NEhTG2nNyAeIJzV9t+7uC9O1nMA==
X-Received: by 2002:ac2:5104:0:b0:507:a624:3f36 with SMTP id q4-20020ac25104000000b00507a6243f36mr7305541lfb.11.1698683655020;
        Mon, 30 Oct 2023 09:34:15 -0700 (PDT)
Message-ID: <d1e5d5fed5732274b2d4582b7aac4c3c2151d30a.camel@gmail.com>
Subject: Re: [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 30 Oct 2023 18:34:14 +0200
In-Reply-To: <d4dca6d7-ac54-beac-26fc-5eaf80783a73@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <597a482c70fef196e245a5d898ea6314a0c479ca.1694702259.git.oleksii.kurochko@gmail.com>
	 <d4dca6d7-ac54-beac-26fc-5eaf80783a73@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hello Jan,

On Thu, 2023-10-19 at 11:55 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/pci.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_PCI_H__
> > +#define __ASM_GENERIC_PCI_H__
> > +
> > +struct arch_pci_dev {
> > +};
> > +
> > +#endif /* __ASM_GENERIC_PCI_H__ */
>=20
> While more involved, I still wonder whether xen/pci.h could also
> avoid
> including asm/pci.h when !HAS_PCI. Of course there's more than just
> the
> #include which then would need #ifdef-ing out.
>=20
> Jan

It looks like we can do that but only one question should be resolved.
In ARM case, in <asm/pci.h> there is !HAS_PCI branch:

#else   /*!CONFIG_HAS_PCI*/

struct arch_pci_dev { };

static always_inline bool is_pci_passthrough_enabled(void)
{
    return false;
}

struct pci_dev;

static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}

static inline int pci_get_host_bridge_segment(const struct
dt_device_node *node,
                                              uint16_t *segment)
{
    ASSERT_UNREACHABLE();
    return -EINVAL;
}

static inline int pci_get_new_domain_nr(void)
{
    ASSERT_UNREACHABLE();
    return -1;
}

#endif  /*!CONFIG_HAS_PCI*/

And if is_pci_passthrough_enabled(), arch_pci_init_pdev() is used by
all architrectures but pci_get_host_bridge_segment() and
pci_get_new_domain_nr() is ARM specific.
Does it make sense to add them to <xen/pci.h> and ifdef them?

~ Oleksii


