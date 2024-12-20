Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A869F8E4F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 09:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861733.1273806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYl2-0005UW-OS; Fri, 20 Dec 2024 08:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861733.1273806; Fri, 20 Dec 2024 08:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYl2-0005SR-Ll; Fri, 20 Dec 2024 08:53:16 +0000
Received: by outflank-mailman (input) for mailman id 861733;
 Fri, 20 Dec 2024 08:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qSC2=TN=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1tOYl0-0005SL-B6
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 08:53:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7995324-beaf-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 09:53:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 14F5F5C0267;
 Fri, 20 Dec 2024 08:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43266C4CED6;
 Fri, 20 Dec 2024 08:53:10 +0000 (UTC)
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
X-Inumbo-ID: d7995324-beaf-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734684790;
	bh=P1OC0d+7eswfuTcqYH0V8dMNSAezRS37ZcjQlhmq96U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aV6+K+XuIZikyNRaQ9AbkeqbOhOyXCH6ROjrjwtbZOUuaHWAiH4vm259qK3TeJPPG
	 lRW4JsJH6QVDqoVxYOTDtMPmxAJyQLein7z01dl3TxB6vOAw0T6T3V/ncIilRBp4Yi
	 26ki35QMqg/k4Uxv+M/DH/WOkzbcUeVtfQ1S4foU=
Date: Fri, 20 Dec 2024 09:53:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ariel Otilibili-Anieli <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: linux-kernel@vger.kernel.org, Jan Beulich <jbeulich@suse.com>,
	stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/1] lib: Remove dead code
Message-ID: <2024122052-laurel-showbiz-4d7b@gregkh>
References: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-2-ariel.otilibili-anieli@eurecom.fr>
 <2024122042-guidable-overhand-b8a9@gregkh>
 <2f7a82-67652e80-9181-6eae3780@215109797>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f7a82-67652e80-9181-6eae3780@215109797>

On Fri, Dec 20, 2024 at 09:44:31AM +0100, Ariel Otilibili-Anieli wrote:
> On Friday, December 20, 2024 08:09 CET, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Thu, Dec 19, 2024 at 11:45:01PM +0100, Ariel Otilibili wrote:
> > > This is a follow up from a discussion in Xen:
> > > 
> > > The if-statement tests `res` is non-zero; meaning the case zero is never reached.
> > > 
> > > Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com/
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > > Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
> > > --
> > > Cc: stable@vger.kernel.org
> > 
> > Why is "removing dead code" a stable kernel thing?
> 
> Hello Greg,
> 
> It is what I understood from the process:
> 
> "Attaching a Fixes: tag does not subvert the stable kernel rules process nor the requirement to Cc: stable@vger.kernel.org on all stable patch candidates." [1]
> 
> Does my understanding make sense?

I'm confused, what are you expecting to happen here?  Why is this even
marked as a "fix"?

> [1] https://docs.kernel.org/process/submitting-patches.html

Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

for the stable kernel rules.

Again, you have a "cc: stable@..." in your patch, why?

thanks,

greg k-h

