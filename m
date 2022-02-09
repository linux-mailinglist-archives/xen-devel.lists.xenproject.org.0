Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214894AF57C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:37:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269349.463408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHp1X-00074W-C5; Wed, 09 Feb 2022 15:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269349.463408; Wed, 09 Feb 2022 15:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHp1X-00070K-8l; Wed, 09 Feb 2022 15:36:51 +0000
Received: by outflank-mailman (input) for mailman id 269349;
 Wed, 09 Feb 2022 15:36:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50R8=SY=irit.fr=dinhngoc.tu@srs-se1.protection.inumbo.net>)
 id 1nHp1W-00070E-6D
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:36:50 +0000
Received: from smtp1.irit.fr (smtp1.irit.fr [141.115.24.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13eed863-89be-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 16:36:41 +0100 (CET)
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
X-Inumbo-ID: 13eed863-89be-11ec-8f75-fffcc8bd4f1a
From: <dinhngoc.tu@irit.fr>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>
References: <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com> <20220209131251.387-1-dinhngoc.tu@irit.fr> <ad339015-c5e7-d776-17a3-2dbd337fcd4a@suse.com> <000801d81dc8$8f15b9a0$ad412ce0$@irit.fr> <2bdd699a-9644-ee6c-c75d-c5577c836f62@suse.com>
In-Reply-To: <2bdd699a-9644-ee6c-c75d-c5577c836f62@suse.com>
Subject: RE: [PATCH v2] x86: Use low memory size directly from Multiboot
Date: Wed, 9 Feb 2022 16:36:47 +0100
Message-ID: <000b01d81dca$d932e420$8b98ac60$@irit.fr>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQIgBme26ChWP5n2WBO9OQe2xD3DKQHRtGxLAKyTMs0BFUqAwwHPzDknq9BsZPA=
Content-Language: en

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: Wednesday, 9 February 2022 16:23
> To: dinhngoc.tu@irit.fr
> Cc: xen-devel@lists.xenproject.org
> Subject: Re: [PATCH v2] x86: Use low memory size directly from =
Multiboot
>=20
> On 09.02.2022 16:20, dinhngoc.tu@irit.fr wrote:
> > This change should only affect the particular case of booting with
> Multiboot2 without EFI (e.g. legacy BIOS or Kexec). Other cases like
> Multiboot 0.x, EFI booting (with or without MB2), or bootloaders that
> generate the BASIC_MEMINFO tag correctly shouldn't be affected.
>=20
> How that? You're taking out the reading of the BDA value altogether, =
aren't
> you? This is certainly a change affecting other environments as well.
>=20
> Jan

I missed that the BDA was used when booting on Multiboot 0.x as well. I =
can add a fallback to use the BDA when the bootloader doesn't provide =
low memory size in the MBI.


