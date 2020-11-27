Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E82C675E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39425.72332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kieLl-0004pr-SM; Fri, 27 Nov 2020 14:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39425.72332; Fri, 27 Nov 2020 14:03:49 +0000
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
	id 1kieLl-0004pS-P4; Fri, 27 Nov 2020 14:03:49 +0000
Received: by outflank-mailman (input) for mailman id 39425;
 Fri, 27 Nov 2020 14:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kieLk-0004pN-H4
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:03:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69c58368-1dbb-4371-b1d4-4e5b0437596a;
 Fri, 27 Nov 2020 14:03:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49A9AABD7;
 Fri, 27 Nov 2020 14:03:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kieLk-0004pN-H4
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:03:48 +0000
X-Inumbo-ID: 69c58368-1dbb-4371-b1d4-4e5b0437596a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 69c58368-1dbb-4371-b1d4-4e5b0437596a;
	Fri, 27 Nov 2020 14:03:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606485826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycPrwFrflduIT4hxw8dZblYgL+FCxgwhp+N1wpEpCDY=;
	b=gpNxKORr+oXYM4ZnPIDe6WZQeRWi4UFdm0Op/L4Yo+4JzxgrcOyG7vXR4WUWTzJ2XXoLLG
	PUWBhsWEnlyjMNjMS5lAjhMrcxBBsGk+kH3E/LrNg1h3sw6ZI5KoVrbDyiozV0fJNuTBBQ
	NJICqP4Kpf11iMX+He40buK/+IC9TNw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 49A9AABD7;
	Fri, 27 Nov 2020 14:03:46 +0000 (UTC)
Subject: Re: [PATCH v8 2/3] xen/events: rework fifo queue locking
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-3-jgross@suse.com>
 <e60e4fce-8c1b-013a-9ec2-20bd2c930619@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7acf5b6-6218-4e4c-b105-c9a20c28ea51@suse.com>
Date: Fri, 27 Nov 2020 15:03:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e60e4fce-8c1b-013a-9ec2-20bd2c930619@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.11.2020 14:58, Julien Grall wrote:
> On 25/11/2020 10:51, Juergen Gross wrote:
>> +    /* If we didn't get the lock bail out. */
>> +    if ( try == 4 )
>> +    {
>> +        gprintk(XENLOG_WARNING,
>> +                "dom%d port %d lost event (too many queue changes)\n",
>> +                d->domain_id, evtchn->port);
> 
> NIT: You can use %pd use in place of dom%d.

Oh, indeed - not just can, but imo really should. I'll record this
for on-commit adjustment, unless a v9 becomes necessary anyway.

Jan

