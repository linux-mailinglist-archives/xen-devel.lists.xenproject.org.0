Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A9734588C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 08:24:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100531.191573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lObNo-0008T0-2L; Tue, 23 Mar 2021 07:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100531.191573; Tue, 23 Mar 2021 07:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lObNn-0008Sb-VK; Tue, 23 Mar 2021 07:23:19 +0000
Received: by outflank-mailman (input) for mailman id 100531;
 Tue, 23 Mar 2021 07:23:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lObNl-0008SW-Si
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 07:23:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5bb6cb2-4c6e-4e47-b99f-2e80031f7a51;
 Tue, 23 Mar 2021 07:23:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBF89AE42;
 Tue, 23 Mar 2021 07:23:15 +0000 (UTC)
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
X-Inumbo-ID: d5bb6cb2-4c6e-4e47-b99f-2e80031f7a51
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616484195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=os5aB1CoCk44ZDSVhSK3ym0ilu3lkI3YzGHTrwM/xGA=;
	b=AeuKGkpyuREqdYqCimsqkhhc7dM23J2ukrvtOiD4wU5WwaFtyOehsCIFPuQThFmSxPufU6
	MG6rQk3iRoqm1ja/YVha5DSQnixaOneZTxlWq0UPusQHnFJdOzPXLCJJJlnR76W7gWzLOw
	O7la1ZCWIZreg39mico4ZSXBw4JeyUE=
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210322133301.11308-1-jandryuk@gmail.com>
 <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
 <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com>
 <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
 <09b5e7ee-b44b-a8ab-f29d-6617b6af93a0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b071192-a443-4bdc-8dac-107bbd4a0481@suse.com>
Date: Tue, 23 Mar 2021 08:23:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <09b5e7ee-b44b-a8ab-f29d-6617b6af93a0@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.03.2021 18:08, Andrew Cooper wrote:
> On 22/03/2021 15:15, Jan Beulich wrote:
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
>>> This reasoning is broken for anything other `make install DESTDIR=/` on
>>> a live system.
>>>
>>> It is incompatible with how RPM, deb, etc packages work.
>> I'm afraid I don't understand, for both of your statements. If distro
>> installation put in place the designated directory, there wouldn't be
>> any live system lacking it, and there wouldn't be any concern in the
>> packaging of any software.
>>
>> To take a perhaps too extreme example - packages typically expect e.g.
>> /usr to exist as well, don't they?
> 
> No.  A buildroot starts out fully empty, by design.
> 
> The packaging environment (usually a chroot) invokes `make install
> DESTDIR=/path/to/staging/root` so you don't interfere with any of the
> tools inside the environment, and the resulting tar/cpio has the
> buildroot stripped out of paths.
> 
> The failure being discussed here is the build within the packaging
> environment, not the metadata which forms the final package.  Installing
> a deb/rpm/etc will make directories as applicable.

Ah, I see. But then this _still_ isn't the right thing to do. In fact,
the package build and installation shouldn't put xen.efi in the EFI
partition _at all_. The build system doing so is for developers only,
so they don't need to invoke boot loader configuration every time they
rebuild and re-install. Hence the packaging build shouldn't set
EFI_VENDOR in the first place. There it instead should be a subsequent
boot loader re-configuration which picks up xen.efi from its install
location (under $(EFI_DIR)) and places it on the EFI partition.

With the above I take back my "I'm not strictly against" - I'm pretty
firmly against. If the warning emitted is deemed a problem, I'm sure
we can find a way to silence it.

Jan

