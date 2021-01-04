Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E62E985A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 16:22:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61309.107764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRgp-0005TR-08; Mon, 04 Jan 2021 15:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61309.107764; Mon, 04 Jan 2021 15:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRgo-0005T5-TH; Mon, 04 Jan 2021 15:22:34 +0000
Received: by outflank-mailman (input) for mailman id 61309;
 Mon, 04 Jan 2021 15:22:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwRgn-0005T0-O9
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 15:22:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9bc3b5c-e918-4fa1-88f7-925e5a080079;
 Mon, 04 Jan 2021 15:22:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30443B7AD;
 Mon,  4 Jan 2021 15:22:32 +0000 (UTC)
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
X-Inumbo-ID: c9bc3b5c-e918-4fa1-88f7-925e5a080079
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609773752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmWqAm7ES8JnVt/Zg5keYZOzesJ/t2HdycTX7NBaRbs=;
	b=UXxTZzsICCHAOBYxAf8nlxHXiWBT3MZgC2iQNzcHbCtjdy0zHFouCmWaZE8a3ca1MFWToZ
	b58flVsRnwiV2D8xljOEBZ4Br7SZmaDqd0zqa5LZLMcpcKQ3FHn1keDp+G7oylgCkUpy1U
	gX3VBlGNrPJyzbDeb4MIdi79w7UIKgM=
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
 <920f3df3-3343-3947-e318-da3b8dd8a56c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec21a8d6-744c-0f02-cedd-c35d36097a8a@suse.com>
Date: Mon, 4 Jan 2021 16:22:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <920f3df3-3343-3947-e318-da3b8dd8a56c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.01.2021 16:04, Andrew Cooper wrote:
> On 23/12/2020 15:13, Jan Beulich wrote:
>> This array can be large when many grant frames are permitted; avoid
>> allocating it when it's not going to be used anyway, by doing this only
>> in gnttab_populate_status_frames().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Defer allocation to when a domain actually switches to the v2 grant
>>     API.
> 
> I see this as a backwards step.  It turns a build-time -ENOMEM into a
> runtime -ENOMEM, and if you recall from one of the XSAs, the Windows PV
> drivers will BUG() if set_version fails.  (Yes - this is dumb behaviour,
> but it is in the field now.)

Well, if this was the only source of -ENOMEM (i.e. none was there
previously), I'd surely understand the concern. But there have been
memory allocations before on this path. In any event, this will
need settling between you and Julien, as it was him to request the
change.

Jan

