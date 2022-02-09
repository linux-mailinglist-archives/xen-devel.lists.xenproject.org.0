Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0D4AF50B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:20:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269307.463362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHolg-0003ZM-3X; Wed, 09 Feb 2022 15:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269307.463362; Wed, 09 Feb 2022 15:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHolf-0003WO-VE; Wed, 09 Feb 2022 15:20:27 +0000
Received: by outflank-mailman (input) for mailman id 269307;
 Wed, 09 Feb 2022 15:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50R8=SY=irit.fr=dinhngoc.tu@srs-se1.protection.inumbo.net>)
 id 1nHole-0003QJ-R9
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:20:26 +0000
Received: from smtp1.irit.fr (smtp1.irit.fr [141.115.24.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce0110a5-89bb-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 16:20:25 +0100 (CET)
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
X-Inumbo-ID: ce0110a5-89bb-11ec-8eb8-a37418f5ba1a
From: <dinhngoc.tu@irit.fr>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>
References: <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com> <20220209131251.387-1-dinhngoc.tu@irit.fr> <ad339015-c5e7-d776-17a3-2dbd337fcd4a@suse.com>
In-Reply-To: <ad339015-c5e7-d776-17a3-2dbd337fcd4a@suse.com>
Subject: RE: [PATCH v2] x86: Use low memory size directly from Multiboot
Date: Wed, 9 Feb 2022 16:20:23 +0100
Message-ID: <000801d81dc8$8f15b9a0$ad412ce0$@irit.fr>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQIgBme26ChWP5n2WBO9OQe2xD3DKQHRtGxLAKyTMs2r54lCAA==
Content-Language: en

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: Wednesday, 9 February 2022 15:26
> To: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
> Cc: xen-devel@lists.xenproject.org
> Subject: Re: [PATCH v2] x86: Use low memory size directly from =
Multiboot
>=20
> On 09.02.2022 14:12, Tu Dinh Ngoc wrote:
> > Previously, Xen used information from the BDA to detect the amount =
of
> > available low memory. This does not work on some scenarios such as
> > Coreboot, or when booting from Kexec on a UEFI system without CSM.
> >
> > Use the information directly supplied by Multiboot boot information
> > instead.
> > ---
>=20
> Btw - please summarize here briefly what has changed from the earlier
> version. As it stands your adjustment looks to take care of one third =
of what I
> did say in reply to your v1. That's not enough for a v2, or else you =
should have
> taken care of the remaining aspects verbally.
>=20
> Jan

Hi,

> The comment here is a pretty clear indication that bad values may have =
been observed, even if this was only in the distant past. But we have to =
not regress even on very old boot loaders.

> Is the kexec case recognizable by any means (including to distinguish =
kexec properly communicating the value vs it not doing so, as iirc it =
was said on irc that this didn't always work correctly there), such that =
we could skip using the BDA value in that case?

As written in the comments, old versions of kexec (before 2.0.23) =
presented the amount of lower and upper memory in the BASIC_MEMINFO =
Multiboot2 tag in bytes instead of kilobytes. The v2 patch tries to =
detect this condition by checking if there's more than 640 KB of low =
memory and corrects the low memory size in that case.

This change should only affect the particular case of booting with =
Multiboot2 without EFI (e.g. legacy BIOS or Kexec). Other cases like =
Multiboot 0.x, EFI booting (with or without MB2), or bootloaders that =
generate the BASIC_MEMINFO tag correctly shouldn't be affected.


