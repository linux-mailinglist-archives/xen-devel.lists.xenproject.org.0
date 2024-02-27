Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90252868E89
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:13:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686005.1067495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revOc-0003nT-F3; Tue, 27 Feb 2024 11:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686005.1067495; Tue, 27 Feb 2024 11:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revOc-0003lx-CX; Tue, 27 Feb 2024 11:13:14 +0000
Received: by outflank-mailman (input) for mailman id 686005;
 Tue, 27 Feb 2024 11:13:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revOb-0003lr-Cz
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:13:13 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 321358a2-d561-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 12:13:12 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512ed314881so4198507e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:13:12 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 xy23-20020a05620a5dd700b00787bdbeeaa3sm3486876qkn.107.2024.02.27.03.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:13:11 -0800 (PST)
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
X-Inumbo-ID: 321358a2-d561-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709032392; x=1709637192; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jH8zQMVgDn4lne2+zjTbSXco8BxL7Aa6h7rnmCxKkVM=;
        b=hlXUaQCZxWRErFEqjbjALyGwF6sDVJr8EGRMzlsTxkJrBPV1XusxRKrkS/mTEdBzgX
         53Wt1iKPZlblm8LHtoek4TdoCMtLBDRsoqdFoBHbx1g7vCc+ewbPIxP22idhB7trpoBO
         fL+Z/LfodvVyIS/ly+IhpMMtgXz2UF8saQl/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709032392; x=1709637192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jH8zQMVgDn4lne2+zjTbSXco8BxL7Aa6h7rnmCxKkVM=;
        b=w/rbTphb1Ya+YgkqheuSjLO62ZDjbVnFoMwtKaszpTQXKDly7WUH7EOfpJQlX/Qzfe
         yebdBTdNOoE+FBKdpy4MSMbAHZyauzYBPl/COKDr9Ma7rvE/49EZQbEbH30ckancy+Q3
         bme9htJ5M38ZkyNP5lave2MKJzqnguIhhLCd71rGKD1X49nYd3+WqvnQp/CFhmqgb/El
         6QmvKlInomNDMa3ZLRIlwzRFEc4oq7Elm5qavz4psxRXBxU7jASCbyzDVBar83g0zqjw
         p9TEkNEJOptIFtdUxAIksWHMDXJM4d79KhSU6hT9tR/Ab0eUWWke54Wdf7zmFvrao7IS
         JYrA==
X-Forwarded-Encrypted: i=1; AJvYcCW7dz641fiHthJUJaaaKzpqkL9mQmYhSpayZD8MNrIOAYe8lORTaquEOp5iLi8eCqVhIVHhb72xyjcoJpcb7GYasN85xkrsNSzcWPlFCo8=
X-Gm-Message-State: AOJu0YyEtaFEAmCC4Y31azsnZfWtxyaFVdPDFs23ybJfsqdQuAMbXDkY
	0eH54aFK/NsK72+MrkOHIBsfy5ClYzwByxHQiXkSg6kJ06N5Ng1k8odIjJDtyPo=
X-Google-Smtp-Source: AGHT+IH2HTQrKv2RDrlqLsIV6Tn4RRVahK7yQzdNazFa0k6AtGIubOh4b0s3yBEugww1BRQRVwq2eA==
X-Received: by 2002:a19:f719:0:b0:512:ac3a:7f27 with SMTP id z25-20020a19f719000000b00512ac3a7f27mr5078816lfe.66.1709032391999;
        Tue, 27 Feb 2024 03:13:11 -0800 (PST)
Date: Tue, 27 Feb 2024 12:13:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/4] x86/spec: print the built-in SPECULATIVE_HARDEN_*
 options
Message-ID: <Zd3DxW88JoyUSU4m@macbook>
References: <20240226110748.80254-1-roger.pau@citrix.com>
 <20240226110748.80254-2-roger.pau@citrix.com>
 <85fa5e55-27c5-495d-bd7b-857260b1de20@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85fa5e55-27c5-495d-bd7b-857260b1de20@suse.com>

On Mon, Feb 26, 2024 at 01:39:49PM +0100, Jan Beulich wrote:
> On 26.02.2024 12:07, Roger Pau Monne wrote:
> > Just like it's done for INDIRECT_THUNK and SHADOW_PAGING.
> > 
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> but ...
> 
> > --- a/xen/arch/x86/spec_ctrl.c
> > +++ b/xen/arch/x86/spec_ctrl.c
> > @@ -466,13 +466,25 @@ static void __init print_details(enum ind_thunk thunk)
> >             (e21a & cpufeat_mask(X86_FEATURE_SBPB))           ? " SBPB"           : "");
> >  
> >      /* Compiled-in support which pertains to mitigations. */
> > -    if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) || IS_ENABLED(CONFIG_SHADOW_PAGING) )
> > +    if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) || IS_ENABLED(CONFIG_SHADOW_PAGING) ||
> > +         IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_ARRAY) ||
> > +         IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH) ||
> > +         IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS) )
> >          printk("  Compiled-in support:"
> >  #ifdef CONFIG_INDIRECT_THUNK
> >                 " INDIRECT_THUNK"
> >  #endif
> >  #ifdef CONFIG_SHADOW_PAGING
> >                 " SHADOW_PAGING"
> > +#endif
> > +#ifdef CONFIG_SPECULATIVE_HARDEN_ARRAY
> > +               " SPECULATIVE_HARDEN_ARRAY"
> > +#endif
> > +#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
> > +               " SPECULATIVE_HARDEN_BRANCH"
> > +#endif
> > +#ifdef CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS
> > +               " SPECULATIVE_HARDEN_GUEST_ACCESS"
> >  #endif
> 
> ... I'd like to suggest to drop the SPECULATIVE_ from the string literals.
> They're relevant in the Kconfig identifiers, but they're imo redundant in
> the context of these log messages. (Happy to adjust while committing, if
> need be.)

Oh, yes, indeed, we already print HARDEN_BRANCH instead of
SPECULATIVE_HARDEN_BRANCH.  Please adjust at commit if you don't mind.

Thanks, Roger.

