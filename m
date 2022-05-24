Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD5532FC7
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 19:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336698.561079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntYZz-0003lm-VK; Tue, 24 May 2022 17:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336698.561079; Tue, 24 May 2022 17:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntYZz-0003k0-SS; Tue, 24 May 2022 17:44:23 +0000
Received: by outflank-mailman (input) for mailman id 336698;
 Tue, 24 May 2022 17:44:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c9/=WA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ntYZy-0003ju-M5
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 17:44:22 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22eecb57-db89-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 19:44:20 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653414252524943.2521548260714;
 Tue, 24 May 2022 10:44:12 -0700 (PDT)
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
X-Inumbo-ID: 22eecb57-db89-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1653414256; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KD/HqGqVuGRB1Z+b176S8SwEsv+fXrLemoXHGCNvOgDb9uwqk/IenNgWsbnyzF7tmHjwxa78W2ivRY4dlQcOYkYTlfr67/spdYWPdwqJ90ZFJlVdY/z9iPFBwH3DglkoJQDRkTMmDNVPJdLOkIdLTiX22FIUa6Wb6myXCoUi8Dw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653414256; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=bKjqYZonshurFqMRr3m4RylHY46Cv2/mFfaws+RMeUo=; 
	b=nKrlLNDKN3oUdMssfOAy23BWQYvicReuFcWEs5DBH1kAC+gWsLUW/hsPNiHlFCkk0EGYxL4X2kjYgWBGy6oiFB4h5N8vWYiw9lBU2y+QXbfciqT/BImuUvGWXn8kh1NoeSves6dJiKMke7LPj/n8eybEbmbincJ2Aq73zgAyqCs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653414256;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bKjqYZonshurFqMRr3m4RylHY46Cv2/mFfaws+RMeUo=;
	b=esOuY+97MJiIdnmTOJxJOWuFBj/SHTr5nsmZTgmGbW8NO+s8iRRyNlreuL43TCeV
	j7oPJo9EqR2LggcjQLIouDCMTUdSc5jm9NlKglexpcjo3XiHC2yDcwF/Yf3K3P8IsLS
	yIHDrG75wEsPKm1O7DXIC3D4RFMPusI4uI4yg1qE=
Message-ID: <db5c23cc-074f-2c7f-8033-a4b6aaf8443e@apertussolutions.com>
Date: Tue, 24 May 2022 13:42:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220523154024.1947-1-dpsmith@apertussolutions.com>
 <dc50678e-0a35-e3a2-110b-9b5ba7f7364b@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xsm: refactor and optimize policy loading
In-Reply-To: <dc50678e-0a35-e3a2-110b-9b5ba7f7364b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 5/24/22 11:50, Jan Beulich wrote:
> On 23.05.2022 17:40, Daniel P. Smith wrote:
>> --- a/xen/xsm/xsm_core.c
>> +++ b/xen/xsm/xsm_core.c
>> @@ -55,19 +55,35 @@ static enum xsm_bootparam __initdata xsm_bootparam =
>>      XSM_BOOTPARAM_DUMMY;
>>  #endif
>>  
>> +static bool __initdata init_policy =
>> +#ifdef CONFIG_XSM_FLASK_DEFAULT
>> +    true;
>> +#else
>> +    false;
>> +#endif
> 
> Simply IS_ENABLED(CONFIG_XSM_FLASK_DEFAULT) without any #ifdef-ary?

Ack, didn't even think of that. Thanks!

>> @@ -148,11 +156,11 @@ int __init xsm_multiboot_init(
>>  
>>      printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
>>  
>> -    if ( XSM_MAGIC )
>> +    if ( init_policy && XSM_MAGIC )
>>      {
>>          ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
>>                                          &policy_size);
>> -        if ( ret )
>> +        if ( ret != 0 )
> 
> Nit: Stray change?

Yep, I twiddled with the if statement while testing/debugging all the
permutations of enabled policies, default policy, built-in policy, and
cmdline selected policy. Will clean up.

>> @@ -36,10 +36,17 @@ int __init xsm_multiboot_policy_init(
>>  {
>>      int i;
>>      module_t *mod = (module_t *)__va(mbi->mods_addr);
>> -    int rc = 0;
>> +    int rc = -ENOENT;
> 
> I'm afraid I can't easily convince myself that this and the other
> -ENOENT is really relevant to this change and/or not breaking
> anything which currently does work (i.e. not entirely benign).
> Please can you extend the description accordingly or split off
> this adjustment?

Let me expand the commit explanation, and you can let me know how much
of this detail you would like to see in the commit message.

When enabling CONFIG_XSM_FLASK today, the XSM_MAGIC variable becomes
defined as a non-zero value. This results in xsm_XXXX_policy_init() to
be called regardless of the XSM policy selection, either through the
respective CONFIG_XSM_XXXXX_DEFAULT flags or through the cmdline
parameter. Additionally, the concept of policy initialization is split
between xsm_XXXX_policy_init() and xsm_core_init(), with the latter
being where the built-in policy would be selected. This forces
xsm_XXXX_policy_init() to have to return successful for configurations
where no policy loading was necessary. It also means that the situation
where selecting XSM flask, with no built-in policy, and failure to
provide a policy via MB/DT relies on the security server to fault when
it is unable to load a policy.

What this commit does is moves all policy buffer initialization to
xsm_XXXX_policy_init(). As the init function, it should only return
success (0) if it was able to initialize the policy buffer with either
the built-in policy or a policy loaded from MB/DT. The second half of
this commit corrects the logical flow so that the policy buffer
initialization only occurs for XSM policy modules that consume a policy
buffer, e.g. flask.

I would note the opening of the commit message notes dom0less and
hyperlaunch because I came across this while finalizing the first
hyperlaunch patch series focused on fully integrating hyperlaunch's
bootmodule structure, which will also will enable commonality with
dom0less' bootmodule structure, into x86 MB1/MB2/EFI startup paths. I
figured this change should just go alone and not with hyperlaunch
bootmodule work.

>> @@ -79,7 +87,16 @@ int __init xsm_dt_policy_init(void **policy_buffer, size_t *policy_size)
>>      paddr_t paddr, len;
>>  
>>      if ( !mod || !mod->size )
>> +#ifdef CONFIG_XSM_FLASK_POLICY
>> +    {
>> +        *policy_buffer = (void *)xsm_flask_init_policy;
> 
> I don't think we want a cast here, especially not when it discards
> "const". Instead the local variables' types want adjusting in
> xsm_{multiboot,dt}_init() as well as the types of the respective
> parameters of xsm_{multiboot,dt}_policy_init().

True, will fix.

>> +        *policy_size = xsm_flask_init_policy_size;
>>          return 0;
>> +    }
>> +#else
>> +        /* No policy was loaded */
>> +        return -ENOENT;
>> +#endif
> 
> I think this is easier to read if you put the braces there
> unconditionally and have the #if / #else inside. And if you wanted
> to I think you could get away without any #else then.

Ack.


v/r,
dps

