Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952BD51186E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315071.533419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhsm-0008Sr-Rm; Wed, 27 Apr 2022 13:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315071.533419; Wed, 27 Apr 2022 13:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhsm-0008R2-OX; Wed, 27 Apr 2022 13:39:04 +0000
Received: by outflank-mailman (input) for mailman id 315071;
 Wed, 27 Apr 2022 13:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y66U=VF=citrix.com=prvs=1094d0c61=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1njhsl-0008Qw-7e
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:39:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62b730a9-c62f-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 15:38:58 +0200 (CEST)
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
X-Inumbo-ID: 62b730a9-c62f-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651066741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KEH0uihlxnEuFRyeMAETigwL92GSAiyMausO3tgEKXc=;
  b=aVUcHpD2/qymEeGtofl4juOI5g0V9aeuChsOlAdqnsMthv7uTIGNfLqR
   BaWmuaKGNyqYsGrUaCPlPyYEnTDeWAWYI0ARekEJOnK3RY6kIZOcRhmr8
   ZXHMkZjBYP/dpdMZoaF0f/y6777rPrFPJPCpUGtvg3TV5wauKb3g+g3zB
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69925381
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YUFkT6NsV8N8MLXvrR1El8FynXyQoLVcMsEvi/4bfWQNrUp01TBWy
 mMeWzuGaf+KZWagfNl0bI62pB5Tu5KHnN5lTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NEw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 tISsr6qRjUQHffxn/hNejBxIz9XMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQTKeEO
 pFJMFKDajzyehFwPnotCqgap7aMqViiTzFKknWs8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTQY8XCfik7P90gVSX7moUDhIQSB28u/bRola3RtZ3O
 0ESvC00osAa71e3R9PwWxm5pn+svRMGXddUVeog52ml06fR/kOVC3YJShZHb9opstJwQiYlv
 neVn871BRR1vbGVQG7b/bCRxRuxIyEFIGsqfyIITQIZpdLkpekblhjISMRiFq+dlND5GTjsh
 TuNqUADa6471JBRkf/hpBae3mzq9sOhohMJChv/QGX66SFja7ycRNaV7kSLxN9pHJiwQQzU1
 JQboPS24OcLBJCLsSWCRuQRAb2kj8q43C3gbU1HRMd4qWn0k5K3VcUJuWwleh81WioRUWWxC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRPIt4wOuBJ1+U3aB
 Xt8WZzxZUv28Yw9kFKLqx41iNfHPBwWy2LJXozcxB+6y7eYb3P9Ye5bbQPfNbxjtPzf+1+9H
 zNj2yyikUs3bQEDSnOPrd57wa4icBDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/89qws8x
 VnkAhUw4AOm3RXvcFzaAlg+OOKHdcsu9hoTYH1zVWtELlB+OO5DGo9ELMBpFVTmncQ+pcNJo
 w4tJpvQX6wTGmiWk9nfBLGkxLFfmN2QrVrmF0KYjPIXJvaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:XuoJnazq7VB1nUORQ7P1KrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="69925381"
Date: Wed, 27 Apr 2022 14:38:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Thomas Huth <thuth@redhat.com>
CC: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	<kraxel@redhat.com>, <qemu-trivial@nongnu.org>,
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] softmmu/vl: Fence 'xenfb' if Xen support is not compiled
 in
Message-ID: <YmlHZTcghklUZjok@perard.uk.xensource.com>
References: <20220427123316.329312-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220427123316.329312-1-thuth@redhat.com>

On Wed, Apr 27, 2022 at 02:33:16PM +0200, Thomas Huth wrote:
> The 'xenfb' parameter for the '-vga' command line option is currently
> always enabled unconditionally (since the xenfb is not a proper QOM
> device that could be tested via its class name). That means it also
> shows up if Xen is not enabled at all, e.g. like this:
> 
>  $ ./qemu-system-sparc -vga help
>  none                 no graphic card
>  xenfb                Xen paravirtualized framebuffer
>  tcx                  TCX framebuffer (default)
>  cg3                  CG3 framebuffer
> 
> Let's avoid this situation by fencing the parameter with the
> CONFIG_XEN_BACKEND switch.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

