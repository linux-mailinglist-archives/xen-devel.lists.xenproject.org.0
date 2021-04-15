Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43770360BF1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111311.212889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX37A-0001kN-Q1; Thu, 15 Apr 2021 14:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111311.212889; Thu, 15 Apr 2021 14:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX37A-0001jy-MO; Thu, 15 Apr 2021 14:37:04 +0000
Received: by outflank-mailman (input) for mailman id 111311;
 Thu, 15 Apr 2021 14:37:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX379-0001jt-Bp
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:37:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d86dc4cd-7cdc-4d3d-acb1-dee3387dc1f2;
 Thu, 15 Apr 2021 14:37:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1C1DAEF8;
 Thu, 15 Apr 2021 14:37:01 +0000 (UTC)
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
X-Inumbo-ID: d86dc4cd-7cdc-4d3d-acb1-dee3387dc1f2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618497422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZlS98NHmwDXI5M5NUNK41/xF6syR9ld807hzb3h5W60=;
	b=X9BFV+RDQIOhhbZzNoXbzY7ccsPFWz+2VOhcZVr8eZqfNaZOAVszZmKZX82cVOvqB19naa
	vJCRO7RFwT9Fj+tpK4/TG9j1CLjhOhnFra3uqyEVIOILEzDJMHUHmHAhI9l9stKjOLWAO/
	NmUOZAkR1IlMpmX8X8IhOZJvkIeX7eA=
Subject: Re: [PATCH v3 15/15] unzstd: make helper symbols static
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <22549ef3-62a7-955e-e2ad-8bd47f832b68@suse.com>
 <8b5313db-1445-7d70-ac04-d8609d042108@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95a83c6a-8828-d0c5-36cd-a5659da290a5@suse.com>
Date: Thu, 15 Apr 2021 16:37:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <8b5313db-1445-7d70-ac04-d8609d042108@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 14:09, Julien Grall wrote:
> On 26/01/2021 09:53, Jan Beulich wrote:
>> While for the original library's purposes these functions of course want
>> to be externally exposed, we don't need this, and we also don't want
>> this both to prevent unintended use and to keep the name space tidy.
>> (When functions have no callers at all, wrap them with a suitable
>> #ifdef.) This has the added benefit of reducing the resulting binary
>> size - while this is all .init code, it's still desirable to not carry
>> dead code.
> 
> So why do we keep the code if it is not used? Do you expect it to be 
> re-used in the future?

I expect future patch imports from Linux to be easier to apply when the
code is at least fundamentally the same as what we took from there
originally.

Jan

