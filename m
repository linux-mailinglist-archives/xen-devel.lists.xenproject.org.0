Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8081F351696
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 18:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104628.200356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzm7-0007Hh-3o; Thu, 01 Apr 2021 16:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104628.200356; Thu, 01 Apr 2021 16:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzm7-0007HM-0j; Thu, 01 Apr 2021 16:02:27 +0000
Received: by outflank-mailman (input) for mailman id 104628;
 Thu, 01 Apr 2021 16:02:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRzm6-0007HH-9R
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 16:02:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRzm4-0001OQ-KH; Thu, 01 Apr 2021 16:02:24 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRzm4-0000Gr-CV; Thu, 01 Apr 2021 16:02:24 +0000
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
	bh=Sv8RS+0wdbIiWMwwTW7Y/bRZsDmFGVjABoKk8ZFtJ9Y=; b=pe0YJGhRcxIzxEGjv0rYVUehP0
	/d9RRrQ9nap11zTZFzUV2qvQiPPFCdgegruEUrkR5W2rpiZ2SbgJZYa0AbeW4ImDtbWe7gxZjbA4x
	TDe4HZIyn012wPMu1tMUOAZ9wzFKVxKz2uMYhqAKv1BWEN0fD2+TOzU3i1AXclGKVz9E=;
Subject: Re: [PATCH v2 1/2] common: map_vcpu_info() cosmetics
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <2a08aa31-fdbf-89ee-cd49-813f818b709a@suse.com>
 <29514f9a-b630-f66e-286e-8b73fcf4d58a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c70fc937-2986-83dc-417c-576180f8ce3c@xen.org>
Date: Thu, 1 Apr 2021 17:02:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <29514f9a-b630-f66e-286e-8b73fcf4d58a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 22/12/2020 08:14, Jan Beulich wrote:
> Use ENXIO instead of EINVAL to cover the two cases of the address not
> satisfying the requirements. This will make an issue here better stand
> out at the call site.
> 
> Also add a missing compat-mode related size check: If the sizes
> differed, other code in the function would need changing. Accompany this
> by a change to the initial sizeof() expression, tying it to the type of
> the variable we're actually after (matching e.g. the alignof() added by
> XSA-327).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

