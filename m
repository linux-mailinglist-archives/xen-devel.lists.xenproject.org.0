Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D264E9A33
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 16:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295487.502835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYqnB-0001un-NT; Mon, 28 Mar 2022 14:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295487.502835; Mon, 28 Mar 2022 14:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYqnB-0001sy-KX; Mon, 28 Mar 2022 14:56:25 +0000
Received: by outflank-mailman (input) for mailman id 295487;
 Mon, 28 Mar 2022 14:56:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nYqn9-0001sq-O5
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 14:56:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nYqn8-00076a-Mk; Mon, 28 Mar 2022 14:56:22 +0000
Received: from [54.239.6.185] (helo=[192.168.7.207])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nYqn8-0002H9-El; Mon, 28 Mar 2022 14:56:22 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=AEiVRGJ65+jNKkDH5F2a1+8BxSzrW7vBunmra+Lhx04=; b=e8osn9/cFEg3XdlFZI4FT+yaZv
	+g4dcKmXWsqkBGtzQ4R+DiSFlPR638TlKYcZ5yyT9QExf22CqnzHBrshTabUcbFKQ0OSbXhNIMeyM
	/HfWcva04TV+S7S71bmSLTz5z8OpHn6MWdzRapzswNpZ5eABaG1yKkfiDJPOKrjz5UPs=;
Message-ID: <13f86610-6766-4344-2b10-4369fb7a2698@xen.org>
Date: Mon, 28 Mar 2022 15:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "Daniel P. Smith" <dpsmith.dev@gmail.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
 <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
 <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
 <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
 <da700983-759b-2de6-9c36-0d09c6b06c0d@xen.org>
 <alpine.DEB.2.22.394.2203251313350.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203251313350.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/03/2022 21:05, Stefano Stabellini wrote:
> On Fri, 25 Mar 2022, Julien Grall wrote: > As a contributor, sadly I won't be able to spend a lot of time on this
> in the following months. If a significant rework is required, I don't
> think I'll be able to do it, at least not for this Xen release (and it
> would be nice to have dom0less PV drivers in the coming release.) If
> Daniel is willing, I could add his "idle_domain is_priv" patch to this
> series.  Not as clean as a proper constructor domain but it would work
> and it would be simple. It could be evolved into a nicer constructor
> domain later.
> 
> This is not my preference but I could do that if Julien and Jan prefer
> this approach and if Daniel is happy to share his patch.

This is still my preference because we are avoiding to push the problem 
to the unlucky person that will need to introduce another (or multiple) 
'skip_xsm'.

>> AFAIU, your proposal is to duplicate code. This brings other risks such as
>> duplicated bug and more code to maintain.
> 
> Got it. I'll make one last attempt at a proposal that doesn't involve
> the fake constructor domain. The goal is to avoid code duplication while
> providing a safe way forward to make progress with only a small amount
> of changes. What if we:
> 
> - rename evtchn_alloc_unbound to _evtchn_alloc_unbound (still static)
> - add a skip_xsm parameter to _evtchn_alloc_unbound
> - introduce a wrapper evtchn_alloc_unbound that always set skip_xsm to
>    false (same interface as today's evtchn_alloc_unbound)
> - introduce an __init early_evtchn_alloc_unbound public function that
>    sets skip_xsm to true
> 
> This way:
> - we have a single implementation in _evtchn_alloc_unbound (no code
>    duplication)
> - the only function exposed that skips the XSM check is __init
> - evtchn_alloc_unbound continue to have the XSM check same as today
> 
> 
> E.g.:
> static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
> {
>      ...
> }
> 
> static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> {
>      return _evtchn_alloc_unbound(alloc, false);
> }
> 
> int __init early_evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> {
>      return _evtchn_alloc_unbound(alloc, true);
> }
> 
> 
> Would this be good enough for now?

I would be OK with that. Note that, I think we need to protect the use 
of skip_xsm with evaluate_nospec().

Cheers,

-- 
Julien Grall

