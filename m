Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878DA7DF9F2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 19:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626949.977698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qycSr-0007Y8-Ux; Thu, 02 Nov 2023 18:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626949.977698; Thu, 02 Nov 2023 18:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qycSr-0007Vt-SO; Thu, 02 Nov 2023 18:30:45 +0000
Received: by outflank-mailman (input) for mailman id 626949;
 Thu, 02 Nov 2023 18:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Af+B=GP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qycSq-0007Vn-V3
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 18:30:45 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede20119-79ad-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 19:30:42 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53e751aeb3cso2034517a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Nov 2023 11:30:42 -0700 (PDT)
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
X-Inumbo-ID: ede20119-79ad-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698949842; x=1699554642; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy/RDA6jQwzA0cX1H6r3EJj2PH3gaa2gA4/nfPT+XRY=;
        b=NhyO88QYZa4rCoCA04yJbfGcqiRCgEEsrZy/c6WRcLPlBTVHOU8N+WgaiLq4zZJAUm
         jSBR7CE9D3MzoOKTnnQw+SDFJLKX0kBtr+Y41QYqcApQLXkkQvsMZwaqbNm8a58FGDKF
         lkskxKtCk0X4/XFUMUYEqX/fi5+PLOh54q9ZkdW+vyEb36uGomO/MUF1C//o1VxrJ8pP
         FrzizuyjwYNIhAuMnfaV5ahQMberIDRdEItLtsrgibnRCCsFhRViVZTKBJ2880EIKUcm
         XDaFv0W0UZcM9C5SOtxlorDcx/upE70+rx4wfI1C7JyvSjKd5lw7/Bwcs0vLrnWHjkGD
         DPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698949842; x=1699554642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uy/RDA6jQwzA0cX1H6r3EJj2PH3gaa2gA4/nfPT+XRY=;
        b=c/Mu35sMqZzBoPvY+rym424ZCGfN+HJ8I1SNUxYQcRJstLm2Qfawr1Cln2ZiJdA2VF
         iVb3Wpgq0RLYr4UqCXzfYO/lVhowAhQIqPdi2DbfV3Aa8MbI0tAm4qw9mte9E7GnpS1e
         HQEzVmtFvUx0PGBfZboykMrjwAYMHtFLp7m0NmZge2o205QJH8eFo+MetS9LAlhJX1C7
         xM6GrHbHiaBBhCsKoVSquLZFpzITvSGjKyfGUkRH+GwszxoYvqJj7Fvlvyj/KbVRfbuH
         sa2enh6OonZLrs2ZcOf2L52pHogAiHKcUypBb+iZ2bu7a5hEcxNi3zGtj0jrvRKk3vHa
         ++Pg==
X-Gm-Message-State: AOJu0YxmBKWxEWJb0g79Z6JAEd5E2J/kNsBEBRTKHb+XAXixjcozxfII
	kEbVZ2nYTT2ceq6s5cpCoffiNb3JUh9FWus2KYs=
X-Google-Smtp-Source: AGHT+IFjUqCZfkwGbHNl/Lbxfod7sB2TQiOK+VsDuZZU6mQ3DVzRl6vhegVz6TniJYAzvuukVcum3gPVVIiahw9o9aM=
X-Received: by 2002:a05:6402:3586:b0:53d:d879:34f3 with SMTP id
 y6-20020a056402358600b0053dd87934f3mr19679369edc.1.1698949841560; Thu, 02 Nov
 2023 11:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-5-jgross@suse.com>
In-Reply-To: <20231101093325.30302-5-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 2 Nov 2023 14:30:30 -0400
Message-ID: <CAKf6xptuzB_tkYaksQfLb2kWtX03cjoQ2iGon1typjbkLT2AXQ@mail.gmail.com>
Subject: Re: [PATCH 04/29] tools/xenlogd: add transport layer
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:34=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the transport layer of 9pfs. This is basically the infrastructure
> to receive requests from the frontend and to send the related answers
> via the rings.
>
> In order to avoid unaligned accesses e.g. on Arm, add the definition of
> __packed to the common-macros.h header.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---

> diff --git a/tools/xenlogd/io.c b/tools/xenlogd/io.c
> index ef0954d69d..590d06e906 100644
> --- a/tools/xenlogd/io.c
> +++ b/tools/xenlogd/io.c

> +static unsigned int get_request_bytes(device *device, unsigned int off,
> +                                      unsigned int len)
> +{
> +    unsigned int size;
> +    unsigned int out_data =3D ring_out_data(device);
> +    RING_IDX prod, cons;
> +
> +    size =3D min(len - off, out_data);
> +    prod =3D xen_9pfs_mask(device->intf->out_prod, device->ring_size);
> +    cons =3D xen_9pfs_mask(device->cons_pvt_out, device->ring_size);
> +    xen_9pfs_read_packet(device->buffer + off, device->data.out, size,
> +                         prod, &cons, device->ring_size);
> +
> +    xen_rmb();           /* Read data out before setting visible consume=
r. */
> +    device->cons_pvt_out +=3D size;
> +    device->intf->out_cons =3D device->cons_pvt_out;
> +
> +    /* Signal that more space is available now. */
> +    xenevtchn_notify(xe, device->evtchn);
> +
> +    return size;
> +}
> +
> +static unsigned int put_request_bytes(device *device, unsigned int off,
> +                                      unsigned int len)

Should this be named put_response_bytes?

> +{
> +    unsigned int size;
> +    unsigned int in_data =3D ring_in_free(device);
> +    RING_IDX prod, cons;
> +
> +    size =3D min(len - off, in_data);

IIUC, len is the total length of the outgoing data.  Maybe total_len
would be a better name?  I at least read len as just a length for a
particular call.  Same comment applies to get_request_bytes() if you
want to follow it.

> +    prod =3D xen_9pfs_mask(device->prod_pvt_in, device->ring_size);
> +    cons =3D xen_9pfs_mask(device->intf->in_cons, device->ring_size);
> +    xen_9pfs_write_packet(device->data.in, device->buffer + off, size,
> +                          &prod, cons, device->ring_size);
> +
> +    xen_wmb();           /* Write data out before setting visible produc=
er. */
> +    device->prod_pvt_in +=3D size;
> +    device->intf->in_prod =3D device->prod_pvt_in;
> +
> +    return size;
> +}
> +
>  static bool io_work_pending(device *device)
>  {
>      if ( device->stop_thread )
>          return true;
> -    return false;
> +    if ( device->error )
> +        return false;
> +    return device->handle_response ? ring_in_free(device)
> +                                   : ring_out_data(device);
>  }
>
>  void *io_thread(void *arg)
>  {
>      device *device =3D arg;
> +    unsigned int count =3D 0;
> +    struct p9_header hdr;
> +    bool in_hdr =3D true;
> +
> +    device->max_size =3D device->ring_size;
> +    device->buffer =3D malloc(device->max_size);
> +    if ( !device->buffer )
> +    {
> +        syslog(LOG_CRIT, "memory allocation failure!");
> +        return NULL;
> +    }
>
>      while ( !device->stop_thread )
>      {
> @@ -36,9 +127,56 @@ void *io_thread(void *arg)
>          }
>          pthread_mutex_unlock(&device->mutex);
>
> -        /* TODO: I/O handling. */
> +        if ( device->stop_thread || device->error )
> +            continue;
> +
> +        if ( !device->handle_response )
> +        {
> +            if ( in_hdr )
> +            {
> +                count +=3D get_request_bytes(device, count, sizeof(hdr))=
;
> +                if ( count !=3D sizeof(hdr) )
> +                    continue;
> +                hdr =3D *(struct p9_header *)device->buffer;
> +                if ( hdr.size > device->max_size || hdr.size < sizeof(hd=
r) )
> +                {
> +                    syslog(LOG_ERR, "%u.%u specified illegal request len=
gth %u",
> +                           device->domid, device->devid, hdr.size);
> +                    device->error =3D true;

When device->error is set, io_thread stops processing requests, but do
we want to also tear down this backend?  The event channel at least is
left in place and unmasked.

> +                    continue;
> +                }
> +                in_hdr =3D false;
> +            }
> +
> +            count +=3D get_request_bytes(device, count, hdr.size);
> +            if ( count < hdr.size )
> +                continue;
> +
> +            /* TODO: handle request. */
> +
> +            device->handle_response =3D true;
> +            hdr.size =3D ((struct p9_header *)device->buffer)->size;

hdr.size is set during the struct copy above, so this isn't needed?

Thanks,
Jason

