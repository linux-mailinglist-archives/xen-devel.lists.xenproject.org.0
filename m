Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3046D560B07
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 22:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358068.587053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6eIw-00062N-Dp; Wed, 29 Jun 2022 20:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358068.587053; Wed, 29 Jun 2022 20:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6eIw-000605-AL; Wed, 29 Jun 2022 20:28:54 +0000
Received: by outflank-mailman (input) for mailman id 358068;
 Wed, 29 Jun 2022 20:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6eIu-0005zx-6K
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 20:28:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 155ecde8-f7ea-11ec-bdce-3d151da133c5;
 Wed, 29 Jun 2022 22:28:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CDC83B82604;
 Wed, 29 Jun 2022 20:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD12C34114;
 Wed, 29 Jun 2022 20:28:46 +0000 (UTC)
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
X-Inumbo-ID: 155ecde8-f7ea-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656534527;
	bh=wTwvtie98c9AFO1fnYU065UEv2WSdG55d4PR8TL9RbM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g5ID/EY6Dnms9WiYNPfH5ING/dj2bbc2Ct5ygGawRhuTUTA8r1nbwN96JiGpqGEIs
	 v8AJCbC5UZUhdnhFC6bFk/vvVr1zP7HCXFNtN56OdNi0uF8nOVot93/EFnZtPUYdcZ
	 nodATMFURM1H8EMaa8x704vDMhAQPlr+vaep5/SNYp6uwgfVNi4WnFPzhVA4IrxeaP
	 ht3j/c/SaGhi34gwpo2COY12tA8JsxaRxVgj0SMqyOCKBnUDpnibiFKlEIDdx4Uerm
	 wDtDVHaBuGYZM12sKg/hhutzyFmmIdYckVpROYfctiN/z57Hbn6+iAxRU43IulOIfp
	 LGaijoANm5wQw==
Date: Wed, 29 Jun 2022 13:28:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: xenia <burzalodowa@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net
Subject: Re: [PATCH 2/2] uboot-script-gen: do not enable direct mapping by
 default
In-Reply-To: <cafc1602-6f5f-3238-801d-29c13ed37f50@amd.com>
Message-ID: <alpine.DEB.2.22.394.2206291323470.4389@ubuntu-linux-20-04-desktop>
References: <20220626184536.666647-1-burzalodowa@gmail.com> <20220626184536.666647-2-burzalodowa@gmail.com> <alpine.DEB.2.22.394.2206281727080.4389@ubuntu-linux-20-04-desktop> <22476413-14da-21cd-eb02-15165bfe602a@gmail.com>
 <cafc1602-6f5f-3238-801d-29c13ed37f50@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1972016207-1656534527=:4389"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1972016207-1656534527=:4389
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 29 Jun 2022, Ayan Kumar Halder wrote:
> Hi Stefano/Xenia,
> 
> On 29/06/2022 18:01, xenia wrote:
> > Hi Stefano,
> > 
> > On 6/29/22 03:28, Stefano Stabellini wrote:
> > > On Sun, 26 Jun 2022, Xenia Ragiadakou wrote:
> > > > To be inline with XEN, do not enable direct mapping automatically for
> > > > all
> > > > statically allocated domains.
> > > > 
> > > > Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> > > Actually I don't know about this one. I think it is OK that ImageBuilder
> > > defaults are different from Xen defaults. This is a case where I think
> > > it would be good to enable DOMU_DIRECT_MAP by default when
> > > DOMU_STATIC_MEM is specified.
> > Just realized that I forgot to add [ImageBuilder] tag to the patches. Sorry
> > about that.
> 
> @Stefano, why do you wish the Imagebuilder's behaviour to differ from Xen ? Is
> there any use-case that helps.

As background, ImageBuilder is meant to be very simple to use especially
for the most common configurations. In fact, I think ImageBuilder
doesn't necessarely have to support all the options that Xen offers,
only the most common and important.

If someone wants an esoteric option, they can always edit the generated
boot.source and make any necessary changes. I make sure to explain that
editing boot.source is always a possibility in all the talks I gave
about ImageBuilder.

Now to answer the specific question. I am positive that the most common
configuration for people that wants static memory is to have direct_map.
That is because the two go hand-in-hand in configuration where the IOMMU
is not used. So I think that from an ImageBuilder perspective direct_map
should default to enabled when static memory is requested. It can always
be disabled, both using DOMU_DIRECT_MAP, or editing boot.source.


> > I cc Ayan, since the change was suggested by him.
> > I have no strong preference on the default value.
> > 
> > Xenia
> > 
> > > > ---
> > > >   README.md                | 4 ++--
> > > >   scripts/uboot-script-gen | 8 ++------
> > > >   2 files changed, 4 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/README.md b/README.md
> > > > index cb15ca5..03e437b 100644
> > > > --- a/README.md
> > > > +++ b/README.md
> > > > @@ -169,8 +169,8 @@ Where:
> > > >     if specified, indicates the host physical address regions
> > > >     [baseaddr, baseaddr + size) to be reserved to the VM for static
> > > > allocation.
> > > >   -- DOMU_DIRECT_MAP[number] can be set to 1 or 0.
> > > > -  If set to 1, the VM is direct mapped. The default is 1.
> > > > +- DOMU_DIRECT_MAP[number] if set to 1, enables direct mapping.
> > > > +  By default, direct mapping is disabled.
> > > >     This is only applicable when DOMU_STATIC_MEM is specified.
> > > >     - LINUX is optional but specifies the Linux kernel for when Xen is
> > > > NOT
> > > > diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> > > > index 085e29f..66ce6f7 100755
> > > > --- a/scripts/uboot-script-gen
> > > > +++ b/scripts/uboot-script-gen
> > > > @@ -52,7 +52,7 @@ function dt_set()
> > > >               echo "fdt set $path $var $array" >> $UBOOT_SOURCE
> > > >           elif test $data_type = "bool"
> > > >           then
> > > > -            if test "$data" -eq 1
> > > > +            if test "$data" == "1"
> > > >               then
> > > >                   echo "fdt set $path $var" >> $UBOOT_SOURCE
> > > >               fi
> > > > @@ -74,7 +74,7 @@ function dt_set()
> > > >               fdtput $FDTEDIT -p -t s $path $var $data
> > > >           elif test $data_type = "bool"
> > > >           then
> > > > -            if test "$data" -eq 1
> > > > +            if test "$data" == "1"
> > > >               then
> > > >                   fdtput $FDTEDIT -p $path $var
> > > >               fi
> > > > @@ -491,10 +491,6 @@ function xen_config()
> > > >           then
> > > >               DOMU_CMD[$i]="console=ttyAMA0"
> > > >           fi
> > > > -        if test -z "${DOMU_DIRECT_MAP[$i]}"
> > > > -        then
> > > > -             DOMU_DIRECT_MAP[$i]=1
> > > > -        fi
> > > >           i=$(( $i + 1 ))
> > > >       done
> > > >   }
> > > > -- 
> > > > 2.34.1
> > > > 
> 
--8323329-1972016207-1656534527=:4389--

