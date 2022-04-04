Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D444F1882
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 17:34:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298427.508389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOiZ-00028h-4b; Mon, 04 Apr 2022 15:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298427.508389; Mon, 04 Apr 2022 15:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOiZ-00026J-1H; Mon, 04 Apr 2022 15:34:11 +0000
Received: by outflank-mailman (input) for mailman id 298427;
 Mon, 04 Apr 2022 15:34:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIUK=UO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nbOiX-000266-QS
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 15:34:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa43cf66-b42c-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 17:34:08 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1649086442843171.49328994365192;
 Mon, 4 Apr 2022 08:34:02 -0700 (PDT)
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
X-Inumbo-ID: aa43cf66-b42c-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1649086445; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kP4vKLZjJ5lI3hBIVQOcfUmZ3gwa1GhmaF3tsT9rZfYtf/lNiLAKyQudsYY3K5fnVsNYnz8T1xny8WaQNwyrE1cceiTUB9VVcM0QY0oQIdhvdqdxjeC6pH3qEp89rQCtfIu05i/2NtV/J0OiR6nrScsBxvi6y6UrETspdH0cr4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1649086445; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=z68Pz6YjM5Izd3TJBqligv4+KvIJtZL2RvBOHHjTufM=; 
	b=E9C6gZkTdv1UkaD5ysmnFUhyNfcFVYzBsnNXeDuG9kQNpnnBGFXrwuK5HMSWCk8Ov1imXe0RHuE+hzqZjdSrFk/nmGKAWO1tFV742Do16H9ofSPVxFEFow2T03XkW1ASKHMr7Nkk95+rrTfuoO9MWtyrP2UVsMKazUT/ak8o+aA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649086445;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=z68Pz6YjM5Izd3TJBqligv4+KvIJtZL2RvBOHHjTufM=;
	b=ksoIyu9lYjQYyB9apHAa7YDk/BUtlTFIiV85XwYZIspsSa7wxvTDPmZdVQ1WKOjW
	q3Lipm8fhYJIdQI93USbXnOfGtjyA3MlE1Cqg6KvZNGDX6hn7eye1XpLCxJpWDXq7Ey
	JCPhPS8SsXXFdJuA9EjPSkPcI4OQdTvcfDFGnvQU=
Message-ID: <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
Date: Mon, 4 Apr 2022 11:33:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Scott Davis <scott.davis@starlab.io>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
In-Reply-To: <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/31/22 09:16, Jason Andryuk wrote:
> On Wed, Mar 30, 2022 at 3:05 PM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> There are now instances where internal hypervisor logic needs to make resource
>> allocation calls that are protected by XSM checks. The internal hypervisor logic
>> is represented a number of system domains which by designed are represented by
>> non-privileged struct domain instances. To enable these logic blocks to
>> function correctly but in a controlled manner, this commit introduces a pair
>> of privilege escalation and demotion functions that will make a system domain
>> privileged and then remove that privilege.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>  xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index e22d6160b5..157e57151e 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -189,6 +189,28 @@ struct xsm_operations {
>>  #endif
>>  };
>>
>> +static always_inline int xsm_elevate_priv(struct domain *d)
>> +{
>> +    if ( is_system_domain(d) )
>> +    {
>> +        d->is_privileged = true;
>> +        return 0;
>> +    }
>> +
>> +    return -EPERM;
>> +}
> 
> These look sufficient for the default policy, but they don't seem
> sufficient for Flask.  I think you need to create a new XSM hook.  For
> Flask, you would want the demote hook to transition xen_boot_t ->
> xen_t.  That would start xen_boot_t with privileges that are dropped
> in a one-way transition.  Does that require all policies to then have
> xen_boot_t and xen_t?  I guess it does unless the hook code has some
> logic to skip the transition.

I am still thinking this through but my initial concern for Flask is
that I don't think we want dedicated domain transitions directly in
code. My current thinking would be to use a Kconfig to use xen_boot_t
type as the initial sid for the idle domain which would then require the
default policy to include an allowed transition from xen_boot_t to
xen_t. Then rely upon a boot domain to issue an xsm_op to do a relabel
transition for the idle domain with an assertion that the idle domain is
no longer labeled with its initial sid before Xen transitions its state
to SYS_STATE_active. The one wrinkle to this is whether I will be able
to schedule the boot domain before allowing Xen to transition into
SYS_STATE_active.

> For the default policy, you could start by creating the system domains
> as privileged and just have a single hook to drop privs.  Then you
> don't have to worry about the "elevate" hook existing.  The patch 2
> asserts could instead become the location of xsm_drop_privs calls to
> have a clear demarcation point.  That expands the window with
> privileges though.  It's a little simpler, but maybe you don't want
> that.  However, it seems like you can only depriv once for the Flask
> case since you want it to be one-way.

This does simplify the solution and since today we cannot differentiate
between hypervisor setup and hypervisor initiated domain construction
contexts, it does not run counter to what I have proposed. As for flask,
again I do not believe codifying a domain transition bound to a new XSM
op is the appropriate approach.

v/r,
dps

