Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809701A1103
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 18:12:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLqob-0001zf-QU; Tue, 07 Apr 2020 16:11:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ebmU=5X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jLqoa-0001za-3b
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 16:11:04 +0000
X-Inumbo-ID: 6065b5b2-78ea-11ea-b58d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6065b5b2-78ea-11ea-b58d-bc764e2007e4;
 Tue, 07 Apr 2020 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586275862;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=y02V0vARKPxRDBC/3qJTQ6bXE7wJu8cF8gG8o3JrO8E=;
 b=GjS7cyATX3uYDn7nhkjaMmGZbwAxKgiLkTBxjZMG1wqt4Jzf0vUij+uf
 R6ThD2oDBK/b84MmlxHFI06VAFatwJzIUr6qgkEZUCp2RdmOwJDnPm9dm
 Z0VW0iOgb5YU+jIiA4Tu7og9bHFhdZOY/nbDzB4E55+G7XTKKyvrQePJJ I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: qWGVzOX9dYdpiiwxttFGoBDa9XVQB0PtSa6rNhJFRDZaGJJiEUEz2W8CSnZU4dKFBy7k4uBMYw
 7kBxk3ZWgRfX4aqWF1txQdsR1QywuZH2o2F46Bm2wdUiRU0B1hp+LST3qLs92PoTHoXAbn2ile
 L5YRaMoyorpQA1lJv2yvMH1I92u7ke2hZgNpVA3dmxB1hn3KVsEZ0KlBwzIwhCx+jrVUwsPQkD
 SNJMLsaL2CM6/+j7CFw6LOT1TYMwHz39b/8Jo9a4yTaMe74JR7WVWT+EX80SE6HXv7/FJquv1u
 oNA=
X-SBRS: 2.7
X-MesageID: 15715915
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,355,1580792400"; d="scan'208";a="15715915"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24204.42515.354583.921270@mariner.uk.xensource.com>
Date: Tue, 7 Apr 2020 17:10:59 +0100
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Subject: Re: [PATCH] tools/xl: Remove the filelock when building VM if
 autoballooning is off
In-Reply-To: <20190311103622.20143-1-isaikin-dmitry@yandex.ru>
References: <20190311103622.20143-1-isaikin-dmitry@yandex.ru>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Dmitry Isaykin writes ("[PATCH] tools/xl: Remove the filelock when building VM if autoballooning is off"):
> The presence of this filelock does not allow building several VMs at the same
> time. This filelock was added to prevent other xl instances from using memory
> freeed for the currently building VM in autoballoon mode.
> 
> Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

This was deferred due to the Xen 4.13 freeze.  I found it in a todo
list of mine.  I think it should be committed and I will do so soon
unless someone objects.

Sorry for the delay, Dmitry!

Regards,
Ian.

>  tools/xl/xl_vmcontrol.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index a1d633795c..2b42bb487d 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -873,9 +873,11 @@ int create_domain(struct domain_create *dom_info)
>  start:
>      assert(domid == INVALID_DOMID);
>  
> -    rc = acquire_lock();
> -    if (rc < 0)
> -        goto error_out;
> +    if (autoballoon) {
> +        rc = acquire_lock();
> +        if (rc < 0)
> +            goto error_out;
> +    }
>  
>      if (domid_soft_reset == INVALID_DOMID) {
>          if (!freemem(domid, &d_config.b_info)) {
> @@ -935,7 +937,8 @@ start:
>      if ( ret )
>          goto error_out;
>  
> -    release_lock();
> +    if (autoballoon)
> +        release_lock();
>  
>      if (restore_fd_to_close >= 0) {
>          if (close(restore_fd_to_close))
> @@ -1109,7 +1112,8 @@ start:
>      }
>  
>  error_out:
> -    release_lock();
> +    if (autoballoon)
> +        release_lock();
>      if (libxl_domid_valid_guest(domid)) {
>          libxl_domain_destroy(ctx, domid, 0);
>          domid = INVALID_DOMID;
> -- 
> 2.17.1
> 

