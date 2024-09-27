Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B303D988157
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806156.1217485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Hk-0000EV-4r; Fri, 27 Sep 2024 09:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806156.1217485; Fri, 27 Sep 2024 09:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su7Hk-0000Bc-1X; Fri, 27 Sep 2024 09:29:12 +0000
Received: by outflank-mailman (input) for mailman id 806156;
 Fri, 27 Sep 2024 09:29:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYFD=QZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1su7Hj-0000BW-B7
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:29:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f37eafca-7cb2-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 11:29:10 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so258628566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 02:29:10 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c5a7dsm110058866b.62.2024.09.27.02.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 02:29:09 -0700 (PDT)
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
X-Inumbo-ID: f37eafca-7cb2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727429350; x=1728034150; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hrPMKJO7moi4CffiFfmTeaKikPGisFREqDzJg4sfAs=;
        b=q3SXUXhURukJa8QMN9EOYBsrqrda+Mogh2J+sH+tpDNI/hAb5hYR8YABfyKNN54YP1
         QgBucTjxr7SZAKkV81Nh6dzcQO34PLH10bqM5+XjhMDvWuPDY/3jU3OCd4SQ3e4qggpi
         4Hf0V58e7xoic13n85DA05QIcwG6cQXMAsFFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727429350; x=1728034150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hrPMKJO7moi4CffiFfmTeaKikPGisFREqDzJg4sfAs=;
        b=IfJ/kPTOS3pzYlJtZswPaVcdqwTd45JiIZUBv4FZjygceu+j6/Z5hB6wTzgfUKLzoq
         KFPRVg76TZj0okKehw0AXL1PCxZ/+KlvsWE3MKVOmlcP6mTBWWkoiMxnW+EY2qgiX87s
         B44/moxEjn//NEoBrsVSOHcHAnoJunK+BjbmfBD9q4Yyoqqn9fP9kENCdYcJDCIXjLyW
         eDBHsjThKkYGRks0CX1lux4NvR7dFEl7Qgoz8JdQ6wL+fwkY153l3ZshtaHAxJOuQzhQ
         W0JXTmLqoYX/nPGC4w9GcE7stJLsu7HTfqY3LEfUJVeEKMljL3t+3bjzMg1VbL9v5ZmR
         k9MA==
X-Gm-Message-State: AOJu0YzIe8MiTzw1QNUNwggx1w0/fHZjzA+ShYXfnq03Vold+OjjQXBL
	MNrjqgTxolfph4qCtohzIIbf0ce+9iQs5I/y6yxOE185BuoqXU/b4WLSQ+2p2vTojZCxu+d0IaZ
	G
X-Google-Smtp-Source: AGHT+IGZd+rscmvWMp2DqEYiGy+Jzf4d/OdRyKbVLvW4wD6EgIKEkj3K4/1BFgc0bo44Qc0sg6PRhA==
X-Received: by 2002:a17:907:6d23:b0:a88:b90a:ff30 with SMTP id a640c23a62f3a-a93c4a62739mr242274466b.50.1727429349846;
        Fri, 27 Sep 2024 02:29:09 -0700 (PDT)
Date: Fri, 27 Sep 2024 11:29:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 15/22] x86/idle: allow using a per-pCPU L4
Message-ID: <ZvZ65MM0-OQh-xdj@macbook.local>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-16-roger.pau@citrix.com>
 <D3LQN57ALKYC.1RG6ZQ90U2WEB@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D3LQN57ALKYC.1RG6ZQ90U2WEB@cloud.com>

On Wed, Aug 21, 2024 at 05:42:26PM +0100, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 4:21 PM BST, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 9cfcf0dc63f3..b62c4311da6c 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -555,6 +555,7 @@ void arch_vcpu_regs_init(struct vcpu *v)
> >  int arch_vcpu_create(struct vcpu *v)
> >  {
> >      struct domain *d = v->domain;
> > +    root_pgentry_t *pgt = NULL;
> >      int rc;
> >  
> >      v->arch.flags = TF_kernel_mode;
> > @@ -589,7 +590,23 @@ int arch_vcpu_create(struct vcpu *v)
> >      else
> >      {
> >          /* Idle domain */
> > -        v->arch.cr3 = __pa(idle_pg_table);
> > +        if ( (opt_asi_pv || opt_asi_hvm) && v->vcpu_id )
> > +        {
> > +            pgt = alloc_xenheap_page();
> > +
> > +            /*
> > +             * For the idle vCPU 0 (the BSP idle vCPU) use idle_pg_table
> > +             * directly, there's no need to create yet another copy.
> > +             */
> 
> Shouldn't this comment be in the else branch instead? Or reworded to refer to
> non-0 vCPUs.

Sure, moved to the else branch.

> > +            rc = -ENOMEM;
> 
> While it's true rc is overriden later, I feel uneasy leaving it with -ENOMEM
> after the check. Could we have it immediately before "goto fail"?

I have to admit I found this coding style weird at first, but it's
used all over Xen.  I don't mind setting rc ahead of the goto, AFAICT
the only benefit of the current style is that we can avoid the braces
around the if code block for it being a single statement.

> > +            if ( !pgt )
> > +                goto fail;
> > +
> > +            copy_page(pgt, idle_pg_table);
> > +            v->arch.cr3 = __pa(pgt);
> > +        }
> > +        else
> > +            v->arch.cr3 = __pa(idle_pg_table);
> >          rc = 0;
> >          v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
> >      }
> > @@ -611,6 +628,7 @@ int arch_vcpu_create(struct vcpu *v)
> >      vcpu_destroy_fpu(v);
> >      xfree(v->arch.msrs);
> >      v->arch.msrs = NULL;
> > +    free_xenheap_page(pgt);
> >  
> >      return rc;
> >  }
> 
> I guess the idle domain has a forever lifetime and its vCPUs are kept around
> forever too, right?; otherwise we'd need extra logic in the the vcpu_destroy()
> to free the page table copies should they exist too.

Indeed, vcpus are only destroyed when destroying domains, and system
domains are never destroyed.

Thanks, Roger.

