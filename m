Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513A93501BA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 15:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103948.198290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbIV-0007OB-V0; Wed, 31 Mar 2021 13:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103948.198290; Wed, 31 Mar 2021 13:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbIV-0007Nm-Rl; Wed, 31 Mar 2021 13:54:15 +0000
Received: by outflank-mailman (input) for mailman id 103948;
 Wed, 31 Mar 2021 13:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRbIV-0007Nh-2A
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 13:54:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdb6cf07-7cd8-4f8e-a4c3-34259fd0586d;
 Wed, 31 Mar 2021 13:54:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72EDFB270;
 Wed, 31 Mar 2021 13:54:13 +0000 (UTC)
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
X-Inumbo-ID: fdb6cf07-7cd8-4f8e-a4c3-34259fd0586d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617198853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N/UHw2rhp5oWwtg8Oo0kCiW/jQ/cE+RiYjb15XuDshc=;
	b=iWi/y77kMUsJnmSSRt8aKO/1roG9Z6LyfaN9yDAC3uwMPAowmJsp2P0GjNl4iGxhsJ+cHw
	KqHGyfeD2Bp4N0tWOf0QBoDWab6zv6s5nes3xAeXpga7xjHtie90rVxG0NEXa9u9ewIXH4
	pNyuJRYrEgqZaW3zdvCKVHR9xR7Vrps=
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
To: Ian Jackson <iwj@xenproject.org>, George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
 <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
 <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
 <23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
 <27ecde00-f0aa-b701-6928-5480ed805064@citrix.com>
 <2A1FCD39-D0C0-468D-A977-2FBF7126FDE6@citrix.com>
 <24676.32400.548088.26254@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a87cfa9-d6c0-5da5-ea07-eae47186da9a@suse.com>
Date: Wed, 31 Mar 2021 15:54:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <24676.32400.548088.26254@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.03.2021 15:52, Ian Jackson wrote:
> George Dunlap writes ("Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out HVM-specific shadow code"):
>> I don’t understand why the two of you are downplaying your work so much.  Yes, these are all only incremental improvements; but they are improvements; and the cumulative effect of loads of incremental improvements can be significant.  Communicating to people just what the nature of all these incremental improvements are is important.
> 
> I agree with George here.
> 
> There ae a number of reasons why behind-the-scenes work with little
> (intentional) user-visible impact are useful to note in the
> CHANGELOG.md.  With my Release Manager hat on I would like to see, for
> example,
> 
>>> + - Factored out HVM-specific shadow code, allowing PV shim to be slimmer
> 
> something about htis work in the CHANGELOG.md.
> 
> IDK precisely, and I don't think George does either, what a good and
> accurate statement is.  But I guess we will go with the text above if
> we don't get something better.

At the very least the part after the comma ought to be deleted. As
said in an earlier reply, at least the shim default config disables
shadow code anyway, so the factoring out has no effect there.

Jan

