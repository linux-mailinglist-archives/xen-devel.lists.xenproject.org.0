Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE40263152
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 18:07:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG2dQ-0004Bk-De; Wed, 09 Sep 2020 16:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jv/y=CS=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kG2dP-0004Bd-OY
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 16:07:47 +0000
X-Inumbo-ID: 5ee27098-254a-4278-80e3-4c364c141eeb
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ee27098-254a-4278-80e3-4c364c141eeb;
 Wed, 09 Sep 2020 16:07:47 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id f142so2881593qke.13
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2020 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=W6JHl2pJ4b9pOCvVr4DrsQk+nKWiJhgnyaUXZ93HkkY=;
 b=uNaXttl+DzcYJUodqGDuN/qRVDSYl+GZ4SftaClpQanqO/xm02GQF9vCjnEp2LoTKA
 vUJTL5MfSAeFUR2JZcanddmtTPo2pUN6IeZJHby/cM+m9SUV/dXVX8nK0T1l2F2RjRY6
 YCCMuagmUXrMA/Rm8ByNN6vsgGluKwWh8AqgfIoVWU1dlddeZpg5p3ohkectPMzO0Rk4
 kBkCEJQ9pFEEBqglFgEj8peLSUBT5RawaUFAPw3HO+0IFgQ+n9i8VCCpUTkNV2ms0OWU
 h11VCPuWe2Lmu3eNKwd2qVgPcFk2lcE/0Qb+awI1Yyi+Zq2csW92bFoicg/hblS3EsQV
 K3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=W6JHl2pJ4b9pOCvVr4DrsQk+nKWiJhgnyaUXZ93HkkY=;
 b=Kl+6Gnq/Ey5jPisbllulU/pmuuPSi57DF9pt+zHkpd7siWL24MUuUq/hqGuPhv2wVq
 Jidn2lODH6q/nxWGPMJIB0WbY/WLYjfuDWIAIP7e+EVV0FJA5DS5DiuEJ5m4jC36ilXY
 2tuinA3cGFZbKW/oz/nn7hKG/Q6QvJ/COYRI8XCeFg24hI7TPJF42O4iuypA1gDNRJuS
 Lsdb8iItPZEOkj0cbnJ/3DiKhDkk7quCEgtFoGkUQLd9R0Yga1YJZuwdyP4JxNnfvEuz
 AcMcbHKJ7gYPbfWRRF+CDAx/fMg8gVMZ913wJG4dE1MCwhPiixT5PjJYeO1ypR1mU1Vm
 lgtQ==
X-Gm-Message-State: AOAM531G0VeVMA0j08tfzd5x/qAafsfDsXaPpiBfqwVCdkJAwCPBG08p
 VRReQXnZ0O5K7t03QbMvWYw=
X-Google-Smtp-Source: ABdhPJw5WogXlPWDiOAo+qwZnqTT5c48A9UJD+yKMWfyxpu1Q+WxMZ3vx8hLXcnB1zeY4ea23Eabcw==
X-Received: by 2002:a05:620a:244:: with SMTP id
 q4mr3722569qkn.375.1599667666477; 
 Wed, 09 Sep 2020 09:07:46 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id m68sm1144078qkd.105.2020.09.09.09.07.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Sep 2020 09:07:45 -0700 (PDT)
Date: Wed, 9 Sep 2020 12:07:42 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] golang/xenlight: Move to an entirely external repo
Message-ID: <20200909160742.GA56470@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <20200904164000.602618-1-george.dunlap@citrix.com>
 <20200908170332.GA12322@FED-nrosbr-BE.crux.rad.ainfosec.com>
 <612A1B4D-41E5-42F4-882E-D4750D53B24D@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <612A1B4D-41E5-42F4-882E-D4750D53B24D@citrix.com>
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

On Tue, Sep 08, 2020 at 08:46:58PM +0000, George Dunlap wrote:
> 
> 
> > On Sep 8, 2020, at 6:03 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > 
> > On Fri, Sep 04, 2020 at 05:40:00PM +0100, George Dunlap wrote:
> >> Remove all go files and generation targets.
> >> 
> >> Add a convenience macro to build the package from staging.  This isn't
> >> really meant to be called directly; rather, it's meant to be called
> >> from a corresponding build target inside the external xenlight package
> >> repo.
> >> 
> >> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> > 
> > Does this make our move to gitlab.com/xen-project/go-xen official? I
> > wasn't expecting this to be so soon. But, if you're satisifed with what
> > you've learned from working on the experimental repo/module, I guess I'm
> > not opposed. I would like to know the rest of the details though.
> 
> All patches to the list are proposals — nothing is official until it’s been checked in; and I haven’t checked, but since nobody has Acked it, it certainly *shouldn’t* have been checked in yet. :-)
> 
> So, feel free to give feedback or ask whatever details you think need to be ironed out.  That’s what this thread is for.
> 
> There’s certainly no issue with waiting to delete the code in-tree; but I wouldn’t be a fan of developing in both places at once and keeping things in sync.  (I could be convinced if you thought that was important.)  I’d prefer just to develop in the external tree, and if for some reason we decide that doesn’t work, importing the changes back into xen.git.

That's all I was curious about really. I incorrectly assumed that
deleting the code from xen.git would be some big, "permanent" action, so
I was just wasn't expecting this already. Your plan makes sense to me.
:)

Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

