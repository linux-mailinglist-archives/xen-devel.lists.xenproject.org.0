Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73344CBD2B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283237.482201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPk3Z-00033E-Fm; Thu, 03 Mar 2022 11:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283237.482201; Thu, 03 Mar 2022 11:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPk3Z-00030t-BP; Thu, 03 Mar 2022 11:55:41 +0000
Received: by outflank-mailman (input) for mailman id 283237;
 Thu, 03 Mar 2022 11:55:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GC2d=TO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nPk3Y-00030n-Eh
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:55:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6e3779f-9ae8-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 12:55:39 +0100 (CET)
Received: from [10.10.1.173] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1646308527088435.7162000303083;
 Thu, 3 Mar 2022 03:55:27 -0800 (PST)
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
X-Inumbo-ID: d6e3779f-9ae8-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; t=1646308529; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KvTp8J00kbQhYuQvGlE1Z/ZfM3uLZ6EYX3PsRr1XNWWGOF8X2HKMsF30tOZD+EcMMJAIEH3NVub+j1vMrYiLJtF2O2u3E9bu1F0lYXKjZCZZf/Q8X+hpMoyG/dxctYlXAg9VJIF7wEwqJIDKy5IOZI/p/SxXWUG1anBNJ9OvF4A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1646308529; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=bVxTogiblHHgRMkjL1zPZ9Zsmo3Slz+NqJrINZH0Htk=; 
	b=d5V0zzAhF5CVq/SOxesbFsla1myUXTbShtxZsLpPq7TJI18gQlUp1e3GbVNkkuuWYABhnfpKai097FSghOb+QYM0SOGZsvFCxih48p8mlGIAekCrytZy2cYd12zGIoNfO3J7G1eiIQQfjt5lIxdcim59AC97eG2S3IvQfrUXm5o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646308529;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bVxTogiblHHgRMkjL1zPZ9Zsmo3Slz+NqJrINZH0Htk=;
	b=lMKupOMw7wCs7nW/P+4CxybmNVcDCkYSop2KXrRrYDInpetmZ+Q2PdP5kZaZPmyS
	iLhoXChAYBtBwlnP12EiJD8pb4QGVDIoSBlE1WuXXBSeNQF2CLzOJGv38zXJ9s/i6vw
	N4ROmh2Jrdv85DBGspdlRqLoecl7sHfAmHxqbzzE=
Message-ID: <6388c214-58e9-ed2e-1447-2781d7a9ba99@apertussolutions.com>
Date: Thu, 3 Mar 2022 06:54:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] x86/tboot: adjust Kconfig default
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 =?UTF-8?B?xYF1a2FzeiBIYXdyecWCa28=?= <lukasz@hawrylko.pl>
References: <fae0a082-8b39-9bd1-0ed3-35a660d704e8@suse.com>
 <18472660-3438-5c77-05c6-148b97bf4725@apertussolutions.com>
In-Reply-To: <18472660-3438-5c77-05c6-148b97bf4725@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Jan,

FYI, I just noticed that Lukasz old intel email was used for this patch. 
I assume your tree just hasn't picked up the patch with his new email 
address. Copying him now so he can see your patch.

v/r,
dps

On 3/3/22 06:50, Daniel P. Smith wrote:
> On 3/3/22 04:49, Jan Beulich wrote:
>> We shouldn't include unsupported code by default, with not even a means
>> for its building to be disabled. Convert the dependency from merely
>> affecting the prompt's visibility to a real one.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> We could of course go further and make the default also account for
>> DEBUG, as is done elsewhere.
> 
> As in you would like to adjust the default based on whether DEBUG is on 
> or not? I guess my question is what motivation is there to adjust this 
> selection if DEBUG is enabled or disabled?
> 
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -193,14 +193,15 @@ config HVM_FEP
>>         If unsure, say N.
>>   config TBOOT
>> -    bool "Xen tboot support (UNSUPPORTED)" if UNSUPPORTED
>> -    default y if !PV_SHIM_EXCLUSIVE
>> +    bool "Xen tboot support (UNSUPPORTED)"
>> +    depends on UNSUPPORTED
>> +    default !PV_SHIM_EXCLUSIVE
>>       select CRYPTO
>>       ---help---
>>         Allows support for Trusted Boot using the Intel(R) Trusted 
>> Execution
>>         Technology (TXT)
>> -      If unsure, say Y.
>> +      If unsure, stay with the default.
>>   choice
>>       prompt "Alignment of Xen image"
>>
> 
> Outside of the debug question, I think the proposed change is good.
> 
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.cm>

