Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24652FD7D4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 19:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71709.128641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HvL-0008I0-1M; Wed, 20 Jan 2021 18:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71709.128641; Wed, 20 Jan 2021 18:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2HvK-0008HY-UM; Wed, 20 Jan 2021 18:09:42 +0000
Received: by outflank-mailman (input) for mailman id 71709;
 Wed, 20 Jan 2021 18:09:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2HvJ-0008HT-PT
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 18:09:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HvI-0006iN-3L; Wed, 20 Jan 2021 18:09:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2HvH-0001u3-T7; Wed, 20 Jan 2021 18:09:40 +0000
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
	bh=A1CQvhMkLTGNcaKVTANUACwkCsp+aAxjwvi+FIKnxnM=; b=zNeytGIGI7qkhQJdEi8/Uepy4Y
	sT5ornsFxue9dn0k0bXX5otLRg1/FoaHMxLo9KLW/+MmmmIsMJ+0FLVT1qLeoquHQwyDs8DIwD9KR
	n3pSGNMJ9/Y64we8RnHK91v5wktdT2a0L1UGSKvpDcCIREEfjQwmbAQI/yDZ9puLFIls=;
Subject: Re: [PATCH v6 2/3] xen: enable keyhandlers to work without register
 set specified
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210116103339.21708-1-jgross@suse.com>
 <20210116103339.21708-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <78350b6b-e37b-7452-1656-e2dacd0f0001@xen.org>
Date: Wed, 20 Jan 2021 18:09:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210116103339.21708-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 16/01/2021 10:33, Juergen Gross wrote:
> There are only two keyhandlers which make use of the cpu_user_regs
> struct passed to them. In order to be able to call any keyhandler in
> non-interrupt contexts, too, modify those two handlers to cope with a
> NULL regs pointer by using run_in_exception_handler() in that case.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

