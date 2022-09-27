Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDFC5EC623
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412667.656058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBcQ-0004X1-Nn; Tue, 27 Sep 2022 14:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412667.656058; Tue, 27 Sep 2022 14:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBcQ-0004UZ-KI; Tue, 27 Sep 2022 14:31:30 +0000
Received: by outflank-mailman (input) for mailman id 412667;
 Tue, 27 Sep 2022 14:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdUW=Z6=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1odBcO-0004UQ-IS
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:31:28 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 118e6246-3e71-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 16:31:26 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id z13so21130231ejp.6
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 07:31:27 -0700 (PDT)
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
X-Inumbo-ID: 118e6246-3e71-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=USA12OvBqFFCug9e6pk0NZ0mYiTxVTCqTe5Cokwlj8Q=;
        b=DgxxJIp0Ui+06Gdr05DgPM8araftPMFAWUPfRWhpipYyc8g/mVq+jMf9JuHnWrXbwD
         Hwz2lTBs426Z+oRfum4leJiye8V/veDeoTjxrgGnfsoRmTW3Cvt8l5VlJgTPR5v21lDv
         H2oA02TuXB4oPkkaeQAKbOQcb6MC2dkAx1uBcxjxplYz/ejLhE1OY7wbSXDDnvGYVvaD
         yRHM8uwNXTdr6Irluj+yqvSqLsmZHJtJj8UXSyOtaWGXzYwC57XrzqQtwbFRYzCIKe28
         fkolafbXId6dBTs/vq9Jfz6AUguKJ/ota+IrkvlGV+NvjEw0yGeFB9i4wESoc+YKoQ0B
         PL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=USA12OvBqFFCug9e6pk0NZ0mYiTxVTCqTe5Cokwlj8Q=;
        b=Xs11C2vjf6Whw3GwzHNu+RJKTHf3uJnu2cPH5RDY4XujuJjltGUHdabZrzQLC6mrAi
         fbw6Qq3H5/qpFUSFdXnj2ngM+q+qP0BeV7AgLzgAAloPW0/gI9yMX708AXH1KjpET4pn
         d/e3l57Kc3VzkF+b7YApjqA4Mv+V2wzHOexH8FjkFAHu5LjR2BLRkEPXSUdpbdaZCfUH
         h2JtJOFIcnZlZyI0BTewnEwmdsXHgi/99TBEYX+ExDoW1xZIGW2xakOGN4Mv2QR6DPCm
         QorR0Byf93DhWaxMM5iBDtbBFpu2aaTDd9520/KV3nNYqIxgye6HHDXZre8ETwMFgxxg
         CF+A==
X-Gm-Message-State: ACrzQf3g+QiTVh1W0icM5m2zsBCx2TUGGTUHvuMRw3/4nwgREU5aktPP
	zKDDLrnGOHvMQJ6u+rLoxd86r6ptRl5AU9Ppih2ULQ==
X-Google-Smtp-Source: AMsMyM4qPsnXgcfncnTEY5XpyE/BkKuc9LmQ718moFpYzsHHdyLxV5RHv6NB+RkEdx89hBEdLidyIUBHiPds0PgWJB8=
X-Received: by 2002:a17:907:2d8e:b0:783:8d26:645 with SMTP id
 gt14-20020a1709072d8e00b007838d260645mr8466512ejc.535.1664289086480; Tue, 27
 Sep 2022 07:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-2-carlo.nonato@minervasys.tech> <1369a435-ad92-3bbd-60e4-27c1e49c1bc9@arm.com>
 <467b204a-1aed-4cd7-b401-8ff01b8d343a@suse.com>
In-Reply-To: <467b204a-1aed-4cd7-b401-8ff01b8d343a@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 27 Sep 2022 16:31:13 +0200
Message-ID: <CAG+AhRVAmsFF5DOjAKkv8zsUn3fS+FqHroxscocYZFv0Uca_fw@mail.gmail.com>
Subject: Re: [PATCH 01/12] xen/arm: add cache coloring initialization
To: Jan Beulich <jbeulich@suse.com>, Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Jan, Wei

On Mon, Sep 26, 2022 at 9:42 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 26.09.2022 08:20, Wei Chen wrote:
> > On 2022/8/26 20:51, Carlo Nonato wrote:
> >> --- a/xen/arch/arm/Kconfig
> >> +++ b/xen/arch/arm/Kconfig
> >> @@ -131,6 +131,22 @@ config ARM64_BTI
> >>        Branch Target Identification support.
> >>        This feature is not supported in Xen.
> >>
> >> +config CACHE_COLORING
> >> +    bool "Last Level Cache (LLC) coloring" if EXPERT
> >> +    default n
>
> No need for this line, btw.
>
> >> +    depends on ARM_64
> >> +
> >> +config MAX_CACHE_COLORS
> >> +    int "Maximum number of cache colors"
> >> +    default 128
> >> +    range 0 65536
> >
> > Just curious. Why select 128 as default vaule here? Is it a classic
> > implmenntation for Arm64 cache? And the same question for the upper
> > bound 65536.
>
> Going beyond that: What is the meaning of the user picking 0 here?
> And isn't 1 merely mapping to the allocator we have, i.e. the
> CACHE_COLORING=n case? IOW shouldn't the lowe bound of the range
> be (at least) 2?

To answer both: I used "range" for two reasons:
 - to forbid negative numbers.
 - struct xen_arch_domainconfig can't be modified freely since it must
   respect some static build assertions on its size, which means that
   I'm bound to uint16_t for the "num_colors" field (see patch #2).
   Also, looking again at this, the range should end at 65535.
0 and 1 maximum colors aren't really meaningful as Jan said.
65536 is just a "big enough" number that shouldn't be possible to ever
reach (it corresponds, in "common conditions", to 4 GiB of cache. See docs or
below for the formula).
128 is also a high value since using 4 KiB pages and 16-ways cache,
it implies a 128 * 4 KiB * 16 = 8 MiB Last Level Cache.
Remember that this isn't the actual number of colors of the platform. It just
needs to be >= the actual value (which is computed from the probed LLC way
size or the command line provided one).

> Jan

Thanks.

- Carlo Nonato

