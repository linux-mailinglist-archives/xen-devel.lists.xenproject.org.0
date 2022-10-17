Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA36012C4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 17:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424475.671922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okS4X-0008Pf-OA; Mon, 17 Oct 2022 15:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424475.671922; Mon, 17 Oct 2022 15:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okS4X-0008NT-Kr; Mon, 17 Oct 2022 15:30:33 +0000
Received: by outflank-mailman (input) for mailman id 424475;
 Mon, 17 Oct 2022 15:30:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okS4V-0008NN-Ix
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 15:30:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okS4V-0001cV-5h; Mon, 17 Oct 2022 15:30:31 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.28.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okS4U-0004gi-TF; Mon, 17 Oct 2022 15:30:31 +0000
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
	bh=RQWPAod5zPYOTu0wfDlA767sF3cSMeGzOoDOveLZvqg=; b=LhwmVUejmnxmQ5bdxarhyPo52Q
	NBBkVqYVlW1HzULyUpYn0WUECN9atdcVMBZwK8WX9vhNbSb9kEpsXJYSISOLLkUeeMH2WjR5YU98t
	jZaYrB8UVMP4nlOn92xzyBJfvHUpBBxlqbajiJyZbLoN41YeqJXjyahMMuFU8JLaWrXg=;
Message-ID: <69fbbfef-b91a-25cd-bf72-017f1f789f77@xen.org>
Date: Mon, 17 Oct 2022 16:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v3] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221017074618.36818-1-Henry.Wang@arm.com>
 <394c1a33-9549-77b2-6981-65e69c292954@citrix.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <394c1a33-9549-77b2-6981-65e69c292954@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 17/10/2022 16:21, Andrew Cooper wrote:
> On 17/10/2022 08:46, Henry Wang wrote:
> Looking at between 4.13 and staging, you want to be calling
> set_allocation(0) in p2m_final_teardown() ahead of of the p->domain
> check.

Hmm... IIUC, you are suggesting the following code:

p2m_set_allocation(0);

if ( p->domain )
   return;

If yes, this is in theory not safe because 'p2m' is technically not 
initialized. All the list use are thankfully protected with zeroed 
field. But this is quite fragile.

I think it would be better if p->domain is set ahead of the first error 
returned in p2m_init().

Cheers,

-- 
Julien Grall

