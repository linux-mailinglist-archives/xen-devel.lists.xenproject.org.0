Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE1E862D5A
	for <lists+xen-devel@lfdr.de>; Sun, 25 Feb 2024 23:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685219.1065624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reMh4-0007qz-Vm; Sun, 25 Feb 2024 22:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685219.1065624; Sun, 25 Feb 2024 22:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reMh4-0007on-St; Sun, 25 Feb 2024 22:09:58 +0000
Received: by outflank-mailman (input) for mailman id 685219;
 Sun, 25 Feb 2024 22:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FNuJ=KC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1reMh3-0007of-Mw
 for xen-devel@lists.xenproject.org; Sun, 25 Feb 2024 22:09:57 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b83d86c-d42a-11ee-98f5-efadbce2ee36;
 Sun, 25 Feb 2024 23:09:55 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56533e30887so2382574a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 25 Feb 2024 14:09:55 -0800 (PST)
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
X-Inumbo-ID: 9b83d86c-d42a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708898995; x=1709503795; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpmwRK0QweucH9b9Rs/GnZrRDx/RfA9K31A46yAtE+M=;
        b=B9qU65vkuf8irOrijXLQWYgWiXYAC67LH71PghTogwaa2cPxbT12zjGZcdbv/vO6CB
         ouvPcAOgJ4LYU5A86XTHrhCIUmnQ/m/n8yzESayHByNyfFIlw5eIb7a5SO+IK6OQnE4h
         UAb5t/FuwzLu4yTmkVMXyJoLAxib5SAyEmcvLO1rpw8ahuFJ1AQ1m8ae7Q60dvMVjoZd
         AKzXecQeMPoWLLukLPudB9N/9ff8U9akIStRqizWTKMZSPbXbI1siY9mW+t404nkh5bS
         qtKWNjndH+bOvusPvOQX0dTUWLDCtv9gysWjgf4r8i2viNf88qF9nz0s0E/ZcAlFDgHH
         HZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898995; x=1709503795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpmwRK0QweucH9b9Rs/GnZrRDx/RfA9K31A46yAtE+M=;
        b=AwZSjtAErW0Z6fSTYgkYJN5aScNRWfFOak65Q0sVYFQ8SNpK8R//mZJOUY6BG5I6E5
         D048WrTPHroAJonFuORT4jpLeUKlZ66jAdv8er+iAnQgn2xh57I+9X9fM5sxi6wqsKuO
         J3U3umR60Tj/KJ6NjiW6cjAX9tCVpjqlj4JmrhkcA1FEIi5HNL4Rgoyqt5ZDT8K6QFAl
         BgaDC5w17ALHHmkIj2qB3byaowe4qLLBzkPqMcQhEAMvehpGd6eEOnQ34/zFpEtDzCGQ
         xS/f5iVqcYySTAG9rc+tBCaFQ4JKY0OEVjrdHM8nD5FuFkByXZGXeNxyV0UpSChePCEG
         hbXw==
X-Forwarded-Encrypted: i=1; AJvYcCUHkXEMxtJYghDBMv0WvMpF+mww0YJBXMu35ScypW1EH3CyTH1Q9FwLmUOhcqUinYMoBWa9M7B5QSvW2ja4rIBe8NTXekbzoiv7D48MCGQ=
X-Gm-Message-State: AOJu0YwybCug1Jd3pDuNasOJskt3GAWVadBmD4Cl8w7wMPsFCOmVVmIL
	2IBjwfiaEKk6ktQMktMe6xUxeLvT8ol/WETSNwHekRGQKN11/Ju731lb8bDeE0JDLgkRNea3kmr
	yWHQhk9/3Y1zpivVSfAGf1x80mOs=
X-Google-Smtp-Source: AGHT+IH5E3VRU8H5r8MxSJ69s61CROiFH/aDaz3qpmcnhpDcgzaqoQggtpdDq4fx2fyMmLEawOzXhXI2jdHbOujNZkE=
X-Received: by 2002:a05:6402:717:b0:565:cc2d:533 with SMTP id
 w23-20020a056402071700b00565cc2d0533mr1513727edx.1.1708898995198; Sun, 25 Feb
 2024 14:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20240219181627.282097-1-marmarek@invisiblethingslab.com> <429a5a27-21b9-45bd-a1a6-a1c2ccc484c9@linaro.org>
In-Reply-To: <429a5a27-21b9-45bd-a1a6-a1c2ccc484c9@linaro.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 25 Feb 2024 17:09:43 -0500
Message-ID: <CAKf6xpsG9bhRv9QPwhXtCoM+Zy+JCy+ceFEP2j-ZVVZC_yOe1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/xen: detect when running inside stubdomain
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Claudio Fontana <cfontana@suse.de>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 1:50=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 19/2/24 19:16, Marek Marczykowski-G=C3=B3recki wrote:
> > Introduce global xen_is_stubdomain variable when qemu is running inside
> > a stubdomain instead of dom0. This will be relevant for subsequent
> > patches, as few things like accessing PCI config space need to be done
> > differently.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >   hw/xen/xen-legacy-backend.c | 15 +++++++++++++++
> >   include/hw/xen/xen.h        |  1 +
> >   system/globals.c            |  1 +
> >   3 files changed, 17 insertions(+)
>
>
> > diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
> > index 37ecc91fc3..ecb89ecfc1 100644
> > --- a/include/hw/xen/xen.h
> > +++ b/include/hw/xen/xen.h
> > @@ -36,6 +36,7 @@ enum xen_mode {
> >   extern uint32_t xen_domid;
> >   extern enum xen_mode xen_mode;
> >   extern bool xen_domid_restrict;
> > +extern bool xen_is_stubdomain;
> >
> >   int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
> >   int xen_set_pci_link_route(uint8_t link, uint8_t irq);
> > diff --git a/system/globals.c b/system/globals.c
> > index b6d4e72530..ac27d88bd4 100644
> > --- a/system/globals.c
> > +++ b/system/globals.c
> > @@ -62,6 +62,7 @@ bool qemu_uuid_set;
> >   uint32_t xen_domid;
> >   enum xen_mode xen_mode =3D XEN_DISABLED;
> >   bool xen_domid_restrict;
> > +bool xen_is_stubdomain;
>
> Note for myself, Paolo and Claudio, IIUC these fields belong
> to TYPE_XEN_ACCEL in accel/xen/xen-all.c. Maybe resulting in
> smth like:

I think some of these are used by the KVM Xen-emulation, so they can't
just be moved into the Xen accelerator.  David?

Regards,
Jason

