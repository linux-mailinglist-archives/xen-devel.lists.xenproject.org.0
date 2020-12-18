Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619C2DE000
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 09:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56390.98728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBIS-0001Od-EN; Fri, 18 Dec 2020 08:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56390.98728; Fri, 18 Dec 2020 08:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBIS-0001OE-BF; Fri, 18 Dec 2020 08:39:32 +0000
Received: by outflank-mailman (input) for mailman id 56390;
 Fri, 18 Dec 2020 08:39:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ets7=FW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kqBIQ-0001O9-NZ
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 08:39:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12e6929c-3e40-4a69-a250-cb8402f52af7;
 Fri, 18 Dec 2020 08:39:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85C2FACC4;
 Fri, 18 Dec 2020 08:39:27 +0000 (UTC)
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
X-Inumbo-ID: 12e6929c-3e40-4a69-a250-cb8402f52af7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608280767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wtatcdxlcr3MEWcB4mHrg5SBuLlNpEFY4bk25dgMDKc=;
	b=bNWHCI7X22fzoalOZKuT26utK+EOJTbw0LXOF1IdbqUoFLBHCDSewgwBlsx+3GN5h6/SHF
	xVfTNFCikLciOSLHYxYK6Y4JVFr6BHw5jG8jbN8uWAfHsO+DPagU3rSDpXFIqvkl93YXRX
	EHQEyTF5kBs/r8Zl98kXBw/gh6mXRlg=
Subject: Re: [PATCH 1/6] x86/p2m: tidy p2m_add_foreign() a little
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <8b70c26e-7ae6-8438-67a3-99cef338ba52@suse.com>
 <55de56b3-0e83-c558-6432-9853db82f57a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54d8249e-9c47-3967-f069-2dd38a9e138d@suse.com>
Date: Fri, 18 Dec 2020 09:39:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <55de56b3-0e83-c558-6432-9853db82f57a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.12.2020 20:03, Andrew Cooper wrote:
> On 15/12/2020 16:25, Jan Beulich wrote:
>> Drop a bogus ASSERT() - we don't typically assert incoming domain
>> pointers to be non-NULL, and there's no particular reason to do so here.
>>
>> Replace the open-coded DOMID_SELF check by use of
>> rcu_lock_remote_domain_by_id(), at the same time covering the request
>> being made with the current domain's actual ID.
>>
>> Move the "both domains same" check into just the path where it really
>> is meaningful.
>>
>> Swap the order of the two puts, such that
>> - the p2m lock isn't needlessly held across put_page(),
>> - a separate put_page() on an error path can be avoided,
>> - they're inverse to the order of the respective gets.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> The DOMID_SELF check being converted also suggests to me that there's an
>> implication of tdom == current->domain, which would in turn appear to
>> mean the "both domains same" check could as well be dropped altogether.
> 
> I don't see anything conceptually wrong with the toolstack creating a
> foreign mapping on behalf of a guest at construction time.  I'd go as
> far as to argue that it is an interface shortcoming if this didn't
> function correctly.

Right, I actually didn't get the remark right. It's the DOMID_SELF
check that's suspicious especially when tdom != current->domain,
not the tdom != fdom one.

Jan

