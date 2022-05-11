Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC614523128
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 13:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326716.549323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokC6-0002Kn-AR; Wed, 11 May 2022 11:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326716.549323; Wed, 11 May 2022 11:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokC6-0002IG-7D; Wed, 11 May 2022 11:07:50 +0000
Received: by outflank-mailman (input) for mailman id 326716;
 Wed, 11 May 2022 11:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ssr4=VT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nokC4-0001xN-Mp
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 11:07:48 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 966c78c3-d11a-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 13:07:47 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1652267264218728.9005047314162;
 Wed, 11 May 2022 04:07:44 -0700 (PDT)
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
X-Inumbo-ID: 966c78c3-d11a-11ec-8fc4-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1652267264; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XyRQxaxojTZftLCvZG6n6s99YKtoyQ44iuFeMdJxJ6OZBdLVY/ACAOqOnquIjWVe2EQq/zbrApzsXUKa+aYjVAfXz5QI+yjedlImgqfEn75GyzCm2yepjcaQgO3j8j2R6px3QDw3WQLGGaHGo/K5qSRgQvi/cSlL5IgcETYrSFo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1652267264; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LPaxX1CGyojY5W90ga7NL/xUA5jg2+WGSMaT9mSNbuU=; 
	b=Zc1CIXH2tWUCvntkrsRO/byyOrDNX59iCRwIcXfJjxB9HrB4XKkH/tksxpCX3KWY4v8N/52eKZPGjL8wRGW3EYq+FWeSPBOz+oZDuGzff/K5CcXOnyjszkAGGaBsmc90lIqmu5swx2X0gc902PNZUu5AL15GF/51rWN89pQehVQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1652267264;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LPaxX1CGyojY5W90ga7NL/xUA5jg2+WGSMaT9mSNbuU=;
	b=hzPV8VFHAtrnAnMEP2eC5GnzDRhK/QrK066uFmFlgBW9VNucqSRDO6g72egwxvgS
	4seY5kWHWF1n8s/KPTu2pcHXM/KcXHPBZRScJBbM/NSy+MMH+w5cnXbFWgUcNsfm+cc
	5s7LvZ8tQ191oqOzVsGVHFXNvhUIqFYS6VPg9vkE=
Message-ID: <ec7e2b3b-c756-ad6b-1b8d-79beb0f2339a@apertussolutions.com>
Date: Wed, 11 May 2022 07:06:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220503111731.12642-1-dpsmith@apertussolutions.com>
 <20220503111731.12642-2-dpsmith@apertussolutions.com>
 <abad832f-9007-d056-f280-c7463d80eed3@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <abad832f-9007-d056-f280-c7463d80eed3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/9/22 14:38, Julien Grall wrote:
> Hi Daniel,
> 
> On 03/05/2022 12:17, Daniel P. Smith wrote:
>> There are new capabilities, dom0less and hyperlaunch, that introduce
>> internal
>> hypervisor logic which needs to make resource allocation calls that are
>> protected by XSM access checks. This creates an issue as a subset of the
>> hypervisor code is executed under a system domain, the idle domain,
>> that is
>> represented by a per-CPU non-privileged struct domain. To enable these
>> new
>> capabilities to function correctly but in a controlled manner, this
>> commit
>> changes the idle system domain to be created as a privileged domain
>> under the
>> default policy and demoted before transitioning to running. A new XSM
>> hook,
>> xsm_set_system_active(), is introduced to allow each XSM policy type
>> to demote
>> the idle domain appropriately for that policy type. In the case of
>> SILO, it
>> inherits the default policy's hook for xsm_set_system_active().
>>
>> For flask a stub is added to ensure that flask policy system will
>> function
>> correctly with this patch until flask is extended with support for
>> starting the
>> idle domain privileged and properly demoting it on the call to
>> xsm_set_system_active().
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>> ---
>>   xen/arch/arm/setup.c    |  4 ++++
>>   xen/arch/x86/setup.c    |  5 +++++
>>   xen/common/sched/core.c |  7 ++++++-
>>   xen/include/xsm/dummy.h | 17 +++++++++++++++++
>>   xen/include/xsm/xsm.h   |  6 ++++++
>>   xen/xsm/dummy.c         |  1 +
>>   xen/xsm/flask/hooks.c   | 23 +++++++++++++++++++++++
>>   7 files changed, 62 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index d5d0792ed4..39a654926d 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -1048,6 +1048,10 @@ void __init start_xen(unsigned long
>> boot_phys_offset,
>>       /* Hide UART from DOM0 if we're using it */
>>       serial_endboot();
>>   +    if ( (rc = xsm_set_system_active()) != 0 )
>> +        panic("xsm(err=%d): "
>> +              "unable to set hypervisor to SYSTEM_ACTIVE
>> privilege\n", rc);
> 
> We usually don't split error message over multiple lines (even if they
> are over 80 characters).
> 
>> +
>>       system_state = SYS_STATE_active;
>>         for_each_domain( d )
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 6f20e17892..36a60ce884 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -620,6 +620,11 @@ static void noreturn init_done(void)
>>   {
>>       void *va;
>>       unsigned long start, end;
>> +    int err;
>> +
>> +    if ( (err = xsm_set_system_active()) != 0 )
>> +        panic("xsm(err=%d): "
>> +              "unable to set hypervisor to SYSTEM_ACTIVE
>> privilege\n", err);
> 
> Same here.
> 
> Other than the two remarks above and Luca's one:
> 
> Acked-by: Julien Grall <jgrall@amazon.com> # arm

Ack.

v/r,
dps

