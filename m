Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F6D308780
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77841.141268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QGW-0008KZ-P2; Fri, 29 Jan 2021 09:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77841.141268; Fri, 29 Jan 2021 09:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QGW-0008K9-K4; Fri, 29 Jan 2021 09:40:32 +0000
Received: by outflank-mailman (input) for mailman id 77841;
 Fri, 29 Jan 2021 09:40:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5QGU-0008K4-NP
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:40:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eed8583a-d9bb-48a5-82dc-e4d207a1171f;
 Fri, 29 Jan 2021 09:40:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6DEAAE91;
 Fri, 29 Jan 2021 09:40:28 +0000 (UTC)
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
X-Inumbo-ID: eed8583a-d9bb-48a5-82dc-e4d207a1171f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611913229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCvdjt0mm0VORRJKS/2WfH2c0Z1ns38bcXn667nqf0E=;
	b=RPM7MtJ47fxGi7I2n2kG+QHqagJV5ybv85J0IBcATyxOccxHJB6kaJO8bdwhe/UAsUQJek
	XkmwtLtxvM92RR6k1jJTKvs8YH4mb9A/pcbhqhmMiFMT+NnF/cqnuzzbIRgRbkyZrAetwi
	dtdS90zTg7GiD5zYoG2Fu88N7We7ODA=
Subject: Re: [PATCH] xen/memory: Reject out-of-range resource 'frame' values
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210128160616.17608-1-andrew.cooper3@citrix.com>
 <9879dc3b-5c00-b9d4-c74f-51177580ae7d@suse.com>
 <c31e3d04-6c01-95fd-af51-bbcbf0f450d3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73e7ec42-12be-5b03-7c91-14e3132d3324@suse.com>
Date: Fri, 29 Jan 2021 10:40:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c31e3d04-6c01-95fd-af51-bbcbf0f450d3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.01.2021 10:32, Andrew Cooper wrote:
> On 29/01/2021 09:15, Jan Beulich wrote:
>> On 28.01.2021 17:06, Andrew Cooper wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1054,7 +1054,7 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
>>>  }
>>>  
>>>  static int acquire_grant_table(struct domain *d, unsigned int id,
>>> -                               unsigned long frame,
>>> +                               unsigned int frame,
>>>                                 unsigned int nr_frames,
>>>                                 xen_pfn_t mfn_list[])
>>>  {
>> Doesn't this want carrying forward into
>> gnttab_get_{shared,status}_frame() as well? Of course further
>> cleanup here can also be done at a later point, but it leaves
>> things in a somewhat inconsistent state. I'd like to leave it
>> up to you to commit with Paul's R-b as is, or extend the
>> adjustments and then also add mine.
> 
> In the series, those functions are deleted by the next patch.

In your submission you talk about a v8 series, which I took to
mean the vmtrace one. I understand here you refer to the other
series, presently at v3?

> What's the likelihood that you'll choose to backport this?

Didn't consider this aspect yet. I think I wouldn't have picked
it without anyone asking for it to be backported.

>  I can extend it if needs be.

Well, if that deletion of code gets committed in time, then of
course there's no real need to fiddle with it here.

Jan

