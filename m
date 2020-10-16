Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED4D28FE99
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 08:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7788.20531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTJbZ-0007jh-HM; Fri, 16 Oct 2020 06:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7788.20531; Fri, 16 Oct 2020 06:52:45 +0000
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
	id 1kTJbZ-0007jI-Dl; Fri, 16 Oct 2020 06:52:45 +0000
Received: by outflank-mailman (input) for mailman id 7788;
 Fri, 16 Oct 2020 06:52:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTJbX-0007jD-H8
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:52:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70b5cef0-477e-4eab-b283-597742a6446a;
 Fri, 16 Oct 2020 06:52:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0628CAF30;
 Fri, 16 Oct 2020 06:52:41 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTJbX-0007jD-H8
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:52:43 +0000
X-Inumbo-ID: 70b5cef0-477e-4eab-b283-597742a6446a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 70b5cef0-477e-4eab-b283-597742a6446a;
	Fri, 16 Oct 2020 06:52:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602831161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FU7VEYcmI1s3fO2D5qXBOl6HFx1yAiqrlE49qMsQuI8=;
	b=pCyLFIf8DqPUs5vNScYGA3RX6wCofxVM/9ofjeSTHhUHmDkmFNe3qqAdchBoSGOD+tleZa
	n1Xh4UJ3WxJakYgHM+yfwA63oKJCH2WpG7UtvJ5NHqROxeFX2nE1gTSkveWf2dRrFSDPc7
	Rl77hdR2Q+a1JGcw2Zvh+7n5YENZbeU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0628CAF30;
	Fri, 16 Oct 2020 06:52:41 +0000 (UTC)
Subject: Re: Getting rid of (many) dynamic link creations in the xen build
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <85f1eea2-0c8b-de06-b9d8-69f9a7e34ea8@suse.com>
 <5c9d5d97-10c4-f5de-e4eb-7ae933706240@suse.com>
 <abd6d752-9a7f-fcf6-3273-82512c590151@suse.com>
 <ad909278-8ab0-dc7a-2004-5efd08e5acbd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <efb22794-7573-3fe8-516e-8f7a817341af@suse.com>
Date: Fri, 16 Oct 2020 08:52:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <ad909278-8ab0-dc7a-2004-5efd08e5acbd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.10.2020 22:52, Andrew Cooper wrote:
> On 15/10/2020 11:41, Jürgen Groß wrote:
>> On 15.10.20 12:09, Jan Beulich wrote:
>>> On 15.10.2020 09:58, Jürgen Groß wrote:
>>>> After a short discussion on IRC yesterday I promised to send a mail
>>>> how I think we could get rid of creating dynamic links especially
>>>> for header files in the Xen build process.
>>>>
>>>> This will require some restructuring, the amount will depend on the
>>>> selected way to proceed:
>>>>
>>>> - avoid links completely, requires more restructuring
>>>> - avoid only dynamically created links, i.e. allowing some static
>>>>     links which are committed to git
>>>
>>> While I like the latter better, I'd like to point out that not all
>>> file systems support symlinks, and hence the repo then couldn't be
>>> stored on (or the tarball expanded onto) such a file system. Note
>>> that this may be just for viewing purposes - I do this typically at
>>> home -, i.e. there's no resulting limitation from the build process
>>> needing symlinks. Similarly, once we fully support out of tree
>>> builds, there wouldn't be any restriction from this as long as just
>>> the build tree is placed on a capable file system.
>>>
>>> As a result I'd like to propose variant 2´: Reduce the number of
>>> dynamically created symlinks to a minimum. This said, I have to
>>> admit that I haven't really understood yet why symlinks are bad.
>>> They exist for exactly such purposes, I would think.
>>
>> Not the symlinks as such, but the dynamically created ones seem to be
>> a problem, as we stumble upon those again and again.
> 
> We have multiple build system bugs every release to do with dynamically
> generated symlinks.  Given that symlinks aren't a hard requirement, this
> is a massive price to pay, and time which could be better spent doing
> other other things.
> 
> Also, they prohibit the ability to build from a read-only source dir.

In which way? In an out-of-tree build (see Linux) this gets created
in the build tree, not the source one. Or else ...

> The asm symlink in particular prevents any attempt to do concurrent
> builds of xen.  In some future, I'd love to be able to do concurrent
> out-of-tree builds of Xen on different architectures, because elapsed
> time to do this is one limiting factor of mine on pre-push sanity checks.

... this wouldn't already be possible there (including varying arch-es
built from the same source tree).

Jan

