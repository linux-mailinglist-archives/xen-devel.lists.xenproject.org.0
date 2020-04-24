Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6AD1B72F0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 13:21:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRwOG-0004ed-Vh; Fri, 24 Apr 2020 11:21:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRwOF-0004eY-B4
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 11:21:03 +0000
X-Inumbo-ID: ad65cf38-861d-11ea-9482-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad65cf38-861d-11ea-9482-12813bfff9fa;
 Fri, 24 Apr 2020 11:21:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D60E4AF45;
 Fri, 24 Apr 2020 11:20:58 +0000 (UTC)
Subject: Re: [XEN PATCH v5 04/16] xen/build: have the root Makefile generates
 the CFLAGS
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-5-anthony.perard@citrix.com>
 <28aeea6d-cd52-d8bf-f114-96ec435363c6@suse.com>
 <20200424094505.GS4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2fc2abda-99a7-9bd0-5e91-03b8a1db0bb8@suse.com>
Date: Fri, 24 Apr 2020 13:20:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424094505.GS4088@perard.uk.xensource.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 11:45, Anthony PERARD wrote:
> On Thu, Apr 23, 2020 at 06:40:33PM +0200, Jan Beulich wrote:
>> On 21.04.2020 18:11, Anthony PERARD wrote:
>>> --- a/xen/arch/x86/Rules.mk
>>> +++ b/xen/arch/x86/Rules.mk
> [..]
>>> +c_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
>>> +a_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
>>
>> Why are you also adding these to a_flags? It probably doesn't hurt,
>> but I'd prefer if it was removed (could be done while committing if
>> all acks arrive and other other need for av6 arises) if there's no
>> clear need.
> 
> Those flags are already in a_flags (or previously AFLAGS). I've tried to
> be careful to avoid changing the list of *flags in an already
> complicated enough patch. I would like to keep this patch that way.
> 
> If the -D__OBJECT_LABEL__ and the stack-bondary flags aren't needed in
> a_flags, it would be better to remove them in a separated patch, with
> some explanation on why they are removed.

Ah, fair point - previously we had

# Most CFLAGS are safe for assembly files:
#  -std=gnu{89,99} gets confused by #-prefixed end-of-line comments
#  -flto makes no sense and annoys clang
AFLAGS += $(filter-out -std=gnu% -flto,$(CFLAGS))

and hence implicitly inherited all kinds of inapplicable flags.
I'm fine with this (and probably other things) getting taken care
of later then.

> What is av6?

I was missing a blank: "a v6". Also s/other other/no other".

Jan

