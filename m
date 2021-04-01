Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A0351551
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 15:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104486.199873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxbU-0007LM-2h; Thu, 01 Apr 2021 13:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104486.199873; Thu, 01 Apr 2021 13:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxbT-0007Kx-Vs; Thu, 01 Apr 2021 13:43:19 +0000
Received: by outflank-mailman (input) for mailman id 104486;
 Thu, 01 Apr 2021 13:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRxbS-0007Ks-AG
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:43:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8411d6d6-b774-4778-a803-b2d8168943f2;
 Thu, 01 Apr 2021 13:43:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5F38AF23;
 Thu,  1 Apr 2021 13:43:16 +0000 (UTC)
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
X-Inumbo-ID: 8411d6d6-b774-4778-a803-b2d8168943f2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617284597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KrgYsx1UP6iZuNfaU2C4DpL8Uvgwht3nbDd3oOYHCZk=;
	b=R0nfvDDx3MsC+2xnyhgScJVGsQ+wFaKMUepGsMk98XDnQW/nkyCLoVwv1mNkbxNJXpkNtL
	3vMPn/RPOl3XtJDUQjfJnGYldwsq8QDCxfd8uXba4oQrj6YiOGTAySV9jxUFpqnGBCWQIV
	tqcmP3IpFKIsBKvk+UlzupZb7bIO9TU=
Subject: Re: [PATCH 00/23] further population of xen/lib/
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <27916fa0-9ebd-a49a-bbb9-1ef47c2b5bf6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f745d03-baa8-e9e6-692c-f9c9f401b766@suse.com>
Date: Thu, 1 Apr 2021 15:43:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <27916fa0-9ebd-a49a-bbb9-1ef47c2b5bf6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 13:54, Julien Grall wrote:
> On 01/04/2021 11:14, Jan Beulich wrote:
>> This is to dissolve / move xen/common/lib.c and xen/common/string.c.
>> One benefit of moving these functions into an archive is that we can
>> drop some of the related __HAVE_ARCH_* #define-s: By living in an
>> archive, the per-arch functions will preempt any loading of the
>> respective functions (objects) from the archive. (Down the road we
>> may want to move the per-arch functions into archives as well, at
>> which point the per-arch archive(s) would need to be specified ahead
>> of the common one(s) to the linker.)
> 
> While I think it is a good idea to move code in xen/lib, I am not 
> convinced that having a single function per file is that beneficial.
> 
> Do you have numbers showing how much Xen will shrink after this series?

In the default build, from all I was able to tell, there's one function
that's unused (strspn(), as mentioned in the respective patch description).
I don't think I've been claiming any space savings here, though, so I
wonder why you make this a criteria at all. The functions being one per
CU is such that they can be individually overridden by an arch, without
pulling in dead code.

Jan

