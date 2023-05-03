Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B306F5887
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 15:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529202.823330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC90-0003I9-HI; Wed, 03 May 2023 13:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529202.823330; Wed, 03 May 2023 13:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC90-0003GT-E2; Wed, 03 May 2023 13:03:42 +0000
Received: by outflank-mailman (input) for mailman id 529202;
 Wed, 03 May 2023 13:03:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puC8y-0003GN-Co
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:03:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puC8x-0002hD-Gd; Wed, 03 May 2023 13:03:39 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puC8x-0003lm-8P; Wed, 03 May 2023 13:03:39 +0000
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
	bh=h+RlaBcIWCR28e7I+kfx12e/YKFC6yRGKVdpoY41KuE=; b=gTJjWFEhVB2YsmAO8bIy28t2sD
	OBU4/9XTrlMJUXWRFW4ZDPR/dGbBNe3DfLkmKxkmPy1U//CI1upBhp44eXQrmsP2NVhgTB2ogEeQt
	8pBiHpPjVhgSxLlTYnvBfwdVg1LC/33QG0k/nuYviMWpzW+pJ7GNpquaxdbb7YAdqRWY=;
Message-ID: <d918cc78-de22-9599-9a91-f6c11028d11b@xen.org>
Date: Wed, 3 May 2023 14:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 04/13] tools/xenstore: let hashtable_insert() return 0
 on success
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230330085011.9170-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/03/2023 09:50, Juergen Gross wrote:
> Today hashtable_insert() returns 0 in case of an error. Change that to
> let it return an errno value in the error case and 0 in case of success.

I usually find such change risky because it makes the backport more 
complex if we introduce a new call to hashtable_insert() and it is also 
quite difficult to review (the compiler would not help to confirm all 
the callers have changed).

So can you provide a compelling reason for doing the change? 
(consistency would not be one IMO)

Cheers,

-- 
Julien Grall

