Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA031F3AD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 02:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86751.163085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCuoe-0001Fi-IC; Fri, 19 Feb 2021 01:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86751.163085; Fri, 19 Feb 2021 01:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCuoe-0001FT-Bu; Fri, 19 Feb 2021 01:42:44 +0000
Received: by outflank-mailman (input) for mailman id 86751;
 Fri, 19 Feb 2021 01:42:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cTCa=HV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lCuoc-0001FO-Bx
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 01:42:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35959384-beba-4392-bd20-1b3687373ce6;
 Fri, 19 Feb 2021 01:42:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA0DE64EC7;
 Fri, 19 Feb 2021 01:42:39 +0000 (UTC)
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
X-Inumbo-ID: 35959384-beba-4392-bd20-1b3687373ce6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613698960;
	bh=ES19ySQ2YCJfx/AJS03/x+T+dDPTIgq86RcyudNFWL8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z1F5A8obpo6TaFIOLgmezi6is//V3GqqHGcx91+aeARdOHDYoxj84PVmZsebY8QCo
	 yQLanZYTM8VwlTE+AuXp68+YM4mj+pswMpOwsqUqsrrYaEIPNIlMLq59jH1LTnPyd+
	 LaPCfdRG4SWCvNqaOs/HDn54ThwjK3yEpCei9lLeZ08Ex0Fw7QuN+aciBbgywPYYT1
	 AYZ+kIAiFcrnxBsQ+a7pTLg2NcBtIz8qLvbZM8GT3HS6OY+nNZu+eu30Liqal3pYbc
	 ut9Lb4pEy/E7YL7GK6n7r2IgnIVNyY7BhAW/jpwLREh3EeZCF/EnzminpxEZTb1HXu
	 VnhDVot4YKbdA==
Date: Thu, 18 Feb 2021 17:42:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, 
    andrew.cooper3@citrix.com, wl@xen.org, iwj@xenproject.org, 
    anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
In-Reply-To: <416e26b7-0e24-a9ee-6f9a-732f77f7e0cc@suse.com>
Message-ID: <alpine.DEB.2.21.2102181737310.3234@sstabellini-ThinkPad-T480s>
References: <20210213020540.27894-1-sstabellini@kernel.org> <20210213135056.GA6191@mail-itl> <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com> <alpine.DEB.2.21.2102161016000.3234@sstabellini-ThinkPad-T480s> <5a574326-9560-e771-b84f-9d4f348b7f5f@suse.com>
 <alpine.DEB.2.21.2102171529460.3234@sstabellini-ThinkPad-T480s> <416e26b7-0e24-a9ee-6f9a-732f77f7e0cc@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 Feb 2021, Jan Beulich wrote:
> On 18.02.2021 00:45, Stefano Stabellini wrote:
> > Given this, I take there is no 32bit build env? A bit of Googling tells
> > me that gcc on Alpine Linux is compiled without multilib support.
> > 
> > 
> > That said I was looking at the Alpine Linux APKBUILD script:
> > https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/xen/APKBUILD
> > 
> > And I noticed this patch that looks suspicious:
> > https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/xen/musl-hvmloader-fix-stdint.patch
> 
> Indeed. I find it very odd that they have a bimodal gcc (allowing
> -m32) but no suitable further infrastructure (headers). So perhaps
> configure should probe for "gcc -m32" producing a uint64_t that is
> actually 64 bits wide, and disable hvmloader building otherwise
> (and - important - no matter whether it would actually be needed;
> alternative being to fail configuring altogether)? Until - as said
> before - we've made hvmloader properly freestanding.

OK it took me a lot longer than expected (I have never had the dubious
pleasure of working with autoconf before) but the following seems to
work, tested on both Alpine Linux and Debian Unstable. Of course I had
to run autoreconf first.


diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 48bd9ab731..d5e4f1679f 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -50,6 +50,7 @@ CONFIG_OVMF         := @ovmf@
 CONFIG_ROMBIOS      := @rombios@
 CONFIG_SEABIOS      := @seabios@
 CONFIG_IPXE         := @ipxe@
+CONFIG_HVMLOADER    := @hvmloader@
 CONFIG_QEMU_TRAD    := @qemu_traditional@
 CONFIG_QEMU_XEN     := @qemu_xen@
 CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
diff --git a/tools/Makefile b/tools/Makefile
index 757a560be0..6cff5766f3 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -14,7 +14,7 @@ SUBDIRS-y += examples
 SUBDIRS-y += hotplug
 SUBDIRS-y += xentrace
 SUBDIRS-$(CONFIG_XCUTILS) += xcutils
-SUBDIRS-$(CONFIG_X86) += firmware
+SUBDIRS-$(CONFIG_HVMLOADER) += firmware
 SUBDIRS-y += console
 SUBDIRS-y += xenmon
 SUBDIRS-y += xentop
diff --git a/tools/configure.ac b/tools/configure.ac
index 6b611deb13..a3a52cec41 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -307,6 +307,10 @@ AC_ARG_VAR([AWK], [Path to awk tool])
 
 # Checks for programs.
 AC_PROG_CC
+AC_LANG(C)
+AC_LANG_CONFTEST([AC_LANG_SOURCE([[int main() { return 0;}]])])
+AS_IF([gcc -m32 conftest.c -o - 2>/dev/null], [hvmloader=y], [AC_MSG_WARN(hvmloader build disabled as the compiler cannot build 32bit binaries)])
+AC_SUBST(hvmloader)
 AC_PROG_MAKE_SET
 AC_PROG_INSTALL
 AC_PATH_PROG([FLEX], [flex])

