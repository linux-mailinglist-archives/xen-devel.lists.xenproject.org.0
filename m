Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAECD93F76D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:19:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766783.1177304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRCr-00016K-O4; Mon, 29 Jul 2024 14:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766783.1177304; Mon, 29 Jul 2024 14:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRCr-000136-KD; Mon, 29 Jul 2024 14:18:33 +0000
Received: by outflank-mailman (input) for mailman id 766783;
 Mon, 29 Jul 2024 14:18:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYRCp-000130-N5
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:18:31 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d4a9f96-4db5-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 16:18:30 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-44fffca4fb7so13235761cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 07:18:30 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8126979sm41098401cf.7.2024.07.29.07.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 07:18:27 -0700 (PDT)
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
X-Inumbo-ID: 6d4a9f96-4db5-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722262708; x=1722867508; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Xqj9Ad9phWii7KRfvFhqzLIAqDK3JVN1IPltAXWtgs=;
        b=AMbbF3B3CMIwZ7xe4untwYNXANpTimuQKeKoUP/px+L2yGQw5uDAlc5eD7s6HT6RyX
         iWeyHhzbKmbIWEKL2AHP/rg9IAbjHhPPSwVQrbqlCFAC39VlA6yw8nl1wZWk79DMlTC+
         7i0Jahd0A+cvUydmPesrtYvO19yakX0hrUPtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722262708; x=1722867508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Xqj9Ad9phWii7KRfvFhqzLIAqDK3JVN1IPltAXWtgs=;
        b=CZKq2LHf8EXzv7WE5ZpxvBrbH/vxq+Vc2rmew+3bXzEe0TrBDbRcjcNdG9JeIaKOrW
         KwQUSnjArBdAr+0n/rKhSoJXEMzmww07Ro5Q5MAyeYwWtx8pGjTVcj78GWYdPEqHpqDU
         46hTW9wHJL2me/eya7k9EAC1d2GP79sLkO38EzkcYnw4hcoNBaJtK4emnz0C5o0yJ4Ei
         AoQeEyo9l5Vamm6H0rIIVCGR8hzIN1EsXYixEnFB2sEdOODpV2fiGTq/+aDtIwZbTL7Y
         tD3gthWYkUvJmSnECbYJm40JbyQUHt/VpUT/+8LS9l5wQXEvRzrUnGOTjwWQkHG+uKrz
         QdAA==
X-Gm-Message-State: AOJu0Yw3VXGIjFFKWHejbc5wceSC9qAeUpaxnPNC7aheqGVpk9XYsgao
	M7M2Na+97nL+ggLEKKcuCdOAeb+6Se0aVKg564xUDCGBA8TfGYnkIWwI4+2y6oQ=
X-Google-Smtp-Source: AGHT+IHx1QidPx2xSjYhPOTjOHySF+w7yFZbvpEKCpJ5noFL/glf6a+CnE7rsPMD0FvppQyTQvcwAg==
X-Received: by 2002:a05:622a:13d1:b0:44f:f6f0:7d2b with SMTP id d75a77b69052e-45004f5e7abmr105236071cf.53.1722262708269;
        Mon, 29 Jul 2024 07:18:28 -0700 (PDT)
Date: Mon, 29 Jul 2024 16:18:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 08/22] x86/mm: avoid passing a domain parameter to L4
 init function
Message-ID: <Zqeksmgq87ak7YID@macbook>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-9-roger.pau@citrix.com>
 <D322ACW6M240.2G3UQGXHR0XU0@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D322ACW6M240.2G3UQGXHR0XU0@cloud.com>

On Mon, Jul 29, 2024 at 02:36:39PM +0100, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 4:21 PM BST, Roger Pau Monne wrote:
> > In preparation for the function being called from contexts where no domain is
> > present.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/include/asm/mm.h  |  4 +++-
> >  xen/arch/x86/mm.c              | 24 +++++++++++++-----------
> >  xen/arch/x86/mm/hap/hap.c      |  3 ++-
> >  xen/arch/x86/mm/shadow/hvm.c   |  3 ++-
> >  xen/arch/x86/mm/shadow/multi.c |  7 +++++--
> >  xen/arch/x86/pv/dom0_build.c   |  3 ++-
> >  xen/arch/x86/pv/domain.c       |  3 ++-
> >  7 files changed, 29 insertions(+), 18 deletions(-)
> >
> > diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> > index b3853ae734fa..076e7009dc99 100644
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -375,7 +375,9 @@ int devalidate_page(struct page_info *page, unsigned long type,
> >  
> >  void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
> >  void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
> > -                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt);
> > +                       mfn_t sl4mfn, const struct page_info *perdomain_l3,
> > +                       bool ro_mpt, bool maybe_compat, bool short_directmap);
> > +
> 
> The comment currently in the .c file should probably be here instead, and
> updated for the new arguments. That said, I'm skeptical 3 booleans is something
> desirable. It induces a lot of complexity at the call sites (which of the 8
> forms of init_xen_l4_slots() do I need here?) and a lot of cognitive overload.
> 
> I can't propose a solution because I'm still wrapping my head around how the
> layout (esp. compat layout) fits together. Maybe the booleans can be mapped to
> an enum? It would also help interpret the callsites as it'd no longer be a
> sequence of contextless booleans, but a readable identifier.

We have the following possible combinations:

          RO MPT  COMPAT XLAT  SHORT DMAP
PV64        ?         N             Y
PV32        N         Y             Y
HVM         N         Y             N


So we would need:

enum l4_domain_type {
    PV64,
    PV64_RO_MPT,
    PV32,
    HVM
};

I can see about replacing those last 3 booleans with the proposed
enum.

Thanks, Roger.

