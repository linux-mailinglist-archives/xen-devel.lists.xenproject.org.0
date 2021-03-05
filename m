Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22832F034
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 17:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93904.177388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDUr-0005iX-TK; Fri, 05 Mar 2021 16:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93904.177388; Fri, 05 Mar 2021 16:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDUr-0005i8-QB; Fri, 05 Mar 2021 16:40:13 +0000
Received: by outflank-mailman (input) for mailman id 93904;
 Fri, 05 Mar 2021 16:40:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIDUq-0005i3-L0
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:40:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIDUq-0002Kw-I1
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:40:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIDUq-0000bf-Gx
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:40:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIDUl-0000Wf-Qk; Fri, 05 Mar 2021 16:40:07 +0000
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
	bh=+54daDSjbMQyxBm9Jhcjq7BckrOOxNI/SzCB8zdQlj8=; b=Y94JOgGLmwS8L06xrCzIvGn/Zw
	j4d5aVPeYmQIXZh1vgNE3j0ZYTds51VRt+sw0syo0fo1LJINxaZCYfhRUtVyauFrQ3b3QfAA0k/G5
	NwGDkSh1UmxqofNcyFtdpDb8dZs9pXe7UeensbXsbIe8UTX26jAGXwllttME5KYlmu50=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.24295.466588.233219@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 16:40:07 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Tim Deegan <tim@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Wei  Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
In-Reply-To: <2e09dfd0-5da4-bdcc-900b-d40a112d832b@citrix.com>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
	<3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
	<2e09dfd0-5da4-bdcc-900b-d40a112d832b@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path" optimization when running virtualized"):
> This wants backporting to stable releases, so I would recommend for 4.15
> even at this point.

Can someone explain to me the implications of not taking these patch,
and the risks of taking them ?

AFIACT the implications of not taking 1/ are that we would misbehave
in a security relevant way, sometimes, when we are running under
another hypervisor ?

And the implications of not taking 2/ is a performance problem ?

As to the risks, 1/ looks obviously correct even to me.

2/ seems complex.  What would go wrong if there were a misplaced ) or
confused bit-twiddling or something ?

Ian.

