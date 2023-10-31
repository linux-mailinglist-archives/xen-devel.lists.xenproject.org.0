Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC267DCD25
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 13:45:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625680.975187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxo6y-0000hx-HP; Tue, 31 Oct 2023 12:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625680.975187; Tue, 31 Oct 2023 12:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxo6y-0000ff-Eh; Tue, 31 Oct 2023 12:44:48 +0000
Received: by outflank-mailman (input) for mailman id 625680;
 Tue, 31 Oct 2023 12:44:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rkuq=GN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qxo6x-0000fZ-3f
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 12:44:47 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4557f0e0-77eb-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 13:44:46 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507bd64814fso7731313e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 05:44:46 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a19f60a000000b00500d1a72734sm199906lfe.130.2023.10.31.05.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 05:44:44 -0700 (PDT)
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
X-Inumbo-ID: 4557f0e0-77eb-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698756285; x=1699361085; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Wx5M6oncL7DmS1W5OU+2HUNMfWdXinZCMx60A8wEAE=;
        b=Xv0YLl2Y1WHWHAhDOWzgJKD6m2nwLkl/2b6t93WItdL5EpCXf5ZqkPGdbifUIeL3J9
         BKOTZA/GKFy7yXVOIgiswIIWouBSlOukQJTPmFWMT6ia/cJIlTCYNNlOI6Rs+nd+rfm3
         AyaGr+TOWs5A0OkxzZNE0Xe7uMUqzGy88lrWkBE9ruQpX9IJx+ORZ2asEHRK+vH8T4Le
         XwBcQjQ3TB8bg80G24ooQtkNM/S2Zkj/UA8hj8Tijx4PXhqgq8v9aXEn8hOZPGdk4I0N
         +MwosDfon6C1l9nWHQNW083M/ouvy/1GK5CCm9ckhTSRw2r9n+ECHMXTw2guZzYsmOSQ
         uTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698756285; x=1699361085;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Wx5M6oncL7DmS1W5OU+2HUNMfWdXinZCMx60A8wEAE=;
        b=LdHJBITfbzA8wfudwm+NdNLS8lwj4E4q5g3SpgxRA72903Q9nsawXv+nlSf+OBrEz4
         J0n/vY4NLjgW/AbbcWrT+vDYeApoxpzd7B4Rpl9jMYlY7y07zPo41PjlWCYl+mUu9DZm
         EerACa9wKydhtKtf+TZH9e/RZXjtswYL7O9OXwVMn8rRYqO/82eNA/eI2P2PJol8dukP
         ZqONItGD5mJ2ixjND+EHOT6akdZtp122FsO0yJZq7onyzNShZblt68tUoeSdZPh9CFF8
         JT6qEHp2o0Mhkib658pxZauGMwiLSg+mDgtWskJ6tzmgWpiomWmd6FlUmg1IVkmwBK75
         0QKA==
X-Gm-Message-State: AOJu0Yyz8geCciceueIcGIbCcgpqv3KY+CVbQc2zyBjinjZQyku749D3
	Veluy20wYTTVe6geDYCGw/I=
X-Google-Smtp-Source: AGHT+IEwmcXxsgL7l7qrksafBqswnblm16F228jwgu8xiQLj/HUvVlvRiD5ppLxfjWWnkhtd+IbY3g==
X-Received: by 2002:a05:6512:1081:b0:500:daf6:3898 with SMTP id j1-20020a056512108100b00500daf63898mr10055638lfg.26.1698756285273;
        Tue, 31 Oct 2023 05:44:45 -0700 (PDT)
Message-ID: <eca01dd66669a96c437c176ea6955ac0bdfc4edb.camel@gmail.com>
Subject: Re: [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 31 Oct 2023 14:44:40 +0200
In-Reply-To: <a826292a-44de-c149-0831-01578d9b38c3@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <597a482c70fef196e245a5d898ea6314a0c479ca.1694702259.git.oleksii.kurochko@gmail.com>
	 <d4dca6d7-ac54-beac-26fc-5eaf80783a73@suse.com>
	 <d1e5d5fed5732274b2d4582b7aac4c3c2151d30a.camel@gmail.com>
	 <a826292a-44de-c149-0831-01578d9b38c3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-10-30 at 17:43 +0100, Jan Beulich wrote:
> On 30.10.2023 17:34, Oleksii wrote:
> > Hello Jan,
> >=20
> > On Thu, 2023-10-19 at 11:55 +0200, Jan Beulich wrote:
> > > On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/include/asm-generic/pci.h
> > > > @@ -0,0 +1,18 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +#ifndef __ASM_GENERIC_PCI_H__
> > > > +#define __ASM_GENERIC_PCI_H__
> > > > +
> > > > +struct arch_pci_dev {
> > > > +};
> > > > +
> > > > +#endif /* __ASM_GENERIC_PCI_H__ */
> > >=20
> > > While more involved, I still wonder whether xen/pci.h could also
> > > avoid
> > > including asm/pci.h when !HAS_PCI. Of course there's more than
> > > just
> > > the
> > > #include which then would need #ifdef-ing out.
> > >=20
> > > Jan
> >=20
> > It looks like we can do that but only one question should be
> > resolved.
> > In ARM case, in <asm/pci.h> there is !HAS_PCI branch:
> >=20
> > #else=C2=A0=C2=A0 /*!CONFIG_HAS_PCI*/
> >=20
> > struct arch_pci_dev { };
> >=20
> > static always_inline bool is_pci_passthrough_enabled(void)
> > {
> > =C2=A0=C2=A0=C2=A0 return false;
> > }
> >=20
> > struct pci_dev;
> >=20
> > static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
> >=20
> > static inline int pci_get_host_bridge_segment(const struct
> > dt_device_node *node,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t *segment)
> > {
> > =C2=A0=C2=A0=C2=A0 ASSERT_UNREACHABLE();
> > =C2=A0=C2=A0=C2=A0 return -EINVAL;
> > }
> >=20
> > static inline int pci_get_new_domain_nr(void)
> > {
> > =C2=A0=C2=A0=C2=A0 ASSERT_UNREACHABLE();
> > =C2=A0=C2=A0=C2=A0 return -1;
> > }
> >=20
> > #endif=C2=A0 /*!CONFIG_HAS_PCI*/
> >=20
> > And if is_pci_passthrough_enabled(), arch_pci_init_pdev() is used
> > by
> > all architrectures but pci_get_host_bridge_segment() and
> > pci_get_new_domain_nr() is ARM specific.
> > Does it make sense to add them to <xen/pci.h> and ifdef them?
>=20
> Counter question: Is the arch_pci_init_pdev() stub actually needed?
> The sole caller looks to be in a file which is only built when
> HAS_PCI=3Dy.
You are right. It seems that there is no need for pci_init_pdev() stub.

>=20
> For the Arm-only stubs (which are called from Arm-specific code
> afaics)
> all it would take is that the respective .c files include asm/pci.h
> (possibly alongside xen/pci.h).
We can do in that way.

Thanks.

~ Oleksii

