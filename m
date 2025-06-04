Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E147FACE632
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 23:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005970.1385253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMvlp-0003Hr-6n; Wed, 04 Jun 2025 21:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005970.1385253; Wed, 04 Jun 2025 21:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMvlp-0003Fm-3w; Wed, 04 Jun 2025 21:35:37 +0000
Received: by outflank-mailman (input) for mailman id 1005970;
 Wed, 04 Jun 2025 21:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Klp=YT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMvln-0003Fg-Sk
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 21:35:35 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d83ca4cf-418b-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 23:35:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 772DD6115E;
 Wed,  4 Jun 2025 21:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40313C4CEE4;
 Wed,  4 Jun 2025 21:35:31 +0000 (UTC)
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
X-Inumbo-ID: d83ca4cf-418b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749072932;
	bh=TqRbb2Q1Gkn8kaZ/od4bxmZLkh5e3Ze666f1MwY/wjI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c64vpUJDSIdCwFnb9wtJFt5zwRDk1BdWBJdys2FayArSgBBeN532xhK0fMk13YCt2
	 efz4wvq0REk63sO3o871xDlh6W9dX+JlCvyryzI10whxD2AJoUeXURXkjtAJ1gU8ao
	 bX6qOIaLgabWXXL2RwdrcKA+GWPCpkEr5aMQmT/USuFkzzWBGbbsdprTawV4+rPMp2
	 51aT6VldPLsgjhH1QlybNadiIhBzMMFT79U/mCfRCHVFpxGpcr4DE8wWg9BdYfdl3K
	 K91TJldwR80ZCQNutED+7uiTZAasi+y5fEUT2cIvThK0i99Pbr3x57FU/xfja8uuuo
	 QqjAv9mRLde+w==
Date: Wed, 4 Jun 2025 14:35:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jahan Murudi <jahan.murudi.zg@renesas.com>
cc: "Orzel, Michal" <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] arm/vgic-v2: Fix undefined behavior in
 vgic_fetch_itargetsr()
In-Reply-To: <OSOPR01MB1240844B24BCC5F45EEF29CDBAB6CA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2506041435090.2495561@ubuntu-linux-20-04-desktop>
References: <20250601163212.2988162-1-jahan.murudi.zg@renesas.com> <01c5ad19-2add-4270-948d-ecdf3d5e8bd6@amd.com> <OSOPR01MB1240844B24BCC5F45EEF29CDBAB6CA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Yes, I committed it. Thank you for the ping.

Cheers,

Stefano

On Wed, 4 Jun 2025, Jahan Murudi wrote:
>  Hi Stefano/Julien,
> 
> This v2 patch was reviewed-by Michal Orzel on 2nd June. Could it be merged?
> 
> Link : https://patchwork.kernel.org/project/xen-devel/patch/20250601163212.2988162-1-jahan.murudi.zg@renesas.com/
> 
> Thanks, 
> Jahan Murudi
> 
> 
> -----Original Message-----
> From: Orzel, Michal <michal.orzel@amd.com> 
> Sent: 02 June 2025 12:24
> To: Jahan Murudi <jahan.murudi.zg@renesas.com>; xen-devel@lists.xenproject.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis <bertrand.marquis@arm.com>; Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Subject: Re: [PATCH v2] arm/vgic-v2: Fix undefined behavior in vgic_fetch_itargetsr()
> 
> 
> 
> On 01/06/2025 18:32, Jahan Murudi wrote:
> > The current implementation performs left shift operations that may 
> > trigger undefined behavior when the target value is too large. This patch:
> > 
> > 1. Changes the shift from signed (1) to unsigned (1U) to ensure 
> > well-defined
> NIT for the future: Use imperative mood
> 
> >    behavior for all valid target values 2. Maintains identical 
> > functionality while fixing the UBSAN warning
> > 
> > The issue was detected by UBSAN:
> > (XEN) UBSAN: Undefined behaviour in arch/arm/vgic-v2.c:73:56
> > (XEN) left shift of 128 by 24 places cannot be represented in type 'int'
> > (XEN) Xen WARN at common/ubsan/ubsan.c:174
> > 
> > Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 
> > 
> > ---
> > Changed since v1:
> >  * Added space after subject line
> > ---
> >  xen/arch/arm/vgic-v2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c index 
> > a19d610178..642407fd5b 100644
> > --- a/xen/arch/arm/vgic-v2.c
> > +++ b/xen/arch/arm/vgic-v2.c
> > @@ -70,7 +70,7 @@ static uint32_t vgic_fetch_itargetsr(struct vgic_irq_rank *rank,
> >      offset &= ~(NR_TARGETS_PER_ITARGETSR - 1);
> >  
> >      for ( i = 0; i < NR_TARGETS_PER_ITARGETSR; i++, offset++ )
> > -        reg |= (1 << read_atomic(&rank->vcpu[offset])) << (i * NR_BITS_PER_TARGET);
> > +        reg |= (1U << read_atomic(&rank->vcpu[offset])) << (i * 
> > + NR_BITS_PER_TARGET);
> >  
> >      return reg;
> >  }
> 
> 

