Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDCA808983
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 14:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649867.1014907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEnO-0001OC-1O; Thu, 07 Dec 2023 13:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649867.1014907; Thu, 07 Dec 2023 13:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEnN-0001MX-UU; Thu, 07 Dec 2023 13:52:05 +0000
Received: by outflank-mailman (input) for mailman id 649867;
 Thu, 07 Dec 2023 13:52:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBEnM-0001M7-OO
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 13:52:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBEnM-0004J9-3E; Thu, 07 Dec 2023 13:52:04 +0000
Received: from [15.248.3.113] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBEnL-00009s-RV; Thu, 07 Dec 2023 13:52:03 +0000
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
	bh=U8FLwk1t6lAl+GtJxDCuCXHQUwyHkPzGW9n8rEj0nK0=; b=TmPE2lX3iL9wbuSllzJ49CEob2
	/PpM0Ffl+zXn3XLeNYnHwaVomXnY+mSJ1rbioe9hjwHnQYVp+RMfe5OrthqpwPtbdQoWVYgSGFjop
	yzOqDliwidVnZV9l2xsaAxz1gnL18SQKqSMvZIXFeN2p354sZzDxC25aOoRdZaZQ7CuM=;
Message-ID: <f57fad10-f5c9-4a28-8c46-bc398bdc2dd3@xen.org>
Date: Thu, 7 Dec 2023 13:52:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] xen/mm: add declaration for first_valid_mfn
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1701947290.git.nicola.vetrini@bugseng.com>
 <2c02524be7d02064fdf2f5003ef1c507034e4437.1701947290.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2c02524be7d02064fdf2f5003ef1c507034e4437.1701947290.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/12/2023 11:11, Nicola Vetrini wrote:
> Such declaration is needed to comply with MISRA C Rule 8.4, because a
> compatible declaration is not visible in xen/common/page_alloc.c, where the
> variable is defined. That variable can't yet be static because of the lack of
> support from ARM and PPC for NUMA.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Having this declaration essentially sidesteps the current impossibility
> of having a static variable, as described in the comments in
> ARM and PCC's asm/numa.h.
With this change, is there any reason to keep the various declaration of 
first_valid_mfn in numa.h?

Cheers,

-- 
Julien Grall

