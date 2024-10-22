Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D709B9AB089
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 16:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824217.1238312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Fd3-0001Zu-7n; Tue, 22 Oct 2024 14:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824217.1238312; Tue, 22 Oct 2024 14:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Fd3-0001XW-4Y; Tue, 22 Oct 2024 14:12:57 +0000
Received: by outflank-mailman (input) for mailman id 824217;
 Tue, 22 Oct 2024 14:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufxd=RS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t3Fd1-0001XQ-Oi
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 14:12:55 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb06ed9a-907f-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 16:12:54 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d4c482844so3865631f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 07:12:54 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b9bcdesm6711471f8f.106.2024.10.22.07.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 07:12:53 -0700 (PDT)
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
X-Inumbo-ID: bb06ed9a-907f-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729606374; x=1730211174; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmhDB1rd+nQ69Tujh3EA5GQpXHWD9UZgjcUr5Y7UFoc=;
        b=nCIcT/vrdTxxaAQBg6Vo8X3Lim4qnOmcnxwKdRjagjkAan91/t/MBNVzlOXibzQznZ
         FS+mlRRoRulmWSx1TN/otO7xdPFjRSmZk2mCLZeh/H+ke9Rh4pzoIUs4yPb9WbDYmEpe
         /cxkVJRFawllUjv7lt7AY5PEAYn2o3OTkEDOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729606374; x=1730211174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmhDB1rd+nQ69Tujh3EA5GQpXHWD9UZgjcUr5Y7UFoc=;
        b=wYTCWgWf9hu8j5v06NZrY2ZVIgJ4keXnHudNkouUMWrPzxyUdUYcMrRoKrsJ58PzIk
         AJvZ6qE1WR3PYPZ6VshkdD6gL2L/gJ+0CrhxGUw+wyGzGzCGDtdjxCd6fs2byek06Zhw
         h3NWKaQPQhtvh/7gvYwPGveXMLe1zitAutVOhkuBMTkYjYmvL/ZOv1qP/KeXDs+DZNHi
         Xn0uXTlJOOg2QCzt56AVUMucSF50rYhdYBbQvcGXZ04ew7+WOuVH82vKdW9a+oXFM25q
         PjImRwkeRy9OciFh8bsUjsWMPEXDjNFwsPYEom9LZf9j/rvJ6b0/LHRCPEvisbt5JIQt
         +6xQ==
X-Gm-Message-State: AOJu0Yy/6KRSY6MbjLx3kfZAWw15PuP8g8h3/7la+bE4LaRnhaA3QO9Z
	rNs4NaZ9oHSoPzarVP4qoHSUtuPt2rgzm8ia84gu0TOPaerQ2AL+oX7cqQqUg8A2SfkY7EWgNXq
	G
X-Google-Smtp-Source: AGHT+IGnnj3M9teaY0emEnWAe0gyajA3/L+Jtf5pe8exTvSOKTEBhj1nELqvJ/EW+ZUmZF8yN9Sv3g==
X-Received: by 2002:a5d:6304:0:b0:37c:d558:a931 with SMTP id ffacd0b85a97d-37eb489482emr9950572f8f.31.1729606373935;
        Tue, 22 Oct 2024 07:12:53 -0700 (PDT)
Date: Tue, 22 Oct 2024 16:12:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/boot: Fix PVH boot during boot_info transition period
Message-ID: <Zxey5Gap8p8SiH9w@macbook.local>
References: <20241022124114.84498-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241022124114.84498-1-andrew.cooper3@citrix.com>

On Tue, Oct 22, 2024 at 01:41:14PM +0100, Andrew Cooper wrote:
> multiboot_fill_boot_info() taking the physical address of the multiboot_info
> structure leads to a subtle use-after-free on the PVH path, with rather less
> subtle fallout.
> 
> The pointers used by __start_xen(), mbi and mod, are either:
> 
>  - MB:  Directmap pointers into the trampoline, or
>  - PVH: Xen pointers into .initdata, or
>  - EFI: Directmap pointers into Xen.
> 
> Critically, these either remain valid across move_xen() (MB, PVH), or rely on
> move_xen() being inhibited (EFI).
> 
> The conversion to multiboot_fill_boot_info(), taking only mbi_p, makes the PVH
> path use directmap pointers into Xen, as well as move_xen() which invalidates
> said pointers.
> 
> Switch multiboot_fill_boot_info() to consume the same virtual addresses that
> __start_xen() currently uses.  This keeps all the pointers valid for the
> duration of __start_xen(), for all boot protocols.
> 
> It can be safely untangled once multiboot_fill_boot_info() takes a full copy
> the multiboot info data, and __start_xen() has been moved over to using the
> new boot_info consistently.
> 
> Right now, bi->{loader,cmdline,mods} are problematic.  Nothing uses
> bi->mods[], and nothing uses bi->cmdline after move_xen().
> 
> bi->loader is used after move_xen(), although only for cmdline_cook() of
> dom0's cmdline, where it happens to be benign because PVH boot skips the
> inspection of the bootloader name.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One nit below about dropping a const keyword.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> This is more proof that Xen only boots by accident.  It certainly isn't by any
> kind of design.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1506947472
> including the pending work to add a PVShim test
> 
> This is the least-invasive fix given the rest of the Hyperlaunch series.
> 
> A different option would to introduce EFI and PVH forms of
> multiboot_fill_boot_info(), but that would involve juggling even more moving
> parts during the transition period.
> ---
>  xen/arch/x86/setup.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index db670258d650..e43b56d4e80f 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -283,11 +283,10 @@ struct boot_info __initdata xen_boot_info = {
>      .cmdline = "",
>  };
>  
> -static struct boot_info *__init multiboot_fill_boot_info(unsigned long mbi_p)
> +static struct boot_info *__init multiboot_fill_boot_info(
> +    multiboot_info_t *mbi, module_t *mods)

Shouldn't mbi keep the const keyword?  Given there are no changes on
how it's used in multiboot_fill_boot_info().

Thanks, Roger.

