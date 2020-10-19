Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D27292933
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 16:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8724.23392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUW2R-000289-IC; Mon, 19 Oct 2020 14:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8724.23392; Mon, 19 Oct 2020 14:21:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUW2R-00027k-EV; Mon, 19 Oct 2020 14:21:27 +0000
Received: by outflank-mailman (input) for mailman id 8724;
 Mon, 19 Oct 2020 14:21:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUW2P-00027f-Qa
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:21:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee4737ec-21bb-451f-8947-1273f4065393;
 Mon, 19 Oct 2020 14:21:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46496AFD7;
 Mon, 19 Oct 2020 14:21:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUW2P-00027f-Qa
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 14:21:25 +0000
X-Inumbo-ID: ee4737ec-21bb-451f-8947-1273f4065393
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ee4737ec-21bb-451f-8947-1273f4065393;
	Mon, 19 Oct 2020 14:21:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603117284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWHYh1SsJxYGo0Nv55Nki964xR3/rN0Hml5imNVbnRc=;
	b=W+dc3vNa9qAgN34yJCZVMBHZKXSDxI2wB/9zY2CKvymIaLG9V0K+R6QXMnxqf5SGnbRiKW
	RDoNNHZrcb21m9lAE7ZVLYG+6YPx5MDmqCZCJgcd10/g5rHpOYP8+AD2tlQOVDXKzPRnu0
	QYtDAW7cWpa6pm64ZXnhoSxt0rqTq8Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 46496AFD7;
	Mon, 19 Oct 2020 14:21:24 +0000 (UTC)
Subject: Re: [PATCH] SVM: avoid VMSAVE in ctxt-switch-to
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a01862b8-6e16-5ddc-7f48-2d3bed2f34b6@suse.com>
 <9d0cae4e-f849-f2a3-4261-d3efb977deeb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <b3b581fc-b1c9-cdc2-add6-900a4305623a@suse.com>
Date: Mon, 19 Oct 2020 16:21:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <9d0cae4e-f849-f2a3-4261-d3efb977deeb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.10.2020 16:10, Andrew Cooper wrote:
> On 19/10/2020 14:40, Jan Beulich wrote:
>> Of the state saved by the insn and reloaded by the corresponding VMLOAD
>> - TR, syscall, and sysenter state are invariant while having Xen's state
>>   loaded,
>> - FS, GS, and LDTR are not used by Xen and get suitably set in PV
>>   context switch code.
> 
> I think it would be helpful to state that Xen's state is suitably cached
> in _svm_cpu_up(), as this does now introduce an ordering dependency
> during boot.

I've added a sentence.

> Is it possibly worth putting an assert checking the TR selector?  That
> ought to be good enough to catch stray init reordering problems.

How would checking just the TR selector help? If other pieces of TR
or syscall/sysenter were out of sync, we'd be hosed, too.

I'm also not sure what exactly you mean to do for such an assertion:
Merely check the host VMCB field against TSS_SELECTOR, or do an
actual STR to be closer to what the VMSAVE actually did?

>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Either way, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

