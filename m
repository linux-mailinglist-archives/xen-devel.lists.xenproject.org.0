Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B720AADC328
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 09:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017814.1394816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQcF-0000Fx-PR; Tue, 17 Jun 2025 07:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017814.1394816; Tue, 17 Jun 2025 07:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQcF-0000Cv-MO; Tue, 17 Jun 2025 07:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1017814;
 Tue, 17 Jun 2025 07:20:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VPhx=ZA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRQcE-0007U6-Kw
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 07:20:18 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 849fb7d6-4b4b-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 09:20:17 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso4641510f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 00:20:16 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e16b425sm164099065e9.34.2025.06.17.00.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 00:20:15 -0700 (PDT)
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
X-Inumbo-ID: 849fb7d6-4b4b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750144816; x=1750749616; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KgWoRbkLxlLo+X13Ky07ieYTngN+X9YzX1O9bj+yzYM=;
        b=BpCgj2MuJSyqK7fHTjsrX5znhCSxzVi1G64MpCSNefU2Aq/2olC9YhHS711r/xTHvZ
         pdpTsjAMyo1JCUdvOsh2l/kWbGMA5HyRKcjd7d1NyGnhJScavyHuCqOGNvJhWkwl3ETB
         Jcey4CU8dqwHrwzzMSirhKGNHbUgo4cpiw0Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750144816; x=1750749616;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgWoRbkLxlLo+X13Ky07ieYTngN+X9YzX1O9bj+yzYM=;
        b=e2P6ZCEb68psxN2bbqs8tmBQm+7PCL6e1c1MmMc6kWz14B77niEIdyNfND/36hXKzo
         fs49C6FojPixbnh8YWYCfzAfEYDVayBTaOiScvWvVmVqE6fFXpPVtvrHpWYOhV/462gD
         wI+2137eYi5CHTAyKof3+AZFZfk2QR/qDEyyDTnjE/E4XvMejfG0JdraLS7X8rP0eimd
         0Q4I6/O8ijguhVqosJJCQ+LIz+0oxK3gFNf7bkzNx0qNxhDHimU/0Nv5xYaPcvvPg5Cl
         mZHyRjIVFbpPMtQWgo/elDaAhW9NicwQpqGd+pFHCnmYEI6dCirJB1Q1qvQgiMqQclab
         zuMQ==
X-Gm-Message-State: AOJu0YwYmdNB1ACyjXhYd8CrRfZbUeu8N6kfcrhQ+AWXkSNFoW/Hy8H/
	XrDVONg/U2hqg3aeAJm3xps6JhtFzrF3tIcqU30FEjTrPJuz3afFoN3CjbTCYncNG6A=
X-Gm-Gg: ASbGncsqZqTvI6NTv6vIg5W4NlZSz+sEbJnk5SglAPnzoRd0K3g8VvVQEWHZNsbk6kn
	x16AuWyCUW8MSca+xumDxfBQajl7K8pvAe3bK5n5FFI9ZJj2rYjUcOl0c1AC6+vIagKazTI5v5b
	UkNI2OGXCNATv1VTQHOPbs34cgk+Lbz8WntxSn/EwgrOuBFCgwrlszeTdtsq6IQvrzmaqkmsMC0
	xld2Zxrc5zsSQyTGU+VWN6/E6FjRxTnKjDs5nQNcHf8lfLpmZsUpBL03rQMCyetPX7bjDvWnbWd
	cltl0FaM6TcOGFweUqTvCYeVJG73vOFj3kJJ68Fz26dC6uFwjB+zyKT6GTfYLmYUOJ20PcV1dKZ
	3kHqJ48r/FNro07kyynV098TQ1jdooQ==
X-Google-Smtp-Source: AGHT+IG2AxQJSRkyM98/mvsz0ESKrdJqmbcO+tm2Qr5g00asmiIGkso15oBBB4DDU4D9d6HqfOBSig==
X-Received: by 2002:a05:6000:4308:b0:3a4:cfbf:519b with SMTP id ffacd0b85a97d-3a572c455d4mr10586378f8f.44.1750144816295;
        Tue, 17 Jun 2025 00:20:16 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:20:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org,
	teddy.astie@vates.tech, dmukhin@ford.com
Subject: Re: [PATCH v7] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aFEXL5kbhaIXi-Xc@macbook.local>
References: <20250610144500.3176661-1-dmukhin@ford.com>
 <aFAkIqMPyMLAIBh0@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFAkIqMPyMLAIBh0@macbook.local>

On Mon, Jun 16, 2025 at 04:03:14PM +0200, Roger Pau Monné wrote:
> On Tue, Jun 10, 2025 at 02:45:12PM +0000, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Rewrite emulation_flags_ok() to simplify future modifications.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v6:
> > - simplified checks for PV further
> > 
> > Link to v6: https://lore.kernel.org/xen-devel/20250610004216.3012253-1-dmukhin@ford.com/
> > Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1862559089
> > ---
> >  xen/arch/x86/domain.c | 78 +++++++++++++++++++++++++++++++++----------
> >  1 file changed, 60 insertions(+), 18 deletions(-)
> > 
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 7536b6c871..fdbd064ebf 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -743,32 +743,74 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >      return 0;
> >  }
> >  
> > +/*
> > + * Verify that the domain's emulation flags resolve to a supported configuration.
> > + *
> > + * This ensures we only allow a known, safe subset of emulation combinations
> > + * (for both functionality and security). Arbitrary mixes are likely to cause
> > + * errors (e.g. null pointer dereferences).
> > + *
> > + * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EMU_XXX
> > + * symbols.
> 
> Not sure if it's worth expanding the sentence a bit to add the reason
> why X86_EMU_XXX should be used (so that we take build-time config
> options into account for short-circuited emulations).

With this comment adjusted as you have in v8:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

