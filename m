Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4264947BF3E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 13:02:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250351.431225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdpy-0006co-3s; Tue, 21 Dec 2021 12:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250351.431225; Tue, 21 Dec 2021 12:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdpy-0006az-0b; Tue, 21 Dec 2021 12:01:46 +0000
Received: by outflank-mailman (input) for mailman id 250351;
 Tue, 21 Dec 2021 12:01:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mzdpw-0006Z5-Ix
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 12:01:44 +0000
Received: from sender4-of-o55.zoho.com (sender4-of-o55.zoho.com
 [136.143.188.55]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c20facec-6255-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 13:01:43 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1640088096810568.6883649733682;
 Tue, 21 Dec 2021 04:01:36 -0800 (PST)
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
X-Inumbo-ID: c20facec-6255-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1640088099; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hguY7AcVJz1olFi6Awsbb5TzsIF8hgaEdLjhntGKv1NRhtTnAhaaePtO9qBfUk9CACbme/OY/KGKfYKkB5QBJjF80d4lLmYjEt2xZcZtTv3DTR5rMlo3thX9jbsQm9vrG5MWIjOdqgUOGqMpN5gUI4K2jF5MFZtEGdMc/IvS4qE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1640088099; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5R9QaYyJhgWtfIVhR6d2ZethYKNjWG6uSGh12D7jGy8=; 
	b=NfGri9rrHaqRZQH1Z3YW1Y6tUVyFlL51sQmj7EPepkTQagOpFxiRcuceidT+k8DNLRXG6DcX/H+F0Sk2fNM8a9hSzLVJc7P+oaVav8i142rs5CJkQ+PYgt4PH/L3STMc6ZARx8vdKulJaf2kcm/nV+zUz4ZsYW7hW2gQIlMOPvc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1640088099;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5R9QaYyJhgWtfIVhR6d2ZethYKNjWG6uSGh12D7jGy8=;
	b=ayM3nu1yof76aI+HxZrXEgsFzi0HjbcIVSYIlJz/XCxOGzluP7YxSWM6Y3W722+W
	kx4LR7xNW20eFunEPi3zGJEUXBUjemNw6DLy4MOCZKsKnNBUit32HRBd8MYfZKdzvrg
	2e8Hz8qOrm1LR4slO80e3FhQWoyIi/6rtwGuIiYU=
Subject: Re: [PATCH v3] is_system_domain: replace open-coded instances
To: Jan Beulich <jbeulich@suse.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20211220162853.10603-1-dpsmith@apertussolutions.com>
 <cb60f20a-a75f-3b81-e528-7643d47996aa@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <4ff2eeb9-dca7-dd06-66be-faacc7cdde6c@apertussolutions.com>
Date: Tue, 21 Dec 2021 07:01:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cb60f20a-a75f-3b81-e528-7643d47996aa@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/21/21 4:20 AM, Jan Beulich wrote:
> On 20.12.2021 17:28, Daniel P. Smith wrote:
>> From: Christopher Clark <christopher.w.clark@gmail.com>
>>
>> This is a split out of the hyperlaunch dom0 series.
>>
>> There were several instances of open-coded domid range checking. This commit
>> replaces those with the is_system_domain or is_system_domid inline function.
>>
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Acked-by: Dario Faggioli <dfaggioli@suse.com>
> 
> While I'm not outright opposed, I'd still like to raise the question whether
> we really want to intermix "is system domain" and "is in-range domain ID"
> predicates. Personally I'd prefer the latter to remain open-coded range
> checks.
> 
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -613,9 +613,14 @@ extern struct vcpu *idle_vcpu[NR_CPUS];
>>   #define is_idle_domain(d) ((d)->domain_id == DOMID_IDLE)
>>   #define is_idle_vcpu(v)   (is_idle_domain((v)->domain))
>>   
>> +static inline bool is_system_domid(domid_t id)
>> +{
>> +    return (id >= DOMID_FIRST_RESERVED);
> 
> Nit: Generally we omit parentheses in cases like this, ...

ack

>> +}
>> +
>>   static inline bool is_system_domain(const struct domain *d)
>>   {
>> -    return d->domain_id >= DOMID_FIRST_RESERVED;
> 
> ... just like was the case here.
> 
> Jan
> 

