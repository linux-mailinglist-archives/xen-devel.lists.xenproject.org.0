Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC69B461501
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 13:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234517.406947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrfii-0003JZ-DU; Mon, 29 Nov 2021 12:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234517.406947; Mon, 29 Nov 2021 12:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrfii-0003HG-9v; Mon, 29 Nov 2021 12:25:20 +0000
Received: by outflank-mailman (input) for mailman id 234517;
 Mon, 29 Nov 2021 12:25:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lt1X=QQ=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1mrfih-0003HA-0R
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 12:25:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65f0a4c4-510f-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 13:25:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78FAEB80EF6;
 Mon, 29 Nov 2021 12:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B20C53FCB;
 Mon, 29 Nov 2021 12:25:13 +0000 (UTC)
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
X-Inumbo-ID: 65f0a4c4-510f-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638188714;
	bh=vVGXvjPDMi84to5KYib8TrTlpofQ/6VLMri24F/PIhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2Ny2mM+6L78B/lw0pJBcBtnRNgBs6wFuXpd5/YgczUShLRRmxrOH+P0VEL+oVqUa
	 8a5673geUU9QV4scX2y9DbO6ZbjqWq/2ezEWtz21dpjobM6w1QcMrw0VsboF6+dfde
	 BTX9qG3oTpqzwpMzzLw6760QcOhGez/+nZ0T5A4o=
Date: Mon, 29 Nov 2021 13:25:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Patches for stable 5.10 kernel
Message-ID: <YaTGp3Tl1ZYvDaSt@kroah.com>
References: <59ff38c4-8355-ecf6-040d-1234320a806b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59ff38c4-8355-ecf6-040d-1234320a806b@suse.com>

On Mon, Nov 29, 2021 at 08:19:18AM +0100, Juergen Gross wrote:
> Hi Greg,
> 
> could you please add the following upstream patches to the stable 5.10
> kernel (I'll send separate mails for the older stable kernels as some
> of the patches don't apply for those)? They are hardening Xen PV
> frontends against attacks from related backends.
> 
> Qubes-OS has asked for those patches to be added to stable, too.
> 
> 629a5d87e26fe96b ("xen: sync include/xen/interface/io/ring.h with Xen's
> newest version")
> 71b66243f9898d0e ("xen/blkfront: read response from backend only once")
> 8f5a695d99000fc3 ("xen/blkfront: don't take local copy of a request from the
> ring page")
> b94e4b147fd1992a ("xen/blkfront: don't trust the backend response data
> blindly")
> 8446066bf8c1f9f7 ("xen/netfront: read response from backend only once")
> 162081ec33c2686a ("xen/netfront: don't read data from request on the ring
> page")
> 21631d2d741a64a0 ("xen/netfront: disentangle tx_skb_freelist")
> a884daa61a7d9165 ("xen/netfront: don't trust the backend response data
> blindly")
> e679004dec37566f ("tty: hvc: replace BUG_ON() with negative return value")
> 

All now queued up, thanks.

But people should be moving to the 5.15 kernel by now and not sticking
with 5.10 anymore for stuff like this.

greg k-h

