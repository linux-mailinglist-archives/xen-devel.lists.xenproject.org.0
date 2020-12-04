Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9750A2CEDE6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 13:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44695.80090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klA0X-0001n1-Ro; Fri, 04 Dec 2020 12:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44695.80090; Fri, 04 Dec 2020 12:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klA0X-0001mc-OX; Fri, 04 Dec 2020 12:16:17 +0000
Received: by outflank-mailman (input) for mailman id 44695;
 Fri, 04 Dec 2020 12:16:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IQI=FI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1klA0W-0001mX-DB
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 12:16:16 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbfeecc8-8839-448b-bb13-8e61652bbe5f;
 Fri, 04 Dec 2020 12:16:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c198so5391282wmd.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 04:16:15 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id m9sm3370986wrx.59.2020.12.04.04.16.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Dec 2020 04:16:13 -0800 (PST)
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
X-Inumbo-ID: dbfeecc8-8839-448b-bb13-8e61652bbe5f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=90kwJhyHhrltbS4wA5286NKEF2pbyTs8l5EFDdu2h84=;
        b=bebDAECVO0BLk2wgoFCbNrti9o+36A6/IJRwkGRKbWuf+TMdhZwX5qpnJSLKalIgvd
         QScn2aoqXjRG0VAS6CUYBXkICAwHssY0QYw1WzHin8tH6f2hiwtfnzDgRk7xtbCrrymm
         +RQotVgMWPsX3Q5xX37KcXRiFiOVfOaW9q6d8ba4bMXz7RwLud7SLzWrtqIlGYSAFcQ7
         vFW6gvetDfDIkaHMy6dN/gaKiWzWkvztKpeVcNA0O9sd2ahegGqDWI2cfJwY0/XNi2TV
         XHZSvUdR4piCo8BH2eczjnGYjj7fPDprFHwi3AjDUfU4ke85yhU5zwDwOOqF3mh1UcH0
         TEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=90kwJhyHhrltbS4wA5286NKEF2pbyTs8l5EFDdu2h84=;
        b=KfIxteonEwnYFTnGYcup2VJ2v1WGsFDWY/VpH5190zIG/3F31LaBcwEZTdHppFaW0a
         smCBB7/cNsyf5DTyRlANNeAVlbpBp0V6u/gxp3FnKR8tSIJhAMLdqSSLPuyfGwPvDWWI
         ctsoswIT66tHoeR+wxMk58uNocjVj4vs3+nJp8nYw+nsPsztcmVfkYafXbHSwod8N/21
         qcz1oU6Rmso+4DQmtBtHqzoknzI25Pg0IdvCOOV1500qx/lv/F3LP+KlO6Alu6MgHqfP
         o7mxohEsNE1irTcZui8mEaG8o6/MRo7Wlt7GjhNfqO0Oq2qhCXQiMM1Y6Ck901yznxbq
         3ssA==
X-Gm-Message-State: AOAM530TsLv0rHNf1u1ShP4kvHM1oST7nhx/kEDh3+tlgXpT5TsIv/vp
	2NC69HSXBbEmy9eNrvHNaZg=
X-Google-Smtp-Source: ABdhPJyvTW/zZJsFGyOb+MrWg7zMIjyZjOQ7xGKDml7G7npyPLpKJlmRnS/uQCb3T+nPva6LAaieoQ==
X-Received: by 2002:a1c:9695:: with SMTP id y143mr3796419wmd.70.1607084174405;
        Fri, 04 Dec 2020 04:16:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>
Cc: <xen-devel@lists.xenproject.org>,
	"'Paul Durrant'" <pdurrant@amazon.com>,
	"'Christian Lindig'" <christian.lindig@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'David Scott'" <dave@recoil.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20201203142534.4017-1-paul@xen.org> <20201203142534.4017-20-paul@xen.org> <20201204113535.kogsoqqvfykbg32x@liuwe-devbox-debian-v2>
In-Reply-To: <20201204113535.kogsoqqvfykbg32x@liuwe-devbox-debian-v2>
Subject: RE: [PATCH v5 19/23] libxl: modify libxl_device_pci_assignable_add/remove/list/list_free()...
Date: Fri, 4 Dec 2020 12:16:12 -0000
Message-ID: <014f01d6ca37$42317d80$c6947880$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLNnXLs2pPLw4H6lzH6w2mINWFu0wLPHQcXAjbnA/Kn0QLrwA==

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 04 December 2020 11:36
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Christian Lindig
> <christian.lindig@citrix.com>; Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; David Scott
> <dave@recoil.org>; Anthony PERARD <anthony.perard@citrix.com>
> Subject: Re: [PATCH v5 19/23] libxl: modify libxl_device_pci_assignable_add/remove/list/list_free()...
> 
> On Thu, Dec 03, 2020 at 02:25:30PM +0000, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > ... to use 'libxl_pci_bdf' rather than 'libxl_device_pci'.
> >
> > This patch modifies the API and callers accordingly. It also modifies
> > several internal functions in libxl_pci.c that support the API to also use
> > 'libxl_pci_bdf'.
> >
> > NOTE: The OCaml bindings are adjusted to contain the interface change. It
> >       should therefore not affect compatibility with OCaml-based utilities.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > Acked-by: Christian Lindig <christian.lindig@citrix.com>
> 
> > ---
> > Cc: Ian Jackson <iwj@xenproject.org>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: David Scott <dave@recoil.org>
> > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  tools/include/libxl.h                |  15 +-
> >  tools/libs/light/libxl_pci.c         | 213 +++++++++++++++------------
> >  tools/ocaml/libs/xl/xenlight_stubs.c |  15 +-
> >  tools/xl/xl_pci.c                    |  32 ++--
> >  4 files changed, 156 insertions(+), 119 deletions(-)
> >
> > diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> > index 5edacccbd1da..5703fdf367c5 100644
> > --- a/tools/include/libxl.h
> > +++ b/tools/include/libxl.h
> > @@ -469,6 +469,13 @@
> >   */
> >  #define LIBXL_HAVE_PCI_BDF 1
> >
> > +/*
> > + * LIBXL_HAVE_PCI_ASSIGNABLE_BDF indicates that the
> > + * libxl_device_pci_assignable_add/remove/list/list_free() functions all
> > + * use the 'libxl_pci_bdf' type rather than 'libxl_device_pci' type.
> > + */
> > +#define LIBXL_HAVE_PCI_ASSIGNABLE_BDF 1
> > +
> >  /*
> >   * libxl ABI compatibility
> >   *
> > @@ -2378,10 +2385,10 @@ int libxl_device_events_handler(libxl_ctx *ctx,
> >   * added or is not bound, the functions will emit a warning but return
> >   * SUCCESS.
> >   */
> > -int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
> > -int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
> > -libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
> > -void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num);
> > +int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
> > +int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
> > +libxl_pci_bdf *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
> > +void libxl_device_pci_assignable_list_free(libxl_pci_bdf *list, int num);
> 
> Given these APIs are visible to external callers, you will need to
> provide fallbacks for the old APIs.
> 

Ok, I'll name the new functions something like 'libxl_pci_bdf_assignable_add/remove' etc. and provide compat shims.

  Paul

> Wei.


