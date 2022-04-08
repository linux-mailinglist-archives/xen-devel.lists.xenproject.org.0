Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB024F98C5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 16:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301610.514823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncq2L-0003eo-3Z; Fri, 08 Apr 2022 14:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301610.514823; Fri, 08 Apr 2022 14:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncq2L-0003cE-0E; Fri, 08 Apr 2022 14:56:33 +0000
Received: by outflank-mailman (input) for mailman id 301610;
 Fri, 08 Apr 2022 14:56:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXVu=US=citrix.com=prvs=090e341e7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ncq2J-0003c8-V8
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 14:56:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 114b0c09-b74c-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 16:56:29 +0200 (CEST)
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
X-Inumbo-ID: 114b0c09-b74c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649429789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dwiG6vcPk/TTJGdAPxdaOUR+aUpBDUjuCoJQTN7ME94=;
  b=LwNtAv3KuR7c5/fWUh/w54nboZ4fBm0+2MAoXVTpeamy4sVBTCTZufHI
   38Z9rSSHnQ8re2P8pDiyVydRW1tYlV4xkmUjqFDOz0euS2goCBldF2cRH
   KVub8p/JlTPp/mESn5F28yQajLc5Ju4Iwv4m3HmLcmrHZQimkCFUveG+v
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68267032
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:c9J7u6uZHXG5DMrK+TVAz0NffefnVGFeMUV32f8akzHdYApBsoF/q
 tZmKTuGP62JMGPye9pxatmx9R4G656AzdA2TVBtrXw0FyMR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/V6
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi81EfWWpf0+cCBTLBBsOpZb94PgGyiG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWQ/NkqfO0YVUrsRII0gos2x11TUTxJdpBWwgIcL4XrRxSUkhdABN/KKI4fXFK25hH2wp
 G3c+H/iKgoHL9HZwj2Amlqpj/XKlDn2W6oTEqO57f9ghFCPxm0VBwYSXFH9qv684mahX/pPJ
 kpS/TAhxYAw/UqnVMjgXDW3pXeFulgXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsUSRdueT6g6IKhS3+XNFYDaGJqeelIGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGwmTKuKGpxdEdMMX
 KM1kVkMjHO0FCH3BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzBl2wfxia
 cjEKJ/E4ZMm5UJPlmfeqwA1i+FD+8zD7TmLGcCTI+qPj9Jym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid54043bQEKWQGOqdR7BQlTdRATXMmqw+QKJr/rClc3QwkJVq6OqY7NjqQ4xsy5YM+Tp
 SrjMqKZoXKi7UD6xfKiNig4OOyyB84mxZ/5VAR1VWuVN7EYSd7HxM8im1EfJNHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:8A8z2qj1s27QWDThLB2O8XU/XHBQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.90,245,1643691600"; 
   d="scan'208";a="68267032"
Date: Fri, 8 Apr 2022 15:56:24 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] libxl: Retry QMP PCI device_add
Message-ID: <YlBNGCXm+wh2v7Yr@perard.uk.xensource.com>
References: <20220330194656.39051-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220330194656.39051-1-jandryuk@gmail.com>

On Wed, Mar 30, 2022 at 03:46:56PM -0400, Jason Andryuk wrote:
> PCI device assignment to an HVM with stubdom is potentially racy.  First
> the PCI device is assigned to the stubdom via the PV PCI protocol.  Then
> QEMU is sent a QMP command to attach the PCI device to QEMU running
> within the stubdom.  However, the sysfs entries within the stubdom may
> not have appeared by the time QEMU receives the device_add command
> resulting in errors like:
> 
> libxl_qmp.c:1838:qmp_ev_parse_error_messages:Domain 10:Could not open '/sys/bus/pci/devices/0000:00:1f.3/config': No such file or directory
> 
> This patch retries the device assignment up to 10 times with a 1 second
> delay between.  That roughly matches the overall hotplug timeout.
> 
> The qmp_ev_parse_error_messages error is still printed since it happens
> at a lower level than the pci code controlling the retries.  With that,
> the "Retrying PCI add %d" message is also printed at ERROR level to
> clarify what is happening.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> @@ -1252,10 +1258,22 @@ static void pci_add_qmp_device_add_cb(libxl__egc *egc,
>                                        const libxl__json_object *response,
>                                        int rc)
>  {
> -    EGC_GC;
>      pci_add_state *pas = CONTAINER_OF(qmp, *pas, qmp);
> +    STATE_AO_GC(pas->aodev->ao);

I think this changes are wrong, what is the reason to use STATE_AO_GC
instead of EGC_GC?
I think in this case, it is fine to keep using EGC_GC, as there doesn't
seems to be any allocation that needs to live after this function
returns. And you could just pass `pas->aodev->ao` to
libxl__ev_time_register_rel().

>  
> -    if (rc) goto out;
> +    if (rc) {
> +        if (pas->retries++ < 10) {
> +            LOGD(ERROR, qmp->domid, "Retrying PCI add %d", pas->retries);
> +            rc = libxl__ev_time_register_rel(ao, &pas->timeout_retries,
> +                                             pci_add_qmp_device_add_retry,
> +                                             1000);
> +            if (rc) goto out;
> +
> +            return; /* wait for the timeout to then retry */
> +        } else {
> +            goto out;
> +        }
> +    }

So this retry logic would be done regardless of whether stubdom is in
use or not. It's not going to be useful in the non-stubdom case, is it?

When adding a pci device to a domain that has its device model in a
stubdomain, there's a first call to do_pci_add() which works fine,
right? Then there's a callback to device_pci_add_stubdom_wait(), which
is supposed to wait for the stubdom to be ready, but the sysfs entry
might still be missing at that time, right? Then, there is a second call
to do_pci_add() for the guest, and it's the one that fail in your case,
right?

If my reasoning is correct, could we enable the retry logic only for the
second do_pci_add() call? So that guests without stubdom aren't impacted
as I don't think retrying in this case would be useful and would just
delay the error.

Cheers,

-- 
Anthony PERARD

