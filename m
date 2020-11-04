Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A602A67DC
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 16:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19372.44518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaKsu-0002Rk-7T; Wed, 04 Nov 2020 15:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19372.44518; Wed, 04 Nov 2020 15:39:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaKsu-0002RL-4C; Wed, 04 Nov 2020 15:39:40 +0000
Received: by outflank-mailman (input) for mailman id 19372;
 Wed, 04 Nov 2020 15:39:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaKss-0002RG-CC
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 15:39:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d62c1c1-e3e5-486a-8086-f3045d38ccef;
 Wed, 04 Nov 2020 15:39:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3F70ABA2;
 Wed,  4 Nov 2020 15:39:36 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaKss-0002RG-CC
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 15:39:38 +0000
X-Inumbo-ID: 1d62c1c1-e3e5-486a-8086-f3045d38ccef
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1d62c1c1-e3e5-486a-8086-f3045d38ccef;
	Wed, 04 Nov 2020 15:39:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604504376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GboMbT+pyZmsPKTO86iWLZYJtotRgzMxxvlstftZ6Fs=;
	b=Pvc+wS0/ieBA8mHHyOhd4Rzd1LhQLBAWuKuXKN9CrgIxU0ooWzOWFcEBgvxSy4tkxfIBwv
	y/j/9SNuVKaswRYQulvFCywIpqOOma+YDPpYcYrF3ibsVGOrUUpxPIASdb5JimosHij6ix
	KOFx5+nnqqVC2UaToWlVmoVbzscwpnI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A3F70ABA2;
	Wed,  4 Nov 2020 15:39:36 +0000 (UTC)
Subject: Re: [PATCH v2 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
To: Rahul Singh <rahul.singh@arm.com>
Cc: Bertrand.Marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1604417224.git.rahul.singh@arm.com>
 <2aa79510731918d78d515a1679cc141fcf16883e.1604417224.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3863995-b8c3-bf9b-f6c2-957a88e9c6bc@suse.com>
Date: Wed, 4 Nov 2020 16:39:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2aa79510731918d78d515a1679cc141fcf16883e.1604417224.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.11.2020 16:59, Rahul Singh wrote:
> ARM platforms do not have PCI support available. When CONFIG_HAS_PCI
> is enabled for ARM a compilation error is observed for ns16550 driver.

I still don't really agree to the approach taken together with
the wording. If Arm was to select HAS_PCI, my expectation would
be that this file compiled fine. You don't mention what
compilation error it is that results, so it's hard to judge if
I'm completely wrong. If, however, this is just a shortcoming
of the Arm implementation right now, then I'd like to ask that
the description here be worded to this effect. This will then
make it easier to understand that the change here can really
be reverted without much further consideration.

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -4,6 +4,13 @@ config HAS_NS16550
>  	help
>  	  This selects the 16550-series UART support. For most systems, say Y.
>  
> +config HAS_NS16550_PCI
> +	def_bool y
> +	depends on X86 && HAS_NS16550 && HAS_PCI
> +	help
> +	  This selects the 16550-series UART PCI support.For most systems,
> +	  say Y.

There's not much point for a prompt-less option to have help
text. There's definitely no point telling what to select when
really there's nothing to select, due to the lack of a prompt.

Jan

