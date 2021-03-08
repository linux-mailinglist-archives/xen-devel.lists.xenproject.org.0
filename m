Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16046331002
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 14:51:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94950.178998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGIP-00075h-C1; Mon, 08 Mar 2021 13:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94950.178998; Mon, 08 Mar 2021 13:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGIP-00075J-8z; Mon, 08 Mar 2021 13:51:41 +0000
Received: by outflank-mailman (input) for mailman id 94950;
 Mon, 08 Mar 2021 13:51:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJGIO-00075D-Aw
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 13:51:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8224911-50a4-406e-a660-17f4107c9482;
 Mon, 08 Mar 2021 13:51:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41991AD3B;
 Mon,  8 Mar 2021 13:51:38 +0000 (UTC)
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
X-Inumbo-ID: b8224911-50a4-406e-a660-17f4107c9482
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615211498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l5ozFChNT594+olRPzXUE+TKs/4K7Uq1KwTrdShzVdU=;
	b=mvQHhMjY5cak8g9RaDJ8bAFZ/ponrsu/xAZVfUdwmFGkp1IKg/9md8a156EukqMdasjbsK
	ai5l/BbXigJeiDt4tu4OjAyS5ZoRySKocqJYqlWfZ0LgJobKFx33wQctsWK3hU8MaoRk/i
	8HftLFmvPitn69XbebHbr6zsnnYqQW8=
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
To: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
 <YEXtnkYzNSXasTw1@deinos.phlegethon.org>
 <96c83adb-9e81-8398-c905-f4f0730ba240@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ceed3443-0b83-6baf-2ccc-c59d834263e6@suse.com>
Date: Mon, 8 Mar 2021 14:51:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <96c83adb-9e81-8398-c905-f4f0730ba240@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.03.2021 14:47, Andrew Cooper wrote:
> On 08/03/2021 09:25, Tim Deegan wrote:
>> At 16:37 +0100 on 05 Mar (1614962224), Jan Beulich wrote:
>>> We can't make correctness of our own behavior dependent upon a
>>> hypervisor underneath us correctly telling us the true physical address
>>> with hardware uses. Without knowing this, we can't be certain reserved
>>> bit faults can actually be observed. Therefore, besides evaluating the
>>> number of address bits when deciding whether to use the optimization,
>>> also check whether we're running virtualized ourselves.
>>>
>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Tim Deegan <tim@xen.org>
>>
>> I would consider this to be a bug in the underlying hypervisor, but I
>> agree than in practice it won't be safe to rely on it being correct.
> 
> I'd argue against this being a hypervisor bug.  If anything, it is a
> weakness in how x86 virtualisation works.
> 
> For booting on a single host, then yes - vMAXPHYSADDR really ought to be
> the same as MAXPHYSADDR, and is what happens in the common case.
> 
> For booting in a heterogeneous pool, the only safe value is the min of
> MAXPHYSADDR across the resource pool.  Anything higher, and the VM will
> malfunction (get #PF[rsvd] for apparently-legal PTEs) on the smallest
> pool member(s).

Except that min isn't safe either - the guest may then expect reserved
bit faults where none surface.

Jan

