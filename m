Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A52972C9C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795124.1204274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snweA-0002Ib-GR; Tue, 10 Sep 2024 08:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795124.1204274; Tue, 10 Sep 2024 08:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snweA-0002GN-CO; Tue, 10 Sep 2024 08:54:50 +0000
Received: by outflank-mailman (input) for mailman id 795124;
 Tue, 10 Sep 2024 08:54:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snwe8-0002G5-86
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:54:48 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54b837bd-6f52-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 10:54:47 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so390569866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 01:54:47 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2583fc73sm449402266b.34.2024.09.10.01.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 01:54:44 -0700 (PDT)
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
X-Inumbo-ID: 54b837bd-6f52-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725958487; x=1726563287; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=faZw7fsfvn95pRaFiiD3m18SU0vj79E9mvhA6z6oF2A=;
        b=XzUIlB9IMofx1AhJ4VgO54G+Nq4CtHh4nvJjIdeZmHukuZYynDn7M8/dbAU4szuVxd
         9gKX2x0J319SW0uY2sJuNN19rtsbzcgWRwGL9G8CJO0Kg94lfldSQStg9cBnH+5e/LYw
         LF1rUQKerwov4nC+zKUbGKkH9xcVONQPSreL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725958487; x=1726563287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faZw7fsfvn95pRaFiiD3m18SU0vj79E9mvhA6z6oF2A=;
        b=JOygn4kXXJTY6vtPaYHM+cjuz4QsysyZKr6pD+kB8XEl3H7/G4PZDZ0wh/nZ3AVEzi
         EJZWwQJqo8hcl4Ui0BPAiaVrSvFAG10SlQjPQj0YlPYNByPFi8ce0+Gei0aIy9i19I1W
         q2l7NiwgzMb5+Sl9kM5sZb3uW4PByNfa32ahltErASGAKo0Y6TpnxTkgyV+mxD07yfDA
         cVyXiT48AuJMGzoZEVgoueOBTSHvS243nlANgABzQO05plAAV7/qv+wUHFmYWQTftzkd
         bQ0nSjUeueUbmUyYO+NKvMfMVlxB9O2rowBCAlHfTBAfCTcuejB69oIc5VIEiRG3iVB3
         vD6w==
X-Forwarded-Encrypted: i=1; AJvYcCV0lnQpeDFDUhCtC/cq0GJIozNXxTYHMypv5mvtYx0msdP3XuKYp8C8YkkSnnDSn7rkjx8AB4WVKi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVFOrOM2LhomOanWut5zzaMtNiJ5BZh7R1t1TDpkotr0nydN7t
	2aghE4rAP2EU9z514IgMGUe54/U2sIb67wBI5INrzKSx9Thfx90fVKAKpwQ/0Qw=
X-Google-Smtp-Source: AGHT+IFBSfAWEfDjB7TS+vkJJhsVK7waLMD4/bgJ4tWmcXiTUpnLlvS2uU5g33XBQCa7xclBzSp/sw==
X-Received: by 2002:a17:906:730a:b0:a86:68a1:6a08 with SMTP id a640c23a62f3a-a8ffab8346amr4290366b.29.1725958486209;
        Tue, 10 Sep 2024 01:54:46 -0700 (PDT)
Date: Tue, 10 Sep 2024 10:54:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 04/22] x86/mm: ensure L4 idle_pg_table is not modified
 past boot
Message-ID: <ZuAJU4ODitZ8VEJV@macbook.local>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-5-roger.pau@citrix.com>
 <550c6f14-228d-45b4-9146-8d950082b574@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <550c6f14-228d-45b4-9146-8d950082b574@suse.com>

On Tue, Aug 13, 2024 at 05:54:54PM +0200, Jan Beulich wrote:
> On 26.07.2024 17:21, Roger Pau Monne wrote:
> > The idle_pg_table L4 is cloned to create all the other L4 Xen uses, and hence
> > it shouldn't be modified once further L4 are created.
> 
> Yes, but the window between moving into SYS_STATE_smp_boot and Dom0 having
> its initial page tables created is quite large. If the justification was
> relative to AP bringup, that may be all fine. But when related to cloning,
> I think that would then truly want keying to there being any non-system
> domain(s).

Further changes in this series will add a per-CPU idle page table, and
hence we need to ensure that by the time APs are started the BSP L4 idle
page directory is not changed, as otherwise the copies in the APs
would get out of sync.

The idle system domain is indeed tied to the idle page talbes, but the
idle vCPU0 (the BSP) directly uses idle_pg_table (no copying), and
hence it's fine to allow modifications of the L4 idle page table
directory up to when APs are started (those will indeed make copies of
the idle L4.

> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -5023,6 +5023,12 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
> >          mfn_t l3mfn;
> >          l3_pgentry_t *l3t = alloc_mapped_pagetable(&l3mfn);
> >  
> > +        /*
> > +         * dom0 is build at smp_boot, at which point we already create new L4s
> > +         * based on idle_pg_table.
> > +         */
> > +        BUG_ON(system_state >= SYS_STATE_smp_boot);
> 
> Which effectively means most of this function could become __init (e.g. by
> moving into a helper). We'd then hit the BUG_ON() prior to init_done()
> destroying the .init.* mappings, and we'd simply #PF afterwards. That's
> not so much for the space savings in .text, but to document the limited
> lifetime of the (helper) function directly in its function head.

IMO the BUG_ON() is clearer to debug, but I won't mind splitting the
logic inside the if body into a separate helper.

> I further wonder whether in such a case the enclosing if() wouldn't want
> to gain unlikely() at the same time.

Yes, I can certainly add that.

Thanks, Roger.

