Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B22D0DD8
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46104.81782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDYF-0004aO-1i; Mon, 07 Dec 2020 10:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46104.81782; Mon, 07 Dec 2020 10:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDYE-0004a1-UU; Mon, 07 Dec 2020 10:15:26 +0000
Received: by outflank-mailman (input) for mailman id 46104;
 Mon, 07 Dec 2020 10:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmDYD-0004Zv-7o
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:15:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a5a6bde-27c8-463a-bf4d-459b1adea722;
 Mon, 07 Dec 2020 10:15:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A99EEAC55;
 Mon,  7 Dec 2020 10:15:23 +0000 (UTC)
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
X-Inumbo-ID: 0a5a6bde-27c8-463a-bf4d-459b1adea722
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607336123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XS6kqLRvxf+KBioev+tUZsKw3t9Cq5o1WWozwu/1000=;
	b=awJ5kDavviU3ognfxNE7hNgrAMy5ap7qB2CDbwDnguPx82oBrlZpvdt7jK364LkcPxGNs5
	ZpFkiQBFhCOlULu+KMclEuo5zXjiEr+flpPz56WL4mmE/FM9D2XZW9pRh+JP1mkAg5nH36
	wZzffaSol5KzA8WvfEz/AHf6iXU52MU=
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
To: Julien Grall <julien@xen.org>
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Eslam Elnikety' <elnikety@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Christian Lindig' <christian.lindig@citrix.com>,
 'David Scott' <dave@recoil.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, paul@xen.org
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
 <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com>
 <011201d6ca16$ae14ac50$0a3e04f0$@xen.org>
 <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com>
 <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org>
 <c5537493-1a6f-cdc1-27dc-a34060e7efc5@suse.com>
 <63af7714-9c03-35b6-99a1-795b678b8032@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93d4ff1c-9f8a-c318-50f8-add2820059d7@suse.com>
Date: Mon, 7 Dec 2020 11:15:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <63af7714-9c03-35b6-99a1-795b678b8032@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.12.2020 11:04, Julien Grall wrote:
> On 07/12/2020 09:17, Jan Beulich wrote:
>> On 04.12.2020 12:45, Julien Grall wrote:
>>> You are making the assumption that the customer would have the choice to
>>> target a specific versions of Xen. This may be undesirable for a cloud
>>> provider as suddenly your customer may want to stick on the old version
>>> of Xen.
>>
>> I've gone from you saying "You really need a solution that can restore
>> the old VM environment, at least temporarily, for that customer." The
>> "temporarily" to me implies that it is at least an option to tie a
>> certain guest to a certain Xen version for in-guest upgrading purposes.
>  >
>> If the deal with the customer doesn't include running on a certain Xen
>> version, I don't see how this could have non-temporary consequences to
>> the cloud provider.
> 
> I think by "you", you mean Paul and not me?

Oh, right, I didn't pay attention to who wrote that text. Sorry.

Jan

