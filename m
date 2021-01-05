Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D92EAD3C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 15:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62017.109506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwn9j-0008U5-OI; Tue, 05 Jan 2021 14:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62017.109506; Tue, 05 Jan 2021 14:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwn9j-0008Tj-Kr; Tue, 05 Jan 2021 14:17:51 +0000
Received: by outflank-mailman (input) for mailman id 62017;
 Tue, 05 Jan 2021 14:17:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwn9h-0008Te-NR
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 14:17:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39dcba8c-a970-444e-889b-97a68082f133;
 Tue, 05 Jan 2021 14:17:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F1C8AD0B;
 Tue,  5 Jan 2021 14:17:48 +0000 (UTC)
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
X-Inumbo-ID: 39dcba8c-a970-444e-889b-97a68082f133
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609856268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1nDI0TCpWWSsUll1zWIAhzCJfBgDIfkBcJZOCN1rsg=;
	b=I9OrkFmdegtqIkA4g2vPYydNhRbc7F6pCRTghnM5nYdnEm9bAlGqYDdPLfMr1FwZA35tQe
	PwRxO5YhYwGadUCrG7CxKrZzRBcggHBhDuxcuM4B3OmX/msjb7KYlP8AnBUXD4G9IAUptz
	e205ZI9kbNcetUChgLpJNs9f1frIqVg=
Subject: Re: [PATCH 1/5] common: don't (kind of) open-code
 rcu_lock_domain_by_any_id()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
 <12b46155-3b07-7ee2-3cda-160dda01e8fb@suse.com>
 <484a5c4d-5a46-f22a-7bd9-0ca597ebf52d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7038d7e3-2d83-ff6e-94f9-567f427d0547@suse.com>
Date: Tue, 5 Jan 2021 15:17:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <484a5c4d-5a46-f22a-7bd9-0ca597ebf52d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.01.2021 14:38, Andrew Cooper wrote:
> On 05/01/2021 13:24, Jan Beulich wrote:
>> Even more so when using rcu_lock_domain_by_id() in place of the more
>> efficient rcu_lock_current_domain().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> Besides get_pg_owner(), gnttab_copy_lock_domain() has similar strange(?)
>> behavior: They accept DOMID_SELF, but not the resolved ID of the caller.
> 
> I queried that behaviour years and years ago.
> 
> According to Keir, it is part of the attempt to force guests to not know
> their own domid.  Xen itself does (or did) its very hardest to prevent a
> domU knowing its own domid, while at the same time the "domid" key in
> xenstore is mandatory for setting up PV rings.
> 
> I'd personally think was a short sighted move.

Let me make another patch then, unless you can see reasons we should
stick to the current behavior. Figuring out its own domid is possible
for a domain, after all, and even shouldn't be overly difficult.

Jan

