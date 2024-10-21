Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ABE9A6D8F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823642.1237671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2twO-0001Ac-1O; Mon, 21 Oct 2024 15:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823642.1237671; Mon, 21 Oct 2024 15:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2twN-000198-Ud; Mon, 21 Oct 2024 15:03:27 +0000
Received: by outflank-mailman (input) for mailman id 823642;
 Mon, 21 Oct 2024 15:03:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2twM-000190-FO
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:03:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e8a9dfd-8fbd-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 17:03:24 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a156513a1so635945366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:03:24 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a9159a265sm211045766b.212.2024.10.21.08.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 08:03:23 -0700 (PDT)
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
X-Inumbo-ID: 9e8a9dfd-8fbd-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729523004; x=1730127804; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ/WlD/cQwm48zyU/zKL/eCqE13Y05/rtsbUgorXLdk=;
        b=TmGsDzYK0AkLI8CNEaFRMESZYf6PdwdNfoNM/vYz5r+C0OkaevjGzyFhc4KN2e/dih
         ZmxTda2qJH1fjzBNp4AROr5O+aDRrjgHe3XKb+LAu0vs6OKt/AzVLunQDEL3UAupp/Hi
         VfKH/WE9IA0lrDtVg9m25OYdCvMlo0cZo9T/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729523004; x=1730127804;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJ/WlD/cQwm48zyU/zKL/eCqE13Y05/rtsbUgorXLdk=;
        b=UxsYGO4HYKKC9t6A3C3MQ2323VzkI1zjrl1sGiqWmKhPl/qkclSzV3srgoMHGJK7OQ
         JcxZHl+QnRMJE5ubx3lHgeipTsVXExF+OFSgtP3lWXR+YDGY513pSHVl07XIf5PXjaGJ
         fmmTlo/m6ek9b3p+qA9OtTFHRT9FaDFR5h3Psf4+/A5gIObiwKfHnyySct8MjQkLQuMT
         wwvVVvB8fB/tKZPDLKk1dI8ZPT6/1tDi0VPL7/3Hui5WPq0E4YDiCOyBqyS5GKIdKbif
         Jlk7xESrDVmAJl4ip4APRoTXxfv94Q2IwigL7GXnZQMWwRP2XI0ITyYBPTrwa/bPSslk
         7tRw==
X-Gm-Message-State: AOJu0YwDlQfdCtHsOdcBUbTnJCO6NyE9SZ7s2XlI6Xng9sGssd1XIQzQ
	VGChUoVQJeHkUJsEFA6PFsRjYzOhyPJYuUCjLpEtrIIiIjPwbSCSvuUimNK/Iqo=
X-Google-Smtp-Source: AGHT+IE5CVRZTg5j9iteM535GeTKXwZno4noweInwMtGJxwQnPV9hdO5mZCRLU8B+mhSwo307JCbEQ==
X-Received: by 2002:a17:906:730e:b0:a99:e939:d69e with SMTP id a640c23a62f3a-a9a69c67624mr1120458266b.51.1729523003817;
        Mon, 21 Oct 2024 08:03:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Oct 2024 16:03:22 +0100
Message-Id: <D51KQITG2YWD.34JT5C9Y10XS9@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 "Willi Junga" <xenproject@ymy.be>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "David Woodhouse"
 <dwmw2@infradead.org>
X-Mailer: aerc 0.18.2
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <10e0f567ab3be0eae4c6473326da3a6d369ba8ff.camel@infradead.org>
 <ZxZf4nHFhhfyMF12@macbook.local>
 <5970c852-8800-414a-83f9-66392bdbe016@citrix.com>
In-Reply-To: <5970c852-8800-414a-83f9-66392bdbe016@citrix.com>

On Mon Oct 21, 2024 at 3:51 PM BST, Andrew Cooper wrote:
> On 21/10/2024 3:06 pm, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Oct 21, 2024 at 12:34:37PM +0100, David Woodhouse wrote:
> >> On Fri, 2024-10-18 at 10:08 +0200, Roger Pau Monne wrote:
> >>> When using AMD-VI interrupt remapping the vector field in the IO-APIC=
 RTE is
> >>> repurposed to contain part of the offset into the remapping table.=C2=
=A0 Previous to
> >>> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt rema=
pping
> >>> table would match the vector.=C2=A0 Such logic was mandatory for end =
of interrupt to
> >>> work, since the vector field (even when not containing a vector) is u=
sed by the
> >>> IO-APIC to find for which pin the EOI must be performed.
> >>>
> >>> Introduce a table to store the EOI handlers when using interrupt rema=
pping, so
> >>> that the IO-APIC driver can translate pins into EOI handlers without =
having to
> >>> read the IO-APIC RTE entry.=C2=A0 Note that to simplify the logic suc=
h table is used
> >>> unconditionally when interrupt remapping is enabled, even if strictly=
 it would
> >>> only be required for AMD-Vi.
> >>>
> >>> Reported-by: Willi Junga <xenproject@ymy.be>
> >>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> >>> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of usi=
ng a static mapping')
> >>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >> Hm, couldn't we just have used the pin#?
> > Yes, but that would require a much bigger change that what's currently
> > presented here, and for backport purposes I think it's better done
> > this way for fixing this specific bug.
> >
> > Changing to use pin#=C2=A0as the IR offset is worthwhile, but IMO needs=
 to
> > be done separated from the bugfix here.
> >
> >> The AMD IOMMU has per-device IRTE, so you *know* you can just use IRTE
> >> indices 0-23 for the I/O APIC pins.
> > Aren't there IO-APICs with more than 24 pins?
>
> Recent Intel SoCs have a single IO-APIC with 120 pins.
>
> ~Andrew

I can't say I understand why though.

In practice you have the legacy ISA IRQs and the 4 legacy PCI INTx. If you =
have
a weird enough system you might have more than one PCIe bus, but even that =
fits
more than nicely in 24 "pins". Does ACPI give more than 4 IRQs these days a=
fter
an adequate blood sacrifice to the gods of AML?

Cheers,
Alejandro

