Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A52780DF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 08:49:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLhXT-0000CK-GU; Fri, 25 Sep 2020 06:49:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLhXS-0000CF-3M
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 06:49:02 +0000
X-Inumbo-ID: c76dd606-0126-4a8d-9768-cf4445e801c7
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c76dd606-0126-4a8d-9768-cf4445e801c7;
 Fri, 25 Sep 2020 06:49:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601016539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SICii3pwdQEKzuRoawxOytLghNwI0V0PYuJf9FVP4mY=;
 b=ScuBPwFGRCi0VFkmza9d5AY/lRiep27s2a87XFOAdL5+BxsIHLH350oJlPuGbTFnqEk2I6
 8pc2eTWD/RKz2KpEvJd+T9UZkmMUNjkP8nU4VXeG7UGaq8wykj69PcA2Rfb6xevj5x0giK
 NWWLIN3wDoVZ2VKMnhoMgiew8QuNdVs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D35FEAB91;
 Fri, 25 Sep 2020 06:48:59 +0000 (UTC)
Subject: Re: [PATCH 03/11 RFC] gitignore: Add/Generalize entries
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <202009092153.089LrA2R039188@m5p.com>
 <afe1939c-01b9-b6c6-a4d7-9762664b9447@suse.com>
 <20200924214829.GA58232@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <abaa602b-5eef-d3a4-4bee-9360dcf57031@suse.com>
Date: Fri, 25 Sep 2020 08:49:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924214829.GA58232@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.09.2020 23:48, Elliott Mitchell wrote:
> On Thu, Sep 24, 2020 at 05:44:09PM +0200, Jan Beulich wrote:
>> On 02.09.2020 03:08, Elliott Mitchell wrote:
>>> @@ -33,12 +38,12 @@ cscope.po.out
>>>  .vscode
>>>  
>>>  dist
>>> -stubdom/*.tar.gz
>>>  
>>>  autom4te.cache/
>>>  config.log
>>>  config.status
>>>  config.cache
>>> +config.h
>>>  config/Toplevel.mk
>>>  config/Paths.mk
>>
>> While in userland config.h may indeed be a typically generated file,
>> there are three source files by this name under xen/. Patch 6 also
>> doesn't look to override this in any way for xen/. I think this wants
>> to move a level down, into tools/ and wherever else it may be
>> applicable.
> 
> Another possibility is Git isn't as aggressive with enforcing ignores as
> some other version control software is.  A file which matches a
> .gitignore pattern will not show up under "Untracked files" in
> `git status`; however, /modifying/ a file which is already under control,
> but matches an ignore pattern *will* cause it to show up under
> "Changes not staged for commit".  Git will also allow you to use
> `git add -f` on a file which matches an ignore pattern.
> 
> There are already a few files in Git which have targetted matches pointed
> at them, yet are still present.  Perhaps these were added by mistaken use
> of `add -f`, perhaps they were deliberately added and the author missed
> removing the .gitignore entry.
> 
> As such perhaps the generalized "config.h" pattern is appropriate and
> move towards removing the few examples which currently exist?

I don't think so, no - new ports will similarly have asm-<arch>/config.h,
and there shouldn't be a requirement to "git add -f" them at that point.
The role of such named files really is too different to have such a top
level entry imo.

Jan

