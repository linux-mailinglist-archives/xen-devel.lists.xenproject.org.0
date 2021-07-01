Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3583B935F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148863.275172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxiA-0002LT-SS; Thu, 01 Jul 2021 14:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148863.275172; Thu, 01 Jul 2021 14:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxiA-0002IJ-PJ; Thu, 01 Jul 2021 14:30:38 +0000
Received: by outflank-mailman (input) for mailman id 148863;
 Thu, 01 Jul 2021 14:30:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxiA-0002ID-74
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:30:38 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8620c3ba-85d4-4967-a97b-25e717a56970;
 Thu, 01 Jul 2021 14:30:37 +0000 (UTC)
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
X-Inumbo-ID: 8620c3ba-85d4-4967-a97b-25e717a56970
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625149837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8P7vlfIkLcqeQmKRDzO/5KvCw9VoEUvvaKYjxrs4Lwg=;
  b=HqWMkZ4DwZIO3z2jfbbQCGH8zhWO9uBSQDWntAngR08PQpgD+pA2qrFI
   i/v/5RaomjdQcQ1e9BJpurJbAY75kiemE6S+ndYh+mvrcfPeZEsW33Gc9
   ri+a3pk2ohFDQkIv3Zh71VKwKFrfPzvI14DbrJJGtIuRLUG75rWQQ6Q80
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0U1C1McnJVqImh+3s74LGBKcPf1DBgdVWaCmAN72OFr7ip3r/fvcZatKZRncr3nBw86BL6sK4Z
 MXEMr9upMFzYfh673TZttU3Rzq8Cx7WIbOcwBU5MlHu9RBWFws3F7hC4tlZBfSifwOKJBbwCz2
 J6810PWChACoESqdR7fxf8PUvL5ZyQJZkTOWjCIhHfFKP2wdqu67XumFbzU3nIswprHq5sNxva
 7GFqVGyC6ULkLUiD8g1iwFzKrOmSFw9ViPIuEn5+po7BchG13I11D8fgMAF9C4SinVdLhA0nJG
 Ils=
X-SBRS: 5.1
X-MesageID: 47448780
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ojxwZqP58v8aVsBcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47448780"
Date: Thu, 1 Jul 2021 15:30:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210701 03/40] xl: fix description of migrate --debug
Message-ID: <YN3RidqHX3fvzAUO@perard>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-4-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210701095635.15648-4-olaf@aepfle.de>

On Thu, Jul 01, 2021 at 11:55:58AM +0200, Olaf Hering wrote:
> xl migrate --debug used to track every pfn in every batch of pages.
> But these times are gone. The code in xc_domain_save is the consumer
> of this knob, but it considers it only for the remus and colo case.
> 
> Adjust the help text to tell what --debug does today: Nothing.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> v02:
> - the option has no effect anymore

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

