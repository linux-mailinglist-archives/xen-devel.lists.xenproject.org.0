Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B050A2DA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310276.527010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXz0-0006mO-B2; Thu, 21 Apr 2022 14:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310276.527010; Thu, 21 Apr 2022 14:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXz0-0006kJ-7n; Thu, 21 Apr 2022 14:40:34 +0000
Received: by outflank-mailman (input) for mailman id 310276;
 Thu, 21 Apr 2022 14:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q+Sl=U7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nhXyy-0006kD-Sr
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:40:32 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb51597f-c180-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 16:40:27 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650552022039241.49162966002302;
 Thu, 21 Apr 2022 07:40:22 -0700 (PDT)
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
X-Inumbo-ID: fb51597f-c180-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650552026; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fj+mQqyhFd+gi98MLfSQqZZ31QCRNBG1/Fw/zW1oqrKc0Gg1jR1LLHTQvf/QYXsRJcKMtG8xHzpjvSVi2zaev0iJzqmHXJnRiQ4VFtfOASOLWyAh6GFr2EDQRIocxCFqVVAUgNH95s4t1/Uc3JO3tb3e6YLF0e3Augxxvv5myzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650552026; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=INRJ/oYyZWUNGp0FaIjHRLa1bulSIckxyOMlagQ3NGc=; 
	b=l0tzb3V9O08FUO6S2NOObjAjxYqEyC6p0stPQSfQLDMZbZCpkixbZl5dZ4uuKuu73WGumbaugfcUEc/N5UwDwiJLM78EICYgBpFXtErtT2Rx4IaGyYBayZpZTexv0VRdioLMvvs+Apn4NkR9IhsQIXuxZdvEa5qusOCbrAMULs8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650552026;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=INRJ/oYyZWUNGp0FaIjHRLa1bulSIckxyOMlagQ3NGc=;
	b=Z1VeLQgYW0FN9sYx3u3Y++E3A78rLQtAiaLJ2dJY1vTmYFwfhEj3oLVVh/6TqMe7
	VPVfL6scQdevs+pMNqBEJY8ApmF9iANYAvKmQxRp/GpZ2xXRx891BisYjhHe3uCcsx4
	AeMNthcD//cRMRFctJoRa0AmMRgextH7fZJf15PM=
Message-ID: <77f0b3d0-dfba-f909-249e-fe51e068d635@apertussolutions.com>
Date: Thu, 21 Apr 2022 10:39:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220420222834.5478-1-dpsmith@apertussolutions.com>
 <20220420222834.5478-3-dpsmith@apertussolutions.com>
 <201cc975-7566-7e96-d964-dd65e1a15c25@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 2/2] flask: implement xsm_transtion_running
In-Reply-To: <201cc975-7566-7e96-d964-dd65e1a15c25@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/21/22 05:22, Jan Beulich wrote:
> On 21.04.2022 00:28, Daniel P. Smith wrote:
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -168,7 +168,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>      switch ( d->domain_id )
>>      {
>>      case DOMID_IDLE:
>> -        dsec->sid = SECINITSID_XEN;
>> +        dsec->sid = SECINITSID_XENBOOT;
>>          break;
>>      case DOMID_XEN:
>>          dsec->sid = SECINITSID_DOMXEN;
>> @@ -188,6 +188,7 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>  
>>  static void cf_check flask_transition_running(void)
>>  {
>> +    struct domain_security_struct *dsec;
>>      struct domain *d = current->domain;
>>  
>>      if ( d->domain_id != DOMID_IDLE )
>> @@ -198,6 +199,10 @@ static void cf_check flask_transition_running(void)
>>       * set to false for the consistency check(s) in the setup code.
>>       */
>>      d->is_privileged = false;
>> +
>> +    dsec = d->ssid;
>> +    dsec->sid = SECINITSID_XEN;
>> +    dsec->self_sid = dsec->sid;
>>  }
> 
> If replacing SIDs is an okay thing to do, perhaps assert that the
> values haven't changed from SECINITSID_XENBOOT prior to replacing
> them?

Yes, changing a domain's SID is a legitimate action that could be done
today via the FLASK_RELABEL_DOMAIN subop of xsm_op hypercall that ends
up calling flask_relabel_domain(), when using flask policy. This is
where Jason was concerned if I was going to be using that call to change
the SID, which would require a policy rule to allow xenboot_t to relabel
itself as xen_t. As flask works today, the system domains use initial
SIDs which are effectively compile-time labels, which means the policy
rule is a static, fixed rule, i.e. it is not possible to use a different
set of labels, that must always be present. This also introduces the
risk for a custom policy writer to inadvertently leave the xenboot_t to
xen_t transitional rule out resulting in a failed access attempt which
would lead to a panic. This is unnecessary pain when we can just handle
the transition internal to the hypervisor as that where it is all really
occurring.

As for the ASSERT, that is a good point since there is a specific state
we are expecting to enter the hook. Pair that with some thinking I have
had to do in answering Jason, Roger, and yourself, I am going to rewire
the hook to return a success/error return value and move the panic
outside the check.

v/r,
dps

