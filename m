Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F608AE988
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710679.1110042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHBI-00006E-C0; Tue, 23 Apr 2024 14:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710679.1110042; Tue, 23 Apr 2024 14:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHBI-0008Vi-8W; Tue, 23 Apr 2024 14:31:36 +0000
Received: by outflank-mailman (input) for mailman id 710679;
 Tue, 23 Apr 2024 14:31:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzHBH-00082U-Jv
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:31:35 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ed00f88-017e-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:31:34 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-78f0628da1eso351393685a.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:31:34 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 e8-20020a0caa48000000b006a07be4361bsm2347081qvb.6.2024.04.23.07.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:31:32 -0700 (PDT)
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
X-Inumbo-ID: 2ed00f88-017e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713882693; x=1714487493; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=reFLZmR/8KolDfZUZzGov+btT58hgyoCyffUOYqVZfY=;
        b=MJ4zz+6+vdGgnpIeQO0wtUjxAnJEc1Pa35ZJLBSlYY6+IAG2y1Q5CFHAA39MJAkMAo
         KSDxfoK/WRA8w0n0zNwnWCu6lD5H2fveEvOL2lnEwHF9hrWwBSKu3ueIXQonJx3xxvX9
         il4jNbEac2Fr2Pz07Fwrf4afoRFTYjVftw3bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882693; x=1714487493;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=reFLZmR/8KolDfZUZzGov+btT58hgyoCyffUOYqVZfY=;
        b=qEwe8UE6hy9EdCBz78ctZ3q8DJsmfcuoLzjgdFWEgUzxSMvzC+JlJxfUeVqR8IzzMS
         wkTeUR79tKeXGrXMI/ok9foluol9MrryAlp0a5/NK2tTIotjKWnia+FS3bznaq5HId0S
         Dy04/v8KzlFaDD4pxzYP4kamPY3PAqVJC42daytmPrBxDrBj8CjUC08+MC1N/35ZozH7
         V+ad3mnlQlqp4T+Qi8sMfUh5Mioj73yLT4RUmEVrJS2rninxk93o6VilJYQTAkM6m02q
         QVcNixybWIWAMFYzgxFmXSpNrWvHEVi9xAmd1BXbyGXzDDHLCTU1Z7R6t9CBvxp8R0Cg
         YGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsRMto1D/0NuLVQMBvI1kR2no4OyrdTWMaRepHpBf905yj6d+pLErE9lIeuW4F89eLUrujSdOn8jjSGd9bulWP/xCS0o44faDIW4mgj58=
X-Gm-Message-State: AOJu0Yx47OOdHszELlgS1ggtYmXqmo9NxZeZtOt9bMCNQlCZqq8uaovZ
	TGBT4l2PgPlhin3cNSPB97QWd9DuQIidUHs27MGokqBGpdaWXh55ubBNkq88adk=
X-Google-Smtp-Source: AGHT+IEIZSsxfNuwbYLuUcnkXd0zrxuRHQuFGATCUE1lbVIqMffJ2mQmey4cWJlpbvGbypLvgY6cKw==
X-Received: by 2002:a05:6214:186a:b0:6a0:88d1:dc92 with SMTP id eh10-20020a056214186a00b006a088d1dc92mr2573088qvb.13.1713882692952;
        Tue, 23 Apr 2024 07:31:32 -0700 (PDT)
Date: Tue, 23 Apr 2024 16:31:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/4] x86/livepatch: perform sanity checks on the
 payload exception table contents
Message-ID: <ZifGQaO8RkveaH0Z@macbook>
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-5-roger.pau@citrix.com>
 <b76f105b-ac92-4759-8e93-64b97232a60c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b76f105b-ac92-4759-8e93-64b97232a60c@suse.com>

On Tue, Apr 23, 2024 at 03:51:31PM +0200, Jan Beulich wrote:
> On 23.04.2024 15:12, Roger Pau Monne wrote:
> > Ensure the entries of a payload exception table only apply to text regions in
> > the payload itself.  Since the payload exception table needs to be loaded and
> > active even before a patch is applied (because hooks might already rely on it),
> > make sure the exception table (if any) only contains fixups for the payload
> > text section.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In principle
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Still two comments:
> 
> > --- a/xen/arch/x86/extable.c
> > +++ b/xen/arch/x86/extable.c
> > @@ -228,3 +228,21 @@ unsigned long asmlinkage search_pre_exception_table(struct cpu_user_regs *regs)
> >      }
> >      return fixup;
> >  }
> > +
> > +#ifdef CONFIG_LIVEPATCH
> > +bool extable_is_between_bounds(const struct exception_table_entry *ex_start,
> 
> s/between/in/ or even s/is_between/in/? "Between", to me at least, reads
> very much like meaning "exclusive at both ends".

Oh, OK, I don't associate any boundary inclusion with 'between' or
'in'.  The result is shorter, so I like it.

> > +                               const struct exception_table_entry *ex_end,
> > +                               const void *start, const void *end)
> > +{
> > +    for ( ; ex_start < ex_end; ex_start++ )
> > +    {
> > +        const void *addr = (void *)ex_addr(ex_start);
> > +        const void *cont = (void *)ex_cont(ex_start);
> 
> Might be nicer to use _p() here, or not do the comparisons with pointers, but
> instead with unsigned long-s.

No strong opinion regarding whether to use unsigned longs or pointers.
I've used pointers because I think the function parameters should be
pointers, and that avoided doing a cast in the comparison with
obfuscates it (or introducing yet another local variable).

I can switch to _p(), that's indeed better.

Let me know if you have a strong opinion for using unsigned longs,
otherwise my preference would be to leave it with pointers.

Thanks, Roger.

