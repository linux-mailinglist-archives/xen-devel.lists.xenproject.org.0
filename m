Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F4D2E0DB4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 18:13:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58020.101798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krlD8-0007XS-FN; Tue, 22 Dec 2020 17:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58020.101798; Tue, 22 Dec 2020 17:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krlD8-0007X3-C3; Tue, 22 Dec 2020 17:12:34 +0000
Received: by outflank-mailman (input) for mailman id 58020;
 Tue, 22 Dec 2020 17:12:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krlD7-0007Wy-EW
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 17:12:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krlD3-0003qa-J4; Tue, 22 Dec 2020 17:12:29 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krlD3-0005TI-CP; Tue, 22 Dec 2020 17:12:29 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=mz2eyRlnDZkwiicdLJKrlr+25PJOwB8xtc8Upo7gQKg=; b=buOvKlKhQ6MnwUR4JGfGrex+d9
	aIJozIO4N9gYp7gBb9fjtD9UNaa/tM79/2KC7k+Lsoi+cZ5aBicyBSmbMp7F8p6Z+iQZ+gi6H2hbu
	DdX4iiP9jD1wNlwPs9m52sOdqh4eD1O2wxU6VkC3+15hyIQuy7TPlOGXYFSTR65ZwQ1o=;
Subject: Re: [PATCH for-4.15 4/4] xen/iommu: x86: Don't leak the IOMMU
 page-tables
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-5-julien@xen.org>
Message-ID: <2c0241eb-9b95-6f30-cd9e-b38b21df0e6b@xen.org>
Date: Tue, 22 Dec 2020 17:12:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222154338.9459-5-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 22/12/2020 15:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The new IOMMU page-tables allocator will release the pages when
> relinquish the domain resources. However, this is not sufficient in two
> cases:
>      1) domain_relinquish_resources() is not called when the domain
>      creation fails.
>      2) There is nothing preventing page-table allocations when the
>      domain is dying.
> 
> In both cases, this can be solved by freeing the page-tables again
> when the domain destruction. Although, this may result to an high
> number of page-tables to free.
> 
> In the second case, it is pointless to allow page-table allocation when
> the domain is going to die. iommu_alloc_pgtable() will now return an
> error when it is called while the domain is dying.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I forgot to mention this is fixing 15bc9a1ef51c "x86/iommu: add common 
page-table allocator". I will add a Fixes tag for the next version.

Cheers,

-- 
Julien Grall

