Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5B776EC0C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 16:13:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576403.902495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ4B-0002sF-Dp; Thu, 03 Aug 2023 14:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576403.902495; Thu, 03 Aug 2023 14:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZ4B-0002p5-B5; Thu, 03 Aug 2023 14:12:39 +0000
Received: by outflank-mailman (input) for mailman id 576403;
 Thu, 03 Aug 2023 14:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRZ4A-0002oj-9W
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 14:12:38 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca69b3f1-3207-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 16:12:35 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691071947595388.4374355217228;
 Thu, 3 Aug 2023 07:12:27 -0700 (PDT)
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
X-Inumbo-ID: ca69b3f1-3207-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691071950; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pt6gRMM6IMzhXREFSYSHGzioHoVMqsXCGAvRsTCiwMChVaCD5YdxkOJvqIee7eOLZo7/TQMm6gFhWg6uhnYI7Qnrl7/LHW3g8Y3XDTvATlar3bMeQ3eP2/0KIyuUtbKwTjspTllT0R4FQ3nL1ORzeadsqYQ7daTN6xt+0Mhr2Ss=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691071950; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=kgbWUzvjAJOai+vyRMYUHqrwL1+0ZrXPwIxIAWO83No=; 
	b=NTZy37Ykt6EK1Eax3m09lPVLXyxQwnGWyjffNqvxwiE0dEhcrHdfTjxND1oG5khzFMMh3h9q4725IUh38zxBNpsqC4PjW4GOEM7BdWTwmhkK0zjI2k/Hgi9tnHbhXrcSFILho1Yaa13son4jkxuVlbA2K3RwXt4B5xy0tmYjJ2A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691071950;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kgbWUzvjAJOai+vyRMYUHqrwL1+0ZrXPwIxIAWO83No=;
	b=Y54hJfE7KMKqqyeUzQlhB44OCuPcn4jNtftdk7gYv5SisU9pwq5GRC+jxQd0Tnjo
	jZmw6yjSScx+LPRz0cQMPt/3RmNaNHdOJ1ADpVUOA84bBNwZP7VQAJ0rNelsr6PN8+L
	14IJUdkbT/7TmGYmuxKlj0gjOv0I+49wIj9rAwso=
Message-ID: <40b73f1e-0dad-b6e8-ed21-3aaf1a35029c@apertussolutions.com>
Date: Thu, 3 Aug 2023 10:12:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
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
 <b64e236b-e9c3-2036-e43e-93b456e44ff9@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b64e236b-e9c3-2036-e43e-93b456e44ff9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/2/23 03:51, Jan Beulich wrote:
> On 01.08.2023 22:20, Daniel P. Smith wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -340,6 +340,14 @@ static int late_hwdom_init(struct domain *d)
>>       setup_io_bitmap(dom0);
>>   #endif
>>   
>> +    /*
>> +     * "dom0" may have been created under the unbounded role, demote it from
>> +     * that role, reducing it to the control domain role and any other roles it
>> +     * may have been given.
>> +     */
>> +    dom0->role &= ~(ROLE_UNBOUNDED_DOMAIN & ROLE_HARDWARE_DOMAIN);
> 
> This doesn't look to remove anything, when taking into account ...

Ugh, you are correct. It was meant to be a bitwise and of dom0-role with 
a mask that has every bit set except ROLE_UNBOUNDED_DOMAIN and 
ROLE_HARDWARE_DOMAIN. But being a bonehead, I bitwise and the two roles 
instead of or-ing them. I agree with your comment below, which will 
reduce to just masking a bitwise not of ROLE_HARDWARE_DOMAIN.

>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -467,8 +467,10 @@ struct domain
>>   #endif
>>       /* is node-affinity automatically computed? */
>>       bool             auto_node_affinity;
>> -    /* Is this guest fully privileged (aka dom0)? */
>> -    bool             is_privileged;
>> +#define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
>> +#define ROLE_CONTROL_DOMAIN    (1U<<1)
>> +#define ROLE_HARDWARE_DOMAIN   (1U<<2)
> 
> ... that each of the constants has just a single bit set. Seeing the
> & there I was expecting something like
> 
> #define ROLE_UNBOUNDED_DOMAIN  (ROLE_CONTROL_DOMAIN | ROLE_HARDWARE_DOMAIN)
> 
> instead.

Agree, instead of consuming one the limited number of bits for a role 
that represents a domain having all roles, just or all the roles 
together. Then I can reclaim one of the bits of the flag field.

v/r,
dps


