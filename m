Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C00960C71
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784034.1193390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwTt-0006JS-4G; Tue, 27 Aug 2024 13:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784034.1193390; Tue, 27 Aug 2024 13:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwTs-0006GJ-W7; Tue, 27 Aug 2024 13:43:32 +0000
Received: by outflank-mailman (input) for mailman id 784034;
 Tue, 27 Aug 2024 13:43:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYmO=P2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1siwTr-0005yA-Is
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:43:31 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57cd9126-647a-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 15:43:30 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-44ff50affc5so28625691cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:43:29 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fe0f3b2dsm53172131cf.53.2024.08.27.06.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:43:26 -0700 (PDT)
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
X-Inumbo-ID: 57cd9126-647a-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724766209; x=1725371009; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+G5pnBmJehPtMIxK3tqkOmZD5TYh2i7LXIOI6nLfIxs=;
        b=dL2jaQ0czCN3VDNFF3m57C0nigfQebrpULY6f2vOWIqrEknJM++vyTVDs9BhchG7VY
         cnfDxPn7UlIpoEhjvKoxJ1K3CIAmpNshyK/tHBIgBSr2NiRRzdR4lYZeJowHTEDw6JFP
         wSTBiWQGg1PdMguqIMTQLzgdisGqkrdG9Edp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766209; x=1725371009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G5pnBmJehPtMIxK3tqkOmZD5TYh2i7LXIOI6nLfIxs=;
        b=lkba+VoZyFEjpvK3tskHsGsU+juizAcHO8Ac6yXnO4gukeMErUvmg9OoQM7RvsKJ+y
         Y0da7Lc5MOmIerizMCHGAUvHOI4iRTi5ZTgADnfykpwadBjg032NEGOJ53IOdItOAIDd
         5zz2CYJEirgnvzhabsdlXClVpaTY8K9bELT4HFF1kM3XBipjJMPMIlpN9S6UINACQsHj
         AtxqVpxGvBNdDAOfBHM6qYHra9OUkSi0LjBGkQEpRqy1SI6A9KIGmWOXJLNTTZIsu+Ya
         APWrrGWLfzqleeuKtsJtMuhX3xnBifDm4rNCGgJfEruUfw7SkU/MfBsVRMuacHlBHqj5
         tIEg==
X-Forwarded-Encrypted: i=1; AJvYcCXLaZhS+AXW8AamrF2prCzE0SZXeZv0HcckQkU3apSpLcpjCPlRVMYyywOrDsP1Hw7kL+wd1u7z+yM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzc4mchyP1my8A3DLvzIHb7ey1dnmyguJOL79prqtnIHwu6cBfl
	jFW9Wj5kQG+V4tBsLMNY50/BgaE65TtMk5eMbR7MBbavd0kDY8oMtuqKG5wcOSM=
X-Google-Smtp-Source: AGHT+IFuo2CFeYs6rIJTSw3c/FiYwIgMC+tJXARtXhisOjb9OFOHq0F2uM7sTSk7XBMCFxYHra8i7w==
X-Received: by 2002:a05:622a:5590:b0:43f:fc16:6b3f with SMTP id d75a77b69052e-456608fd36dmr33981691cf.34.1724766208640;
        Tue, 27 Aug 2024 06:43:28 -0700 (PDT)
Date: Tue, 27 Aug 2024 15:43:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5] x86/dom0: disable SMAP for PV domain building only
Message-ID: <Zs3X_OUy_EkfdKng@macbook.local>
References: <20240827123949.24400-1-roger.pau@citrix.com>
 <734d41c3-709c-4286-8353-f5483b0987cb@citrix.com>
 <d939dffc-e8e3-40cf-8494-c03ae6978c90@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d939dffc-e8e3-40cf-8494-c03ae6978c90@suse.com>

On Tue, Aug 27, 2024 at 03:04:54PM +0200, Jan Beulich wrote:
> On 27.08.2024 14:59, Andrew Cooper wrote:
> > On 27/08/2024 1:39 pm, Roger Pau Monne wrote:
> >> --- a/xen/arch/x86/dom0_build.c
> >> +++ b/xen/arch/x86/dom0_build.c
> >> @@ -612,7 +612,24 @@ int __init construct_dom0(struct domain *d, const module_t *image,
> >>      if ( is_hvm_domain(d) )
> >>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
> >>      else if ( is_pv_domain(d) )
> >> +    {
> >> +        /*
> >> +         * Temporarily clear SMAP in CR4 to allow user-accesses in
> >> +         * construct_dom0().  This saves a large number of corner cases
> >> +         * interactions with copy_from_user().
> >> +         */
> >> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> >> +        {
> >> +            cr4_pv32_mask &= ~X86_CR4_SMAP;
> >> +            write_cr4(read_cr4() & ~X86_CR4_SMAP);
> >> +        }
> >>          rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
> >> +        if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> >> +        {
> >> +            write_cr4(read_cr4() | X86_CR4_SMAP);
> >> +            cr4_pv32_mask |= X86_CR4_SMAP;
> >> +        }
> >> +    }
> > 
> > I hate to drag this on further still, but can this logic be move it into
> > dom0_construct_pv() itself, rather than here?
> 
> Just to mention it: I'm fine with this in principle, as long as this won't
> mean a pile of new goto-s in dom0_construct_pv(). If a new wrapper was
> introduced (with the present function becoming static), I'd be okay.

I've considered adding this inside of dom0_construct_pv(), but then I
would need to adjust the return paths to re-enable SMAP.

I can add a wrapper, I didn't do it that way because it seemed
cumbersome IMO.

I will prepare v6 then with that approach.

Thanks, Roger.

