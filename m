Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47C2687E0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkP4-0004o1-4n; Mon, 14 Sep 2020 09:04:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHkP2-0004nw-AL
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:04:00 +0000
X-Inumbo-ID: 1b25a133-86c4-4c07-a92b-7b4e27acde34
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b25a133-86c4-4c07-a92b-7b4e27acde34;
 Mon, 14 Sep 2020 09:03:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A960BAC46;
 Mon, 14 Sep 2020 09:04:03 +0000 (UTC)
Subject: Re: Adopting the Linux Kernel Memory Model in Xen?
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1bc70974-2efb-2e73-34bf-bdd3c1d0ef96@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4d6013d-04fd-e818-7a72-c1eede136de9@suse.com>
Date: Mon, 14 Sep 2020 11:03:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1bc70974-2efb-2e73-34bf-bdd3c1d0ef96@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.09.2020 18:33, Julien Grall wrote:
> At the moment, Xen doesn't have a formal memory model. Instead, we are 
> relying on intuitions. This can lead to heated discussion on what can a 
> processor/compiler do or not.
> 
> We also have some helpers that nearly do the same (such as 
> {read,write}_atomic() vs ACCESS_ONCE()) with no clear understanding 
> where to use which.
> 
> In the past few years, Linux community spent a lot of time to write down 
> their memory model and make the compiler communities aware of it (see 
> [1], [2]).
> 
> There are a few reasons I can see for adopting LKMM:
>     - Xen borrows a fair amount of code from Linux;
>     - There are efforts to standardize it;
>     - This will allow us to streamline the discussion.

While I agree with the goal, I'm uncertain about the last of the
three points above, at least as long as we're "blindly" taking
whatever they do or decide. Over the years they've changed their
implementation a number of time afaict, in order to deal with
"disagreements" between it and what compilers actually do and/or can
be expected to guarantee. Yes, the Linux community is much bigger
than ours, and hence chances are far better for someone there to
notice and correct flaws or oversights, yet I still think it cannot
be the goal to silence discussions on our side, even if they tend to
be unpleasant for (almost) everyone involved.

One additional thing needs to be kept in mind imo, especially also
having seen Andrew's reply: If we more formally tie ourselves to
their model (and I agree with him that informally we already do so
anyway in sufficiently large a degree), we need to take measures to
make sure we also adjust our code when they adjust theirs.

Jan

