Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF5B2C65D7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 13:42:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39258.72085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kid42-0003TR-E9; Fri, 27 Nov 2020 12:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39258.72085; Fri, 27 Nov 2020 12:41:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kid42-0003T2-Ap; Fri, 27 Nov 2020 12:41:26 +0000
Received: by outflank-mailman (input) for mailman id 39258;
 Fri, 27 Nov 2020 12:41:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kid40-0003Sx-Kp
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 12:41:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fe60f9b-f8f4-4bfc-8ab1-f66f683997c9;
 Fri, 27 Nov 2020 12:41:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11110ABD7;
 Fri, 27 Nov 2020 12:41:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kid40-0003Sx-Kp
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 12:41:24 +0000
X-Inumbo-ID: 1fe60f9b-f8f4-4bfc-8ab1-f66f683997c9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1fe60f9b-f8f4-4bfc-8ab1-f66f683997c9;
	Fri, 27 Nov 2020 12:41:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606480882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpTXQ5Mz0ZKtF3bYca2oj+FdcO+JKV15TV7OhmMqy5c=;
	b=Z8ZLMoFlzKPKPbSENzXCarLqAfJyA/Y8OjwwYPHkvlu/pPgA2Xfm4Rv7I9AgC8Sv6sCtJz
	6fNbQef5OqFfsKQevpltlM69PUD6lV22C6WroEQ8tJUd5JBKiUQ6Da5DUdQ5coOMVHHWN2
	s0W33MAyFiGcOhAdo6Nx3gfmSsZ9EYI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 11110ABD7;
	Fri, 27 Nov 2020 12:41:22 +0000 (UTC)
Subject: Re: [PATCH v8 1/3] xen/events: modify struct evtchn layout
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-2-jgross@suse.com>
 <4c054bdb-e74a-4ca8-ede3-8df3874b39fb@suse.com>
 <2b135f7e-1222-9267-7755-6fe46f4f2fd8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26b90736-61eb-8fa3-54e4-0c3ac07d234e@suse.com>
Date: Fri, 27 Nov 2020 13:41:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2b135f7e-1222-9267-7755-6fe46f4f2fd8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.11.2020 12:57, Julien Grall wrote:
> On 27/11/2020 11:42, Jan Beulich wrote:
>> I have to admit though that I'm not fully happy with the uses of
>> "unsigned char" and "unsigned short". Yes, I did ask for this
>> change (based on ./CODING_STYLE), but I did also hint towards the
>> use of bitfields. If bitfields aren't an option here to achieve
>> the desired dense packing, perhaps this desire should be permitted
>> as another reason to use fixed width types. (Question goes more
>> towards everyone who cares than to you specifically.)
> 
> I think uint*_t would make sense here because they are storing 
> information received from an hypercall (all the fields should be fixed 
> size there).

"storing information received from a hypercall" is specifically
not a reason to use fixed width types, imo. All of uint8_t,
uint16_t, and uint32_t values coming from hypercalls are fine to
be passed around and stored as unsigned int, just as an example.
It is solely the packing aspect which might matter here.

> But I am also fine the current patch as it is still readable.

Good, thanks for checking.

Jan

