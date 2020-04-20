Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78971B0CEB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:39:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWdz-0000ev-Vu; Mon, 20 Apr 2020 13:39:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQWdy-0000ep-AJ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:39:26 +0000
X-Inumbo-ID: 5905a707-830c-11ea-9062-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5905a707-830c-11ea-9062-12813bfff9fa;
 Mon, 20 Apr 2020 13:39:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 533E8ADD3;
 Mon, 20 Apr 2020 13:39:23 +0000 (UTC)
Subject: Re: [XEN PATCH v4 14/18] xen,symbols: rework file symbols selection
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-15-anthony.perard@citrix.com>
 <e28fa2b6-89c9-8e87-eaf0-91a3d6f6a62f@suse.com>
 <20200416124400.GG4088@perard.uk.xensource.com>
 <312e719f-2bae-cb29-a6dd-29ae0d976d95@suse.com>
 <20200416150929.GL4088@perard.uk.xensource.com>
 <586cff44-d46e-3a5b-9e47-0c7ff4de8801@suse.com>
 <20200417131931.GM4088@perard.uk.xensource.com>
 <83de83ee-848f-a048-7293-d1e5b01dd217@suse.com>
 <20200417144218.GN4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa559a21-5c86-fe00-0bbf-23270e5f6951@suse.com>
Date: Mon, 20 Apr 2020 15:39:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417144218.GN4088@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 16:42, Anthony PERARD wrote:
> On Fri, Apr 17, 2020 at 03:39:48PM +0200, Jan Beulich wrote:
>> On 17.04.2020 15:19, Anthony PERARD wrote:
>>> Or do you mean keeping exception to the rule? And hope that when someone
>>> changes the rule, it doesn't forget to check if the exception needs
>>> changing as well?
>>
>> ... "exception" like you put it (requiring special care to keep
>> multiple instances in sync) is not the only way this can be done
>> (and indeed I'd not want something like this). Since you have
>> (in patch 15) e.g.
>>
>> guest_walk_%.o: guest_walk.c FORCE
>> 	$(call if_changed_rule,cc_o_c)
>>
>> anyway, the desire to skip the objcopy step could be communicated
>> to the command from here, without needing to clone the command.
>> One way might be a special (phony) dependency, another might be to
>> set some variable along the lines of
>>
>> guest_walk_%.o: SPECIAL := y
> 
> I guess something like that could be done. But if possible, I'd like to
> avoid that.
> 
>>> Also, I'm going to have to use this patch later anyway as sometime CC
>>> use a full path to the source as file symbol. So this is going to be
>>> important when we will run for example
>>> `clang -o arch/x86/mm/guest_walk_2.o arch/x86/mm/guest_walk.c`.
>>> (There isn't a patch for that yet.)
>>
>> That's interesting - what will be the goal of that future adjustment?
> 
> It's a step toward my goal of been able to have out-of-tree build for
> xen, as stated in my cover letter. In order to do that, I try to adapt
> Kbuild to build Xen.
> 
> Kbuild is building the linux kernel without changing directory, so I'd
> like to do the same, as it probably makes it easier to do out-of-tree
> build.
> 
> Another tool I'd like to use from Kbuild is ./fixdep, it's a small
> program that run after running CC and fix the dependency file that CC
> generates. The main thing it does is to add a dependency on
> Kconfig options that a source file uses instead of having a dependency
> on whether any unrelated Kconfig has change at all. But ./fixdep from
> Linux only works if we build without changing directory. ([1] for more
> on fixdep)
> 
> I guess one advantage of never changing directory is that we can always
> use relative path in global *FLAGS. There isn't a need to use absolute
> path, which is an issue when the source tree is moved to a different
> location. That can easily happen when for example you try to build in a
> container (mapping the source tree inside it) then try to rebuild from
> outside. (After using automation/scripts/containerize for example.)
> And we don't need tricks like the .*.d2 files (which isn't needed in the
> hypervisor anyway, so far at least).

Ah, I see. Out-of-tree builds don't necessarily imply source trees
that can also be moved, so you want to actually go a step further.

Jan

