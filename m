Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63663448FD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 16:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100278.190991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOMHR-0003rx-AS; Mon, 22 Mar 2021 15:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100278.190991; Mon, 22 Mar 2021 15:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOMHR-0003rY-7K; Mon, 22 Mar 2021 15:15:45 +0000
Received: by outflank-mailman (input) for mailman id 100278;
 Mon, 22 Mar 2021 15:15:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lOMHQ-0003rT-03
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 15:15:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a53eac39-0335-46c8-bd93-9f858c093683;
 Mon, 22 Mar 2021 15:15:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DC2CACFC;
 Mon, 22 Mar 2021 15:15:42 +0000 (UTC)
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
X-Inumbo-ID: a53eac39-0335-46c8-bd93-9f858c093683
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616426142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMnxDHlFh0KEiXr2igI18wn4J3EBLsaAX28JH8HC9wY=;
	b=lsXhN1Bf2XxKoAxctghnaemkmDTagHb4JbTV9yKQEtZ+ckyVukLQG8ZmjYjfeDrNo3ejdo
	HVlH16LgE2v+LCNydMc3sBivz5rWZ1AETeeoEoB41uOSaqJXqgiX9hJNbjSpque/UQYzDg
	IDE3joDHCA6yQe2i/ju9E/nzl1BeUQ0=
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>
References: <20210322133301.11308-1-jandryuk@gmail.com>
 <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
 <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
Date: Mon, 22 Mar 2021 16:15:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.03.2021 15:59, Andrew Cooper wrote:
> On 22/03/2021 14:52, Jan Beulich wrote:
>> On 22.03.2021 14:33, Jason Andryuk wrote:
>>> make install-xen fails when EFI_VENDOR is set (=fedora) with:
>>> install: cannot create regular file '/home/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi': No such file or directory
>>>
>>> Create the EFI_VENDOR directory so xen.efi can be installed within.
>>>
>>> This removes the need for Fedora and Qubes xen.spec files to manually
>>> create the directory in advance.
>> While I'm not strictly against, I'd like to point out that it was
>> deliberate to not create this directory here. I also didn't expect
>> anyone's xen.spec to do so. Instead I'd expect the distro to create
>> it during OS installation. If this was a bad assumption, I'd prefer
>> if the commit message here could point out why such an expectation
>> won't hold in general.
> 
> This reasoning is broken for anything other `make install DESTDIR=/` on
> a live system.
> 
> It is incompatible with how RPM, deb, etc packages work.

I'm afraid I don't understand, for both of your statements. If distro
installation put in place the designated directory, there wouldn't be
any live system lacking it, and there wouldn't be any concern in the
packaging of any software.

To take a perhaps too extreme example - packages typically expect e.g.
/usr to exist as well, don't they?

Jan

