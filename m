Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD072D5BFC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:38:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49224.87017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knM8Z-00058E-R0; Thu, 10 Dec 2020 13:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49224.87017; Thu, 10 Dec 2020 13:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knM8Z-00057s-Nq; Thu, 10 Dec 2020 13:37:39 +0000
Received: by outflank-mailman (input) for mailman id 49224;
 Thu, 10 Dec 2020 13:37:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wUnW=FO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1knM8Y-00057n-Gg
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:37:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0ae76ee-870e-4523-a481-246850d78346;
 Thu, 10 Dec 2020 13:37:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 821CCAB91;
 Thu, 10 Dec 2020 13:37:35 +0000 (UTC)
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
X-Inumbo-ID: b0ae76ee-870e-4523-a481-246850d78346
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607607455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThRX3I6LrR7+gLMCPbddJe3G47KxrjgR4tCww7gTtOk=;
	b=qspkVmk9Q8P9qN8sn8iM5nTnbmtjQxBSDfLbVsWdBC8fgbpPPzHXn2g5YFYGzbIimfrhzb
	MlSAyY/XKb8LYlPuecec3StsbCWZCwONNW19L+uvpJBv/TsByEmGzk/qP6+7Ii3DljbtOw
	Cd7kbHn9w2mN9Q4M1+eAm55c+QW7Z6k=
Subject: Re: [PATCH] x86/HVM: refine when to send mapcache invalidation
 request to qemu
To: Hongyan Xia <hx242@xen.org>, Paul Durrant <paul@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f92f62bf-2f8d-34db-4be5-d3e6a4b9d580@suse.com>
 <c6bcaecf71f9e51bdac15c7f97c8ce8460bef306.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d522f01e-af5f-fc65-2888-2573dbcefcf5@suse.com>
Date: Thu, 10 Dec 2020 14:37:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c6bcaecf71f9e51bdac15c7f97c8ce8460bef306.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.12.2020 14:09, Hongyan Xia wrote:
> On Mon, 2020-09-28 at 12:44 +0200, Jan Beulich wrote:
>> Plus finally there's no point sending the request for the local
>> domain
>> when the domain acted upon is a different one. If anything that
>> domain's
>> qemu's mapcache may need invalidating, but it's unclear how useful
>> this
>> would be: That remote domain may not execute hypercalls at all, and
>> hence may never make it to the point where the request actually gets
>> issued. I guess the assumption is that such manipulation is not
>> supposed
>> to happen anymore once the guest has been started?
> 
> I may still want to set the invalidation signal to true even if the
> domain acted on is not the local domain. I know the remote domain may
> never reach the point to issue the invalidate, but it sounds to me that
> the problem is not whether we should set the signal but whether we can
> change where the signal is checked to make sure the point of issue can
> be reliably triggered, and the latter can be done in a future patch.

One of Paul's replies was quite helpful here: The main thing to
worry about is for the vCPU to not continue running before the
invalidation request was signaled (or else, aiui, qemu may serve
a subsequent emulation request by the guest incorrectly, because
of using the stale mapping). Hence I believe for a non-paused
guest remote operations simply cannot be allowed when the may
lead to the need for invalidation. Therefore yes, if we assume
the guest is paused in such cases, we could drop the "is current"
check, but we'd then still need to arrange for actual signaling
before the guest gets to run again. I wonder whether
handle_hvm_io_completion() (or its caller, hvm_do_resume(),
right after that other call) wouldn't be a good place to do so.

Jan

