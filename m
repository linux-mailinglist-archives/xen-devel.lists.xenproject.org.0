Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DBE80FA7A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 23:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653616.1020028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBOj-0004lH-Cb; Tue, 12 Dec 2023 22:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653616.1020028; Tue, 12 Dec 2023 22:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBOj-0004ii-8x; Tue, 12 Dec 2023 22:38:41 +0000
Received: by outflank-mailman (input) for mailman id 653616;
 Tue, 12 Dec 2023 22:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDBOh-0004iY-Af
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 22:38:39 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30c4cb89-993f-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 23:38:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 267B8B817CA;
 Tue, 12 Dec 2023 22:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFE8C433C7;
 Tue, 12 Dec 2023 22:38:35 +0000 (UTC)
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
X-Inumbo-ID: 30c4cb89-993f-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702420716;
	bh=CtG2DfxlAksLVIdyYgnqD1BqwaGgnM13hz70YTyLgok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OqbcEOGrXIDx/4Qec4va0UclQAsLOl20ESvfQNFbqmHCegaJV7Qb9TUorVj5WmcVY
	 E7B+Dp760r3sgpUME7jUTDjoiEYDRJAeyaz6ec2isvbKc7XOzdGcPLTpht+GLC1EYl
	 PSQBFRFSK8looUFGm5I8S+kui9Gfm5TfKRm2Zo9DitB7FrUvjpVbII4ibto8s+Scyu
	 Bb3GFhAFStNvoE4D5iqht/TRJuId2b/3BknA3ycUEr/RdO2XRwgz4ry2fRuXopRHjx
	 n2LGA0b0GJGVTfsXvThRqvhfys/Gia259QKc1+nQuI2u2sn2/cblyCDjE8tiV5QRFh
	 YHpxCZJ/glVZg==
Date: Tue, 12 Dec 2023 14:38:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    consulting@bugseng.com, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 6/7] x86/platform: removed break to address MISRA
 C:2012 Rule 2.1
In-Reply-To: <a8c42909-6316-448b-8d21-628d055abfbc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312121437280.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com> <b1103bc13d5ce04159417592705b4fe6a6db748b.1702283415.git.nicola.vetrini@bugseng.com> <a8c42909-6316-448b-8d21-628d055abfbc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Dec 2023, Jan Beulich wrote:
> On 11.12.2023 11:30, Nicola Vetrini wrote:
> > The break statement is redundant, hence it can be removed.
> 
> Except ...
> 
> > --- a/xen/arch/x86/platform_hypercall.c
> > +++ b/xen/arch/x86/platform_hypercall.c
> > @@ -723,7 +723,6 @@ ret_t do_platform_op(
> >  
> >          ret = continue_hypercall_on_cpu(
> >              0, cpu_down_helper, (void *)(unsigned long)cpu);
> > -        break;
> >      }
> >      break;
> 
> ... it wants to be the other break that is removed, imo.

I was also about to comment about which of the two breaks to remove... I
didn't know if there are x86 specific conventions so I didn't say
anything about it. But I also think it is more natural to keep the other
break.

