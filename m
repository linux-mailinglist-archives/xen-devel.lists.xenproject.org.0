Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EBC7B216F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 17:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609950.949148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlt40-0007oX-Es; Thu, 28 Sep 2023 15:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609950.949148; Thu, 28 Sep 2023 15:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlt40-0007li-Bs; Thu, 28 Sep 2023 15:36:28 +0000
Received: by outflank-mailman (input) for mailman id 609950;
 Thu, 28 Sep 2023 15:36:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oxVr=FM=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1qlsuD-00032t-FE
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 15:26:21 +0000
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f6bdcd9-5e13-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 17:26:20 +0200 (CEST)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6c4e7951dddso4759200a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Sep 2023 08:26:20 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa78dce000000b006906aaf1e4dsm13514673pfr.150.2023.09.28.08.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 08:26:18 -0700 (PDT)
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
X-Inumbo-ID: 5f6bdcd9-5e13-11ee-878a-cb3800f73035
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914779; x=1696519579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYPUiAEm0lZNQbU6hKmoJKqPGRAnrTCwSSHfRdZ7LfA=;
        b=Bt/JtE2c0XpULgI1BcBBNZTQejlaC2BXxa3AWeMWYcCgzj/EG6igByfQAf/Q9xdSEm
         7HZjJwO+06EP1dBRDTgRT1V/18k3GGdodlNjH7/I7AcaNoBcq7m0G0vvx2F8j7jpkQlb
         TGxHXfJpUV+sJaSFGx3yfeNk8STUjWrl9dV5aaJISSKXqSSM5/uvz/J0CcglDwUfcIRf
         3v+tMn42o1F7agBjF/cdV/S0wGPtkFcAXfvpPibs3wEtst7Y82mSrPUxF+ido9YalEnp
         lCw7eqLUhKX22AvXF92h1FQR1IolTnGrhJSowkdzrbhZm1ucaRiK3OWPER+hE1Zud2BC
         Qq1A==
X-Gm-Message-State: AOJu0YyElMdHVTpzUbmPNKWGoaUOEMxyZLKYNnWOu2ouIg3wxQodbzGp
	PAMS9a6tZ8RNsKSKhUTFezg=
X-Google-Smtp-Source: AGHT+IEkFDTusLpYox11EoA1Tl2MJIdC5Ad7Ua286wH6ql8JYqDg2cQ1Wc6Zlzvv071aY+VufA88gQ==
X-Received: by 2002:a9d:73d5:0:b0:6c4:b339:2528 with SMTP id m21-20020a9d73d5000000b006c4b3392528mr1632381otk.16.1695914778722;
        Thu, 28 Sep 2023 08:26:18 -0700 (PDT)
Date: Thu, 28 Sep 2023 15:26:16 +0000
From: Wei Liu <wei.liu@kernel.org>
To: j.granados@samsung.com
Cc: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org,
	josh@joshtriplett.org, Kees Cook <keescook@chromium.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Doug Gilbert <dgilbert@interlog.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Corey Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Robin Holt <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>,
	Russ Weight <russell.h.weight@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Song Liu <song@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-serial@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/15] hyper-v/azure: Remove now superfluous sentinel
 element from ctl_table array
Message-ID: <ZRWbGDlXCS4t8tMf@liuwe-devbox-debian-v2>
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
 <65157da8.050a0220.fb263.fdb1SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65157da8.050a0220.fb263.fdb1SMTPIN_ADDED_BROKEN@mx.google.com>

Please change the prefix to "Drivers: hv:" in the subject line in the
two patches.

On Thu, Sep 28, 2023 at 03:21:39PM +0200, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove sentinel from hv_ctl_table
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/hv/hv_common.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index ccad7bca3fd3..bc7d678030aa 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -147,8 +147,7 @@ static struct ctl_table hv_ctl_table[] = {
>  		.proc_handler	= proc_dointvec_minmax,
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE
> -	},
> -	{}
> +	}

Please keep the comma at the end.

>  };
>  
>  static int hv_die_panic_notify_crash(struct notifier_block *self,
> 
> -- 
> 2.30.2
> 

