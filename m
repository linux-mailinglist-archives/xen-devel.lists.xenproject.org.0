Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03021B4C2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 14:11:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtrrz-0002dQ-Am; Fri, 10 Jul 2020 12:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY6w=AV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jtrry-0002cu-7M
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 12:11:10 +0000
X-Inumbo-ID: 70136788-c2a6-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70136788-c2a6-11ea-8496-bc764e2007e4;
 Fri, 10 Jul 2020 12:11:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC9DBAD65;
 Fri, 10 Jul 2020 12:11:08 +0000 (UTC)
Subject: Re: Followup of yesterday's design session "refactoring the REST"
To: Jan Beulich <jbeulich@suse.com>
References: <a578fb24-cc6a-b3bd-b83d-3f7b9b1302cf@pfupf.net>
 <f0367a9e-fdfb-1bf6-d569-f380349f9dd8@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0d666a2d-25c9-edf2-5eb3-3dcbff827c61@suse.com>
Date: Fri, 10 Jul 2020 14:11:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <f0367a9e-fdfb-1bf6-d569-f380349f9dd8@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.07.20 11:22, Jan Beulich wrote:
> On 09.07.2020 07:56, Jürgen Groß wrote:
>> Yesterday's design session at Xen Developer Summit "Hypervisor Team: .."
>> had one topic regarding whether we should find specific maintainers of
>> all the files currently assigned to "THE REST" in order to lower the
>> amount of reviews for those assigned to be "THE REST" maintainers.
>>
>> Modifying the MAINTAINERS file adding "REST@x.y" as REST maintainer
>> and running the rune:
>>
>> git ls-files | while true; do f=`line`; [ "$f" = "" ] && exit; \
>> echo $f `./scripts/get_maintainer.pl -f $f | awk '{print $(NF)}'`; \
>> done | awk '/REST/ { print $1}'
>>
>> shows that basically the following files are covered by "THE REST":
>>
>> - files directly in /
>> - config/
>> - most files in docs/ (not docs/man/)
>> - misc/ (only one file)
>> - scripts/
>> - lots of files in xen/common/
>> - xen/crypto/
>> - lots of files in xen/drivers/
>> - lots of files in xen/include/
>> - xen/scripts/
>> - some files in xen/tools/
>>
>> I have attached the file list.
>>
>> So the basic idea to have a "hypervisor REST" and a "tools REST"
>> wouldn't make a huge difference, if we don't assign docs/ to "tools
>> REST".
>>
>> So I think it would make sense to:
>>
>> - look through the docs/ and xen/include/ files whether some of those
>>     can be assigned to a component already having dedicated maintainers
>>
>> - try to find maintainers for the other files, especially those in
>>     xen/common/ and xen/drivers/ (including the related include files, of
>>     course)
> 
> At least for files in xen/common/ I think it was really intentional
> that they - as core hypervisor files - fall under THE REST. We could

Depends on the files. Those files are under xen/common/ as they are not
architecture dependent. I agree that many of those files are core
hypervisor files, but OTOH e.g. common/sched/core.c has dedicated
maintainers in spite of being a core file.

I don't think files like xen/common/gdbstub.c or xen/common/xenoprof.c
fall in this category, so revisiting the file list would surely be a
good idea.

> of course have a "Core Hypervisor" (or so) group, which would already
> ...
> 
>> - if any of the REST maintainers doesn't want to receive mails for a
>>     group of the remaining REST files split the REST maintainers/files up
>>     accordingly
> 
> ... allow moving some into this direction.

Yes.

> For files under xen/drivers/ not currently covered by other entries it
> may indeed be (more) feasible to find individual maintainers.

I agree.


Juergen

