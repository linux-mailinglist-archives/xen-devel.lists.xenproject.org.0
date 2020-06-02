Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8A1EBB38
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:07:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg5hb-0005SP-Bs; Tue, 02 Jun 2020 12:07:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg5hZ-0005SH-KL
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:07:29 +0000
X-Inumbo-ID: a125bf60-a4c9-11ea-81bc-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a125bf60-a4c9-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 12:07:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r7so3177176wro.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 05:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wp/6lUDFZC0s0sD2fAFwXs/FjyFtaZK74th7zSxlrUE=;
 b=GthVZyVMOBlCmH2sFB4u0lz8yGz91M2pLCmMM/XTdacEhHu9w5ndfQcXTThV5Tby3T
 ghGMOLvz77Ujp5aNdKiSc2nIGKMobRXD+LyqM18z4XyWSnfAck1EaB58pHusSeqCyp1V
 OPjji8XVkDzm4nz3LbsTvvKKNtdaAaBdVYnz2CZh1HtHZCRSKCOczwwVI4XQIifn/8Cg
 2vB3uhjbZhJY9j9xNK9/hAKWDJabtPH/m1LgzlkN0RHczmmg10SFb7AfHgvPoTw6opo/
 ZmSJ5L83zr2H384LhNJh2T3wUxSSLzQYp8nNFeufo4DSLsoqPt3Ye9Aik9LYAmwSkM8L
 XKDQ==
X-Gm-Message-State: AOAM531ZySOLP5auHabSzKw9PR+XRO69baCfElrOhthQvwpWgsOJ8Gm3
 m9duNdbyX5fFup4A0XDLLAU=
X-Google-Smtp-Source: ABdhPJwJYjiX5YIK2lY2jtMizJ+82pMOXwhkx4ebDOvOmRWJoUwPm9uURIVjwmyl1uogusiKhX1KFw==
X-Received: by 2002:adf:dec5:: with SMTP id i5mr23657004wrn.16.1591099648355; 
 Tue, 02 Jun 2020 05:07:28 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id k17sm3246435wmj.15.2020.06.02.05.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 05:07:27 -0700 (PDT)
Date: Tue, 2 Jun 2020 12:07:26 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH-for-4.14 1/2] xen: fix build with CONFIG_HYPFS_CONFIG
 enabled
Message-ID: <20200602120726.vm3br27ygbvbs2bx@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200602114050.5964-1-jgross@suse.com>
 <20200602114050.5964-2-jgross@suse.com>
 <d6c1360e-6ecd-7dda-554d-dced4767deaa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6c1360e-6ecd-7dda-554d-dced4767deaa@suse.com>
User-Agent: NeoMutt/20180716
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 01:55:14PM +0200, Jan Beulich wrote:
> On 02.06.2020 13:40, Juergen Gross wrote:
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -75,7 +75,7 @@ obj-$(CONFIG_UBSAN) += ubsan/
> >  obj-$(CONFIG_NEEDS_LIBELF) += libelf/
> >  obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
> >  
> > -config.gz: ../.config
> > +config.gz: $(XEN_ROOT)/xen/$(KCONFIG_CONFIG)
> 
> Looking at all pre-existing uses of KCONFIG_CONFIG this is the
> first one assuming it holds a relative path. The doc also doesn't
> indicate it can't be an absolute one.

This is not an objection to this patch right?

Wei.

> 
> Jan

