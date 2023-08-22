Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F0783E01
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 12:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588398.919915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYOhZ-0005hG-Ru; Tue, 22 Aug 2023 10:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588398.919915; Tue, 22 Aug 2023 10:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYOhZ-0005fQ-Ow; Tue, 22 Aug 2023 10:33:33 +0000
Received: by outflank-mailman (input) for mailman id 588398;
 Tue, 22 Aug 2023 10:33:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYOhY-0005fK-4v
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 10:33:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYOhU-0008QS-TQ; Tue, 22 Aug 2023 10:33:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYOhU-0008L6-O4; Tue, 22 Aug 2023 10:33:28 +0000
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
	bh=IqCk8t5Gih/6Xn73nPsCubatd35DupqecbM+TV+Til8=; b=WSu6CO6VvouuWwMa+u94wzR2h/
	BtIEvScxHTbGYqn9tXD7e5P1meoNi6ef++xWXmfNXQusQaFtVGyszs1qq8WDHm5/Fjp69QvrVqxnR
	KBU/HPei+GQ8PJMAFbUMXdVp8GL+Mwk3yYWiwmML0HMl+5JSETWxDt7lTjZ+N/VdGUL0=;
Message-ID: <efd756ff-9fc1-49a7-b5d7-841915a9ee63@xen.org>
Date: Tue, 22 Aug 2023 11:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: add exceptions to rules
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230822013014.2523202-1-sstabellini@kernel.org>
 <f3ea87fe-cc05-453a-87b0-e7f795e24459@xen.org>
 <ee6fe3b0-92ab-e215-ea0e-091658b87138@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ee6fe3b0-92ab-e215-ea0e-091658b87138@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22/08/2023 11:12, Jan Beulich wrote:
> On 22.08.2023 09:56, Julien Grall wrote:
>> On 22/08/2023 02:30, Stefano Stabellini wrote:
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -59,7 +59,8 @@ maintainers if you want to suggest a change.
>>>         - Required
>>>         - Precautions shall be taken in order to prevent the contents of a
>>>           header file being included more than once
>>> -     -
>>
>> It is not clear to me why this line is removed. Was it added by mistake
>> in a previous commit?
> 
> The patch is replacing an empty comment ...
> 
>>> +     - Files that are intended to be included more than once do not need to
>>> +       conform to the directive
> 
> ... with a non-empty one.

I understand that... My question is more related to why we originally 
added one? If this was done on purpose, then why are we removing it?

Cheers,

-- 
Julien Grall

