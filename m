Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60823683EB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115669.220741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbSu-0004rD-Qn; Thu, 22 Apr 2021 15:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115669.220741; Thu, 22 Apr 2021 15:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZbSu-0004qo-NV; Thu, 22 Apr 2021 15:42:04 +0000
Received: by outflank-mailman (input) for mailman id 115669;
 Thu, 22 Apr 2021 15:42:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZbSt-0004qj-O2
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:42:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05bfbfef-cea8-4ba3-9dcf-a92cffc0d314;
 Thu, 22 Apr 2021 15:42:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13C3CB16C;
 Thu, 22 Apr 2021 15:42:02 +0000 (UTC)
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
X-Inumbo-ID: 05bfbfef-cea8-4ba3-9dcf-a92cffc0d314
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619106122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xtm0h32BFPnTcDwgXfrX7MV0oVJSpbCO+IQZgIprEFY=;
	b=ETe1ZDrLs8a6EXU5cPptTq6iEl++eNx+zJ6gy25QIZEwYdJUUzQePqOcpwoxUegfsPMbvO
	0DMvi/Q3brXZvpF8a+YI4ueuQl2Fdi/yZ8b8nA92JxWlR9DnPpwIWnGsS6rez9cKwJrZG2
	RvNp5MpdoDH6+1BfRTx9CTFG+MbsyxE=
Subject: Re: [PATCH 0/3] xen: remove some checks for always present Xen
 features
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
References: <20210422151007.2205-1-jgross@suse.com>
 <df27aba6-c67e-d66e-f00e-75a1f76de921@suse.com>
 <b69df7d3-6fcb-a565-9ec5-a272b6163320@suse.com>
 <08e3fcf1-dabc-c550-f76c-47a78a12274b@suse.com>
 <ee2bc5f9-58ea-bad3-1343-2156d2b80ad3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e293427d-b178-fd22-28bf-e6c6fe7e3f83@suse.com>
Date: Thu, 22 Apr 2021 17:42:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <ee2bc5f9-58ea-bad3-1343-2156d2b80ad3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.04.2021 17:28, Juergen Gross wrote:
> On 22.04.21 17:23, Jan Beulich wrote:
>> On 22.04.2021 17:17, Juergen Gross wrote:
>>> On 22.04.21 17:16, Jan Beulich wrote:
>>>> On 22.04.2021 17:10, Juergen Gross wrote:
>>>>> Some features of Xen can be assumed to be always present, so add a
>>>>> central check to verify this being true and remove the other checks.
>>>>>
>>>>> Juergen Gross (3):
>>>>>     xen: check required Xen features
>>>>>     xen: assume XENFEAT_mmu_pt_update_preserve_ad being set for pv guests
>>>>>     xen: assume XENFEAT_gnttab_map_avail_bits being set for pv guests
>>>>
>>>> I wonder whether it's a good idea to infer feature presence from
>>>> version numbers. If (at some point in the past) you had inferred
>>>> gnttab v2 being available by version, this would have been broken
>>>> by its availability becoming controllable by a command line option
>>>> in Xen.
>>>
>>> I'm testing the feature to be really present when booting and issue a
>>> message if it is not there.
>>
>> And how does this help if the feature really isn't there yet other code
>> assumes it is?
> 
> Did you look at the features I'm testing?

I did, yes.

> Those are really just low
> level additions I can't imagine will ever be removed again.

I don't expect them to be removed. But I don't think the people having
contributed gnttab v2 expected any such for it, either.

Jan

