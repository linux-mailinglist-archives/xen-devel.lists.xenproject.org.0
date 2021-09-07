Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B7402A63
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 16:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181096.328092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbit-0002IQ-BL; Tue, 07 Sep 2021 14:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181096.328092; Tue, 07 Sep 2021 14:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbit-0002G4-83; Tue, 07 Sep 2021 14:05:15 +0000
Received: by outflank-mailman (input) for mailman id 181096;
 Tue, 07 Sep 2021 14:05:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTX3=N5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mNbis-0002Fw-CW
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 14:05:14 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dfa05ba-0966-4b85-aa69-e27de524392b;
 Tue, 07 Sep 2021 14:05:13 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631023508010397.42168302385335;
 Tue, 7 Sep 2021 07:05:08 -0700 (PDT)
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
X-Inumbo-ID: 3dfa05ba-0966-4b85-aa69-e27de524392b
ARC-Seal: i=1; a=rsa-sha256; t=1631023510; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DwVlQ8X2gwzBmofhZa0/mLTHPEFlZjcMnPjguUG6rAl52TJYQ1DLpmpEN4Ye3zovYIVKjdpMMPeR/11Jooh2ZCky0kTwuOA7fLDtb0UxS0OvMNfhl3ZEKekUxESMEy2Hcw3UbKGp2A/N3JCQFEPGps51Pdc8c47dltQNpke+uNQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631023510; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GDLLgnfggnonVh83Z26KWmFNzxC2njX3v4Ulq7RK37o=; 
	b=El0mEU8QogFCmZvWlx5baQjQITtDhMYQ7QHP4OE9zDsttTahbauYGL8F4CaYbCGmib63Ls8TT2zIth7ENcepYPUuE3ikClAet8G3ExM51JFJuse8/ko6RnXdpG6oYo6RX+shc8qIdRAhgsUzy6b9ZOepqW2t+RUhYkq0IhtVYPY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631023510;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GDLLgnfggnonVh83Z26KWmFNzxC2njX3v4Ulq7RK37o=;
	b=A33lDEdZgYvISMA48FhQDSKaPy+eJmF6V4PbzsRsIYW/o2EO+iEOiYzbdhCSUSPB
	9GQiVlBCUxKTqpOi5+J1DC9VY28YrsVNaN4ayE0Mnn2dYuqgwIO4o89sqPA/aZXtVpQ
	DwPWvlaHIciSfItuSpYk55W6BJRLUlMNJ/OlYZMA=
Subject: Re: [PATCH v4 11/11] xsm: remove alternate xsm hook interface
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-12-dpsmith@apertussolutions.com>
 <b35d8b3a-c398-a101-8893-6a3ca6906e94@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <c4c6a02e-a7d2-b225-050d-ea3312924d06@apertussolutions.com>
Date: Tue, 7 Sep 2021 10:03:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b35d8b3a-c398-a101-8893-6a3ca6906e94@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/6/21 3:18 PM, Andrew Cooper wrote:
> On 03/09/2021 20:06, Daniel P. Smith wrote:
>> -static inline int xsm_memtype(xsm_default_t def, uint32_t access)
>> +#if 0
>> +/* Could not find any usages */
>> +static inline int xsm_memtype(xsm_default_t action, uint32_t access)
>>   {
>>       return alternative_call(xsm_ops.memtype, access);
>>   }
>> +#endif
> 
> There wants to be an earlier patch deleting dead code.  We don't want to
> retain this if-0'd out.

I can transition this to a standalone patch at the beginning to drop the 
benign code.

>> diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
>> new file mode 100644
>> index 0000000000..b9a7e8c40f
>> --- /dev/null
>> +++ b/xen/xsm/dummy.h
>> @@ -0,0 +1,739 @@
>> +/*
>> + *  Default XSM hooks - IS_PRIV and IS_PRIV_FOR checks
>> + *
>> + *  Author: Daniel De Graaf <dgdegra@tyhco.nsa.gov>
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License version 2,
>> + *  as published by the Free Software Foundation.
>> + *
>> + *
>> + *  Dummy XSM hooks implementing the default access check. Each hook should
>> + *  have as its first line XSM_DEFAULT_ACTION declaring the privilege level
>> + *  required for this access.
>> + */
>> +
>> +#ifndef __XSM_DUMMY_H__
>> +#define __XSM_DUMMY_H__
>> +
>> +#include <xen/sched.h>
>> +#include <xsm/xsm-core.h>
>> +#include <public/hvm/params.h>
>> +
>> +#define XSM_DEFAULT_ACTION(def) xsm_default_t action = def; (void)action
>> +
>> +static always_inline int xsm_default_action(
>> +    xsm_default_t action, struct domain *src, struct domain *target)
>> +{
>> +    switch ( action ) {
> 
> Either here (because you're moving code), or in the style fix, the brace
> wants to be on the next line.

I will promote to the style patch and carry it through the move.

v/r,
dps

