Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D074D93F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 16:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561248.877677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIs7k-0004Zz-Ff; Mon, 10 Jul 2023 14:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561248.877677; Mon, 10 Jul 2023 14:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIs7k-0004Y7-Ca; Mon, 10 Jul 2023 14:44:24 +0000
Received: by outflank-mailman (input) for mailman id 561248;
 Mon, 10 Jul 2023 14:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfHP=C4=citrix.com=prvs=5481289c3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qIs7i-00047f-Nz
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 14:44:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f8b1b0f-1f30-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 16:44:20 +0200 (CEST)
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
X-Inumbo-ID: 3f8b1b0f-1f30-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689000260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+EK84p46jC8k7/l1l8jwQdVOxR0UvOyZam0nXNphh5I=;
  b=M2T7/4a4lvQx6Aj6at2mTRM7VwtAZkyj6hM1tHpr8LY1dx/bd2Ljtjjq
   n9kEmCNuD2QiSsZudJIaTJsCW4v3zEKbZ6i8ZGMkFRItyYHP4rikzKhBW
   axEwQRUl25yhKs+hOsqogXXKHep0XNbPVtv16pkCTu4AvEiSDayopf2wa
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 115725821
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:9JmjMq25zls9majHEPbD5T9xkn2cJEfYwER7XKvMYLTBsI5bp2EEy
 TQYCGqAOq6MZGunf4p0aY+0oB4G7ZTXn9NqHgU/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNnPagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEEV82
 KNbNzQ2bxGvoM+o4+OVQ9VOmZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwIwRzF9
 jifl4j/Kg0jLfiA4yivyXC9qbaW3gn7Rb4KFbLto5aGh3XMnzdOWXX6T2CTufSlh1T4W9VOJ
 lc88zAr66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZLZcY6rsYwSXov3
 0WQgtLyLTV1tfueTnf13qiZrHW5OSUTBWYYYGkPSg5ty93+q4h1gBvJRdtnFLOdh8fwXzr3x
 liisywWl7gVy8kR2M2T/1/dhCm3joPUVQNz7QLSNkqs9g5jbZSpT5Cp41Pcq/1HKe6kokKp5
 SZe3ZLEtaZXUM/LzXbWKAkQIF23z+ehAhCDwkFrJJgg2xOA5V3yU4lswi4rcS+FLf04lS/Vj
 F774F0BtM4JYCfxMsebcKrqVZ10kPGI+cDNE6mNM4EQOsUZmBqvpnkGWKKG44z6fKHAe4kbM
 IzTT8ujBG1y5U9PnGvvHLd1PVPGK0kDKYLvqXPTlU7PPUK2PiL9dFv8GALmghoFxK2Fuh7J1
 N1UKtGHzR5SOMWnPHmHoNRMcw5QcSNnbXwTlyCwXrfTSjeK5Ul7U6OBqV/fU9ENc1tpehfgo
 SjmBx4wJKvXjnzbMwSaAk2Pm5u2NauTWUkTZHR2VX7xgihLXGpaxPtHH3fBVeV9pbMLID8dZ
 6VtRvhs9dwWEmmdp21EMMGhxGGgHTzy7T+z0+OeSGBXV/Zdq8bhp4WMktfHnMXWMheKiA==
IronPort-HdrOrdr: A9a23:wU6goKnT9y0wSUytAfgGHizvPP7pDfLc3DAbv31ZSRFFG/Fw9/
 rCoB17726StN91YhsdcL+7V5VoLUmzyXcx2/hzAV7AZniDhILLFuFfBOLZqlWNJ8S9zJ8+6U
 4JScND4bbLfD1HZKjBgTVRE7wbsaW6GKLDv5ag85+6JzsaFZ2J7G1Ce3em+lUdfnghOXKgfq
 DsnPauoVCbCA0qR/X+PFYpdc7ZqebGkZr3CCR2eiLOuGG1/EuVAKeRKWni4isj
X-Talos-CUID: =?us-ascii?q?9a23=3AhPC0mGryQ2RsdlmSzxQ6kwbmUdEBQFCCj2jUGE6?=
 =?us-ascii?q?5JUFEVp7EZ1as2rwxxg=3D=3D?=
X-Talos-MUID: 9a23:+9peAgk2z2/MCeE+e1ARdnp+Dd5M/I68InsPgLpf4oquNTFMIzaS2WE=
X-IronPort-AV: E=Sophos;i="6.01,194,1684814400"; 
   d="scan'208";a="115725821"
Date: Mon, 10 Jul 2023 15:43:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Hoyes <peter.hoyes@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, <luca.fancellu@arm.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/2] xl: Add escape character argument to xl console
Message-ID: <3c1a169b-3d3b-43e5-8f90-f8c09a5ac82d@perard>
References: <20230622141248.459133-1-peter.hoyes@arm.com>
 <20230622141248.459133-2-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230622141248.459133-2-peter.hoyes@arm.com>

On Thu, Jun 22, 2023 at 03:12:48PM +0100, Peter Hoyes wrote:
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index cac641a7eb..c513c39483 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1958,7 +1958,8 @@ int libxl_vncviewer_exec(libxl_ctx *ctx, uint32_t domid, int autopass);
>   * the caller that it has connected to the guest console.
>   */
>  int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
> -                       libxl_console_type type, int notify_fd);
> +                       libxl_console_type type, int notify_fd,
> +                       char* escape_character);

So, this is changing the libxl API, it's possible, but it's going to be
a bit more complicated than that.

You'll need to:

- Increment LIBXL_API_VERSION, well more like allow a new api version.
  That's adding 0x041800 to the list of allowed value for
  LIBXL_API_VERSION, at around line 793 in "libxl.h", just before
  "#error Unknown LIBXL_API_VERSION".

- Introduce API compatible caller for earlier API version.
  A good example of this done would be
  libxl_retrieve_domain_configuration_0x041200().
  Actually, there's already some changed been made in the past to
  libxl_console_exec() and libxl_primary_console_exec(), so those are
  probably better example and need to modified.

- Introduce LIBXL_HAVE_* macro in libxl.h to advertise the new arg.
  There's already LIBXL_HAVE_CONSOLE_NOTIFY_FD, so I guess the new macro
  could be named LIBXL_HAVE_CONSOLE_ESCAPE_CHARACTER.


>  /* libxl_primary_console_exec finds the domid and console number
>   * corresponding to the primary console of the given vm, then calls
>   * libxl_console_exec with the right arguments (domid might be different
> @@ -1968,9 +1969,12 @@ int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
>   * guests using pygrub.
>   * If notify_fd is not -1, xenconsole will write 0x00 to it to nofity
>   * the caller that it has connected to the guest console.
> + * If escape_character is not NULL, the provided value is used to exit
> + * the guest console.
>   */
>  int libxl_primary_console_exec(libxl_ctx *ctx, uint32_t domid_vm,
> -                               int notify_fd);
> +                               int notify_fd,
> +                               char* escape_character);
>  
>  #if defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x040800
>  
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> index f497be141b..0b7293fe71 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -75,15 +76,26 @@ int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
>          goto out;
>      }
>  
> +    char *args[] = {
> +        p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
> +        NULL, NULL, NULL, NULL, // start-notify-fd, escape
> +        NULL, // list terminator - do not use
> +    };
> +    char **args_extra = args + 6;
> +
>      if (notify_fd != -1) {
>          notify_fd_s = GCSPRINTF("%d", notify_fd);
> -        execl(p, p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
> -              "--start-notify-fd", notify_fd_s, (void *)NULL);
> -    } else {
> -        execl(p, p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
> -              (void *)NULL);
> +        *args_extra++ = "--start-notify-fd";
> +        *args_extra++ = notify_fd_s;
>      }
>  
> +    if (escape_character) {
> +        *args_extra++ = "--escape";
> +        *args_extra++ = escape_character;
> +    }

There is flexarray_* that could be use, but I guess a preset `*args`
kind of work here.

> +
> +    execv(p, args);
> +
>  out:
>      GC_FREE;
>      return ERROR_FAIL;
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index ccf4d83584..67604e9536 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -141,7 +141,8 @@ const struct cmd_spec cmd_table[] = {
>        "Attach to domain's console",
>        "[options] <Domain>\n"
>        "-t <type>       console type, pv , serial or vuart\n"
> -      "-n <number>     console number"
> +      "-n <number>     console number\n"
> +      "-e <escape>     escape character"

Could you also update "docs/man/xl.1.pod.in" with this new option?

Thanks,

-- 
Anthony PERARD

