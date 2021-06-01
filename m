Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C403976D4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 17:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134926.250910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6Qs-0005uu-AN; Tue, 01 Jun 2021 15:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134926.250910; Tue, 01 Jun 2021 15:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6Qs-0005sW-6p; Tue, 01 Jun 2021 15:35:54 +0000
Received: by outflank-mailman (input) for mailman id 134926;
 Tue, 01 Jun 2021 15:35:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lo6Qq-0005sP-Ak
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 15:35:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lo6Qp-0008Iz-2k; Tue, 01 Jun 2021 15:35:51 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lo6Qo-0006Vg-S2; Tue, 01 Jun 2021 15:35:50 +0000
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
	bh=/ihpCauTQfpifvAgMLpv/b08tZHMMzbgGergYeq+Oek=; b=j6rA5m4vcJVgXEZgDrhrcIaZPF
	UFylu8WNmz4EiereD2ZEfrIwovISBBMSph2M0zCRFRcUsH4ZVKS9zuqqx1QL6B8tlFL8bN9qSf3/1
	9p4mDvIqelH4ttHkspkXwgCV5wy7FMc06tVmjquU7ykskYyF3xbD06+ugXN6WpHP4F14=;
Subject: Re: [PATCH v2] xen/page_alloc: Remove dead code in
 alloc_domheap_pages()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210526161129.28572-1-julien@xen.org>
 <b449be48-cded-b1a2-5086-d4d6856ed5dc@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dc3777a7-e28e-5323-bfa8-95c6bfe2f8f4@xen.org>
Date: Tue, 1 Jun 2021 16:35:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <b449be48-cded-b1a2-5086-d4d6856ed5dc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/05/2021 08:15, Jan Beulich wrote:
> On 26.05.2021 18:11, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since commit 1aac966e24e9 "xen: support RAM at addresses 0 and 4096",
>> bits_to_zone() will never return 0 and it is expected that we have
>> minimum 2 zones.
>>
>> Therefore the check in alloc_domheap_pages() is unnecessary and can
>> be removed. However, for sanity, it is replaced with an ASSERT().
>>
>> Also take the opportunity to switch from min_t() to min() as
>> bits_to_zone() cannot return a negative value. The macro is tweaked
>> to make it clearer.
>>
>> This bug was discovered and resolved using Coverity Static Analysis
>> Security Testing (SAST) by Synopsys, Inc.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - Remove BUILD_BUG_ON()
>>          - Switch from min_t() to min()
> 
> Since this fulfills the dependencies put in place at the time, the
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> continues to apply here. Thanks for making the adjustments.

Thanks for the review. It is now committed.

Cheers,

-- 
Julien Grall

