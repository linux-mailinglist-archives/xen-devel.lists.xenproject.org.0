Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64586E8148
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 20:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523734.814071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCas-0002Of-U4; Wed, 19 Apr 2023 18:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523734.814071; Wed, 19 Apr 2023 18:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCas-0002MJ-RH; Wed, 19 Apr 2023 18:31:50 +0000
Received: by outflank-mailman (input) for mailman id 523734;
 Wed, 19 Apr 2023 18:31:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ppCar-0002MD-HA
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 18:31:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCap-0005Bx-94; Wed, 19 Apr 2023 18:31:47 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.29.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCap-0008H3-0J; Wed, 19 Apr 2023 18:31:47 +0000
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
	bh=35h22Yf84WTwtpzdSSa7TKg5qV7e96LLjfsZ+RDUjiQ=; b=MdtPMdFdmLKpiY4jm/2Wdv/5fp
	u31J+DV8IBzy048iW5Bue7+sK4bBOmJt3qFjaHSOIfqMCfU8Lf5Zpzfp63GJpkND1gFgJq1Iw4d+4
	xxndZr9okmlL//bk9Aq29JDwFd3/VowulS7ZT49ZOAD9lAkivtURyz5TNUPQeWQlrQqI=;
Message-ID: <cd940d9c-a12c-e52a-0363-e5770c282688@xen.org>
Date: Wed, 19 Apr 2023 19:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] tools/xenstore/xenstored_control.c: correctly print
 time_t
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Alexander Kanavin <alex@linutronix.de>,
 xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230419120710.855128-1-alex@linutronix.de>
 <99abd9a7-87cd-2f37-05bd-f4cdffd47a9c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <99abd9a7-87cd-2f37-05bd-f4cdffd47a9c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/04/2023 13:42, Juergen Gross wrote:
> On 19.04.23 14:07, Alexander Kanavin wrote:
>> On 32 bit systems with 64 bit time_t (hello, Y2038 problem),
>> the following error occurs otherwise:
>>
>> | xenstored_control.c: In function 'lu_reject_reason':
>> | xenstored_control.c:646:70: error: format '%ld' expects argument of 
>> type 'long int', but argument 5 has type 'time_t' {aka 'long long 
>> int'} [-Werror=format=]
>>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

I have committed it.

Thanks,

-- 
Julien Grall

