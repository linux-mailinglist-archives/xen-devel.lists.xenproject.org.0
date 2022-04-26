Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746ED50FB49
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313766.531505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIgh-0007bO-Q3; Tue, 26 Apr 2022 10:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313766.531505; Tue, 26 Apr 2022 10:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIgh-0007Z6-MB; Tue, 26 Apr 2022 10:44:55 +0000
Received: by outflank-mailman (input) for mailman id 313766;
 Tue, 26 Apr 2022 10:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVWk=VE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1njIgg-0007XV-93
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:44:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e633d383-c54d-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:44:52 +0200 (CEST)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650969886537818.2673685055015;
 Tue, 26 Apr 2022 03:44:46 -0700 (PDT)
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
X-Inumbo-ID: e633d383-c54d-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650969887; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iUfO5XZhhaxFKUapN+vEdfaDWAfsfylK5KWGJjm3l3yF/PfNTrFVxs0DW05GTOJwbkhn50V0A1QezI5K2YdQ8xMD+91QLP4t0UIRn9nDKlcmB3/l4ec5rC/tW4Wa0spTy6kP50rXSi1FSz90KczW5XaMjxXKXKPnEU+WI0XXBTY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650969887; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=hj+dEkNlqWhPGTS1YlWUm/Kq/vBPWzD4km56q01emc8=; 
	b=BM3XT+M9a3hxMB4Bh0kBrBKyJ2A9bPQeUQQ+iMdzujGHCNr4g76Ogb7+VZ55fEnP6AgsdOvvJerDpENglM6CWy1RZOqhk8FQvuy29GToHZAiNxYhrkbGiki8LyERhQNXQWrHEo7Bv0dY1FVuJEi1VxXZ1O0X+PgqpUP2VdsPHkc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650969887;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hj+dEkNlqWhPGTS1YlWUm/Kq/vBPWzD4km56q01emc8=;
	b=ZiSNxSDhjYtBUr6RklVCOered6CAK3/x0yXnqCVrLkqV4WufoRZVqDudx3j6RBHE
	XQ1H8mRgqbJeQl2izLtnBQnBPZmlOXYw0xRFj2x3TDb4i8LcMNmYupOgCu9W8KxqFk6
	nnFm5rYrqPmQ11atfSZl+rq/02l+qSZNiBzUMLwU=
Message-ID: <7e3b375b-f5f2-588f-692f-4ccf092d6db6@apertussolutions.com>
Date: Tue, 26 Apr 2022 06:43:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220425172231.27401-1-dpsmith@apertussolutions.com>
 <20220425172231.27401-2-dpsmith@apertussolutions.com>
 <f82679b4-8b2a-ff9c-cc2c-60ba9b737de9@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <f82679b4-8b2a-ff9c-cc2c-60ba9b737de9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/26/22 02:35, Jan Beulich wrote:
> On 25.04.2022 19:22, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -621,6 +621,9 @@ static void noreturn init_done(void)
>>       void *va;
>>       unsigned long start, end;
>>   
>> +    if ( xsm_set_system_active() != 0 )
>> +        panic("xsm: unable to set hypervisor to SYSTEM_ACTIVE privilege\n");
> 
> Roger did request that the panic() either also report the error
> code, or that the function be returning bool. You did neither,
> and your earlier verbal reply also didn't really respond to this
> part of Roger's comments.

Opps, my apologies. I meant to add his suggestion of adding the error to 
the panic message.

>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -186,6 +186,26 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>       return 0;
>>   }
>>   
>> +static int cf_check flask_set_system_active(void)
>> +{
>> +    struct domain *d = current->domain;
>> +
>> +    if ( d->domain_id != DOMID_IDLE )
>> +    {
>> +        printk("xsm_set_system_active should only be called by idle domain\n");
>> +        return -EPERM;
>> +    }
>> +
>> +    /*
>> +     * While is_privileged has no significant meaning under flask, set to false
>> +     * as there are times in hypervisor code privilege checks check this
>> +     * directly instead of going through XSM.
>> +     */
> 
> It feels as if there is "which" missing between "checks" and "check",
> or something else (better fitting "as there are times"), without which
> the sentence is a little hard to follow.

You are correct, will fix.

v/r
dps

