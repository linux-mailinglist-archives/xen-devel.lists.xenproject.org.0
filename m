Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2880F3673CA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 21:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114940.219110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZIty-0005yE-OU; Wed, 21 Apr 2021 19:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114940.219110; Wed, 21 Apr 2021 19:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZIty-0005xp-LN; Wed, 21 Apr 2021 19:52:46 +0000
Received: by outflank-mailman (input) for mailman id 114940;
 Wed, 21 Apr 2021 19:52:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZItx-0005xk-I7
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 19:52:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZItv-0007Gr-Kt; Wed, 21 Apr 2021 19:52:43 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZItv-00015Y-BU; Wed, 21 Apr 2021 19:52:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=diCTTYxIlC0gKnHznR2F6gUqkZGyW/gzx+1PjTLAaAM=; b=h5DIK7z6Zost4jgsncWVBQMljz
	6vzgGwkJxvY0V9Qo4E4aShaB/ORpbo0n0m/87c1gR2xF/qAyiT+CHCacKpnIRrQ9g/Li1wWrc94oz
	7HRj210/OVgYGRvdHQNcT0bq34zx33gRCRrnWcAjCRYVqg9asr1j240MVoo+X97xqJfQ=;
Subject: Re: [PATCH v3] evtchn/fifo: don't enforce higher than necessary
 alignment
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <2a08aa31-fdbf-89ee-cd49-813f818b709a@suse.com>
 <e6ce03a5-cfec-42ea-91c4-b51849e2f299@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <69766ecb-d234-eebb-9b31-1533389a502e@xen.org>
Date: Wed, 21 Apr 2021 20:52:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <e6ce03a5-cfec-42ea-91c4-b51849e2f299@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 21/04/2021 15:36, Jan Beulich wrote:
> Neither the code nor the original commit provide any justification for
> the need to 8-byte align the struct in all cases. Enforce just as much
> alignment as the structure actually needs - 4 bytes - by using alignof()
> instead of a literal number.

I had another fresh look today at this patch. The 32-bit padding is 
right after the field 'ready'.

I can't for sure tell how the second half is going to ever be used and how.

However, one possibility would be to extend the field 'ready' to 64-bit. 
With the current code, we could easily make a single 64-bit access 
without having to know whether the guest is able to interpret the top half.

With your approach, we may need to have different path depending on the 
padding and ensure the new extension cannot be enabled if the padding is 
4-byte. Otherwise, the atomicity would be broken.

> While relaxation of the requirements is intended here, the primary goal
> is to simply get rid of the hard coded number as well its lack of
> connection to the structure that is is meant to apply to.

Based on what I wrote above, I think the relaxation should not be done 
to give us more flexibility about possible extension to the structure.

Although, I would be worth documenting the reasoning in the code.

Cheers,

-- 
Julien Grall

