Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6682CB2DB11
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 13:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087328.1445408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoh4Z-0003rO-Vw; Wed, 20 Aug 2025 11:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087328.1445408; Wed, 20 Aug 2025 11:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoh4Z-0003oN-SF; Wed, 20 Aug 2025 11:33:43 +0000
Received: by outflank-mailman (input) for mailman id 1087328;
 Wed, 20 Aug 2025 11:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0ee=3A=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uoh4Y-0003oG-Ld
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 11:33:42 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 854703a1-7db9-11f0-a32b-13f23c93f187;
 Wed, 20 Aug 2025 13:33:41 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b49f7aaf5so3270055e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Aug 2025 04:33:40 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b47c33203sm29157125e9.9.2025.08.20.04.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:33:39 -0700 (PDT)
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
X-Inumbo-ID: 854703a1-7db9-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755689620; x=1756294420; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tC8+aRMrrdmdk2eWWpjubkkQKUHljiGEkwEiL+azZFY=;
        b=rvEaiVK6XDJ2VnhepRRTAZlS4TDXz4pwVSoL9jNRsoZIe1nwNqumQTdd8+fpiKGPj4
         +yoeMmWSqDWLfZQo7MUA5zDF5Sx10VeDdBE3XEtCHRZt2qefCV0lcgBs9DhdQME4pOR7
         CcS05d/DC6DYcVKf4Qt3LOpfG6tijV7PV4gVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755689620; x=1756294420;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tC8+aRMrrdmdk2eWWpjubkkQKUHljiGEkwEiL+azZFY=;
        b=gMDQ5dGDctb9DeB427PQn+TXEmIKuO66Uq+apDN8Mt6fpKXkHzLJMBkQlITm8u3VxB
         eHE3kqPhONVhpkEYTNKp4/NpgLgPq8hQczM/zOcAfuMmo1ppR0f4JFVspuKpQCLONjVM
         O3qOutho7rnAQ5nkut6/OuTBoUffxXTSWKtoS8mlQO7hGX+lIDRiapLSiv79E9n0kvmc
         btt3HLqigw0TxszkfaZMtv8YUIneNrThqsTrvvTDNiuOAVvdIoNq2l8eH4y91cFh0EqB
         SsU8FiJlN1gxeWRnIhSPamzS3ExagLt0B7YwPqs9jIbEyZXULM7AowbVxqLNKJ8/fEVX
         V78A==
X-Gm-Message-State: AOJu0Yy7hGlTRC3y6SEirNGr3CL3ntBKS1yykQzSnBZK5cAPJMw/Gfiw
	nGGvlb2kyJmPIt2emePqnkaoDx2qf1bjsbIhd9oVSrpJShF6Yu57aMaALdfKO8IyRv8=
X-Gm-Gg: ASbGncskTBE84zByVuitwAIr0+JKep2rAt6gUXYL8fnoYn3FKJaS6aOBsmV86n56JF/
	4v4s7n94NYpHMYgnTcv3kkfFSqMBhWdqEL8ajvvVqgIKQbLmQE0WPNP2JfiHn7OT0Yzjtc9cPMt
	NbaKajUy6dC7wvncTyjDO0ThD6lsklhDVCLvFRpnq7Gmd3vRDy50nLW8EYOoSVamRNFrZhPygnC
	GIHNdYg9JdxXuI8FhxYiWmk2vve7/mZIM2JO7JGttO+YRysYNL45B5XBRT+6jqQ1UT5tF7nvPta
	rfk/rCUPLTGsFLph165nk/kRqCVvTelUpbvJFep5hbva0PEjBtRKp+tlM88WIXljHLKZ01jxGgf
	BWuFPmmCqsispshVvHc/DGTrMvDIv9ld6ChvR70FTlp0nTtgl5c7QH04nqbwsH4deLw==
X-Google-Smtp-Source: AGHT+IEWev61tPtuvQ50SeYMZqYDKBYyQtR3eNer8bT7EXIIKDd0uKOYlH6SjSOKWS2NUtdYC0eF5g==
X-Received: by 2002:a05:600c:310f:b0:459:d616:25c5 with SMTP id 5b1f17b1804b1-45b479b6b95mr21730725e9.12.1755689620038;
        Wed, 20 Aug 2025 04:33:40 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:33:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/iommu: setup MMCFG ahead of IOMMU
Message-ID: <aKWykl7UiTZmtGYW@macbook.local>
References: <20250819171826.60700-1-roger.pau@citrix.com>
 <6852c430-155c-4530-8aa6-67a6e97ef6b3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6852c430-155c-4530-8aa6-67a6e97ef6b3@citrix.com>

On Tue, Aug 19, 2025 at 07:23:57PM +0100, Andrew Cooper wrote:
> On 19/08/2025 6:18 pm, Roger Pau Monne wrote:
> > Otherwise the PCI accesses to segments different than the first one done by
> > the IOMMU initialization code would silently fail by returning all ones.
> >
> > Introduce a new helper, called pci_setup(), and move both the creation of
> > PCI segment 0 internal data structures, plus the parsing of ACPI MMCFG
> > table to it.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> And moving acpi_mmcfg_init() slightly earlier from acpi_boot_init() into
> pci_setup().
> 
> > diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> > index 26bb7f6a3c3a..e75a29e851a7 100644
> > --- a/xen/arch/x86/pci.c
> > +++ b/xen/arch/x86/pci.c
> > @@ -139,6 +142,19 @@ int pci_sanitize_bar_memory(struct rangeset *r)
> >      return 0;
> >  }
> >  
> > +void __init pci_setup(void)
> > +{
> > +    /*
> > +     * Ahead of any ACPI table parsing make sure we have control structures
> > +     * for PCI segment 0.
> > +     */
> > +    if ( pci_add_segment(0) )
> > +        panic("Could not initialize PCI segment 0\n");
> > +
> > +    /* Parse ACPI MMCFG ahead of IOMMU, so accesses to segments > 0 is setup. */
> 
> "ahead of IOMMU" isn't helpful here because the relevant context is in
> the caller.  Instead, I'd just say:
> 
> /* Parse ACPI MMCFG to see if other segments are available. */

Sure.

> > +    acpi_mmcfg_init();
> > +}
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 6fb42c5a5f95..bd648323bfed 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1938,11 +1938,10 @@ void asmlinkage __init noreturn __start_xen(void)
> >      setup_system_domains();
> >  
> >      /*
> > -     * Ahead of any ACPI table parsing make sure we have control structures
> > -     * for PCI segment 0.
> > +     * Initialize PCI (create segment 0, setup MMCFG access) ahead of IOMMU
> > +     * setup, as it requires access to the PCI config space.
> >       */
> 
> Again, this isn't terribly clear IMO.
> 
> "ahead of IOMMU setup, as the IOMMUs might not all live on segment 0." ?

It's not just IOMMUs, but for example on VT-d we also need to poke at
the config space of bridges, and when such bridges live in segment > 0
that results in garbage being returned.

I'm not sure acpi_iommu_init() accesses the IOMMU PCI device config
space, but it does at least access the config space of bridges in
order to detect hierarchy.  See how acpi_parse_dev_scope() performs
PCI reads.

What about using:

/*
 * Initialize PCI (create segment 0, setup MMCFG access) ahead of IOMMU
 * setup, as devices in segment > 0 must also be discoverable.
 */

Thanks, Roger.

