Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91CC1AC1B9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 14:47:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP3um-0005iE-5k; Thu, 16 Apr 2020 12:46:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3QVr=6A=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jP3uk-0005i9-Bf
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 12:46:42 +0000
X-Inumbo-ID: 515fa5a8-7fe0-11ea-b58d-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 515fa5a8-7fe0-11ea-b58d-bc764e2007e4;
 Thu, 16 Apr 2020 12:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id E129E3384;
 Thu, 16 Apr 2020 14:46:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DnbOd6ykFoxr; Thu, 16 Apr 2020 14:46:39 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id E80473251;
 Thu, 16 Apr 2020 14:46:38 +0200 (CEST)
Received: from samy by function with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jP3ue-004VIx-W9; Thu, 16 Apr 2020 14:46:37 +0200
Date: Thu, 16 Apr 2020 14:46:36 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] mini-os: use -m elf_i386 for final linking
Message-ID: <20200416124636.35zgnf5bhq3d3bpw@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20200416122731.22713-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416122731.22713-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Juergen Gross, le jeu. 16 avril 2020 14:27:31 +0200, a ecrit:
> Using the standard -m elf_x86_64 for 64-bit mini-os results in the
> first section (.text) to start only at offset 2MB in the binary file.

? I'm not seeing this on my system:

  0 .text         0001933a  0000000000000000  0000000000000000  00001000  2**12
                  CONTENTS, ALLOC, LOAD, READONLY, CODE

so only 4K offset in the file, the file ends up being 135K big after
stripping.

> Using -m elf_i386 avoids that problem without any visible disadvantage.

Using a 32bit emulation for a 64bit binary? This looks very odd to me?
(and probably fragile)

I'd like to know more where this 2MB binary file offset is coming from,
since AIUI it'd basically impact all binaries built by the toolchain of
your system, not just mini-os, and I don't think the maintainers of your
system want that :)

Samuel

