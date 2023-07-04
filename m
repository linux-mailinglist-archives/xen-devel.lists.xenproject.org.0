Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A77478AB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 21:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558662.872988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGldZ-00026S-BR; Tue, 04 Jul 2023 19:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558662.872988; Tue, 04 Jul 2023 19:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGldZ-00023V-7Q; Tue, 04 Jul 2023 19:24:33 +0000
Received: by outflank-mailman (input) for mailman id 558662;
 Tue, 04 Jul 2023 19:24:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGldY-00023P-Go
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 19:24:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGldY-0000V6-5G; Tue, 04 Jul 2023 19:24:32 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGldX-00021H-Vw; Tue, 04 Jul 2023 19:24:32 +0000
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
	bh=E/peYUKdas0QqKLojm8QuYbMx7tolvhytNAjJWqSpMw=; b=HvvODMdez5+8K1bZ/SD54rfd6C
	5lZYm/26EX6j1knDx3cqCyvYz2jLM6LQkXHral/zZINGdyPEwJQZNZ/u9Jc+Y88mXVTZ8tipmenz1
	4KEDpYslu2AQesYElg9gT46cS0e2gb1odnYT0RBwJhrA4mQxwrf9XiRB2UR58mNRt/ks=;
Message-ID: <95f41dfc-893b-d8b8-9038-14683749672a@xen.org>
Date: Tue, 4 Jul 2023 20:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 04/52] xen/arm: add .text.idmap in ld script for Xen
 identity map sections
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-5-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-5-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 26/06/2023 04:33, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> Only the first 4KB of Xen image will be mapped as identity
> (PA == VA). At the moment, Xen guarantees this by having
> everything that needs to be used in the identity mapping
> in .text.header section of head.S, and the size will be
> checked by _idmap_start and _idmap_end at link time if this
> fits in 4KB.
> 
> In a later patch, we will move the MMU specific code out
> of head.S. Although we can add .text.header to the new file
> to guarantee all identity map code still in the first 4KB.
> However, the order of these two files on this 4KB depends
> on the build tools. Currently, we use the build tools to
> process the order of objs in the Makefile to ensure that
> head.S must be at the top. But if you change to another
> build tools, it might not be the same result.
> 
> In this patch we introduce a new section named .text.idmap
> in the region between _idmap_start and _idmap_end. And in
> Xen link script, we force the .text.idmap contents to linked
> after .text.header. This will ensure code of head.S always be
> at the top of Xen binary.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Now that this patch is only a single line change, I would fold it in the 
patch introducing the first user (i.e. patch #7).

Cheers,

-- 
Julien Grall

