Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279B5944FDF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 18:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769862.1180747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZYGL-0002Ff-G2; Thu, 01 Aug 2024 16:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769862.1180747; Thu, 01 Aug 2024 16:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZYGL-0002Ds-B8; Thu, 01 Aug 2024 16:02:45 +0000
Received: by outflank-mailman (input) for mailman id 769862;
 Thu, 01 Aug 2024 16:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8r7L=PA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZYGJ-0002Di-GQ
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 16:02:43 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b101750-501f-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 18:02:41 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7a1d6f47112so450991585a.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 09:02:41 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f6e9dd2sm2499485a.39.2024.08.01.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 09:02:39 -0700 (PDT)
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
X-Inumbo-ID: 7b101750-501f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722528160; x=1723132960; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9nZVoL1BNgRXsYNGRKYQkK2x9+fw9cbTiX2OS2v2Elc=;
        b=EodysOKdhYJ39qbzTExZ+Et9uf+YwneoYjp/JuQ/9MUZmXxg0kvwt79lBQhKsrRR9a
         em9m1Kpq0OfRXhKBEputMN8ilhz78USdk38a53e1MQWlxbYCy8Japvf2YFt5E0k0yz44
         TaJAit5fJas+Fmze1/OeDUTn1cH8VxKnEJ+u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528160; x=1723132960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nZVoL1BNgRXsYNGRKYQkK2x9+fw9cbTiX2OS2v2Elc=;
        b=bFnqoR46G08LZMBWw0j39p/F098nYQPRBOV0mhEPR7gSgroBzVI8+b1ZaigqG87VNR
         bxO7kv5Koop+q8sDSJ53PrAlJ+XsJfQMjYkfUlt4U1mF07J2WpwWLzr8CKJrcsSo8AB8
         aqwM2qbRwtwi2Ydui/8yPJm011YvdJfHmM9YvRVTFBxdPmIO6mSFbhVJx+SShN4IBBa6
         i7W2MaZm3C8GxDEmjbLwetZOxx5HOBXUQfiRGvoVkiVmiRl4gyTAvXSUsMEa7i3m4Pht
         zOr5mmTcjrYqBBXOHRa1O4hFDkgbbYb+StfT87PD1Vbe+JEKvm+Uis1Go1fwR+4WyEHp
         A24w==
X-Forwarded-Encrypted: i=1; AJvYcCW9RF1Op6EKtxm/7UqwbD+Yta01/W68Dg7dn176gPUarS3+0zfVh6xH5RJEp4zB17A11Y6dG/vLy4RdYOz/FsXr81V2d91cr2N9B4vbOYw=
X-Gm-Message-State: AOJu0YyR2tRFCs1sFhbdZQfQ60LZnTUXWVr17knjaWCk+GYXqhilcHGA
	uxuZiV51QWE8PdmgphU7wBbVjeIGFEFvh0tlL+amOVtGN1jEFFkpUa/gSnMNHaI=
X-Google-Smtp-Source: AGHT+IHn/R8Zlt4tHdGqBJ9GpCVX8cFYlzIdm5tSAX+H1UjMAWKygtF/fe7YtbzSVOxZWB++bsKWLw==
X-Received: by 2002:a05:620a:440e:b0:79d:5503:a925 with SMTP id af79cd13be357-7a34ef456b7mr49189385a.35.1722528160349;
        Thu, 01 Aug 2024 09:02:40 -0700 (PDT)
Date: Thu, 1 Aug 2024 18:02:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] x86/dom0: delay setting SMAP after dom0 build is done
Message-ID: <ZquxmnpCKFohGdo9@macbook>
References: <20240801095201.91180-1-roger.pau@citrix.com>
 <988147f4-3de2-4aae-99cc-7d0ba48b158f@suse.com>
 <ZquraLjpMe9fToZd@macbook>
 <f3aedd33-f3ac-4a75-82db-5da827a6fc5e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3aedd33-f3ac-4a75-82db-5da827a6fc5e@suse.com>

On Thu, Aug 01, 2024 at 05:58:38PM +0200, Jan Beulich wrote:
> On 01.08.2024 17:36, Roger Pau Monné wrote:
> > On Thu, Aug 01, 2024 at 12:28:06PM +0200, Jan Beulich wrote:
> >> On 01.08.2024 11:52, Roger Pau Monne wrote:
> >>> @@ -1907,16 +1890,25 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
> >>>      if ( cpu_has_smep && opt_smep != SMEP_HVM_ONLY )
> >>>          setup_force_cpu_cap(X86_FEATURE_XEN_SMEP);
> >>>      if ( boot_cpu_has(X86_FEATURE_XEN_SMEP) )
> >>> +    {
> >>>          set_in_cr4(X86_CR4_SMEP);
> >>> +        cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
> >>
> >> Could be just "cr4_pv32_mask = X86_CR4_SMEP" now?
> > 
> > Yes, indeed, same below then.
> > 
> >>> +    }
> >>>  
> >>>      if ( !opt_smap )
> >>>          setup_clear_cpu_cap(X86_FEATURE_SMAP);
> >>>      if ( cpu_has_smap && opt_smap != SMAP_HVM_ONLY )
> >>>          setup_force_cpu_cap(X86_FEATURE_XEN_SMAP);
> >>>      if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> >>> -        set_in_cr4(X86_CR4_SMAP);
> >>> -
> >>> -    cr4_pv32_mask = mmu_cr4_features & XEN_CR4_PV32_BITS;
> >>> +        /*
> >>> +         * Set SMAP on the %cr4 mask so that it's set for APs on bringup, but
> >>> +         * don't set for the BSP until domain building is done.
> >>> +         *
> >>> +         * Don't set it in cr4_pv32_mask either, until it's also set on the
> >>> +         * BSP.  Otherwise the BUG in cr4_pv32_restore would trigger for events
> >>> +         * received on the BSP.
> >>> +         */
> >>> +        mmu_cr4_features |= X86_CR4_SMAP;
> >>
> >> Don't you put APs at risk this way of triggering the BUG in cr4_pv32_restore()?
> >> They'll have the bit set in %cr4, but the bit remains clear in cr4_pv32_mask
> >> until much later.
> > 
> > As long as the bit is set in %cr4, but not in cr4_pv32_mask the BUG in
> > cr4_pv32_restore won't hit.
> 
> Hmm, you're right. Despite staring at that for quite some time, I got
> it wrong. Feel free to add
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> then, preferably with said minor adjustment (left in context above).

Sure, thanks!

Will adjust and send v4.

