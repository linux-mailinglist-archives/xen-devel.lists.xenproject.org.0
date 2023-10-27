Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDEE7D924D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 10:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624285.972721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwIQ8-00009K-9i; Fri, 27 Oct 2023 08:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624285.972721; Fri, 27 Oct 2023 08:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwIQ8-00006h-6Q; Fri, 27 Oct 2023 08:42:20 +0000
Received: by outflank-mailman (input) for mailman id 624285;
 Fri, 27 Oct 2023 08:42:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwIQ7-00006b-70
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 08:42:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb4d82e7-74a4-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 10:42:16 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32dc9ff4a8fso1159666f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 01:42:16 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adffecc000000b0032dc1fc84f2sm1294729wrs.46.2023.10.27.01.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 01:42:15 -0700 (PDT)
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
X-Inumbo-ID: bb4d82e7-74a4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396136; x=1699000936; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I4YW6v0nwEzTaGHDzniJxz3Wp+GrgF6w84+hb3xLCwk=;
        b=MC/pq2QQlugdJO0HZmcwD6xCFM+gtUlXsDTTB2ZZlSFiNlW5gbE9m61ztNVe3teQUz
         55omlF+gROKhoLDvLfeWePsO21gZQsDFPBjTp62DzdFcRjoPSGtRhfCKcY85fWph5gzn
         E4o63CWEy44jdc0ehgMGz9M7XAsEDAXQfcwAzrpfgO0NJQUH9R5py33UGMvrsXxChu0M
         wbyLeavn0J0RMTavY5DUs/W95UoNX5tncjak3WIPon75X1w/lzHW5lXMtM8sHJVRMF+x
         3PNyWeIM+cBkyxAGyhGx+PH8g28gYbKW9MY8RLA2mv3NNK3ku+XYJtfHtPb/Wr4bFmGm
         Bw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396136; x=1699000936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4YW6v0nwEzTaGHDzniJxz3Wp+GrgF6w84+hb3xLCwk=;
        b=vdYHUcIbtu0jvyd9/PiBhhAkm38aMp9OcVr1BblkNUvgR+ZW9Q8m5TF29asNM3WoFa
         gR5Kt+pusnW/p91b1tV7VhCoVgW+oyY3S1ktsxw1TpqMv/0LlVJC95KTz/hZpxaxaEdW
         9CfPUoQsumWKFUWnpaCAC7rfHxxNqvz+oAtxY0MG8J78EozlRpvXVjDKqvQOtiBMxewb
         AeM3JWelAiqUZzVprY4ZJRYZbR+tZVBWf764bD/P6b3TVL7yuygiJu5mcZ2u6Rh/GCQ1
         2qvIvqqkQvG9gTttQ50HQyo9oXpkzZDyhu+ip0dyURJfQZsQgRZnwFir2oTbo7ceCkTq
         PtjA==
X-Gm-Message-State: AOJu0YxGR49ieAm9MKdVYKw3hJNcasfGwCaYGU8F+3aK+VBmgn+3HkXQ
	d/a0JQTjCWGENpat9GhWQQA=
X-Google-Smtp-Source: AGHT+IHYKFjE7/5s/eYCnVaerp95T/CLeSS0gWC6UKfDnf6cIdlOYl4zJ2dW3VoRlx9dX62JxFte9A==
X-Received: by 2002:a5d:4a4c:0:b0:32d:d2ef:b0c1 with SMTP id v12-20020a5d4a4c000000b0032dd2efb0c1mr1586686wrs.33.1698396135916;
        Fri, 27 Oct 2023 01:42:15 -0700 (PDT)
Message-ID: <a0798190-e5da-42fd-af1c-17af48e9fe89@gmail.com>
Date: Fri, 27 Oct 2023 09:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 19/28] hw/xen: update Xen PV NIC to XenDevice model
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-20-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-20-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This allows us to use Xen PV networking with emulated Xen guests, and to
> add them on the command line or hotplug.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/net/meson.build        |   2 +-
>   hw/net/trace-events       |  11 +
>   hw/net/xen_nic.c          | 484 +++++++++++++++++++++++++++++---------
>   hw/xenpv/xen_machine_pv.c |   1 -
>   4 files changed, 381 insertions(+), 117 deletions(-)
> 
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index 2632634df3..f64651c467 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -1,5 +1,5 @@
>   system_ss.add(when: 'CONFIG_DP8393X', if_true: files('dp8393x.c'))
> -system_ss.add(when: 'CONFIG_XEN', if_true: files('xen_nic.c'))
> +system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen_nic.c'))
>   system_ss.add(when: 'CONFIG_NE2000_COMMON', if_true: files('ne2000.c'))
>   
>   # PCI network cards
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index 3abfd65e5b..3097742cc0 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -482,3 +482,14 @@ dp8393x_receive_oversize(int size) "oversize packet, pkt_size is %d"
>   dp8393x_receive_not_netcard(void) "packet not for netcard"
>   dp8393x_receive_packet(int crba) "Receive packet at 0x%"PRIx32
>   dp8393x_receive_write_status(int crba) "Write status at 0x%"PRIx32
> +
> +# xen_nic.c
> +xen_netdev_realize(int dev, const char *info, const char *peer) "vif%u info '%s' peer '%s'"
> +xen_netdev_unrealize(int dev) "vif%u"
> +xen_netdev_create(int dev) "vif%u"
> +xen_netdev_destroy(int dev) "vif%u"
> +xen_netdev_disconnect(int dev) "vif%u"
> +xen_netdev_connect(int dev, unsigned int tx, unsigned int rx, int port) "vif%u tx %u rx %u port %u"
> +xen_netdev_frontend_changed(const char *dev, int state) "vif%s state %d"
> +xen_netdev_tx(int dev, int ref, int off, int len, unsigned int flags, const char *c, const char *d, const char *m, const char *e) "vif%u ref %u off %u len %u flags 0x%x%s%s%s%s"
> +xen_netdev_rx(int dev, int idx, int status, int flags) "vif%u idx %d status %d flags 0x%x"
> diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
> index 9bbf6599fc..af4ba3f1e6 100644
> --- a/hw/net/xen_nic.c
> +++ b/hw/net/xen_nic.c
> @@ -20,6 +20,13 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/cutils.h"
> +#include "qemu/log.h"
> +#include "qemu/qemu-print.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/error.h"
> +
>   #include <sys/socket.h>
>   #include <sys/ioctl.h>
>   #include <sys/wait.h>
> @@ -27,18 +34,26 @@
>   #include "net/net.h"
>   #include "net/checksum.h"
>   #include "net/util.h"
> -#include "hw/xen/xen-legacy-backend.h"
> +
> +#include "hw/xen/xen-backend.h"
> +#include "hw/xen/xen-bus-helper.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
>   
>   #include "hw/xen/interface/io/netif.h"
> +#include "hw/xen/interface/io/xs_wire.h"
> +
> +#include "trace.h"
>   
>   /* ------------------------------------------------------------- */
>   
>   struct XenNetDev {
> -    struct XenLegacyDevice      xendev;  /* must be first */
> -    char                  *mac;
> +    struct XenDevice      xendev;  /* must be first */
> +    XenEventChannel       *event_channel;
> +    int                   dev;
>       int                   tx_work;
> -    int                   tx_ring_ref;
> -    int                   rx_ring_ref;
> +    unsigned int          tx_ring_ref;
> +    unsigned int          rx_ring_ref;
>       struct netif_tx_sring *txs;
>       struct netif_rx_sring *rxs;
>       netif_tx_back_ring_t  tx_ring;
> @@ -47,6 +62,11 @@ struct XenNetDev {
>       NICState              *nic;
>   };
>   
> +typedef struct XenNetDev XenNetDev;
> +
> +#define TYPE_XEN_NET_DEVICE "xen-net-device"
> +OBJECT_DECLARE_SIMPLE_TYPE(XenNetDev, XEN_NET_DEVICE)
> +
>   /* ------------------------------------------------------------- */
>   
>   static void net_tx_response(struct XenNetDev *netdev, netif_tx_request_t *txp, int8_t st)
> @@ -68,7 +88,8 @@ static void net_tx_response(struct XenNetDev *netdev, netif_tx_request_t *txp, i
>       netdev->tx_ring.rsp_prod_pvt = ++i;
>       RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(&netdev->tx_ring, notify);
>       if (notify) {
> -        xen_pv_send_notify(&netdev->xendev);
> +        xen_device_notify_event_channel(XEN_DEVICE(netdev),
> +                                        netdev->event_channel, NULL);
>       }
>   
>       if (i == netdev->tx_ring.req_cons) {
> @@ -104,13 +125,16 @@ static void net_tx_error(struct XenNetDev *netdev, netif_tx_request_t *txp, RING
>   #endif
>   }
>   
> -static void net_tx_packets(struct XenNetDev *netdev)
> +static bool net_tx_packets(struct XenNetDev *netdev)
>   {
> +    bool done_something = false;
>       netif_tx_request_t txreq;
>       RING_IDX rc, rp;
>       void *page;
>       void *tmpbuf = NULL;
>   
> +    assert(qemu_mutex_iothread_locked());
> +
>       for (;;) {
>           rc = netdev->tx_ring.req_cons;
>           rp = netdev->tx_ring.sring->req_prod;
> @@ -122,49 +146,52 @@ static void net_tx_packets(struct XenNetDev *netdev)
>               }
>               memcpy(&txreq, RING_GET_REQUEST(&netdev->tx_ring, rc), sizeof(txreq));
>               netdev->tx_ring.req_cons = ++rc;
> +            done_something = true;
>   
>   #if 1
>               /* should not happen in theory, we don't announce the *
>                * feature-{sg,gso,whatelse} flags in xenstore (yet?) */
>               if (txreq.flags & NETTXF_extra_info) {
> -                xen_pv_printf(&netdev->xendev, 0, "FIXME: extra info flag\n");
> +                qemu_log_mask(LOG_UNIMP, "vif%u: FIXME: extra info flag\n",
> +                              netdev->dev);
>                   net_tx_error(netdev, &txreq, rc);
>                   continue;
>               }
>               if (txreq.flags & NETTXF_more_data) {
> -                xen_pv_printf(&netdev->xendev, 0, "FIXME: more data flag\n");
> +                qemu_log_mask(LOG_UNIMP, "vif%u: FIXME: more data flag\n",
> +                              netdev->dev);
>                   net_tx_error(netdev, &txreq, rc);
>                   continue;
>               }
>   #endif

I know that this is just translation but the fact the above code is 
there indicates that you're likely to see problems here. Not supporting 
extra_info is likely ok as long as RSS, TSO or multicast filtering is 
not advertized (as the comment says). But lack of support for more_data 
basically means your frontend needs to send all packets in a single frag 
(e.g. no header split) so that might bite pretty quickly. I guess it 
goes to show that no-one has used this code in many many years.

The translation looks ok to me though so...

Reviewed-by: Paul Durrant <paul@xen.org>


