Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A2830250E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 13:43:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74066.133111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l41CX-0004d6-Hb; Mon, 25 Jan 2021 12:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74066.133111; Mon, 25 Jan 2021 12:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l41CX-0004ch-E3; Mon, 25 Jan 2021 12:42:37 +0000
Received: by outflank-mailman (input) for mailman id 74066;
 Mon, 25 Jan 2021 12:42:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l41CV-0004cc-QO
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 12:42:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dae24bd6-1d6e-4489-a423-0948b1f9c35a;
 Mon, 25 Jan 2021 12:42:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABB6EAF23;
 Mon, 25 Jan 2021 12:42:33 +0000 (UTC)
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
X-Inumbo-ID: dae24bd6-1d6e-4489-a423-0948b1f9c35a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611578553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=18WX+0Vif/IawecigNCcnryWqDWfKWSTlk7Ru5oyvr0=;
	b=vIt1E6/CyOPYUQv4MeS019e2x9uYXsaeIQ5G5V2wOAnt7EYCBIo7NZ9tfJoQftaL2jctXk
	S5ltXizWQ76tL9faNNJeCAMs0QWYG+TYqbmBF9Ek7IFTI13dkxvHYprUmMTh3/LgpdaFTo
	DSQxO3nMSThOvFuFqEJD4Tn96QOucko=
Subject: Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 M A Young <m.a.young@durham.ac.uk>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <f23d219f-ea52-e472-b95f-2a7e359d44cc@suse.com>
 <24590.44019.51460.33930@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d541007c-9537-ba53-02f7-8ea90e9c89cf@suse.com>
Date: Mon, 25 Jan 2021 13:42:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24590.44019.51460.33930@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 12:30, Ian Jackson wrote:
> Hi.  Thanks for this.  Firstly, RM hat: this is the tools half of zstd
> decompression support which I think is a blocker for the release.  So
> I am going to waive the last posting date requirement.  Therefore,
> 
> Assuming it's committed this week:
> 
> Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks.

> Secondly, I think it would be sensible for me to review it:
> 
>> As far as configure.ac goes, I'm pretty sure there is a better (more
>> "standard") way of using PKG_CHECK_MODULES().
> 
> Yes, what you have done is rather unidiomatic and seems to rely on
> undocumented internals of the PKG_*. macros.

Which specific part of the construct are you referring to?
I didn't think I used anything outright undocumented. Of
course I did have some trouble finding suitable docs, but in
the end I managed to locate at least something that I was
able to grok.

>  Why not do as was done for bz2, lzma, lzo2 ?

Because the pkg-config approach is more flexible - aiui
AC_CHECK_HEADER() and AC_CHECK_LIB() won't find a
dependency when sitting in some custom place, which the *.pc
files are specifically supposed to cover for.

>  Printing the errors to configure's terminal is
> not normally done, either.

With this you mean the AC_MSG_WARN()? I'm okay to drop it; I
was actually half tempted to myself already, but thought having
it would be better in line with PKG_CHECK_MODULES() when not
passed a 4th argument (where it gets quite verbose, but of
course also fails the configure process altogether).

>>  The construct also gets
>> put next to the other decompression library checks, albeit I think they
>> all ought to be x86-specific (e.g. placed in the existing case block a
>> few lines down).
> 
> I don't understand why there is an x86-specific angle here.

On a "normal" libxenguest build decompression is available
only on x86, because of

SRCS-$(CONFIG_X86)     += xg_dom_bzimageloader.c

Hence the dependencies thereof also only ought to need
checking on x86.

I have to admit I'm uncertain about the stubdom build. I was
merely implying that if decompression is unavailable in "normal"
builds outside of x86, then _if_ non-x86 builds of stubdom exist
in the first place, decompression code there is at best dead
(the quoted restriction from Makefile applies in this case too,
and hence I can't see callers of that code, despite

ifeq ($(CONFIG_LIBXC_MINIOS),y)
SRCS-y                 += xg_dom_decompress_unsafe.c
SRCS-y                 += xg_dom_decompress_unsafe_bzip2.c
SRCS-y                 += xg_dom_decompress_unsafe_lzma.c
SRCS-y                 += xg_dom_decompress_unsafe_lzo1x.c
SRCS-y                 += xg_dom_decompress_unsafe_xz.c
SRCS-y                 += xg_dom_decompress_unsafe_zstd.c
endif

not restricting it to x86).

>> This follows the logic used for other decompression methods utilizing an
>> external library, albeit here we can't ignore the 32-bit size field
>> appended to the compressed image - its presence causes decompression to
>> fail. Leverage the field instead to allocate the output buffer in one
>> go, i.e. without incrementally realloc()ing.
> 
>> +    insize = *size - 4;
>> +    outsize = *(uint32_t *)(*blob + insize);
> 
> Potentiallty unaligned access.  IDK if this kind of thing is thought
> OK in hypervisor code but it it's not sufficiently portable for tools.

Also a possible endianness issue, yes. Since as per above this
code gets used on x86 only, I thought this would be fine at least
for now. In fact before using this simplistic approach I did
check whether xg_dom_bzimageloader.c had suitable abstraction
available, yet I couldn't spot any.

> The rest of this code looks OK to me.  I spent quite a while trying to
> figure out the memory management / ownership rules for the interface
> to these decompression functions.  This business where they all
> allocate a new buffer, and overwrite their input pointer with it (but
> only on success), is pretty nasty.  I wasn't able to find where the
> old buffer was freed.  But the other decompressors all seem to work
> the same way.  Urgh.  In summary: nasty, but, this new code seems to
> follow the existing convension.

Yes, this isn't pretty, but looks to have served the purpose. I'd
be happy to see it improved, but I'm afraid beyond what's in this
series I won't have much time to help the overall situation.

Jan

