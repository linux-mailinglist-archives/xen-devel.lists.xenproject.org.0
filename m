Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C49F8932
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 02:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861583.1273550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tORZu-0003aA-7D; Fri, 20 Dec 2024 01:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861583.1273550; Fri, 20 Dec 2024 01:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tORZu-0003YZ-3w; Fri, 20 Dec 2024 01:13:18 +0000
Received: by outflank-mailman (input) for mailman id 861583;
 Fri, 20 Dec 2024 01:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42Wo=TN=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tORZs-0003YT-Je
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 01:13:16 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95c05bb6-be6f-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 02:13:15 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1734657190105953.2702589204604;
 Thu, 19 Dec 2024 17:13:10 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e4a6b978283so2087469276.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 17:13:09 -0800 (PST)
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
X-Inumbo-ID: 95c05bb6-be6f-11ef-a0d8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1734657192; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YKvlKlLA/OsXWuewv+PPH8Xt1abTzeMxZ+WX/ZAFgUUbisLi+oRzMp1WS8jrmmKEuHrTgoeLekO0cyHSz19vmTqOEF1Da7BjtCbTv4G9cfpWkQeWVe4c1m+RBViQ5pGCyYcUHA+wi1gacxTV8nyRbstAytW6la/S1mx9MLWwDWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734657192; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BDy45s2GE6WB60raklLil7NEQFGJcGEiXJs7NnWN944=; 
	b=gI/VUpAnqpfGxMny2hTKauYPNDa3xzkJ2SLFmOXasNIYaom2g5CMiuadRhKCIoiuPRB+Zbo6m5Pwv0Qv8cV8kXSULJFpBsljCh6wlsarosebHBBHRX3mrav6sOQTKjiPPml5vvAdw3lhfoChkh+WQIImjujpiRmoIZteTYvEAeM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734657192;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=BDy45s2GE6WB60raklLil7NEQFGJcGEiXJs7NnWN944=;
	b=gco+wsKqGYz90CYDxneVlPqPtaepoXwf04ENbGcWycfD+FXmVrVQdjoQgMl3moMh
	jYVgYBQFAGOvFPey2wz+c1BBPJwg/2FqOCT4cBNmB+C8GjY4sM5oT+KIo6D08sUpUSZ
	K/ksJmFvI3+NyMEGXtXiWFkonF0Pbo94MpX+E9ms=
X-Gm-Message-State: AOJu0YzCCSm2uopQGnVWUVZ7aX/uSsTXLeTlSj+HI/dkbTrYP/8dkd3x
	ke2hQMc71WiZOF10J+x/TVpWVahAlW6WWghNfNRqnZ0eUU+yBS/I1R+1ejnbffCoIeybea8p6zO
	sgVIP6qHQbYf9L5rJE5W6xzCK8FA=
X-Google-Smtp-Source: AGHT+IHsya+yY7zOzXQQK8lNsRHTXhGgW0yFUIq9HnLGgh620KIZn/RWee2IWz369nUH4wF9mWtc1dWhxmHcS0anCT8=
X-Received: by 2002:a05:690c:734a:b0:6ea:7fa3:ab22 with SMTP id
 00721157ae682-6f3f7e1f3e3mr7157867b3.8.1734657189225; Thu, 19 Dec 2024
 17:13:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1734631969.git.w1benny@gmail.com> <95580d02390056ea10eb80439f9d3ef9d2297ecc.1734631969.git.w1benny@gmail.com>
 <CABfawhnuVzFof73bLa-TT1bk-sX7X=XCj6TJJGmWna3apMzhTA@mail.gmail.com>
In-Reply-To: <CABfawhnuVzFof73bLa-TT1bk-sX7X=XCj6TJJGmWna3apMzhTA@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2024 20:12:32 -0500
X-Gmail-Original-Message-ID: <CABfawhkLwj=acjQeHr_M=3_2OzLf+C3k9Qxk+76UWr+13t-tFA@mail.gmail.com>
Message-ID: <CABfawhkLwj=acjQeHr_M=3_2OzLf+C3k9Qxk+76UWr+13t-tFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86: Add Support for Paging-Write Feature
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

> > diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> > index 21728397f9..5ad78ae4b5 100644
> > --- a/xen/arch/x86/mm/p2m-ept.c
> > +++ b/xen/arch/x86/mm/p2m-ept.c
> > @@ -176,6 +176,10 @@ static void ept_p2m_type_to_flags(const struct p2m_domain *p2m,
> >              break;
> >          case p2m_access_rwx:
> >              break;
> > +        case p2m_access_r_pw:
> > +            entry->w = entry->x = 0;
> > +            entry->pw = !!cpu_has_vmx_ept_paging_write;
>
> I don't see ept_entry_t having a pw field. What's the deal there?

Never mind, I see it in the 1/2 patch, for some reason my mail client
bundled 2/2 under the cover email so I read the patches out-of-order.

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

