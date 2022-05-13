Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6222B526C29
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 23:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328833.551988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcdC-0001WX-Bx; Fri, 13 May 2022 21:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328833.551988; Fri, 13 May 2022 21:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcdC-0001U2-8v; Fri, 13 May 2022 21:15:26 +0000
Received: by outflank-mailman (input) for mailman id 328833;
 Fri, 13 May 2022 21:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lQ6F=VV=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1npcdA-0001Tw-Mi
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 21:15:24 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbf0a80d-d301-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 23:15:23 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.89 #1) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1npcd5-0004Nq-SA; Fri, 13 May 2022 22:15:19 +0100
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
X-Inumbo-ID: cbf0a80d-d301-11ec-aa76-f101dd46aeb6
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25214.51815.786560.367850@chiark.greenend.org.uk>
Date: Fri, 13 May 2022 22:15:19 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH] ts-xen-build-prep: Grab newer NASM version, to build OVMF
In-Reply-To: <20220513133534.88564-1-anthony.perard@citrix.com>
References: <20220513133534.88564-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.4.1 (i586-pc-linux-gnu)

Anthony PERARD writes ("[OSSTEST PATCH] ts-xen-build-prep: Grab newer NASM version, to build OVMF"):
> Recent versions of OVMF now need a version of NASM that is newer
> than the one available on Debian oldstable/buster. They want to use
> NASM 2.15.05 [1], which is available in Debian stable/bullseye. The
> need to use a newer version started with d3febfd9ade3 ("MdePkg:
> Replace Opcode with the corresponding instructions.").
> 
> There is no backport package available but the nasm package from
> Debian Bullseye can easily be installed on Buster as it has few
> dependencies and are already satisfied.

I think this is a quite fine bodge.

> +        target_fetchurl($ho, $nasm_url, "/tmp/$nasm_pkg");
> +        target_install_packages($ho, "/tmp/$nasm_pkg");

I don't think this use of /tmp is very nice.  ts-xen-build-prep runs
with the host all to itself, so I think you can use /root ?

Ian.

-- 
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my own.  

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

