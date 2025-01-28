Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ACEA208FB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 11:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878364.1288534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjAr-0003Zz-QH; Tue, 28 Jan 2025 10:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878364.1288534; Tue, 28 Jan 2025 10:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjAr-0003XR-Ml; Tue, 28 Jan 2025 10:50:29 +0000
Received: by outflank-mailman (input) for mailman id 878364;
 Tue, 28 Jan 2025 10:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b94Q=UU=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1tcjAq-0003XL-Ib
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 10:50:28 +0000
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae66ee59-dd65-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 11:50:26 +0100 (CET)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e3a1cfeb711so7888660276.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 02:50:26 -0800 (PST)
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
X-Inumbo-ID: ae66ee59-dd65-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738061425; x=1738666225; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3v34krr+R/W/GJLfn6JaO0A1nQiepmfIj00rt+nc7XI=;
        b=x8KxCcVXNxt9O3a68yzqITKTOLU1sSnBbYWKhFmNVEb00BRQjbXnrDrhaUPdxVLjzw
         qRiUdorKtUc/PBxjsSWommkeT0ftqtKuU3dVGLAJXEiJ82F3aHZUz0rI3NZ8mPG6dwic
         WnJm3iV5GAy2cKAT/nUZNp7WYGjQ0B4RWQkaU2d4eJ53L8CVyzWL4YnJxIX1em+nhUmf
         OPXiWgzNXpWWXIE7zo7P8GK2YQDxSTz15TSQl514e2/b3wLjUi9kqc0zDFJMMF2zIq8H
         Pso44gtxuYli+0+iPQONMIQGNDcLJkWhkHZgTsZ3FfLaZa6mtqazmdryR8I83cVaMB4T
         06Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738061425; x=1738666225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3v34krr+R/W/GJLfn6JaO0A1nQiepmfIj00rt+nc7XI=;
        b=E/72m7OKWHVTz3w0BzC6wym3hSpcRtLcFGdTzKK/yw+cX0Yyro6nwZY746xu1g2IO1
         gLeE5NCiKabAT+iNc+i31h/EJB7K8vYHpFoQgs0w9txKBPZPT4KFPAVwshAdziZTAZQP
         KXBm5f3i6SCUOGcS/JsdKFasZJpjHUGHnpPgeHDuQeivuOeIPvTqR9l1UzMKb0onlvRF
         DQgBb3y8zDRO2+v97/oJBQLdk1Ht54lsR/F/18YH3xHxsV4b5jnHU3ZlK0IUPOOu6yEB
         IVh2PRlCS9FFNBQmkKIqyXVchorwsBFIUrfxMphAa0WM9hFgbm29Fs6CFTdJrYNpBke8
         RMgA==
X-Forwarded-Encrypted: i=1; AJvYcCWXaM33XN1X+BXCcVTTE8QEmD+x50mwvRsry19E5GJS6BopR0rPQccc+m95eqag6JbEJD532uR1hRQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxq7PxCuaM3OOS26kC4fnXnhVEhGu0iucKflV38DPMpbp8a26YJ
	gzf6V+TV6joqwooYyMuiy+0B9cBBz7fXzVON8jHh1giuOnKAPzXNnN2gEV1oHrsyLMi1d1FiUqb
	ULdIz53CCICoTGyluYUA8o+73ET8BNB41TBsk9w==
X-Gm-Gg: ASbGncvsF961sjhX6QVD246HS2KGUQkTe6MSCYDoBLVrNbp0XdFwc9Z45YP7/IeL6QE
	60HDAe86fke+tIJ3RPsSGl0SL+qI4vVoNYG4jX+Zz0qAJf3mNrvSp1dTcVVHcimQjXA6A+sQyVw
	==
X-Google-Smtp-Source: AGHT+IGf0QlTdyAwJ7XFE9WBWDnIZoVSKqzGdakhyKNC/XpP9riGmVHzhlBgZYEGGXx14ZaPvjqXAQBpwZ1OiMaZNEw=
X-Received: by 2002:a05:6902:12c5:b0:e58:173e:abcf with SMTP id
 3f1490d57ef6-e58173ead2fmr17795541276.8.1738061425452; Tue, 28 Jan 2025
 02:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20250125181343.59151-1-philmd@linaro.org> <wkb53fhvfchqa4uvmifgitvcr7t7rfpc3hcohdhzczkzvktetx@yjveswjel3s4>
In-Reply-To: <wkb53fhvfchqa4uvmifgitvcr7t7rfpc3hcohdhzczkzvktetx@yjveswjel3s4>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2025 10:50:14 +0000
X-Gm-Features: AWEUYZml6bfUrxGGjA2uylNFRM6bH2fiw1eM--KZHV8IsWc8hLbPBULX6GMnCq4
Message-ID: <CAFEAcA-QOYcnJi=joKHbRmUCXK1UFOgQRgYP-fDq4h_1SkMGyQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/sysbus/platform-bus: Introduce TYPE_DYNAMIC_SYS_BUS_DEVICE
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Yi Liu <yi.l.liu@intel.com>, 
	Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Anthony PERARD <anthony@xenproject.org>, Gustavo Romero <gustavo.romero@linaro.org>, 
	Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	Bernhard Beschow <shentey@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, xen-devel@lists.xenproject.org, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Paul Durrant <paul@xen.org>, =?UTF-8?Q?Cl=C3=A9ment_Mathieu=2D=2DDrif?= <clement.mathieu--drif@eviden.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Jan 2025 at 10:42, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Sat, Jan 25, 2025 at 07:13:34PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Some SysBus devices can optionally be dynamically plugged onto
> > the sysbus-platform-bus (then virtual guests are aware of
> > mmio mapping and IRQs via device tree / ACPI rules).
>
> Do we have some sane way to have user-pluggable sysbus devices on arm?

The answer in a general sense is "no, because user pluggable
sysbus is a weird idea". "sysbus" means "it's wired into a
specific bit of the memory map and to specific IRQs, and whoever
does that needs to know what IRQs and bits of memory are usable,
and the guest OS needs to know it's there". "user-pluggable" means
"it's all automatic and the guest can just do some kind of
probing for what is or isn't present". All the platform bus stuff
is a nasty mess that's working around the things people want
to plug in not being clean devices on probeable buses :-(
And the platform bus is only supported on the "virt" board,
because that's the only one where QEMU is generating its
own dtb or ACPI tables where it can tell the guest "hey,
there's some device here".

-- PMM

