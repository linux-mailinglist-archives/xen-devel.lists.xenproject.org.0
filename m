Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5746268A28
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 13:37:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHmmb-00041L-8L; Mon, 14 Sep 2020 11:36:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lZiK=CX=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kHmma-00041G-D8
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 11:36:28 +0000
X-Inumbo-ID: 4ecd63fe-4477-4077-a6e2-25e9764e743c
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ecd63fe-4477-4077-a6e2-25e9764e743c;
 Mon, 14 Sep 2020 11:36:26 +0000 (UTC)
Date: Mon, 14 Sep 2020 11:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600083385;
 bh=/Vo0tw8czcjB7eazBrV5/9IYNWroQRG5U4Zod5+QrfU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=lbq+oXrTf1xtN4fTHE0OGEF2jHEV+CVfqmFSbSkUVH4cMFk4G1L98Y6IJOcQT8XPc
 7wuZHaq6t3ddK0V4UJ5SyQz3bslOac4XQzkN9mLQiK5K7YrZocgHssYOkSZxoR/VbJ
 I4FFhdCFywYyBs3JzlfcHpNpGwtg5eEn4uRYLvJo=
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 4/4] efi: Do not use command line if secure boot is
 enabled.
Message-ID: <fbcs49Ps8wnxc2ZwN9e7ptr8gwGxRSVEg6J58A8W84wo2RYwkSUS0bhHeocFpGVXsd4YWDL72FkYOHeye8VzWmy_EUyHKMNeBnAzspklDls=@trmm.net>
In-Reply-To: <20200914102450.GD753@Air-de-Roger>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-5-hudson@trmm.net> <20200914102450.GD753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Monday, September 14, 2020 6:24 AM, Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:
> On Mon, Sep 07, 2020 at 03:00:27PM -0400, Trammell Hudson wrote:
> [...]
> > -   static const __initconst EFI_GUID global_guid =3D EFI_GLOBAL_VARIAB=
LE;
> > -   uint8_t secboot, setupmode;
> > -   UINTN secboot_size =3D sizeof(secboot);
> > -   UINTN setupmode_size =3D sizeof(setupmode);
> > -
> > -   if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, N=
ULL, &secboot_size, &secboot) !=3D EFI_SUCCESS )
>
> I'm slightly worried about the dropping of the const here, and the
> fact that the variable is placed in initconst section. Isn't it
> dangerous that the EFI services will try to write to it?

The EFI services do not try to write to it; the API doesn't
even bother with const-correctness.  The prototype has IN
and OUT, but they are not used for constness:

typedef EFI_STATUS(EFIAPI * EFI_GET_VARIABLE) (
IN CHAR16 *VariableName,
IN EFI_GUID *VendorGuid,
OUT UINT32 *Attributes,
OPTIONAL IN OUT UINTN *DataSize,
OUT VOID *Data OPTIONAL)

(So the VariableName string is also silently being turned
into a non-const pointer as well, which is just ugh)

> [...]
> > -   return secboot =3D=3D 1 && setupmode =3D=3D 0;
>
> I would print a message if secboot is > 1, since those should be
> reserved.

Ok.  Addressed in v4, coming soon.

--
Trammell

