Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9063525E32A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 23:05:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEIs0-0002my-N3; Fri, 04 Sep 2020 21:03:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wJ5a=CN=gmail.com=s.temerkhanov@srs-us1.protection.inumbo.net>)
 id 1kEIry-0002mt-TL
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 21:03:38 +0000
X-Inumbo-ID: 16ad3ccb-b641-4887-8b38-e8c7531eed5f
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16ad3ccb-b641-4887-8b38-e8c7531eed5f;
 Fri, 04 Sep 2020 21:03:38 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id gr14so9213963ejb.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2020 14:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q38W1EMQkfaoJgnkjBu46lmijfgtNpmtpFoSIws/OEo=;
 b=mEtltG2T9wQHB8At2DlqCVQbhfRpZx1uXovl89TbskP1IrTJLZfWyV9UT7s6MZpM1H
 mdSmyDAAcJYbDgdVh0QYZb1Mm7OgVZ0DwRzinINJ7syZlEjn6Rz53mLekW0BOyY/Aw0z
 SqYgokyOmZTGu6MLxwHL1R/aVXmhA+ZGqapbhw7TQefNrp/febFfs3Kt8tH+AAb8WfTi
 F3dNBFk7yL/OVfxtmubC9zeOwzE9zVuSNe4HB0lX4zVRiS3xv0h2XvhSZhxBE0j9V0/M
 LoYZl0npk95v+TmJde8zYiY9BaXbWcrvKqIp0xAmSjNaQjQedh6pt1RrdvMEI0Px4lZh
 pz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q38W1EMQkfaoJgnkjBu46lmijfgtNpmtpFoSIws/OEo=;
 b=JT4t35adPRsCFJUJG+PAMpyBY//DMp5yQ0+E7DGsiUEZBfo66dMzOCsChWTWzcJEnL
 hzJU/Ice81PyqWnXuIPgaHsdyiKI672QbP/kN8wY+yuLczZS1wO3l54cldV6YVOI6739
 /nmLUjxMScvH7kCjbAVP3MIY2WKTCWhCBM+V5yh1ONRqF8Sjr9g+YTew62nBix21bxxn
 ivbVhRZ4SHX83I9E9AO4F0ss1tLkLvaah+anKxqleHPKkiJkAD6tvRQCHYMIw5L9waA9
 iG7bQWOPgdU3zcyib0kxAtiYjxrBjysJ9efGbhFPvIosKpePkVzRDrFKAVHK7KSkDmor
 vP9A==
X-Gm-Message-State: AOAM531dELfssUYT7oiM8NE2YP18B0X0w+FnRReWZaEnYMX9bwNVCENA
 rrpx4p31WFc2T9Av+XQXiWe1CK74fYQ5jHODHsk=
X-Google-Smtp-Source: ABdhPJzqtNq7l96EmMmMNrpG/JlXY7CWbNWCQslOyiE6yMoSxh7M4PWraiNUi4k+s883yuRtlhMQvWKEl/EAhAWzh8U=
X-Received: by 2002:a17:906:2dc1:: with SMTP id
 h1mr625527eji.436.1599253417140; 
 Fri, 04 Sep 2020 14:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200903232458.16551-1-s.temerkhanov@gmail.com>
 <98c44a05-00c8-948f-e3a9-e64d468dd36d@suse.com>
In-Reply-To: <98c44a05-00c8-948f-e3a9-e64d468dd36d@suse.com>
From: Sergei Temerkhanov <s.temerkhanov@gmail.com>
Date: Sat, 5 Sep 2020 00:03:25 +0300
Message-ID: <CAPEA6db-gNWhMU=Ex4OLFEB0HcFAy5GFs6Cjc6a4wupEpBReKw@mail.gmail.com>
Subject: Re: [PATCH] efi: Always map EfiRuntimeServicesCode and
 EfiRuntimeServicesData
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Sep 4, 2020 at 12:47 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 04.09.2020 01:24, Sergey Temerkhanov wrote:
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -1521,7 +1521,9 @@ void __init efi_init_memory(void)
>
> Looking at the line numbers - is this patch against the master
> or staging branch? I ask because about as far away from the line
> number above as the chunk of cose you mean to change there's a
> very similar conditional, which has caused some slight confusion
> over here.

it was the latest tag, AFAIR.

>
> >          }
> >
> >          if ( !efi_enabled(EFI_RS) ||
> > -             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
> > +             ((!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
> > +                (desc->Type != EfiRuntimeServicesCode &&
> > +                 desc->Type != EfiRuntimeServicesData)) &&
> >                (!map_bs ||
> >                 (desc->Type != EfiBootServicesCode &&
> >                  desc->Type != EfiBootServicesData))) )
>
> I'm in principle okay with a workaround like this, but I don't
> think it should go silently. I'd therefore like to suggest you
> add a new if() ahead of this one and then set
> EFI_MEMORY_RUNTIME in affected descriptors (to keep things
> consistent with other consumers of the memory map without
> having to update every one of those checking for the flag)
> alongside issuing a log message.
>
> There's nevertheless another piece of code you need to adjust,
> inside a CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP conditional in
> efi_exit_boot(). But you shouldn't adjust the descriptor
> there, yet - this should happen only after its logging in
> efi_init_memory().
>
> Additionally I'd like it to be at least considered to also
> check that EFI_MEMORY_WB (or at the very least one of the
> cachability flags) is set, so that we won't run into the
> path further down complaining about a lack thereof in this
> case.

Makes sense. I'm making it set the UC for data and WP for code as the most
conservative option in such a case.


>
> Jan

