Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5518F35C1BE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 11:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108866.207725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVt88-0001Jq-Sm; Mon, 12 Apr 2021 09:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108866.207725; Mon, 12 Apr 2021 09:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVt88-0001JR-Pm; Mon, 12 Apr 2021 09:45:16 +0000
Received: by outflank-mailman (input) for mailman id 108866;
 Mon, 12 Apr 2021 09:45:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVt87-0001JL-CP
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 09:45:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b09c2bc6-351e-4624-986d-cf21c2507d21;
 Mon, 12 Apr 2021 09:45:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB96DAF1A;
 Mon, 12 Apr 2021 09:45:13 +0000 (UTC)
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
X-Inumbo-ID: b09c2bc6-351e-4624-986d-cf21c2507d21
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618220714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sa/hj4u/V5reWyozzht2uCFPvZTmFgvs67chooCm9w=;
	b=ixDHpl+WefpBBW97JDvdapFctRI1FCKRJrYUvy1IlcBhan1vbckclU9UegDacILepp31JD
	URzkFzmuboCpDZ3It2nLriqE40EU6BIqU0uHC+c02lzoX55F+B90bxkTbgDfjszX/rQddB
	/FVIo83iBc9agoaAYNadJxshsA5T5Yg=
Subject: Re: [PATCH] xen/events: fix setting irq affinity
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 stable@vger.kernel.org
References: <20210412062845.13946-1-jgross@suse.com>
 <38b2b47d-a77a-9d02-3034-f1c4d03ffdd5@suse.com>
 <bec9c7a5-5661-73b4-1b0b-137dacba7bbf@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5852f35-8828-c6a0-260a-cf095626eb1f@suse.com>
Date: Mon, 12 Apr 2021 11:45:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bec9c7a5-5661-73b4-1b0b-137dacba7bbf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.04.2021 11:39, Juergen Gross wrote:
> On 12.04.21 11:32, Jan Beulich wrote:
>> Possibly related, but first of all seeing the redundancy between
>> eoi_pirq() and ack_dynirq(): Wouldn't it make sense to break out the
>> common part into a helper? (Really the former could simply call the
>> latter as it seems.)
> 
> In theory, yes. OTOH this no longer applies to upstream, so i dind't
> bother doing that for stable.

Oh, I guess I should have check the tip of the tree first...

Jan

