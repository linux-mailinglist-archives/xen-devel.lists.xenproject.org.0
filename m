Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E5F382D5F
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 15:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128235.240768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidEW-0002Fd-C9; Mon, 17 May 2021 13:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128235.240768; Mon, 17 May 2021 13:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidEW-0002Dm-92; Mon, 17 May 2021 13:24:32 +0000
Received: by outflank-mailman (input) for mailman id 128235;
 Mon, 17 May 2021 13:24:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lidEV-0002Dg-02
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 13:24:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24599434-454e-48fa-bc39-738f5e1affd8;
 Mon, 17 May 2021 13:24:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 401D5B1C8;
 Mon, 17 May 2021 13:24:29 +0000 (UTC)
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
X-Inumbo-ID: 24599434-454e-48fa-bc39-738f5e1affd8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621257869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUdEQ2AJRw6LNZgC0oNGHQ9ysBMUAECATObwQXJikp8=;
	b=PylPRWcaT7eCTtQyGa0Rdz8MzXKjVerT4YmcBUN2m0lyeyb81LQ6dHXC4E+Eg6EP6vYLZV
	JjSU4JUZMfMYeoJ5oYgYQG1W1BaOx1BdDRcImx5P9g74fGBkv7pNDtVEKszweFueqSMZMq
	TOlrTSvNVE6npc84BzE1J19Pxmrn4ik=
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
 <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
 <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
 <a183a5f9-0f36-187d-fd06-8d6db99cbe43@suse.com>
 <20210517132039.6czppjfge27x4mwg@tomti.i.net-space.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee89a22d-5f46-51ed-4c46-63cfc60cbafc@suse.com>
Date: Mon, 17 May 2021 15:24:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517132039.6czppjfge27x4mwg@tomti.i.net-space.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.05.2021 15:20, Daniel Kiper wrote:
> On Mon, May 17, 2021 at 08:48:32AM +0200, Jan Beulich wrote:
>> On 07.05.2021 22:26, Bob Eshleman wrote:
>>> What is your intuition WRT the idea that instead of trying add a PE/COFF hdr
>>> in front of Xen's mb2 bin, we instead go the route of introducing valid mb2
>>> entry points into xen.efi?
>>
>> At the first glance I think this is going to be less intrusive, and hence
>> to be preferred. But of course I haven't experimented in any way ...
> 
> When I worked on this a few years ago I tried that way. Sadly I failed
> because I was not able to produce "linear" PE image using binutils
> exiting that days.

What is a "linear" PE image?

> Maybe
> newer binutils are more flexible and will be able to produce a PE image
> with properties required by Multiboot2 protocol.

Isn't all you need the MB2 header within the first so many bytes of the
(disk) image? Or was it the image as loaded into memory? Both should be
possible to arrange for.

Jan

