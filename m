Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF383026EA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 16:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74152.133258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43ps-0003yy-P4; Mon, 25 Jan 2021 15:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74152.133258; Mon, 25 Jan 2021 15:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43ps-0003yZ-LJ; Mon, 25 Jan 2021 15:31:24 +0000
Received: by outflank-mailman (input) for mailman id 74152;
 Mon, 25 Jan 2021 15:31:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l43pr-0003yU-RZ
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 15:31:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ff64322-dca7-4a90-8169-12b4a6882b87;
 Mon, 25 Jan 2021 15:31:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 519C2ADE5;
 Mon, 25 Jan 2021 15:31:17 +0000 (UTC)
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
X-Inumbo-ID: 8ff64322-dca7-4a90-8169-12b4a6882b87
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611588677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=awA5OL2dY1LX87w/bvOQy5JT2kBeOdGKKEmvWJPa5mg=;
	b=IEh7SmZjXjqIQ3X8SEozGGzVbHqSkXgdLek36QNMTPIwXUYGDRD9kHg0VdZXk9hEN+JaK8
	q6R3DlJWa5Mg7HO9zR0EFUhMdsNOBrMEdW5AmBUkWJv1DvVoLqrQVukgHxcEDz5a5xw/Nq
	qY1te48JfpKmAltDHFpp+A5oWa8uaIc=
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
 <6895299a-f2fd-7090-d0fa-dc7b2e54d1ba@suse.com>
 <24590.56183.458644.60628@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e988e9e-f8c2-13cb-79a4-1d8ae4e8a403@suse.com>
Date: Mon, 25 Jan 2021 16:31:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24590.56183.458644.60628@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 15:53, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels"):
>> On 25.01.2021 14:51, Ian Jackson wrote:
>>> I mean, the parts where you examine libzstd_PKG_ERRORS.
>>
>> The only thing I make use of is it being (non-)empty. Do you
>> really think that's a problem?
> 
> It's highly unusual.   Conceivably it might be empty even if
> pkg-config failed.
> 
>>>  AC_CHECK_LIB([lzo2], [lzo1x_decompress], [zlib="$zlib -DHAVE_LZO1X -llzo2"])
>>> +PKG_CHECK_MODULES([libzstd], [libzstd], [zlib="$zlib -DHAVE_ZSTD $libzstd_CFLAGS $libzstd_LIBS"])
>>
>> No, that's what I did initially, resulting in libzstd becoming
>> a strict requirement (i.e. configure failing if it's absent),
>> as reported by Michael Young.
> 
> Well how about passing "true" for the fourth argument then ?

That I did try intermediately, but didn't ever post. It'll
screw up when libzstd_CFLAGS and libzstd_LIBS were provided
to override pkg-config. When you look at the expanded code,
this will end up with pkg_failed set to "untried" and still
take the error path. I.e. we wouldn't get the overridden
settings appended to $zlib.

>>> I mean the inclusion of $libzstd_PKG_ERRORS in the output.
>>
>> I see no point in the warning without including this. In fact
>> I added the AC_MSG_WARN() just so that the contents of this
>> variable (and hence an indication to the user of what to do)
>> was easily accessible.
> 
> This is not usual autoconf practice.  The usual approach is to
> consider that missing features are just to be dealt with with a
> minimum of fuss.

Which is why I made the description say what it says. Just
that - as per above - I don't see viable alternatives (yet).

>>> If you want a warning I think it should be a call to AC_MSG_WARN in
>>> ACTION-IF-NOT-FOUND.
>>
>> I didn't to avoid the nesting of things yielding even harder
>> to read code.
> 
> In your code it's nested too, just in an if rather than the in the
> macro argument - but with a separate condition.  Please do it the
> "usual autoconf way".

Pieces of shell code look to be permitted - a few lines down
from the addition to configure.ac there is a shell case
statement. Or are you telling me that's an abuse I shouldn't
follow? But then I still don't see how to sensibly replace
the construct, given the issue described further up.

>>> How unfortunate.  I have also hunted for some existing code and also
>>> didn't find anything suitably general.
>>>
>>> I did find this, open-coded in xg_dom_core.c:xc_dom_check_gzip:
>>>
>>>     unziplen = (size_t)gzlen[3] << 24 | gzlen[2] << 16 | gzlen[1] << 8 | gzlen[0];
>>
>> Okay, I'll copy that then.
> 
> Could you make a macro or inline function in xg_private.h[1] rather
> than open-coding a copy, please ?
> 
> [1] Or, if you prefer, a header with wider scope.

I can, but it feels wrong, in particular if I gave it a
generic looking name (get_unaligned_le32() or some such, if
I was to follow the kernel-originating(?) approach used in
the mini-os wrapping of the hypervisor decompressor code),
and something like get_linuxes_idea_of_uncompressed_size()
is also, well, not really nice. Especially if put in a
general header like xg_private.h (i.e. in this latter case
I'd rather see the helper have more narrow scope, but of
course introducing a new header just for this seems overkill
as well). Any more concrete suggestion would be appreciated
here.

Jan

