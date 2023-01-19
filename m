Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88086673A9F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481073.745766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVDi-0005zF-2V; Thu, 19 Jan 2023 13:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481073.745766; Thu, 19 Jan 2023 13:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVDh-0005x0-V9; Thu, 19 Jan 2023 13:44:45 +0000
Received: by outflank-mailman (input) for mailman id 481073;
 Thu, 19 Jan 2023 13:44:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIVDg-0005wc-VA
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:44:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVDg-0003C5-2B; Thu, 19 Jan 2023 13:44:44 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.13.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVDf-0004yb-TA; Thu, 19 Jan 2023 13:44:44 +0000
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
	bh=5pqVR02lTa+ra0WNhgR4h4WJ9IuegtAWsnEXz3rsEM0=; b=Kg7N7W46c66O8QKcY5B+Aru4oR
	0w8xbKCnh+731I9rE1d2A0hGRb3RGmiWq/sRagiLM23Tr9LD0a3HJZTIHBWLYj3KsjU5nluKpWroc
	srv+M3AKklbNsqaW5JUZGqYcMcESCQhGaupoAcsnDCPq3vP1t/JQM+G1BAXstQ+NxOdI=;
Message-ID: <dcfe62e0-ee9c-57ca-205d-2beca5bb678f@xen.org>
Date: Thu, 19 Jan 2023 13:44:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 12/17] tools/xenstore: don't let hashtable_remove()
 return the removed value
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230118095016.13091-1-jgross@suse.com>
 <20230118095016.13091-13-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230118095016.13091-13-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 18/01/2023 09:50, Juergen Gross wrote:
> Letting hashtable_remove() return the value of the removed element is
> not used anywhere in Xenstore, and it conflicts with a hashtable
> created specifying the HASHTABLE_FREE_VALUE flag.
> 
> So just drop returning the value.
> 
> This of course requires to free the value if the HASHTABLE_FREE_VALUE
> was specified, as otherwise it would be a memory leak.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

