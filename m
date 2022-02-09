Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6EB4AF00F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 12:46:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269045.463019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHlQK-0008SS-GL; Wed, 09 Feb 2022 11:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269045.463019; Wed, 09 Feb 2022 11:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHlQK-0008PC-CD; Wed, 09 Feb 2022 11:46:12 +0000
Received: by outflank-mailman (input) for mailman id 269045;
 Wed, 09 Feb 2022 11:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50R8=SY=irit.fr=dinhngoc.tu@srs-se1.protection.inumbo.net>)
 id 1nHlQJ-0008P6-9D
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 11:46:11 +0000
Received: from smtp1.irit.fr (smtp1.irit.fr [141.115.24.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df713ade-899d-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 12:46:09 +0100 (CET)
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
X-Inumbo-ID: df713ade-899d-11ec-8eb8-a37418f5ba1a
From: <dinhngoc.tu@irit.fr>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>
References: <001301d81da4$4c993260$e5cb9720$@irit.fr> <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com>
In-Reply-To: <fe2e94e8-9e46-82be-6e83-391f4709ef75@suse.com>
Subject: RE: [PATCH] x86: Use low memory size directly from Multiboot
Date: Wed, 9 Feb 2022 12:46:07 +0100
Message-ID: <000001d81daa$a0790080$e16b0180$@irit.fr>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQJrcJfgWzm7vtgGx61EYtSg2KG0pwIgBme2q1NzIkA=
Content-Language: en

> The comment here is a pretty clear indication that bad values may have =
been
> observed, even if this was only in the distant past. But we have to =
not
> regress even on very old boot loaders.
>=20
> Is the kexec case recognizable by any means (including to distinguish =
kexec
> properly communicating the value vs it not doing so, as iirc it was =
said on irc
> that this didn't always work correctly there), such that we could skip =
using
> the BDA value in that case?

Old Kexec used to report the value in bytes instead of kilobytes like =
it's supposed to. I can make a special case for that so that we won't =
have to rely on the BDA.


