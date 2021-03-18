Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19E2340175
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 10:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98853.187764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lModV-0000ho-CY; Thu, 18 Mar 2021 09:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98853.187764; Thu, 18 Mar 2021 09:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lModV-0000hP-94; Thu, 18 Mar 2021 09:08:09 +0000
Received: by outflank-mailman (input) for mailman id 98853;
 Thu, 18 Mar 2021 09:08:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYlD=IQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lModT-0000hK-LV
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 09:08:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 116e30d0-bdd8-469d-bba7-0a9881f93a54;
 Thu, 18 Mar 2021 09:08:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB3AAAC17;
 Thu, 18 Mar 2021 09:08:05 +0000 (UTC)
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
X-Inumbo-ID: 116e30d0-bdd8-469d-bba7-0a9881f93a54
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616058486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObbefyfY7RVzriGhjjAbBIa8n8g+c4OQjcZK1J0V2wU=;
	b=YuEdH6eqaXxshxd8sohByjfR1e/uU8Udv/QR5Sovb1RvxE1plD9K1rmxi7KuAqaFgtI5ED
	24tvwCSQ3p0/hchbzC35ldjQO+NT5ywbMsCUxZxrfdOIt2wVH5Sso0MehAvvxOxnUfv9bx
	qwVd5bximTYL9bnnFq+Zs6RoD5AiLns=
Subject: Re: libxl / xen-pciback interaction [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>
References: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>
 <fb22429c-4f33-4d13-1861-977d093ba471@suse.com>
 <24658.7286.533794.293151@mariner.uk.xensource.com>
 <11bf64f2-401d-03cb-59d7-a84b5c56552e@suse.com>
 <24658.9861.547014.443884@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <efd39237-f410-a6c3-a82e-7f4ea98c5735@suse.com>
Date: Thu, 18 Mar 2021 10:08:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24658.9861.547014.443884@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.03.2021 16:55, Ian Jackson wrote:
> Jan Beulich writes ("Re: libxl / xen-pciback interaction [and 1 more messages]"):
>> On 17.03.2021 16:12, Ian Jackson wrote:
>>> How does what libxl is doing differ from a setup, immediately followed
>>> by a hot-add ?
>>
>> In the hot-add case libxl drives things through Reconfiguring state.
>> I'm not sure this would be an appropriate (and backwards compatible)
>> thing to do when initially populating xenstore.
> 
> Ah.  Tbanks, that is precisely the answer to my question.
> 
> I think that means, therefore, populating the whole lot in one
> transaction.
> 
> (From what you say it doesn't sound like it's possible to write only a
> subset, perhaps with state "not ready yet" and then set them all go
> "go" at the end.)

Indeed, that's my understanding and a consequence of pciback's watch
covering the entire backend subtree, rather than e.g. just the
num_devs node.

Jan

