Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BDA62E310
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 18:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445309.700458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oviht-0003kn-Hn; Thu, 17 Nov 2022 17:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445309.700458; Thu, 17 Nov 2022 17:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oviht-0003id-Ed; Thu, 17 Nov 2022 17:29:45 +0000
Received: by outflank-mailman (input) for mailman id 445309;
 Thu, 17 Nov 2022 17:29:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SqD4=3R=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ovihr-0003iX-Uc
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 17:29:44 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b8fa621-669d-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 18:29:42 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id s5so3531312edc.12
 for <xen-devel@lists.xenproject.org>; Thu, 17 Nov 2022 09:29:42 -0800 (PST)
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
X-Inumbo-ID: 6b8fa621-669d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB5FFKRpQ7rnDeXlHhmH631sUw/6iJ8VNXXhcQXAT5M=;
        b=g8wW3qSpWDpCyE6eXNfSLmHqp4ZvYuiGEl4RFpc5fppbP/Azb2L/g126PdCr2yDVn6
         F5Z6/qxn7Jmy6csPxI7pT2DRmjvSpIGpftKe21UyXdsOVtdqhaun0RzEDjrtQ1AgafaD
         GHsG/mPHxjY5cGUuBi/67OeV5iB2FKyQ7aDMdYA7fUe3YXEGMBs+FXizhFB1pROMN1hQ
         igbkoh6mfcbwqajkQIQH0IuqCznyek9ul+dn3KyBcO+dSfLblTZDiftJjHL1nhHROals
         0flgjYRWE5xGIz1Gd958MyTEk+fEXOETruMzN81HapkNI+o7C0cBT+1ZcBegJabDuhn3
         KtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB5FFKRpQ7rnDeXlHhmH631sUw/6iJ8VNXXhcQXAT5M=;
        b=c2CenqQTQ0ix1XV90VPh2xQ/DD0WxDWlObqK5oivHL1Zvu5M4PQqK0LfEy9+lrUIuc
         Fp6JRldnNHkjInyPszFlDZ+ccDDxv8F6kgOWsprcQCVrHE/ySRIU+7/LVvJJKeMh6gQJ
         RBVJk2rd8r5ikhJa+7alBz3tMdVuQHh2FlBBohVJq/UhNYYMVomEm8XLJ4bY9BfaZFfE
         6VIFIUDFV1pEqPUATHmx1ItZQWb4lCgHWdNrtH3uUifrpCMWHyHMnEee9D4fQ0JFauSe
         5ySsZ31GuIj0EErN1TtHhlU/omOVePuvS42EaKzxRRqVsE2W2wHjMYRgUaeoxaYHWmle
         t+Gw==
X-Gm-Message-State: ANoB5plECKsh69Sg1txv9x4P8fu8vAH4Sohw8ULe0qLvHwf0QwN6B00J
	jLanORD6DfrlkBuW0U/P+cr3kpoLnV8e/6ti+0U=
X-Google-Smtp-Source: AA0mqf6KaqVpH+ImDPySUJ23DCoYBB0J1GBgFFOvIG7NYpCP4vdBtBO1aWsAJh8lAZRX+SqcYKI1CFpCifxU1WRsb9w=
X-Received: by 2002:a05:6402:541a:b0:463:be84:5283 with SMTP id
 ev26-20020a056402541a00b00463be845283mr3037015edb.7.1668706181480; Thu, 17
 Nov 2022 09:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>
 <Y3VYs/sS4VddrBCK@mail-itl> <Y3WruE/VOBZFfHfi@mail-itl>
In-Reply-To: <Y3WruE/VOBZFfHfi@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 17 Nov 2022 12:29:29 -0500
Message-ID: <CAKf6xptPLFT-Jp=wEsvSDkCFZd78enO9s51YjZ4Fi2bNnesxww@mail.gmail.com>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on Xen
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, qemu-devel@nongnu.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2022 at 10:34 PM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Wed, Nov 16, 2022 at 10:40:02PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, Nov 16, 2022 at 02:15:22PM -0500, Jason Andryuk wrote:
> > > On Mon, Nov 14, 2022 at 2:21 PM Marek Marczykowski-G=C3=B3recki
> > > <marmarek@invisiblethingslab.com> wrote:
> > > >
> > > > The /dev/mem is used for two purposes:
> > > >  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
> > > >  - reading Pending Bit Array (PBA)
> > > >
> > > > The first one was originally done because when Xen did not send all
> > > > vector ctrl writes to the device model, so QEMU might have outdated=
 old
> > > > register value. This has been changed in Xen, so QEMU can now use i=
ts
> > > > cached value of the register instead.
> > > >
> > > > The Pending Bit Array (PBA) handling is for the case where it lives=
 on
> > > > the same page as the MSI-X table itself. Xen has been extended to h=
andle
> > > > this case too (as well as other registers that may live on those pa=
ges),
> > > > so QEMU handling is not necessary anymore.
> > > >
> > > > Removing /dev/mem access is useful to work within stubdomain, and
> > > > necessary when dom0 kernel runs in lockdown mode.
> > > >
> > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> > >
> > > I put the Xen, QEMU, and xen-pciback patches into OpenXT and gave a
> > > little test.  When pci_permissive=3D0, iwlwifi fails to load its
> > > firmware.  With pci_permissive=3D1, it looks like MSI-X is enabled. (=
I
> > > previously included your libxl allow_interrupt_control patch - that
> > > seemed to get regular MSIs working prior to the MSI-X patches.)  I
> > > also removed the OpenXT equivalent of 0005-Disable-MSI-X-caps.patch.
> > > I am testing with Linux 5.4.y, so that could be another factor.
> >
> > Can you confirm the allow_interrupt_control is set by libxl? Also,
> > vanilla 5.4 doesn't have the allow_interrupt_control patch at all, and =
you
> > may have an earlier version that had "allow_msi_enable" as the sysfs
> > file name.

I backported allow_interrupt_control to 5.4 and that is set properly.

> Ok, I found what is wrong. Enabling MSI-X is refused, because INTx isn't
> disabled at this point yet. And apparently I was testing this with
> permissive=3D1...
>
> Linux does this:
> https://github.com/torvalds/linux/blob/master/drivers/pci/msi/msi.c#L611
> In short:
> 1. Enable MSI-X with MASKALL=3D1
> 2. Setup MSI-X table
> 3. Disable INTx
> 4. Set MASKALL=3D0
>
> This patch on top should fix this:
> ----8<----
> diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/xe=
n/xen-pciback/conf_space_capability.c
> index 097316a74126..f4c4381de76e 100644
> --- a/drivers/xen/xen-pciback/conf_space_capability.c
> +++ b/drivers/xen/xen-pciback/conf_space_capability.c
> @@ -235,7 +235,7 @@ static int msi_msix_flags_write(struct pci_dev *dev, =
int offset, u16 new_value,
>             (new_value ^ old_value) & ~field_config->allowed_bits)
>                 return PCIBIOS_SET_FAILED;
>
> -       if (new_value & field_config->enable_bit) {
> +       if ((new_value & field_config->allowed_bits) =3D=3D field_config-=
>enable_bit) {
>                 /* don't allow enabling together with other interrupt typ=
es */
>                 int int_type =3D xen_pcibk_get_interrupt_type(dev);
>
> ----8<----

FWIW, I can confirm this allows enabling MSI-X with permissive=3D0 for me.

Thanks,
Jason

