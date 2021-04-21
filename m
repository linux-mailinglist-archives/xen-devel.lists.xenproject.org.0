Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6936685E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114252.217686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9WU-0003jY-Qg; Wed, 21 Apr 2021 09:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114252.217686; Wed, 21 Apr 2021 09:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9WU-0003jA-Mp; Wed, 21 Apr 2021 09:51:54 +0000
Received: by outflank-mailman (input) for mailman id 114252;
 Wed, 21 Apr 2021 09:51:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ9WS-0003iy-S8
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:51:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e216584-d0c0-4fb9-9321-41e7766bb539;
 Wed, 21 Apr 2021 09:51:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD26CB2E4;
 Wed, 21 Apr 2021 09:51:50 +0000 (UTC)
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
X-Inumbo-ID: 9e216584-d0c0-4fb9-9321-41e7766bb539
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618998710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NEvQf3uRl+Sgc1WdAVwt3AFrn2VAvyklQQFfj6at9IA=;
	b=LVV99KuWT7Evv0qRB2Y/Zq5YMWGbmfT7pFviSYF7o/eHFLXuXz4wsZIYd86f1fYTiKZxF8
	GShd8Sx1Jwdd0ZgJk+ZS7TSMx4qEFuqdxrjntvF6ltnh1qb7TR3YDKEGJV8G4CSw4kCAI6
	LkEwDgQoK5T2YkX2MPFmWLj2zrPiLgo=
Subject: Re: [PATCH 0/7] xen: Switch to using -Og for debug builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>,
 Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
 <9e8e116a-f4c3-e6bf-edee-d48e76a3d005@suse.com>
 <b6b313d5-fd24-b1b8-afe9-0801825565f2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3fda551c-fff3-d86e-d2cd-23408693bb7c@suse.com>
Date: Wed, 21 Apr 2021 11:51:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b6b313d5-fd24-b1b8-afe9-0801825565f2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.04.2021 11:31, Andrew Cooper wrote:
> On 19/04/2021 16:45, Jan Beulich wrote:
>> On 19.04.2021 16:01, Andrew Cooper wrote:
>>> As with the toolstack side, we ought to use -Og for debug builds.
>>>
>>> All fixes are trivial.  The first 3 are understandable, given reduced
>>> optimisations.  The next 3 are, AFAICT, bogus diagnostics.
>>>
>>> Andrew Cooper (7):
>>>   xen/arm: Make make_cpus_node() compile at -Og
>>>   x86/shim: Fix compilation at -Og
>>>   x86/sysctl: Make arch_do_sysctl() compile at -Og
>>>   x86/irq: Make create_irq() compile at -Og
>>>   xen/efi: Make efi_start() compile at -Og
>>>   x86/shadow: Make _shadow_prealloc() compile at -Og
>>>   xen: Use -Og for debug builds when available
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> I'd like to ask though that at least for the bogus warnings you
>> amend the commit messages with the gcc version these were observed
>> with. Perhaps even those seemingly bogus initializers would
>> benefit from a very brief comment (or else there's a fair chance
>> of them getting removed again at some point).
> 
> I'm afraid I don't have that information easily to hand, but all issues
> were found by distro-provided compilers included in our Gitlab
> infrastructure.

Well, okay, then we'll need to live with said risk. As an aside I'd
like to remind you though that on past occasions of working around
compiler oddities, I was asked as well to provide compiler version
information ...

Jan

