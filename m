Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6B44DB7A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 19:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224868.388409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEbg-0002lz-3J; Thu, 11 Nov 2021 18:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224868.388409; Thu, 11 Nov 2021 18:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlEbf-0002jK-VT; Thu, 11 Nov 2021 18:15:27 +0000
Received: by outflank-mailman (input) for mailman id 224868;
 Thu, 11 Nov 2021 18:15:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mlEbf-0002jE-8t
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 18:15:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mlEbe-00033x-PC; Thu, 11 Nov 2021 18:15:26 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.21.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mlEbe-0000mj-IA; Thu, 11 Nov 2021 18:15:26 +0000
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
	bh=neclcxZecPd1G6I42Q7FcOjCjypvKTmhDd+cD/f3+Kk=; b=6lGAGGkBCUkSHggC11MIKX9w/9
	Zi/Z6R9m5SWfTppCKyd6g+eJVmcvGUOdf8asBwy62bdh2DFv6BVeCUXwczqvSnMsCj+3GlYJRWzFr
	QxKsck8kG8lo54oP+Mvtnz/RmgSVWYpu1cjVoeRvTnb+/Q3GWhQ9/qWFbfcuICMofKVQ=;
Message-ID: <409d2c17-d1e7-40b3-226a-b6ca4c0a15bf@xen.org>
Date: Thu, 11 Nov 2021 18:15:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH 3/5] xen/sort: Switch to an extern inline implementation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-4-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211111175740.23480-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 11/11/2021 17:57, Andrew Cooper wrote:
> There are exactly 3 callers of sort() in the hypervisor.
> 
> Both arm callers pass in NULL for the swap function.  While this might seem
> like an attractive option at first, it causes generic_swap() to be used which
> forced a byte-wise copy.  Provide real swap functions which the compiler can
> optimise sensibly.

I understand the theory, but none of the two calls are in hot paths or 
deal with large set on Arm. So I am rather hesitant to introduce 
specialised swap in each case as it doesn't seem we will gain much from 
this change.

Cheers,

-- 
Julien Grall

