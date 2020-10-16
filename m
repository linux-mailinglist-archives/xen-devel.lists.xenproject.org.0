Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDA628FEBA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 08:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7793.20555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTJiG-00085g-K2; Fri, 16 Oct 2020 06:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7793.20555; Fri, 16 Oct 2020 06:59:40 +0000
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
	id 1kTJiG-00085F-Gv; Fri, 16 Oct 2020 06:59:40 +0000
Received: by outflank-mailman (input) for mailman id 7793;
 Fri, 16 Oct 2020 06:59:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTJiF-000857-Ds
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:59:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de6f40f1-b3d7-4445-a692-5960ecd1428e;
 Fri, 16 Oct 2020 06:59:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAA82B1BF;
 Fri, 16 Oct 2020 06:59:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTJiF-000857-Ds
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:59:39 +0000
X-Inumbo-ID: de6f40f1-b3d7-4445-a692-5960ecd1428e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id de6f40f1-b3d7-4445-a692-5960ecd1428e;
	Fri, 16 Oct 2020 06:59:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602831578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oeT/manrINgkwYzE13nnGNV3XDrRLBaj7Dz4WwYFlwQ=;
	b=dqhdYA4iroe674ID1PHMoWK6p1App7hC0WmnWfqIqhqcnV5PcBk6Lm5VbQWGhGIDQ69o+f
	/TurQ8ZoWNPkGHDminVFkjYcWChQegF0GrEY0jVFncU853EcOlNd4xTSIEz1cRBxtePoWB
	reF4HPuERV6Ym1ecvAasurjmaV6myVA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DAA82B1BF;
	Fri, 16 Oct 2020 06:59:37 +0000 (UTC)
Subject: Re: Getting rid of (many) dynamic link creations in the xen build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <85f1eea2-0c8b-de06-b9d8-69f9a7e34ea8@suse.com>
 <5c9d5d97-10c4-f5de-e4eb-7ae933706240@suse.com>
 <0df66f1c-a02d-819c-0f05-8a7b26728e87@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0523587-8209-b4b0-08fb-d50ed365051b@suse.com>
Date: Fri, 16 Oct 2020 08:59:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <0df66f1c-a02d-819c-0f05-8a7b26728e87@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.10.2020 12:49, Jürgen Groß wrote:
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
> Another option would be to create the needed links from ./configure
> instead of committing them to git.

Ah yes, this would indeed seem better to me. Not sure though whether
that's conceptually a legitimate thing to do.

Jan

