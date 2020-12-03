Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6702CD64A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 14:00:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43444.78100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoDP-0008V6-Pw; Thu, 03 Dec 2020 13:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43444.78100; Thu, 03 Dec 2020 13:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoDP-0008Uk-Mj; Thu, 03 Dec 2020 13:00:07 +0000
Received: by outflank-mailman (input) for mailman id 43444;
 Thu, 03 Dec 2020 13:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oiWT=FH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kkoDO-0008Qo-7Q
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 13:00:06 +0000
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 610d9eb7-e9df-4dab-8955-f7af9053dc90;
 Thu, 03 Dec 2020 13:00:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id g25so2605343wmh.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Dec 2020 05:00:05 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-145.range86-183.btcentralplus.com.
 [86.183.162.145])
 by smtp.gmail.com with ESMTPSA id g184sm1460744wma.16.2020.12.03.05.00.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 05:00:03 -0800 (PST)
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
X-Inumbo-ID: 610d9eb7-e9df-4dab-8955-f7af9053dc90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=HK6bb2uv+ttu54o7S7w4OgQnK0a3XPAMl/oW3A/nsRE=;
        b=kjp4a/jyPMFr4SbPD9bXcMk4Ti8sXK3rgMbBp3iOQa+i8KoI4LPNOdDtqU0hkOYXte
         4aMOkSrgV/T7XEGQJlo+5oY+O+BZK1Ima7gRFapfNREC7/JZSthb8Fr9wb8fvDplZln5
         eoq5tXz+zasNJEGMJLbpm90fL56LC1cHvxguXSCzk1tfKrbAYMGqKXabvnetbsx2hM/u
         DEacb3mJ3vAWBiJAOfVjL7+Yy0kmY8kGD7CnQBBOfcBa5np6av6vIhop25EaZOqpoD5O
         EM81KGGFPdVgkOwTqG8ghSxddX/HvyHa0Zs2x8qmBoHhP9+ArgJFA99hODa4lkr7XDCy
         twbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=HK6bb2uv+ttu54o7S7w4OgQnK0a3XPAMl/oW3A/nsRE=;
        b=VSzZQzU7HFNw14+EjAmwGiYUeso8D7CVlp8nbp0vascZId6u/2L1fvDA79d6gteIS3
         zEWE56FkL775B4o5Q1MKQEOaorGPiwjLOtQ3tSyH/1eHW2kr+tnLYB493DR5yJrRk36J
         Y9bmN1C7hs2BIegjPpPfWvOYc/dRjQJpTjBGLqGQyrsVEhriStv3Rl3UbBC0j3qXn3+z
         5vKFNcYu5bHvOVVDfPmcrMWRlMF6OoPZ646f0mszv/Ij+mRbOFJA+FjEocH778Jr3RKD
         sRauglISsgUwOJF76G/TtB2hu0COaCo+l4Z/tbjSHE5ZZFmmuhk+ne6PCF76QbbN9i6T
         Xaqg==
X-Gm-Message-State: AOAM5316kbrxjiZCfCfubaa0dSJ2iagnes2aQapXNDpuU4zjG1YyTslg
	Y2vd3hooII6GvClzBx7+kHw=
X-Google-Smtp-Source: ABdhPJz1UNVjq82zTQye1bkG1NZ+eBAZqTwkVABtkvMmtK6STT4YmVHcUklrc7Q1VEX+D3mz1SCb2A==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr3286668wmd.61.1607000404485;
        Thu, 03 Dec 2020 05:00:04 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Andrushchenko'" <Oleksandr_Andrushchenko@epam.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20201124080159.11912-1-paul@xen.org> <20201124080159.11912-2-paul@xen.org> <43e4db29-744e-89b6-462d-b6d129fdcb08@epam.com>
In-Reply-To: <43e4db29-744e-89b6-462d-b6d129fdcb08@epam.com>
Subject: RE: [PATCH v4 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
Date: Thu, 3 Dec 2020 13:00:03 -0000
Message-ID: <009d01d6c974$3787e310$a697a930$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQMdgDRK4dMgv8Gkq5tfso7ziJ+CnAGMb7+NAhfTW7inOsUlYA==

> -----Original Message-----
> From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
> Sent: 01 December 2020 12:33
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>;
> Anthony PERARD <anthony.perard@citrix.com>
> Subject: Re: [PATCH v4 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
> 
> Hi, Paul!
> 
> On 11/24/20 10:01 AM, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > The seemingly arbitrary use of 'pci' and 'pcidev' in the code in libxl_pci.c
> > is confusing and also compromises use of some macros used for other device
> > types. Indeed it seems that DEFINE_DEVICE_TYPE_STRUCT_X exists solely because
> > of this duality.
> >
> > This patch purges use of 'pcidev' from the libxl code, allowing evaluation of
> > DEFINE_DEVICE_TYPE_STRUCT_X to be replaced with DEFINE_DEVICE_TYPE_STRUCT,
> > hence allowing removal of the former.
> >
> > For consistency the xl and libs/util code is also modified, but in this case
> > it is purely cosmetic.
> >
> > NOTE: Some of the more gross formatting errors (such as lack of spaces after
> >        keywords) that came into context have been fixed in libxl_pci.c.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Cc: Ian Jackson <iwj@xenproject.org>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >   tools/include/libxl.h             |  17 +-
> >   tools/libs/light/libxl_create.c   |   6 +-
> >   tools/libs/light/libxl_dm.c       |  18 +-
> >   tools/libs/light/libxl_internal.h |  45 ++-
> >   tools/libs/light/libxl_pci.c      | 582 +++++++++++++++++++-------------------
> >   tools/libs/light/libxl_types.idl  |   2 +-
> >   tools/libs/util/libxlu_pci.c      |  36 +--
> >   tools/xl/xl_parse.c               |  28 +-
> >   tools/xl/xl_pci.c                 |  68 ++---
> >   tools/xl/xl_sxp.c                 |  12 +-
> >   10 files changed, 409 insertions(+), 405 deletions(-)
> >
> > diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> > index 1ea5b4f446..fbe4c81ba5 100644
> > --- a/tools/include/libxl.h
> > +++ b/tools/include/libxl.h
> > @@ -445,6 +445,13 @@
> >   #define LIBXL_HAVE_DISK_SAFE_REMOVE 1
> >
> [snip]
> > -/* Scan through /sys/.../pciback/slots looking for pcidev's BDF */
> > -static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pcidev)
> > +/* Scan through /sys/.../pciback/slots looking for pci's BDF */
> > +static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pci)
> >   {
> >       FILE *f;
> >       int rc = 0;
> > @@ -635,11 +635,11 @@ static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pcidev)
> >           return ERROR_FAIL;
> >       }
> >
> > -    while(fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func)==4) {
> > -        if(dom == pcidev->domain
> > -           && bus == pcidev->bus
> > -           && dev == pcidev->dev
> > -           && func == pcidev->func) {
> > +    while (fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func)==4) {
> So, then you can probably put spaces around "4" if touching this line

Oh yes. Will do.

> > +        if (dom == pci->domain
> > +            && bus == pci->bus
> > +            && dev == pci->dev
> > +            && func == pci->func) {
> >               rc = 1;
> >               goto out;
> >           }
> > @@ -649,7 +649,7 @@ out:
> >       return rc;
> >   }
> >
> 
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Thanks,

  Paul


