Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAEA20A098
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 16:09:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joSYQ-0006hQ-7d; Thu, 25 Jun 2020 14:08:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1joSYO-0006hI-9f
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 14:08:36 +0000
X-Inumbo-ID: 5bc28788-b6ed-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bc28788-b6ed-11ea-bb8b-bc764e2007e4;
 Thu, 25 Jun 2020 14:08:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72C5DAE93;
 Thu, 25 Jun 2020 14:08:34 +0000 (UTC)
Subject: Re: [XEN RFC for-4.14] Re: use of "stat -"
To: Ian Jackson <ian.jackson@citrix.com>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
 <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
 <CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>
 <20200512195005.GA96154@mattapan.m5p.com>
 <049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>
 <20200512225458.GA1530@mattapan.m5p.com>
 <24253.9543.974853.499775@mariner.uk.xensource.com>
 <0b449d5a-9629-8e41-5354-b985a063eba4@suse.com>
 <24307.32018.502303.817846@mariner.uk.xensource.com>
 <CAKf6xpvLrXkBR6okFQ9u=9GfN-h_XHeLtwQV9pBRRAFXmbwVsQ@mail.gmail.com>
 <24308.42571.430322.191817@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7abcae45-6a58-ea7a-be8b-64be50b080a6@suse.com>
Date: Thu, 25 Jun 2020 16:08:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <24308.42571.430322.191817@mariner.uk.xensource.com>
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 Elliott Mitchell <ehem+xen@m5p.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.06.2020 15:27, Ian Jackson wrote:
> Jason Andryuk writes ("Re: [XEN RFC for-4.14] Re: use of "stat -""):
>> I was going to just write a patch to replace - with /dev/stdin and ask
>> Jan to test it.  When I opened the script, this comment was staring at
>> me:
>>         # We can't just stat /dev/stdin or /proc/self/fd/$_lockfd or
>>         # use bash's test -ef because those all go through what is
>>         # actually a synthetic symlink in /proc and we aren't
>>         # guaranteed that our stat(2) won't lose the race with an
>>         # rm(1) between reading the synthetic link and traversing the
>>         # file system to find the inum.
>>
>> On my system:
>> $ ls -l /dev/stdin
>> lrwxrwxrwx 1 root root 15 Jun 24 21:13 /dev/stdin -> /proc/self/fd/0
>> $ ls -l /proc/self/fd/0 0<lockfile
>> lrwx------ 1 jason jason 64 Jun 24 21:26 /proc/self/fd/0 -> /home/jason/lockfile
>>
>> stat /dev/stdin will work around the lack of `stat -` support, but it
>> doesn't address the race in the comment.  Is the comment valid?
> 
> Thanks, but:
> 
> The tests in my transcript show that the comment (which I wrote) is
> false.  It shows that stat /dev/stdin works on deleted files, and
> stats the right file even if the name has been rused.
> 
>>  How would we prove there is no race for /dev/stdin?
> 
> It is easy to create the "bad" situation by hand, without racing.
> 
> The transcript shows that the output from readlink(2) is a fiction and
> that stat works to stat the actual open-file.
> 
>> I've mentioned it before, but maybe we should just use the Qubes
>> patch.  It leaves the lockfile even when no-one is holding the lock,
>> but it simplifies the code and sidesteps the issues we are discussing
>> here.
>> https://github.com/QubesOS/qubes-vmm-xen/blob/xen-4.13/patch-tools-hotplug-drop-perl-usage-in-locking-mechanism.patch
> 
> I don't like that because this locking code might be reused (or maybe
> already is used) in contexts with a varying lockfile filename, leaving
> many lockfiles.  And because having lockfiles lying about might
> confuse sysadmins who are used to programs which use (the broken)
> LOCK_EX-style locking paradigm.
> 
> So tl;dr: yes, we need that patch to replace - with /dev/stdin.

I'm about to test this then, but to be honest I have no idea what
to do with the comment. I don't think I could properly justify its
deletion in the description (beyond saying it's not really true),
nor would I be certain whether to e.g. leave the test -ef part
there.

Also is there any reason to go through two symlinks then, rather
than using /proc/self/fd/$_lockfd directly?

Jan

