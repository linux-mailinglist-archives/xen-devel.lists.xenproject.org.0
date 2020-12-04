Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207F02CECF1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44459.79669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl97v-0008S8-Sm; Fri, 04 Dec 2020 11:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44459.79669; Fri, 04 Dec 2020 11:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl97v-0008Rf-PA; Fri, 04 Dec 2020 11:19:51 +0000
Received: by outflank-mailman (input) for mailman id 44459;
 Fri, 04 Dec 2020 11:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IQI=FI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kl97u-0008RA-GM
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:19:50 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68152106-7c89-4179-9ecf-2ddb41de4caf;
 Fri, 04 Dec 2020 11:19:49 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x6so1010263wro.11
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:19:49 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id c129sm2878769wma.31.2020.12.04.03.19.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Dec 2020 03:19:48 -0800 (PST)
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
X-Inumbo-ID: 68152106-7c89-4179-9ecf-2ddb41de4caf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=KOlQMI9yAljOEhyD+kMhP3/tQtyLaW2yJYFmA4T5J7Y=;
        b=UCqpQbLI3VhLvmamqhwjFefLf2Jj09WzobWAtvBC+9iUMTrvftDJipkucp01LoK8+2
         aW8fBeAhxVUDZ8rgk9gD7rWENmilYaqryGJbSv0wgRIGT0jU3LHAv0YcMltrMbPzJEZK
         Z6pZNuOM6wkR5Ynnt+h5WGY9vWnvJD9IUmqUQvVwPea5VvRfdJk2AbCxdp+CbA6WKlIr
         U4oZT/F1Ee2crhMucfdT9+FQpO2R2I6kvJIqKycvLMTJ0beYyaxU5jngWm2VyrsYG7HS
         cQSRBWecuyV6Kd1mAx82Us+Gld46HO2G+VO+PYTrUDd3FYXjpOeEzR+RLcCApjqSxkwY
         prfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=KOlQMI9yAljOEhyD+kMhP3/tQtyLaW2yJYFmA4T5J7Y=;
        b=bwFB0oOEpx3CRw4YcFqTNRBVBQFfURIEJwADsxy+Jz5Yw2pi5Z+NgXCFkIfp6xrQJs
         PfcDAuCSqo+UTwPJjgsEHOh2O6CqdQ509z/bhGSPa2Zt+XevRwCmjDSXy3J+fL27N8Bz
         i4HEWH30AYUCUJvE4cUWof311TzxK9XoBOdPPjGDLYQiy7YpR50hZoe9kjf96dngpsZJ
         CS/fgjTK972WOd07AHQLDJZCDovxVOmKC9Z3pZnazffwlpMdzYbQqoNkQ8DV0PzTgXXt
         9EAr5xRZjPeJYxY/KU+Y+FGQIc7Vak4m5jShXRQAtS7vSKSl3BmIrNqJq8Ldmok17ZFb
         YU2g==
X-Gm-Message-State: AOAM533bRtWgrA2EvaektrnHR0dxWwMBBKxOuYRVslQvUHMDqAhLJ9U8
	QX38CWedtgeEFVMqWLC1Lu8=
X-Google-Smtp-Source: ABdhPJyYEuvi3cEuuUc6R5oZNzRWTL745gasqMwXRB5qm2QpQZ2rQ5rr65/cxk12JUCMLBoL9HDQ6g==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr3340552wrp.59.1607080788811;
        Fri, 04 Dec 2020 03:19:48 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>
Cc: <xen-devel@lists.xenproject.org>,
	"'Paul Durrant'" <pdurrant@amazon.com>,
	"'Oleksandr Andrushchenko'" <oleksandr_andrushchenko@epam.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20201203142534.4017-1-paul@xen.org> <20201203142534.4017-2-paul@xen.org> <20201204111326.5pxgqertdm3tk7y2@liuwe-devbox-debian-v2>
In-Reply-To: <20201204111326.5pxgqertdm3tk7y2@liuwe-devbox-debian-v2>
Subject: RE: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
Date: Fri, 4 Dec 2020 11:19:47 -0000
Message-ID: <013d01d6ca2f$605fe7e0$211fb7a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLNnXLs2pPLw4H6lzH6w2mINWFu0wFb+WecAj+9ygKn3EUpUA==

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 04 December 2020 11:13
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Oleksandr Andrushchenko
> <oleksandr_andrushchenko@epam.com>; Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Anthony
> PERARD <anthony.perard@citrix.com>
> Subject: Re: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
> 
> On Thu, Dec 03, 2020 at 02:25:12PM +0000, Paul Durrant wrote:
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
> >       keywords) that came into context have been fixed in libxl_pci.c.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > ---
> > Cc: Ian Jackson <iwj@xenproject.org>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: Anthony PERARD <anthony.perard@citrix.com>
> >
> 
> This is going to break libxl callers because the name "pcidev" is
> visible from the public header.
> 
> I agree this is confusing and inconsistent, but we didn't go extra
> length to maintain the inconsistency for no reason.
> 
> If you really want to change it, I won't stand in the way. In fact, I'm
> all for consistency. I think the flag you added should help alleviate
> the fallout.

Yes, I thought that was the idea... we can make API changes if we add a flag. I could see about adding shims to translate the names
and keep the internal code clean.

  Paul

> Also, you will need to submit patches to libvirt (the only
> user I know of) to make use of the flag and switch to the new name and
> then request such patch(es) be backported to all maintained version of
> libvirt.
> 
> See
> https://github.com/libvirt/libvirt/blob/0d05d51b715390e08cd112f83e03b6776412aaeb/src/libxl/libxl_conf.
> c#L2273
> 
> Wei.


