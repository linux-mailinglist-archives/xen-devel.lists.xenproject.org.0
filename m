Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D576E1CFA5E
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 18:18:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYXb3-0003o5-HB; Tue, 12 May 2020 16:17:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfNj=62=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jYXb1-0003o0-Pw
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 16:17:31 +0000
X-Inumbo-ID: 1416caa0-946c-11ea-ae69-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1416caa0-946c-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 16:17:30 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z22so11097312lfd.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xq9364n6y8yNNWKyS1z9p9kRD+YN2mN7eiq5HouVxC4=;
 b=CekUhOP2v5QHDlYyMrg/XwAGCGp7UotOiRbET+h3WGCb2kEVYWiwNLSXJtXB2q4e6E
 Sq2cHhFTlE+zt604vYAH2+LuO0m2AUWi+1QpIDc74vQGVBAGVEZUot6xU//7QvFyXMDH
 w+KpMNkLySTw+CFVxA5SiNKrhlOUjPAP9oHciZ+e0T71++NL5ueoHiKtQfplpJ0a3ROs
 PcpRoNVm2qMd/AH2wYFDC0Y9xzq37RE5PTjXgiUotwE/NMJbT2ViUVs7V3+8gN2bCS7D
 rucMbTpMCBfTQCR/gAOezyDMs9aiQkV7qc9RvRfo7CCB3M9OtGNJFzk1vjJOdkGlDP29
 xxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xq9364n6y8yNNWKyS1z9p9kRD+YN2mN7eiq5HouVxC4=;
 b=mgUzNUbykYtiT0ttMq3xcGz5iacE0InUObSj5F7pemHWekE7ZK+Sd4gSacflw0jnkn
 ZbW6wb07Xke7ad0RJ+r9d/+H1RRS1Mklq7IVjrZv0Yni/ZCtidZp1qtbzMyg+pRux88D
 UMR4Jrt4oY/rbAgBwewMbsILv/VyEBDrACyPagbIx8KebsWjjYrI6PhLTKlengwyVHfv
 M0lK6/Q+GkG7kABsOLLAQFKwhn69uACb84tEyZ0pvc1X6Z+nD6Y0ihqDro1htc3F8Ei4
 3zcGTPd8zPjhoxK6jgR6PSQBtT2AOAvf6J6msPcfp69AM9CpTJmthnVxZpk3uOxw5lYD
 uGMg==
X-Gm-Message-State: AOAM532N5L6j8Hmu9d0R8j3fP9AWwJkOK0al+OeI2p+g1MjshPhNSmoW
 kbLZrFUVLDEkxHCtGup+lf5gpNx+eg30yrQbK7I=
X-Google-Smtp-Source: ABdhPJzatdahXip62o3iHBSUyTxWzUDRavSMSzMw8K+AUyHMR7cpG1ORS5pzXfrxT+Q0hxrrvqMaP5kMJH+kBUI5GLQ=
X-Received: by 2002:a19:7004:: with SMTP id h4mr14098963lfc.148.1589300249753; 
 Tue, 12 May 2020 09:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200512033948.3507-1-jandryuk@gmail.com>
 <20200512033948.3507-3-jandryuk@gmail.com>
 <69dd92f0-5b23-7a3d-3568-feab20874f97@suse.com>
 <372f83e4-6016-cc10-a8e6-970d644eb561@citrix.com>
In-Reply-To: <372f83e4-6016-cc10-a8e6-970d644eb561@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 12 May 2020 12:17:16 -0400
Message-ID: <CAKf6xpsmYpXSkSoVxafcRMH8dQ2DJ6rOfp+ah=RyoS6DheUj4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/boot: Drop .note.gnu.properties in build32.lds
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stefan Bader <stefan.bader@canonical.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 12, 2020 at 11:58 AM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 12/05/2020 16:32, Jan Beulich wrote:
> > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> >
> > On 12.05.2020 05:39, Jason Andryuk wrote:
> >> reloc.S and cmdline.S as arrays of executable bytes for inclusion in
> >> head.S generated from compiled object files.  Object files generated by
> >> an -fcf-protection toolchain include a .note.gnu.property section.  The
> >> way reloc.S and cmdline.S are generated, the bytes of .note.gnu.property
> >> become the start of the .S files.  When head.S calls reloc or
> >> cmdline_parse_early, those note bytes are executed instead of the
> >> intended .text section.  This results in an early crash in reloc.
> > I may be misremembering, but I vaguely recall some similar change
> > suggestion. What I'm missing here is some form of statement as to
> > whether this is legitimate tool chain behavior, or a bug, and
> > hence whether this is a fix or a workaround.
>
> The linker is free to position unreferenced sections anywhere it wishes.
>
> It is deeply unhelpful behaviour, but neither Binutils nor Clang
> developers think it is something wanting fixing.
>
> One option might be to use --orphan-handling=error so unexpected
> toolchain behaviour breaks the build, or in this case perhaps =discard
> might be better.

The toolchain uses .note.gnu.property to flag object files as
supporting Intel CET (Control-flow Enforcement Technology) enabled by
-fcf-protection.  The linker/loader uses the note to know if CET
should be enabled or disabled.  CET can only be enabled if the
application and all libraries support it.

So it's legitimate to flag compiled objects with .note.gnu.property.
The .S files generated by build32.mk are .. interesting.  It seems
like they should only be the runtime code & data, so we don't want the
.note in there.  So I guess this is a workaround for how the .S files
are generated?  My first attempt added -R .note.gnu.property, fyi.

I'm not familiar with the linker options Andrew references, to know
how usable they are off the top of my head.

-fcf-protection=none could also be specified in CFLAGS in build32.mk
to avoid generating the note.

> >> Discard the .note.gnu.property section when linking to avoid the extra
> >> bytes.
> > If we go this route (and if, as per above, I'm misremembering,
> > meaning we didn't reject such a change earlier on), why would we
> > not strip .note and .note.* in one go?

Maybe?  I made the conservative change since they weren't previously discarded.

> >> Stefan Bader also noticed that build32.mk requires -fcf-protection=none
> >> or else the hypervisor will not boot.
> >> https://bugs.launchpad.net/ubuntu/+source/gcc-9/+bug/1863260
> > How's this related to the change here?
>
> I think there is a bit of confusion as to exactly what is going on.
>
> Ubuntu defaults -fcf-protection to enabled, which has a side effect of
> turning on CET, which inserts ENDBR{32,64} instructions and generates
> .note.gnu.properties indicating that the binary is CET-IBT compatible.
>
> ENDBR* instructions come from the Hint Nop space so are safe on older
> processors, but do ultimately add to binary bloat.  It also occurs to me
> that it likely breaks livepath.
>
> The reason Xen fails to boot is purely to do with the position of
> .note.gnu.properties, not the ENDBR* instructions.

Yes.

I referenced Stefan's bug since it specifically called out build32.mk
as problematic even after supplying -fcf-protection=none for a
hypervisor build.  I was trying to give credit and reference a helpful
bug entry.  I don't know how Xen handles such things, but I am fine
dropping it.

Regards,
Jason

