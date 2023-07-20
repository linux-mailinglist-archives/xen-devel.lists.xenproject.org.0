Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA675BAA9
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566773.886069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcEK-0004rz-RW; Thu, 20 Jul 2023 22:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566773.886069; Thu, 20 Jul 2023 22:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcEK-0004px-On; Thu, 20 Jul 2023 22:34:40 +0000
Received: by outflank-mailman (input) for mailman id 566773;
 Thu, 20 Jul 2023 22:34:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMcEJ-0004pr-2H
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:34:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMcEI-0001od-3B; Thu, 20 Jul 2023 22:34:38 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.24.131]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMcEH-0002EY-TI; Thu, 20 Jul 2023 22:34:38 +0000
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
	bh=fJRcYabS2lk4HLM2SyiLqij6GQwimGvrDIS/QYNFSDg=; b=Ra+XWXt0B4lxOgEf1PzBJ0L67U
	8VvkLRh6asJwgvlFHPE9sYfvzPAqg1yp3LkE5mDW9NG3OaYKqtKgeHImOeueVqHY5dGAj4O+JSQet
	xUB1XyHs+3bF2f7emCWT7iPJIu5+yQQLJ3pHBjOGEYBOyReBCssdIbdM9ylAcmPT8uqI=;
Message-ID: <6e858280-c778-883c-0f8d-2afa737232fd@xen.org>
Date: Thu, 20 Jul 2023 23:34:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH] tools/xenstore: fix XSA-417 patch
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230720150459.31111-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230720150459.31111-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 20/07/2023 16:04, Juergen Gross wrote:
> The fix for XSA-417 had a bug: domain_alloc_permrefs() will not return
> a negative value in case of an error, but a plain errno value.
> 
> Note this is not considered to be a security issue, as the only case
> where domain_alloc_permrefs() will return an error is a failed memory
> allocation. As a guest should not be able to drive Xenstore out of
> memory, this is NOT a problem a guest can trigger at will.
> 
> Fixes: ab128218225d ("tools/xenstore: fix checking node permissions")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

