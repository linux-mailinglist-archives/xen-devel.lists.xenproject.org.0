Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147B20EB0F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 03:51:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jq5R1-0003Sz-JB; Tue, 30 Jun 2020 01:51:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aLIy=AL=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1jq5R0-0003Ss-Jc
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 01:51:42 +0000
X-Inumbo-ID: 3e9a68da-ba74-11ea-8496-bc764e2007e4
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e9a68da-ba74-11ea-8496-bc764e2007e4;
 Tue, 30 Jun 2020 01:51:42 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id o1so1252515plk.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2020 18:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QcL0Zhl1N0pMgp2Kkm1GtLuYDs4t+krbYwO8zi652js=;
 b=RmMcKr+aj3J04hYD4Md41hjVR1MEd+7NN/yPHbRA6KJM78V9AGcpu2w4Fl+ozQlJUK
 xw0Fs9vP9Xu/FR3Pmxx/ZXqxwtlQ7UmM4dGwpIfWKBaDZC0PnBO/Cui2o3Q9f9jeCMRy
 cat0NFLGhZGX7MoP1i3Ez1wZWRemgGOyDmCj4GmxRi/X+dCToHiJKl5gotI/vI6WaOSV
 by0LKl5oLBYfHHGE3eACm/8RSfyBmE6Bqkvbk5c9Z5HpqzbS8jQf7E6SY56Tz4kLm1W4
 Fkw0rtfVJ9VCiUSXaKPqoDZ/+d+CcrbWzwkG81X80CS2KKLwtkd65sEwMmjV8FBZnaRi
 UP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QcL0Zhl1N0pMgp2Kkm1GtLuYDs4t+krbYwO8zi652js=;
 b=BeopoYUPctldUWvs1Qp7odm/7fpSAtm5FW55CnHUYOJuhIOv+3gQWTfQ6KWIGW6fGD
 ZScwaT+zesPMoEDvj470QzHx2Y50UhjnZMV+jVCKenpaG/byxGI3ZFsigH4T+YSK3Gco
 kNgusPywt3fCveJ8LSGNCbYMUvd8+59qeke36efXA1F9mXKShmvOc2+fzT1M5Y+pK9AE
 Qqz7cs/6m3SReJTYmGEGxXMjet+tNql0mJF/+Kp1jLrCde9g4BtFaQDA171aPZgl/haS
 M12sM/C6+vhHzhFXhD6TVSDOyJbHQveO+hZQ9MfXhe1lNIqVEc6qor2AZ6BkLT5+4psX
 DipQ==
X-Gm-Message-State: AOAM533m8vL1x+HuKZw6/H/fROBPYVzOQOLrejG05S8f+wvjckz8IqJt
 +zcs3p8m+ySpKJM+xw7ced8=
X-Google-Smtp-Source: ABdhPJzx6J2dwWA2DSaJGKE/ibstVv3AI5P31Opftw6WFWiKgmcTvV4Nx/SjyquY73oqj4NF8YLTWQ==
X-Received: by 2002:a17:90a:e28c:: with SMTP id
 d12mr21246421pjz.122.1593481901256; 
 Mon, 29 Jun 2020 18:51:41 -0700 (PDT)
Received: from piano ([2601:1c2:4f00:c640:fc6:7318:8185:4d2d])
 by smtp.gmail.com with ESMTPSA id x1sm650990pju.3.2020.06.29.18.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 18:51:40 -0700 (PDT)
Date: Mon, 29 Jun 2020 18:51:38 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC XEN PATCH 22/23] riscv: Add sysctl.c
Message-ID: <20200630015138.GB8470@piano>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <7ebc34d888493f27302ed0a53e09216233cc9e7e.1579615303.git.bobbyeshleman@gmail.com>
 <a50e318d-9e7b-955d-2daf-7bf5535c051c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a50e318d-9e7b-955d-2daf-7bf5535c051c@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 22, 2020 at 01:43:40PM +0200, Jan Beulich wrote:
> On 22.01.2020 02:59, Bobby Eshleman wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/sysctl.c
> > @@ -0,0 +1,31 @@
> > +/******************************************************************************
> > + * Arch-specific sysctl.c
> > + *
> > + * System management operations. For use by node control stack.
> > + *
> > + * Copyright (c) 2012, Citrix Systems
> > + */
> > +
> > +#include <xen/types.h>
> > +#include <xen/lib.h>
> > +#include <xen/errno.h>
> > +#include <xen/hypercall.h>
> > +#include <public/sysctl.h>
> > +
> > +void arch_do_physinfo(struct xen_sysctl_physinfo *pi) { }
> > +
> > +long arch_do_sysctl(struct xen_sysctl *sysctl,
> > +                    XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> > +{
> > +    return -ENOSYS;
> 
> At the example of this (there may be more in this series) - -EOPNOTSUPP
> please. Only top level hypercall handlers ought to produce -ENOSYS, for
> major hypercall numbers with no handler.
> 

Got it, will do.  Thanks!

