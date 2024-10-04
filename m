Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E2F98FDF6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 09:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810058.1222660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swcvD-0005yY-BC; Fri, 04 Oct 2024 07:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810058.1222660; Fri, 04 Oct 2024 07:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swcvD-0005vs-81; Fri, 04 Oct 2024 07:40:19 +0000
Received: by outflank-mailman (input) for mailman id 810058;
 Fri, 04 Oct 2024 07:40:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiC3=RA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1swcvB-0005vm-VH
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 07:40:17 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e47b8631-8223-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 09:40:14 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so288642166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 00:40:14 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9910470767sm186362366b.153.2024.10.04.00.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 00:40:13 -0700 (PDT)
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
X-Inumbo-ID: e47b8631-8223-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728027613; x=1728632413; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TWhuwZc4v+ia72DbiwEWxY6IKwRKaOR/m9Jlz2FVVi4=;
        b=PBYVNfhiZYoh5qJFyTc2OOFedVPr0jJwM8CuUmjXh0FtFYatgP8zbmidoYLGxslXdW
         3jegen7EImHiVg1thmendJuasb6dpDOpcZ2xVWsX3cxrPOmNG3sImbSgsIxwAy/rOhEl
         8olZDedtCt/Nuhu66sWfW0wofx7Cr9OePK9WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728027613; x=1728632413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWhuwZc4v+ia72DbiwEWxY6IKwRKaOR/m9Jlz2FVVi4=;
        b=Z/2oqCvkIGGxvYGy7i3tBWKNGVrnc41Mdb/qDsqFbi76VUAs5EtbcsxPNvDvFLwcGd
         r/+Q+P0VkfTfV2l05HlRBLYQA8E/0QUYi14N9wGeeTfnREuWI6rHNo3wfx5Xx93nYFdt
         geARPpB5WczSR+Vf4i4Ro7rtgYZuwDte6xOY7zOyCDfoOAY8avGWQuzTCtbcCVwyXnET
         Gl9CbJ3kepE9hCvziKedFr7eJVBrFEZ9dKINxU+6Udf5XpVJE8vlR2nwOffAShRijUA2
         XujbGGNTacMAe53DqhpKdjcYRYWpdRhBSqcHKlb2SjL7WrbrsANvcKuNvCsryGUAfDnU
         oZXA==
X-Forwarded-Encrypted: i=1; AJvYcCUMoQH9rbbqOKMTwiJ4gLpDG8hsRA3feL3UwVnGrdBEqrAMG+MkjYMgbtijuIhktPQ9qo9sQjkYbsE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9jqnp1lOQ8OcfeRKcW2rCHLScevIT8vKyF93Nq4J3A58Z4ERG
	61YEABra1p2b91hPIZtlnkupldYrIEEt8NmtP8GHrU3eNSiyJ7nWedOqG88lw60=
X-Google-Smtp-Source: AGHT+IExg6xutFr3aKvwCWPz/6uCay8xqp2eGwl2vZ4m386zXnPyk1x3vT7DA8XfWI6ZPlbG5HkzQA==
X-Received: by 2002:a17:906:6a24:b0:a7a:b73f:7584 with SMTP id a640c23a62f3a-a991bd72dc3mr185407666b.34.1728027613571;
        Fri, 04 Oct 2024 00:40:13 -0700 (PDT)
Date: Fri, 4 Oct 2024 09:40:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/boot: Further simplify CR4 handling in
 dom0_construct_pv()
Message-ID: <Zv-b3IP_RvCsY81q@macbook.local>
References: <20241002232008.1988682-1-andrew.cooper3@citrix.com>
 <7dbd7fae-e2e8-4508-a012-cf9b719c68f1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7dbd7fae-e2e8-4508-a012-cf9b719c68f1@suse.com>

On Fri, Oct 04, 2024 at 08:52:52AM +0200, Jan Beulich wrote:
> On 03.10.2024 01:20, Andrew Cooper wrote:
> > The logic would be more robust disabling SMAP based on its precense in CR4,
> > rather than SMAP's accociation with a synthetic feature.
> 
> It's hard to tell what's more robust without knowing what future changes
> there might be. In particular ...
> 
> > @@ -1064,19 +1065,19 @@ int __init dom0_construct_pv(struct domain *d,
> >       * prevents us needing to write construct_dom0() in terms of
> >       * copy_{to,from}_user().
> >       */
> > -    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> > +    if ( cr4 & X86_CR4_SMAP )
> 
> ... with this adjustment ...
> 
> >      {
> >          if ( IS_ENABLED(CONFIG_PV32) )
> >              cr4_pv32_mask &= ~X86_CR4_SMAP;
> 
> ... this update of a global no longer occurs. Playing games with CR4
> elsewhere might run into issues with this lack of updating.

Maybe we should assert the state of cr4 is as expected?

ASSERT(!boot_cpu_has(X86_FEATURE_XEN_SMAP) || (cr4 & X86_CR4_SMAP));

Thanks, Roger.

