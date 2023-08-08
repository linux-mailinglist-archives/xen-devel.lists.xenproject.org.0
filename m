Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B7774E2E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 00:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580528.908780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTV5K-0008D0-HX; Tue, 08 Aug 2023 22:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580528.908780; Tue, 08 Aug 2023 22:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTV5K-0008AM-Dz; Tue, 08 Aug 2023 22:21:50 +0000
Received: by outflank-mailman (input) for mailman id 580528;
 Tue, 08 Aug 2023 22:21:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTV5I-0008AG-9y
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 22:21:48 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4d1e5f9-3639-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 00:21:45 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 169153329184280.73507637940781;
 Tue, 8 Aug 2023 15:21:31 -0700 (PDT)
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
X-Inumbo-ID: f4d1e5f9-3639-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691533294; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S5UbPESoyGc4fJ9i3MzznzVVl8DXErgTlpt56beSU85PhS55JSwlsYOUH+AMkWx3ADoSoE9U9pi2pxYvTT4kty3a05N93HYqrSbhXcbqTvBFYSDX7tKcgI3qmp8xTkZOnp99BZ4jJy1R8Y2jGsH840LXglaCYh/O2gZyBEoWF9Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691533294; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=88j7gu/5pbiHC2iyQK4RrtMPtJazFeuz6Ak0rV88tXc=; 
	b=m2WjCTUlCpe0wKwFNb1dHj+o/l1R+gSpfaU7PWZU0GVoxE/2pk4e1hpV+bXRAW/2fx5fHMIfMKwaOUi0o6KREiHG56vSXRlRQv4PKuMpcTKp7JAGr2FJxi/W/mXDDEBMpRYm4tpH752+c7yN/RzctsqxZmkZVGS8k0ECBKhWRgc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691533294;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=88j7gu/5pbiHC2iyQK4RrtMPtJazFeuz6Ak0rV88tXc=;
	b=XJ9QxwP1vHqD28YG9/xJUoIpe6ZbeIt5+yXIHczlCZW1YUqmO5eFLKb+oVjMC8uL
	a37LdDQWNimp6eDD8O0VQy0BlagAgAQLwCNoJ5lx4et6gv6Kl8KRBs8aAwibFlgjeKF
	pgov/DVQLqBwgh8j44ByZT+2zjcjd2TiHyazWPdM=
Message-ID: <cccaff98-9ab0-7fa6-8d49-239e1c9c381a@apertussolutions.com>
Date: Tue, 8 Aug 2023 18:21:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC 2/6] roles: provide abstraction for the possible domain
 roles
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-3-dpsmith@apertussolutions.com>
 <e178e8f0-312e-961f-6f09-84305f07d528@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <e178e8f0-312e-961f-6f09-84305f07d528@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/8/23 11:15, Jan Beulich wrote:
> On 01.08.2023 22:20, Daniel P. Smith wrote:
>> @@ -1076,7 +1076,8 @@ static always_inline bool is_hardware_domain(const struct domain *d)
>>       if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>>           return false;
>>   
>> -    return evaluate_nospec(d == hardware_domain);
>> +    return evaluate_nospec(((d->role & ROLE_HARDWARE_DOMAIN) ||
>> +        is_initial_domain(d)) && (d == hardware_domain));
>>   }
>>   
>>   /* This check is for functionality specific to a control domain */
>> @@ -1085,7 +1086,8 @@ static always_inline bool is_control_domain(const struct domain *d)
>>       if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>>           return false;
>>   
>> -    return evaluate_nospec(d->is_privileged);
>> +    return evaluate_nospec((d->role & ROLE_CONTROL_DOMAIN) ||
>> +        is_initial_domain(d));
>>   }
> 
> Why these complicated conditions, and not just the check of the single
> relevant role bit? (Also note that indentation used here doesn't really
> match our expectations, but there are other style issues in the patch
> as well, which I assume is okay for an RFC.)

They go away with suggestion to move ROLE_UNBOUNDED a concatenation of 
all the other roles.

Ack on the style.

v/r,
dps


