Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDEC7C9157
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616955.959380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRfb-0002fg-PS; Fri, 13 Oct 2023 23:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616955.959380; Fri, 13 Oct 2023 23:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRfb-0002bY-La; Fri, 13 Oct 2023 23:34:15 +0000
Received: by outflank-mailman (input) for mailman id 616955;
 Fri, 13 Oct 2023 23:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRfa-0002Av-Dv
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:34:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03e8bc35-6a21-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 01:34:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5FEDEB82BDB;
 Fri, 13 Oct 2023 23:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269E3C433C7;
 Fri, 13 Oct 2023 23:34:09 +0000 (UTC)
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
X-Inumbo-ID: 03e8bc35-6a21-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697240051;
	bh=7Jnvljk4A8R6cLhI1FwCrexxfLiAVfdNHU6trvGWHrM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fkOmziSaNcP7Hghv54IzNJ2n+Df3WFYf5zoh4qHvcNvnFSTnG5hhOgzuudvxm1uh+
	 96i3mxlSS5Ta1EqmwtzBA6Wkb8WhRTvOQ4VRkrZmnxVUaQV/03wbQ10Pim0rDhH7iq
	 1Pqf7XwFI/yZi/gFA31MzYf0JAsv9AaPrzeIoxnw5b+yCt1BEjrcPW25AaUo8GW86+
	 SEHQkDGcndStZaqJXkmUL0ZAs6uUfACBGa/ps9xrO6PO9VexulrhCytT+HIESdQD6L
	 K/bMWAWd1W9yZA0r7ugQSyyV8ci14YAyi3/7Sxpy+xo3Qe8w3o5eoUdLWKm03HOGca
	 jBHAIzrX+Fuyw==
Date: Fri, 13 Oct 2023 16:34:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 02/10] arm/cpufeature: address violations of MISRA
 C:2012 Rule 8.2
In-Reply-To: <alpine.DEB.2.22.394.2310131610440.965337@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2310131633520.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <3b28dca993cac9391b997c1744218cf4062907df.1697207038.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2310131610440.965337@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Stefano Stabellini wrote:
> On Fri, 13 Oct 2023, Federico Serafini wrote:
> > Add missing parameter names, no functional change.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > ---
> >  xen/arch/arm/include/asm/cpufeature.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> > index 8011076b8c..41e97c23dd 100644
> > --- a/xen/arch/arm/include/asm/cpufeature.h
> > +++ b/xen/arch/arm/include/asm/cpufeature.h
> > @@ -127,8 +127,8 @@ static inline void cpus_set_cap(unsigned int num)
> >  struct arm_cpu_capabilities {
> >      const char *desc;
> >      u16 capability;
> > -    bool (*matches)(const struct arm_cpu_capabilities *);
> > -    int (*enable)(void *); /* Called on every active CPUs */
> > +    bool (*matches)(const struct arm_cpu_capabilities *caps);
> 
> all the implementations of matches I found in xen/arch/arm/cpuerrata.c
> actually call the parameter "entry"
> 
> 
> > +    int (*enable)(void *ptr); /* Called on every active CPUs */
> 
> this one instead is "data"

I committed all the other patches in this series to the my for-4.19 branch

