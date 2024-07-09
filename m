Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E044F92BE84
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756355.1164943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCrN-0007Fb-Eh; Tue, 09 Jul 2024 15:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756355.1164943; Tue, 09 Jul 2024 15:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCrN-0007D8-Bk; Tue, 09 Jul 2024 15:34:29 +0000
Received: by outflank-mailman (input) for mailman id 756355;
 Tue, 09 Jul 2024 15:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WrzE=OJ=bounce.vates.tech=bounce-md_30504962.668d587f.v1-3754c977cdcf4829aad8fd604c15bbf4@srs-se1.protection.inumbo.net>)
 id 1sRCrL-0007Cj-UZ
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 15:34:28 +0000
Received: from mail186-1.suw21.mandrillapp.com
 (mail186-1.suw21.mandrillapp.com [198.2.186.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b86ea81f-3e08-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 17:34:25 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-1.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4WJQ5X0VWwzBsThV7
 for <xen-devel@lists.xenproject.org>; Tue,  9 Jul 2024 15:34:24 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3754c977cdcf4829aad8fd604c15bbf4; Tue, 09 Jul 2024 15:34:23 +0000
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
X-Inumbo-ID: b86ea81f-3e08-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720539264; x=1720799764;
	bh=W2Yco3DeBSmvqyLPaqhipGEiiVTOQWY9vKFEEvqxBXE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zsensLUv+3XsRVDzhjZDhXrZUL0bH2jv1CwzqRX5ch4J+t/vxSvXhECfJ5mYyBuXL
	 T68ePV9kvVK9bo25os5KK+aUVa3q0a6/EqQZzFelRfXhUVeG9n4XASvC+2GvLOjJhb
	 UzQpXN37QdfhkLmaWSdh/zYc9JFsrMp9AIIiPLO9GZhKSs9a74yFQNw5eZfQ81Eb5P
	 Hdgktfaaauz4AXUs4rkx4TpLrCXzzdCJJ5dlRWAUhAfCnyfPYWj79CBi+5mjIPFUtf
	 /qDMMfeH9rDR83aiMn6A56xvfsHk9BMsLB3GkR3uQnUDNMZODUpsf2NIj1TaSBZa2z
	 vyim4zid/GA5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720539264; x=1720799764; i=anthony.perard@vates.tech;
	bh=W2Yco3DeBSmvqyLPaqhipGEiiVTOQWY9vKFEEvqxBXE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NXcPh26uhxhcC5FaldrE6LoTLZ2vvrAPuQHMDm7TPoHP856tjyg4wiUBJvEFihLw6
	 m6v3HbxmbuuRIbQ6sXFhg9LsibIZT+HX3rXjJ4bhQffXYotlJrs81s/h99wjsaTUdQ
	 4PnIhgPaD/tkIb4u6I2VfIdLDrzeKXcpBMh1GTdjchI5KMj/oGAtsEmd5tLtCjP+YK
	 QGiWAZf4KaQFkL6LMw6Mh0GvkLLQ+Gu3urzQROJ9G6w0/lSz+1wPwcQSkEduNvZoty
	 avQVYoTEu1B57zZywYh1ut/6eVhCWR6wbCrOrnjSJXCkJBUSgkUS/ZUQYLTYj4y6E/
	 mGKyw/pE3RzzA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20Build=20system=20mess=20in=20stubdom?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720539255227
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>
Message-Id: <Zo1YdgWj7E4doGEU@l14>
References: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
In-Reply-To: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3754c977cdcf4829aad8fd604c15bbf4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240709:md
Date: Tue, 09 Jul 2024 15:34:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 02:49:57PM +0100, Andrew Cooper wrote:
> Hello,
> 
> I'm trying to investigate why stubdom/ is fatally failing now with a
> rebuilt ArchLinux container (GCC 14).
> 
> It is ultimately:
> 
> > ../../../../../newlib-1.16.0/newlib/libc/reent/signalr.c:61:14: error:
> > implicit declaration of function =E2=80=98kill=E2=80=99; did you mean =
=E2=80=98_kill=E2=80=99?
> > [-Wimplicit-function-declaration]
> > =C2=A0=C2=A0 61 |=C2=A0=C2=A0 if ((ret =3D _kill (pid, sig)) =3D=3D -1 =
&& errno !=3D 0)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~
> > make[7]: *** [Makefile:483: lib_a-signalr.o] Error 1
> 
> which doesn't make sense, but is a consequence of the ifdefary in
> newlib/libc/include/_syslist.h
> 
> However, we've got problems ahead of that.
> 
> First of all, with:
> 
> [user@89aef714763e build]$ ./configure --disable-xen --disable-tools
> --disable-docs
> <snip>
> Will build the following stub domains:
> =C2=A0 xenstore-stubdom
> =C2=A0 xenstorepvh-stubdom
> configure: creating ./config.status
> config.status: creating ../config/Stubdom.mk
> 
> both a top level `make` and `make stubdom` end up building all of tools,
> contrary to comments in the makefile.

:-(, I never noticed that but yeah, that rules is what end up building
the tools:

    install-stubdom: mini-os-dir install-tools

So unless you use one of the build targets, the top makefile end-up
wanting to also install (or dist) the tools. I don't think we can change
that:
    dc497635d93f ("build system: make install-stubdom depend on install-too=
ls again")

> `make build-stubdom` does (AFAICT) only build stubdom.

How do you make that works with `./configure --disable-tools` ? I've got
this:
    $ make build-stubdom
    <snip>
    make -C tools/include build
    ....tools/include/../../tools/Rules.mk:212: *** You have to run ./confi=
gure before building or installing the tools.  Stop.
    make: *** [Makefile:44: build-tools-public-headers] Error 2

> However, building just the xenstore stubdoms recursively builds all of
> tools/libs/ even though only some are needed.=C2=A0 This includes libxl w=
hich
> then recurses further to get tools/libacpi, and libxenguest which
> recurses further to get libelf from Xen.

libxl? how? Did you run `make -C stubdom xenstore-stubdom`? Or maybe you
used ./configure to select only "xenstore-stubdom"? In that later case
only the build* targets will only build stubdom, the default target as
well as dist* and install* targets will want to "install-tools" as seen
above.

> What I can't figure out is why xenstore ends up pulling in all of newlib.

I think it's because of these in stubdom/Makefile:
    xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
    $(CROSS_ROOT): cross-newlib cross-zlib cross-libpci

> Semi-irrespective, there's no way we can keep on bodging newlib to
> compile with newer compilers.=C2=A0 There's a whole bunch of other warnin=
gs
> (strict-prototypes, dangling-else, maybe-uninitialized, unused-function,
> pointer-sign, unused-variable) primed ready to cause breakage in any
> environment which makes these error by default.
> 
> I'm going to be making ArchLinux non-blocking because it is a rolling
> distro, but we also can't do nothing here.

I guess we could try to update newlib, 1.16 is from 2007 apparently, and
there's now 4.4 from last year.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


