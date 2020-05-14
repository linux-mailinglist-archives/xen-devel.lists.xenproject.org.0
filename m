Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B61D3652
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:20:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGaS-0004Bt-TO; Thu, 14 May 2020 16:19:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGaQ-0004Bg-Nh
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:19:54 +0000
X-Inumbo-ID: bdd2111a-95fe-11ea-a4b1-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdd2111a-95fe-11ea-a4b1-12813bfff9fa;
 Thu, 14 May 2020 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589473193;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=jn5y2nGCAKtkglRtj9uZixFDb0TgstouT5h9GidQtNk=;
 b=VT5lz+X4CtzyC0o5f1ERhyGBXbWDjNjr9X+dFQbowkVQ1nn75pHFQMDB
 RbG2RsIS6nvB6wSsK4TBktWLMvjheidQ8uOyxpnlUTR7jyreS0dt07wso
 Wkx5soQNpbvBzBtOOqYb6wSDCI5dW3mbDlHyFVUSg/ZBbOcWRW8w8ITIp 0=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: Rn78C8ByZQ2s68SxNEepTqIi3XsqGHtGploUdNnjzPNRo33kI51cWwfSYaVC42iBScciaBQfzu
 wNJPmeWG1AZ62v/R+FkDTwChZFlE65qMucrnqlunlNJWNt+b9w1mMC9zCbgOKZmtJwiUQtr6aO
 SD8KKA/bhUeH233d1HVcXNiZCv980eDV9oKwodd8yZEZUTnoFfdZPKVfpTbhwvwepRIMUYLsAN
 s8ZVYokpnI99DJN9hW5Jbd9EFznvNODIhGBii7AHTHTXrN8VEXa55qhsZ90fBSkLQ7vhQWSDN8
 i1U=
X-SBRS: 2.7
X-MesageID: 17815285
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17815285"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.28579.577001.476506@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:19:47 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 05/21] libxl: Handle Linux stubdomain specific QEMU
 options.
In-Reply-To: <20200428040433.23504-6-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-6-jandryuk@gmail.com>
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
Cc: Wei Liu <wl@xen.org>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Simon Gaiser <simon@invisiblethingslab.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Eric
 Shelton <eshelton@pobox.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 05/21] libxl: Handle Linux stubdomain specific QEMU options."):
> From: Eric Shelton <eshelton@pobox.com>
> 
> This patch creates an appropriate command line for the QEMU instance
> running in a Linux-based stubdomain.
> 
> NOTE: a number of items are not currently implemented for Linux-based
> stubdomains, such as:
> - save/restore
> - QMP socket
> - graphics output (e.g., VNC)
> 
> Signed-off-by: Eric Shelton <eshelton@pobox.com>
> 
> Simon:
>  * fix disk path
>  * fix cdrom path and "format"
> 
> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> [drop Qubes-specific parts]
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Nice work all.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

This is despite me spotting three tiny style nits:

> @@ -1312,7 +1316,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
>          }
>  
>          flexarray_append(dm_args, vncarg);
> -    } else
> +    } else if (!is_stubdom)
>          /*
>           * Ensure that by default no vnc server is created.
>           */

While you are here it would be nice to regularise the { }.  (libxl
CODING_STYLE says that all branches of an if should have { }, if any
of them do.)

> @@ -1974,8 +2006,10 @@ static int libxl__build_device_model_args(libxl__gc *gc,
>                                                    args, envs,
>                                                    state);
>      case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
> -        assert(dm_state_fd != NULL);
> -        assert(*dm_state_fd < 0);
> +        if (!libxl_defbool_val(guest_config->b_info.device_model_stubdomain)) {
> +            assert(dm_state_fd != NULL);
> +            assert(*dm_state_fd < 0);
> +	}

This } seems to be misindented ?

>      if (guest_config->b_info.u.hvm.serial)
>          num_console++;
> +    else if (guest_config->b_info.u.hvm.serial_list) {
> +        char **serial = guest_config->b_info.u.hvm.serial_list;
> +        while (*(serial++))
> +            num_console++;
> +    }

You should add the { } areound the if block too.

Ian.

