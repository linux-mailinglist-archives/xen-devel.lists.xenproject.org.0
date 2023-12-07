Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5080808F2B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 18:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650098.1015338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBIcO-0006sm-HY; Thu, 07 Dec 2023 17:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650098.1015338; Thu, 07 Dec 2023 17:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBIcO-0006r6-Ek; Thu, 07 Dec 2023 17:57:00 +0000
Received: by outflank-mailman (input) for mailman id 650098;
 Thu, 07 Dec 2023 17:56:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rBIcN-0006qv-1d
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 17:56:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBIcL-0000kq-TB; Thu, 07 Dec 2023 17:56:57 +0000
Received: from [15.248.3.113] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rBIcL-0000iQ-Nc; Thu, 07 Dec 2023 17:56:57 +0000
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
	bh=q7l4TsoG8/ZqOAem0qiL/yMJMaKaHh4k5Zc+e5B1yVc=; b=0RbVuzPE/DN8xB/SKaJvLJORQu
	NrFrGIojHFDxzyiTNRsQfNNo0CpfHRWckQnZR2yyMEt9AoLPK0gua3trDK5yZN6IhTqZL7ZtMLQVS
	OzhzQYP34Uqp6SyvbbaUpnoy+3vxwFxBTAVVagepVbN3L3WjvtullfR0FMccJ5nTSQ2E=;
Message-ID: <2211ff2e-dd27-49a5-b41f-f56b60d2e3a5@xen.org>
Date: Thu, 7 Dec 2023 17:56:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: file exclusion automation
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <e17fba6f45a03f7acb0af342ed8aea97130dba4a.1701949157.git.nicola.vetrini@bugseng.com>
 <74abb34c-f253-4b4e-a3bb-3feb01fcc902@xen.org>
 <03d8668e6f8e9046eb784385a4585c28@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <03d8668e6f8e9046eb784385a4585c28@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 07/12/2023 17:53, Nicola Vetrini wrote:
> On 2023-12-07 18:08, Julien Grall wrote:
>> On 07/12/2023 11:39, Nicola Vetrini wrote:
>>> +-doc_begin="libfdt is out of scope."
>>> +-file_tag+={out_of_scope,"^xen/include/xen/libfdt/.*$"}
>>
>> AFAICT, before this was marked as "adopted". But this is now moved to 
>> "out_of_scope". Can you explain why?
>>
>> It also feels somewhat unrelated to the rest of the patch.
>>
>> Cheers,
> 
> I mistakenly changed the tag. It is not unrelated, as it't not part of 
> exclude-list.json (perhaps unintentionally). The manual exclusions that 
> remain in out_of_scope.ecl are there for this reason, since I wanted to 
> keep the set of excluded files as it was before.

Given that common/libfdt/* is part of the exclude-list.json, I can't see 
why include/xen/libfdt/* are not. So can you add it?

Cheers,

-- 
Julien Grall

