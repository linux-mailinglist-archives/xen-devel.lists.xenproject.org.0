Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF56C2CD67C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 14:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43465.78125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoUQ-0001Us-NE; Thu, 03 Dec 2020 13:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43465.78125; Thu, 03 Dec 2020 13:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoUQ-0001US-JJ; Thu, 03 Dec 2020 13:17:42 +0000
Received: by outflank-mailman (input) for mailman id 43465;
 Thu, 03 Dec 2020 13:17:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oiWT=FH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kkoUP-0001UL-6h
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 13:17:41 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc16c507-6054-4e98-8b29-ac2df93bcfb8;
 Thu, 03 Dec 2020 13:17:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z7so1850999wrn.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Dec 2020 05:17:40 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id s13sm1715974wrt.80.2020.12.03.05.17.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 05:17:38 -0800 (PST)
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
X-Inumbo-ID: bc16c507-6054-4e98-8b29-ac2df93bcfb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=LivjrigrWtqG0Vw5HyVRbeR6KqZ/yS7uJpBbfZfM6qc=;
        b=HII2TH9cq93Hhcau37aKlLWfxT31E4b/kk+i/jj6TTdRXoo3dqSCB6FOeMgQw2TBXI
         EqfGqpb+CCz8LTEjzxXMN+oYY2NW+rdO7n3sGd+D+/bBmsfrsoOrGAsjixk5QKiQCRz3
         4jTrdgUVgiIsczPIG9ZLl0yV56DXNlqGk/cpbYo/kLXaqfdPCJYVQsIy8OOCzwRqE3V5
         1l3P0e6GaMTNsNcoZ7i7icDjYpEHdlPEvCWy178pVavwNKawkRe4KFwFGRmd/fqo81ql
         L1wt7rB3W8kvDS6C+H47FxT8WO2zJ9SdBduWoQiQmFpZYQk+ogKdbTscEg+Ij6uSeDwq
         Qx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=LivjrigrWtqG0Vw5HyVRbeR6KqZ/yS7uJpBbfZfM6qc=;
        b=tbJIk/R60KZ0L5xzMEjY8lP/C/bv3P3B232jAdnCX7CxWgNnWNPum/UipH79Ugg36s
         VQcaQN/yVSmJiMvRwidBFgVyIKXlMQXTRpk67Ibwth7c5nNcOeOwu0qhsG22wLe1FfH5
         oDWQe/bKkvQe2+FHdQ2xhDC5j8LEX/JsoRMUS+YX/dwLaAgJbqW8SnAFp6JCl3vXxuHJ
         F/eqL7QlhrNXhsIvJ9VT4bRzKD2OpoAlO/MQ1s1JoVFwvYMjv/Hd4NY/XUNBp/C5010r
         7IdNwsTR0bqcjofW+8Q2cSQkoUFzHGUPf+lUnIKkkDidheRAqHfM+JMy56KP7a1uzzvu
         OjWQ==
X-Gm-Message-State: AOAM530zKx5Kwn+D8YIGQSHkAjSh9c7x3WVHuxvs3DwQa1jCxtkMlk9a
	fO7dAbt7iMH38Dw1vpwAvUY=
X-Google-Smtp-Source: ABdhPJz2NPvHt6rxL2W8yqebyXy479s6Ch9hOjvZpgZo6iHcvt8bkLEm2x0H8ee5Q/TJjfrGPV7rDA==
X-Received: by 2002:adf:b647:: with SMTP id i7mr3694400wre.241.1607001459410;
        Thu, 03 Dec 2020 05:17:39 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Andrushchenko'" <Oleksandr_Andrushchenko@epam.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20201124080159.11912-1-paul@xen.org> <20201124080159.11912-4-paul@xen.org> <d16e33d7-a4af-8686-c639-b4f591caf77c@epam.com>
In-Reply-To: <d16e33d7-a4af-8686-c639-b4f591caf77c@epam.com>
Subject: RE: [PATCH v4 03/23] libxl: Make sure devices added by pci-attach are reflected in the config
Date: Thu, 3 Dec 2020 13:17:38 -0000
Message-ID: <00a701d6c976$ac403020$04c09060$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQMdgDRK4dMgv8Gkq5tfso7ziJ+CnAGZk9QaAhWXG0OnOm+6MA==

> -----Original Message-----
> From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
> Sent: 01 December 2020 13:12
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>;
> Anthony PERARD <anthony.perard@citrix.com>
> Subject: Re: [PATCH v4 03/23] libxl: Make sure devices added by pci-attach are reflected in the config
> 
> Hi, Paul!
> 
> On 11/24/20 10:01 AM, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Currently libxl__device_pci_add_xenstore() is broken in that does not
> > update the domain's configuration for the first device added (which causes
> > creation of the overall backend area in xenstore). This can be easily observed
> > by running 'xl list -l' after adding a single device: the device will be
> > missing.
> >
> > This patch fixes the problem and adds a DEBUG log line to allow easy
> > verification that the domain configuration is being modified. Also, the use
> > of libxl__device_generic_add() is dropped as it leads to a confusing situation
> > where only partial backend information is written under the xenstore
> > '/libxl' path. For LIBXL__DEVICE_KIND_PCI devices the only definitive
> > information in xenstore is under '/local/domain/0/backend' (the '0' being
> > hard-coded).
> >
> > NOTE: This patch includes a whitespace in add_pcis_done().
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Cc: Ian Jackson <iwj@xenproject.org>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: Anthony PERARD <anthony.perard@citrix.com>
> >
> > v2:
> >   - Avoid having two completely different ways of adding devices into xenstore
> >
> > v3:
> >   - Revert some changes form v2 as there is confusion over use of the libxl
> >     and backend xenstore paths which needs to be fixed
> > ---
> >   tools/libs/light/libxl_pci.c | 87 +++++++++++++++++++++++---------------------
> >   1 file changed, 45 insertions(+), 42 deletions(-)
> >
> > diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> > index 9d44b28f0a..da01c77ba2 100644
> > --- a/tools/libs/light/libxl_pci.c
> > +++ b/tools/libs/light/libxl_pci.c
> > @@ -79,39 +79,55 @@ static void libxl__device_from_pci(libxl__gc *gc, uint32_t domid,
> >       device->kind = LIBXL__DEVICE_KIND_PCI;
> >   }
> >
> > -static int libxl__create_pci_backend(libxl__gc *gc, uint32_t domid,
> > -                                     const libxl_device_pci *pci,
> > -                                     int num)
> > +static void libxl__create_pci_backend(libxl__gc *gc, xs_transaction_t t,
> > +                                      uint32_t domid, const libxl_device_pci *pci)
> >   {
> > -    flexarray_t *front = NULL;
> > -    flexarray_t *back = NULL;
> > -    libxl__device device;
> > -    int i;
> > +    libxl_ctx *ctx = libxl__gc_owner(gc);
> > +    flexarray_t *front, *back;
> > +    char *fe_path, *be_path;
> > +    struct xs_permissions fe_perms[2], be_perms[2];
> > +
> > +    LOGD(DEBUG, domid, "Creating pci backend");
> >
> >       front = flexarray_make(gc, 16, 1);
> >       back = flexarray_make(gc, 16, 1);
> >
> > -    LOGD(DEBUG, domid, "Creating pci backend");
> > -
> > -    /* add pci device */
> > -    libxl__device_from_pci(gc, domid, pci, &device);
> > +    fe_path = libxl__domain_device_frontend_path(gc, domid, 0,
> > +                                                 LIBXL__DEVICE_KIND_PCI);
> > +    be_path = libxl__domain_device_backend_path(gc, 0, domid, 0,
> > +                                                LIBXL__DEVICE_KIND_PCI);
> >
> > +    flexarray_append_pair(back, "frontend", fe_path);
> >       flexarray_append_pair(back, "frontend-id", GCSPRINTF("%d", domid));
> > -    flexarray_append_pair(back, "online", "1");
> > +    flexarray_append_pair(back, "online", GCSPRINTF("%d", 1));
> >       flexarray_append_pair(back, "state", GCSPRINTF("%d", XenbusStateInitialising));
> >       flexarray_append_pair(back, "domain", libxl__domid_to_name(gc, domid));
> >
> > -    for (i = 0; i < num; i++, pci++)
> > -        libxl_create_pci_backend_device(gc, back, i, pci);
> > +    be_perms[0].id = 0;
> 
> There was a discussion [1] on PCI on ARM and one of the question was that it is possible
> 
> that we have the pci backend running in a late hardware domain/driver domain, which may
> 
> not be Domain-0. Do you think we can avoid using 0 here and get some clue of the domain
> 
> from "*backend=domain-id"? If not set it will return Domain-0's ID and won't break anything*

Not sure what you're asking for since...

> 
> *Thank you,*
> 
> *Oleksandr
> *
> 
> > +    be_perms[0].perms = XS_PERM_NONE;
> > +    be_perms[1].id = domid;
> > +    be_perms[1].perms = XS_PERM_READ;
> > +
> > +    xs_rm(ctx->xsh, t, be_path);
> > +    xs_mkdir(ctx->xsh, t, be_path);
> > +    xs_set_permissions(ctx->xsh, t, be_path, be_perms,
> > +                       ARRAY_SIZE(be_perms));
> > +    libxl__xs_writev(gc, t, be_path, libxl__xs_kvs_of_flexarray(gc, back));
> >
> > -    flexarray_append_pair(back, "num_devs", GCSPRINTF("%d", num));
> > +    flexarray_append_pair(front, "backend", be_path);
> >       flexarray_append_pair(front, "backend-id", GCSPRINTF("%d", 0));

... backend-id is written here.

  Paul



