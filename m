Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA61D366B
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:26:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGfq-00052i-LX; Thu, 14 May 2020 16:25:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGfp-00052b-K0
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:25:29 +0000
X-Inumbo-ID: 855c8ac6-95ff-11ea-a4b1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 855c8ac6-95ff-11ea-a4b1-12813bfff9fa;
 Thu, 14 May 2020 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589473528;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=xR71YgTN54w6dV6dVcN3iIaQwTlM5J5CVvcqLfSMfVY=;
 b=bQ5KMH9NI5Z0ludVI6ShXt+3DShrFgK+fwmMH5CsxAnkW7gnpe+m9jxh
 aQ5dPMWxhC3+xmtYK+aV0qPc80DRA7MVqkAzoEvUbYvR6ALgd9CRLPYq+
 YaCuNIq3pbG9PgDCQYCzpwnt+GlD9Gg3DJnBdTUKEEgkTljW65weEmisf o=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 3Mg8vH9EciP3uNYc/MCbuG2Z6vGhpARIcRzq0qeWZwBBKPSJRoiVDK7H+dsoZUc/hPkgnwNiE5
 owFaOb9CC+zISaKJvjidIY47EHaeHxLQDUdL6q9ZejWi4ZIc7No3r0AQaHB8I6F57Hi8MzJyf6
 eHLc+AT+sAwWqBnbBiO1oPCH99ssYaVV6FiSJLUMISqLBg2kV+YOSLvvG0Ep8wyC7kxiLVMMyi
 Yo1p7Iq7b0GKl8hozecsLwirzvbNmUyfGN8pkSuQ5f+gNJ7knEvI/AKR2tRrK54LBF/QxKjl8T
 zZg=
X-SBRS: 2.7
X-MesageID: 17570245
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17570245"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.28914.656817.996478@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:25:22 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 06/21] libxl: write qemu arguments into separate
 xenstore keys
In-Reply-To: <20200428040433.23504-7-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-7-jandryuk@gmail.com>
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

Jason Andryuk writes ("[PATCH v5 06/21] libxl: write qemu arguments into separate xenstore keys"):
> +static int libxl__write_stub_linux_dmargs(libxl__gc *gc,
> +                                    int dm_domid, int guest_domid,
> +                                    char **args)
> +{
...
> +    vm_path = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("/local/domain/%d/vm", guest_domid));
> +    path = GCSPRINTF("%s/image/dmargs", vm_path);
> +
> +retry_transaction:
> +    t = xs_transaction_start(ctx->xsh);
> +    xs_write(ctx->xsh, t, path, "", 0);
> +    xs_set_permissions(ctx->xsh, t, path, roperm, ARRAY_SIZE(roperm));

This wants to be libxl__xs_mknod I think ?

> +    i = 1;
> +    for (i=1; args[i] != NULL; i++)
> +        xs_write(ctx->xsh, t, GCSPRINTF("%s/%03d", path, i), args[i], strlen(args[i]));

Can you do this with libxl__xs_transaction_* please, and a loop rather
than a goto ?

Why not use libxl__xs_write_checked ?

> +    xs_set_permissions(ctx->xsh, t, GCSPRINTF("%s/rtc/timeoffset", vm_path), roperm, ARRAY_SIZE(roperm));

This line seems out of place.  At least, it is not mentioned in the
commit message.  If it's needed, can you please split it out - and, of
course, then, provide an explanation :-).

> +    if (!xs_transaction_end(ctx->xsh, t, 0))
> +        if (errno == EAGAIN)
> +            goto retry_transaction;
> +    return 0;

Thanks,
Ian.

