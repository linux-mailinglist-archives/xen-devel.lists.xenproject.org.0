Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 229591B988F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 09:27:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSy9v-0000tp-R4; Mon, 27 Apr 2020 07:26:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbbE=6L=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jSy9u-0000tk-MN
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 07:26:30 +0000
X-Inumbo-ID: 694a37d4-8858-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 694a37d4-8858-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 07:26:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d15so17602887wrx.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=2sFt+Wl5nQfbKLhBnpXj+yuRCjH0wwQbgpo5vn/ll8E=;
 b=hY7F9sxspBbbidu6h43ncIlRd48Kx+6NDy194cOob4Y89WwbxUyVsHK8K0fGH1MFos
 wAl294tUW9Q2rsW6wYYdNsEy3qLbpjPQKERMCHmK9rZqagVhW1blmpBP2R5Y0C0V0EqW
 LDAlNkWPJs3DlxU8vQSIvSxoqKGUL8M0xLQeDoIW2LhKeJt+b4g873RDJBVKvHP2wXfd
 SnolXGT6rFFel1uTGVOZQsNEXxkx9xiylj1K2Zlk5HwArGGNKUjGGbHu+drW/su/9b6A
 hl4uUj2FHGpgJKJ7qEydqJrTEOGTyCUyhm//UpCgzpDiqCziX0rIdVxrFh0K+4pUnPXI
 6BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=2sFt+Wl5nQfbKLhBnpXj+yuRCjH0wwQbgpo5vn/ll8E=;
 b=e62znsbTseP0PsFQhNi8tREqWz1N1F4tjlnJ9dMxhGwdn6obIaaY6BBAChlhWz00Uk
 7JB3DuMG2/mfpgIfGb6D/00k/R8uNg75oXJ+he9ZsXk1w3pSWlGnphDftqvn+CTrnXvc
 DXlqzE8y4kXCEP6AnnvL38ZK7+H7I/lF965gTyqSoEzh/tdi0LOwVd5zL7iDP4uZqjHz
 w/hKXwortDlnDW8PJmktQ8TtW0Pfa/PN9uBt306feD8DTK2f7i4tA/6g5ZOHzkv14xEk
 N8f8tcWjafnO7zc2k3vzek5eD79lgN54WVb6ajxCeiuqBizpiOCllVlEPViqy+Xthuqr
 NBTA==
X-Gm-Message-State: AGi0PubCfkie9Jj/zYppPOIRpaH/4RJlQb0RcqzfyM7hhFdc0sZqJR0R
 trZqs978euT+mdiwvkPxWik=
X-Google-Smtp-Source: APiQypK2bKec+4ymIXmjGvWiw4APZjCRf7StyGXywZhrVDw9ZyQWJ8wBUrrtAwZCfZuryHtH8dsfvQ==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr26822982wrc.416.1587972388993; 
 Mon, 27 Apr 2020 00:26:28 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id a125sm14253155wme.3.2020.04.27.00.26.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 00:26:28 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Markus Armbruster'" <armbru@redhat.com>,
	<qemu-devel@nongnu.org>
References: <20200424192027.11404-1-armbru@redhat.com>
 <20200424192027.11404-3-armbru@redhat.com>
In-Reply-To: <20200424192027.11404-3-armbru@redhat.com>
Subject: RE: [PATCH 02/11] xen: Fix and improve handling of device_add
 usb-host errors
Date: Mon, 27 Apr 2020 08:26:26 +0100
Message-ID: <000501d61c65$2a65af30$7f310d90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQMXmDKzuqWE9I5CndWgcA3L3a4P9AL+km1ypfGklyA=
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
Reply-To: paul@xen.org
Cc: 'Anthony Perard' <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Gerd Hoffmann' <kraxel@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: 24 April 2020 20:20
> To: qemu-devel@nongnu.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Paul
> Durrant <paul@xen.org>; Gerd Hoffmann <kraxel@redhat.com>; xen-devel@lists.xenproject.org
> Subject: [PATCH 02/11] xen: Fix and improve handling of device_add usb-host errors
> 
> usbback_portid_add() leaks the error when qdev_device_add() fails.
> Fix that.  While there, use the error to improve the error message.
> 
> The qemu_opts_from_qdict() similarly leaks on failure.  But any
> failure there is a programming error.  Pass &error_abort.
> 
> Fixes: 816ac92ef769f9ffc534e49a1bb6177bddce7aa2
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/usb/xen-usb.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
> index 961190d0f7..42643c3390 100644
> --- a/hw/usb/xen-usb.c
> +++ b/hw/usb/xen-usb.c
> @@ -30,6 +30,7 @@
>  #include "hw/usb.h"
>  #include "hw/xen/xen-legacy-backend.h"
>  #include "monitor/qdev.h"
> +#include "qapi/error.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qstring.h"
> 
> @@ -755,13 +756,15 @@ static void usbback_portid_add(struct usbback_info *usbif, unsigned port,
>      qdict_put_int(qdict, "port", port);
>      qdict_put_int(qdict, "hostbus", atoi(busid));
>      qdict_put_str(qdict, "hostport", portname);
> -    opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, &local_err);
> -    if (local_err) {
> -        goto err;
> -    }
> +    opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict,
> +                                &error_abort);
>      usbif->ports[port - 1].dev = USB_DEVICE(qdev_device_add(opts, &local_err));
>      if (!usbif->ports[port - 1].dev) {
> -        goto err;
> +        qobject_unref(qdict);
> +        xen_pv_printf(&usbif->xendev, 0,
> +                      "device %s could not be opened: %s\n",
> +                      busid, error_get_pretty(local_err));
> +        error_free(local_err);

Previously the goto caused the function to bail out. Should there not be a 'return' here?

>      }
>      qobject_unref(qdict);
>      speed = usbif->ports[port - 1].dev->speed;
> @@ -793,11 +796,6 @@ static void usbback_portid_add(struct usbback_info *usbif, unsigned port,
>      usbback_hotplug_enq(usbif, port);
> 
>      TR_BUS(&usbif->xendev, "port %d attached\n", port);
> -    return;
> -
> -err:
> -    qobject_unref(qdict);
> -    xen_pv_printf(&usbif->xendev, 0, "device %s could not be opened\n", busid);
>  }
> 
>  static void usbback_process_port(struct usbback_info *usbif, unsigned port)
> --
> 2.21.1



