Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55C13059F3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 12:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76052.137116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4j8P-0003l3-2Z; Wed, 27 Jan 2021 11:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76052.137116; Wed, 27 Jan 2021 11:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4j8O-0003kh-V6; Wed, 27 Jan 2021 11:37:16 +0000
Received: by outflank-mailman (input) for mailman id 76052;
 Wed, 27 Jan 2021 11:37:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4j8O-0003kb-4i
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 11:37:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f619756-4802-4e2b-a88a-6b432080cf48;
 Wed, 27 Jan 2021 11:37:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37E02AD26;
 Wed, 27 Jan 2021 11:37:13 +0000 (UTC)
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
X-Inumbo-ID: 3f619756-4802-4e2b-a88a-6b432080cf48
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611747433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAR74QWx5XWwobnvcUvVOIFG3CIVrWbE/mK4xOXsXGs=;
	b=peM+VHGL2uwW8gsRFe8GrllvRLo2AbyNjCRNr4XNiT1YyPleCO44IQiugDEN3SN2XE5Zc+
	ZVL/lBiI76hBNbBTr/0Enl47HekiR9lAngeDsKjiChispz6CKc6dMiEAlRw1Z2EnK5Kq6k
	ifixZiFRb8rQCbqWqkmmrf1bpwLD3PA=
Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single page rings
To: paul@xen.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Jens Axboe' <axboe@kernel.dk>, 'Dongli Zhang' <dongli.zhang@oracle.com>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210127103034.2559-1-paul@xen.org>
 <cd70ae5e-a389-7521-8caf-15650a276152@suse.com>
 <026001d6f49c$eab982b0$c02c8810$@xen.org>
 <ed1988d9-131a-daf1-787f-3f49269b91aa@suse.com>
 <026101d6f4a0$2e3de000$8ab9a000$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40ab27a0-0f16-b010-1834-6d08ab0838c3@suse.com>
Date: Wed, 27 Jan 2021 12:37:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <026101d6f4a0$2e3de000$8ab9a000$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.01.2021 12:33, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 27 January 2021 11:21
>> To: paul@xen.org
>> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>; 'Roger Pau
>> Monné' <roger.pau@citrix.com>; 'Jens Axboe' <axboe@kernel.dk>; 'Dongli Zhang'
>> <dongli.zhang@oracle.com>; linux-kernel@vger.kernel.org; linux-block@vger.kernel.org; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single page rings
>>
>> On 27.01.2021 12:09, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 27 January 2021 10:57
>>>> To: Paul Durrant <paul@xen.org>
>>>> Cc: Paul Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Roger Pau
>>>> Monné <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>; Dongli Zhang <dongli.zhang@oracle.com>;
>>>> linux-kernel@vger.kernel.org; linux-block@vger.kernel.org; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single page rings
>>>>
>>>> On 27.01.2021 11:30, Paul Durrant wrote:
>>>>> From: Paul Durrant <pdurrant@amazon.com>
>>>>>
>>>>> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to avoid
>>>>> inconsistent xenstore 'ring-page-order' set by malicious blkfront"), the
>>>>> behaviour of xen-blkback when connecting to a frontend was:
>>>>>
>>>>> - read 'ring-page-order'
>>>>> - if not present then expect a single page ring specified by 'ring-ref'
>>>>> - else expect a ring specified by 'ring-refX' where X is between 0 and
>>>>>   1 << ring-page-order
>>>>>
>>>>> This was correct behaviour, but was broken by the afforementioned commit to
>>>>> become:
>>>>>
>>>>> - read 'ring-page-order'
>>>>> - if not present then expect a single page ring
>>>>> - expect a ring specified by 'ring-refX' where X is between 0 and
>>>>>   1 << ring-page-order
>>>>> - if that didn't work then see if there's a single page ring specified by
>>>>>   'ring-ref'
>>>>>
>>>>> This incorrect behaviour works most of the time but fails when a frontend
>>>>> that sets 'ring-page-order' is unloaded and replaced by one that does not
>>>>> because, instead of reading 'ring-ref', xen-blkback will read the stale
>>>>> 'ring-ref0' left around by the previous frontend will try to map the wrong
>>>>> grant reference.
>>>>>
>>>>> This patch restores the original behaviour.
>>>>
>>>> Isn't this only the 2nd of a pair of fixes that's needed, the
>>>> first being the drivers, upon being unloaded, to fully clean up
>>>> after itself? Any stale key left may lead to confusion upon
>>>> re-use of the containing directory.
>>>
>>> In a backend we shouldn't be relying on, nor really expect IMO, a frontend to clean up after itself.
>> Any backend should know *exactly* what xenstore nodes it’s looking for from a frontend.
>>
>> But the backend can't know whether a node exists because the present
>> frontend has written it, or because an earlier instance forgot to
>> delete it. It can only honor what's there. (In fact the other day I
>> was wondering whether some of the writes of boolean "false" nodes
>> wouldn't better be xenbus_rm() instead.)
> 
> In the particular case this patch is fixing for me, the frontends are the Windows XENVBD driver and the Windows crash version of the same driver (actually built from different code). The 'normal' instance is multi-page aware and the crash instance is not quite, i.e. it uses the old ring-ref but knows to clean up 'ring-page-order'.
> Clearly, in a crash situation, we cannot rely on frontend to clean up

Ah, I see (and agree).

> so what you say does highlight that there indeed needs to be a second patch to xen-blkback to make sure it removes 'ring-page-order' itself as 'state' cycles through Closed and back to InitWait.

And not just this one node then, I suppose?

> I think this patch does still stand on its own though.

Perhaps, yes.

Jan

