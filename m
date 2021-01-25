Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250C730285B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 18:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74203.133330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45ES-0004b6-TY; Mon, 25 Jan 2021 17:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74203.133330; Mon, 25 Jan 2021 17:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45ES-0004ah-PN; Mon, 25 Jan 2021 17:00:52 +0000
Received: by outflank-mailman (input) for mailman id 74203;
 Mon, 25 Jan 2021 17:00:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l45ER-0004ac-0v
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 17:00:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 413ece14-41ce-4ee8-9969-893f8acbd0c1;
 Mon, 25 Jan 2021 17:00:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9EF69AD4E;
 Mon, 25 Jan 2021 17:00:48 +0000 (UTC)
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
X-Inumbo-ID: 413ece14-41ce-4ee8-9969-893f8acbd0c1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611594048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dtz5lpvmkI+jy6FX1QWuJtCt3NpfGtc/CfAP0dUIld0=;
	b=uwKsIjoLgInIV++Z7jBKM1zyhP5fnHKT0rErg+Ru9xtEnk3yOxs3yNn4C7ZApZkO03x3AK
	AnTmr218LpyBdECD9qL2bLBjX/fpiv3+QHeZAvSp6Ad6GDEoxSvvFLridIzjRZrQ19kEng
	EctggRe5AzovB0CwB2IF9HjDkFnZkfM=
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
 <6e988e9e-f8c2-13cb-79a4-1d8ae4e8a403@suse.com>
 <24590.61205.393750.544294@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd06d04f-f1c4-0087-b46e-34648585fb5a@suse.com>
Date: Mon, 25 Jan 2021 18:00:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24590.61205.393750.544294@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 17:17, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2.5 1/5] libxenguest: support zstd compressed kernels"):
>> On 25.01.2021 15:53, Ian Jackson wrote:
>>> Well how about passing "true" for the fourth argument then ?
>>
>> That I did try intermediately, but didn't ever post. It'll
>> screw up when libzstd_CFLAGS and libzstd_LIBS were provided
>> to override pkg-config. When you look at the expanded code,
>> this will end up with pkg_failed set to "untried" and still
>> take the error path. I.e. we wouldn't get the overridden
>> settings appended to $zlib.
> 
> I infer you're reading the autoonf output.  I think pkg_failed is
> something to do with tracking whether pkg-config exists at all.  In
> general, reading autoconf output is an act of desperation when RTFM
> and so on fails.  The output is typically much more complicated than
> the input and can be quite confusing.

Well, after Michael's report I had to understand why the
construct behaved the way it does (and not the way I
thought would be sensible), and short of any documentation
clearly saying so I had to go look at the generated shell
code. Which made me notice the apparently (see below)
unhelpful behavior wrt user overrides.

> I noticed that configure.ac fails to say PKG_PROG_PKG_CONFIG contrary
> to the imprecations in the documentation.  For example, for
> PKG_CHECK_MODULES we have:
> 
>  | # Note that if there is a possibility the first call to
>  | # PKG_CHECK_MODULES might not happen, you should be sure to include
>  | # an explicit call to PKG_PROG_PKG_CONFIG in your configure.ac
>  
> Indeed our first call to PKG_CHECK_* in the existing configure.ac is
> within an if and there is no call to PKG_PROG_PKG_CONFIG.  I think one
> should be added probably somewhere near the top (eg, just after
> AX_XEN_EXPAND_CONFIG).

Probably, but I don't think I should do so here. I did ask
about making the compression checks x86-only, and that would
be the point where I would have seen the need. But you've
asked for the checks to remain arch-independent. 

> I'm not sure exactly what you mean in your paragraph I quote above.  I
> think you mean that if the user supplies the options on the command
> line bugt pkg-config is absent ?

Ah, looks like I indeed got mislead by the bad indentation
of the generate shell code. So let me try again with [true]
as the 4th argument.

>  I don't understand why this
> situation should be handled differently for zstd than for any of the
> other calls to *PKG* (glib, pixman, libnl).

The difference is that glib and pixman aren't optional (if
building qemu), i.e. we want configure to fail if they can't
be found or are too old.

> Perhaps you experienced some issue which would have been fixed by the
> addition of the missing PKG_PROG_PKG_CONFIG ?

I don't think so, no, as I've not tried configuring in a way
where the earlier PKG_CHECK_MODULES() would be bypassed.

>>>>> If you want a warning I think it should be a call to AC_MSG_WARN in
>>>>> ACTION-IF-NOT-FOUND.
>>>>
>>>> I didn't to avoid the nesting of things yielding even harder
>>>> to read code.
>>>
>>> In your code it's nested too, just in an if rather than the in the
>>> macro argument - but with a separate condition.  Please do it the
>>> "usual autoconf way".
>>
>> Pieces of shell code look to be permitted - a few lines down
>> from the addition to configure.ac there is a shell case
>> statement. Or are you telling me that's an abuse I shouldn't
>> follow? But then I still don't see how to sensibly replace
>> the construct, given the issue described further up.
> 
> I don't understand what you are getting at.  I think you must have
> misunderstood me.
> 
> You explained that you preferred not to use the 4th argument,
> ACTION-IF-NOT-FOUND, "to avoid nesting".  I was trying to say that I
> didn't think this was a good reason and that instead putting the code
> in a separate conditional is not warranted here (and not idiomatic).
> 
> There is nothing wrong[1] with including (cautious) shell code in
> configure.ac, so that was not part of my argument.

I think the confusion results from my misunderstanding of when
"untried" would result, see above. For that reason I did
consider it necessary to evaluate things once _after_ the
entire construct, rather than inside.

>>>>>     unziplen = (size_t)gzlen[3] << 24 | gzlen[2] << 16 | gzlen[1] << 8 | gzlen[0];
>>>>
>>>> Okay, I'll copy that then.
>>>
>>> Could you make a macro or inline function in xg_private.h[1] rather
>>> than open-coding a copy, please ?
>>>
>>> [1] Or, if you prefer, a header with wider scope.
>>
>> I can, but it feels wrong, in particular if I gave it a
>> generic looking name (get_unaligned_le32() or some such,
> 
> That would seem perfect to me.  I don't know what would be wrong
> with it.

Using this (most?) natural name has two issues in my view:
For one, it'll likely cause conflicts with how other code
(using hypervisor files) gets built. And then I consider it
odd to have just one out of a larger set of functions, but
I would consider it odd as well if I had to introduce them
all right here.

>>>>> I mean the inclusion of $libzstd_PKG_ERRORS in the output.
>>>>
>>>> I see no point in the warning without including this. In fact
>>>> I added the AC_MSG_WARN() just so that the contents of this
>>>> variable (and hence an indication to the user of what to do)
>>>> was easily accessible.
>>>
>>> This is not usual autoconf practice.  The usual approach is to
>>> consider that missing features are just to be dealt with with a
>>> minimum of fuss.
>>
>> Which is why I made the description say what it says. Just
>> that - as per above - I don't see viable alternatives (yet).
> 
> I think we had concluded not to print a warning ?

Yes. Even in the projected new form of using the construct I
don't intend to change the description's wording, as the
intended use of [true] still looks like that can't be intended
usage. IOW my remark extended beyond the warning; I'm sorry if
this did end up confusing because you were referring to just
the warning.

Jan

