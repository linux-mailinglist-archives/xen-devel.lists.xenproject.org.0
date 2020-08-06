Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CB623E02E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 20:10:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3kLI-00015V-Ui; Thu, 06 Aug 2020 18:10:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=775r=BQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k3kLH-00015Q-0B
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 18:10:15 +0000
X-Inumbo-ID: 1edb704f-63dd-4da4-a270-6dadf0dc6f39
Received: from mail1.protonmail.ch (unknown [185.70.40.18])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1edb704f-63dd-4da4-a270-6dadf0dc6f39;
 Thu, 06 Aug 2020 18:10:12 +0000 (UTC)
Date: Thu, 06 Aug 2020 18:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1596737411;
 bh=A96Ly/X7XtmMBUSs9TB/vOHY3B3n6bGi+f5LX2HnQSw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ZCUH+4I0B++i6EdEArGCQumN7ATjS6xiLjndfeXqTnEZj/CQQ7sFuqv9bRUAJK8Fn
 G4pBtljb9ZwWY4Www5SWyUUFPjJmR87gSqy/gQ2n252cn1DHae5/pD6R9Zha0XxR7U
 lJMFqy2+C7UAt9j3617GLrS+q6q4x9KB2zhJWXDg=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Subject: Re: EFI executable corruption when live patching is turned off
Message-ID: <aqOz6WXf04xXyZWiHQBxn5cS1V3ZdgCYb4DFVCGULA8ZPqG-0QAd_eg-Rgti5SK1-K9uxrcZTjXEp-CUPqCd5muymPLqPH2UJgUsyIPa0nQ=@trmm.net>
In-Reply-To: <a72c87a1-c725-04d0-2b1c-4092c4170a34@suse.com>
References: <3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net>
 <a72c87a1-c725-04d0-2b1c-4092c4170a34@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thursday, August 6, 2020 6:40 PM, Jan Beulich <jbeulich@suse.com> wrote:

> On 05.08.2020 20:19, Trammell Hudson wrote:
> [...]
> > ~/build/xen-clean/xen$ objcopy xen.efi test.efi
> > objcopy: test.efi: Data Directory size (1c) exceeds space left in secti=
on (18)
> > objcopy: test.efi: error copying private BFD data: file in wrong format
> > ~/build/xen-clean/xen$ objcopy --version | head -1
> > GNU objcopy (GNU Binutils for Ubuntu) 2.34
>
> I've tried to find a sensible way to fix this in objcopy, but could
> come up with only a somewhat hackish variant:
> https://sourceware.org/pipermail/binutils/2020-August/112746.html
> Let's see what the maintainers there think, or if they have better
> suggestions (or are willing to address this themselves). The issue
> is pretty certainly not tied to LIVEPATCH, but rather to how much
> padding space there is at the end of the .rodata section.

Thanks for tracking that down!  I was also almost certain it was not a live=
patch issue, although that was the easiest minimal test case that I could p=
roduce.

As a workaround for the Xen project, what do you think of forcing alignment=
 on .buildid so that the tool is happy:

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 111edb5..712ffc8 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -161,6 +161,7 @@ SECTIONS
        __note_gnu_build_id_end =3D .;
   } :note :text
 #elif defined(BUILD_ID_EFI)
+  . =3D ALIGN(4096);
   DECL_SECTION(.buildid) {
        __note_gnu_build_id_start =3D .;
        *(.buildid)

--
Trammell

