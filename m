Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D852AB7B7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22442.48752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc5uS-00081N-C1; Mon, 09 Nov 2020 12:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22442.48752; Mon, 09 Nov 2020 12:04:32 +0000
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
	id 1kc5uS-00080y-8w; Mon, 09 Nov 2020 12:04:32 +0000
Received: by outflank-mailman (input) for mailman id 22442;
 Mon, 09 Nov 2020 12:04:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wB/=EP=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kc5uQ-00080t-UQ
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:04:31 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aa2d892-0ce4-4532-8e64-ea4ae77dfc23;
 Mon, 09 Nov 2020 12:04:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kc5uP-0003ow-PA; Mon, 09 Nov 2020 12:04:29 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kc5uP-0004Gd-Ha; Mon, 09 Nov 2020 12:04:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5wB/=EP=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kc5uQ-00080t-UQ
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:04:31 +0000
X-Inumbo-ID: 3aa2d892-0ce4-4532-8e64-ea4ae77dfc23
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3aa2d892-0ce4-4532-8e64-ea4ae77dfc23;
	Mon, 09 Nov 2020 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=UdtPmwE9gqG0N+a8baZ0Ckhctdo1DjlL50gRRn6LQIk=; b=gPnVfG4m8BamYNYvctZijbMowS
	xHSDKehEGPzpMZHG9y/CWOczPtJbbMZP+q9z7pcvQjCTagQTYgRg3NCdkAcV0XhYvzguE9MS6TsuW
	kQnQpewrA9NCpKyr2UNbN3JaMNl0KKlklDaIbf/sm7EGnSl8BLmcEtRwfJKa/qb/ST94=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kc5uP-0003ow-PA; Mon, 09 Nov 2020 12:04:29 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kc5uP-0004Gd-Ha; Mon, 09 Nov 2020 12:04:29 +0000
Subject: Re: [PATCH] xen/arm: Add Cortex-A73 erratum 858921 workaround
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Andre.Przywara@arm.com, Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 Kaly.Xin@arm.com, nd@arm.com
References: <20201109082110.1133996-1-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cfa63398-8182-b79f-1602-ed068e2319ad@xen.org>
Date: Mon, 9 Nov 2020 12:04:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109082110.1133996-1-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 09/11/2020 08:21, Penny Zheng wrote:
> CNTVCT_EL0 or CNTPCT_EL0 counter read in Cortex-A73 (all versions)
> might return a wrong value when the counter crosses a 32bit boundary.
> 
> Until now, there is no case for Xen itself to access CNTVCT_EL0,
> and it also should be the Guest OS's responsibility to deal with
> this part.
> 
> But for CNTPCT, there exists several cases in Xen involving reading
> CNTPCT, so a possible workaround is that performing the read twice,
> and to return one or the other depending on whether a transition has
> taken place.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

On a related topic, do we need a fix similar to Linux commit 
75a19a0202db "arm64: arch_timer: Ensure counter register reads occur 
with seqlock held"?

Cheers,

-- 
Julien Grall

