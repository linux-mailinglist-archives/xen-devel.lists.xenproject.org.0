Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D61D7574
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 12:45:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jadH2-0001T7-Nc; Mon, 18 May 2020 10:45:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k4Zq=7A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jadH1-0001Sr-2J
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 10:45:31 +0000
X-Inumbo-ID: b0b61e06-98f4-11ea-a84b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0b61e06-98f4-11ea-a84b-12813bfff9fa;
 Mon, 18 May 2020 10:45:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7F9C6ABD1;
 Mon, 18 May 2020 10:45:31 +0000 (UTC)
Subject: Re: [PATCH] public/io/netif.h: add a new extra type for XDP
To: Denis Kirjanov <kda@linux-powerpc.org>
References: <1589790285-1250-1-git-send-email-kda@linux-powerpc.org>
 <bbd8a83a-a676-9fa1-b03b-526e5122966f@suse.com>
 <CAOJe8K2pUv4Upvxya3LFPj0CxZ1-_hDZcrv-r6Q2EaxC8Ym6Ow@mail.gmail.com>
 <2615d770-c17b-26e0-4686-852ca122eeb4@suse.com>
 <CAOJe8K08BJv5UefSYUQRWuFtsR=aMxJEV=JJvkMsrGk6q0fQRQ@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b60ff33c-eb3d-41bf-2541-e516bbf6967e@suse.com>
Date: Mon, 18 May 2020 12:45:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAOJe8K08BJv5UefSYUQRWuFtsR=aMxJEV=JJvkMsrGk6q0fQRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: xen-devel@lists.xenproject.org, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.05.20 12:37, Denis Kirjanov wrote:
> On 5/18/20, Jürgen Groß <jgross@suse.com> wrote:
>> On 18.05.20 11:52, Denis Kirjanov wrote:
>>> On 5/18/20, Jürgen Groß <jgross@suse.com> wrote:
>>>> On 18.05.20 10:24, Denis Kirjanov wrote:
>>>>> The patch adds a new extra type to be able to diffirentiate
>>>>> between RX responses on xen-netfront side with the adjusted offset
>>>>> required for XDP processing.
>>>>>
>>>>> For Linux the offset value is going to be passed via xenstore.
>>>>
>>>> Why? I can only see disadvantages by using a different communication
>>>> mechanism.
>>> I see it like other features passed through xenstore and it requires
>>> less changes to
>>> other structures with the same final result.
>>
>> This is okay as long there is no Xenstore interaction required when the
>> interface has been setup completely (i.e. only defining the needed
>> offset for XDP is fine, enabling/disabling XDP at runtime should not be
>> done via Xenstore IMO).
> I've checked netfront-<--->netback interaction and found no problems with it.
> Paul found an issue that the value of the netfront state hasn't been
> re-read (during unbind-bind sequence in dom0) and I've fixed it the
> patch for the guest

I don't say your variant isn't working, but a feature being switchable
dynamically AND needing a ring page synchronization anyway should IMO
be switched via a specific ring page request.

I might have not the complete picture, so in case you have a good reason
to do it via Xenstore, fine, but "I'm seeing no problem with it" is no
good reason for a specific design decision.

> 
>>
>> And please, no guest type special casing. Please replace "Linux" by e.g.
>> "The guest" (with additional tweaking of the following sentence).
> 
> Oh, just sent v2. I'll fix a comment.

Thanks.


Juergen

