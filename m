Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0426302651
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 15:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74105.133183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l42tS-0006VL-OB; Mon, 25 Jan 2021 14:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74105.133183; Mon, 25 Jan 2021 14:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l42tS-0006Uw-Ko; Mon, 25 Jan 2021 14:31:02 +0000
Received: by outflank-mailman (input) for mailman id 74105;
 Mon, 25 Jan 2021 14:31:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l42tR-0006Ur-F0
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 14:31:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31782bd7-3d08-41b5-b760-ff95baa9dfb6;
 Mon, 25 Jan 2021 14:30:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14E13AC45;
 Mon, 25 Jan 2021 14:30:59 +0000 (UTC)
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
X-Inumbo-ID: 31782bd7-3d08-41b5-b760-ff95baa9dfb6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611585059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/229Yn17G5yfQNXhb3n86e83YzkqNmBoHWv08p6t+E=;
	b=hLVXNKYh/SilSR5ZWIn6hclIjX2Vi7Xu16ooHiSMX+ELbkRc+fliSOMepfj800A22g4OMa
	Jb7+P1ernguNmwnrvdkO+2+IOCK1oAvUSZiChX32iM/eBu3+lRTEvin4uV7+DdJ+Ab4Xv+
	vQC7vVSKZmw8PRWsV3rX0Us4DhV/iB4=
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
 <d541007c-9537-ba53-02f7-8ea90e9c89cf@suse.com>
 <24590.52459.194044.857442@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6895299a-f2fd-7090-d0fa-dc7b2e54d1ba@suse.com>
Date: Mon, 25 Jan 2021 15:30:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24590.52459.194044.857442@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 14:51, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels"):
>> On 25.01.2021 12:30, Ian Jackson wrote:
>>>> As far as configure.ac goes, I'm pretty sure there is a better (more
>>>> "standard") way of using PKG_CHECK_MODULES().
>>>
>>> Yes, what you have done is rather unidiomatic and seems to rely on
>>> undocumented internals of the PKG_*. macros.
>>
>> Which specific part of the construct are you referring to?
>> I didn't think I used anything outright undocumented. Of
>> course I did have some trouble finding suitable docs, but in
>> the end I managed to locate at least something that I was
>> able to grok.
> 
> I mean, the parts where you examine libzstd_PKG_ERRORS.

The only thing I make use of is it being (non-)empty. Do you
really think that's a problem?

>>>  Why not do as was done for bz2, lzma, lzo2 ?
>>
>> Because the pkg-config approach is more flexible - aiui
>> AC_CHECK_HEADER() and AC_CHECK_LIB() won't find a
>> dependency when sitting in some custom place, which the *.pc
>> files are specifically supposed to cover for.
> 
> Yes, sorry, I didn't mean to suggest that the use of PKG_CHECK_MODULES
> rather than AC_CHECK_LIB was wrong.  But I think you can just pass
> similar if-found and if-not-found fragments.  Maybe something like:
> 
>  AC_CHECK_LIB([lzo2], [lzo1x_decompress], [zlib="$zlib -DHAVE_LZO1X -llzo2"])
> +PKG_CHECK_MODULES([libzstd], [libzstd], [zlib="$zlib -DHAVE_ZSTD $libzstd_CFLAGS $libzstd_LIBS"])

No, that's what I did initially, resulting in libzstd becoming
a strict requirement (i.e. configure failing if it's absent),
as reported by Michael Young.

>>>  Printing the errors to configure's terminal is
>>> not normally done, either.
>>
>> With this you mean the AC_MSG_WARN()?
> 
> I don't mind there being a call to AC_MSG_WARN.  I don't think I have
> a strong opinion about whether lack of zstd ought to produce a
> warning.  If there ought to be a warning, then it ought to be made
> with AC_MSG_WARN, indeed.
> 
> I mean the inclusion of $libzstd_PKG_ERRORS in the output.

I see no point in the warning without including this. In fact
I added the AC_MSG_WARN() just so that the contents of this
variable (and hence an indication to the user of what to do)
was easily accessible.

>> I'm okay to drop it; I was actually half tempted to myself already,
>> but thought having it would be better in line with
>> PKG_CHECK_MODULES() when not passed a 4th argument (where it gets
>> quite verbose, but of course also fails the configure process
>> altogether).
> 
> Does it ?  Admittedly the documentation I found in pkg.m4 for these
> PKG_* macros doesn't say what the default is for ACTION-IF-NOT-FOUND
> but it would surely parallel all the autoconf-provided macros where
> the default is a no-op.  I read the autoconf output in your patch
> (where admitteedly you pass [true]) and that seems to support my
> supposition.

The [true] in the 4th argument is there to prevent the default
behavior of failing the configure process altogether. You'd
see autoconf's default there only if the argument was absent.

> If you want a warning I think it should be a call to AC_MSG_WARN in
> ACTION-IF-NOT-FOUND.

I didn't to avoid the nesting of things yielding even harder
to read code.

>>> I don't understand why there is an x86-specific angle here.
>>
>> On a "normal" libxenguest build decompression is available
>> only on x86, because of
>>
>> SRCS-$(CONFIG_X86)     += xg_dom_bzimageloader.c
> 
> Oh!
> 
>> Hence the dependencies thereof also only ought to need
>> checking on x86.
> 
> I see.  Hmm.  TBH this seems anomalous.  I would prefer to keep the
> configure test and expect that eventually some non-x86 folsk will
> decide to turn this on there too.
> 
> This suggests to me that a warning for missing zstd is not necessarily
> a good idea unless it is conditional for x86.

Well, okay, I'll drop the warning then.

>>>> +    insize = *size - 4;
>>>> +    outsize = *(uint32_t *)(*blob + insize);
>>>
>>> Potentiallty unaligned access.  IDK if this kind of thing is thought
>>> OK in hypervisor code but it it's not sufficiently portable for tools.
>>
>> Also a possible endianness issue, yes.
> 
> The endianness issue at least just means "this code doesn't work and
> will always reject images".  The alignment issue might mean "feeding
> a corrupted image file will crash your management daemon".
> 
> IDK what the zstd-defined endianness is.  I guess it must be LE for
> your patch to work on x86.

This field is not part of the zstd output, but gets appended
to the output by the Linux kernel build system. IOW its
endianness gets defined by Linux; the text in the respective
Makefile says "littleendian".

>> Since as per above this
>> code gets used on x86 only, I thought this would be fine at least
>> for now.
> 
> I think that's too much of a boobytrap to leave in the code.
> 
>> In fact before using this simplistic approach I did
>> check whether xg_dom_bzimageloader.c had suitable abstraction
>> available, yet I couldn't spot any.
> 
> How unfortunate.  I have also hunted for some existing code and also
> didn't find anything suitably general.
> 
> I did find this, open-coded in xg_dom_core.c:xc_dom_check_gzip:
> 
>     unziplen = (size_t)gzlen[3] << 24 | gzlen[2] << 16 | gzlen[1] << 8 | gzlen[0];

Okay, I'll copy that then.

Jan

