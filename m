Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0332C6747
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39401.72295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kieGW-0003dF-OZ; Fri, 27 Nov 2020 13:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39401.72295; Fri, 27 Nov 2020 13:58:24 +0000
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
	id 1kieGW-0003cq-L1; Fri, 27 Nov 2020 13:58:24 +0000
Received: by outflank-mailman (input) for mailman id 39401;
 Fri, 27 Nov 2020 13:58:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kieGU-0003ck-Lb
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:58:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e9c0cf2-45b9-4a56-8731-3a773da178d6;
 Fri, 27 Nov 2020 13:58:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F168FABD7;
 Fri, 27 Nov 2020 13:58:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kieGU-0003ck-Lb
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:58:22 +0000
X-Inumbo-ID: 7e9c0cf2-45b9-4a56-8731-3a773da178d6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7e9c0cf2-45b9-4a56-8731-3a773da178d6;
	Fri, 27 Nov 2020 13:58:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606485501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QsEKiEZyrFFrYEgyt5mes67Edy/pP1CE2btlFOYBUIY=;
	b=KLZuZzN+jv0gceMzhgdGA//GfBZOCcagCLXZFt3teieFeqiy5Sm5duLGlsTRUStFPBWasD
	VVc4a24XxxKgY2WIBZo5Y3peSZ71Ujz1SnLrwmfqdP/grFlC9fk1/LAAkEBLUDDsuNoX68
	H5+l++MGCEUxT0+ITuy98BgLvwuEVU0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F168FABD7;
	Fri, 27 Nov 2020 13:58:20 +0000 (UTC)
Subject: Re: [PATCH v4 3/3] ns16550: Gate all PCI code with CONFIG_X86
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1606326929.git.rahul.singh@arm.com>
 <6d64bb35a6ce247faaa3df2ebae27b6bfa1d969e.1606326929.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bacfe1c3-d86d-95b2-c52a-4bb86f1338ea@suse.com>
Date: Fri, 27 Nov 2020 14:58:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6d64bb35a6ce247faaa3df2ebae27b6bfa1d969e.1606326929.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.11.2020 19:16, Rahul Singh wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -16,7 +16,7 @@
>  #include <xen/timer.h>
>  #include <xen/serial.h>
>  #include <xen/iocap.h>
> -#ifdef CONFIG_HAS_PCI
> +#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)
>  #include <xen/pci.h>
>  #include <xen/pci_regs.h>
>  #include <xen/pci_ids.h>
> @@ -51,7 +51,7 @@ static struct ns16550 {
>      unsigned int timeout_ms;
>      bool_t intr_works;
>      bool_t dw_usr_bsy;
> -#ifdef CONFIG_HAS_PCI
> +#if defined(CONFIG_X86) && defined(CONFIG_HAS_PCI)

I'm sorry to be picky, but this being a hack wants, imo, also calling
it so, by way of a code comment. Clearly this should go at one of the
first instances, yet neither of the two above are really suitable imo.
Hence I'm coming back to my prior suggestion of introducing a
consolidated #define without this becoming a Kconfig setting:

/*
 * The PCI part of the code in this file currently is only known to
 * work on x86. Undo this hack once the logic has been suitably
 * abstracted.
 */
#if defined(CONFIG_HAS_PCI) && defined(CONFIG_X86)
# define NS16550_PCI
#endif

And then use NS16550_PCI everywhere. I'd be fine making this
adjustment while committing, if I knew that (a) you're okay with it
and (b) the R-b and A-b you've already got can be kept.

Jan

