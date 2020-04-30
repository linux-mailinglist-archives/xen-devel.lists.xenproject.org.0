Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5B1BFF32
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 16:51:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUAVv-0005IL-Ki; Thu, 30 Apr 2020 14:50:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jUAVu-0005IG-0H
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 14:50:10 +0000
X-Inumbo-ID: e2cbade0-8af1-11ea-9a62-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2cbade0-8af1-11ea-9a62-12813bfff9fa;
 Thu, 30 Apr 2020 14:50:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D402EAC69;
 Thu, 30 Apr 2020 14:50:06 +0000 (UTC)
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Julien Grall <julien@xen.org>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
Date: Thu, 30 Apr 2020 16:50:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430142548.23751-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.04.2020 16:25, Julien Grall wrote:
> EXPERT mode is currently used to gate any options that are in technical
> preview or not security supported At the moment, the only way to select
> it is to use XEN_CONFIG_EXPERT=y on the make command line.
> 
> However, if the user forget to add the option of one of the make
> command (even a clean), then .config will get rewritten. This may lead
> to a rather frustrating experience as it is difficult to diagnostic the
> issue.

Is / will this still be true after Anthony's rework of the build
system? Right now we already have

clean-targets := %clean
no-dot-config-targets := $(clean-targets) \
                         ...

> A lot of the options behind EXPERT would benefit to get more tested in
> order to be mark as fully supported in the future.

Anyone intending to get an EXPERT-only option fully supported will
need to do focused testing; I don't think we can expect to move
items out of this category just because more people happen to test
something every now and then.

> In order to make easier to experiment, the option EXPERT can now be
> selected from the menuconfig rather than make command line. This does
> not change the fact a kernel with EXPERT mode selected will not be
> security supported.

Well, if I'm not mis-remembering it was on purpose to make it more
difficult for people to declare themselves "experts". FAOD I'm not
meaning to imply I don't see and accept the frustration aspect you
mention further up. The two need to be carefully weighed against
one another.

> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -35,7 +35,15 @@ config DEFCONFIG_LIST
>  	default ARCH_DEFCONFIG
>  
>  config EXPERT
> -	def_bool y if "$(XEN_CONFIG_EXPERT)" = "y"
> +	bool "Configure standard Xen features (expert users)"
> +	help
> +	  This option allows certain base Xen options and settings
> +	  to be disabled or tweaked. This is for specialized environments
> +	  which can tolerate a "non-standard" Xen.
> +	  Only use this if you really know what you are doing.
> +	  Xen binaries built with this option enabled are not security
> +	  supported.
> +	default n

I don't think the last line is needed.

Jan

