Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DA45090C6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 21:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309590.525949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhGMu-0001Xe-JS; Wed, 20 Apr 2022 19:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309590.525949; Wed, 20 Apr 2022 19:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhGMu-0001Vj-Fr; Wed, 20 Apr 2022 19:52:04 +0000
Received: by outflank-mailman (input) for mailman id 309590;
 Wed, 20 Apr 2022 19:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUyO=U6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhGMs-0001Vd-SU
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 19:52:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52d90a90-c0e3-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 21:51:54 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650484306172272.49530555779097;
 Wed, 20 Apr 2022 12:51:46 -0700 (PDT)
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
X-Inumbo-ID: 52d90a90-c0e3-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1650484309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iem/k3jWNpm7hSecSJuydASpv/zLQ1Wy8Ztn7L+oh+I5HcpRLDaWr+IMKlXFk4S3ZWVeegV094hDpcn/0YHHIxwEfrdpPonFdm1GosCGNlRVC/sH9P9HFmlZnTyl/NCsx1+cQ0UOV5QIl9fva8KqkhsEKCSCgAxhp4cuUy5bw4M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650484309; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=nLGKb2nHoVHpxHpT6pxINKx03WgbTw/0e+pGu/rhNj4=; 
	b=l5nB+38Ijziq98xzw2IDx0zD24C72iZrDh0tF+q7syFilpo1QV9Vgz7wgFJgqQBXdTyOC556gzl6f843GMXrhtzNgQOCsZOtiHef80RM4I/DaBTBL4lJ9WT3WNtZ7KB4i0dDbdW6iKPxmaSMhTDDMVGcP7X/3/QfrIdPxts2akw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650484309;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nLGKb2nHoVHpxHpT6pxINKx03WgbTw/0e+pGu/rhNj4=;
	b=Ok+cJnGaV4OFMetIA+o+BJ5pqYwdaQ3X8saYcm55FUdSAMSxLivU/EUBGXSyE3D2
	vpQtwvh0D7xAzw618KpVQoylSuyaDmkAJmXLgGPTBr7buIUh3/vo4bZRceHEgOshpNE
	4VGgK17Z5/Z0/MKUtSpxVNuq6hd4gFOaWcTMcPag=
Message-ID: <24dfdca7-a767-d115-133d-f79138bb41b6@apertussolutions.com>
Date: Wed, 20 Apr 2022 15:51:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Scott Davis <scott.davis@starlab.io>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220420210407.18060-1-dpsmith@apertussolutions.com>
 <20220420210407.18060-3-dpsmith@apertussolutions.com>
 <CAKf6xptTqsL9wcP2n=-NBd9UtrCh=+XxzJgK3tGYpqUXQEDUAA@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/2] flask: implement xsm_transtion_running
In-Reply-To: <CAKf6xptTqsL9wcP2n=-NBd9UtrCh=+XxzJgK3tGYpqUXQEDUAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/20/22 14:07, Jason Andryuk wrote:
> On Wed, Apr 20, 2022 at 1:03 PM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> This commit implements full support for starting the idle domain privileged by
>> introducing a new flask label xenboot_t which the idle domain is labeled with
>> at creation.  It then provides the implementation for the XSM hook
>> xsm_transition_running to relabel the idle domain to the existing xen_t flask
>> label.
>>
>> In the reference flask policy a new macro, xen_build_domain(target), is
>> introduced for creating policies for dom0less/hyperlaunch allowing the
>> hypervisor to create and assign the necessary resources for domain
>> construction.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
> 
>> @@ -188,6 +188,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>
>>  static void cf_check flask_domain_runtime_security(void)
>>  {
>> +    struct domain_security_struct *dsec;
>>      struct domain *d = current->domain;
>>
>>      if ( d->domain_id != DOMID_IDLE )
>> @@ -198,6 +199,9 @@ static void cf_check flask_domain_runtime_security(void)
>>       * set to false for the consistency check(s) in the setup code.
>>       */
>>      d->is_privileged = false;
>> +
>> +    dsec = d->ssid;
>> +    dsec->sid = SECINITSID_XEN;
> 
> I think you also want
>    dsec->self_sid = dsec->sid;
> so self also changes to xen_t.

Erg, thanks for the catch.

> Otherwise I think it looks good,
> 
> I was wondering if you were going to require xenboot_t -> xen_t
> permissions, but manually setting the sid fields side-steps that.
> That seems nicer than requiring policy rules for the transition.

I was considering it but as I was reflecting on the discussions that
were had, this is a one-time, one-way transition. Combine that with the
fact that xenboot_t has to be an initial sid (fixed/permnant type) for
Xen's flask policy, there is no need to require a transition rule in the
policy that can never be changed. And yes, it helps makes things much
simpler.( ^_^)

> Hmmm, cross referencing other flask code, often after assigning
> self_sid there is this call to potentially re-calculate it:
>     security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
> &dsec->self_sid);
> 
> But it isn't used for system domains, so omitting it seems fine.

Hmm, now you have me concerned about decisions residing in the avc from
accesses made during domain creation. Let me double check that, but I
think it will be needed. I believe the reason it was not needed for the
system domains because prior to this no access decisions were made
before the domains were labeled.

v/r,
dps

