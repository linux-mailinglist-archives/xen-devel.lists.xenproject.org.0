Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1343A28CCB1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 13:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6167.16293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSIje-0001fE-Rs; Tue, 13 Oct 2020 11:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6167.16293; Tue, 13 Oct 2020 11:44:54 +0000
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
	id 1kSIje-0001er-Od; Tue, 13 Oct 2020 11:44:54 +0000
Received: by outflank-mailman (input) for mailman id 6167;
 Tue, 13 Oct 2020 11:44:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSIjd-0001em-DF
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:44:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb37e374-d1f9-41ad-8843-7b712c331079;
 Tue, 13 Oct 2020 11:44:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8774AAD39;
 Tue, 13 Oct 2020 11:44:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSIjd-0001em-DF
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:44:53 +0000
X-Inumbo-ID: eb37e374-d1f9-41ad-8843-7b712c331079
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id eb37e374-d1f9-41ad-8843-7b712c331079;
	Tue, 13 Oct 2020 11:44:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602589491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0ckmOjrWj4qFkWbwQzLX9Dnp9ZMcEHxH0eIXmqXS/c=;
	b=MZB46vjr/lDxEWdA1+72aKChgOvVUWxNe+BJCtAAf6yLOpozRCUZMQ4veGgj1NZu6CuB65
	9Nr+SqjhJLK7EYt3XHoyUABRvec3Zl3TtBzETybilpwvW75qt68ZvMMzoyWSkWGOdIyUQ/
	2XG+BWBQtC81IHfIPuIEV4WAAP7MJKg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8774AAD39;
	Tue, 13 Oct 2020 11:44:51 +0000 (UTC)
Subject: Re: [PATCH v9 1/8] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 'Julien Grall' <julien@xen.org>, 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-2-paul@xen.org>
 <2e51a5cb-df0c-d564-2a7b-5f2abbb5872c@citrix.com>
 <000201d69aed$fe07a990$fa16fcb0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <769dcdc2-a77d-47fa-e66a-2e2d92ec0e1c@suse.com>
Date: Tue, 13 Oct 2020 13:44:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <000201d69aed$fe07a990$fa16fcb0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.10.2020 10:03, Paul Durrant wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 02 October 2020 22:20
>>
>> On 24/09/2020 14:10, Paul Durrant wrote:
>>> +int domain_save_end(struct domain_context *c)
>>> +{
>>> +    struct domain *d = c->domain;
>>> +    size_t len = ROUNDUP(c->len, DOMAIN_SAVE_ALIGN) - c->len; /* padding */
>>
>> DOMAIN_SAVE_ALIGN - (c->len & (DOMAIN_SAVE_ALIGN - 1))
>>
>> isn't vulnerable to overflow.
>>
> 
> ...and significantly uglier code. What's actually wrong with what I wrote?

I don't think there's anything "wrong" or "vulnerable" here, but
I still can see Andrew's point. The "vulnerable" aspect applies
only in the (highly hypothetical I think) cases of either
sizeof(size_t) < sizeof(int) or size_t being a signed type, afaict.
But since it's easy (and imo not "significantly uglier") to write
code that is free of any wrapping or overflowing behavior, I
think it is sensible to actually write it that way.

Jan

