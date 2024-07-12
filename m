Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CAD9301FC
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758321.1167761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOTN-000587-Uu; Fri, 12 Jul 2024 22:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758321.1167761; Fri, 12 Jul 2024 22:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOTN-00055d-RC; Fri, 12 Jul 2024 22:10:37 +0000
Received: by outflank-mailman (input) for mailman id 758321;
 Fri, 12 Jul 2024 22:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSOTM-00055X-Pc
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:10:36 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e9723b4-409b-11ef-8776-851b0ebba9a2;
 Sat, 13 Jul 2024 00:10:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C3774CE0FFC;
 Fri, 12 Jul 2024 22:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF46C32782;
 Fri, 12 Jul 2024 22:10:29 +0000 (UTC)
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
X-Inumbo-ID: 8e9723b4-409b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720822231;
	bh=fhfvCyMdbM4MWXSvTGq6FAcp99v1Br332RqYK2G5MHY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gaF+yDizeICtB7qjqcGajdl1Y5V8uY3wWY+i9Rnz7T+kj06v0+AU86KaVfQDsI57S
	 6oQFMXv06ywDUU2ewI6DpJHFzH6WixQlRR3aT0TIQ+IhDSqvtqsFpK2bnlN/HYhb2D
	 YiIDDUVgPV2mFLSBvINhuyaVwJkLzhUzm/GGCCowG1H9CwEfMu6kE4pTe2ZY5YWcrI
	 0Bd1PIp5518zbEmwgKMtfzRr/kSVYPMjhgLj/DFcfXLhp/3irT2d/2q7ciGTWtlpR6
	 Mhgy0LZxl3GHgrB6S/TuGIWeSAkqSy+i5m2qxOr/y7usWuyHsRFfSV8eovYj/EqRZS
	 zWPL/u8s9NuuA==
Date: Fri, 12 Jul 2024 15:10:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    nicola.vetrini@bugseng.com, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 06/17] x86/EFI: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <a02442b6-b286-4fda-8814-cb939f29a355@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407121510180.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <0267af93ae969b67a77c3a9aca9f4ad6525de1b9.1719829101.git.alessandro.zucchelli@bugseng.com> <a02442b6-b286-4fda-8814-cb939f29a355@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Jul 2024, Jan Beulich wrote:
> On 01.07.2024 15:36, Alessandro Zucchelli wrote:
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -3,6 +3,11 @@
> >   * is intended to be included by common/efi/boot.c _only_, and
> >   * therefore can define arch specific global variables.
> >   */
> > +
> > +#ifndef X86_EFI_EFI_BOOT_H
> > +#define X86_EFI_EFI_BOOT_H
> > +
> > +
> >  #include <xen/vga.h>
> >  #include <asm/e820.h>
> >  #include <asm/edd.h>
> 
> Nit: No double blank lines please, anywhere.

With this addressed:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

