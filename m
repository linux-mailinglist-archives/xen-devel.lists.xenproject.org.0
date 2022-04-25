Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3850E607
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 18:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313162.530631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj1ne-0004Et-Qo; Mon, 25 Apr 2022 16:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313162.530631; Mon, 25 Apr 2022 16:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj1ne-0004Cq-Nv; Mon, 25 Apr 2022 16:42:58 +0000
Received: by outflank-mailman (input) for mailman id 313162;
 Mon, 25 Apr 2022 16:42:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCC+=VD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nj1nc-0004Ch-Ux
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 16:42:56 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1180422-c4b6-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 18:42:55 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1650904970169140.77981176062337;
 Mon, 25 Apr 2022 09:42:50 -0700 (PDT)
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
X-Inumbo-ID: c1180422-c4b6-11ec-8fc2-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1650904972; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GOZuL7rHmbOLcLD18zgWFg8YXScDUFvS8LClTmJEE6CNiQvrd7QApmLutrqWOCajaM7MTHEsljL9i05CD1+076/fHrcmErzm9lkHqDFt1JDnmbktLI4BxxOpSv3rn+mNf0duPHtEgEjgV2PPs99Wzm2ScAszNEXN2aAkrYRNLkI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1650904972; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fdPdl1eYR2TgNCzIg4GWQ8agZHJt3bxu/2KlgAWoj+0=; 
	b=EHl1h23WA0SY8CwLbQUkq5UxlTy2PoOPMVwmEcdf/zDVy8rJKhdd4GTxkbi89BtumiPOuU7kEp/+wjdrYa3xYwQAP+b6dEq8Zl+VgvJvPg7qZ8z7jVIUaF9a/aFez5YwBGFRy41GTNA4/q6F4toj35QWzbtuu/UQ7vJO+gvUrZY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650904972;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fdPdl1eYR2TgNCzIg4GWQ8agZHJt3bxu/2KlgAWoj+0=;
	b=aNxrWD9mG/lmMNYjdSR8sq2bLFX0TGRIb39MOQvcxm7RFlgnmElDSIRUbqFwad96
	IkYoQbEBP4k94qao/D5GnoEnAY4lcmFw5GyAfQCRlLOXtDE+b3Eqrv8AeHsl8RBZmsG
	IgT7A1dc6w+a0RgZYhn0eCTgCvOR+tYA9GNmsH24=
Message-ID: <cf5e1151-a33f-8699-153c-4db7cf474576@apertussolutions.com>
Date: Mon, 25 Apr 2022 12:42:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] flask: implement xsm_set_system_active
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Scott Davis <scott.davis@starlab.io>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220422163458.30170-1-dpsmith@apertussolutions.com>
 <20220422163458.30170-3-dpsmith@apertussolutions.com>
 <CAKf6xptRBMwjrE_m+rQEoS+ZoC=7qFO+NGg3eUQYuC6x66Uauw@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <CAKf6xptRBMwjrE_m+rQEoS+ZoC=7qFO+NGg3eUQYuC6x66Uauw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/22/22 12:58, Jason Andryuk wrote:
> On Fri, Apr 22, 2022 at 12:35 PM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> This commit implements full support for starting the idle domain privileged by
>> introducing a new flask label xenboot_t which the idle domain is labeled with
>> at creation.  It then provides the implementation for the XSM hook
>> xsm_set_system_active to relabel the idle domain to the existing xen_t flask
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
>> @@ -188,8 +188,12 @@ static int cf_check flask_domain_alloc_security(struct domain *d)
>>
>>  static int cf_check flask_set_system_active(void)
>>  {
>> +    struct domain_security_struct *dsec;
>>      struct domain *d = current->domain;
>>
>> +    dsec = d->ssid;
>> +    ASSERT( dsec->sid == SECINITSID_XENBOOT);
> 
> Extra space before dsec.

Ack.

> With that fixed,
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

