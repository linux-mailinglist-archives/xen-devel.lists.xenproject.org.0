Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93FF3CD22F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 12:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158306.291518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Qnl-00006f-T2; Mon, 19 Jul 2021 10:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158306.291518; Mon, 19 Jul 2021 10:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Qnl-0008WQ-Q2; Mon, 19 Jul 2021 10:47:09 +0000
Received: by outflank-mailman (input) for mailman id 158306;
 Mon, 19 Jul 2021 10:47:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5c2=ML=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m5Qnk-0008WK-4J
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 10:47:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a428b62-a365-417d-afb0-094e33c6195d;
 Mon, 19 Jul 2021 10:47:07 +0000 (UTC)
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
X-Inumbo-ID: 1a428b62-a365-417d-afb0-094e33c6195d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626691626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nW5Eakjigrup7MIKKykkXAdH5RJYTrC7KTBeqfX1idc=;
  b=KgqVIjM+IYcVqnuf+64qMM8788cHuI6iMUnO7Nj31glanvrdw1qf53lc
   +cZaN96en0GIRaGrAMEJ/+Bj6kvE54OfTlYbUIWm70HvfAoL58ZYdKtfS
   S3URmLFz0hOL/gessl6UvFJn1aGFfLtMJXHyNZpMleLSwg0tHybO1RuhZ
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Nh3d0PwYnPJ/IoxcbBcl0hsP4P/Grmng47bky05K5cTS9U2jPjRwsqFaS3WxT5vwNA/PTBAJsf
 UgVeKCMb5vxgd7yrcWF62Wbkjoq2DjLyhbNKH8e7YSEQ8Px0YmatP5/kmiMKq1WMd30M+YNSSD
 msD6wRVzrLWiGyIlBM+yj1Z9k+Hqg13o/S1l/+LBDVAE14Dk3mh47PJiyrjsE7jnQD3quiM8cP
 fMUc1kiNCbUC8epW7vH4go/N/bksM7YujlfFIOMirGbDbmi/K3TSeRLyBoxffniJc2R3QZ+vBQ
 WtNkIhyFYvDtOGvKR4vXeqrs
X-SBRS: 5.1
X-MesageID: 48555527
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+nmE6ajHXfTh7TgTfFR/vHJ3pnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.84,252,1620705600"; 
   d="scan'208";a="48555527"
Date: Mon, 19 Jul 2021 11:47:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Message-ID: <YPVYJqKBEmlAwnME@perard>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <20210716123812.494081-1-anthony.perard@citrix.com>
 <aada0028-ff60-9f59-5d87-a023ecd35d11@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aada0028-ff60-9f59-5d87-a023ecd35d11@suse.com>

On Mon, Jul 19, 2021 at 09:37:06AM +0200, Jan Beulich wrote:
> On 16.07.2021 14:38, Anthony PERARD wrote:
> > +export HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
> 
> While the setting indeed gets obtained in a Makefile now, ...
> 
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -235,8 +235,8 @@ config XSM_FLASK_AVC_STATS
> >  
> >  config XSM_FLASK_POLICY
> >  	bool "Compile Xen with a built-in FLASK security policy"
> > -	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
> > -	depends on XSM_FLASK
> > +	default y
> > +	depends on XSM_FLASK && "$(HAS_CHECKPOLICY)"
> 
> ... it's still used as a Kconfig dependency. This in particular
> does not address George's concern about a setting silently getting
> turned off behind the back of the person having enabled it (and

This patch v2 wasn't meant to address George's concern which didn't
exist at the time this v2 was sent... I was trying to address yours.

But it seems that "George's concern" is part of your issues with
Kconfig too, which I missed when trying to right this v2.

Anyway, those two patches are the only way I'm going to try to fix the
random build failure in the GitLab CI, I'm not going to try to fix
issues with the use of Kconfig for now. In the mean time either v1 or v2
is committed, or will just keep getting random build failure in the
GitLab CI.

-- 
Anthony PERARD

