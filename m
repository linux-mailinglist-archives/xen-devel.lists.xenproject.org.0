Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58157B4673E
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112821.1460985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufwW-00032P-0m; Fri, 05 Sep 2025 23:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112821.1460985; Fri, 05 Sep 2025 23:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufwV-00030O-UV; Fri, 05 Sep 2025 23:34:07 +0000
Received: by outflank-mailman (input) for mailman id 1112821;
 Fri, 05 Sep 2025 23:34:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufwU-00030I-DU
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:34:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufwS-008ANg-2G;
 Fri, 05 Sep 2025 23:34:04 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufwS-0005QN-22;
 Fri, 05 Sep 2025 23:34:04 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=fE7dfamD3/y6Do8P8KllY6vbBuhY9YcldmKhoAUq324=; b=
	ozGLzVylFoCz98McC8cnuTlnSVXrPs7Mrsdilm3NwQM/G18moXeHzuYG7YMYz4jT0K3orJtVOjb+z
	Yz7o2DUF1DzsJRomFvAWq0R5wK+9sGmP89irMyW9JC9jeOj/VW/w9E3j2Gdx+GaP2C8wxUROoDxz6
	FGUvPW1ZmgY8z+XLs=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 16:34:03 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 03/15] emul/ns16x50: implement emulator stub
Message-ID: <aLtza997gsdL4ikv@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-4-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291237100.341243@ubuntu-linux-20-04-desktop>
 <d2f16c51-9557-4185-a603-cb161ce1cf7d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2f16c51-9557-4185-a603-cb161ce1cf7d@suse.com>

On Tue, Sep 02, 2025 at 11:36:19AM +0200, Jan Beulich wrote:
> On 29.08.2025 21:57, Stefano Stabellini wrote:
> > On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> >> +static void cf_check ns16x50_free(void *arg)
> >> +{
> >> +    struct vuart_ns16x50 *vdev = arg;
> >> +
> >> +    if ( vdev )
> >> +        ns16x50_deinit(vdev);
> >> +
> >> +    XVFREE(vdev);
> > 
> > XVFREE should only be called if ( vdev )
> 
> Why would this be? Like free(), both xfree() and xvfree() are fine to be
> called with a NULL pointer. What's odd here is that the uppercase form (the
> wrapper macro) is used - clearing the local variable is pointless when it
> is about to go out of scope anyway.

Thank you for remark!
I switched the code to xvfree() in v6

