Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621FE50906A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 21:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309584.525939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhFwj-0006Av-EO; Wed, 20 Apr 2022 19:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309584.525939; Wed, 20 Apr 2022 19:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhFwj-000695-B9; Wed, 20 Apr 2022 19:25:01 +0000
Received: by outflank-mailman (input) for mailman id 309584;
 Wed, 20 Apr 2022 19:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUyO=U6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhFwi-00068z-9C
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 19:25:00 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fd88f6f-c0df-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 21:24:58 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650482690355130.23016543154029;
 Wed, 20 Apr 2022 12:24:50 -0700 (PDT)
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
X-Inumbo-ID: 8fd88f6f-c0df-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1650482695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d5kjXM+mKe8SzoC8+M0Pbv6kd4pJLHxSA2vkvklr7zTL3N/ypEPQ5ga8S2B+uJgQU1jwPISwgNAjJnU2nC7nv82nIoaEydHyGkM094cnCjlHmxaSZJqtS2B/BEcRBDgM4G8D3BEPkV+IoT+Pyo0Vfp8pmRaLzc22P9r/Ud8xDTo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650482695; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qm5h+xagSlEf0EKTM4q1nqnzY1FHMzwJBGqOx/exje8=; 
	b=iyEUDWm3hLfMZ27whdaUqfnXZ5JL0ufBIEkYqCdxTNps1VwA402Z2GUJ2KNP+i+Lt2KVf3Um+Keg5w7s+6PD4r4iBC3oW5NXeGwcFnBYu/UXMKesAYW3KEIaMTzrsIUxYJ6efUFPeLM+3da5CNXR+LMhfVnoL7F83v8YGSzNB+c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650482695;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qm5h+xagSlEf0EKTM4q1nqnzY1FHMzwJBGqOx/exje8=;
	b=O0qEqlpTYHwQRR1w8vLflv6vK4Ld8IujZijT0z71azJGIaMHfum1sDsWpifFKz5s
	q4gNDOB22aUAriUVMuk5ob2s4GjVbiTCeHchWMAXSD82tB2uQldbow1aqBTOzjH5ofP
	DECQ7j0dI2OQ88ULmO2Ah0mEeIQua3JuOmXsjwWA=
Message-ID: <2531185f-591a-a9a0-9f0d-2f358ce3afe3@apertussolutions.com>
Date: Wed, 20 Apr 2022 15:24:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] xsm: create idle domain privieged and demote after
 setup
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Scott Davis <scott.davis@starlab.io>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220420210407.18060-1-dpsmith@apertussolutions.com>
 <20220420210407.18060-2-dpsmith@apertussolutions.com>
 <CAKf6xpsr_0m=tWMjVQsufxSJ52kz3QFzMJvVa0MEKLrtrVM9TQ@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <CAKf6xpsr_0m=tWMjVQsufxSJ52kz3QFzMJvVa0MEKLrtrVM9TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/20/22 14:31, Jason Andryuk wrote:
> On Wed, Apr 20, 2022 at 1:02 PM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
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
>> ---
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 6f20e17892..72695dcb07 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -621,6 +621,12 @@ static void noreturn init_done(void)
>>      void *va;
>>      unsigned long start, end;
>>
>> +    xsm_transition_running();
>> +
>> +    /* Ensure idle domain was not left privileged */
>> +    if ( current->domain->is_privileged )
>> +        panic("idle domain did not properly transition from setup privilege\n");
> 
> Checking immediately after the XSM hook seems redundant, though I
> guess having a sanity check isn't harmful.

I was back and forth on this, so I threw it in and figured if there was
strong opinions against it I could easily remove and respin the series.

>>  static void cf_check flask_domain_free_security(struct domain *d)
>>  {
>>      struct domain_security_struct *dsec = d->ssid;
>> @@ -1766,6 +1780,7 @@ static int cf_check flask_argo_send(
>>  #endif
>>
>>  static const struct xsm_ops __initconst_cf_clobber flask_ops = {
>> +    .transition_running = flask_domain_runtime_security,
> 
> I'd prefer flask_transition_running.  That way grep for the hook name
> also finds the flask implementation.

Sure.

v/r,
dps

