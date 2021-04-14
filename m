Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4EE35F20F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 13:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110515.210946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdVg-0005uU-Ba; Wed, 14 Apr 2021 11:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110515.210946; Wed, 14 Apr 2021 11:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdVg-0005u8-8S; Wed, 14 Apr 2021 11:16:40 +0000
Received: by outflank-mailman (input) for mailman id 110515;
 Wed, 14 Apr 2021 11:16:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWdVe-0005u2-VU
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 11:16:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWdVd-00005W-UU; Wed, 14 Apr 2021 11:16:37 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWdVd-00024V-LZ; Wed, 14 Apr 2021 11:16:37 +0000
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
	bh=Rm62n9DiP9EhMnVewb6N71g2+kOXxGxLy3nrnbCI3Yg=; b=0BgOy+d/RJyxABYUqIpSziDHih
	KMO6zZRn7Ntq1idYqrjS7O5E1VJFFJ+QRzwjL9/7OTpdBfv2Thm06N1Rg1sc0Suz+OCmhLIVSwA8P
	odUKtXNHYpjrjM2IPaEHcC3ZvQAf7/Iq2+18fZc4B1sFzVuf1rUuLFeNTCIwditJLfZ4=;
Subject: Re: [PATCH v4 2/4] xen/arm: Handle cases when hardware_domain is NULL
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3424d24f-b189-c125-7b84-96848bbdcfd7@xen.org>
Date: Wed, 14 Apr 2021 12:16:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414091404.14215-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 14/04/2021 10:14, Luca Fancellu wrote:
> Among the common and arm codebase there are few cases where
> the hardware_domain variable is checked to see if the current
> domain is equal to the hardware_domain, change this cases to
> use is_hardware_domain() function instead. >
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
> - removed unneeded check for domain NULL from is_hardware_domain
>    introduced in v3

After this change, this patch is only avoid to open-code 
is_hardware_domain(). Although, it adds an extra speculation barrier.

I am not against the change, however I think the commit message needs to 
updated to match what the patch is doing.

Can you propose a new commit message?

Cheers,

-- 
Julien Grall

