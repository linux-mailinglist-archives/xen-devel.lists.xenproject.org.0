Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A2250A057
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310120.526767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWVj-0007mK-SO; Thu, 21 Apr 2022 13:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310120.526767; Thu, 21 Apr 2022 13:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWVj-0007jS-PX; Thu, 21 Apr 2022 13:06:15 +0000
Received: by outflank-mailman (input) for mailman id 310120;
 Thu, 21 Apr 2022 13:06:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q+Sl=U7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhWVi-0007jM-Bz
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:06:14 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd4b68f9-c173-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 15:06:07 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650546355808163.4948971852707;
 Thu, 21 Apr 2022 06:05:55 -0700 (PDT)
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
X-Inumbo-ID: cd4b68f9-c173-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1650546360; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iNR309RMOVWsH9WkQTG/IwOQEQdD978RWan+qjaSqprr2tqsdFdboxVDRp48J48uhZk03KcvOgBdpRV1epRRoew0Cl0EMVC41WppY0Ok5Te5RJmDZFDAnXAFuFfdl0kdWT4qsO50sownRahffl63R9u66Qs8NYEn/0B91npHC7s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650546360; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=3LnXM9dW4GS8TCA+EPE0xJooNdtkTKgPxEbjJ/TcOyg=; 
	b=WnuigCRO15jxKDJF8sMVJdyivSAuMVcnLlic2hxEjtManonS9eJmPTuEiWYEj79X0HSLASwFDPh63mzh27zjpmUOYJC5ZZ2Sqwh45fL0YPGE9NDtfHeco73g8lxAKkTOYk7djWA40THqr8pROKcpRWaAAXF2Zaj/fC1u/EZxK0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650546360;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3LnXM9dW4GS8TCA+EPE0xJooNdtkTKgPxEbjJ/TcOyg=;
	b=kQ8d4rpp1Ef6N+HKzNS0mV8sUMBG5mzz5vCzKGafPfEqBO5xxOmeyqzUXkUAprk2
	mcT4F93jgtsAzW6xla0Mvp8MDsROtyZ31WYtAPV4gT2IzKEP5GPc7Us2FqPhhlFG8uo
	oSNSP4nXYdlLsA8FHloB/6Rks43IE/+5e9itN/Ig=
Message-ID: <4c724c6e-c140-0b2e-6268-6db4c5958b9a@apertussolutions.com>
Date: Thu, 21 Apr 2022 09:05:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] xsm: create idle domain privieged and demote after
 setup
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
References: <20220420222834.5478-1-dpsmith@apertussolutions.com>
 <20220420222834.5478-2-dpsmith@apertussolutions.com>
 <256567d3-8d0b-83ea-c3d6-215f0a1483b6@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <256567d3-8d0b-83ea-c3d6-215f0a1483b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/21/22 05:20, Jan Beulich wrote:
> On 21.04.2022 00:28, Daniel P. Smith wrote:
>> There are now instances where internal hypervisor logic needs to make resource
>> allocation calls that are protectd by XSM checks. The internal hypervisor logic
>> is represented a number of system domains which by designed are represented by
>> non-privileged struct domain instances. To enable these logic blocks to
>> function correctly but in a controlled manner, this commit changes the idle
>> domain to be created as a privileged domain under the default policy, which is
>> inherited by the SILO policy, and demoted before transitioning to running. A
>> new XSM hook, xsm_transition_running, is introduced to allow each XSM policy
>> type to demote the idle domain appropriately for that policy type.
>>
>> For flask a stub is added to ensure that flask policy system will function
>> correctly with this patch until flask is extended with support for starting the
>> idle domain privileged and properly demoting it on the call to
>> xsm_transtion_running.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Looks okay to me, but I'm not sure in how far agreement was reached on
> taking this route. Just one nit:

Thank you. As for the approach, Jason suggested it and Roger stated that
if this approach was adopted it would resolve his concerns over __init.
If you have a concern with this approach, please let me know so I can
ensure it is addressed to the best of my ability.

>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -101,6 +101,18 @@ static always_inline int xsm_default_action(
>>      }
>>  }
>>  
>> +static XSM_INLINE void cf_check xsm_transition_running(void)
>> +{
>> +    struct domain *d = current->domain;
>> +
>> +    if ( d->domain_id != DOMID_IDLE )
>> +        panic("xsm_transition_running should only be called by idle domain\n");
>> +
>> +    d->is_privileged = false;
>> +
>> +    return;
>> +}
> 
> Please omit such return statements.

Ack.

v/r,
dps

