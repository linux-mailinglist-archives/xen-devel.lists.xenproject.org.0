Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A18355BED
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 21:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106241.203193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqy1-0001xc-C8; Tue, 06 Apr 2021 19:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106241.203193; Tue, 06 Apr 2021 19:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqy1-0001xD-8l; Tue, 06 Apr 2021 19:02:25 +0000
Received: by outflank-mailman (input) for mailman id 106241;
 Tue, 06 Apr 2021 19:02:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTqxz-0001x8-6T
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 19:02:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqxt-0005Hm-Jl; Tue, 06 Apr 2021 19:02:17 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqxt-0007Qa-BF; Tue, 06 Apr 2021 19:02:17 +0000
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
	bh=V+2KWVr8Ye1hPT90cOEVl1XOuQ3nOSNws22bVBX+fOA=; b=5rvPuUttTaxImnDFqMJZbWTuRq
	2lsGRZlu8JqQq8Cw0azV6znAAfuhJzoiPmZPXZ7zIZ90zCBOF8SJq8581V8Sb1GkbUlsoAlhs+18e
	iWioFXEZOwufqJqr2sF9n/MkLMPiwZBMlV271eeCNuDHyHbBtu4ZBlAxZTbDk9dXfZBM=;
Subject: Re: [PATCH 08/14] tools/firmware: hvmloader: Use const in __bug() and
 __assert_failed()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-9-julien@xen.org> <YGwNz6ZP8qtVVx+D@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <e9c01ed3-b1ba-744f-daa2-d9fd195f5055@xen.org>
Date: Tue, 6 Apr 2021 20:02:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGwNz6ZP8qtVVx+D@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 06/04/2021 08:29, Roger Pau Monné wrote:
> On Mon, Apr 05, 2021 at 04:57:07PM +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> __bug() and __assert_failed() are not meant to modify the string
>> parameters. So mark them as const.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

> 
> While looking at this I think we should also make the line parameter
> unsigned, but again doesn't need to be part of this patch.
I would prefer if this is done in a follow-up patch.

Cheers,

-- 
Julien Grall

