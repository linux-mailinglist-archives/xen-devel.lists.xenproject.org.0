Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B638233F4BE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 16:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98753.187527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMYWX-0003om-Qq; Wed, 17 Mar 2021 15:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98753.187527; Wed, 17 Mar 2021 15:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMYWX-0003oN-NK; Wed, 17 Mar 2021 15:55:53 +0000
Received: by outflank-mailman (input) for mailman id 98753;
 Wed, 17 Mar 2021 15:55:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMYWX-0003oI-4Y
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:55:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMYWX-0000t2-0h
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:55:53 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMYWW-0000cF-Vm
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:55:52 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lMYWT-0002RV-O0; Wed, 17 Mar 2021 15:55:49 +0000
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
	bh=OQNfc1t/LhbslkH3XFWi8ft0jVggZWvGBzN/q0y6Gto=; b=JfjQQlfa0MRUR2mrOi/dxF+iIY
	9t6pNILNem3hKEir0szDnRP5OI/K7SB+46bqSMCgM7pjS9LDvkbHllKhSrhDM0JjZ1U9EZcSPlbhJ
	IsHb5fIPmX6rbigYfMuZ6iYYClfAUHJLe1hFlqzH5ViL+3xybeD06/RCiNXN+uaqJaNo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24658.9861.547014.443884@mariner.uk.xensource.com>
Date: Wed, 17 Mar 2021 15:55:49 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Subject: Re: libxl / xen-pciback interaction [and 1 more messages]
In-Reply-To: <11bf64f2-401d-03cb-59d7-a84b5c56552e@suse.com>
References: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>
	<fb22429c-4f33-4d13-1861-977d093ba471@suse.com>
	<24658.7286.533794.293151@mariner.uk.xensource.com>
	<11bf64f2-401d-03cb-59d7-a84b5c56552e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: libxl / xen-pciback interaction [and 1 more messages]"):
> On 17.03.2021 16:12, Ian Jackson wrote:
> > How does what libxl is doing differ from a setup, immediately followed
> > by a hot-add ?
> 
> In the hot-add case libxl drives things through Reconfiguring state.
> I'm not sure this would be an appropriate (and backwards compatible)
> thing to do when initially populating xenstore.

Ah.  Tbanks, that is precisely the answer to my question.

I think that means, therefore, populating the whole lot in one
transaction.

(From what you say it doesn't sound like it's possible to write only a
subset, perhaps with state "not ready yet" and then set them all go
"go" at the end.)

Ian.

