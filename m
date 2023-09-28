Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B37037B210A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 17:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609911.949078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlspH-0007Py-CO; Thu, 28 Sep 2023 15:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609911.949078; Thu, 28 Sep 2023 15:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlspH-0007NV-9C; Thu, 28 Sep 2023 15:21:15 +0000
Received: by outflank-mailman (input) for mailman id 609911;
 Thu, 28 Sep 2023 15:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn+n=FM=kernel.org=song@srs-se1.protection.inumbo.net>)
 id 1qlspF-0007NP-HW
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 15:21:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6f82f69-5e12-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 17:21:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3343E61D16
 for <xen-devel@lists.xenproject.org>; Thu, 28 Sep 2023 15:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D846AC433C8
 for <xen-devel@lists.xenproject.org>; Thu, 28 Sep 2023 15:21:08 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3247d69ed2cso2542731f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Sep 2023 08:21:08 -0700 (PDT)
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
X-Inumbo-ID: a6f82f69-5e12-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695914468;
	bh=5QGsjlLA6+fSdsYbT2wgVXCyV5RBnz+gCDO8qtKxudM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gY6bnbm4Br2Su1APlGkn1sEu4r+c6sdQLDsonp71NsJQbUQraKl8xXh9rGZORDHDX
	 1QshNOkVFu0tNkDMf36lbn30zkyYzhLTGnPTXNjw1k+PIvKKZGUYxKQ7wvRHp1f4Yx
	 zc21t6uxwYapN/InHw4nKU1MlE+GefjFMudIrCx51jeRHViIFjwTYbeCQ0LaQLHNDy
	 K6pRADykVVDDE9WhFVGCoH8yaA4fYcRbfTjd6dVfgkxkaTlBtpIRkVKRbieDzAxAlu
	 +hjpSkHGs3H12owDA6PgfqSF8KGYMJHSlAYsT2GtXigCu2wgFul2znYOe2oL1/yATw
	 HlBza/JCHsDzg==
X-Gm-Message-State: AOJu0YzAvzg2Vqra6W/70Jp3AnX2fF4RO1lUXYmZEG206HnvoaJJw2OS
	hDMkH30vs94Yhsp1V3GlkeWwNzRLRJ8dCLjPKA0=
X-Google-Smtp-Source: AGHT+IFGxnL1jLxRJ82JHSkotXT+AJQbGwcj+NsBF8Wdz/LihQ1gwaw7yDfPbhv4CL9qBIGKh5TUPhf228x9wFIkjTk=
X-Received: by 2002:a05:6512:1595:b0:500:b828:7a04 with SMTP id
 bp21-20020a056512159500b00500b8287a04mr1542995lfb.18.1695914446757; Thu, 28
 Sep 2023 08:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
 <65157da7.5d0a0220.13b5e.9e95SMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <65157da7.5d0a0220.13b5e.9e95SMTPIN_ADDED_BROKEN@mx.google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 28 Sep 2023 08:20:34 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6WRen7Udqc+O+haAH8PZXH2jYdpUj1X7UCuQYngVWxoA@mail.gmail.com>
Message-ID: <CAPhsuW6WRen7Udqc+O+haAH8PZXH2jYdpUj1X7UCuQYngVWxoA@mail.gmail.com>
Subject: Re: [PATCH 13/15] raid: Remove now superfluous sentinel element from
 ctl_table array
To: j.granados@samsung.com
Cc: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, josh@joshtriplett.org, 
	Kees Cook <keescook@chromium.org>, Phillip Potter <phil@philpotter.co.uk>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Doug Gilbert <dgilbert@interlog.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Corey Minyard <minyard@acm.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, David Ahern <dsahern@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Robin Holt <robinmholt@gmail.com>, 
	Steve Wahl <steve.wahl@hpe.com>, Russ Weight <russell.h.weight@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-serial@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-rdma@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	netdev@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 6:20=E2=80=AFAM Joel Granados via B4 Relay
<devnull+j.granados.samsung.com@kernel.org> wrote:
>
> From: Joel Granados <j.granados@samsung.com>
>
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
>
> Remove sentinel from raid_table
>
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/md/md.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index a104a025084d..3866d8f754a0 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -304,8 +304,7 @@ static struct ctl_table raid_table[] =3D {
>                 .maxlen         =3D sizeof(int),
>                 .mode           =3D S_IRUGO|S_IWUSR,
>                 .proc_handler   =3D proc_dointvec,
> -       },
> -       { }
> +       }
>  };

Please keep "}," as Greg suggested. Otherwise,

Acked-by: Song Liu <song@kernel.org>

Thanks,
Song

