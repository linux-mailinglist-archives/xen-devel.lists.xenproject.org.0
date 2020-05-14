Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB291D36BD
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGwV-0007cv-Oy; Thu, 14 May 2020 16:42:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGwU-0007cp-J2
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:42:42 +0000
X-Inumbo-ID: ed9ba0b6-9601-11ea-a4b1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed9ba0b6-9601-11ea-a4b1-12813bfff9fa;
 Thu, 14 May 2020 16:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474561;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rKKVKX2U6395qlHtdbnVfdQhVMeO/gVk0U1PwfYAm1Q=;
 b=cyjUHJo1Gxd8bEUMGSyySxLrLcSiZtRZFiJQypqmtGtQqHw7yQfQb8tY
 G0wRePSWKt33TEy/DUf/vZavXukianF3TWjxsSSNj9ddrdrEK6UUbY36m
 Lzgf/0ENNVH16/P9e4/mGgZzBWBgLO3Sh4jRI36Wb8e7KVbCbH7OB5deH w=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: rmDlEYYNyGXw8T7g3EVCrfPUWar3mXtynqJvVSoNVTjxbCqUJBd59rQFF4AGojYDe+nlYDon2I
 sgWVlI3O+NzB3YrCHRxThpdNGIDExAcv0Q/rGPPqs97dHGix32yJ8ALW31jgY8Y5GBGmabNpz0
 trwN6PJ6bCq4nMmldz0FfDFzqeQ9L6ro/meFnt9OJsmnB4KE3GhOGLyM/7MkPcgou5GSOsTPfK
 /k1lu1z8jiI9ZxxyPChd1k4b75EJunb+0MTE1ZL0wRuJJ9/b3RYMcWDX1F3wQia6112Z8cMa6/
 RIY=
X-SBRS: 2.7
X-MesageID: 17910753
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17910753"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.29948.624988.194564@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:42:36 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 14/21] libxl: require qemu in dom0 even if stubdomain
 is in use
In-Reply-To: <20200428040433.23504-15-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-15-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 14/21] libxl: require qemu in dom0 even if stubdomain is in use"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Until xenconsoled learns how to handle multiple consoles, this is needed
> for save/restore support (qemu state is transferred over secondary
> consoles).
> Additionally, Linux-based stubdomain waits for all the backends to
> initialize during boot. Lack of some console backends results in
> stubdomain startup timeout.
> 
> This is a temporary patch until xenconsoled will be improved.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  tools/libxl/libxl_dm.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
> index e420c3fc7b..5e5e7a27b3 100644
> --- a/tools/libxl/libxl_dm.c
> +++ b/tools/libxl/libxl_dm.c
> @@ -2484,7 +2484,11 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
>          }
>      }
>  
> -    need_qemu = libxl__need_xenpv_qemu(gc, dm_config);
> +    /*
> +     * Until xenconsoled learns how to handle multiple consoles, require qemu
> +     * in dom0 to serve consoles for a stubdomain - it require at least 3 of them.
> +     */
> +    need_qemu = 1 || libxl__need_xenpv_qemu(gc, &sdss->dm_config);

But I don't think this is true for a trad non-linux stubdm ?
So I think this ought to be conditional.

What am I missing ?

Regards,
Ian.

