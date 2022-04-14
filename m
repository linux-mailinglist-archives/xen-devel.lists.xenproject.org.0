Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58370501A68
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 19:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304992.519777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf3bI-00013T-VC; Thu, 14 Apr 2022 17:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304992.519777; Thu, 14 Apr 2022 17:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf3bI-00010J-SB; Thu, 14 Apr 2022 17:49:48 +0000
Received: by outflank-mailman (input) for mailman id 304992;
 Thu, 14 Apr 2022 17:49:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Reb+=UY=citrix.com=prvs=096d93bb6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nf3bI-00010D-6m
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 17:49:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 454968ac-bc1b-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 19:49:47 +0200 (CEST)
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
X-Inumbo-ID: 454968ac-bc1b-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649958587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9X0U8cpphL2NqZykSRAco9CM6VesTPSEoNXW/uxRS9I=;
  b=M2RuOzEIdeGEglgJBRSH4NLFP8vnfcSj32DaHe3NiNWizr1d0zLYMne4
   IT9xw8ONam9etMILPU9l6tqqyIES2aL0oUlxgluyeNMDI2WtzcC14qcxB
   cRg+nqbWAZRoR8mDM898eMyUxcu/uYN+lb4MjeVOMgYdAe4R/swVOBPNX
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69394780
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BQTRhaOi+0iE4K3vrR2gl8FynXyQoLVcMsEvi/4bfWQNrUon1zEOn
 WsZC2/UbPuLMGf1fd5xb4u38BhS68LczYU2GQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl29Iw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 okdl7aQRQ4VBqj3g9YweCJ2DQ56MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQTK2PO
 5VJMVKDajz7XUxyIGYXIa5mp7uGp1ejSmJ6s1+a8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9wMQ88QyA2E9pLR2B2rK0M/YCBubNNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb7
 RDofODEsogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0vdB0xa5hYImS0C
 KM2he+3zMUCVJdNRfUpC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLSnPHKGoNJJcAhiwLpSLcmelvG7v9WremJOcFzNwdeIqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:R6jOoaiKe4XDqI0XyuFXWJQwSHBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.90,260,1643691600"; 
   d="scan'208";a="69394780"
Date: Thu, 14 Apr 2022 18:49:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/build: Fix dependency for the MAP rule
Message-ID: <YlhetDD/Xsnn2Vif@perard.uk.xensource.com>
References: <20220414162348.4808-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220414162348.4808-1-andrew.cooper3@citrix.com>

On Thu, Apr 14, 2022 at 05:23:48PM +0100, Andrew Cooper wrote:
> diff --git a/xen/Makefile b/xen/Makefile
> index dd05672ff42d..02a274f56dc0 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -599,7 +599,7 @@ cscope:
>  	cscope -k -b -q
>  
>  .PHONY: _MAP
> -_MAP:
> +_MAP: $(TARGET)-syms

That's not going to work well as make isn't going to know how to build
$(TARGET)-syms. I guess you want to have $(TARGET) as prerequisite or
add somewhere "$(TARGET)-syms: $(TARGET)".

>  	$(NM) -n $(TARGET)-syms | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' > System.map
>  
>  %.o %.i %.s: %.c tools_fixdep FORCE

Thanks,

-- 
Anthony PERARD

