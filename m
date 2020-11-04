Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D82A7348
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 00:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19579.44786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaSc4-0005pm-HI; Wed, 04 Nov 2020 23:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19579.44786; Wed, 04 Nov 2020 23:54:48 +0000
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
	id 1kaSc4-0005on-Di; Wed, 04 Nov 2020 23:54:48 +0000
Received: by outflank-mailman (input) for mailman id 19579;
 Wed, 04 Nov 2020 23:54:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hAWL=EK=kernel.org=ardb@srs-us1.protection.inumbo.net>)
 id 1kaSc2-0005oH-T6
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 23:54:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0fc1270-cef8-45f3-865c-3ef2e991263b;
 Wed, 04 Nov 2020 23:54:46 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59D4F20644
 for <xen-devel@lists.xenproject.org>; Wed,  4 Nov 2020 23:54:45 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 32so470168otm.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 15:54:45 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hAWL=EK=kernel.org=ardb@srs-us1.protection.inumbo.net>)
	id 1kaSc2-0005oH-T6
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 23:54:46 +0000
X-Inumbo-ID: f0fc1270-cef8-45f3-865c-3ef2e991263b
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f0fc1270-cef8-45f3-865c-3ef2e991263b;
	Wed, 04 Nov 2020 23:54:46 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 59D4F20644
	for <xen-devel@lists.xenproject.org>; Wed,  4 Nov 2020 23:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604534085;
	bh=ok/fYJAV8bL/1AuLmDXnqp8O7fhDT79bjnQKIeilga8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=1jBm3LxvPPUFtbaiINDeyZsCFVPiTJkRwgnj6Ofr3pS3Fdj2qTTqn9dWMS5Xz7BYe
	 ttLglkMvdkodFatepjG69rCU2UMAzyYVRoUQhdnAbbQcmSwk7P7hG5obqVvnPFZmHL
	 9J+1qZpq4DCdvahRg8lv+zOquzgflq8c7BGFQNdw=
Received: by mail-ot1-f46.google.com with SMTP id 32so470168otm.3
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 15:54:45 -0800 (PST)
X-Gm-Message-State: AOAM530PBGGcbOrKt4jUD6lz+ojnVzJ/k6dclhgsWb8tnDhyjD2VCbje
	LpA2lbgKIGcepCuVRgX5Yx0D9EAHUNSR4o8TaWM=
X-Google-Smtp-Source: ABdhPJx0nEZeMyzbhRvrfSiHfUQMv/ufXNej/rub8C+37WnU+/ULONWKCy93retsTVNVdch1MCDAGRDndPMREdLeDz8=
X-Received: by 2002:a9d:62c1:: with SMTP id z1mr142766otk.108.1604534084707;
 Wed, 04 Nov 2020 15:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20201104221400.7005-1-ardb@kernel.org> <f3d902ca-3fa2-aa8a-fb9a-0891b9567751@oracle.com>
In-Reply-To: <f3d902ca-3fa2-aa8a-fb9a-0891b9567751@oracle.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 5 Nov 2020 00:54:33 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH81-3bayCKFQ4cO+Hw4FhRtc=DJr6qTirtg75eGwdZNQ@mail.gmail.com>
Message-ID: <CAMj1kXH81-3bayCKFQ4cO+Hw4FhRtc=DJr6qTirtg75eGwdZNQ@mail.gmail.com>
Subject: Re: [PATCH] efi: x86/xen: switch to efi_get_secureboot_mode helper
To: boris.ostrovsky@oracle.com
Cc: linux-efi <linux-efi@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	sstabellini@kernel.org, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2020 at 00:53, <boris.ostrovsky@oracle.com> wrote:
>
>
> On 11/4/20 5:14 PM, Ard Biesheuvel wrote:
> > Now that we have a static inline helper to discover the platform's secure
> > boot mode that can be shared between the EFI stub and the kernel proper,
> > switch to it, and drop some comments about keeping them in sync manually.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/xen/efi.c                        | 37 +++++---------------
> >  drivers/firmware/efi/libstub/secureboot.c |  3 --
> >  2 files changed, 9 insertions(+), 31 deletions(-)
> >
> > diff --git a/arch/x86/xen/efi.c b/arch/x86/xen/efi.c
> > index 205a9bc981b0..a27444acaf1e 100644
> > --- a/arch/x86/xen/efi.c
> > +++ b/arch/x86/xen/efi.c
> > @@ -93,37 +93,22 @@ static efi_system_table_t __init *xen_efi_probe(void)
> >
> >  /*
> >   * Determine whether we're in secure boot mode.
> > - *
> > - * Please keep the logic in sync with
> > - * drivers/firmware/efi/libstub/secureboot.c:efi_get_secureboot().
> >   */
> >  static enum efi_secureboot_mode xen_efi_get_secureboot(void)
> >  {
> > -     static efi_guid_t efi_variable_guid = EFI_GLOBAL_VARIABLE_GUID;
> >       static efi_guid_t shim_guid = EFI_SHIM_LOCK_GUID;
> > +     enum efi_secureboot_mode mode;
> >       efi_status_t status;
> > -     u8 moksbstate, secboot, setupmode;
> > +     u8 moksbstate;
> >       unsigned long size;
> >
> > -     size = sizeof(secboot);
> > -     status = efi.get_variable(L"SecureBoot", &efi_variable_guid,
> > -                               NULL, &size, &secboot);
> > -
> > -     if (status == EFI_NOT_FOUND)
> > -             return efi_secureboot_mode_disabled;
> > -
> > -     if (status != EFI_SUCCESS)
> > -             goto out_efi_err;
> > -
> > -     size = sizeof(setupmode);
> > -     status = efi.get_variable(L"SetupMode", &efi_variable_guid,
> > -                               NULL, &size, &setupmode);
> > -
> > -     if (status != EFI_SUCCESS)
> > -             goto out_efi_err;
> > -
> > -     if (secboot == 0 || setupmode == 1)
> > -             return efi_secureboot_mode_disabled;
> > +     mode = efi_get_secureboot_mode(efi.get_variable);
>
>
> Which tree is this patch against? I don't see a definition of efi_get_secureboot_mode().
>
>
> > +     if (mode == efi_secureboot_mode_unknown) {
> > +             efi_err("Could not determine UEFI Secure Boot status.\n");
>
>
> We need to include drivers/firmware/efi/libstub/efistub.h for that. Which I am not sure is meant to be included anywhere outside of libstub.
>

Ah yes, my mistake - that should be pr_err, not efi_err.

