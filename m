Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA69B1D7AF7
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 16:20:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jagck-0005E6-Jd; Mon, 18 May 2020 14:20:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jagcj-0005E1-DC
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:20:09 +0000
X-Inumbo-ID: ad27ad72-9912-11ea-a86a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad27ad72-9912-11ea-a86a-12813bfff9fa;
 Mon, 18 May 2020 14:20:08 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5eQFsejmTheHw2nmIstzN+eVgeD8oLJB4A1YgKCxeb9/EOb7rzWB1NPVo1KCOhZj6wU0VObIbs
 x/pMBJF3seHorm5w1pSw4/HXuIXdCijeUdpdRsLl9UiiyiKq19pSKa0FXQ9GUDa6p23GWqp9Wy
 HysyP11ElT43tN0eOBFYdq5LkX9LX5Gq9jPWhLSlnqYxYE53naUUGgnMi+pFj6mrEYawwinjn4
 +2kv5cOOtzOYPxXoxkKD8iZul/p/x17Af91A82HwRHlS9WXPIC/BUi1ktul5rF/vohrf/youfd
 gfA=
X-SBRS: 2.7
X-MesageID: 18054298
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18054298"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24258.39310.574582.176081@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 15:19:58 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v6 06/18] libxl: write qemu arguments into separate
 xenstore keys
In-Reply-To: <20200518011353.326287-7-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
 <20200518011353.326287-7-jandryuk@gmail.com>
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

Jason Andryuk writes ("[PATCH v6 06/18] libxl: write qemu arguments into separate xenstore keys"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
...
> +static int libxl__write_stub_linux_dm_argv(libxl__gc *gc,
> +                                           int dm_domid, int guest_domid,
> +                                           char **args)
> +{

Thanks for the changes.

> +    xs_transaction_t t = XBT_NULL;
...
> +    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
> +                                  GCSPRINTF("/local/domain/%d/vm", guest_domid),
> +                                  &vm_path);
> +    if (rc)
> +        return rc;

I think this should be "goto out".  That conforms to standard libxl
error handling discipline and avoids future leak bugs etc.
libxl__xs_transaction_abort is a no-op with t==NULL.

Also, it is not clear to me why you chose to put this outside the
transaction loop.  Can you either put it inside the transaction loop,
or produce an explanation as to why this approach is race-free...

Thanks,
Ian.

