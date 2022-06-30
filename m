Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7B561CBA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 16:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358547.587818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6utc-0008Vu-DB; Thu, 30 Jun 2022 14:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358547.587818; Thu, 30 Jun 2022 14:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6utc-0008TB-9t; Thu, 30 Jun 2022 14:11:52 +0000
Received: by outflank-mailman (input) for mailman id 358547;
 Thu, 30 Jun 2022 14:11:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o6utb-0008T5-1K
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 14:11:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94139ddb-f87e-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 16:11:49 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1656598291417507.4277519566392;
 Thu, 30 Jun 2022 07:11:31 -0700 (PDT)
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
X-Inumbo-ID: 94139ddb-f87e-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1656598293; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AUCukss27nvcWdTpFyBZ8Quk0T/v/ezw5arMiQRYtp/E+zhJfTeeSLBPL9E+heNvyRIO8BMWzM8hbo0HKRE/hFaeKFm5+rNXJ7ZUsKmLad5lN4UHYRxPSI8QxdXk8MFQgW+rQ4JLGtVg+vKomR/ppwPe7WI574Kmen3M4GBw5lk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1656598293; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fd7RXl5+dt4+cELBUnmitpRnF8vkWWLIVA5/4Uzn+tw=; 
	b=fZJxvakGWw9QzX2Scr/YLCeKHNUIyg5b/bVZIWYFNrBQFBV4j8ANHA0W1+OKtrLD6A2j3BTLsJrGRSRqD+KbHJsAheJNR9mArNySxpsaJvPFfxlY2JCWEucNnYvbuL6yow0e4ZINJ/JVZhR5JM9IHJc0dxCOlQBbFXvSI22jys8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656598293;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fd7RXl5+dt4+cELBUnmitpRnF8vkWWLIVA5/4Uzn+tw=;
	b=XkVeJXYZeBR8C3u+zACMVY2tdaYvVK5PqPXYzQ0k7bqVZKs//XZhJfssdu786vwD
	THrIOgNg6oA9yDweqaLdYfsn1p/IHOxCd6himvumtT0sG9YUf0UMMakBBcPgOdQnd6L
	oVpIh8xaCXI+3WViTz7613wVUeCzjPlYzydtfutI=
Message-ID: <d4f12e64-4db7-5c47-9412-70adfd245807@apertussolutions.com>
Date: Thu, 30 Jun 2022 10:09:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
 <20220630022110.31555-4-dpsmith@apertussolutions.com>
 <9833c7cb-d71d-10a3-f74f-3caf46db3cb4@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v9 3/3] xsm: refactor flask sid alloc and domain check
In-Reply-To: <9833c7cb-d71d-10a3-f74f-3caf46db3cb4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/30/22 02:14, Jan Beulich wrote:
> Just a two nits - while the change looks plausible, I'm afraid I'm
> not qualified to properly review it.
> 
> On 30.06.2022 04:21, Daniel P. Smith wrote:
>> The function flask_domain_alloc_security() is where a default sid should be
>> assigned to a domain under construction. For reasons unknown, the initial
>> domain would be assigned unlabeled_t and then fixed up under
>> flask_domain_create().  With the introduction of xenboot_t it is now possible
>> to distinguish when the hypervisor is in the boot state.
>>
>> This commit looks to correct this by using a check to see if the hypervisor is
>> under the xenboot_t context in flask_domain_alloc_security(). If it is, then it
> 
> While (or maybe because) I'm not a native speaker, the use of "looks"
> reads ambiguous to me. I think you mean it in the sense of e.g. "aims",
> but at first I read it in the sense of "seems", which made me think
> you're not certain whether it actually does.

Apologies, "look to" or "looks to" are forms of an American idiom, and
was used for its meaning of "expected to happen"[1]. I will reword to
provide a concise version of this statement.

[1] https://idioms.thefreedictionary.com/look+to

>> will inspect the domain's is_privileged field, and select the appropriate
>> default label, dom0_t or domU_t, for the domain. The logic for
>> flask_domain_create() was changed to allow the incoming sid to override the
>> default label.
>>
>> The base policy was adjusted to allow the idle domain under the xenboot_t
>> context to be able to construct domains of both types, dom0 and domU.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>  tools/flask/policy/modules/dom0.te |  3 +++
>>  tools/flask/policy/modules/domU.te |  3 +++
>>  xen/xsm/flask/hooks.c              | 34 ++++++++++++++++++------------
>>  3 files changed, 26 insertions(+), 14 deletions(-)
>>
>> diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
>> index 0a63ce15b6..2022bb9636 100644
>> --- a/tools/flask/policy/modules/dom0.te
>> +++ b/tools/flask/policy/modules/dom0.te
>> @@ -75,3 +75,6 @@ admin_device(dom0_t, ioport_t)
>>  admin_device(dom0_t, iomem_t)
>>  
>>  domain_comms(dom0_t, dom0_t)
>> +
>> +# Allow they hypervisor to build domains of type dom0_t
> 
> Since it repeats ...

Ack.

>> +xen_build_domain(dom0_t)
>> diff --git a/tools/flask/policy/modules/domU.te b/tools/flask/policy/modules/domU.te
>> index b77df29d56..73fc90c3c6 100644
>> --- a/tools/flask/policy/modules/domU.te
>> +++ b/tools/flask/policy/modules/domU.te
>> @@ -13,6 +13,9 @@ domain_comms(domU_t, domU_t)
>>  migrate_domain_out(dom0_t, domU_t)
>>  domain_self_comms(domU_t)
>>  
>> +# Allow they hypervisor to build domains of type domU_t
>> +xen_build_domain(domU_t)
> 
> ... here - s/they/the/ in both places?

Ack.

> Jan

