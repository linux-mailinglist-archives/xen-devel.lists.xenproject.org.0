Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261BC2688A8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:41:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkzF-00018g-9p; Mon, 14 Sep 2020 09:41:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LHiq=CX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kHkzD-00018X-Qa
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:41:23 +0000
X-Inumbo-ID: 118571f0-3e38-4523-ac3f-add6573d2329
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 118571f0-3e38-4523-ac3f-add6573d2329;
 Mon, 14 Sep 2020 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=1Pyk/qi2AbRez1GFXfO0zrJ5LhZFCybBCux0RleuJEI=; b=6hk/x6wZHj9Gahpl5ZY726b6my
 xFz4e65aumi3DYoMFiApRDBwOwlNaEwqxkysFyNgflymlyQyvuz3uzSPia+D+SyeCvAyQ3l9aF1br
 2Nb5DF5XDJIwGoCoS0CfOl5shZYlBvAd7vKVFdO8+FEhms7YPgHWBKbxnC+pD99nVkVg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHkyx-0002AO-1K; Mon, 14 Sep 2020 09:41:07 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHkyw-0004V9-Oh; Mon, 14 Sep 2020 09:41:06 +0000
Subject: Re: Adopting the Linux Kernel Memory Model in Xen?
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1bc70974-2efb-2e73-34bf-bdd3c1d0ef96@xen.org>
 <b4d6013d-04fd-e818-7a72-c1eede136de9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <258ccd67-9c7b-a237-940c-958920646db9@xen.org>
Date: Mon, 14 Sep 2020 10:41:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b4d6013d-04fd-e818-7a72-c1eede136de9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Jan,

On 14/09/2020 10:03, Jan Beulich wrote:
> On 11.09.2020 18:33, Julien Grall wrote:
>> At the moment, Xen doesn't have a formal memory model. Instead, we are
>> relying on intuitions. This can lead to heated discussion on what can a
>> processor/compiler do or not.
>>
>> We also have some helpers that nearly do the same (such as
>> {read,write}_atomic() vs ACCESS_ONCE()) with no clear understanding
>> where to use which.
>>
>> In the past few years, Linux community spent a lot of time to write down
>> their memory model and make the compiler communities aware of it (see
>> [1], [2]).
>>
>> There are a few reasons I can see for adopting LKMM:
>>      - Xen borrows a fair amount of code from Linux;
>>      - There are efforts to standardize it;
>>      - This will allow us to streamline the discussion.
> 
> While I agree with the goal, I'm uncertain about the last of the
> three points above, at least as long as we're "blindly" taking
> whatever they do or decide. Over the years they've changed their
> implementation a number of time afaict, in order to deal with
> "disagreements" between it and what compilers actually do and/or can
> be expected to guarantee. Yes, the Linux community is much bigger
> than ours, and hence chances are far better for someone there to
> notice and correct flaws or oversights, yet I still think it cannot
> be the goal to silence discussions on our side, even if they tend to
> be unpleasant for (almost) everyone involved.

Xen-devel (or security@) is not suited for arguing on how a 
compiler/processor should behave (or not). We don't have the expertise 
for making a proper decision.

Don't get me wrong, I am not trying to silence discussion but rather 
move them to the correct forum.

If we adopt the LKMM, then all the discussions on Xen-devel could be 
reduced to whether the code match the formal model.

If there are any questions on the model, then they would be raised 
directly with the LKMM team. They can then assess if they need to update
the model.

> 
> One additional thing needs to be kept in mind imo, especially also
> having seen Andrew's reply: If we more formally tie ourselves to
> their model (and I agree with him that informally we already do so
> anyway in sufficiently large a degree), we need to take measures to
> make sure we also adjust our code when they adjust theirs.

This makes perfect sense. I would expect the effort to be quite minimal 
in long term.

Cheers,

-- 
Julien Grall

