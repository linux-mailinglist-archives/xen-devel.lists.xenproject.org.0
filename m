Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1BD76EA8F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 15:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576381.902444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYSW-0004T8-Dy; Thu, 03 Aug 2023 13:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576381.902444; Thu, 03 Aug 2023 13:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRYSW-0004Qo-BG; Thu, 03 Aug 2023 13:33:44 +0000
Received: by outflank-mailman (input) for mailman id 576381;
 Thu, 03 Aug 2023 13:33:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRYSV-0004Qi-Eu
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 13:33:43 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b9c3325-3202-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 15:33:41 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691069615584770.6636556301372;
 Thu, 3 Aug 2023 06:33:35 -0700 (PDT)
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
X-Inumbo-ID: 5b9c3325-3202-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691069617; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a3h63MK2gqqr7HV5WiKivaBYU2qc1JH8mSkkMRa3GGxpAJrc3mDSJLRWCNLMhu4aDvLIVQZnd09ViDGkdrxurtq4PeZUdgHRmfpcyNk87NvJmLm/2gWz0Ocsa8Lnndw364Qez1mHeP6bysOBTWJpZkC6oTv6w2H/vvcytFKsJAA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691069617; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Ah/XQd/hZBpE0Stgw+77JLFwk+CLLIchBNGJVpobHsw=; 
	b=SA70azil8tnYy79SvP1wvrnL962CXEFnroSL3gVu2Jv0GpMwq+srw7uMZsSttFIh3G8d82Ne7kPc0rahaB3Xcuo5CCRD5JmKHGPW0lnKHUtJxNnAFrt0XGJVfNZCL7liWzV6DiR8Y5032OYjO4Tg/yHLIgLVM6jYb9pbKnddLtc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691069617;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ah/XQd/hZBpE0Stgw+77JLFwk+CLLIchBNGJVpobHsw=;
	b=akadWhX6dWJWP+gGzIgjQG/IWLjfTS3QsqISmCJZQAblUybAsFAKx6QmdWVs03qC
	NBAoqxg2sJOlsNVh55S2JjjraT/dD7DkE1Varmgu11VdaS85k5fw4Y9QHkR/1f9d0Xb
	cLLnz20jp0UDVG2gfDbvGCbnF7/k/GWmf10k6vh0=
Message-ID: <97319344-02d2-4fa4-9325-fbcd74364bdf@apertussolutions.com>
Date: Thu, 3 Aug 2023 09:33:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 1/6] dom0: replace explict zero checks
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-2-dpsmith@apertussolutions.com>
 <fa9799bf-1a74-48a8-f4f4-3d2c563f0b13@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <fa9799bf-1a74-48a8-f4f4-3d2c563f0b13@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/2/23 03:46, Jan Beulich wrote:
> On 01.08.2023 22:20, Daniel P. Smith wrote:
>> A legacy concept is that the initial domain will have a domain id of zero. As a
>> result there are places where a check that a domain is the inital domain is
>> determined by an explicit check that the domid is zero.
> 
> It might help if you at least outlined here why/how this is going to
> change.

Okay, I will try expanding on this further.

>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1058,6 +1058,13 @@ void scheduler_disable(void);
>>   void watchdog_domain_init(struct domain *d);
>>   void watchdog_domain_destroy(struct domain *d);
>>   
>> +static always_inline bool is_initial_domain(const struct domain *d)
>> +{
>> +    static int init_domain_id = 0;
> 
> This may then also help with the question on why you use a static
> variable here. (In any event the type of this variable wants to
> be correct; plain int isn't appropriate ...

Ah, so this is a dated patch that I brought because of the abstraction 
it made. The intent in the original series for making it static was in 
preparation to handle the shim case where init_domid() would have return 
a non-zero value.

So the static can be dropped and changed to domid_t.

>> +    return d->domain_id == init_domain_id;
> 
> ... for this comparison.)
> 
> Jan

v/r,
dps

