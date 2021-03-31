Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AFC3501B7
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 15:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103942.198266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbGl-0007AI-Av; Wed, 31 Mar 2021 13:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103942.198266; Wed, 31 Mar 2021 13:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbGl-00079r-7G; Wed, 31 Mar 2021 13:52:27 +0000
Received: by outflank-mailman (input) for mailman id 103942;
 Wed, 31 Mar 2021 13:52:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lRbGj-00079l-5Y
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 13:52:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lRbGj-0003Yp-1M
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 13:52:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lRbGj-0002ep-09
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 13:52:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lRbGa-0007pR-QH; Wed, 31 Mar 2021 14:52:16 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=ha601ufuWA3gjkFhjVblxHpt8Fuyb01LY639RGVAdHI=; b=eSzt8KaeJ8dA/cN+bXii6QYhGq
	wWkLjeqJVn5kYm0MPHBMUVsWN8729+a0ccgzyyJ55B2qdDnkK5S085vqAlSwzMNhLXwKN4X//EuUH
	8lTw8HjdHq2nbSlGv+OK7aNsC26dAFX5qZr1tZ7K5rQeTrme5dq3wbnstHP+3CmnfE+c=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <24676.32400.548088.26254@mariner.uk.xensource.com>
Date: Wed, 31 Mar 2021 14:52:16 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Roger Pau Monne <roger.pau@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Paul Durrant <paul.durrant@citrix.com>
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
In-Reply-To: <2A1FCD39-D0C0-468D-A977-2FBF7126FDE6@citrix.com>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
	<f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
	<FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
	<23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
	<27ecde00-f0aa-b701-6928-5480ed805064@citrix.com>
	<2A1FCD39-D0C0-468D-A977-2FBF7126FDE6@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

George Dunlap writes ("Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out HVM-specific shadow code"):
> I don’t understand why the two of you are downplaying your work so much.  Yes, these are all only incremental improvements; but they are improvements; and the cumulative effect of loads of incremental improvements can be significant.  Communicating to people just what the nature of all these incremental improvements are is important.

I agree with George here.

There ae a number of reasons why behind-the-scenes work with little
(intentional) user-visible impact are useful to note in the
CHANGELOG.md.  With my Release Manager hat on I would like to see, for
example,

>> + - Factored out HVM-specific shadow code, allowing PV shim to be slimmer

something about htis work in the CHANGELOG.md.

IDK precisely, and I don't think George does either, what a good and
accurate statement is.  But I guess we will go with the text above if
we don't get something better.

George, were there other changelog items that were subject to a
a similar question ?  I don't find them in my email with a quick look
but I suspect I have missed one or two ?


Thanks,
Ian,

