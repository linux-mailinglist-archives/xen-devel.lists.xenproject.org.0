Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59892540072
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 15:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343286.568589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZaa-0005TQ-IA; Tue, 07 Jun 2022 13:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343286.568589; Tue, 07 Jun 2022 13:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZaa-0005R2-Dn; Tue, 07 Jun 2022 13:49:44 +0000
Received: by outflank-mailman (input) for mailman id 343286;
 Tue, 07 Jun 2022 13:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dSew=WO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nyZaY-0005Qs-Du
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 13:49:42 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad16a1c4-e668-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 15:49:41 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654609773475473.3381688403167;
 Tue, 7 Jun 2022 06:49:33 -0700 (PDT)
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
X-Inumbo-ID: ad16a1c4-e668-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; t=1654609777; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GsqfH/xRBbpoECvLih4W7OE5L3wqkOnkNAYo92peDB+BtVzZDVt9ZvB2oyxtHl70e6IEiCc1uMeY5XgkUj/2czBja797Fzyc9CQMaxi3hyAVBwCMMvVqWQn0hT/WlKzkxQ9CEULLcH0sPq2Wq/IeER/+vO9c/QFt2SNnhuoSeO4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654609777; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dOsy6EjkVih1OL+NrztAnvYWxEfNj6E/Al9okX3Yf1Q=; 
	b=b69NotZvp57/6VDwDFZ9rdHvzfJ813iYJRN2Snx6gbeJqCQVBvFSb/HryMdnhP1MUrhUKyYlx/bWt0/tKf4zs/dC2BkFFEon7OWWLfwV2SDz2NZt3Y1Wk5IPwZofsRH+9SlTDaj82ATbX/AH4kmRAmJ7U0PGXvYqZWZRjWXm+/Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654609777;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dOsy6EjkVih1OL+NrztAnvYWxEfNj6E/Al9okX3Yf1Q=;
	b=RAg9smD1DPlz+1vCi+TQpcvqGs+rLnzq0UgJy2IH+eVQUvLmnDnsRacFLwpUNle0
	eKkIg8Hbj4xefoQSGA2BThHu7Jrd56uwGruSyRgkHdPEApQblX6TCszOdbcCF91DVhI
	xy3eeaLcsiVxR/Wcayi4c9yGx+1mwS2CeS5iISuw=
Message-ID: <6447f0ff-993c-9d39-52a8-40a434be9e52@apertussolutions.com>
Date: Tue, 7 Jun 2022 09:47:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-3-dpsmith@apertussolutions.com>
 <17edde4a-0d00-0da7-5910-09874ab70838@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
In-Reply-To: <17edde4a-0d00-0da7-5910-09874ab70838@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 6/2/22 05:47, Jan Beulich wrote:
> On 31.05.2022 20:20, Daniel P. Smith wrote:
>> Previously, initializing the policy buffer was split between two functions,
>> xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
>> the policy from boot modules and the former for falling back to built-in
>> policy.
>>
>> This patch moves all policy buffer initialization logic under the
>> xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
>> message is printed for every error condition that may occur in the functions.
>> With all policy buffer init contained and only called when the policy buffer
>> must be populated, the respective xsm_{mb,dt}_init() functions will panic for
>> all errors except ENOENT. An ENOENT signifies that a policy file could not be
>> located. Since it is not possible to know if late loading of the policy file is
>> intended, a warning is reported and XSM initialization is continued.
> 
> Is it really not possible to know? flask_init() panics in the one case
> where a policy is strictly required. And I'm not convinced it is
> appropriate to issue both an error and a warning in most (all?) of the
> other cases (and it should be at most one of the two anyway imo).

With how XSM currently works, I do not see how without creating a
layering violation, as you had mentioned before. It is possible for
flask_init() to know because the flask= parameter belongs to the flask
policy module and can be directly checked.

I think we view this differently. A call to
xsm_{multiboot,dt}_policy_init() is asking for a policy file to be
loaded. If it is not able to do so is an error. This error is reported
back to xsm_{multiboot,dt}_init() which is responsible for initializing
the XSM framework. If it encounters an error for which inhibits it from
initializing XSM would be an error whereas an error it encounters that
does not block initialization should warn the user as such. While it is
true that the only error for the xsm_multiboot_policy_init() currently
is a failure to locate a policy file, ENOENT, I don't see how that
changes the understanding.

>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -775,7 +775,7 @@ int xsm_multiboot_init(
>>      unsigned long *module_map, const multiboot_info_t *mbi);
>>  int xsm_multiboot_policy_init(
>>      unsigned long *module_map, const multiboot_info_t *mbi,
>> -    void **policy_buffer, size_t *policy_size);
>> +    const unsigned char *policy_buffer[], size_t *policy_size);
> 
> See my v3 comment on the use of [] here. And that comment was actually
> made before you sent v4 (unlike the later comment on patch 1). Oh,
> actually you did change this in the function definition, just not here.

ack

>> @@ -32,14 +32,21 @@
>>  #ifdef CONFIG_MULTIBOOT
>>  int __init xsm_multiboot_policy_init(
>>      unsigned long *module_map, const multiboot_info_t *mbi,
>> -    void **policy_buffer, size_t *policy_size)
>> +    const unsigned char **policy_buffer, size_t *policy_size)
>>  {
>>      int i;
>>      module_t *mod = (module_t *)__va(mbi->mods_addr);
>> -    int rc = 0;
>> +    int rc = -ENOENT;
>>      u32 *_policy_start;
>>      unsigned long _policy_len;
>>  
>> +#ifdef CONFIG_XSM_FLASK_POLICY
>> +    /* Initially set to builtin policy, overriden if boot module is found. */
> 
> Nit: "overridden"

ack

v/r,
dps

