Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F154945B4D8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 08:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230079.397798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmH8-0005eV-Ur; Wed, 24 Nov 2021 07:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230079.397798; Wed, 24 Nov 2021 07:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmH8-0005cB-RZ; Wed, 24 Nov 2021 07:01:02 +0000
Received: by outflank-mailman (input) for mailman id 230079;
 Wed, 24 Nov 2021 07:01:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQO5=QL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mpmH6-0005YU-VC
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:01:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45f40cf3-4cf4-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:00:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C9F842195D;
 Wed, 24 Nov 2021 07:00:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 953EF13240;
 Wed, 24 Nov 2021 07:00:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QinaIijjnWHdCAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Nov 2021 07:00:56 +0000
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
X-Inumbo-ID: 45f40cf3-4cf4-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637737256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CwiRND9sUmIgpLpyZ+X1paDgsGd1UAbnBN7Tro+bIjg=;
	b=adVOxqqoivBQ6u91xCkV/oqFHK21Lg3Qmyyy7ggvyQOW23BYT7RNib0l4zmVNZnQCt7aiY
	K6kTKJOuADUvQi0RT/ovQih1O4IcRc1rs83eoOAFST3pjjxjoMAcLUA3vnxagT6YWhXC1X
	QhD+CbdQ+3IjxzqTU8hMDLTIq1WhkkM=
Subject: Re: [PATCH v4] xenbus: support large messages
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20211004094000.29868-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <244e6bc7-9158-7c52-13ab-d25daafbc2c8@suse.com>
Date: Wed, 24 Nov 2021 08:00:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211004094000.29868-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Y181P6BFv7tgthqU2tAOS3T9XmO1q283n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y181P6BFv7tgthqU2tAOS3T9XmO1q283n
Content-Type: multipart/mixed; boundary="dJ65ISaETfggy1VefxjzJAcoxxz0j18yK";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <244e6bc7-9158-7c52-13ab-d25daafbc2c8@suse.com>
Subject: Re: [PATCH v4] xenbus: support large messages
References: <20211004094000.29868-1-jgross@suse.com>
In-Reply-To: <20211004094000.29868-1-jgross@suse.com>

--dJ65ISaETfggy1VefxjzJAcoxxz0j18yK
Content-Type: multipart/mixed;
 boundary="------------6E2ADA8ABB96A4523042F315"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6E2ADA8ABB96A4523042F315
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Ping?

On 04.10.21 11:40, Juergen Gross wrote:
> Today the implementation of the xenbus protocol in Mini-OS will only
> allow to transfer the complete message to or from the ring page buffer.=

> This is limiting the maximum message size to lower values as the xenbus=

> protocol normally would allow.
>=20
> Change that by allowing to transfer the xenbus message in chunks as
> soon as they are available.
>=20
> Avoid crashing Mini-OS in case of illegal data read from the ring
> buffer.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - drop redundant if (Samuel Thibault)
> - move rmb() (Samuel Thibault)
> V3:
> - correct notification test (Samuel Thibault)
> V4:
> - more memory barriers (Samuel Thibault)
> ---
>   xenbus/xenbus.c | 210 ++++++++++++++++++++++++++++-------------------=
-
>   1 file changed, 122 insertions(+), 88 deletions(-)
>=20
> diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
> index 23de61e..b687678 100644
> --- a/xenbus/xenbus.c
> +++ b/xenbus/xenbus.c
> @@ -29,6 +29,7 @@
>   #include <xen/hvm/params.h>
>   #include <mini-os/spinlock.h>
>   #include <mini-os/xmalloc.h>
> +#include <mini-os/semaphore.h>
>  =20
>   #define min(x,y) ({                       \
>           typeof(x) tmpx =3D (x);                 \
> @@ -46,6 +47,7 @@
>   static struct xenstore_domain_interface *xenstore_buf;
>   static DECLARE_WAIT_QUEUE_HEAD(xb_waitq);
>   DECLARE_WAIT_QUEUE_HEAD(xenbus_watch_queue);
> +static __DECLARE_SEMAPHORE_GENERIC(xb_write_sem, 1);
>  =20
>   xenbus_event_queue xenbus_events;
>   static struct watch {
> @@ -231,75 +233,103 @@ char *xenbus_wait_for_state_change(const char* p=
ath, XenbusState *state, xenbus_
>   }
>  =20
>  =20
> +static void xenbus_read_data(char *buf, unsigned int len)
> +{
> +    unsigned int off =3D 0;
> +    unsigned int prod, cons;
> +    unsigned int size;
> +
> +    while (off !=3D len)
> +    {
> +        wait_event(xb_waitq, xenstore_buf->rsp_prod !=3D xenstore_buf-=
>rsp_cons);
> +
> +        prod =3D xenstore_buf->rsp_prod;
> +        cons =3D xenstore_buf->rsp_cons;
> +        DEBUG("Rsp_cons %d, rsp_prod %d.\n", cons, prod);
> +        size =3D min(len - off, prod - cons);
> +
> +        rmb();   /* Make sure data read from ring is ordered with rsp_=
prod. */
> +        memcpy_from_ring(xenstore_buf->rsp, buf + off,
> +                         MASK_XENSTORE_IDX(cons), size);
> +        off +=3D size;
> +        mb();    /* memcpy() and rsp_cons update must not be reordered=
=2E */
> +        xenstore_buf->rsp_cons +=3D size;
> +        mb();    /* rsp_cons must be visible before we look at rsp_pro=
d. */
> +        if (xenstore_buf->rsp_prod - cons >=3D XENSTORE_RING_SIZE)
> +            notify_remote_via_evtchn(xenbus_evtchn);
> +    }
> +}
> +
>   static void xenbus_thread_func(void *ign)
>   {
>       struct xsd_sockmsg msg;
> -    unsigned prod =3D xenstore_buf->rsp_prod;
> +    char *data;
>  =20
>       for (;;) {
> -        wait_event(xb_waitq, prod !=3D xenstore_buf->rsp_prod);
> -        while (1) {
> -            prod =3D xenstore_buf->rsp_prod;
> -            DEBUG("Rsp_cons %d, rsp_prod %d.\n", xenstore_buf->rsp_con=
s,
> -                  xenstore_buf->rsp_prod);
> -            if (xenstore_buf->rsp_prod - xenstore_buf->rsp_cons < size=
of(msg))
> -                break;
> -            rmb();
> -            memcpy_from_ring(xenstore_buf->rsp, &msg,
> -                             MASK_XENSTORE_IDX(xenstore_buf->rsp_cons)=
,
> -                             sizeof(msg));
> -            DEBUG("Msg len %d, %d avail, id %d.\n", msg.len + sizeof(m=
sg),
> -                  xenstore_buf->rsp_prod - xenstore_buf->rsp_cons, msg=
=2Ereq_id);
> -
> -            if (xenstore_buf->rsp_prod - xenstore_buf->rsp_cons <
> -                sizeof(msg) + msg.len)
> -                break;
> -
> -            DEBUG("Message is good.\n");
> -
> -            if (msg.type =3D=3D XS_WATCH_EVENT) {
> -                struct xenbus_event *event =3D malloc(sizeof(*event) +=
 msg.len);
> -                xenbus_event_queue *events =3D NULL;
> -                char *data =3D (char*)event + sizeof(*event);
> -                struct watch *watch;
> -
> -                memcpy_from_ring(xenstore_buf->rsp, data,
> -                    MASK_XENSTORE_IDX(xenstore_buf->rsp_cons + sizeof(=
msg)),
> -                    msg.len);
> -
> -                event->path =3D data;
> -                event->token =3D event->path + strlen(event->path) + 1=
;
> -
> -                mb();
> -                xenstore_buf->rsp_cons +=3D msg.len + sizeof(msg);
> -
> -                for (watch =3D watches; watch; watch =3D watch->next)
> -                    if (!strcmp(watch->token, event->token)) {
> -                        events =3D watch->events;
> -                        break;
> -                    }
> -
> -                if (events) {
> -                    event->next =3D *events;
> -                    *events =3D event;
> -                    wake_up(&xenbus_watch_queue);
> -                } else {
> -                    printk("unexpected watch token %s\n", event->token=
);
> -                    free(event);
> +        xenbus_read_data((char *)&msg, sizeof(msg));
> +        DEBUG("Msg len %d, %d avail, id %d.\n", msg.len + sizeof(msg),=

> +              xenstore_buf->rsp_prod - xenstore_buf->rsp_cons, msg.req=
_id);
> +
> +        if (msg.len > XENSTORE_PAYLOAD_MAX) {
> +            printk("Xenstore violates protocol, message longer than al=
lowed.\n");
> +            return;
> +        }
> +
> +        if (msg.type =3D=3D XS_WATCH_EVENT) {
> +            struct xenbus_event *event =3D malloc(sizeof(*event) + msg=
=2Elen);
> +            xenbus_event_queue *events =3D NULL;
> +            struct watch *watch;
> +            char *c;
> +            int zeroes =3D 0;
> +
> +            data =3D (char*)event + sizeof(*event);
> +            xenbus_read_data(data, msg.len);
> +
> +            for (c =3D data; c < data + msg.len; c++)
> +                if (!*c)
> +                    zeroes++;
> +            if (zeroes !=3D 2) {
> +                printk("Xenstore: illegal watch event data\n");
> +                free(event);
> +                continue;
> +            }
> +
> +            event->path =3D data;
> +            event->token =3D event->path + strlen(event->path) + 1;
> +
> +            for (watch =3D watches; watch; watch =3D watch->next)
> +                if (!strcmp(watch->token, event->token)) {
> +                    events =3D watch->events;
> +                    break;
>                   }
> +
> +            if (events) {
> +                event->next =3D *events;
> +                *events =3D event;
> +                wake_up(&xenbus_watch_queue);
>               } else {
> -                req_info[msg.req_id].reply =3D malloc(sizeof(msg) + ms=
g.len);
> -                memcpy_from_ring(xenstore_buf->rsp, req_info[msg.req_i=
d].reply,
> -                                 MASK_XENSTORE_IDX(xenstore_buf->rsp_c=
ons),
> -                                 msg.len + sizeof(msg));
> -                mb();
> -                xenstore_buf->rsp_cons +=3D msg.len + sizeof(msg);
> -                wake_up(&req_info[msg.req_id].waitq);
> +                printk("Xenstore: unexpected watch token %s\n", event-=
>token);
> +                free(event);
>               }
>  =20
> -            wmb();
> -            notify_remote_via_evtchn(xenbus_evtchn);
> +            continue;
>           }
> +
> +        data =3D malloc(sizeof(msg) + msg.len);
> +        memcpy(data, &msg, sizeof(msg));
> +        xenbus_read_data(data + sizeof(msg), msg.len);
> +
> +        if (msg.req_id >=3D NR_REQS || !req_info[msg.req_id].in_use) {=

> +            printk("Xenstore: illegal request id %d\n", msg.req_id);
> +            free(data);
> +            continue;
> +        }
> +
> +        DEBUG("Message is good.\n");
> +
> +        req_info[msg.req_id].reply =3D data;
> +
> +        wake_up(&req_info[msg.req_id].waitq);
>       }
>   }
>  =20
> @@ -451,36 +481,40 @@ static void xb_write(int type, int req_id, xenbus=
_transaction_t trans_id,
>  =20
>       cur_req =3D &header_req;
>  =20
> -    BUG_ON(len > XENSTORE_RING_SIZE);
> -    /* Wait for the ring to drain to the point where we can send the
> -       message. */
> -    prod =3D xenstore_buf->req_prod;
> -    if (prod + len - xenstore_buf->req_cons > XENSTORE_RING_SIZE)
> -    {
> -        /* Wait for there to be space on the ring */
> -        DEBUG("prod %d, len %d, cons %d, size %d; waiting.\n",
> -                prod, len, xenstore_buf->req_cons, XENSTORE_RING_SIZE)=
;
> -        wait_event(xb_waitq,
> -                xenstore_buf->req_prod + len - xenstore_buf->req_cons =
<=3D
> -                XENSTORE_RING_SIZE);
> -        DEBUG("Back from wait.\n");
> -        prod =3D xenstore_buf->req_prod;
> -    }
> +    BUG_ON(len > XENSTORE_PAYLOAD_MAX);
> +
> +    /* Make sure we are the only thread trying to write. */
> +    down(&xb_write_sem);
>  =20
> -    /* We're now guaranteed to be able to send the message without
> -       overflowing the ring.  Do so. */
> +    /* Send the message in chunks using free ring space when available=
=2E */
>       total_off =3D 0;
>       req_off =3D 0;
> -    while (total_off < len)
> +    while (total_off < len)
>       {
> +        prod =3D xenstore_buf->req_prod;
> +        if (prod - xenstore_buf->req_cons >=3D XENSTORE_RING_SIZE)
> +        {
> +            /* Send evtchn to notify remote */
> +            notify_remote_via_evtchn(xenbus_evtchn);
> +
> +            /* Wait for there to be space on the ring */
> +            DEBUG("prod %d, len %d, cons %d, size %d; waiting.\n", pro=
d,
> +                  len - total_off, xenstore_buf->req_cons, XENSTORE_RI=
NG_SIZE);
> +            wait_event(xb_waitq,
> +                       prod - xenstore_buf->req_cons < XENSTORE_RING_S=
IZE);
> +            DEBUG("Back from wait.\n");
> +        }
> +
>           this_chunk =3D min(cur_req->len - req_off,
> -                XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(prod));
> +                         XENSTORE_RING_SIZE - MASK_XENSTORE_IDX(prod))=
;
> +        this_chunk =3D min(this_chunk,
> +                         xenstore_buf->req_cons + XENSTORE_RING_SIZE -=
 prod);
>           memcpy((char *)xenstore_buf->req + MASK_XENSTORE_IDX(prod),
> -                (char *)cur_req->data + req_off, this_chunk);
> +               (char *)cur_req->data + req_off, this_chunk);
>           prod +=3D this_chunk;
>           req_off +=3D this_chunk;
>           total_off +=3D this_chunk;
> -        if (req_off =3D=3D cur_req->len)
> +        if (req_off =3D=3D cur_req->len)
>           {
>               req_off =3D 0;
>               if (cur_req =3D=3D &header_req)
> @@ -488,20 +522,20 @@ static void xb_write(int type, int req_id, xenbus=
_transaction_t trans_id,
>               else
>                   cur_req++;
>           }
> +
> +        /* Remote must see entire message before updating indexes */
> +        wmb();
> +        xenstore_buf->req_prod =3D prod;
>       }
>  =20
> +    /* Send evtchn to notify remote */
> +    notify_remote_via_evtchn(xenbus_evtchn);
> +
>       DEBUG("Complete main loop of xb_write.\n");
>       BUG_ON(req_off !=3D 0);
>       BUG_ON(total_off !=3D len);
> -    BUG_ON(prod > xenstore_buf->req_cons + XENSTORE_RING_SIZE);
>  =20
> -    /* Remote must see entire message before updating indexes */
> -    wmb();
> -
> -    xenstore_buf->req_prod +=3D len;
> -
> -    /* Send evtchn to notify remote */
> -    notify_remote_via_evtchn(xenbus_evtchn);
> +    up(&xb_write_sem);
>   }
>  =20
>   /* Send a mesasge to xenbus, in the same fashion as xb_write, and
>=20


--------------6E2ADA8ABB96A4523042F315
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------6E2ADA8ABB96A4523042F315--

--dJ65ISaETfggy1VefxjzJAcoxxz0j18yK--

--Y181P6BFv7tgthqU2tAOS3T9XmO1q283n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGd4ycFAwAAAAAACgkQsN6d1ii/Ey8r
/gf/d+UjYEoQh9p/TToGUFUQ3mxUMT+FCS89F5+2W0aHiHQ1E/8xi6N8caTBtw79TUSJdxcibWYb
joLIAK9li+92dkgUunJ0cxu/v+x2BNEDAIq/65wPUotunS/8f+ketntkc7W+OS/DMW7p4jB2XHEe
jwBMVTD69oT33eRpbLa18Vbc2M0s/jxk/iVbzuvp4GvKHqR2O4XeP0S5hSjwUxCn2+1sJAWfqxz5
j7166+x3oHaSVmP03gsZ8IM1Fw7+gbsw3HSci3b5O7BruJfcTxmT2ybRiVhtkdLuBr7Y1BclJGLw
BLpugvf7IZ255XdD6pg91vvxcoi5pEEDRtvGL4fbxA==
=8G1s
-----END PGP SIGNATURE-----

--Y181P6BFv7tgthqU2tAOS3T9XmO1q283n--

