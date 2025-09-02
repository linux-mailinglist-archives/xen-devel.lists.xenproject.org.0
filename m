Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D71B3FD8F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 13:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106147.1456899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utP0A-0002vz-Tb; Tue, 02 Sep 2025 11:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106147.1456899; Tue, 02 Sep 2025 11:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utP0A-0002uW-R0; Tue, 02 Sep 2025 11:16:38 +0000
Received: by outflank-mailman (input) for mailman id 1106147;
 Tue, 02 Sep 2025 11:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MvLi=3N=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1utP0A-0002uQ-4i
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 11:16:38 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 499a24e2-87ee-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 13:16:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C2F37601D3;
 Tue,  2 Sep 2025 11:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C530CC4CEED;
 Tue,  2 Sep 2025 11:16:33 +0000 (UTC)
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
X-Inumbo-ID: 499a24e2-87ee-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756811794;
	bh=4Xr3MgVLvcyS3MYbKzhy65gyGhMd61jNWAJJSRf8Jbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAY/WZU1oMdEysLvHbsplShcI8d+z7cbsIKf4eIoisPpKBDDB8yuoMtlyFHbE6lrt
	 d6/iUnK3dEX0a5wFKmnSLFXF2M63iGcIH0cHJ3hrrMocqnjS1IiAMR/aE/dju788xp
	 3zaW4SC8vuxwdbO1I7BZQJHGzKBt61+/jWbiovAg=
Date: Tue, 2 Sep 2025 13:16:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, stable@vger.kernel.org,
	Juergen Gross <jgross@suse.com>, kernel test robot <lkp@intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v5.10.y] xen: replace xen_remap() with memremap()
Message-ID: <2025090203-clothes-bullish-a21f@gregkh>
References: <4cc9c1f583fb4bfca02ff7050b9b01cb9abb7e7f.1756803599.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cc9c1f583fb4bfca02ff7050b9b01cb9abb7e7f.1756803599.git.teddy.astie@vates.tech>

On Tue, Sep 02, 2025 at 09:28:32AM +0000, Teddy Astie wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> From: Juergen Gross <jgross@suse.com>
> 
> [ upstream commit 41925b105e345ebc84cedb64f59d20cb14a62613 ]
> 
> xen_remap() is used to establish mappings for frames not under direct
> control of the kernel: for Xenstore and console ring pages, and for
> grant pages of non-PV guests.
> 
> Today xen_remap() is defined to use ioremap() on x86 (doing uncached
> mappings), and ioremap_cache() on Arm (doing cached mappings).
> 
> Uncached mappings for those use cases are bad for performance, so they
> should be avoided if possible. As all use cases of xen_remap() don't
> require uncached mappings (the mapped area is always physical RAM),
> a mapping using the standard WB cache mode is fine.
> 
> As sparse is flagging some of the xen_remap() use cases to be not
> appropriate for iomem(), as the result is not annotated with the
> __iomem modifier, eliminate xen_remap() completely and replace all
> use cases with memremap() specifying the MEMREMAP_WB caching mode.
> 
> xen_unmap() can be replaced with memunmap().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> Link: https://lore.kernel.org/r/20220530082634.6339-1-jgross@suse.com
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech> [backport to 5.10.y]
> ---

Why is this needed for 5.10.y at all?  What bug does it fix?  And why
are you still using Xen on a 5.10.y kernel?  What prevents you from
moving to a newer one?

thanks,

greg k-h

