Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759CDB46740
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112829.1460995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufx0-0003VA-8Q; Fri, 05 Sep 2025 23:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112829.1460995; Fri, 05 Sep 2025 23:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufx0-0003Sy-5h; Fri, 05 Sep 2025 23:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1112829;
 Fri, 05 Sep 2025 23:34:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufwy-0003Sm-Lp
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:34:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufwx-008AO2-10;
 Fri, 05 Sep 2025 23:34:35 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufwx-0005QU-0t;
 Fri, 05 Sep 2025 23:34:35 +0000
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
	:Subject:Cc:To:Date:From; bh=awcIl7NCsITYjFzyd6+CIfJ2lT+m+hjAFmrdSiEFxXo=; b=
	YfvswKdw5V/sLO9tJ3GC2wzt7OPtqwunatsx8XIfC0wAslISISLlP6bBJgQlpn3hk4n82Tutlptkc
	53sdf+AvdOjrmrxQArdS9hZ3vuoTBdiuIo+TXRiiDzpyrh7XwbV/tgs/BNkBuJXKUta5XWxy4bWDZ
	1qtHSDSncjU5N9vRg=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 16:34:34 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 03/15] emul/ns16x50: implement emulator stub
Message-ID: <aLtziiHkJjGL/OEp@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-4-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291237100.341243@ubuntu-linux-20-04-desktop>
 <aLYoF3PV/ApgosUb@kraken>
 <7a9210e1-d579-48e1-99ca-1685d7561529@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a9210e1-d579-48e1-99ca-1685d7561529@suse.com>

On Tue, Sep 02, 2025 at 11:32:31AM +0200, Jan Beulich wrote:
> On 02.09.2025 01:11, dmukhin@xen.org wrote:
> > On Fri, Aug 29, 2025 at 12:57:43PM -0700, Stefano Stabellini wrote:
> >> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> >>> --- a/xen/common/emul/vuart/Kconfig
> >>> +++ b/xen/common/emul/vuart/Kconfig
> >>> @@ -3,4 +3,22 @@ config VUART_FRAMEWORK
> >>>  
> >>>  menu "UART Emulation"
> >>>  
> >>> +config VUART_NS16X50
> >>> +	bool "NS16550-compatible UART Emulator" if EXPERT
> >>> +	depends on X86 && HVM
> >>> +	select VUART_FRAMEWORK
> >>
> >> default n
> > 
> > Ack
> 
> No "default n" should ever be put anywhere; it's simply redundant.

Kept code as is in v6.

