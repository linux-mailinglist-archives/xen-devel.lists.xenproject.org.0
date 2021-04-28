Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCF36D5E4
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 12:43:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119201.225601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhel-0000D1-QE; Wed, 28 Apr 2021 10:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119201.225601; Wed, 28 Apr 2021 10:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhel-0000Cc-N3; Wed, 28 Apr 2021 10:42:59 +0000
Received: by outflank-mailman (input) for mailman id 119201;
 Wed, 28 Apr 2021 10:42:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbhej-0000CX-Az
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 10:42:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bbbbc7c-38f2-4c31-83f2-b28423764023;
 Wed, 28 Apr 2021 10:42:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CAEBB0E5;
 Wed, 28 Apr 2021 10:42:55 +0000 (UTC)
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
X-Inumbo-ID: 1bbbbc7c-38f2-4c31-83f2-b28423764023
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619606575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+LOGq98ESKwX8CsvSDyYlHh1rsJb1mlOPfegjkDhoLU=;
	b=DFSRzA3NSX3QldD8u7NVmCpR3kME4fwjQ5DE/FyWF/fl8dcuChgeBkvfMZu35lJ7br86H/
	wVCIw+Alzc0W+CHzoW4yGN04TTbrTPA/MHqynJuL8isKjRcoYVJQcejTAsYdR1jB84LR7P
	Ca1PHdpaSWtgTsU0ZAKe01aWpe+CKxM=
Subject: Re: obtain a list of granttable PFNs from toolstack
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20210428095049.14a8272b.olaf@aepfle.de>
 <8427397f-0953-94df-04f6-8dfe2a4ceee8@suse.com>
 <20210428121701.3272b369.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d508af0b-dd4a-7c13-f33e-bc60a4fb7272@suse.com>
Date: Wed, 28 Apr 2021 12:42:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428121701.3272b369.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.04.2021 12:17, Olaf Hering wrote:
> Am Wed, 28 Apr 2021 11:49:59 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
>> On 28.04.2021 09:50, Olaf Hering wrote:
>>> Is there an API to get a list of PFNs which are currently being active in the grant table for a given domid?  
>> 
>> Also, what do you mean by "active in the grant table"?
> 
> I'm not familiar with grants. My guess is, a domU pro-actively shares some of its pages with someone else. These shared pages have to be tracked somewhere, and I guess Xen has to establish proper access permissions for such pages. I guess the "grant table" is the place where things are collected.

The grant table is where the guest stores which pages it allows to
be accessed by which other domains. Upon request to access a grant,
Xen then updates that table entry to indicate what access is
currently in progress.

> Looking through xen/grant_table.h, I see no API. But that might be the wrong place anyway.

There's none, and so far I can't see a reason why one would be
wanted / needed. Any inspection results are immediately stale
afterwards, as there's no synchronization at all to what guests
may put when into their grant table.

It might help if you would outline what you're actually after by
knowing a domain's active grants.

Jan

