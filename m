Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818391D0B67
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 11:03:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYnGS-0006tM-GN; Wed, 13 May 2020 09:01:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYnGR-0006tH-9z
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 09:01:19 +0000
X-Inumbo-ID: 4ed43e0c-94f8-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ed43e0c-94f8-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 09:01:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3FC4AAC5F;
 Wed, 13 May 2020 09:01:20 +0000 (UTC)
Subject: Re: [PATCH 0/2] Fixups for fcf-protection
To: Stefan Bader <stefan.bader@canonical.com>
References: <20200512033948.3507-1-jandryuk@gmail.com>
 <3542ecb3-6f4e-2408-ea9f-9b03ac23688e@canonical.com>
 <2fbc4be8-c992-1703-168c-a4124a0fd02e@citrix.com>
 <27da328a-189a-607c-0f97-705405380c1b@canonical.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89ad0ca5-c575-80da-bde3-e87d2df1c4ba@suse.com>
Date: Wed, 13 May 2020 11:01:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <27da328a-189a-607c-0f97-705405380c1b@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.05.2020 07:41, Stefan Bader wrote:
> On 12.05.20 20:47, Andrew Cooper wrote:
>> On 12/05/2020 08:17, Stefan Bader wrote:
>>> Not sure it was already hit but that additional .note section breaks the build
>>> of the emulator as generated headers become gigantic:
>>>
>>> https://git.launchpad.net/ubuntu/+source/xen/tree/debian/patches/1001-strip-note-gnu-property.patch?h=ubuntu/focal
>>
>> 4.6G of notes?!?  That is surely a toolchain bug.
> 
> No, sorry if that was unclear. The .notes themselves are just about some Kb or
> so per object file. Problem is that each object file gets converted into a hex
> array header file. And this does multiply the resulting header file sizes.
> So the .h files generated are 4.6G in size. And there were a couple of those,
> all included into one .c file. Which ended in the compiler running out of memory
> on a 32GB system.

But as per the link above it's still 3Mb notes per object,
which still seems insane.

Jan

