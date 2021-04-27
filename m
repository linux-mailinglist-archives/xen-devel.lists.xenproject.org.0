Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D336C910
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 18:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118689.224922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQGM-0007LW-1L; Tue, 27 Apr 2021 16:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118689.224922; Tue, 27 Apr 2021 16:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbQGL-0007L7-UD; Tue, 27 Apr 2021 16:08:37 +0000
Received: by outflank-mailman (input) for mailman id 118689;
 Tue, 27 Apr 2021 16:08:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbQGK-0007L2-Mk
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 16:08:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccb77838-5384-4d1f-b1e9-7233640b6b57;
 Tue, 27 Apr 2021 16:08:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8AB2B121;
 Tue, 27 Apr 2021 16:08:34 +0000 (UTC)
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
X-Inumbo-ID: ccb77838-5384-4d1f-b1e9-7233640b6b57
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619539714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lZiSY23CY1+qj+w9k/ix6u/jHIc98/LgC2nmXFIovmk=;
	b=VZ/F3bIfO7AkLiNBvAjqSk6zKnMwx2GEbUNWwgLHoe47NzCCEj6UHM+BjVUcw1Me2ZNP3T
	tqhQWM8kD3FKhIu2QG3TIdOv9MEvsqbpatpyDKC9fuSZ6CBJe9WXKwiWpMOnZBtVLhufoi
	cx+69jc088UuEGVW1XE9RzTd+sUAW00=
Subject: Ping: [PATCH v4] x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE at
 the same time
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
 <164d8e67-fd65-9e98-53ef-51187310de0b@suse.com>
Message-ID: <d9d62ba4-2a0f-5fe8-a0be-e6e1f0777348@suse.com>
Date: Tue, 27 Apr 2021 18:08:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <164d8e67-fd65-9e98-53ef-51187310de0b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.04.2021 11:27, Jan Beulich wrote:
> This combination doesn't really make sense (and there likely are more);
> in particular even if the code built with both options set, HVM guests
> wouldn't work (and I think one wouldn't be able to create one in the
> first place). The alternative here would be some presumably intrusive
> #ifdef-ary to get this combination to actually build (but still not
> work) again.
> 
> Fixes: 8b5b49ceb3d9 ("x86: don't include domctl and alike in shim-exclusive builds")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Andrew,

I know you're not happy with this change, but I also don't recall
you proposing any sufficiently straightforward alternative. Nor do
I recall you responding to my claim that the combination is useless
anyway, since the PV shim exists solely to create a single PV guest.
Since I have Roger's ack, may I ask that you firmly NACK the change
here (accompanied by an alternative proposal), if you're really
convinced that your view on the situation is the only sensible one?
If I don't hear back by the end of the week, I guess I'll put the
change in early next week.

Jan


> ---
> v4: Default HVM to !PV_SHIM, as suggested by Jürgen.
> v2: Restore lost default setting.
> 
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -23,7 +23,7 @@ config X86
>  	select HAS_PDX
>  	select HAS_SCHED_GRANULARITY
>  	select HAS_UBSAN
> -	select HAS_VPCI if !PV_SHIM_EXCLUSIVE && HVM
> +	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF
>  	select NUMA
>  
> @@ -90,9 +90,10 @@ config PV_LINEAR_PT
>           If unsure, say Y.
>  
>  config HVM
> -	def_bool !PV_SHIM_EXCLUSIVE
> +	bool "HVM support"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default !PV_SHIM
>  	select IOREQ_SERVER
> -	prompt "HVM support"
>  	---help---
>  	  Interfaces to support HVM domains.  HVM domains require hardware
>  	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
> 


