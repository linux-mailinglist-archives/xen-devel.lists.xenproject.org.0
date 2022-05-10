Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA3521323
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325431.548000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNgU-0001CN-2Y; Tue, 10 May 2022 11:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325431.548000; Tue, 10 May 2022 11:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNgT-00018c-VP; Tue, 10 May 2022 11:05:41 +0000
Received: by outflank-mailman (input) for mailman id 325431;
 Tue, 10 May 2022 11:05:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noNgR-00017S-PK
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:05:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noNgR-0003nZ-Gg; Tue, 10 May 2022 11:05:39 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noNgR-0003hC-Ae; Tue, 10 May 2022 11:05:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=4B6gPS4hNc09H9nn1sd2lEFZrF5+tOw6YuXJeEJ3JWQ=; b=mzfnRrXomKs2AAJSYV/DD/yqL2
	+nuwMWZWcg2qYfvcWiPEC6qZpxsbFqGRRLXf4wHBC4+MHsCTJldNMAvh212XY2Eot+nbwyX4c5J7m
	ZliV93kfm4AuSQTp8qXOF2U8rMvJ7DeHnVOaPNCpOwABhFRKIejQ5MEyv54NfH7p/ZEw=;
Message-ID: <616d2587-610d-9222-26df-739d185e0341@xen.org>
Date: Tue, 10 May 2022 12:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 3/6] arm64/find_next_bit: Remove ext2_swab()
To: Lin Liu <lin.liu@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <48bdc1be03a77bcc405e327b8022fcd937186e9e.1652170719.git.lin.liu@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <48bdc1be03a77bcc405e327b8022fcd937186e9e.1652170719.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/05/2022 11:15, Lin Liu wrote:
> ext2 has nothing to do with this logic.

This code was a verbatim copy from Linux. Looking at the history, I am 
not sure there was even a connection with the ext2 filesystem (I guess 
this is what you mean?).

So I would drop this and simply say that we could use the new helpers.

>  Clean up the code with
> xen/byteswap.h which now has an unsigned long helper.
> 
> No functional change.
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>

Other that what I wrote above:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

