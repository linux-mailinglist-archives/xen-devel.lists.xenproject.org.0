Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1D61E6C2
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 23:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439017.692947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ornh6-0004EQ-JC; Sun, 06 Nov 2022 22:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439017.692947; Sun, 06 Nov 2022 22:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ornh6-0004CK-GF; Sun, 06 Nov 2022 22:00:44 +0000
Received: by outflank-mailman (input) for mailman id 439017;
 Sun, 06 Nov 2022 22:00:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ornh4-0004BS-KX
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 22:00:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ornh3-00022f-OT; Sun, 06 Nov 2022 22:00:41 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ornh3-0000Wd-Gm; Sun, 06 Nov 2022 22:00:41 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=E0QzY3t0dt9qxIqpwca2JYCbx4h44HyZ9fvYGROHhzw=; b=AguAF7EEnc6wYrGGY11gWelhiB
	GbS9238xKR+FWo9/JpnFWpl4B0vlNTdpjKyZXkQ7Ko+LWYeSEI+6RVu4F9igwnh7/cHgP+H0G6+D2
	Y+eklX55AzEr/C6+3E05AtfNjDdjBzQWzo/z0jbFACk6WZehLrtfa8Of0GV/N7qJ2bb0=;
Message-ID: <32f61945-08fa-f095-02c4-9d52b66b6c04@xen.org>
Date: Sun, 6 Nov 2022 22:00:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-14-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 13/20] tools/xenstore: don't allow creating too many nodes
 in a transaction
In-Reply-To: <20221101152842.4257-14-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> The accounting for the number of nodes of a domain in an active
> transaction is not working correctly, as it allows to create arbitrary
> number of nodes. The transaction will finally fail due to exceeding
> the number of nodes quota, but before closing the transaction an
> unprivileged guest could cause Xenstore to use a lot of memory.

I have already made some of comments on the security ML when this was 
initially set. The arguments still don't sound right to me.

For a first, since XSA-326, we have a cap in place for the memory a 
domain can consume. So this surely can't be a "lot of memory". Otherwise 
we are saying that our limit (there are other way to hit it) were wrong...

In addition to that, this is quite pointless to check the number of 
entry a domain currently owned because this can change before the 
transaction is committed by another "external" command. Therefore, this 
would add some randomness in the command which could make more difficult 
to diagnose.

Lastly, there are other very easy way to use memory (just create 
multiple transaction in parallel).

So based on the commit message, the change doesn't help at all to make 
better Xenstored.

Note that I don't particularly mind the code change (even though it adds 
more complexity). I just strongly dislike the current justifications.

At the moment, I can't find a justification that would make the change 
whorthwhile.

Cheers,

-- 
Julien Grall

