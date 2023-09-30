Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9364E7B5050
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 12:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610887.950951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnGBF-0006Y4-N4; Mon, 02 Oct 2023 10:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610887.950951; Mon, 02 Oct 2023 10:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnGBF-0006WM-KB; Mon, 02 Oct 2023 10:29:37 +0000
Received: by outflank-mailman (input) for mailman id 610887;
 Sat, 30 Sep 2023 16:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y00O=FO=philpotter.co.uk=phil@srs-se1.protection.inumbo.net>)
 id 1qmdCd-0006E7-HP
 for xen-devel@lists.xenproject.org; Sat, 30 Sep 2023 16:52:27 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b93920e3-5fb1-11ee-9b0d-b553b5be7939;
 Sat, 30 Sep 2023 18:52:21 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4064867903cso49934625e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 30 Sep 2023 09:52:21 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 u1-20020adfed41000000b003247d3e5d99sm4921066wro.55.2023.09.30.09.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 09:52:20 -0700 (PDT)
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
X-Inumbo-ID: b93920e3-5fb1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1696092741; x=1696697541; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TP49E0lt1lRfwVwEUZNQYaCBfTY4UGz9ptrNHBZhxcM=;
        b=kIuAHdb9MJvCtEhgfhLWYrWro4Q5pcwo+v8GnPwlbz/rXz+ZvEKRAMag+baFmnMSEA
         lyGbTVdBlA1DMLlJrNIZThM4Q/vfQJMLAZ9R8p3hQuf+iRamZ6sCV6iSE4AEwMXIiVFf
         D3DEOM/P66GsGZqs1r7MzeVgNysHQe29Rw9k3E/QIUrNb7Odn3mp9tUUeWzJfjCD10so
         W2/mbb8gYr2G5eIzjKbyTwUeLqfdbb9Oeilzj1Ya+rdyjyDuMfSquJLMfTCUzbYXGRUW
         ecxgvOOnmuEyCQJb3kAWYI8G3OYbdOiSsU6j7maG0dIYGUNHaHJDVssdUIp9XGVVLrQ5
         91ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696092741; x=1696697541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP49E0lt1lRfwVwEUZNQYaCBfTY4UGz9ptrNHBZhxcM=;
        b=ruDKCohHLmA4uFpYpfNHhWgD3EjJtE9t9jFpaLLaxcnVJEt0AFvocx/bIIHYR7L58Z
         os5YeWGY8f6qZMrIqbwEIU6ZVWhqZ7h7gljaSxOGBgEBMtaUSy7QAuXe5RgYz4s8BZcM
         uNEtcqwF3M/A5nbZ72q6e8Jeo6/41kEn4gh/9YnK+wZkVkk6QERIS2eCUdH5rjVCpf3P
         wluT+cCaj8azL+R++uSwLql0+zAfXCjQPY37b5nmlPE70XpsGPq0WkR3CkHUmP5GkkOT
         qjNZkcW9gKAbpjNuYi+2+9ChY0VJBGc3IFH5abGmaQ4NkxcpBA7GZEHZ3Uue8sCZ+tCE
         XVJA==
X-Gm-Message-State: AOJu0YzqIOVVxgjqmInasHGPbvLjcJnZ4ePOLdoClSR1HQYmuymWdaBU
	Bj5IzciRdj3FecmkbHl62OLUww==
X-Google-Smtp-Source: AGHT+IFufhUosQmDbdYYO0lgqH5WgmabRsKPy1NuiT6FdEpd1klh9Lx806UT3kRvn4yTyQ0Y4WLs9Q==
X-Received: by 2002:adf:cf0a:0:b0:323:1689:6607 with SMTP id o10-20020adfcf0a000000b0032316896607mr6789063wrj.5.1696092741022;
        Sat, 30 Sep 2023 09:52:21 -0700 (PDT)
Date: Sat, 30 Sep 2023 17:52:17 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Joel Granados <j.granados@samsung.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org,
	josh@joshtriplett.org, Kees Cook <keescook@chromium.org>,
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
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
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/15] cdrom: Remove now superfluous sentinel element
 from ctl_table array
Message-ID: <ZRhSQaNDJih5xABq@equinox>
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
 <20230928-jag-sysctl_remove_empty_elem_drivers-v1-1-e59120fca9f9@samsung.com>
 <CGME20230928133705eucas1p182bd81a8e6aff530e43f9b0746a24eaa@eucas1p1.samsung.com>
 <2023092855-cultivate-earthy-4d25@gregkh>
 <20230929121730.bwzhrpaptf45smfy@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929121730.bwzhrpaptf45smfy@localhost>

On Fri, Sep 29, 2023 at 02:17:30PM +0200, Joel Granados wrote:
> On Thu, Sep 28, 2023 at 03:36:55PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Sep 28, 2023 at 03:21:26PM +0200, Joel Granados via B4 Relay wrote:
> > > From: Joel Granados <j.granados@samsung.com>
> > > 
> > > This commit comes at the tail end of a greater effort to remove the
> > > empty elements at the end of the ctl_table arrays (sentinels) which
> > > will reduce the overall build time size of the kernel and run time
> > > memory bloat by ~64 bytes per sentinel (further information Link :
> > > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> > > 
> > > Remove sentinel element from cdrom_table
> > > 
> > > Signed-off-by: Joel Granados <j.granados@samsung.com>
> > > ---
> > >  drivers/cdrom/cdrom.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> > > index cc2839805983..451907ade389 100644
> > > --- a/drivers/cdrom/cdrom.c
> > > +++ b/drivers/cdrom/cdrom.c
> > > @@ -3654,8 +3654,7 @@ static struct ctl_table cdrom_table[] = {
> > >  		.maxlen		= sizeof(int),
> > >  		.mode		= 0644,
> > >  		.proc_handler	= cdrom_sysctl_handler
> > > -	},
> > > -	{ }
> > > +	}
> > 
> > You should have the final entry as "}," so as to make any future
> > additions to the list to only contain that entry, that's long been the
> > kernel style for lists like this.
> Will send a V2 with this included. Thx.
> 
> > 
> > So your patches will just remove one line, not 2 and add 1, making it a
> > smaller diff.
> indeed.
> 
> > 
> > thanks,
> > 
> > greg k-h
> 
> -- 
> 
> Joel Granados

Hi Joel,

Thank you for your patch. I look forward to seeing V2, and will be happy
to review it.

Regards,
Phil

