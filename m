Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F4E587C72
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 14:30:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379291.612619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIr2N-0003qO-GE; Tue, 02 Aug 2022 12:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379291.612619; Tue, 02 Aug 2022 12:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIr2N-0003nO-Cl; Tue, 02 Aug 2022 12:30:15 +0000
Received: by outflank-mailman (input) for mailman id 379291;
 Tue, 02 Aug 2022 12:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1IV=YG=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1oIr2M-0003nI-AB
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 12:30:14 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db43a15d-125e-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 14:30:13 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1oIr2K-0007re-Um; Tue, 02 Aug 2022 13:30:13 +0100
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
X-Inumbo-ID: db43a15d-125e-11ed-924f-1f966e50362f
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25321.6356.813826.629186@chiark.greenend.org.uk>
Date: Tue, 2 Aug 2022 13:30:12 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 2/2] ts-libvirt-build: Rework to build with meson
In-Reply-To: <20220802102602.131992-3-anthony.perard@citrix.com>
References: <20220802102602.131992-1-anthony.perard@citrix.com>
	<20220802102602.131992-3-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)

Anthony PERARD writes ("[OSSTEST PATCH 2/2] ts-libvirt-build: Rework to build with meson"):
> libvirt have switch build system to Meson + Ninja, there is no more
> autogen.sh script.
> 
> Add missing dependency "libtirpc-dev" and "meson".
> 
> libvirt needs at least meson 0.54, the version avaiable in Debian
> Buster is too old, but we can install it from backports.

How annoying.

> In order to find out if Meson is used or not, we'll check if the
> "autogen.sh" script is missing. And in the build dir, we will look for
> a "Makefile".

That seems right to me.

>                        build-essential bin86 bcc iasl bc
> -                      flex bison cmake ninja-build
> +                      flex bison cmake ninja-build meson

*Some* version of meson is in even stretch so this is fine.

Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

