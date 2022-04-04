Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF54F13AD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 13:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298282.508070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKjo-0004U0-1n; Mon, 04 Apr 2022 11:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298282.508070; Mon, 04 Apr 2022 11:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKjn-0004SB-V1; Mon, 04 Apr 2022 11:19:11 +0000
Received: by outflank-mailman (input) for mailman id 298282;
 Mon, 04 Apr 2022 11:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xnj=UO=citrix.com=prvs=086167401=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nbKjm-0004S5-5Y
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 11:19:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a5b4ba3-b409-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 13:19:08 +0200 (CEST)
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
X-Inumbo-ID: 0a5b4ba3-b409-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649071148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lS0BZ2bntBHObrz9QwHF+AXVZFY2durtWmtOz0UX4F4=;
  b=JTVBi7+mm/VadURY9mQy8Chf2hXnWAmRReWJBCXJWVAUHxoGsOWWFXhk
   K9aBQke9psAxj/suiRwn/voujlfJbSQCtxKpV8iqPVZxafIFv86U39fV8
   4oWigNj6Tf79/JAUVNP8t5aRv/IFjUYS7qXBpLelstNPHm7/gQ8MdWquY
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68336151
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6cQyVq0NIxXSaUiN2/bD5f5xkn2cJEfYwER7XKvMYLTBsI5bp2BWm
 GYZDT2BO/veZmrzLYtyOoTk/EtTuJHdzYdgHlZqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIw3YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Sh43haj93DJT2xvklThR1HAdHHa5vreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiOP
 JFHMGc2BPjGSwduCm8vUpQlp/+lq1zCUgNxpVa19YNitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ9ONugVCV7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYW2v5+a3lW2AABJLMFcfaAILazIl4PC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2jaD/LF7rlxBHkJPm6gKvVmSw28zb645lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIYfOsIpKFLbp30yDaJ144wLuBJx+U3YE
 c3FGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivryTo
 SHlAx8BlwKXaL+uAVziV02PoYjHBf5XxU/X9wR1Vbp08xDPubqS0Zo=
IronPort-HdrOrdr: A9a23:KS/DOaEXwJ+XcBkipLqE0MeALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZMgpHnJYVcqKRUdcL+7VJVoLUmyyXcx2/hpAV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyJMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="68336151"
Date: Mon, 4 Apr 2022 12:19:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] tools/firmware: do not add a .note.gnu.property
 section
Message-ID: <YkrUJRAGXqz7E7RB@perard.uk.xensource.com>
References: <20220404104044.37652-1-roger.pau@citrix.com>
 <20220404104044.37652-3-roger.pau@citrix.com>
 <YkrSs7DtAh95ndOZ@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkrSs7DtAh95ndOZ@perard.uk.xensource.com>

On Mon, Apr 04, 2022 at 12:12:54PM +0100, Anthony PERARD wrote:
> On Mon, Apr 04, 2022 at 12:40:44PM +0200, Roger Pau Monne wrote:
> > Prevent the assembler from creating a .note.gnu.property section on
> > the output objects, as it's not useful for firmware related binaries,
> > and breaks the resulting rombios image.
> > 
> > This requires modifying the cc-option Makefile macro so it can test
> > assembler options (by replacing the usage of the -S flag with -c) and
> > also stripping the -Wa, prefix if present when checking for the test
> > output.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Add the option to CFLAGS.
> > ---
> >  Config.mk               | 2 +-
> >  tools/firmware/Rules.mk | 4 ++++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Config.mk b/Config.mk
> > index f56f7dc334..82832945e5 100644
> > --- a/Config.mk
> > +++ b/Config.mk
> > @@ -91,7 +91,7 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)"
> >  #
> >  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
> >  cc-option = $(shell if test -z "`echo 'void*p=1;' | \
> > -              $(1) $(2) -S -o /dev/null -x c - 2>&1 | grep -- $(2) -`"; \
> > +              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
> >                then echo "$(2)"; else echo "$(3)"; fi ;)
> 
> Hopefully, changing "-S" to "-c" in this macro will not break anything.
> I would be of the opinion to create a new macro which deal with
> assembler options. But if that works and doesn't changes CFLAGS in the
> testing we do in GitLab, I guess that would be OK.

It looks like Linux already use "-c" for this macro, and with "-Wa,"
options. They just don't use grep. So asking CC to do more work here is
probably fine (adding compile stage).

Cheers,

-- 
Anthony PERARD

