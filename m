Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F858D8A5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 14:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382924.617993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLOBQ-0000HX-8o; Tue, 09 Aug 2022 12:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382924.617993; Tue, 09 Aug 2022 12:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLOBQ-0000GO-55; Tue, 09 Aug 2022 12:18:04 +0000
Received: by outflank-mailman (input) for mailman id 382924;
 Tue, 09 Aug 2022 12:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcHH=YN=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLOBO-0000FN-FS
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 12:18:02 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fe2504a-17dd-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 14:18:01 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id t1so16732105lft.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 05:18:01 -0700 (PDT)
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
X-Inumbo-ID: 4fe2504a-17dd-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f44owG/58USfu0ioppos8tVQWEx5hGkyGpdWHE6XXSs=;
        b=X8GFlzM5HBCRJkWiCA+c7d3qq+i5UTy1vGiU6h/6qyHW9pHFJjn3aRvs8cBYPBFGCR
         Y+W1k5Nf8swGaOEQRqyuI+n2zb1/YAhIhMaAeftEafsb2dI9DXcNGkeKlQnWIUYhFebQ
         w7q6ByYtC0mxSbZT5qmROSVMdBP8Tav95zZpgb5UYg3UwIcCuaqxBm7aN5aYrfbRC1lf
         BZ3s+8H1b81Tg+NgA9M5LM1HDYZoLiwhIgOdD0PN9SosrlwyQ9pNIN4r6oc7Cu4EDl1O
         Gpo6kCA0uG2qsuWL6VrkjGDdUfF/mJ4qVVFNz+7KTWfgPrp4mJc2zKqzVFce6b1ziBN0
         LtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f44owG/58USfu0ioppos8tVQWEx5hGkyGpdWHE6XXSs=;
        b=LRXxXSnKsWQQ+vM7PZxu/DEz24OO4RUJHKAbDrt4NEpf0An8ScZpp1xP68XXTEQEkk
         mAbr5kN3RAXMUSOtyryiJogj09TXA3i5FXdeYxzU4gAcu81ce4wBjzyqoJV2L0f5ci9X
         hnj8m2oeX07p89P71kJJM05O4aKs+lB3c2pg9aXstnGno/vSmHAVudu2Gm4UMyDtq1sD
         fwiY6pc0YsRUbDOq84dfnxCIHIDnsk7LkoQnPMqHbWet0sYEuwJSO2CLc5bTrXYn8Srj
         kV97BWV8WwFEY1lDtWEzvyZBfcWx9+FG/atHx+t46Bk6Py85REmqNVcIz0V5uKjGLPVH
         8g0w==
X-Gm-Message-State: ACgBeo0QF0pjh60hWH3eGq9wD+ynYfWcZaRC4O+a97p/EG1EsF8Glvcx
	GRaaoE9ftKs6qdjZIjH9qKVTPzxKzHO7+ugFmnU=
X-Google-Smtp-Source: AA6agR6g4PYLrLbc2gvrH23Lz4JLZlz6s+d7eGkYpgHI7ox7HacWOwLM/ZjWu8NaCwZMiird/lGMFznLB2nnE4OkKVA=
X-Received: by 2002:a05:6512:4016:b0:48b:1e96:af0f with SMTP id
 br22-20020a056512401600b0048b1e96af0fmr8813516lfb.359.1660047480886; Tue, 09
 Aug 2022 05:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220808110545.62886-1-anthony.perard@citrix.com> <20220808110545.62886-3-anthony.perard@citrix.com>
In-Reply-To: <20220808110545.62886-3-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Aug 2022 08:17:49 -0400
Message-ID: <CAKf6xpuyK-5-UH4JOVDHidVgE+GBsS8a947LyAOVNORQRpsfew@mail.gmail.com>
Subject: Re: [XEN PATCH 2/2] tools/libxl: Replace deprecated -soundhw on QEMU
 command line
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 8, 2022 at 7:06 AM Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> -soundhw is deprecated since 825ff02911c9 ("audio: add soundhw
> deprecation notice"), QEMU v5.1, and is been remove for upcoming v7.1
> by 039a68373c45 ("introduce -audio as a replacement for -soundhw").
>
> Instead we can just add the sound card with "-device", for most option
> that "-soundhw" could handle. "-device" is an option that existed
> before QEMU 1.0, and could already be used to add audio hardware.
>
> The list of possible option for libxl's "soundhw" is taken the list
> from QEMU 7.0.
>
> The list of options for "soundhw" are listed in order of preference in
> the manual. The first three (hda, ac97, es1370) are PCI devices and
> easy to test on Linux, and the last four are ISA devices which doesn't
> seems to work out of the box on linux.
>
> The sound card 'pcspk' isn't listed even if it used to be accepted by
> '-soundhw' because QEMU crash when trying to add it to a Xen domain.
> Also, it wouldn't work with "-device" might need to be "-machine
> pcspk-audiodev=default" instead.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

With one question below.

> ---
>  docs/man/xl.cfg.5.pod.in                  |  6 +++---
>  tools/libs/light/libxl_types_internal.idl | 10 ++++++++++
>  tools/libs/light/libxl_dm.c               | 19 ++++++++++++++++++-
>  3 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 6d98d73d76..b2901e04cf 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2555,9 +2555,9 @@ The form serial=DEVICE is also accepted for backwards compatibility.
>
>  =item B<soundhw="DEVICE">
>
> -Select the virtual sound card to expose to the guest. The valid
> -devices are defined by the device model configuration, please see the
> -B<qemu(1)> manpage for details. The default is not to export any sound
> +Select the virtual sound card to expose to the guest. The valid devices are
> +B<hda>, B<ac97>, B<es1370>, B<adlib>, B<cs4231a>, B<gus>, B<sb16> if there are
> +available with the device model QEMU. The default is not to export any sound
>  device.

Is it worth mentioning driver support?  I think Windows 7 and later
only have a built-in driver for hda.  Windows 7 definitely doesn't
have a built-in driver for ac97.  I think all the other devices are
even older, so I doubt Windows has drivers for those, but I have not
checked.

Regards,
Jason

