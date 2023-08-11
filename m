Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A6779ADC
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 00:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582699.912582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUb3A-0008Rf-6b; Fri, 11 Aug 2023 22:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582699.912582; Fri, 11 Aug 2023 22:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUb3A-0008Os-3h; Fri, 11 Aug 2023 22:56:08 +0000
Received: by outflank-mailman (input) for mailman id 582699;
 Fri, 11 Aug 2023 22:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUb39-0008Oi-0b
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 22:56:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e4e5115-389a-11ee-8613-37d641c3527e;
 Sat, 12 Aug 2023 00:56:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 698A464B3B;
 Fri, 11 Aug 2023 22:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0EFC433C8;
 Fri, 11 Aug 2023 22:55:59 +0000 (UTC)
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
X-Inumbo-ID: 3e4e5115-389a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691794560;
	bh=yaA1XgRbB9ffSfcZ2snMlBLvfLeO1nvTAgSfJUKVNbU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MB0wnBt+ajgEcNA6qkzg4BD5OnGkV5YSom8wTkVDRf+/LWt+mVyxUlDAK9Jk7fx6x
	 dl69qYOh1ydHk9YlQZQpyogMwJWPb91ZRvavRRjr7w94eCWMD8Pc+FjkV5Mhc7l2YN
	 rj8xcI3AVqhgQ+jTzPXGnAI+O0QR6C8mfLvowVovsg8xnLFdAfzPU8UDV3v1WyB02i
	 bEaeO9ppUZJpfvzGgwkPB9q5qzkGQcnfEJFvYoiGVixcss0fQ4o5owSDWxGCWBvde0
	 LXy2rembOkvH43OD4kHan5cgyRFshsrO2hdP2pTNmeLms6GhIZZoZDDa81eNFAGuiM
	 NdcIk3wRNflgg==
Date: Fri, 11 Aug 2023 15:55:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com
Subject: Re: [XEN PATCH 1/6] x86/hpet: make variable 'per_cpu__cpu_bc_channel'
 static
In-Reply-To: <alpine.DEB.2.22.394.2308111554360.2127516@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2308111555370.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com> <5e13888db7b69cee21e5367ce8750fbdc1e22d5c.1691676251.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2308111554360.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Adding x86 maintainers

On Fri, 11 Aug 2023, Stefano Stabellini wrote:
> On Fri, 11 Aug 2023, Nicola Vetrini wrote:
> > The variable is only ever used inside the file where it's
> > defined, therefore it can have static storage. This also
> > resolves a violation of MISRA C:2012 Rule 8.4 due to the absence
> > of a declaration prior to the definition.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> > ---
> >  xen/arch/x86/hpet.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> > index a2df1c7df401..79c07f6a9e09 100644
> > --- a/xen/arch/x86/hpet.c
> > +++ b/xen/arch/x86/hpet.c
> > @@ -49,7 +49,7 @@ static struct hpet_event_channel *__read_mostly hpet_events;
> >  /* msi hpet channels used for broadcast */
> >  static unsigned int __read_mostly num_hpets_used;
> >  
> > -DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
> > +static DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
> >  
> >  unsigned long __initdata hpet_address;
> >  int8_t __initdata opt_hpet_legacy_replacement = -1;
> > -- 
> > 2.34.1
> > 
> 

