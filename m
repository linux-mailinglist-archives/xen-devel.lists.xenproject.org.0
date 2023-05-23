Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB02A70E201
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538594.838698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V7V-00062h-Fl; Tue, 23 May 2023 16:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538594.838698; Tue, 23 May 2023 16:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V7V-0005zn-CK; Tue, 23 May 2023 16:44:21 +0000
Received: by outflank-mailman (input) for mailman id 538594;
 Tue, 23 May 2023 16:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V7U-0005zh-7F
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:44:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e65b4f3-f989-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:44:18 +0200 (CEST)
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
X-Inumbo-ID: 0e65b4f3-f989-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684860257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EgRf1ZV6Y/Xg3Pz/iQe97WoKAP6ERDrGxXFTDkm8Sr8=;
  b=ciFS33VqGqCqSmngsr0aeIhUf4DU6Ctq1tKfYf5O2h8nr5dUb3puONeT
   Y7gTajoKUyKis+4ZrCY9xdaz2HKHLAesSCIEvoMU45L2qAVSx4ARBaWqP
   XM3b1wk8y9IMOw9OJJNalgmYowyY0dD4FTCIe2Tgp10UsmwLXqSkkR2OK
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110113515
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:gGqTkqPLcdpTl+HvrR2Tl8FynXyQoLVcMsEvi/4bfWQNrUok3jwCn
 GpNUGrSP/mLajb8KNBzYIXno0MEsZWGytVkTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5AdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vpXBERz1
 fAyEx42Vwqiob2zwrKKVMA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTHZwMxRvB+
 woq+Uz6Dk5LL4bPlQGV82CAg+7kwQnUBdI7QejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 0UM9zAnt6Qa6E2hRd67VBq9yFa8swIRQZxwFPw38ymE0K+S6AGcbkAGUzpAZdoOpMIwAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi+QPu6lq0EiJFIw6Vvfo0JusQ2qYL
 y22QDYWm5UWqPMr24+A02v+mROK+Z3LTj8rz1CCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI55ypUQDPY6/PhwxUjapSsYZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlNjeB7nnxllDqLGfgXKihLNpLHPhaopUotagPSPojVEovfyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3EJTPPriv85Y/XrfacmJb9JQJV6e5LUUJJ9Y0wMy4V47go
 hmAZ6Ov4AGn3yyYdl3aOywLhXGGdc8XkE/X9BcEZT6As0XPq671hEvDX/PbpYUaydE=
IronPort-HdrOrdr: A9a23:YsrY8aAePEZ28CXlHenP55DYdb4zR+YMi2TDtnoQdfUxSKelfq
 +V8cjzuSWftN9zYhAdcK67V5VoKEm0naKdirN8AV7NZmfbhFc=
X-Talos-CUID: =?us-ascii?q?9a23=3AyQjD2GjmdKaT33HN57SvCzeYmDJubl3Y6UrwL2W?=
 =?us-ascii?q?DJ11QUpyzFlqS+JJ6up87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A24nFeg1/c2XVro5OxoSylpddGjUj4KjxWVtXwck?=
 =?us-ascii?q?9q8iWGSlxEGu3o2nna9py?=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="110113515"
Date: Tue, 23 May 2023 17:44:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Peter Hoyes <Peter.Hoyes@arm.com>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [XEN PATCH] tools/xendomains: Don't auto save/restore/migrate on
 Arm*
Message-ID: <97f676c3-65da-4361-835c-5aa91b99db86@perard>
References: <d52c31c7-57b1-41c1-af35-a9b847683c0a@perard>
 <20230519162454.50337-1-anthony.perard@citrix.com>
 <b18f7dcb-b790-2571-93e1-aa9a9132276a@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b18f7dcb-b790-2571-93e1-aa9a9132276a@xen.org>

On Mon, May 22, 2023 at 08:34:52PM +0100, Julien Grall wrote:
> On 19/05/2023 17:24, Anthony PERARD wrote:
> > diff --git a/tools/configure.ac b/tools/configure.ac
> > index 3cccf41960..0f0983f6b7 100644
> > --- a/tools/configure.ac
> > +++ b/tools/configure.ac
> > @@ -517,4 +517,17 @@ AS_IF([test "x$pvshim" = "xy"], [
> >   AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
> > +dnl Disable autosave of domain in xendomains on shutdown
> > +dnl due to missing support. This should be in sync with
> > +dnl LIBXL_HAVE_NO_SUSPEND_RESUME in libxl.h
> 
> Quite likely, a developer adding a new arch will first look at the
> definition of LIXBL_HAVE_NO_SUSPEND_RESUME. So it would be good if we have a
> similar message there to remind them to update this case. That said...

Probably true, I'll look at adding a comment there.

> > +case "$host_cpu" in
> > +    arm*|aarch64)
> > +        XENDOMAINS_SAVE_DIR=
> > +        ;;
> > +    *)
> > +        XENDOMAINS_SAVE_DIR="$XEN_LIB_DIR/save"
> > +        ;;
> > +esac
> 
> ... I am wondering if the switch should be the other way around. IOW, the
> default should be no support for suspend/resume. This will make easier to
> add support for RISC-V (I suspect support for suspend/resume will not be in
> the first version) or any new other arch.

Sounds good, I'll look at that.

Thanks,

-- 
Anthony PERARD

