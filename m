Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D8402A15
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181062.328038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbQn-0005Fu-GC; Tue, 07 Sep 2021 13:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181062.328038; Tue, 07 Sep 2021 13:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbQn-0005CV-CV; Tue, 07 Sep 2021 13:46:33 +0000
Received: by outflank-mailman (input) for mailman id 181062;
 Tue, 07 Sep 2021 13:46:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTX3=N5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mNbQl-0005CP-Ej
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:46:31 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0136ce42-0fe2-11ec-b0f3-12813bfff9fa;
 Tue, 07 Sep 2021 13:46:30 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631022384849480.93473938892373;
 Tue, 7 Sep 2021 06:46:24 -0700 (PDT)
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
X-Inumbo-ID: 0136ce42-0fe2-11ec-b0f3-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631022387; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RXKB9dUWNPWkgmcdISqdTGb0F5yGEg6QznZcElAc8HE42k1NyujAz5oBU6OovQgwQHARHCz1ofQqU+IDSGJDUR9L90zXX/zhh3GHuBjkJv4Z5ujZbcbiSl3LAxcPuM/FcJAwgpCEYaelGBInQUJ7x+B0BuF5XtfZGQO+h2T25gc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631022387; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Eg118G40UsDAktVHH5I+xA97QrEkwUrl+xfBDFWQE6I=; 
	b=Z/GnHDIBMRsR+uzsWuAQhp7XNaMctaRpx2vpKOX0lPC4/w6lDla52HKkeR2kmJnQ4STfc0m9DaRxFOLhRUVNx9abrfflmwIEa6fBbQvZrKyxW8xVSpsKG1CF59Z1K2fdVJ89wf5WIC+CbhDN6XbjY1U/dLrrZ4Pz2UO2rLQaclM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631022387;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Eg118G40UsDAktVHH5I+xA97QrEkwUrl+xfBDFWQE6I=;
	b=YwBx7uc3aQS5R3OnGe61qLhP5pMEjDZFNJN1vPoWD321v0l/dqoUZI94l0Ppnkvi
	B9yGK94uo3rzfafP3yR33cMU2tRnOLIbM2Eyf68n7Az4lx3HqmoGmttzAzXjcspBpQv
	brPwbd4MwL5SqFT6C34EZKzKoQuBBkWPSVIYsLRE=
Subject: Re: [PATCH v4 05/11] xsm: refactor xsm_ops handling
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-6-dpsmith@apertussolutions.com>
 <6924c3ea-de14-60e5-d3dc-eaff6c228f1c@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <b5a2ff19-b7f5-cf2e-4c37-1663c69727c3@apertussolutions.com>
Date: Tue, 7 Sep 2021 09:44:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6924c3ea-de14-60e5-d3dc-eaff6c228f1c@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 9/6/21 2:31 PM, Andrew Cooper wrote:
> On 03/09/2021 20:06, Daniel P. Smith wrote:
>> This renames the `struct xsm_operations` to the shorter `struct xsm_ops` and
>> converts the global xsm_ops from being a pointer to an explicit instance. As
>> part of this conversion, it reworks the XSM modules init function to return
>> their xsm_ops struct which is copied in to the global xsm_ops instance.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> However, some suggestions...
> 
>> diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
>> index 55483292c5..859af3fe9a 100644
>> --- a/xen/xsm/xsm_core.c
>> +++ b/xen/xsm/xsm_core.c
>> @@ -28,9 +28,17 @@
>>   #include <asm/setup.h>
>>   #endif
>>   
>> -#define XSM_FRAMEWORK_VERSION    "1.0.0"
>> +#define XSM_FRAMEWORK_VERSION    "1.0.1"
>>   
>> -struct xsm_operations *xsm_ops;
>> +struct xsm_ops __read_mostly xsm_ops;
>> +
>> +enum xsm_ops_state {
>> +    XSM_OPS_UNREGISTERED,
>> +    XSM_OPS_REG_FAILED,
>> +    XSM_OPS_REGISTERED,
>> +};
>> +
>> +static enum xsm_ops_state xsm_ops_registered = XSM_OPS_UNREGISTERED;
> 
> __read_mostly, or can this be __initdata ?

Apologies, I think you may have suggested this before. It would be good 
to be able to check this later but currently since I just introduced 
this and it is only used during init, it could be made __initdata for 
now and later if it gets exposed, then it can be moved to __read_mostly.

Do you agree?

>> @@ -87,25 +88,35 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>>       }
>>   #endif
>>   
>> -    if ( verify(&dummy_xsm_ops) )
>> +    if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
>>       {
>> -        printk(XENLOG_ERR "Could not verify dummy_xsm_ops structure\n");
>> +        printk(XENLOG_ERR
>> +               "Could not init XSM, xsm_ops register already attempted\n");
>>           return -EIO;
>>       }
>>   
>> -    xsm_ops = &dummy_xsm_ops;
>> -
>>       switch ( xsm_bootparam )
>>       {
>>       case XSM_BOOTPARAM_DUMMY:
>> +        xsm_ops_registered = XSM_OPS_REGISTERED;
>>           break;
>>   
>>       case XSM_BOOTPARAM_FLASK:
>> -        flask_init(policy_buffer, policy_size);
>> +        ops = flask_init(policy_buffer, policy_size);
>> +        if ( ops )
>> +        {
>> +            xsm_ops_registered = XSM_OPS_REGISTERED;
>> +            xsm_ops = *ops;
>> +        }
>>           break;
>>   
>>       case XSM_BOOTPARAM_SILO:
>> -        silo_init();
>> +        ops = silo_init();
>> +        if ( ops )
>> +        {
>> +            xsm_ops_registered = XSM_OPS_REGISTERED;
>> +            xsm_ops = *ops;
>> +        }
> 
> This if ( ops ) block can be deduplicated by moving after the switch()
> statement.  It's going to be common to all everything except dummy.

Good call. I will rework to remove the duplication.

v/r,
dps


