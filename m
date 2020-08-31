Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5327B257B62
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 16:38:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCkwZ-0000PO-Ma; Mon, 31 Aug 2020 14:37:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWhU=CJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kCkwY-0000PI-7E
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 14:37:58 +0000
X-Inumbo-ID: 230bd664-a742-4bde-944c-233a29929a03
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 230bd664-a742-4bde-944c-233a29929a03;
 Mon, 31 Aug 2020 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598884676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TbUqjcC+gn3wSxVko3ecHbKcUU4IghKoI+OkqP0JeyQ=;
 b=bNL3ue1T56FrU8oPZ/tp5/d5F/xL6EJO3GjItmvcLGVqLu87TtD+wIPY
 DTt9xA2hO11PW+99GNNEa4wYLUPhz45up+v+Ifup3MgadJXHPgFh9T/bK
 ypnM3nVinfLBHx8NgfzBdiZaWeS8ef+SB68PHvFfpt249wXXRcUJYKNJX E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2I/ReKrc/rKCV/Y7QDRyAIaxgXrCWH6w/edWUlXCv+sKanOX4FPFdz7sVSySOQdqnUowSQMuZ3
 ZzIjgLxhs1ifQbqlCRP4ureBLbrIqzhYYLBe1nQhfMXw7QPd+HJUnQuitJ4qvGh/g/k1c6/lgs
 t+UjeEEmOeHwlOcvC4k/pMgg0c5CQ55u375Zs0dqIJEZAZxgqHPcn8UdNiH6i3X4BUkOTDN1bq
 kgrxVZDzFcIuLPfZDjzCVgGW2pRzJRPqej0RdNLeda+ExOr78YktnYBDy6LnCpggO022SLyR/e
 vV4=
X-SBRS: 2.7
X-MesageID: 25955173
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,375,1592884800"; d="scan'208";a="25955173"
Date: Mon, 31 Aug 2020 16:37:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/8] x86/svm: silently drop writes to SYSCFG and
 related MSRs
Message-ID: <20200831143747.GD753@Air-de-Roger>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-3-roger.pau@citrix.com>
 <52cde027-e7c2-3ca7-3d7e-7abfe19198da@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <52cde027-e7c2-3ca7-3d7e-7abfe19198da@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 27, 2020 at 05:03:50PM +0200, Jan Beulich wrote:
> On 20.08.2020 17:08, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -1917,6 +1917,21 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
> >              goto gpf;
> >          break;
> >  
> > +    case MSR_K8_TOP_MEM1:
> > +    case MSR_K8_TOP_MEM2:
> > +        *msr_content = 0;
> > +        break;
> 
> Any reason you don't fold this with ...
> 
> > +    case MSR_K8_SYSCFG:
> > +        /*
> > +         * Return MtrrFixDramEn: albeit the current emulated MTRR
> > +         * implementation doesn't support the Extended Type-Field Format having
> > +         * such bit set is common on AMD hardware and is harmless as long as
> > +         * MtrrFixDramModEn isn't set.
> > +         */
> > +        *msr_content = K8_MTRRFIXRANGE_DRAM_ENABLE;
> > +        break;
> > +
> >      case MSR_K8_VM_CR:
> >          *msr_content = 0;
> >          break;
> 
> ... this existing case, and ...

I was trying to sort them by value, but I can certainly merge this and
the case below.

Thanks, Roger.

