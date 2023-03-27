Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BA6CA1B0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515149.797736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkR9-00059d-IS; Mon, 27 Mar 2023 10:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515149.797736; Mon, 27 Mar 2023 10:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkR9-000578-FR; Mon, 27 Mar 2023 10:50:51 +0000
Received: by outflank-mailman (input) for mailman id 515149;
 Mon, 27 Mar 2023 10:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pgkR8-000570-Ia
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:50:50 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bf04922-cc8d-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 12:50:48 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id e21so8474216ljn.7
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 03:50:48 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a2e9a8f000000b002986d2069d4sm4593435lji.82.2023.03.27.03.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 03:50:47 -0700 (PDT)
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
X-Inumbo-ID: 3bf04922-cc8d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679914248;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pfqjTaL4h0eQlM3AuBER3BP/jmEhQxsxj2RahDI/t4E=;
        b=mFLWOsD+oN8Ie70dvIK3Meg6qLKeOSfMfQGUEgpNSeLW+It4GAKXAIfJdpXKn4valE
         lvZEa3kEbRpY1iH9iVFU3IR/7SLDgrNi4xMDIKHcZ2WYcuo/DnfaPSFWxrRpGeSWyejc
         36dfTjheQy8+pbn12xu5pemcB9NPZmjdNWydRkm+jjSMndZs+lWAO0ZvV6fwv3JR/Gf2
         tk9TzsftY8oLw6v3LfcA8ApvQOdnwXhJSO6c063+lZUnBEJhBsl57B6RMLpmarBpnQ4M
         kJ8SRgpBqZo8snhYSgn6zT3JIcPtzX9tJGe4ItaXIqf3xBzbPOSwV31Wlt2QSJPrn6xR
         g4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679914248;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfqjTaL4h0eQlM3AuBER3BP/jmEhQxsxj2RahDI/t4E=;
        b=D3Qn0AGRJ+IeyPCOPrV4jzGn/dwtgkDHwUoj9bMTTJHeUbCU09uoo646GztznhjpOL
         65mC9r3LwFqiFe3J+CphLmeNHd64kcfLeWMyFFyHC/uVSiKphDjwdHGrrNtJSBHYvUIw
         64hA8A0t+mXGcRaUUkI6yfe6yGnp7CZExsmtRop1YfqTI/H2TaZGtUG14C+vsiL4ZwGQ
         3fQOZoQmBysy2euc7SCBWGo97jY77QgA183dP5ZGsFlprO6yC26ZPY5dTXaHgw7gP5Oa
         jfUDN8Pbs5h9bgEVYmW3cW+20zms/IfmOAUJma7GjGR8SeCn4JMxuI/YDFd33hFbjtTA
         OFrg==
X-Gm-Message-State: AAQBX9cHBvTlWBlQK+GKxLdbPeCKE0hKwAzijVsCQELMb32Cqde2ybVl
	gFIFfbhnzT1Pjj35tuuyNb4=
X-Google-Smtp-Source: AKy350aIYTdK32XQ1b3UXQxbWk67Zi5ytnw0ZMb/ivEFIIfawq1QP7dR85w9+0bLVDavkeZcxVF+2w==
X-Received: by 2002:a2e:a163:0:b0:29b:d436:5c8a with SMTP id u3-20020a2ea163000000b0029bd4365c8amr3550076ljl.3.1679914248133;
        Mon, 27 Mar 2023 03:50:48 -0700 (PDT)
Message-ID: <dd8b038c00fba91d0e50d4bb8c98466dfd37ef01.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Mon, 27 Mar 2023 13:50:47 +0300
In-Reply-To: <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
	 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
	 <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hello Julien,

On Tue, 2023-03-21 at 17:58 +0000, Julien Grall wrote:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level0 table */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(&zeroeth=
[index0]) )
>=20
> On the previous version, you said it should be checked for each
> level.=20
> But here you still only check for a single level.
>=20
> Furthermore, I would strongly suggest to also check the valid PTE is
> the=20
> same as you intend to write to catch any override (they are a pain to
> debug).
>=20
Do you mean that I have to get a virtual address, extract the page
table index bits from it, traverse the page table hierarchy to locate
the PTE for the virtual address and the compare the gotten PTE address
with zeroeh[index0]?

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Update level0 table */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zer=
oeth[index0] =3D paddr_to_pte((page_addr - map_start)
> > + pa_start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zer=
oeth[index0].pte |=3D flags;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Point to next page */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_addr +=3D XEN_PT_LEVEL=
_SIZE(0);
> > +=C2=A0=C2=A0=C2=A0 }
> > +}

~ Oleksii

