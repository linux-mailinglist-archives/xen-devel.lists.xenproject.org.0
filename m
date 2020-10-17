Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD529148C
	for <lists+xen-devel@lfdr.de>; Sat, 17 Oct 2020 23:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8447.22549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTtKb-0001eu-PU; Sat, 17 Oct 2020 21:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8447.22549; Sat, 17 Oct 2020 21:01:37 +0000
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
	id 1kTtKb-0001eV-M3; Sat, 17 Oct 2020 21:01:37 +0000
Received: by outflank-mailman (input) for mailman id 8447;
 Sat, 17 Oct 2020 21:01:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rRtA=DY=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1kTtKZ-0001eQ-NI
 for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 21:01:35 +0000
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d02a1d5c-c263-42ef-8b87-7eb3d2b7d314;
 Sat, 17 Oct 2020 21:01:33 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id u8so8477731ejg.1
 for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2020 14:01:33 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rRtA=DY=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
	id 1kTtKZ-0001eQ-NI
	for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 21:01:35 +0000
X-Inumbo-ID: d02a1d5c-c263-42ef-8b87-7eb3d2b7d314
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d02a1d5c-c263-42ef-8b87-7eb3d2b7d314;
	Sat, 17 Oct 2020 21:01:33 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id u8so8477731ejg.1
        for <xen-devel@lists.xenproject.org>; Sat, 17 Oct 2020 14:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QU5tUnKrk3cCgEOM6DUuSpHohPcIoidzngrqxPrVqlg=;
        b=ntIAxdfj5B3UZZJPAO3W3zqpuYJdxZe6wmMN+Cg5+tfh5QjsxLbXR5o2amfdJQ2J48
         +r9G2vZiMs4S/e6t6kNU+/1RisTXP2Yspklt8lksB4PhSQjsUISEYusYJeN2p0XCHoqr
         5tX/QI+fZe3GQZJaviemAIYQlGxoIFC7s6aX8R5MJQLi2SOYJ/keQbrc62HNUeJ8pCOI
         7WYztP0OE4axPIRoGDfVK4aq4k9dPY6fZ69Y4fL3/a70qb0GrKtNhloBSbp9yIhwtpgg
         UECkhdkcAFyI2jUc3qFZfU7NKoc+E1dZJHZxhONiRQFFV//aVnbaYjp+hfJUaNjfh3TU
         ik3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QU5tUnKrk3cCgEOM6DUuSpHohPcIoidzngrqxPrVqlg=;
        b=rT86GXSUsxfh1pr6NlHLn8v6XgHFMM5qGu+OdI+evgFmAwMhH2s0DMe0XHdAQ+0zX7
         rD/ssDWR1dnytd+h4szF1yCsBZEBHTCUBSCfZBlVkW4mWjHBvdhV62YHfpDdv19KnyBn
         xiFkGrXZF5xJFCbr3kpqMhK9jvn9JUa8NQFkONeAf656KHj2OdSOM1lgu/2Fymtcfuhp
         XG/t9dmz6pgIjQbk9Mh3MZ8hn0BQXXhLS5i/EfQZPkq0x35glTNLny78g0qinPi/oPHZ
         24Bs2BemZJcGbP9KOzpHGnZSLBPh5kIuA/gN2hJiF9qTWoR2b1lotxi7tzKg1XN4b+qB
         8MYw==
X-Gm-Message-State: AOAM530MAD5qV/GwN4G7q9BXbEpjAauZgzSewdFJXOqT3GwRVQPghr9I
	/gE3dzd3E/t2CyhP7DVQpz9IQ7d+VkdGPCX2nF8OSw==
X-Google-Smtp-Source: ABdhPJzde2s6j/g/ekBLPPrgSH2EJqfd3KSDRuhe3Mnzr9w98lVRa6HniOngGCyhNuV4q/eDk1HFvyy/v8IqyEanGTA=
X-Received: by 2002:a17:906:1a19:: with SMTP id i25mr9957370ejf.323.1602968492144;
 Sat, 17 Oct 2020 14:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201017160928.12698-1-trix@redhat.com>
In-Reply-To: <20201017160928.12698-1-trix@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 17 Oct 2020 14:01:22 -0700
Message-ID: <CAPcyv4jkSFxMXgMABX7sDbwmq8zJO=rLX2ww3Y9Tc0VAANY8xQ@mail.gmail.com>
Subject: Re: [RFC] treewide: cleanup unreachable breaks
To: trix@redhat.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org, 
	Linux ACPI <linux-acpi@vger.kernel.org>, 
	Linux-pm mailing list <linux-pm@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	linux-block@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	linux-crypto <linux-crypto@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-power@fi.rohmeurope.com, 
	linux-gpio@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	industrypack-devel@lists.sourceforge.net, 
	"Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, MPT-FusionLinux.pdl@broadcom.com, 
	linux-scsi <linux-scsi@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	linux-can@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	intel-wired-lan@lists.osuosl.org, ath10k@lists.infradead.org, 
	Linux Wireless List <linux-wireless@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-nfc@lists.01.org, linux-nvdimm <linux-nvdimm@lists.01.org>, 
	Linux PCI <linux-pci@vger.kernel.org>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	patches@opensource.cirrus.com, storagedev@microchip.com, 
	devel@driverdev.osuosl.org, linux-serial@vger.kernel.org, 
	USB list <linux-usb@vger.kernel.org>, usb-storage@lists.one-eyed-alien.net, 
	linux-watchdog@vger.kernel.org, ocfs2-devel@oss.oracle.com, 
	bpf@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, 
	"open list:KEYS-TRUSTED" <keyrings@vger.kernel.org>, alsa-devel@alsa-project.org, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 17, 2020 at 9:10 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> This is a upcoming change to clean up a new warning treewide.
> I am wondering if the change could be one mega patch (see below) or
> normal patch per file about 100 patches or somewhere half way by collecting
> early acks.
>
> clang has a number of useful, new warnings see
> https://clang.llvm.org/docs/DiagnosticsReference.html
>
> This change cleans up -Wunreachable-code-break
> https://clang.llvm.org/docs/DiagnosticsReference.html#wunreachable-code-break
> for 266 of 485 warnings in this week's linux-next, allyesconfig on x86_64.
>
> The method of fixing was to look for warnings where the preceding statement
> was a simple statement and by inspection made the subsequent break unneeded.
> In order of frequency these look like
>
> return and break
>
>         switch (c->x86_vendor) {
>         case X86_VENDOR_INTEL:
>                 intel_p5_mcheck_init(c);
>                 return 1;
> -               break;
>
> goto and break
>
>         default:
>                 operation = 0; /* make gcc happy */
>                 goto fail_response;
> -               break;
>
> break and break
>                 case COLOR_SPACE_SRGB:
>                         /* by pass */
>                         REG_SET(OUTPUT_CSC_CONTROL, 0,
>                                 OUTPUT_CSC_GRPH_MODE, 0);
>                         break;
> -                       break;
>
> The exception to the simple statement, is a switch case with a block
> and the end of block is a return
>
>                         struct obj_buffer *buff = r->ptr;
>                         return scnprintf(str, PRIV_STR_SIZE,
>                                         "size=%u\naddr=0x%X\n", buff->size,
>                                         buff->addr);
>                 }
> -               break;
>
> Not considered obvious and excluded, breaks after
> multi level switches
> complicated if-else if-else blocks
> panic() or similar calls
>
> And there is an odd addition of a 'fallthrough' in drivers/tty/nozomi.c
[..]
> diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
> index 5a7c80053c62..2f250874b1a4 100644
> --- a/drivers/nvdimm/claim.c
> +++ b/drivers/nvdimm/claim.c
> @@ -200,11 +200,10 @@ ssize_t nd_namespace_store(struct device *dev,
>                 }
>                 break;
>         default:
>                 len = -EBUSY;
>                 goto out_attach;
> -               break;
>         }

Acked-by: Dan Williams <dan.j.williams@intel.com>

