Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DF28FA50
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 22:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7741.20383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTAFH-00052z-Tf; Thu, 15 Oct 2020 20:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7741.20383; Thu, 15 Oct 2020 20:53:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTAFH-00052a-Q8; Thu, 15 Oct 2020 20:53:07 +0000
Received: by outflank-mailman (input) for mailman id 7741;
 Thu, 15 Oct 2020 20:53:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kTAFG-00052V-Bg
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 20:53:06 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b282f8b-bde0-4e56-a135-fcbb19191e26;
 Thu, 15 Oct 2020 20:53:04 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LoCs=DW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kTAFG-00052V-Bg
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 20:53:06 +0000
X-Inumbo-ID: 9b282f8b-bde0-4e56-a135-fcbb19191e26
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9b282f8b-bde0-4e56-a135-fcbb19191e26;
	Thu, 15 Oct 2020 20:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602795185;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=/RrzrOoo+RYQA/Og0Sa6N8M5S4GugatRwPXCV5pJh4c=;
  b=L3MIgksjNdpxD7twSVqaWUCkhCu4Q5oFagSty5fcbs3k5SaMu/qw4gF3
   RBBB4tuX4Py7tZJo/rfO3dIURxdVcexBXseonGRAIXZH819OcS3DiTbQX
   oi3EKWhuHm+xG0HSv8NL3svKMKtvSUBI7p+VdGswHhr+RZ8xApeCJI4EO
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LdCh5F02p4Sr7dmSiuxc4BPwRSGzFbNahRc/1+BMwlyqq3SN4CMt1GkzdWj64VwDIyEnbw4/T6
 Xfxace0VTwwTmw9f6mV0iqvG9r+jMmSBEsoYa5tmmBoeZuNySJz/DMbMS97Hb/VQK/aptuA4v4
 wiIXUOFCgagcew8Z6LC2s3VqSoJ5FAercYzcPY12iGkz9NeFAWwn/bD6ulB5wpEv1nJWIbg3yx
 BonjVHlJ13RvEQwKLd979AMTWt7VZ+D/8Kz4JuaX9ZIcKm801WTxfQWAWfgUdaXfZuXk6diGrY
 2qg=
X-SBRS: 2.5
X-MesageID: 29122980
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,380,1596513600"; 
   d="scan'208";a="29122980"
Subject: Re: Getting rid of (many) dynamic link creations in the xen build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>
References: <85f1eea2-0c8b-de06-b9d8-69f9a7e34ea8@suse.com>
 <5c9d5d97-10c4-f5de-e4eb-7ae933706240@suse.com>
 <abd6d752-9a7f-fcf6-3273-82512c590151@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ad909278-8ab0-dc7a-2004-5efd08e5acbd@citrix.com>
Date: Thu, 15 Oct 2020 21:52:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <abd6d752-9a7f-fcf6-3273-82512c590151@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 15/10/2020 11:41, Jürgen Groß wrote:
> On 15.10.20 12:09, Jan Beulich wrote:
>> On 15.10.2020 09:58, Jürgen Groß wrote:
>>> After a short discussion on IRC yesterday I promised to send a mail
>>> how I think we could get rid of creating dynamic links especially
>>> for header files in the Xen build process.
>>>
>>> This will require some restructuring, the amount will depend on the
>>> selected way to proceed:
>>>
>>> - avoid links completely, requires more restructuring
>>> - avoid only dynamically created links, i.e. allowing some static
>>>     links which are committed to git
>>
>> While I like the latter better, I'd like to point out that not all
>> file systems support symlinks, and hence the repo then couldn't be
>> stored on (or the tarball expanded onto) such a file system. Note
>> that this may be just for viewing purposes - I do this typically at
>> home -, i.e. there's no resulting limitation from the build process
>> needing symlinks. Similarly, once we fully support out of tree
>> builds, there wouldn't be any restriction from this as long as just
>> the build tree is placed on a capable file system.
>>
>> As a result I'd like to propose variant 2´: Reduce the number of
>> dynamically created symlinks to a minimum. This said, I have to
>> admit that I haven't really understood yet why symlinks are bad.
>> They exist for exactly such purposes, I would think.
>
> Not the symlinks as such, but the dynamically created ones seem to be
> a problem, as we stumble upon those again and again.

We have multiple build system bugs every release to do with dynamically
generated symlinks.  Given that symlinks aren't a hard requirement, this
is a massive price to pay, and time which could be better spent doing
other other things.

Also, they prohibit the ability to build from a read-only source dir.

The asm symlink in particular prevents any attempt to do concurrent
builds of xen.  In some future, I'd love to be able to do concurrent
out-of-tree builds of Xen on different architectures, because elapsed
time to do this is one limiting factor of mine on pre-push sanity checks.

Personally, I'd prefer option 1 in the long run, but I've got no
problems with achieving option 2 as an intermediate goal.

>
>>
>>> The difference between both variants is affecting the public headers
>>> in xen/include/public/: avoiding even static links would require to
>>> add another directory or to move those headers to another place in the
>>> tree (either use xen/include/public/xen/, or some other path */xen),
>>> leading to the need to change all #include statements in the hypervisor
>>> using <public/...> today.
>>>
>>> The need for the path to have "xen/" is due to the Xen library headers
>>> (which are installed on user's machines) are including the public
>>> hypervisor headers via "#include <xen/...>" and we can't change that
>>> scheme. A static link can avoid this problem via a different path, but
>>> without any link we can't do that.
>>>
>>> Apart from that decision, lets look which links are created today for
>>> accessing the header files (I'll assume my series putting the library
>>> headers to tools/include will be taken, so those links being created
>>> in staging today are not mentioned) and what can be done to avoid them:
>>>
>>> - xen/include/asm -> xen/include/asm-<arch>:
>>>     Move all headers from xen/include/asm-<arch> to
>>>     xen/arch/<arch>/include/asm and add that path via "-I" flag to
>>> CFLAGS.
>>>     This has the other nice advantages that most architecture specific
>>>     files are now in xen/arch (apart from the public headers) and
>>> that we
>>>     can even add generic fallback headers in xen/include/asm in case an
>>>     arch doesn't need a specific header file.
>>
>> Iirc Andrew suggested years ago that we follow Linux in this regard
>> (and XTF already does). My only concern here is the churn this will
>> cause for backports.
>
> Changing a directory name in a patch isn't that hard, IMO.

Also git (if you throw it the correct runes) can cope with this
automatically.

>>> - xen/arch/<arch>/efi/*.[ch] -> xen/common/efi/*.[ch]:
>>>     Use vpath for the *.c files and the "-I" flag for adding
>>> common/efi to
>>>     the include path in the xen/arch/<arch>/efi/Makefile.
>>
>> Fine with me.

Something which has been irritating me for years is that cscope doesn't
tollerate the efi symlinks.  This would be a great solution.

~Andrew

