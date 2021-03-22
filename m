Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883BE344829
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 15:53:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100257.190932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLvC-0001XB-EP; Mon, 22 Mar 2021 14:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100257.190932; Mon, 22 Mar 2021 14:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLvC-0001Wo-Ay; Mon, 22 Mar 2021 14:52:46 +0000
Received: by outflank-mailman (input) for mailman id 100257;
 Mon, 22 Mar 2021 14:52:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lOLvB-0001Wj-Bh
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:52:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b09b01e2-82bd-40ee-a1f0-bee7a151b143;
 Mon, 22 Mar 2021 14:52:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C32A5AC1F;
 Mon, 22 Mar 2021 14:52:43 +0000 (UTC)
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
X-Inumbo-ID: b09b01e2-82bd-40ee-a1f0-bee7a151b143
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616424763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnWCkOBFtDviVyH70kqDUX1jwe4zQ2RfE46n72j+fqY=;
	b=mLuA4j47SJNJj5Jjzmg9u8/bRqzbsgPtlutKMpg6clXWnJDWRnoE0h+z4il3PPCZhl/yR7
	k2p+VrH0V2p55BSa03fC2IUdkk+rGkqXfvX9zAKnNgTw3gMsvExJXMQ1MMuMMTzMO7XrBZ
	JrbGCUjicBxoVo7o9kKBRWgDWpoBcFg=
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210322133301.11308-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
Date: Mon, 22 Mar 2021 15:52:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322133301.11308-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.03.2021 14:33, Jason Andryuk wrote:
> make install-xen fails when EFI_VENDOR is set (=fedora) with:
> install: cannot create regular file '/home/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi': No such file or directory
> 
> Create the EFI_VENDOR directory so xen.efi can be installed within.
> 
> This removes the need for Fedora and Qubes xen.spec files to manually
> create the directory in advance.

While I'm not strictly against, I'd like to point out that it was
deliberate to not create this directory here. I also didn't expect
anyone's xen.spec to do so. Instead I'd expect the distro to create
it during OS installation. If this was a bad assumption, I'd prefer
if the commit message here could point out why such an expectation
won't hold in general.

Jan

