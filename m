Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7E3310BF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 15:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94972.179065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGpz-0001xZ-BV; Mon, 08 Mar 2021 14:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94972.179065; Mon, 08 Mar 2021 14:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGpz-0001xA-89; Mon, 08 Mar 2021 14:26:23 +0000
Received: by outflank-mailman (input) for mailman id 94972;
 Mon, 08 Mar 2021 14:26:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJGpx-0001x5-Dj
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:26:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b69f9f88-5989-471e-b07c-1007a37a5e77;
 Mon, 08 Mar 2021 14:26:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B191FAD3B;
 Mon,  8 Mar 2021 14:26:19 +0000 (UTC)
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
X-Inumbo-ID: b69f9f88-5989-471e-b07c-1007a37a5e77
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615213579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANzg/AOpEcwTRQCqKAO57x29eRpCDqdl3nWx+lS4Xx0=;
	b=JyanQ6IvlriUZVo7eAvdaSHwK/i8y4FE7gQJpLgeqKn6aI4J3iby19n0/X/nT1+tSey1PX
	rNGBBeACoZM4mdBf8wJ+3KSlaffeMmGNZ3vX7L4pXWf0fDnlCmFQsBtnAjhm3x3y5FQ6Jn
	mY3i7NekKSmtBOtOyvsVdcGzrBoPQ9M=
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210308135937.1692-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37ea3c87-c960-4c92-af5f-71f2db774a75@suse.com>
Date: Mon, 8 Mar 2021 15:26:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308135937.1692-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 14:59, Michal Orzel wrote:
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>  
>  #obj-bin-y += ....o
>  
> -ifdef CONFIG_DTB_FILE
> +ifneq ($(CONFIG_DTB_FILE),"")
>  obj-y += dtb.o
>  AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>  endif

Right now what I have for my Arm test builds is an unquoted
string in ./.config, e.g.:

CONFIG_DTB_FILE:=/usr/local/arm-linux-gnueabi/vexpress-v2p-aem-v7a.dtb

While I suppose you've tested that the resulting quoting is still
okay, to reduce confusion perhaps the AFLAGS-y line would better
be changed to

AFLAGS-y += '-DCONFIG_DTB_FILE=$(CONFIG_DTB_FILE)'

at the same time?

Jan

