Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C91AB96C8
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 09:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986415.1371970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpna-0008Oa-FJ; Fri, 16 May 2025 07:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986415.1371970; Fri, 16 May 2025 07:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpna-0008Ly-Br; Fri, 16 May 2025 07:48:06 +0000
Received: by outflank-mailman (input) for mailman id 986415;
 Fri, 16 May 2025 07:48:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFpnY-0008Ls-Sh
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 07:48:04 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18dd4fdd-322a-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 09:48:04 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad53cd163d9so37800766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 00:48:04 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d04e80asm110397166b.2.2025.05.16.00.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 00:48:02 -0700 (PDT)
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
X-Inumbo-ID: 18dd4fdd-322a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747381683; x=1747986483; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2E/hoT4fE8Bh31dCCp6BY8ERhJFrdzHrljWu6xm8+JE=;
        b=kQ4zAExJFolFhHm/kzVRuoAHWW/R2hXN5zTHRHMvF0YtMqSTqGg1cwXTRGJhstMuiS
         OUFHll/JR8wAhBXO9NxLZn/OxeLzNx/KpD4VsuytR8IiMKN5ezUyY6iLy4I1AQ8YPo0b
         1opNQ5LYxInEOYhBN9gtBXGUsMZFfDJS01318=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747381683; x=1747986483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E/hoT4fE8Bh31dCCp6BY8ERhJFrdzHrljWu6xm8+JE=;
        b=h52igw8X3m7CespTfxIBCys4WcVyneai3qh61FiUudtBAYN5fctfUZHyWGMJ2OWzZS
         xC42wl/OlBiBksYP52/u+NUPesXNH3eidMzfbu9zlPx5CsJCGnvJKTI33G6xjWPdKoyc
         OHXVrVOFCjShJwEr7hkU3HMPqskdbgCKSJYO+8xn+UaM0PistFfqXdO9bgVliozL3CJf
         u5FGkD16j+mD5RHaAfxqlneciLcOBRrZS5BmEKjtwArhx4NYg7030uI88/MRRhYMToQa
         iwN6bvl45hGv6qDtQPCy1SBPx01ElsQkdoeF9W1vPslzEg0dttVwWyZc3lfv3rykCXFS
         Knkg==
X-Forwarded-Encrypted: i=1; AJvYcCUME52m26yXaYRonUwtkL3EaiaJMBQP6oDU3L17v/8f3J722RXrBGpGxEV94C/2rpQX4ufx3yE06dc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwalPUja9Hm0TB7a/u8BlXdAE7y3mYHumCKeQjeONY9y7g2VkcQ
	nygw0Y6qjTtBNCAgsmm0FWXVo2xnf6PJQTfSh4ZKQ57V0//Oli+NuEYXgaUyKnQMmDr7+sCp3RU
	8RIuR
X-Gm-Gg: ASbGncupEvgTAzITt+v+J6T0gfiLvx8nU8q97Mf5BDUFG/EwnFuufTDeRRaxe+CgAx1
	67XdBWP+baJMB23KvNoEo9qZBn9jkFzmCmG0NyRqKTDJoPDTjQ5d6gcX13a0SqeX/RwaZ/3ckNg
	FwO7vwW+YbBq9toQyJyNeItR6Cugh0E2ygA62fw7Hl9lH/BlFVDzxzDKP3pVN2lipcL41XBUOfF
	TMMw5Cd0oOS/tXaozoY9xyuO9M0q6V1rmzbNzkkigVLfM/Wn8vR3y/xPS87mnFBD4DSHev/KlxX
	Kl2AIAQ3VeNjhn/kjZ23DWBU2ut3Ja0poY/i5KTyO4zgWGAyzvVDctNQMqy+W5phNSbMlSzDBLu
	32tDkAFMFqwRB/sco1kWmgo1Qlw5E5w==
X-Google-Smtp-Source: AGHT+IFHjXsXhnwdXisjGrKAKUbROPL9FgH5FxIejhsE4kscm3lGoUIIsJSkmSZpp850K0D1drop4Q==
X-Received: by 2002:a17:907:7f88:b0:ad2:3bfc:232 with SMTP id a640c23a62f3a-ad52d509f93mr224065866b.32.1747381683075;
        Fri, 16 May 2025 00:48:03 -0700 (PDT)
Date: Fri, 16 May 2025 09:48:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/9] x86/mtrr: use memory_type_changed() in
 hvm_set_mem_pinned_cacheattr()
Message-ID: <aCbtsaR3tj99UQfF@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-6-roger.pau@citrix.com>
 <df82f2bf-4992-4af2-9ffc-e734ea627a13@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <df82f2bf-4992-4af2-9ffc-e734ea627a13@suse.com>

On Fri, May 16, 2025 at 08:58:39AM +0200, Jan Beulich wrote:
> On 06.05.2025 10:31, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/mtrr.c
> > +++ b/xen/arch/x86/hvm/mtrr.c
> > @@ -605,22 +605,8 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
> >  
> >                  type = range->type;
> >                  call_rcu(&range->rcu, free_pinned_cacheattr_entry);
> > -                p2m_memory_type_changed(d);
> > -                switch ( type )
> > -                {
> > -                case X86_MT_UCM:
> > -                    /*
> > -                     * For EPT we can also avoid the flush in this case;
> > -                     * see epte_get_entry_emt().
> > -                     */
> > -                    if ( hap_enabled(d) && cpu_has_vmx )
> > -                case X86_MT_UC:
> > -                        break;
> > -                    /* fall through */
> > -                default:
> > -                    flush_all(FLUSH_CACHE);
> > -                    break;
> > -                }
> > +                memory_type_changed(d);
> > +
> >                  return 0;
> >              }
> 
> Hmm, so your consideration to avoid the "goto" in my patch was perhaps this
> part of your change, where you expect the "return 0" could then stay here.
> Maybe. However, you removing the switch() means we'd then also flush in
> cases where currently (or with my change) we avoid doing so.

Oh, yes, just replied to your previous email with this suggestion.

I don't have a strong opinion, but I don't think the fine grained
flush avoidance is really required.  What's more, if we want to call
memory_type_changed() we must do so for any changes, as the call to
p2m_memory_type_changed() must be done unconditionally regardless of
whether the specific MTRR type change could allow us to avoid the
flush.

Overall, I have the impression hvm_set_mem_pinned_cacheattr() should
only be used while building a domain, and hence the flush can likely
be skipped unconditionally, regardless of the type changes.

Thanks, Roger.

