Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3149E561CBC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 16:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358557.587840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6uvH-0001BN-11; Thu, 30 Jun 2022 14:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358557.587840; Thu, 30 Jun 2022 14:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6uvG-00018u-TB; Thu, 30 Jun 2022 14:13:34 +0000
Received: by outflank-mailman (input) for mailman id 358557;
 Thu, 30 Jun 2022 14:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o6uvE-0000ZH-T1
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 14:13:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d152263f-f87e-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 16:13:31 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1656598406312972.0612089444087;
 Thu, 30 Jun 2022 07:13:26 -0700 (PDT)
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
X-Inumbo-ID: d152263f-f87e-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1656598408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gQx0tPWHUi6PJi7sExl2doMN3pCd7c4YIH5yGpVoi1bOt5iP0dx2MJyeXvyFlQMtkIc+ZC9iLe+njeblF3bWHpsOq+TBHjVNpxUTp3iRhVT+Kt3Nps62wRqW7SltOvp/V+/PNlGLoJqPXLRWJ4aNYm6PBHHNVVcFDPG2vuPeKGw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1656598408; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=mnB6dWYOvRD72XyIq0MErs+Pc6+lS9wG5crKeAI6vGw=; 
	b=WcUxqbJgQOvBnQsqgdvDDg65z0n2+7NpdNNl7qUIQq5w+AYksWW9Wb3H5KkKkj+SjMzR50Pn/avr/6DU+aF1SFkBLMcGAELzF1s1yJ1DW21+IkMEas5zLOkiKANjiXh3qZ3RpA7O87oA3V/9fpVbP4n6tcq/M45min3X5kQdxJM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656598408;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mnB6dWYOvRD72XyIq0MErs+Pc6+lS9wG5crKeAI6vGw=;
	b=GKNAgXBLOdgLh59d9mbyOOd4CjBOQLlBDfYmpRC8UHMZ4YUEhHEjW6A6iPek9gwl
	PpcoaK5n1vOAJ+Ww+S3L64Du8qKXTAUA2zKFeyc9Ygvp02vqbmIzDo6raUYf54XAa1h
	J465Mj13V7qupxrKv+snJm1inZSGWonGmzdphZes=
Message-ID: <25edcdb7-f863-51ca-812d-2f744f9de52e@apertussolutions.com>
Date: Thu, 30 Jun 2022 10:11:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v9 3/3] xsm: refactor flask sid alloc and domain check
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
 <20220630022110.31555-4-dpsmith@apertussolutions.com>
 <AS8PR08MB7991EF8AA64EAB4754513A7892BA9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <AS8PR08MB7991EF8AA64EAB4754513A7892BA9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/30/22 04:40, Henry Wang wrote:
> Hi Daniel,
> 
>> -----Original Message-----
>> Subject: [PATCH v9 3/3] xsm: refactor flask sid alloc and domain check
>>
>> The function flask_domain_alloc_security() is where a default sid should be
>> assigned to a domain under construction. For reasons unknown, the initial
>> domain would be assigned unlabeled_t and then fixed up under
>> flask_domain_create().  With the introduction of xenboot_t it is now possible
>> to distinguish when the hypervisor is in the boot state.
>>
>> This commit looks to correct this by using a check to see if the hypervisor is
>> under the xenboot_t context in flask_domain_alloc_security(). If it is, then it
>> will inspect the domain's is_privileged field, and select the appropriate
>> default label, dom0_t or domU_t, for the domain. The logic for
>> flask_domain_create() was changed to allow the incoming sid to override the
>> default label.
>>
>> The base policy was adjusted to allow the idle domain under the xenboot_t
>> context to be able to construct domains of both types, dom0 and domU.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Same as what Jan has said, I don't think I am qualified to properly review
> the series, but I did run a compile and runtime test on Arm64 platform with
> the xsm and flask enabled and it looks like everything is fine.

Ack.

> Hence (also for the whole series):
> Tested-by: Henry Wang <Henry.Wang@arm.com>

Thank you.

>> ---
>>  tools/flask/policy/modules/dom0.te |  3 +++
>>  tools/flask/policy/modules/domU.te |  3 +++
>>  xen/xsm/flask/hooks.c              | 34 ++++++++++++++++++------------
>>  3 files changed, 26 insertions(+), 14 deletions(-)
> 

