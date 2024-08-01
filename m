Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0708A944F6A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 17:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769810.1180683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZXqi-000309-45; Thu, 01 Aug 2024 15:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769810.1180683; Thu, 01 Aug 2024 15:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZXqi-0002y3-1H; Thu, 01 Aug 2024 15:36:16 +0000
Received: by outflank-mailman (input) for mailman id 769810;
 Thu, 01 Aug 2024 15:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8r7L=PA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZXqg-0002xx-EX
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 15:36:14 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c74c7552-501b-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 17:36:11 +0200 (CEST)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6659e81bc68so63245167b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 08:36:11 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f942676sm85193016d6.72.2024.08.01.08.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 08:36:09 -0700 (PDT)
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
X-Inumbo-ID: c74c7552-501b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722526570; x=1723131370; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mCpU/JGv0oEoOiI6W+LpiCFVOtkG6WC1VLSv5IR9jYo=;
        b=hMUlUW+LkDLMN0/D49xPVUS+M/E6EzX1HoBuuQaEmyGB3fwDdCYtx7EWmAEg65mcBI
         +2CHzHxEC4MSObxPRbaLSlkK98QqUUz7dGYG8/Q7wprTvLQ6qDhMF7c05WrxnPvhI8n2
         KiFlSwWeYZo9+Ug4TNsx0Hupo+zxpxxw7dO0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722526570; x=1723131370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCpU/JGv0oEoOiI6W+LpiCFVOtkG6WC1VLSv5IR9jYo=;
        b=JgN8TgqPsuihU6Y2YD/2jELNkdT2ddy9uKLLqQjVuRbqHpFbYUTm5wMn7MLZcXUDlB
         MVHKsJoFjd5V+CdDcHSM/QnNXqboW/VRK+kPrpDmLf3qBfYLbXoZKgSnSnQdAXRWo+cx
         o3YY3TBovqsDDkqa4oWawf8JzMqVvBczSjqIJ/qPp3mHjNhvGrBg6Ygp0nvvF8WKf+w3
         unYp572UoBr743snCjFIQS6LIc30EbmgD3mLpAWRSJbMxYvCTqTumsVJJ4qz3dJL9Hvs
         Y9kNITUD9DCqJIbloFRZCpVG9FrbbrZjAI1rQW++Ty+779nb1Uo/CNwIQHqzTCVIv9rE
         ME8g==
X-Forwarded-Encrypted: i=1; AJvYcCWW1EDzS5qrHBf15ll589KKdwCxnQUYIB55ZuV3urCly5KlL1KzdTvljDzRzj74IYhXOHqdrfkZ5LC7FGGz2Zlh2nasuO8oAehoBnjxtN4=
X-Gm-Message-State: AOJu0YymQ/I/7U760RJCgcFc5NfAU+6R5MRh0WVRCK08xce1BqTyPy95
	CmxI/T2OKLwRTjrinxvDxPYG0G1/hCDm0nMC1qEaEw/PURRN4RQMCbhgWnKrVgI=
X-Google-Smtp-Source: AGHT+IHGPnp0LjOBrBDfqUK8LBv59Mjo5Z5EkPXC6oEEMOOJuk0iHTTUBA0IqSa8ONcGNxyZ2gsvTg==
X-Received: by 2002:a0d:c147:0:b0:649:8f00:5254 with SMTP id 00721157ae682-6895f609d78mr4293367b3.1.1722526570241;
        Thu, 01 Aug 2024 08:36:10 -0700 (PDT)
Date: Thu, 1 Aug 2024 17:36:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/dom0: delay setting SMAP after dom0 build is done
Message-ID: <ZquraLjpMe9fToZd@macbook>
References: <20240801095201.91180-1-roger.pau@citrix.com>
 <988147f4-3de2-4aae-99cc-7d0ba48b158f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <988147f4-3de2-4aae-99cc-7d0ba48b158f@suse.com>

On Thu, Aug 01, 2024 at 12:28:06PM +0200, Jan Beulich wrote:
> On 01.08.2024 11:52, Roger Pau Monne wrote:
> > @@ -1907,16 +1890,25 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
> >      if ( cpu_has_smep && opt_smep != SMEP_HVM_ONLY )
> >          setup_force_cpu_cap(X86_FEATURE_XEN_SMEP);
> >      if ( boot_cpu_has(X86_FEATURE_XEN_SMEP) )
> > +    {
> >          set_in_cr4(X86_CR4_SMEP);
> > +        cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
> 
> Could be just "cr4_pv32_mask = X86_CR4_SMEP" now?

Yes, indeed, same below then.

> > +    }
> >  
> >      if ( !opt_smap )
> >          setup_clear_cpu_cap(X86_FEATURE_SMAP);
> >      if ( cpu_has_smap && opt_smap != SMAP_HVM_ONLY )
> >          setup_force_cpu_cap(X86_FEATURE_XEN_SMAP);
> >      if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> > -        set_in_cr4(X86_CR4_SMAP);
> > -
> > -    cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
> > +        /*
> > +         * Set SMAP on the %cr4 mask so that it's set for APs on bringup, but
> > +         * don't set for the BSP until domain building is done.
> > +         *
> > +         * Don't set it in cr4_pv32_mask either, until it's also set on the
> > +         * BSP.  Otherwise the BUG in cr4_pv32_restore would trigger for events
> > +         * received on the BSP.
> > +         */
> > +        mmu_cr4_features |= X86_CR4_SMAP;
> 
> Don't you put APs at risk this way of triggering the BUG in cr4_pv32_restore()?
> They'll have the bit set in %cr4, but the bit remains clear in cr4_pv32_mask
> until much later.

As long as the bit is set in %cr4, but not in cr4_pv32_mask the BUG in
cr4_pv32_restore won't hit.

> > @@ -2048,6 +2040,18 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
> >      if ( !dom0 )
> >          panic("Could not set up DOM0 guest OS\n");
> >  
> > +    /*
> > +     * Enable SMAP only after being done with the domain building phase, as the
> > +     * PV builder switches to the domain page-tables and must be run with SMAP
> > +     * disabled.
> > +     */
> > +    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> > +    {
> > +        ASSERT(mmu_cr4_features & X86_CR4_SMAP);
> > +        write_cr4(read_cr4() | X86_CR4_SMAP);
> > +        cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
> > +    }
> 
> Similarly for the BSP here: If we take an NMI between setting CR4.SMAP and
> setting the bit in cr4_pv32_mask, cr4_pv32_restore() would hit the BUG
> there if I'm not mistaken.

No, having extra bits set in %cr4 not present in cr4_pv32_mask won't
trigger the BUG.  It's the other way around, having bits set in
cr4_pv32_mask but not in %cr4.  As long as %cr4 is always updated
ahead of setting the bit in cr4_pv32_mask that's fine.

See the logic in cr4_pv32_restore:

        /* Check that _all_ of the bits intended to be set actually are. */
        mov   %cr4, %rax
        and   cr4_pv32_mask(%rip), %rax
        cmp   cr4_pv32_mask(%rip), %rax
	je    1j
	[...]
	BUG

Otherwise none of this would be safe, as it's impossible to set %cr4
and cr4_pv32_mask atomically in a single instruction.

> I further fear that switching things around won't
> help either. The code you remove from create_dom0() looks to have the same
> issue. The only NMI-safe sequence looks to be: Clear both bits from %cr4,
> update cr4_pv32_mask as wanted, and then write %cr4 with the bits from
> cr4_pv32_mask ORed in.

No, that won't be safe, as cr4_pv32_mask would contain bits not set in
%cr4 and cr4_pv32_restore would hit the BUG.  The update order is the
%other way around, first set in %cr4, then in cr4_pv32_mask.

Thanks, Roger.

