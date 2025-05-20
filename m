Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26D7ABE3FF
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 21:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991077.1374987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHSvf-00043h-V3; Tue, 20 May 2025 19:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991077.1374987; Tue, 20 May 2025 19:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHSvf-00041g-SQ; Tue, 20 May 2025 19:47:11 +0000
Received: by outflank-mailman (input) for mailman id 991077;
 Tue, 20 May 2025 19:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHSve-00041a-Ph
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 19:47:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 365e5d74-35b3-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 21:47:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE3875C5A05;
 Tue, 20 May 2025 19:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFCBC4CEE9;
 Tue, 20 May 2025 19:47:05 +0000 (UTC)
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
X-Inumbo-ID: 365e5d74-35b3-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747770426;
	bh=1DZIIC5dMR306c0R3it4IKiqW5SI0mtSJAhF+S37bFM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lZiad7QQ+pGU2LCB1cp1weu4LJtHTLVuvYzIX8oXtI7brAvhpbsmRnw/TtaRvV0SG
	 GrYGvah3VLhzM+ySOw1ynMhP6OxNdFc6UR4gb2DOqrkLrg6Le21GhZBLa9ed/OI87G
	 pPvmgyvGIwU6EQyeu79qgBhR0UhkN+qjchf30Ao+UdtM9Gw+xK4+zVCeZrOhBuKn+h
	 PsQFDUqZVE14Zggy4TGYep57ofvfSqKzNCZWLDH8Pgr1jQrLSqqgikw7poPoVma3ED
	 BL2Wn+gXd3sxgn3H2T8bw4U/Lax0gvLs/71C5ON2Lr2VR1ND5Vg6n6sF2Gz0e6/F+a
	 e0SNY/qrNuARg==
Date: Tue, 20 May 2025 12:47:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Give compile.h header guards
In-Reply-To: <4b580922-4aac-44bc-ad14-75a250ac7962@suse.com>
Message-ID: <alpine.DEB.2.22.394.2505201246381.2019926@ubuntu-linux-20-04-desktop>
References: <20250519135227.27386-1-andrew.cooper3@citrix.com> <a967e60c-0474-46ac-87c0-d1d6ce5ce289@suse.com> <alpine.DEB.2.22.394.2505191431140.145034@ubuntu-linux-20-04-desktop> <4b580922-4aac-44bc-ad14-75a250ac7962@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 May 2025, Jan Beulich wrote:
> On 19.05.2025 23:34, Stefano Stabellini wrote:
> > On Mon, 19 May 2025, Jan Beulich wrote:
> >> On 19.05.2025 15:52, Andrew Cooper wrote:
> >>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>
> >> Is this to please Misra in some way?
> >>
> >>> --- a/xen/include/xen/compile.h.in
> >>> +++ b/xen/include/xen/compile.h.in
> >>> @@ -1,3 +1,6 @@
> >>> +#ifndef XEN_COMPILE_H
> >>> +#define XEN_COMPILE_H
> >>> +
> >>>  #define XEN_COMPILE_DATE	"@@date@@"
> >>>  #define XEN_COMPILE_TIME	"@@time@@"
> >>>  #define XEN_COMPILE_BY		"@@whoami@@"
> >>> --- a/xen/tools/process-banner.sed
> >>> +++ b/xen/tools/process-banner.sed
> >>> @@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
> >>>  
> >>>  # Trailing \ on all but the final line.
> >>>  $!s_$_ \\_
> >>> +
> >>> +# Append closing header guard
> >>> +$a\
> >>> +\
> >>> +#endif /* XEN_COMPILE_H */
> >>
> >> This split of #ifndef and #endif is ugly. Can't we switch to something
> >> more conventional, like
> >>
> >> #define XEN_BANNER		"@@banner@@"
> >>
> >> with the first sed invocation then replacing this by the result of
> >> a nested sed invocation using process-banner.sed (which of course would
> >> need adjusting some)? (Maybe the double quotes would need omitting here,
> >> for process-banner.sed to uniformly apply them.)
> > 
> > While I agree with Jan that this is kind of ugly, it is a unique case
> > and I would prefer an ugly but simple solution than a more complex
> > solution. This would be different if we were talking about a widespread
> > pattern, in which case the price for complexity would be worth it.
> > 
> > My 2 cents in this case are in favor of the simplest approach. I would
> > ack this patch.
> 
> Feel free to do so; my comment was not meant as a plain objection, but more
> as a suggestion. The one thing I would ask for is a non-empty description,
> though.

Fair enough. Andrew, please add a better commit message. With that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

