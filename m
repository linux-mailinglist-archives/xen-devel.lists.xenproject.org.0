Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650183025BA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 14:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74088.133159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l42HR-0002jv-85; Mon, 25 Jan 2021 13:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74088.133159; Mon, 25 Jan 2021 13:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l42HR-0002jW-4v; Mon, 25 Jan 2021 13:51:45 +0000
Received: by outflank-mailman (input) for mailman id 74088;
 Mon, 25 Jan 2021 13:51:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l42HQ-0002jR-Eg
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 13:51:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l42HQ-0005Pm-BB
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 13:51:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l42HQ-0004Cq-9q
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 13:51:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l42HL-0003mk-En; Mon, 25 Jan 2021 13:51:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=z281Hj/3sB0EmWS2Yb/AJ4/BUXrugA4uJiMHT02PzaE=; b=a50IUzzL4gg9Cbjcqb25KYWNRM
	GIz9GOmV7vaF91u6R+ctzw5Qha6hx//v8j2Svlpeuhr4I4WczNlL0ZPFHPwmYJtruOOSEYRav149W
	OEJZUoCVQeefD557dm5yizjDnHuY1jPQWU593DQf0aga2dDRYboVDU9BFdtE3spwQegc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24590.52459.194044.857442@mariner.uk.xensource.com>
Date: Mon, 25 Jan 2021 13:51:39 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    M A Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels
In-Reply-To: <d541007c-9537-ba53-02f7-8ea90e9c89cf@suse.com>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
	<f23d219f-ea52-e472-b95f-2a7e359d44cc@suse.com>
	<24590.44019.51460.33930@mariner.uk.xensource.com>
	<d541007c-9537-ba53-02f7-8ea90e9c89cf@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels"):
> On 25.01.2021 12:30, Ian Jackson wrote:
> >> As far as configure.ac goes, I'm pretty sure there is a better (more
> >> "standard") way of using PKG_CHECK_MODULES().
> > 
> > Yes, what you have done is rather unidiomatic and seems to rely on
> > undocumented internals of the PKG_*. macros.
> 
> Which specific part of the construct are you referring to?
> I didn't think I used anything outright undocumented. Of
> course I did have some trouble finding suitable docs, but in
> the end I managed to locate at least something that I was
> able to grok.

I mean, the parts where you examine libzstd_PKG_ERRORS.

> >  Why not do as was done for bz2, lzma, lzo2 ?
> 
> Because the pkg-config approach is more flexible - aiui
> AC_CHECK_HEADER() and AC_CHECK_LIB() won't find a
> dependency when sitting in some custom place, which the *.pc
> files are specifically supposed to cover for.

Yes, sorry, I didn't mean to suggest that the use of PKG_CHECK_MODULES
rather than AC_CHECK_LIB was wrong.  But I think you can just pass
similar if-found and if-not-found fragments.  Maybe something like:

 AC_CHECK_LIB([lzo2], [lzo1x_decompress], [zlib="$zlib -DHAVE_LZO1X -llzo2"])
+PKG_CHECK_MODULES([libzstd], [libzstd], [zlib="$zlib -DHAVE_ZSTD $libzstd_CFLAGS $libzstd_LIBS"])

> >  Printing the errors to configure's terminal is
> > not normally done, either.
> 
> With this you mean the AC_MSG_WARN()?

I don't mind there being a call to AC_MSG_WARN.  I don't think I have
a strong opinion about whether lack of zstd ought to produce a
warning.  If there ought to be a warning, then it ought to be made
with AC_MSG_WARN, indeed.

I mean the inclusion of $libzstd_PKG_ERRORS in the output.

> I'm okay to drop it; I was actually half tempted to myself already,
> but thought having it would be better in line with
> PKG_CHECK_MODULES() when not passed a 4th argument (where it gets
> quite verbose, but of course also fails the configure process
> altogether).

Does it ?  Admittedly the documentation I found in pkg.m4 for these
PKG_* macros doesn't say what the default is for ACTION-IF-NOT-FOUND
but it would surely parallel all the autoconf-provided macros where
the default is a no-op.  I read the autoconf output in your patch
(where admitteedly you pass [true]) and that seems to support my
supposition.

If you want a warning I think it should be a call to AC_MSG_WARN in
ACTION-IF-NOT-FOUND.

> > I don't understand why there is an x86-specific angle here.
> 
> On a "normal" libxenguest build decompression is available
> only on x86, because of
> 
> SRCS-$(CONFIG_X86)     += xg_dom_bzimageloader.c

Oh!

> Hence the dependencies thereof also only ought to need
> checking on x86.

I see.  Hmm.  TBH this seems anomalous.  I would prefer to keep the
configure test and expect that eventually some non-x86 folsk will
decide to turn this on there too.

This suggests to me that a warning for missing zstd is not necessarily
a good idea unless it is conditional for x86.

> I have to admit I'm uncertain about the stubdom build. I was
> merely implying that if decompression is unavailable in "normal"
> builds outside of x86, then _if_ non-x86 builds of stubdom exist
> in the first place, decompression code there is at best dead
> (the quoted restriction from Makefile applies in this case too,
> and hence I can't see callers of that code, despite
> 
> ifeq ($(CONFIG_LIBXC_MINIOS),y)
> SRCS-y                 += xg_dom_decompress_unsafe.c
> SRCS-y                 += xg_dom_decompress_unsafe_bzip2.c
> SRCS-y                 += xg_dom_decompress_unsafe_lzma.c
> SRCS-y                 += xg_dom_decompress_unsafe_lzo1x.c
> SRCS-y                 += xg_dom_decompress_unsafe_xz.c
> SRCS-y                 += xg_dom_decompress_unsafe_zstd.c
> endif
> 
> not restricting it to x86).

I think there is no mini-os and no stubdom build on ARM.  I don't
think this is necessarily for any particularly principled reason
except that minios in particular is not so easy to port.

So that would explain why the build isn't broken despite this
inconsistency.

> >> This follows the logic used for other decompression methods utilizing an
> >> external library, albeit here we can't ignore the 32-bit size field
> >> appended to the compressed image - its presence causes decompression to
> >> fail. Leverage the field instead to allocate the output buffer in one
> >> go, i.e. without incrementally realloc()ing.
> > 
> >> +    insize = *size - 4;
> >> +    outsize = *(uint32_t *)(*blob + insize);
> > 
> > Potentiallty unaligned access.  IDK if this kind of thing is thought
> > OK in hypervisor code but it it's not sufficiently portable for tools.
> 
> Also a possible endianness issue, yes.

The endianness issue at least just means "this code doesn't work and
will always reject images".  The alignment issue might mean "feeding
a corrupted image file will crash your management daemon".

IDK what the zstd-defined endianness is.  I guess it must be LE for
your patch to work on x86.

> Since as per above this
> code gets used on x86 only, I thought this would be fine at least
> for now.

I think that's too much of a boobytrap to leave in the code.

> In fact before using this simplistic approach I did
> check whether xg_dom_bzimageloader.c had suitable abstraction
> available, yet I couldn't spot any.

How unfortunate.  I have also hunted for some existing code and also
didn't find anything suitably general.

I did find this, open-coded in xg_dom_core.c:xc_dom_check_gzip:

    unziplen = (size_t)gzlen[3] << 24 | gzlen[2] << 16 | gzlen[1] << 8 | gzlen[0];

Maybe this could be moved to a macro or inline function in
xg_private.h ?

> > The rest of this code looks OK to me.  I spent quite a while trying to
> > figure out the memory management / ownership rules for the interface
> > to these decompression functions.  This business where they all
> > allocate a new buffer, and overwrite their input pointer with it (but
> > only on success), is pretty nasty.  I wasn't able to find where the
> > old buffer was freed.  But the other decompressors all seem to work
> > the same way.  Urgh.  In summary: nasty, but, this new code seems to
> > follow the existing convension.
> 
> Yes, this isn't pretty, but looks to have served the purpose. I'd
> be happy to see it improved, but I'm afraid beyond what's in this
> series I won't have much time to help the overall situation.

Quite so.  I'm certainly not suggesting that untangling that is a
blocker for this patch.

Thanks,
Ian.

