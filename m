Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4AF460979
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 20:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234193.406475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrPyE-00052w-EA; Sun, 28 Nov 2021 19:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234193.406475; Sun, 28 Nov 2021 19:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrPyE-0004zi-BB; Sun, 28 Nov 2021 19:36:18 +0000
Received: by outflank-mailman (input) for mailman id 234193;
 Sun, 28 Nov 2021 19:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llOw=QP=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mrPyC-0004xH-4x
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 19:36:16 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fbc0b51-5082-11ec-976b-d102b41d0961;
 Sun, 28 Nov 2021 20:36:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 86CF028D;
 Sun, 28 Nov 2021 20:36:08 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EuzZJlBBoMwa; Sun, 28 Nov 2021 20:36:07 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 036A1194;
 Sun, 28 Nov 2021 20:36:06 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mrPy1-006Dgr-EK;
 Sun, 28 Nov 2021 20:36:05 +0100
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
X-Inumbo-ID: 6fbc0b51-5082-11ec-976b-d102b41d0961
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 28 Nov 2021 20:36:05 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v4] xenbus: support large messages
Message-ID: <20211128193605.z4nr2uwqx2pvpgvo@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211004094000.29868-1-jgross@suse.com>
 <244e6bc7-9158-7c52-13ab-d25daafbc2c8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <244e6bc7-9158-7c52-13ab-d25daafbc2c8@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 86CF028D
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Hello,

Sorry, it seems I missed that mail :/

Added my tag below.

BTW, I didn't see the mb() fix between rsp_cons+= and reading rsp_prod
on the Linux side?

Samuel

Juergen Gross, le mer. 24 nov. 2021 08:00:55 +0100, a ecrit:
> Ping?
> 
> On 04.10.21 11:40, Juergen Gross wrote:
> > Today the implementation of the xenbus protocol in Mini-OS will only
> > allow to transfer the complete message to or from the ring page buffer.
> > This is limiting the maximum message size to lower values as the xenbus
> > protocol normally would allow.
> > 
> > Change that by allowing to transfer the xenbus message in chunks as
> > soon as they are available.
> > 
> > Avoid crashing Mini-OS in case of illegal data read from the ring
> > buffer.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> > ---
> > V2:
> > - drop redundant if (Samuel Thibault)
> > - move rmb() (Samuel Thibault)
> > V3:
> > - correct notification test (Samuel Thibault)
> > V4:
> > - more memory barriers (Samuel Thibault)
> > ---
> >   xenbus/xenbus.c | 210 ++++++++++++++++++++++++++++--------------------
> >   1 file changed, 122 insertions(+), 88 deletions(-)
> > 
> > diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
> > index 23de61e..b687678 100644
> > --- a/xenbus/xenbus.c
> > +++ b/xenbus/xenbus.c
> > @@ -29,6 +29,7 @@
> >   #include <xen/hvm/params.h>
> >   #include <mini-os/spinlock.h>
> >   #include <mini-os/xmalloc.h>
> > +#include <mini-os/semaphore.h>
> >   #define min(x,y) ({                       \
> >           typeof(x) tmpx = (x);                 \
> > @@ -46,6 +47,7 @@
> >   static struct xenstore_domain_interface *xenstore_buf;
> >   static DECLARE_WAIT_QUEUE_HEAD(xb_waitq);
> >   DECLARE_WAIT_QUEUE_HEAD(xenbus_watch_queue);
> > +static __DECLARE_SEMAPHORE_GENERIC(xb_write_sem, 1);
> >   xenbus_event_queue xenbus_events;
> >   static struct watch {
> > @@ -231,75 +233,103 @@ char *xenbus_wait_for_state_change(const char* path, XenbusState *state, xenbus_
> >   }
> > +static void xenbus_read_data(char *buf, unsigned int len)
> > +{
> > +    unsigned int off = 0;
> > +    unsigned int prod, cons;
> > +    unsigned int size;
> > +
> > +    while (off != len)
> > +    {
> > +        wait_event(xb_waitq, xenstore_buf->rsp_prod != xenstore_buf->rsp_cons);
> > +
> > +        prod = xenstore_buf->rsp_prod;
> > +        cons = xenstore_buf->rsp_cons;
> > +        DEBUG("Rsp_cons %d, rsp_prod %d.\n", cons, prod);
> > +        size = min(len - off, prod - cons);
> > +
> > +        rmb();   /* Make sure data read from ring is ordered with rsp_prod. */
> > +        memcpy_from_ring(xenstore_buf->rsp, buf + off,
> > +                         MASK_XENSTORE_IDX(cons), size);
> > +        off += size;
> > +        mb();    /* memcpy() and rsp_cons update must not be reordered. */
> > +        xenstore_buf->rsp_cons += size;
> > +        mb();    /* rsp_cons must be visible before we look at rsp_prod. */
> > +        if (xenstore_buf->rsp_prod - cons >= XENSTORE_RING_SIZE)
> > +            notify_remote_via_evtchn(xenbus_evtchn);
> > +    }
> > +}
> > +
> >   static void xenbus_thread_func(void *ign)
> >   {
> >       struct xsd_sockmsg msg;
> > -    unsigned prod = xenstore_buf->rsp_prod;
> > +    char *data;
> >       for (;;) {
> > -        wait_event(xb_waitq, prod != xenstore_buf->rsp_prod);
> > -        while (1) {
> > -            prod = xenstore_buf->rsp_prod;
> > -            DEBUG("Rsp_cons %d, rsp_prod %d.\n", xenstore_buf->rsp_cons,
> > -                  xenstore_buf->rsp_prod);
> > -            if (xenstore_buf->rsp_prod - xenstore_buf->rsp_cons < sizeof(msg))
> > -                break;
> > -            rmb();
> > -            memcpy_from_ring(xenstore_buf->rsp, &msg,
> > -                             MASK_XENSTORE_IDX(xenstore_buf->rsp_cons),
> > -                             sizeof(msg));
> > -            DEBUG("Msg len %d, %d avail, id %d.\n", msg.len + sizeof(msg),
> > -                  xenstore_buf->rsp_prod - xenstore_buf->rsp_cons, msg.req_id);
> > -
> > -            if (xenstore_buf->rsp_prod - xenstore_buf->rsp_cons <
> > -                sizeof(msg) + msg.len)
> > -                break;
> > -
> > -            DEBUG("Message is good.\n");
> > -
> > -            if (msg.type == XS_WATCH_EVENT) {
> > -                struct xenbus_event *event = malloc(sizeof(*event) + msg.len);
> > -                xenbus_event_queue *events = NULL;
> > -                char *data = (char*)event + sizeof(*event);
> > -                struct watch *watch;
> > -
> > -                memcpy_from_ring(xenstore_buf->rsp, data,
> > -                    MASK_XENSTORE_IDX(xenstore_buf->rsp_cons + sizeof(msg)),
> > -                    msg.len);
> > -
> > -                event->path = data;
> > -                event->token = event->path + strlen(event->path) + 1;
> > -
> > -                mb();
> > -                xenstore_buf->rsp_cons += msg.len + sizeof(msg);
> > -
> > -                for (watch = watches; watch; watch = watch->next)
> > -                    if (!strcmp(watch->token, event->token)) {
> > -                        events = watch->events;
> > -                        break;
> > -                    }
> > -
> > -                if (events) {
> > -                    event->next = *events;
> > -                    *events = event;
> > -                    wake_up(&xenbus_watch_queue);
> > -                } else {
> > -                    printk("unexpected watch token %s\n", event->token);
> > -                    free(event);
> > +        xenbus_read_data((char *)&msg, sizeof(msg));
> > +        DEBUG("Msg len %d, %d avail, id %d.\n", msg.len + sizeof(msg),
> > +              xenstore_buf->rsp_prod - xenstore_buf->rsp_cons, msg.req_id);
> > +
> > +        if (msg.len > XENSTORE_PAYLOAD_MAX) {
> > +            printk("Xenstore violates protocol, message longer than allowed.\n");
> > +            return;
> > +        }
> > +
> > +        if (msg.type == XS_WATCH_EVENT) {
> > +            struct xenbus_event *event = malloc(sizeof(*event) + msg.len);
> > +            xenbus_event_queue *events = NULL;
> > +            struct watch *watch;
> > +            char *c;
> > +            int zeroes = 0;
> > +
> > +            data = (char*)event + sizeof(*event);
> > +            xenbus_read_data(data, msg.len);
> > +
> > +            for (c = data; c < data + msg.len; c++)
> > +                if (!*c)
> > +                    zeroes++;
> > +            if (zeroes != 2) {
> > +                printk("Xenstore: illegal watch event data\n");
> > +                free(event);
> > +                continue;
> > +            }
> > +
> > +            event->path = data;
> > +            event->token = event->path + strlen(event->path) + 1;
> > +
> > +            for (watch = watches; watch; watch = watch->next)
> > +                if (!strcmp(watch->token, event->token)) {
> > +                    events = watch->events;
> > +                    break;
> >                   }
> > +
> > +            if (events) {
> > +                event->next = *events;
> > +                *events = event;
> > +                wake_up(&xenbus_watch_queue);
> >               } else {
> > -                req_info[msg.req_id].reply = malloc(sizeof(msg) + msg.len);
> > -                memcpy_from_ring(xenstore_buf->rsp, req_info[msg.req_id].reply,
> > -                                 MASK_XENSTORE_IDX(xenstore_buf->rsp_cons),
> > -                                 msg.len + sizeof(msg));
> > -                mb();
> > -                xenstore_buf->rsp_cons += msg.len + sizeof(msg);
> > -                wake_up(&req_info[msg.req_id].waitq);
> > +                printk("Xenstore: unexpected watch token %s\n", event->token);
> > +                free(event);
> >               }
> > -            wmb();
> > -            notify_remote_via_evtchn(xenbus_evtchn);
> > +            continue;
> >           }
> > +
> > +        data = malloc(sizeof(msg) + msg.len);
> > +        memcpy(data, &msg, sizeof(msg));
> > +        xenbus_read_data(data + sizeof(msg), msg.len);
> > +
> > +        if (msg.req_id >= NR_REQS || !req_info[msg.req_id].in_use) {
> > +            printk("Xenstore: illegal request id %d\n", msg.req_id);
> > +            free(data);
> > +            continue;
> > +        }
> > +
> > +        DEBUG("Message is good.\n");
> > +
> > +        req_info[msg.req_id].reply = data;
> > +
> > +        wake_up(&req_info[msg.req_id].waitq);
> >       }
> >   }
> > @@ -451,36 +481,40 @@ static void xb_write(int type, int req_id, xenbus_transaction_t trans_id,
> >       cur_req = &header_req;
> > -    BUG_ON(len > XENSTORE_RING_SIZE);
> > -    /* Wait for the ring to drain to the point where we can send the
> > -       message. */
> > -    prod = xenstore_buf->req_prod;
> > -    if (prod + len - xenstore_buf->req_cons > XENSTORE_RING_SIZE)
> > -    {
> > -        /* Wait for there to be space on the ring */
> > -        DEBUG("prod %d, len %d, cons %d, size %d; waiting.\n",
> > -                prod, len, xenstore_buf->req_cons, XENSTORE_RING_SIZE);
> > -        wait_event(xb_waitq,
> > -                xenstore_buf->req_prod + len - xenstore_buf->req_cons <=
> > -                XENSTORE_RING_SIZE);
> > -        DEBUG("Back from wait.\n");
> > -        prod = xenstore_buf->req_prod;
> > -    }
> > +    BUG_ON(len > XENSTORE_PAYLOAD_MAX);
> > +
> > +    /* Make sure we are the only thread trying to write. */
> > +    down(&xb_write_sem);
> > -    /* We're now guaranteed to be able to send the message without
> > -       overflowing the ring.  Do so. */
> > +    /* Send the message in chunks using free ring space when available. */
> >       total_off = 0;
> >       req_off = 0;
> > -    while (total_off < len)
> > +    while (total_off < len)
> >       {
> > +        prod = xenstore_buf->req_prod;
> > +        if (prod - xenstore_buf->req_cons >= XENSTORE_RING_SIZE)
> > +        {
> > +            /* Send evtchn to notify remote */
> > +            notify_remote_via_evtchn(xenbus_evtchn);
> > +
> > +            /* Wait for there to be space on the ring */
> > +            DEBUG("prod %d, len %d, cons %d, size %d; waiting.\n", prod,
> > +                  len - total_off, xenstore_buf->req_cons, XENSTORE_RING_SIZE);
> > +            wait_event(xb_waitq,
> > +                       prod - xenstore_buf->req_cons < XENSTORE_RING_SIZE);
> > +            DEBUG("Back from wait.\n");
> > +        }
> > +
> >           this_chunk = min(cur_req->len - req_off,
> > -                XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(prod));
> > +                         XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(prod));
> > +        this_chunk = min(this_chunk,
> > +                         xenstore_buf->req_cons + XENSTORE_RING_SIZE - prod);
> >           memcpy((char *)xenstore_buf->req + MASK_XENSTORE_IDX(prod),
> > -                (char *)cur_req->data + req_off, this_chunk);
> > +               (char *)cur_req->data + req_off, this_chunk);
> >           prod += this_chunk;
> >           req_off += this_chunk;
> >           total_off += this_chunk;
> > -        if (req_off == cur_req->len)
> > +        if (req_off == cur_req->len)
> >           {
> >               req_off = 0;
> >               if (cur_req == &header_req)
> > @@ -488,20 +522,20 @@ static void xb_write(int type, int req_id, xenbus_transaction_t trans_id,
> >               else
> >                   cur_req++;
> >           }
> > +
> > +        /* Remote must see entire message before updating indexes */
> > +        wmb();
> > +        xenstore_buf->req_prod = prod;
> >       }
> > +    /* Send evtchn to notify remote */
> > +    notify_remote_via_evtchn(xenbus_evtchn);
> > +
> >       DEBUG("Complete main loop of xb_write.\n");
> >       BUG_ON(req_off != 0);
> >       BUG_ON(total_off != len);
> > -    BUG_ON(prod > xenstore_buf->req_cons + XENSTORE_RING_SIZE);
> > -    /* Remote must see entire message before updating indexes */
> > -    wmb();
> > -
> > -    xenstore_buf->req_prod += len;
> > -
> > -    /* Send evtchn to notify remote */
> > -    notify_remote_via_evtchn(xenbus_evtchn);
> > +    up(&xb_write_sem);
> >   }
> >   /* Send a mesasge to xenbus, in the same fashion as xb_write, and
> > 
> 

