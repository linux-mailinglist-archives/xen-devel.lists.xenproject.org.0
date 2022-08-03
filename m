Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D436588FCB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 17:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380005.613978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJGg0-00066s-9r; Wed, 03 Aug 2022 15:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380005.613978; Wed, 03 Aug 2022 15:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJGg0-000640-75; Wed, 03 Aug 2022 15:52:52 +0000
Received: by outflank-mailman (input) for mailman id 380005;
 Wed, 03 Aug 2022 15:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dnW=YH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oJGfz-00063u-KC
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 15:52:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52e0eb4b-1344-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 17:52:50 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1659541963776129.17942170233516;
 Wed, 3 Aug 2022 08:52:43 -0700 (PDT)
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
X-Inumbo-ID: 52e0eb4b-1344-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1659541965; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TVtyRiWUtsKmJNTug91pv6BLryWvOOhRc5uZ+D6EHWZDehjC4KMkK2z9M8HnrLJrGK7/fc4Dp0uxwGj1ZfMd8t85ZbUA64Ie9+y+62g9oa+3CltrRYnHJqQ7yDdlOZvSrfisZpzFB+WrfCAFOniCOvRqWFJXgQFQeQlg0gTJpoo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1659541965; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=vrq9T6KffAmMrEcdjJdEcGzwsQbVuYfSpqEXivIpH2g=; 
	b=bdG5F3wPIPuhGolc7DZ3B3jKExEj5PK6k+FkZmKdj/yY/Fkylv/MDtgcK/36NRxouYryPIPRurOpB+08PixyzPHChFaMNvL4+H4X/1TvAWnEyqApUrpUr5zHhRsSVHSnYKd9ifXkbpHkyqlKyWJOBsHnlC9qj0TYP7XxTLMvIIo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659541965;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vrq9T6KffAmMrEcdjJdEcGzwsQbVuYfSpqEXivIpH2g=;
	b=kwQO9CuyQNiIA9Rj3P9jCXC3t9xoZKWeX0YXRjiHUW2U096xuoTVoci7l9qhtm+O
	eZ4z9wN1AhN9P5lXnww7N7HseptPyiCMt3057eV4rJJbqOzjuzZxCZ6Jlz/FXar9v4D
	ODuVLtpcgYTQArNSzvafaaV/pSbf6HqE+f8a9TpE=
Message-ID: <fdf2a27d-e0e0-f76b-654c-73f7dd8dff90@apertussolutions.com>
Date: Wed, 3 Aug 2022 11:52:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: jandryuk@gmail.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220803151741.7826-1-dpsmith@apertussolutions.com>
 <f9001446-157a-99a6-29cd-dcbbb6d59527@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v11] xsm: refactor flask sid alloc and domain check
In-Reply-To: <f9001446-157a-99a6-29cd-dcbbb6d59527@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/3/22 11:26, Jan Beulich wrote:
> On 03.08.2022 17:17, Daniel P. Smith wrote:
>> Changes in v11:
>> - put back dom0_created variable in flask_domain_create() to ensure the
>>   enforcement that dom0_t is a singleton label
> 
> Stale patch or bad rev log?

Nope, having a bad day. Staged the change but didn't amend commit it
before my usual sequence of test and cut patch. My apologies.

>> @@ -548,22 +556,19 @@ static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
>>  {
>>      int rc;
>>      struct domain_security_struct *dsec = d->ssid;
>> -    static int dom0_created = 0;
> 
> The variable is going away here, and it is not re-appearing elsewhere.
> 
> Jan
> 
>> -    if ( is_idle_domain(current->domain) && !dom0_created )
>> -    {
>> -        dsec->sid = SECINITSID_DOM0;
>> -        dom0_created = 1;
>> -    }
>> -    else
>> -    {
>> -        rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
>> -                          DOMAIN__CREATE, NULL);
>> -        if ( rc )
>> -            return rc;
>> +    /*
>> +     * If the null label is passed, then use the label from security context
>> +     * allocation.
>> +     */
>> +    if ( ssidref == 0 )
>> +        ssidref = dsec->sid;
>>  
>> -        dsec->sid = ssidref;
>> -    }
>> +    rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN, DOMAIN__CREATE, NULL);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    dsec->sid = ssidref;
>>      dsec->self_sid = dsec->sid;
>>  
>>      rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
> 

