Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4088CC1E3
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727608.1132139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lpf-0006KX-Pf; Wed, 22 May 2024 13:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727608.1132139; Wed, 22 May 2024 13:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lpf-0006IM-MK; Wed, 22 May 2024 13:16:39 +0000
Received: by outflank-mailman (input) for mailman id 727608;
 Wed, 22 May 2024 13:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ieL=MZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s9lpe-0006IG-AZ
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:16:38 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84687780-183d-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 15:16:37 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7948b50225bso96965385a.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:16:37 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf1cd143sm1392849085a.0.2024.05.22.06.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 06:16:35 -0700 (PDT)
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
X-Inumbo-ID: 84687780-183d-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716383796; x=1716988596; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PX7IYW6ySnMaVJwRwj+MatcXvq1r3mjVOL6i9GRyM8c=;
        b=k3ZdO9NQQQkPUQX4nn3RI8q0726MbS6C/XAn2DwcRgvso7ijh/lViepLi/M6cEzSwp
         aESKJoPqyTRqajHER5FdxEsfTqYhMpWvZFlg5SMNWqNWZRQnHoZ+Bs3HG+dVpjw6e+oy
         5yMb9iM/okehhVK69yEKSFCAKwppFO0M3UJQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383796; x=1716988596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PX7IYW6ySnMaVJwRwj+MatcXvq1r3mjVOL6i9GRyM8c=;
        b=cpg6CtRkmzvTtO4qD4lINwT3/4PMqBW+ZPwtC/yhC5xA8QpkSfBrCdvLYOVVDaVfrS
         jp9z+etJtygu29sUVgwY9AskwcWbw8SVftv32qgsQVBQmw82GDGD46eRlYjn48hthQlZ
         q1tjTsWikNXO4zx+1XmDup/tkbxif28m7GSN5W2/J3tFR2/Vdn43ZPJiYOE5DvPreA+I
         9Z5rB+Ur6RtxlE1qiK9MKAU9xyWPk4wHXTr9AFfUqpiS/1AoSLdmmr0/zs3UIq1yWBwU
         j/vpyAiKDryIME8F5m22xrwYEiCGYDCV4tnuArbUwHNRtxgIIlBh+IHMhK5wmdkKz8U5
         ZNBw==
X-Forwarded-Encrypted: i=1; AJvYcCW3D54CQind+qo6vyqV9pKhZhY+p6wENJxGRfEZQkHuJQctXOWa2ar+YPWO7HYiVk2tiUR53SJd+0VrIyC7vVHArgZIMbD7e0rn9VZDw94=
X-Gm-Message-State: AOJu0YxLS3ZX0MOm3nXSsfp/lf4HRkNE0/sb/KoOqBe/P2d6Fkd8PurN
	bT0j6SFAlawW5rz/p6K8GgCFoQg3gXP+xMzbN3a2gEahdAF+vaVTdjf9OmQY6Cw=
X-Google-Smtp-Source: AGHT+IFUpH1CAyUj9e41ym92kgDMh5S70/nICkehPf1CbJCNGH26LyaU0G5cqsvidOpe85aLrOIb/Q==
X-Received: by 2002:a05:620a:2942:b0:794:9def:9691 with SMTP id af79cd13be357-7949def9d06mr57332585a.35.1716383795947;
        Wed, 22 May 2024 06:16:35 -0700 (PDT)
Date: Wed, 22 May 2024 15:16:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 v3 2/3] xen: enable altp2m at create domain
 domctl
Message-ID: <Zk3wMevPye8Rfjm4@macbook>
References: <20240517133352.94347-1-roger.pau@citrix.com>
 <20240517133352.94347-3-roger.pau@citrix.com>
 <cd1bf7b0-4a0a-4a38-9129-53822cb8e037@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd1bf7b0-4a0a-4a38-9129-53822cb8e037@suse.com>

On Tue, May 21, 2024 at 12:30:32PM +0200, Jan Beulich wrote:
> On 17.05.2024 15:33, Roger Pau Monne wrote:
> > Enabling it using an HVM param is fragile, and complicates the logic when
> > deciding whether options that interact with altp2m can also be enabled.
> > 
> > Leave the HVM param value for consumption by the guest, but prevent it from
> > being set.  Enabling is now done using and additional altp2m specific field in
> > xen_domctl_createdomain.
> > 
> > Note that albeit only currently implemented in x86, altp2m could be implemented
> > in other architectures, hence why the field is added to xen_domctl_createdomain
> > instead of xen_arch_domainconfig.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
> albeit with one question:
> 
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -637,6 +637,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >      bool hap = config->flags & XEN_DOMCTL_CDF_hap;
> >      bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
> >      unsigned int max_vcpus;
> > +    unsigned int altp2m_mode = MASK_EXTR(config->altp2m_opts,
> > +                                         XEN_DOMCTL_ALTP2M_mode_mask);
> >  
> >      if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
> >      {
> > @@ -715,6 +717,26 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >          return -EINVAL;
> >      }
> >  
> > +    if ( config->altp2m_opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
> > +    {
> > +        dprintk(XENLOG_INFO, "Invalid altp2m options selected: %#x\n",
> > +                config->flags);
> > +        return -EINVAL;
> > +    }
> > +
> > +    if ( altp2m_mode && nested_virt )
> > +    {
> > +        dprintk(XENLOG_INFO,
> > +                "Nested virt and altp2m are not supported together\n");
> > +        return -EINVAL;
> > +    }
> > +
> > +    if ( altp2m_mode && !hap )
> > +    {
> > +        dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
> > +        return -EINVAL;
> > +    }
> 
> Should this last one perhaps be further extended to permit altp2m with EPT
> only?

Hm, yes, that would be more accurate as:

if ( altp2m_mode && (!hap || !hvm_altp2m_supported()) )

Would you be fine adjusting at commit, or would you prefer me to send
an updated version?

Thanks, Roger.

