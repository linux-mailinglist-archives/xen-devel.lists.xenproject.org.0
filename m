Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1151304400
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75315.135573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RYK-0007hd-CV; Tue, 26 Jan 2021 16:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75315.135573; Tue, 26 Jan 2021 16:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RYK-0007hE-8s; Tue, 26 Jan 2021 16:50:52 +0000
Received: by outflank-mailman (input) for mailman id 75315;
 Tue, 26 Jan 2021 16:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4RYJ-0007h6-I3
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:50:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9fefcca-9d40-430c-8552-c1e5dfc9b1a5;
 Tue, 26 Jan 2021 16:50:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2A1AAF17;
 Tue, 26 Jan 2021 16:50:49 +0000 (UTC)
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
X-Inumbo-ID: a9fefcca-9d40-430c-8552-c1e5dfc9b1a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611679850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mvkiu6D2Imnk1c8559hFTg5SpADTOjKej0a7qFkeySM=;
	b=ndfk/Bgvi3Bt6MdIIJr7v/whJVOciNGaklRxXQ2UvD4LlUNhq9rU+GS9x4ZVd9UT6mnB/A
	EZNNzY1GPIQHkalH42niA6mHFOW8c27DqwWVZDqbpLyNeL5r7+WdagmdhgcOFVS3B1DXVt
	xHKmAYXi9teY7oKBX0dq2twzZkN1QqM=
Subject: Re: [PATCH v3 3/6] x86/vpic: force int output to low when in init
 mode
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126134521.25784-1-roger.pau@citrix.com>
 <20210126134521.25784-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4989ad2a-2b05-78dc-0ee1-cb196c35bea1@suse.com>
Date: Tue, 26 Jan 2021 17:50:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126134521.25784-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 14:45, Roger Pau Monne wrote:
> When the PIC is on the init sequence prevent interrupt delivery. The
> state of the registers is in the process of being set during the init
> phase, so it makes sense to prevent any int line changes during that
> process.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I guess I'll change the other tag in this case to Suggested-by
though, should I end up committing this.

Jan

