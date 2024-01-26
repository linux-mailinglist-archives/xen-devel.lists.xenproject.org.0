Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F183DD95
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672085.1045746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTODa-00013w-PJ; Fri, 26 Jan 2024 15:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672085.1045746; Fri, 26 Jan 2024 15:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTODa-00011R-Lu; Fri, 26 Jan 2024 15:34:10 +0000
Received: by outflank-mailman (input) for mailman id 672085;
 Fri, 26 Jan 2024 15:34:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K+M0=JE=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1rTODY-00011L-Mr
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:34:08 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57f76fbb-bc60-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 16:34:07 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so394743a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:34:07 -0800 (PST)
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
X-Inumbo-ID: 57f76fbb-bc60-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706283247; x=1706888047; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M4Saib2ffvHXLnJNyPVgcq63SWcYMj7rwkJWn182XDM=;
        b=zZAGx66BglJ8xbVxaxto1TiC+ZuiJG97LWnl9waF0GNehaMFWTX6hZLkmsQGD4Q9fk
         Of8POhSQwfcPmh3qJt+K9NQ8zO7ASqYcEVJE5tCM9jKDnhQd0vAS01VezbeIsFd/hOgJ
         yD+0Z7stPry7ssrbpemWzQRFFTzu05WrLue6eMQtAnXAt0DwCulCqXHorJuHKEjXVgOn
         cEC/D37mfvBnjpgjRlY4wiaLRse+X/sy79sk09N7kA9chETrm7ryYx4qUHxNPefQ5xLB
         XF3qUTN9f0IyP4YdFCfC0tdGURStuEjYMfWyZ9uWJ0ehFPLUpIGcUZ4fW6PJQkrq96Qa
         MnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283247; x=1706888047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4Saib2ffvHXLnJNyPVgcq63SWcYMj7rwkJWn182XDM=;
        b=kVcve0Z84IvMGpBnkQhGSGW8sa9ejpNFU1XnS3hWgTIFCnNPUkzZMpGwYQFipoEVB6
         Px8iWXjeLaTGnRvsnMpgp2oCKuQcUUXdkV5+WEMuY4RsxaVroC+XamfHfqAPxdPzCJ/S
         EL8Cfb9teUnimz/WdMrhELec/cZU2qTVXOPymU6z8/gF9bq6wA329nl/+D/3u38xKuHP
         9z6+JQ8u984h5lmorw5nQX2yN/JfZRuThabE9yrKZAIlGcVfCkATyMwoK2jH1UR8ixyg
         pLEzsvN59kaDDcN9eazAxVnXBQ6Bin3H9Ji9PsZNAxpX0zPpuRh8Mgpk/GxbIjG3IezN
         MlpA==
X-Gm-Message-State: AOJu0YyHmGrXjgIdwC2+7Bw49rdeSW7mTu7KQ3/4GwWJ3AmAQbujUGIq
	NjL0mrbJlosDvtKJe5szpg6QFLH7J8/Cx8Kf3MauBXaDYXclleLZ+2/m5tnD4wthhGL04JA8joU
	gSY74DC0Nvvn8aXaC1BYk6sGA1+ErC29OVCD4cg==
X-Google-Smtp-Source: AGHT+IG1RgpPDHg/Tk9a1Ljt7riCeGAggNdSQjXAIweOSDuz+FDaRKVriWawUWF21cv3V4Yx8fZBlsfv334jNPewLMo=
X-Received: by 2002:aa7:d409:0:b0:55d:2b55:f1e2 with SMTP id
 z9-20020aa7d409000000b0055d2b55f1e2mr902001edq.37.1706283246891; Fri, 26 Jan
 2024 07:34:06 -0800 (PST)
MIME-Version: 1.0
References: <20240108204909.564514-1-dwmw2@infradead.org> <20240108204909.564514-2-dwmw2@infradead.org>
 <CAFEAcA8JtnXezmo-h-rFZcbqsN_-CnOYCTUfLfd_q=F0702U9g@mail.gmail.com> <d501dfc14c7b109844ff6d28f6be3bba86a1be89.camel@infradead.org>
In-Reply-To: <d501dfc14c7b109844ff6d28f6be3bba86a1be89.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2024 15:33:55 +0000
Message-ID: <CAFEAcA98ZW_1DtKvs-ZU=R9DOBwmnLPwnTBqPbTv7jE8zd1HoA@mail.gmail.com>
Subject: Re: [PATCH v3 01/46] net: add qemu_{configure,create}_nic_device(), qemu_find_nic_info()
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	Beniamino Galvani <b.galvani@gmail.com>, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Helge Deller <deller@gmx.de>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao <gaosong@loongson.cn>, 
	Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jason Wang <jasowang@redhat.com>, Jia Liu <proljc@gmail.com>, 
	Stafford Horne <shorne@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jan 2024 at 15:20, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Fri, 2024-01-26 at 14:43 +0000, Peter Maydell wrote:
> >
> > > +NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
> > > +                            const char *alias);
> > > +bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
> > > +                               const char *alias);
> > > +DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
> > > +                                    const char *alias);
> >
> > Could we have doc comments that document the purpose and API
> > for these new global functions, please?
>
> Like this? I deliberately fatfingered the argument names and didn't
> even get a build warning, and I don't see any actual *documentation*
> being generated with it...?

We use the doc comment format to allow for potential future
documentation generation, but it's only actually generated
if there's a .rst file somewhere under docs/ that has a
kernel-doc:: directive referencing the .h file (for instance
there's one in docs/devel/memory.rst that results in
https://www.qemu.org/docs/master/devel/memory.html#api-reference )

For almost all internal functions, we set the relatively low
bar of "have a doc comment so people reading the header file
can see what the functions do". Where there's a more complex
subsystem that merits its own hand-written documentation
under docs/devel, then if the author of that documentation
is enthusiastic they can clean up and pull in specific headers
to add autogenerated docs. But the primary audience is the
human reader of the .h file.

> diff --git a/include/net/net.h b/include/net/net.h
> index 25ea83fd12..14614b0a31 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -207,10 +207,46 @@ int qemu_show_nic_models(const char *arg, const char *const *models);
>  void qemu_check_nic_model(NICInfo *nd, const char *model);
>  int qemu_find_nic_model(NICInfo *nd, const char * const *models,
>                          const char *default_model);
> +/**
> + * qemu_find_nic_info: Obtain NIC configuration information
> + * @typename: Name of device object type
> + * @match_default: Match NIC configurations with no model specified
> + * @alias: Additional model string to match (for user convenience and
> + *         backward compatibility).
> + *
> + * Search for a NIC configuration matching the NIC model constraints.
> + */
>  NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
>                              const char *alias);
> +/**
> + * qemu_configure_nic_device: Apply NIC configuration to a given device
> + * @dev: Network device to be configured
> + * @match_default: Match NIC configurations with no model specified
> + * @alias: Additional model string to match
> + *
> + * Search for a NIC configuration for the provided device, using the
> + * additionally specified matching constraints. If found, apply the
> + * configuration using qdev_set_nic_properties() and return %true.
> + *
> + * This is used by platform code which creates the device anyway,
> + * regardless of whether there is a configuration for it. This tends
> + * to be platforms which ignore `--nodefaults` and create net devices
> + * anyway. This behaviour is not advised for new platforms; use the
> + * qemu_create_nic_device() function instead, which creates the device
> + * only when it is configured.

I disagree about this paragraph. The behaviour we want for new
platforms is:

 * If this is modelling some board where the ethernet device is
   always present (eg it is soldered on to the board, or it is
   a part of the SoC that the board uses), then always create
   that device
 * If the hardware being modelled has the ethernet device as an
   optional device (eg physically removable like a PCI card),
   then the board should arrange that --nodefaults causes it to
   not be created

Basically if the guest OS is entitled to assume the ethernet
device is present then we shouldn't allow the machine to be
created with it not present, because all that will happen is
that the guest will fall over in bootup.

(Similar applies to things like whether the board should
honour the option to disable USB support or not.)

thanks
-- PMM

