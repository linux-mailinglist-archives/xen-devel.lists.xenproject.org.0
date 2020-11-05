Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2A2A7CF3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 12:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19728.45041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kadOp-0005w3-PK; Thu, 05 Nov 2020 11:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19728.45041; Thu, 05 Nov 2020 11:25:51 +0000
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
	id 1kadOp-0005ve-M0; Thu, 05 Nov 2020 11:25:51 +0000
Received: by outflank-mailman (input) for mailman id 19728;
 Thu, 05 Nov 2020 11:25:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kadOn-0005vZ-SR
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 11:25:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c93bcdca-2a91-4ec8-a3ee-173a9ee72605;
 Thu, 05 Nov 2020 11:25:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BAD00ABDE;
 Thu,  5 Nov 2020 11:25:46 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kadOn-0005vZ-SR
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 11:25:49 +0000
X-Inumbo-ID: c93bcdca-2a91-4ec8-a3ee-173a9ee72605
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c93bcdca-2a91-4ec8-a3ee-173a9ee72605;
	Thu, 05 Nov 2020 11:25:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604575546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoL6+H/FfkWigkfWlqT6sgVtGr/v0ysYD2tc8xweAuQ=;
	b=U+J4W2YUyZIphuYUTDdXDJTerGGYP3c6aei8hz+ruSKB8jHHmqLwnbv1lKH1bTns2Q/KMY
	AtrHi2R9wAXmN3KN13FFwaq6Abrvrn2pEprNsheKswcy76iOLFX3G+t7nqzRPpqOVUpO7k
	RttteLGrbETTtbds1PM7fn9vh4TK1G0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BAD00ABDE;
	Thu,  5 Nov 2020 11:25:46 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] xen/x86: add nmi continuation framework
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201016085350.10233-1-jgross@suse.com>
 <20201016085350.10233-2-jgross@suse.com>
 <12640bbf-475c-3d74-9bb0-57befcadd626@suse.com>
 <3b260972-4155-6c83-a4c3-21d096346337@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <420ae10e-c9d2-2d12-fb3e-cdc315d59418@suse.com>
Date: Thu, 5 Nov 2020 12:25:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <3b260972-4155-6c83-a4c3-21d096346337@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.11.2020 11:22, Jürgen Groß wrote:
> On 20.10.20 15:33, Jan Beulich wrote:
>> On 16.10.2020 10:53, Juergen Gross wrote:
>>> Actions in NMI context are rather limited as e.g. locking is rather
>>> fragile.
>>>
>>> Add a generic framework to continue processing in normal interrupt
>>> context after leaving NMI processing.
>>>
>>> This is done by a high priority interrupt vector triggered via a
>>> self IPI from NMI context, which will then call the continuation
>>> function specified during NMI handling.
>>
>> I'm concerned by there being just a single handler allowed, when
>> the series already introduces two uses. A single NMI instance
>> may signal multiple things in one go. At the very least we then
>> need a priority, such that SERR could override oprofile.
> 
> A different approach could be not to introduce a generic interface,
> but to explicitly call the continuation handlers in the interrupt
> handler.
> 
> Instead of a function pointer, a parameter pointer and a busy
> indicator (probably another function pointer) per cpu, we'd need for
> now only a parameter value per cpu (for the oprofile case) and a
> global flag (for the SERR case).
> 
> The downside would be having to add additional fields for other
> use cases, but for now I think this could be the better way,
> especially as this would remove the theoretical case of multiple
> issues overwriting one another.

Yes, perhaps less abstraction is the better approach here, for now
at least. Perhaps give Andrew and Roger a little bit of time to
object before going down that route.

Jan

