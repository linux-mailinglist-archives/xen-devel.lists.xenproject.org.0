Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBCF7E7F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 20:04:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUEw3-0008SM-NJ; Mon, 11 Nov 2019 19:01:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M6oq=ZD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iUEw2-0008SH-3b
 for xen-devel@lists.xen.org; Mon, 11 Nov 2019 19:01:10 +0000
X-Inumbo-ID: 9ea74fd8-04b5-11ea-adbe-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ea74fd8-04b5-11ea-adbe-bc764e2007e4;
 Mon, 11 Nov 2019 19:01:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBE7D21655;
 Mon, 11 Nov 2019 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573498868;
 bh=4THNaiRLZLOoHLTfQCfNeRFd6EspBDCynIv0E2tzw/8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=DfFHcWlQHNxnctLM8oKMmYVsprmrmVeaM1d7I0/l5rBFu5K3q7j4HV4/74Vj6/8yW
 jYLTQF4UIGPdyiCHTvjp7fVnFPYKfZ1P1omLykCvXfVOGO5iqAmfv1CXYawTtxprEY
 slEYFUtistl2RAUNrTbL3CI30DVGENzwuKlXv668=
Date: Mon, 11 Nov 2019 11:01:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
In-Reply-To: <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1911111049000.2677@sstabellini-ThinkPad-T480s>
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2080349165-1573498187=:2677"
Content-ID: <alpine.DEB.2.21.1911111049500.2677@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2080349165-1573498187=:2677
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1911111049501.2677@sstabellini-ThinkPad-T480s>

On Sat, 9 Nov 2019, Julien Grall wrote:
> On Sat, 9 Nov 2019, 04:27 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Thu, 7 Nov 2019, Peng Fan wrote:
>       > The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
>       >
>       > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
>       Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> To be honest, I am not sure the code is correct. A read to those registers should tell you the list of interrupts active. As we always
> return 0, this will not return the correct state of the GIC.
> 
> I know that returning the list of actives interrupts is complicated with the old vGIC, but I don't think silently ignoring it is a good
> idea.
> The question here is why the guest accessed those registers? What is it trying to figure out?

We are not going to solve the general problem at this stage. At the
moment the code:

- ignore the first register only
- print an error and return an IO_ABORT error for the other regs

For the inconsistency alone the second option is undesirable. Also it
doesn't match the write implementation, which does the same thing for
all the GICD_ISACTIVER* regs instead of having a special treatment for
the first one only. It looks like a typo in the original patch to me.

The proposed patch switches the behavior to:

- silently ignore all the GICD_ISACTIVER* regs (as proposed)

is an improvement.


>       Juergen, I think this fix should be in the release (and also
>       backported to stable trees.)
> 
> 
> Without an understanding of the problem, I disagree with this request (see above).
> 
> As an aside, the range ISPENDR  has the same issue.

You meant GICD_ICPENDR, right? Yep, that one is suffering from the same
typo mistake too.

 
>       > ---
>       >  xen/arch/arm/vgic-v3.c | 2 +-
>       >  1 file changed, 1 insertion(+), 1 deletion(-)
>       >
>       > diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>       > index 422b94f902..e802f2055a 100644
>       > --- a/xen/arch/arm/vgic-v3.c
>       > +++ b/xen/arch/arm/vgic-v3.c
>       > @@ -706,7 +706,7 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>       >          goto read_as_zero;
>       > 
>       >      /* Read the active status of an IRQ via GICD/GICR is not supported */
>       > -    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVER):
>       > +    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
>       >      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>       >          goto read_as_zero;
>       > 
>       > --
>       > 2.16.4
>       >
> 
>       _______________________________________________
>       Xen-devel mailing list
>       Xen-devel@lists.xenproject.org
>       https://lists.xenproject.org/mailman/listinfo/xen-devel
> 
> 
> 
--8323329-2080349165-1573498187=:2677
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2080349165-1573498187=:2677--

