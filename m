Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EA8368F9F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 11:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115999.221350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsM4-0002Rq-EM; Fri, 23 Apr 2021 09:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115999.221350; Fri, 23 Apr 2021 09:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsM4-0002RR-BC; Fri, 23 Apr 2021 09:44:08 +0000
Received: by outflank-mailman (input) for mailman id 115999;
 Fri, 23 Apr 2021 09:44:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZsM2-0002RM-BX
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 09:44:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebc295fc-5e73-4fb2-b837-9b902552658d;
 Fri, 23 Apr 2021 09:44:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05826AC7D;
 Fri, 23 Apr 2021 09:44:04 +0000 (UTC)
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
X-Inumbo-ID: ebc295fc-5e73-4fb2-b837-9b902552658d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619171044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EzHRARTMng6FiPuumOKTLaionewhqu+xi1go0PE+9I=;
	b=s7RH0t+LUiugm9Nj7wBr/53aahBuEL70SYwXKAkCFV0wSlUCROpsFl2CucQxas0vqO8r+K
	5VhfEyHtUjePV/dJAHlYnV/hZ11MlekmLU4FAeXJTn+e24h2Qsj8ZSGU3JvsbsYamu7wWD
	GmQgf1pnRMoFsnYlO348PmymgoRYJNI=
Subject: Re: [PATCH v2 0/8] assorted replacement of x[mz]alloc_bytes()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
 <40d373eb-d7c2-27f9-df20-a7fecbe519a5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23d61389-3fb8-675c-8291-de7189af56d4@suse.com>
Date: Fri, 23 Apr 2021 11:44:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <40d373eb-d7c2-27f9-df20-a7fecbe519a5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.04.2021 17:23, Andrew Cooper wrote:
> On 21/04/2021 15:54, Jan Beulich wrote:
>> In the long run I think we want to do away with these type-unsafe
>> interfaces, the more that they also request (typically) excess
>> alignment. This series of entirely independent patches is
>> eliminating the instances where it's relatively clear that they're
>> not just "blob" allocations.
>>
>> v2 only has commit messages extended.
>>
>> 1: x86/MCE: avoid effectively open-coding xmalloc_array()
>> 2: x86/HVM: avoid effectively open-coding xmalloc_array()
>> 3: x86/oprofile: avoid effectively open-coding xmalloc_array()
>> 4: x86/IRQ: avoid over-alignment in alloc_pirq_struct()
>> 5: EFI/runtime: avoid effectively open-coding xmalloc_array()
>> 6: kexec: avoid effectively open-coding xzalloc_flex_struct()
>> 7: video/lfb: avoid effectively open-coding xzalloc_array()
>> 8: Arm/optee: don't open-code xzalloc_flex_struct()
> 
> I'm tempted to nack this, but for now will go with a firm -2 to the
> whole series.

I wonder whether you really mean the whole series - patch 8 clearly
matches the pattern of two of the v1 patches that you did ack yourself.

Jan

