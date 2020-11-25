Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F295C2C4A60
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 23:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38113.70772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki2yu-00077d-1H; Wed, 25 Nov 2020 22:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38113.70772; Wed, 25 Nov 2020 22:09:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki2yt-000777-Sv; Wed, 25 Nov 2020 22:09:43 +0000
Received: by outflank-mailman (input) for mailman id 38113;
 Wed, 25 Nov 2020 22:09:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecWo=E7=google.com=ndesaulniers@srs-us1.protection.inumbo.net>)
 id 1ki2ys-00076s-K6
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 22:09:42 +0000
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa2d5c0f-ef6a-4794-90b8-6698eddd0c42;
 Wed, 25 Nov 2020 22:09:41 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id r2so100453pls.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 14:09:41 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ecWo=E7=google.com=ndesaulniers@srs-us1.protection.inumbo.net>)
	id 1ki2ys-00076s-K6
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 22:09:42 +0000
X-Inumbo-ID: fa2d5c0f-ef6a-4794-90b8-6698eddd0c42
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fa2d5c0f-ef6a-4794-90b8-6698eddd0c42;
	Wed, 25 Nov 2020 22:09:41 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id r2so100453pls.3
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 14:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/ob3FEJdYP5qhdHPeLajEb6PUDm9frxLF1mdXzRdH3M=;
        b=L3KZpP3LXxZlW/DP5AmTnD4MuZ72/rcy+coOeUVeCNTiwrWtzoVQx/hBMoKUsqDMm0
         Foet9vcyJsJZ2PSgueU+Q+MvDj0KUWyeWX5guwBWRMdbnXZ08cX56htqXhsZrxHUuRIn
         vYFnIpmbgrasg1vSD5AH5hKwOy9NejMhVovtjBrzY+2P0ug3w3+5RlYsOk03C83VD9da
         OdGtf9c6uotPHdYcmuyOqbnF5k3fP8Yo6l5eFDVR7n6m5okfFX1oHlXNOB3u6UsnrVGE
         wa6MluYkHn1XOYZTDyrE2KQmcun7Qe6vVmhaYurLDnZVMQG/lFJsGakXcuEY3+Obie2U
         RVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/ob3FEJdYP5qhdHPeLajEb6PUDm9frxLF1mdXzRdH3M=;
        b=UKipMwaIe/pjioSe4V59qK5xjkQU0HXX2JWVNV2htspMvNhDbi/9yTa2aRK1hWmk+6
         NAdC6dQF5H5Rb3iCUb5FCUgYU5BsX4+Hupi+f4N6y8O4jxEXBih0zyl5PtzZ+iCVpgjR
         n/hljEYH8i8jHkzx37oLeWb46pmdP8Lt7U4lrhw8GDQZY762kh45vy0X4sKy+YbZDzpR
         s8/tApAZWGXnZZQMe5nwTMJXK2Y4+Kv55VyN0g2Au+uibIWOMSP8+T5T/fwppWa37V+O
         JhOy48E/VphHthkRXc1cyV70Jceruvwr78yulqucTmNjcdZzc/hZUVY0TJ+2Q8ZIRAo5
         DAcQ==
X-Gm-Message-State: AOAM532WjwJI2GA5EC/D7HJjzSfwMoj+AFaf4w2PuThIpqux/a59WIsk
	rdJXmItwFvC5zTbKi/gQVAsU2j9/O1ixs7v7BuHlZw==
X-Google-Smtp-Source: ABdhPJz8lLt/1COGEMpWkFDfyIK6h7HwbxIAa+xtHaAqLUfnjsVh22wexUgkVgdtXLczfRnuDI51yr8PXCWqKuZKul4=
X-Received: by 2002:a17:902:c14a:b029:d8:dc05:d7ef with SMTP id
 10-20020a170902c14ab02900d8dc05d7efmr4885886plj.83.1606342180784; Wed, 25 Nov
 2020 14:09:40 -0800 (PST)
MIME-Version: 1.0
References: <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor> <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
 <202011241327.BB28F12F6@keescook> <a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
 <CAKwvOdkGBn7nuWTAqrORMeN1G+w3YwBfCqqaRD2nwvoAXKi=Aw@mail.gmail.com> <alpine.LNX.2.23.453.2011260750300.6@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2011260750300.6@nippy.intranet>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Nov 2020 14:09:29 -0800
Message-ID: <CAKwvOdna5Zj_O=sB7Q0jHZX0BJSaakX=ZyftwQ_3=L3-ZB54XQ@mail.gmail.com>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for Clang
To: Finn Thain <fthain@telegraphics.com.au>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Joe Perches <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>, alsa-devel@alsa-project.org, 
	linux-atm-general@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org, 
	linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com, 
	wcn36xx@lists.infradead.org, samba-technical@lists.samba.org, 
	linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net, 
	linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net, 
	drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org, 
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com, 
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, 
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org, 
	linux-security-module@vger.kernel.org, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-stm32@st-md-mailman.stormreply.com, 
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org, coreteam@netfilter.org, 
	intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net, 
	linux-ext4@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, selinux@vger.kernel.org, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, intel-gfx@lists.freedesktop.org, 
	linux-geode@lists.infradead.org, linux-can@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org, 
	xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org, 
	linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>, 
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com, 
	linux-integrity@vger.kernel.org, target-devel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 1:33 PM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> Or do you think that a codebase can somehow satisfy multiple checkers and
> their divergent interpretations of the language spec?

Have we found any cases yet that are divergent? I don't think so.  It
sounds to me like GCC's cases it warns for is a subset of Clang's.
Having additional coverage with Clang then should ensure coverage for
both.

> > This is not a shiny new warning; it's already on for GCC and has existed
> > in both compilers for multiple releases.
> >
>
> Perhaps you're referring to the compiler feature that lead to the
> ill-fated, tree-wide /* fallthrough */ patch series.
>
> When the ink dries on the C23 language spec and the implementations figure
> out how to interpret it then sure, enforce the warning for new code -- the
> cost/benefit analysis is straight forward. However, the case for patching
> existing mature code is another story.

I don't think we need to wait for the ink to dry on the C23 language
spec to understand that implicit fallthrough is an obvious defect of
the C language.  While the kernel is a mature codebase, it's not
immune to bugs.  And its maturity has yet to slow its rapid pace of
development.
-- 
Thanks,
~Nick Desaulniers

