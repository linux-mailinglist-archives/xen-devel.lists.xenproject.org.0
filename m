Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91989F975B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 18:38:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUa52-00029K-S3; Tue, 12 Nov 2019 17:35:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5F1A=ZE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iUa51-00029F-Mf
 for xen-devel@lists.xen.org; Tue, 12 Nov 2019 17:35:51 +0000
X-Inumbo-ID: de5d3076-0572-11ea-b678-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de5d3076-0572-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 17:35:50 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAC5F214E0;
 Tue, 12 Nov 2019 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573580150;
 bh=ipDVxoZqtTcmRRV6QmvBxjxaGjkSn4hG0EhmGgzs2L4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FS+hDsJfZOJH3Y1LESmnR0cBsvSDCVz0oP2va+9bKepZHkg6t01eCCkUvKEF/jFFw
 iQmXECpVBPIZ72Sd5CsRvKMNcTje2cZZc+/QdcKGy7EJKfbzheZhxyQmD+eNLdnfwZ
 rP7F/3rOuiCY1XF5kRPm7pqHjCB0sSfGvkNvazQI=
Date: Tue, 12 Nov 2019 09:35:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Peng Fan <peng.fan@nxp.com>
In-Reply-To: <AM0PR04MB44811934638A8DFF51B6B95788770@AM0PR04MB4481.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.1911120934200.2863@sstabellini-ThinkPad-T480s>
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
 <AM0PR04MB44811934638A8DFF51B6B95788770@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1172271277-1573580150=:2863"
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1172271277-1573580150=:2863
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 12 Nov 2019, Peng Fan wrote:
> Hi Julien,
> 
> Inline marked with [Peng Fan]

Please use plain text emails on xen-devel (and other open source
development mailing lists.)


> From: Julien Grall <julien.grall.oss@gmail.com> 
> Sent: 2019年11月9日 6:44
> To: Stefano Stabellini <sstabellini@kernel.org>; Andre Przywara <andre.przywara@arm.com>
> Cc: Peng Fan <peng.fan@nxp.com>; Jürgen Groß <jgross@suse.com>; julien.grall@arm.com; xen-devel@lists.xen.org
> Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
> 
> Hi,
> 
> Sorry for the formatting.
> On Sat, 9 Nov 2019, 04:27 Stefano Stabellini, <mailto:sstabellini@kernel.org> wrote:
> On Thu, 7 Nov 2019, Peng Fan wrote:
> > The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
> > 
> > Signed-off-by: Peng Fan <mailto:peng.fan@nxp.com>
> 
> Reviewed-by: Stefano Stabellini <mailto:sstabellini@kernel.org>
> 
> To be honest, I am not sure the code is correct. A read to those registers should tell you the list of interrupts active. As we always return 0, this will not return the correct state of the GIC.
> 
> I know that returning the list of actives interrupts is complicated with the old vGIC, but I don't think silently ignoring it is a good idea.
> 
> The question here is why the guest accessed those registers? What is it trying to figure out?
> 
> [Peng Fan] I am running Linux 5.4 kernel dom0, gic_peek_irq triggers abort.
> 
> 
> 
> Juergen, I think this fix should be in the release (and also
> backported to stable trees.)
> 
> Without an understanding of the problem, I disagree with this request (see above).
> 
> As an aside, the range ISPENDR  has the same issue.
> 
> [Peng Fan] Should I include this change in v2? Or develop new method to fix the issue?
> But at least dom0 abort when boot.

Also considering Andre's reply, yes, please send another patch to fix
for ISPENDR too. It doesn't have to be the same patch.

Thank you!
 
 
> 
> 
> 
> > ---
> >  xen/arch/arm/vgic-v3.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> > index 422b94f902..e802f2055a 100644
> > --- a/xen/arch/arm/vgic-v3.c
> > +++ b/xen/arch/arm/vgic-v3.c
> > @@ -706,7 +706,7 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
> >          goto read_as_zero;
> >  
> >      /* Read the active status of an IRQ via GICD/GICR is not supported */
> > -    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVER):
> > +    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
> >      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
> >          goto read_as_zero;
> >  
> > -- 
> > 2.16.4
> > 
> 
> _______________________________________________
> Xen-devel mailing list
> mailto:Xen-devel@lists.xenproject.org
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.xenproject.org%2Fmailman%2Flistinfo%2Fxen-devel&data=02%7C01%7Cpeng.fan%40nxp.com%7C33f2e907cdc84ed0a48608d7649d359e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637088498678782239&sdata=G3FA2vefr56FeUX5QVZQwSzG22nfv1m%2F0fKIDOnfuFQ%3D&reserved=0
> 
--8323329-1172271277-1573580150=:2863
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1172271277-1573580150=:2863--

