Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA01E8280
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:51:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehI5-0001sk-0j; Fri, 29 May 2020 15:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wp2E=7L=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jehI4-0001sd-53
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:51:24 +0000
X-Inumbo-ID: 3ede104e-a1c4-11ea-9947-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ede104e-a1c4-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 15:51:23 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5C0TP9lny+c4XNSIeQ5PbKSojd1Oy7xKe5/Gi37v6/Y9MNMn5wQh8XpydhVUMx2xFiTBZ7yHhq
 dx68TyXp3RvUJGOiPEUIsoxe30nd4q8Ud/QA9Jm/QksPwJQNPNf1q+ZNsgIG7G2vMys32+bAXS
 TsvfMuwlxCIChdvUuTyfvkiDgm3kOHjd4lI1Jug/x7hitpxAmxSvSEtQ590n27r4qjoQRCaNZ8
 P2m0VT+rIx0SunWq82POQdZWjnjQNk3T7S1My3fripDLWgDj2tc+TguHRj8yWNsKzDUG999fOa
 6n4=
X-SBRS: 2.7
X-MesageID: 19517254
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="19517254"
Date: Fri, 29 May 2020 16:51:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack
 support
Message-ID: <20200529155118.GL2105@perard.uk.xensource.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-4-andrew.cooper3@citrix.com>
 <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
 <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
 <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 01:59:55PM +0200, Jan Beulich wrote:
> On 28.05.2020 20:10, Andrew Cooper wrote:
> > On 28/05/2020 11:25, Jan Beulich wrote:
> >> On 27.05.2020 21:18, Andrew Cooper wrote:
> >>> --- a/xen/scripts/Kconfig.include
> >>> +++ b/xen/scripts/Kconfig.include
> >>> @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
> >>>  # Return y if the linker supports <flag>, n otherwise
> >>>  ld-option = $(success,$(LD) -v $(1))
> >>>  
> >>> +# $(as-instr,<instr>)
> >>> +# Return y if the assembler supports <instr>, n otherwise
> >>> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
> >> Is this actually checking the right thing in the clang case?
> > 
> > Appears to work correctly for me.  (Again, its either fine, or need
> > bugfixing anyway for 4.14, and raising with Linux as this is unmodified
> > upstream code like the rest of Kconfig.include).
> 
> This answer made me try it out: On a system with clang 5 and
> binutils 2.32 "incsspd	%eax" translates fine with
> -no-integrated-as but doesn't without. The previously mentioned
> odd use of CLANG_FLAGS, perhaps together with the disconnect
> from where we establish whether to use -no-integrated-as in the
> first place (arch.mk; I have no idea whether the CFLAGS
> determined would be usable by the kconfig invocation, nor how
> to solve the chicken-and-egg problem there if this is meant to
> work that way), may be the reason for this. Cc-ing Anthony once
> again ...

I've just prepare/sent a patch which should fix this CLANG_FLAGS issue
and allows to tests the assembler in Kconfig.

See: [XEN PATCH] xen/build: introduce CLANG_FLAGS for testing other CFLAGS

-- 
Anthony PERARD

