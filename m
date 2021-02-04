Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9402330EFED
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 10:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81200.149596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bFT-00009L-3X; Thu, 04 Feb 2021 09:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81200.149596; Thu, 04 Feb 2021 09:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7bFT-00008v-01; Thu, 04 Feb 2021 09:48:27 +0000
Received: by outflank-mailman (input) for mailman id 81200;
 Thu, 04 Feb 2021 09:48:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7bFR-00008o-3b
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 09:48:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66991e48-0ac3-484a-9034-4df28cc256ba;
 Thu, 04 Feb 2021 09:48:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7790AAC97;
 Thu,  4 Feb 2021 09:48:23 +0000 (UTC)
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
X-Inumbo-ID: 66991e48-0ac3-484a-9034-4df28cc256ba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612432103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcMCk3sVSljoCpU2gCX1mtvxfFSEPoYvk1E214YlzkE=;
	b=tl326tfVmre0sIuja3r389JG6DaSSw74XV9ednB4n3cDMCQUTrGhScnzVr+JZp0gvWN3iQ
	bakFE2gR5PTIYIeLF9gYxgIRlsuiLEtqqJw/5kP2Qwez4KFsr4fMViqn4qXcvPhqj7eayu
	DxUpZeihhqimYTKT/Le7LQewevc92co=
Subject: Re: [PATCH for-4.12 and older] x86/msr: fix handling of
 MSR_IA32_PERF_{STATUS/CTL} (again)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 James Dingwall <james-xen@dingwall.me.uk>
References: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
 <YBvBKYi5wweq2kms@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06169cfd-6fde-3d12-08c2-96d502a0064c@suse.com>
Date: Thu, 4 Feb 2021 10:48:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBvBKYi5wweq2kms@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.02.2021 10:40, Roger Pau Monné wrote:
> On Thu, Feb 04, 2021 at 10:36:06AM +0100, Jan Beulich wrote:
>> X86_VENDOR_* aren't bit masks in the older trees.
>>
>> Reported-by: James Dingwall <james@dingwall.me.uk>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Should this have a set of Fixes tag for the commit hashes on <= 4.12?

I'd prefer Fixes: to only reference non-backports. The tag is
mainly meant to allow noticing what needs backporting, after all.

Jan

