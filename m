Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9402D2D3D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 15:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47470.83984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kme0T-00039S-2c; Tue, 08 Dec 2020 14:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47470.83984; Tue, 08 Dec 2020 14:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kme0S-000393-Vf; Tue, 08 Dec 2020 14:30:20 +0000
Received: by outflank-mailman (input) for mailman id 47470;
 Tue, 08 Dec 2020 14:30:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kme0R-00038y-PV
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 14:30:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5c24320-df7b-4b80-95d5-e11eb573a433;
 Tue, 08 Dec 2020 14:30:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F191CAF3E;
 Tue,  8 Dec 2020 14:30:17 +0000 (UTC)
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
X-Inumbo-ID: e5c24320-df7b-4b80-95d5-e11eb573a433
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607437818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+L/+Z2x90PRAtf5gqYmW+PtCmVGRowXcWV4+i+TcHc=;
	b=s+MNE5J30yFwGGogFnOTUc15xQvgksRcpjFg+iyfT23Qhc4tg0hrpHf2VOSet5CRokrwsS
	X22iu9At363B3Imfq5zBX77IQcqetNUlVvhUZROO5qNjJgxHHzzxA/cwJ9E+sRbd/CAGaP
	O6z2Z0Vt+gfVs9KO8MQL4H/ofcWzjo0=
Subject: Re: [PATCH] xen: CONFIG_PV_SHIM_EXCLUSIVE and CONFIG_HVM are mutually
 exclusive
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201208135146.30540-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <724f015a-ce72-a425-6cf7-6751620f1eec@suse.com>
Date: Tue, 8 Dec 2020 15:30:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201208135146.30540-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.12.2020 14:51, Juergen Gross wrote:
> With CONFIG_PV_SHIM_EXCLUSIVE some sources required for CONFIG_HVM are
> not built, so let CONFIG_HVM depend on !CONFIG_PV_SHIM_EXCLUSIVE.
> 
> Let CONFIG_HVM default to !CONFIG_PV_SHIM instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/arch/x86/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

See "x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE at the same
time" posted on Oct 19. I'd be fine switching to the !PV_SHIM
default you have here. But Andrew looks to be objecting to a
change like this, sadly without pointing out a good alternative
so far.

Jan

> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 24868aa6ad..0107cfa12f 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -90,7 +90,8 @@ config PV_LINEAR_PT
>           If unsure, say Y.
>  
>  config HVM
> -	def_bool !PV_SHIM_EXCLUSIVE
> +	depends on !PV_SHIM_EXCLUSIVE
> +	def_bool !PV_SHIM
>  	prompt "HVM support"
>  	---help---
>  	  Interfaces to support HVM domains.  HVM domains require hardware
> 


