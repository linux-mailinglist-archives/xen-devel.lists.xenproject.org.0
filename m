Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264674EF92A
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 19:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297536.506899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLS8-0008RR-IO; Fri, 01 Apr 2022 17:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297536.506899; Fri, 01 Apr 2022 17:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLS8-0008OS-Ez; Fri, 01 Apr 2022 17:52:52 +0000
Received: by outflank-mailman (input) for mailman id 297536;
 Fri, 01 Apr 2022 17:52:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naLS6-0008OM-Eu
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 17:52:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLS4-0002b8-Ha; Fri, 01 Apr 2022 17:52:48 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLS4-0000w0-AV; Fri, 01 Apr 2022 17:52:48 +0000
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
	bh=vaGXs0kXfTGq6WkbcoTe+cFWHmqM3O5xX2UMXuGPTUA=; b=yKlUNaMp1RcdZwB/N3NS8uiK53
	cqvB6FiQsjIAzSeId6nHwN/yCylop8iVQeHm81cdllVVhJ5UKcxNyXTEmJVI2M6r/AafXj/7UibkC
	6VRnhaKTYmMIquADfD8MneLH2j8UjONw8FAh2VKLyDx2hxPMiviq7/vPsCO2QrLbye5Y=;
Message-ID: <90fd48a1-446b-fb7d-a732-d2c1ede0921b@xen.org>
Date: Fri, 1 Apr 2022 18:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, scott.davis@starlab.io,
 jandryuk@gmail.com, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YkWgXhFVq/fD72CB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 31/03/2022 13:36, Roger Pau Monné wrote:
> On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
>> There are now instances where internal hypervisor logic needs to make resource
>> allocation calls that are protected by XSM checks. The internal hypervisor logic
>> is represented a number of system domains which by designed are represented by
>> non-privileged struct domain instances. To enable these logic blocks to
>> function correctly but in a controlled manner, this commit introduces a pair
>> of privilege escalation and demotion functions that will make a system domain
>> privileged and then remove that privilege.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
> 
> I'm not sure this needs to be in xsm code, AFAICT it could live in a
> more generic file.
> 
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index e22d6160b5..157e57151e 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -189,6 +189,28 @@ struct xsm_operations {
>>   #endif
>>   };
>>   
>> +static always_inline int xsm_elevate_priv(struct domain *d)
> 
> I don't think it needs to be always_inline, using just inline would be
> fine IMO.
> 
> Also this needs to be __init.

Hmmm.... I thought adding __init on function defined in header was 
pointless. In particular, if the compiler decides to inline it.

In any case, I think it would be good to check that the system_state < 
SYS_state_active (could potentially be an ASSERT()) to prevent any misuse.

Cheers,

-- 
Julien Grall

