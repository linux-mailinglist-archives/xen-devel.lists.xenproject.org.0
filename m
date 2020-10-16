Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A241828FEB5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 08:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7791.20543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTJhE-0007yF-7W; Fri, 16 Oct 2020 06:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7791.20543; Fri, 16 Oct 2020 06:58:36 +0000
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
	id 1kTJhE-0007xp-3O; Fri, 16 Oct 2020 06:58:36 +0000
Received: by outflank-mailman (input) for mailman id 7791;
 Fri, 16 Oct 2020 06:58:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTJhC-0007xJ-7R
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:58:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83dd5e2e-d7b7-4bcb-9f4c-15e5c30e5653;
 Fri, 16 Oct 2020 06:58:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1434FAD77;
 Fri, 16 Oct 2020 06:58:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTJhC-0007xJ-7R
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:58:34 +0000
X-Inumbo-ID: 83dd5e2e-d7b7-4bcb-9f4c-15e5c30e5653
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 83dd5e2e-d7b7-4bcb-9f4c-15e5c30e5653;
	Fri, 16 Oct 2020 06:58:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602831512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42HArfaYBIcl6YoU2jHa+wxK8XDzY3WpSDQi8yRNQEA=;
	b=FtIrSmEEPd1QkvcCEsb5GZUIiYfj4dXx7JM0ecfXDkxIpOW2htE2R5+NWBtAJjO1xbuyQd
	S/88UCE37USanUZWJ7FD1r2CR38RYTmZWS27kblLj8USksi1kTV7AzkaiE5bOryg/0YcM6
	/OvsUPRojCq6xttqTBpVynO7k3y1sro=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1434FAD77;
	Fri, 16 Oct 2020 06:58:32 +0000 (UTC)
Subject: Re: Getting rid of (many) dynamic link creations in the xen build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <85f1eea2-0c8b-de06-b9d8-69f9a7e34ea8@suse.com>
 <5c9d5d97-10c4-f5de-e4eb-7ae933706240@suse.com>
 <abd6d752-9a7f-fcf6-3273-82512c590151@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <973eca36-d278-4c82-627a-e0d80a6055d5@suse.com>
Date: Fri, 16 Oct 2020 08:58:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <abd6d752-9a7f-fcf6-3273-82512c590151@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.10.2020 12:41, Jürgen Groß wrote:
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
>>>     links which are committed to git
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

Well, the machinery to get them put in place needs to be fixed
(and adjustments / additions be done more carefully). Taking
together with what Andrew has said, option 2´ would move us in
the same direction then.

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
>>>     Move all headers from xen/include/asm-<arch> to
>>>     xen/arch/<arch>/include/asm and add that path via "-I" flag to CFLAGS.
>>>     This has the other nice advantages that most architecture specific
>>>     files are now in xen/arch (apart from the public headers) and that we
>>>     can even add generic fallback headers in xen/include/asm in case an
>>>     arch doesn't need a specific header file.
>>
>> Iirc Andrew suggested years ago that we follow Linux in this regard
>> (and XTF already does). My only concern here is the churn this will
>> cause for backports.
> 
> Changing a directory name in a patch isn't that hard, IMO.

It's not hard at all, no, but it still takes some of the most precious
resource we have: time.

>>> - tools/include/xen/foreign -> tools/include/xen-foreign:
>>>     Get rid of tools/include/xen-foreign and generate the headers directly
>>>     in xen/include/public/foreign instead.
>>
>> Except that conceptually building in tools/ would better not alter
>> the xen/ subtree in any way.
> 
> I meant to generate the headers from the hypervisor build instead.

This would make the tools/ build dependent upon xen/ having got
built first aiui, which I think we want to avoid.

>>> - tools/include/xen/lib/<arch>/* -> xen/include/xen/lib/<arch>/*:
>>>     Move xen/include/xen/lib/<arch> to xen/include/tools/lib/<arch> and
>>>     add "-Ixen/include/tools" to the CFLAGS of tools.
>>
>> Why not -Ixen/include/xen without any movement? Perhaps because
> 
> This would open up most of the hypervisor private headers to be
> easily includable by tools.

Without the xen/ prefix, yes. But if someone wants to violate the
naming scheme to get at them, adding a suitable number of ../ will
also work as soon as symlinks aren't being used, or symlinks of
full directories are used instead of ones referencing individual
files.

Jan

