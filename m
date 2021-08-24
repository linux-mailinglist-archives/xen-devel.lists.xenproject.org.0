Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012F3F6185
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 17:24:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171603.313123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYGs-00011M-Pk; Tue, 24 Aug 2021 15:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171603.313123; Tue, 24 Aug 2021 15:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYGs-0000zK-MO; Tue, 24 Aug 2021 15:23:26 +0000
Received: by outflank-mailman (input) for mailman id 171603;
 Tue, 24 Aug 2021 15:23:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIYGr-0000zE-0S
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 15:23:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIYGq-0006HP-5T; Tue, 24 Aug 2021 15:23:24 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIYGp-0007VJ-VZ; Tue, 24 Aug 2021 15:23:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=9VlB5y6xDyVqAewaB2KIPKiblcWJEolFShIMoFNvjsA=; b=TD9qWuGehWhWTY1eUkz/7yaeQX
	HIwoJ7uN1W//3ciYZZFYY0bzV+ovC7XR6IRNSG24PQsfbFFlDactngRsOUvlGcKQZiml13i1zextK
	AoP54JMA7ufF+z0KnhkXOMFg9PTdRxVg/IZvnVUy2vTy/bzSIdkks8in5fwyciw4KJms=;
Subject: Re: [XEN PATCH v7 10/51] build,arm: move LDFLAGS change to arch.mk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-11-anthony.perard@citrix.com>
 <b5c93c83-1d32-c71b-c4c5-36d2fc00dfa2@xen.org> <YSUJfGcyBXxPNg8B@perard>
From: Julien Grall <julien@xen.org>
Message-ID: <6ac5daae-c3ee-4854-1480-111a9378e7ab@xen.org>
Date: Tue, 24 Aug 2021 16:23:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSUJfGcyBXxPNg8B@perard>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 24/08/2021 16:00, Anthony PERARD wrote:
> On Tue, Aug 24, 2021 at 01:50:33PM +0100, Julien Grall wrote:
>> Hi Anthony,
>>
>> Can you explain why this is moved?
> 
> Well, it was in the wrong place, it is best to avoid making changes to
> XEN_CFLAGS or XEN_LDFLAGS in Makefile in subdirectories as those are
> exported variable and may not work as expected. They may or may not
> change *flags in subdirectories, or in the case of arch/*/Makefile, they
> might changes *flags in the other directories or not depending on
> whether one try to build "xen" or just "common/".
> 
> But more importantly, with patch
>      build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile
> make isn't going to load arch/*/Makefile before building the rest of
> xen, and thus changes to XEN_LDFLAGS will only apply to arch/*/Makefile
> rather than for all objects. (XEN_LDFLAGS is used with all built_in.o
> and few other places like for libfdt-temp.o)

Thanks for the explanation. That makes sense.

> 
> If you want an explanation in the commit message, maybe this one will
> do:
>      Changes to XEN_LDFLAGS may or may not apply to targets in for
>      example "common/" depending on whether one runs `make` or `make
>      common/`.
> 
>      But arch.mk is loaded before doing any build, so changes to LDFLAGS
>      there mean that the value of XEN_LDFLAGS won't depends on the
>      initial target.

An explanation in the commit message would be useful. This one you 
provided looks good. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Can it be merged before the previous patch? If so, I can update the 
commit message and commit it.

Cheers,

-- 
Julien Grall

