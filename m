Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AC344C5D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 17:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100383.191221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONoM-0006v6-UB; Mon, 22 Mar 2021 16:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100383.191221; Mon, 22 Mar 2021 16:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONoM-0006uh-R7; Mon, 22 Mar 2021 16:53:50 +0000
Received: by outflank-mailman (input) for mailman id 100383;
 Mon, 22 Mar 2021 16:53:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lONoK-0006uc-Sl
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 16:53:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8105d54-07e7-42ae-afce-23d3707ddf8f;
 Mon, 22 Mar 2021 16:53:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8727DAF0D;
 Mon, 22 Mar 2021 16:53:46 +0000 (UTC)
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
X-Inumbo-ID: b8105d54-07e7-42ae-afce-23d3707ddf8f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616432026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPR682WIHuCagi0j74zp3+OiB5sB38u/YRtUa9hb4Yc=;
	b=JRG4iHR+5f5tTJQrZbGK34f7xSbmVTD7gJW0O7Lzyhr461febRpB1WIQUfw+IQu1n+5Jxz
	QOb5EKjs6OJ+ZdgFcH0zjeWp84T8/9jQX0inEDExgYw9u8OImCik/rFgviWYOlZxqPya/Z
	b2k6ZRTLs+UIAOOsUvgV783cXpPzHhw=
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
References: <20210322133301.11308-1-jandryuk@gmail.com>
 <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
 <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com>
 <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
 <CAKf6xpuVrLmsptxkMfZfb_ekeLHQpS6S8AzOZ0i5MDL9YWf1aA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23556ca9-86f4-854f-5178-6fb927166245@suse.com>
Date: Mon, 22 Mar 2021 17:53:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpuVrLmsptxkMfZfb_ekeLHQpS6S8AzOZ0i5MDL9YWf1aA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.03.2021 16:36, Jason Andryuk wrote:
> On Mon, Mar 22, 2021 at 11:15 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 22.03.2021 15:59, Andrew Cooper wrote:
>>> On 22/03/2021 14:52, Jan Beulich wrote:
>>>> On 22.03.2021 14:33, Jason Andryuk wrote:
>>>>> make install-xen fails when EFI_VENDOR is set (=fedora) with:
>>>>> install: cannot create regular file '/home/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi': No such file or directory
>>>>>
>>>>> Create the EFI_VENDOR directory so xen.efi can be installed within.
>>>>>
>>>>> This removes the need for Fedora and Qubes xen.spec files to manually
>>>>> create the directory in advance.
>>>> While I'm not strictly against, I'd like to point out that it was
>>>> deliberate to not create this directory here. I also didn't expect
>>>> anyone's xen.spec to do so. Instead I'd expect the distro to create
>>>> it during OS installation. If this was a bad assumption, I'd prefer
>>>> if the commit message here could point out why such an expectation
>>>> won't hold in general.
> 
> I didn't write this for an rpm xen.spec - I just cross referenced out
> of curiosity.
> 
>>> This reasoning is broken for anything other `make install DESTDIR=/` on
>>> a live system.
>>>
>>> It is incompatible with how RPM, deb, etc packages work.
>>
>> I'm afraid I don't understand, for both of your statements. If distro
>> installation put in place the designated directory, there wouldn't be
>> any live system lacking it, and there wouldn't be any concern in the
>> packaging of any software.
>>
>> To take a perhaps too extreme example - packages typically expect e.g.
>> /usr to exist as well, don't they?
> 
> But you have to install -d ${D}/usr before install ${D}/usr/file, right?

Sure, but I take it that about every package can rely on it to be
there, and not have to take care of creating it. There ought to
be an "owning" package for that directory, and that's the package
responsible for creating it. The same would then go for wherever
you want xen.efi to go.

> It's a surprising sequence to:
> 1) see 'EFI installation only partially done (EFI_VENDOR not set)'
> 2) set EFI_VENDOR
> 3) see xen.efi installation fail
> 
> I was working on a fedora system, and I was using `make && sh
> install.sh` to install (but be sure to `rm -r dist/install/var/run`
> since otherwise that'll break booting).  I wanted xen.efi to end up in
> /boot/efi/EFI/fedora after running `sh install.sh`, and EFI_VENDOR
> appeared to be the way to do it.  Again, it was surprising to enable
> an option and then have it break.

Well - the thing is that according to my understanding you don't simply
pick a directory name of your liking, but you use the one your distro
uses. Otherwise I consider it quite likely that upon next re-building
of the EFI partition your binary won't be put back.

Jan

