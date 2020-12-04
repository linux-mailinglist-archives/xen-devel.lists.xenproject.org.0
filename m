Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B722CECFC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:23:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44496.79729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9BX-0001cM-KQ; Fri, 04 Dec 2020 11:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44496.79729; Fri, 04 Dec 2020 11:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9BX-0001bw-Gy; Fri, 04 Dec 2020 11:23:35 +0000
Received: by outflank-mailman (input) for mailman id 44496;
 Fri, 04 Dec 2020 11:23:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IQI=FI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kl9BW-0001an-39
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:23:34 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d202927-992a-4633-b18a-f49904518993;
 Fri, 04 Dec 2020 11:23:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s8so4955346wrw.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:23:30 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id d191sm2084311wmd.24.2020.12.04.03.23.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Dec 2020 03:23:29 -0800 (PST)
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
X-Inumbo-ID: 0d202927-992a-4633-b18a-f49904518993
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=+bsmCiRUqBszY6GII2Goi0WykGJvS1wDctdpsN73wdk=;
        b=lw2IuKlT699PrS58j5TPqQp5TD9DIEfCeXswImk36Xm0zia0IHJPC5GapO26PeNy2+
         7z9r5eePIWpnjeXINN9MMWiAf5hCWz++vpnaxK3lwWojZR/5SMiDGttBgLOkgrz7Nlga
         IDdNSeWtjnMZINPjuam6bj+hEhwBUJNBswNFRmhR6twg6XT7eJ2osi6kCZSa8KQX9Hzl
         wyCvQsPPugQhpKsdTXq9vu7mv85Lb82Ag4DsznHOtpaz8Y/CcHi8oZKOuTSD05OtBCi9
         z6ZVcGPsp2881Q5lnDZWZSMVW8lErg/10f5Fik4JDGHvnW6yunjiy27ryym4sqZfY/25
         mSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=+bsmCiRUqBszY6GII2Goi0WykGJvS1wDctdpsN73wdk=;
        b=NDa6RR2wox7J0Kc4t0DASd74mWONdMy+ZlsYJeA8CnLqV+hqvhSjndoxYw49qzXbFY
         IitSLh4CBPGZW8clHx6x5rBXzZ9Jgsi7lcVx08nLUxqixc6FdmxhnORWG0uX5qnIPpO9
         2NgS5Ll/jKZaACmb6VfSqRiyVPJ8tqPCg8EBs2b3IdEDrX+i+XcX4QPmUX4fIywqiYk8
         DkawN/CAPXmEJYqrYFx6bezPfk79CI4Vj+H6JiX0v1umIgzL+yuBTWJ0DZhdvA8FExBA
         IbyB+omN4RSbwXN9DudB0lIoZPv4NHi2QTc75NvdenNM7VtO9P/1c56PmzJZqi6jI50m
         CX8Q==
X-Gm-Message-State: AOAM532c14AkQB8gCCqGIVb1GDOBDJK+uDZ/T96G6+dN42TkpixCCYwB
	dVxhjfVbWiAQ0FRR8Hao1N0=
X-Google-Smtp-Source: ABdhPJzBH9pBNAWMR2Q0bO5UJQYvQXuUaJSGufDVoOHvqtzxecm6dpQWLxWwaDeccedmPdDyZHB0hg==
X-Received: by 2002:adf:ba91:: with SMTP id p17mr4396625wrg.328.1607081009796;
        Fri, 04 Dec 2020 03:23:29 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>
Cc: <xen-devel@lists.xenproject.org>,
	"'Paul Durrant'" <pdurrant@amazon.com>,
	"'Oleksandr Andrushchenko'" <oleksandr_andrushchenko@epam.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20201203142534.4017-1-paul@xen.org> <20201203142534.4017-2-paul@xen.org> <20201204111326.5pxgqertdm3tk7y2@liuwe-devbox-debian-v2> <013d01d6ca2f$605fe7e0$211fb7a0$@xen.org> <20201204112141.wdwb54brb23x2bgs@liuwe-devbox-debian-v2>
In-Reply-To: <20201204112141.wdwb54brb23x2bgs@liuwe-devbox-debian-v2>
Subject: RE: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
Date: Fri, 4 Dec 2020 11:23:28 -0000
Message-ID: <014701d6ca2f$e414f260$ac3ed720$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLNnXLs2pPLw4H6lzH6w2mINWFu0wFb+WecAj+9ygIB0uemdAExrIbdp8QiUiA=

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 04 December 2020 11:22
> To: paul@xen.org
> Cc: 'Wei Liu' <wl@xen.org>; xen-devel@lists.xenproject.org; 'Paul Durrant' <pdurrant@amazon.com>;
> 'Oleksandr Andrushchenko' <oleksandr_andrushchenko@epam.com>; 'Ian Jackson' <iwj@xenproject.org>;
> 'Anthony PERARD' <anthony.perard@citrix.com>
> Subject: Re: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
> 
> On Fri, Dec 04, 2020 at 11:19:47AM -0000, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Wei Liu <wl@xen.org>
> > > Sent: 04 December 2020 11:13
> > > To: Paul Durrant <paul@xen.org>
> > > Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Oleksandr Andrushchenko
> > > <oleksandr_andrushchenko@epam.com>; Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>;
> Anthony
> > > PERARD <anthony.perard@citrix.com>
> > > Subject: Re: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
> > >
> > > On Thu, Dec 03, 2020 at 02:25:12PM +0000, Paul Durrant wrote:
> > > > From: Paul Durrant <pdurrant@amazon.com>
> > > >
> > > > The seemingly arbitrary use of 'pci' and 'pcidev' in the code in libxl_pci.c
> > > > is confusing and also compromises use of some macros used for other device
> > > > types. Indeed it seems that DEFINE_DEVICE_TYPE_STRUCT_X exists solely because
> > > > of this duality.
> > > >
> > > > This patch purges use of 'pcidev' from the libxl code, allowing evaluation of
> > > > DEFINE_DEVICE_TYPE_STRUCT_X to be replaced with DEFINE_DEVICE_TYPE_STRUCT,
> > > > hence allowing removal of the former.
> > > >
> > > > For consistency the xl and libs/util code is also modified, but in this case
> > > > it is purely cosmetic.
> > > >
> > > > NOTE: Some of the more gross formatting errors (such as lack of spaces after
> > > >       keywords) that came into context have been fixed in libxl_pci.c.
> > > >
> > > > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > > > Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > > ---
> > > > Cc: Ian Jackson <iwj@xenproject.org>
> > > > Cc: Wei Liu <wl@xen.org>
> > > > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > > >
> > >
> > > This is going to break libxl callers because the name "pcidev" is
> > > visible from the public header.
> > >
> > > I agree this is confusing and inconsistent, but we didn't go extra
> > > length to maintain the inconsistency for no reason.
> > >
> > > If you really want to change it, I won't stand in the way. In fact, I'm
> > > all for consistency. I think the flag you added should help alleviate
> > > the fallout.
> >
> > Yes, I thought that was the idea... we can make API changes if we add a flag. I could see about
> adding shims to translate the names
> > and keep the internal code clean.
> 
> Yes if you can add some internal shims to handle it that would be
> great. Otherwise you will need to at least fix libvirt.
> 

I think shims are safest. We don't know what other callers are lurking out there :-)

  Paul

> Wei.


