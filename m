Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FE22B5D59
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 11:55:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28909.58052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keye9-0004PW-IZ; Tue, 17 Nov 2020 10:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28909.58052; Tue, 17 Nov 2020 10:55:37 +0000
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
	id 1keye9-0004P9-F2; Tue, 17 Nov 2020 10:55:37 +0000
Received: by outflank-mailman (input) for mailman id 28909;
 Tue, 17 Nov 2020 10:55:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1keye8-0004P4-BP
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 10:55:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1619ef4f-0b0f-4656-9671-5d22267930e3;
 Tue, 17 Nov 2020 10:55:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0979AACAC;
 Tue, 17 Nov 2020 10:55:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1keye8-0004P4-BP
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 10:55:36 +0000
X-Inumbo-ID: 1619ef4f-0b0f-4656-9671-5d22267930e3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1619ef4f-0b0f-4656-9671-5d22267930e3;
	Tue, 17 Nov 2020 10:55:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605610534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tfa9QtYIAf/6uVkF4jzi1W9iwf4qW8zRvyaGVxS+W30=;
	b=Wu2LVXOzGH0c9ILBZIU+dEhgWPZE5eQBuV8HhRJ+pk0WqiFZNjTqCbTcaVl1jQ/upWeIxC
	8ICwixC7KYotDA5gTskCv2L0zPYFw4YpgnPG8mm+W1QWlYa2zxOuu4lPDZw1czWOeNMip8
	Zmp/EGpQhFEsQrOsxuq0wws6WsT/uBU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0979AACAC;
	Tue, 17 Nov 2020 10:55:34 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd5fa7bb-7c44-1ec0-fc57-3ecf01c7d651@suse.com>
Date: Tue, 17 Nov 2020 11:55:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.11.2020 13:25, Rahul Singh wrote:
> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
> is enabled for ARM, compilation error is observed for ARM architecture
> because ARM platforms do not have full PCI support available.

While you've extended the sentence, it remains unclear to me what
compilation error it is that results here. I've requested such
clarification for v2 already.

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -4,6 +4,10 @@ config HAS_NS16550
>  	help
>  	  This selects the 16550-series UART support. For most systems, say Y.
>  
> +config HAS_NS16550_PCI
> +	def_bool y
> +	depends on X86 && HAS_NS16550 && HAS_PCI

Looking at this again (in particular at all the #ifdef changes in
the actual source file), I wonder whether an approach with less
code churn and without such an extra Kconfig setting (with, as
said, a bogus dependency on x86) couldn't be found. For example,
how about ...

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -16,7 +16,7 @@
>  #include <xen/timer.h>
>  #include <xen/serial.h>
>  #include <xen/iocap.h>
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_NS16550_PCI
>  #include <xen/pci.h>
>  #include <xen/pci_regs.h>
>  #include <xen/pci_ids.h>

... #undef-ining CONFIG_HAS_PCI at a suitable position in this
file (e.g. after all #include-s, to make sure all structure
layouts remain correct)? This would then be far easier to revert
down the road, and would confine the oddity to a single file
(and there a single place) in the code base.

Jan

