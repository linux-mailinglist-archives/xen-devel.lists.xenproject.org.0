Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0F80F170
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653237.1019667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4xz-0000tk-5o; Tue, 12 Dec 2023 15:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653237.1019667; Tue, 12 Dec 2023 15:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4xz-0000rd-2W; Tue, 12 Dec 2023 15:46:39 +0000
Received: by outflank-mailman (input) for mailman id 653237;
 Tue, 12 Dec 2023 15:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Qa1=HX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rD4xy-0000rX-30
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:46:38 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2027452-9905-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 16:46:37 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c41b43e1eso32515895e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 07:46:36 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j6-20020adfe506000000b0033339e03a60sm11123474wrm.59.2023.12.12.07.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 07:46:36 -0800 (PST)
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
X-Inumbo-ID: a2027452-9905-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702395996; x=1703000796; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+OemhjYOdKfIJ0/gpK1EfT3NR+zGX/WOIYWuBnon+Q0=;
        b=qkAb29XJoA7g9+SWRSrzG62Hs5L9Sfu3hpLGyiej/tDozSClsY6R5BjAy7mn2q7qxe
         rarcSGUBoC+OVzJ4EHDuBducA+plakI/BikyrHsVx5gFpXPaCLiu/vq1eVvzfDajTU1Q
         IajDidpkqPH8Mv8LPTQOzMlv+leB8L0K8q4XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702395996; x=1703000796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OemhjYOdKfIJ0/gpK1EfT3NR+zGX/WOIYWuBnon+Q0=;
        b=rctVWz3YEEa8TbUU6LgW5WmXSUiPhq+oO433CVeJl9HaroBVkpTZqN2ZClB1crCen5
         7X7VjufH+FWMRd7AmE2i3uVWZfwtP28mf3IxK2sqqwaq6R+TA6AGBeWVJ2raEycU7huZ
         10NEuhmsM/j/zpm41KYNWyfS1m13sTNaIEnZKeg8GLyT7JIDy6S1wHpiQS6UtfVTQhxE
         W9bebH6GJ6FW8rXUxc7th6yXgUCkGdgIQ2Wsj/TPJhGAurDAHMZHt7DdHYRRAVu3VeHC
         lEGP+gDsQCzpqY5RBANMwuhNgHBUa1nqwQh4HeVldypqmxn0WtZSsyeaotBTO0t1lBjI
         ZhCw==
X-Gm-Message-State: AOJu0YzabvQAuL/vRX6gyc2lO/pLqD8YjdczqKILbomAgN7DypttypPX
	0yp6e2T972seoErHwsa4KQ30wg==
X-Google-Smtp-Source: AGHT+IHFJf03PzPkPzri93AhUKK+6y6rmzVHTxe8snweg8/A/E89NVAc6nL29hqbLwBh9xoltAF5lw==
X-Received: by 2002:a05:600c:240d:b0:40c:34cd:1fe3 with SMTP id 13-20020a05600c240d00b0040c34cd1fe3mr3102920wmp.83.1702395996279;
        Tue, 12 Dec 2023 07:46:36 -0800 (PST)
Date: Tue, 12 Dec 2023 15:46:35 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Greg Kurz <groug@kaod.org>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v4 4/6] xen: add option to disable legacy backends
Message-ID: <8b74d526-30b1-4ab7-86bc-98d954beacfb@perard>
References: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
 <20231202014108.2017803-5-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202014108.2017803-5-volodymyr_babchuk@epam.com>

On Sat, Dec 02, 2023 at 01:41:22AM +0000, Volodymyr Babchuk wrote:
> diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
> index 9f9f137f99..03a55f345c 100644
> --- a/hw/xenpv/xen_machine_pv.c
> +++ b/hw/xenpv/xen_machine_pv.c
> @@ -37,7 +37,9 @@ static void xen_init_pv(MachineState *machine)
>      setup_xen_backend_ops();
>  
>      /* Initialize backend core & drivers */
> +#ifdef CONFIG_XEN_LEGACY_BACKENDS
>      xen_be_init();
> +#endif

There's more code that depends on legacy backend support in this
function: Call to xen_be_register() and xen_config_dev_nic() and symbol
xen_config_cleanup, and the code commented with "configure framebuffer".
I've tried to build this on x86.

>  
>      switch (xen_mode) {
>      case XEN_ATTACH:
> diff --git a/meson.build b/meson.build
> index ec01f8b138..c8a43dd97d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2219,6 +2222,7 @@ config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_display)
>  config_host_data.set('CONFIG_CFI', get_option('cfi'))
>  config_host_data.set('CONFIG_SELINUX', selinux.found())
>  config_host_data.set('CONFIG_XEN_BACKEND', xen.found())
> +config_host_data.set('CONFIG_XEN_LEGACY_BACKENDS', have_xen_legacy_backends)

I don't know if "config_host_data" is the right place to have "#define
CONFIG_XEN_LEGACY_BACKENDS", but the alternative is probably to define a
Kconfig value, but I don't know if that would be correct as well.
I guess this is fine here, for now.


>  config_host_data.set('CONFIG_LIBDW', libdw.found())
>  if xen.found()
>    # protect from xen.version() having less than three components
> @@ -3049,6 +3053,7 @@ config_all += config_targetos
>  config_all += config_all_disas
>  config_all += {
>    'CONFIG_XEN': xen.found(),
> +  'CONFIG_XEN_LEGACY_BACKENDS': have_xen_legacy_backends,

I don't think this is useful here, or even wanted.
I think things added to config_all are used only in "meson.build" files,
for things like "system_ss.add(when: ['CONFIG_XEN_LEGACY_BACKENDS'] ..."
But you use "if have_xen_legacy_backends" instead, which is probably ok
(because objects also depends on CONFIG_XEN_BUS).

>    'CONFIG_SYSTEM_ONLY': have_system,
>    'CONFIG_USER_ONLY': have_user,
>    'CONFIG_ALL': true,
> diff --git a/meson_options.txt b/meson_options.txt
> index c9baeda639..91dd677257 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -77,6 +77,8 @@ option('nvmm', type: 'feature', value: 'auto',
>         description: 'NVMM acceleration support')
>  option('xen', type: 'feature', value: 'auto',
>         description: 'Xen backend support')
> +option('xen-legacy-backends', type: 'feature', value: 'auto',

Every other meson options are using '_', I haven't found any single '-'.
Shouldn't this new option follow the same trend and be named
"xen_legacy_backends" ?

> +       description: 'Xen legacy backends (9pfs, fb, qusb) support')

This description feels a bit wrong somehow. "Legacy backend" is internal
to QEMU's code, and meant that the backends are implemented using legacy
support that we want to retire. But the backends them self, as seen by
a guest aren't going to change, and are not legacy. Also, a few month
ago, "qnic" would have been part of the list. Maybe a description like
"Xen backends based on legacy support" might be more appropriate. I'm
not sure listing the different backend in the description is a good
idea, as we will have to remember to change it whenever one of those
backend is been upgraded.


Cheers,

-- 
Anthony PERARD

