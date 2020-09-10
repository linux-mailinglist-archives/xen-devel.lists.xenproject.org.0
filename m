Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71865263CFE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 08:11:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGFmk-0008Bv-A2; Thu, 10 Sep 2020 06:10:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGFmi-0008Bq-QA
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 06:10:16 +0000
X-Inumbo-ID: 265d7d96-42d1-4745-9272-0199816d6622
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 265d7d96-42d1-4745-9272-0199816d6622;
 Thu, 10 Sep 2020 06:10:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DC17AD2E;
 Thu, 10 Sep 2020 06:10:29 +0000 (UTC)
Subject: Re: [PATCH 00/11] Major rework of top-level .gitignore
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <202009092152.089Lqhmn039171@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b7d69c5-5237-2290-06d8-3aae436257dc@suse.com>
Date: Thu, 10 Sep 2020 08:10:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <202009092152.089Lqhmn039171@m5p.com>
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

On 09.09.2020 03:28, Elliott Mitchell wrote:
> The top-level .gitignore file for Xen has gotten rather messy.  Looks
> like at times a few people may have added some blank lines looking
> towards some later cleanup.  Alas no one ever got around to that later
> cleanup.
> 
> When looking at one portion of the situation I ended up doing some
> cleanup and it got out of hand.  Hence I'm not sending in these patches
> which hopefully make things better.
> 
> Please note these are somewhat better than work-in-progress status.
> There are several places I'm unsure of which direction to go in.  Likely
> several of these will need more or less information in their commit
> messages.
> 
> Overall pattern is first some initial cleanup on the top-level
> .gitignore.  It is easier to spot targeted file matches which overlapped
> general globs before breaking things apart.  This is followed by breaking
> all targeted matches off of the global .gitignore file.  Lastly the
> global .gitignore file was sorted and I've commented on a few of the
> things which remain.
> 
> Recent versions of `git` include a "check-ignore" command.  For testing
> new patterns `git check-ignore -vn --no-index <pattern>` will tell you
> whether a given filename would be ignored without "add -f".
> 
> I think patches 01 and 02 are near ready for being committed.

Provided we as a community basically agree on the splitting. I'm
not sure I've read this out of prior discussion.

>  Patches
> 03-09 need varying degrees of polish before being in an official tree.
> Patches 10 and 11 are pretty well initial rough outlines.
> 
> Elliott Mitchell (11):
>   gitignore: Move ignores from global to subdirectories
>   gitignore: Remove entries duplicating global entries
>   gitignore: Add/Generalize entries
>   gitignore: Create .gitignore file for tools/firmware/
>   gitignore: Create .gitignore file for tools/ocaml/
>   gitignore: Create .gitignore file for xen/
>   gitignore: Create .gitignore file for docs/
>   gitignore: Create .gitignore file for stubdom/
>   gitignore: Create .gitignore file for config/
>   gitignore: Create .gitignore file for tools/
>   gitignore: RFC Prelimiary final cleanup of top-level .gitignore

I'm confused about whether what I have in my inbox is complete and
consistent: 01-11 don't look to be "in reply to" this one, and they
all pre-date this mail by a varying number of days (Aug 27 ... Sep 3).
Additionally, unlike what happens for every other sender these days,
I've also got two copies of most (but not all) of them. Prior to our
mail setup over here having changed over a year ago this was the
normal way when I was Cc-ed on patches, but the server nowadays
de-duplicates the mails. So something is likely odd with your setup.

Jan

