Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32A57E28C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 15:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373246.605347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEt14-0001er-GI; Fri, 22 Jul 2022 13:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373246.605347; Fri, 22 Jul 2022 13:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEt14-0001bv-DJ; Fri, 22 Jul 2022 13:48:30 +0000
Received: by outflank-mailman (input) for mailman id 373246;
 Fri, 22 Jul 2022 13:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEt13-0001bp-28
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 13:48:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f591754b-09c4-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 15:48:27 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658497699048555.4846389057155;
 Fri, 22 Jul 2022 06:48:19 -0700 (PDT)
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
X-Inumbo-ID: f591754b-09c4-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1658497700; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JuTol4TEcWlmzqCO5eWNW1Sp+CdG16SwD+Ii4eg+NtX3dB7KAtb+raGPqrxtoB/b7uXDZ/AdEwG7ONRJl0z+BoHG8h9wac2L7Ad1tLGa+WF3zZMk21HSbmkbJZVERUay7LBN+egL2w1uzCP2UbeiWGyQLqsKpGLQyRBVVmjWaZs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658497700; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=xnD+qKqY92asmX/XIXB+qAKIUsXF3sKlaZLCB+kmrys=; 
	b=caVOL/kYZRMOQinQt7jAIiydN20WAXBBM5qRCZbVyw3YRHE//UqzWl4ZyVF2jIV0laCAXRe9hgNj01spwgIObN01sl0IYPc8L+WhM5n8wTcVj1KAnKko5MTFoPDn7HVVZMSvlyFn8kpT53WmX+x8at+cOw2kIHYtzBDspVNS+Ao=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658497700;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xnD+qKqY92asmX/XIXB+qAKIUsXF3sKlaZLCB+kmrys=;
	b=ua4xj4lRIS7kHdJXaDSBF/ZVhnNHqugnqlbzBoD8AHvq8l7tEZQriF3+64ZZI+lz
	LAx/edubVwnBDEwfmPE5lX8dkxpdTTaQw1Uat8u5r6GXxut5pdcD7pA0Yp2L44E+gXK
	GrWNCrRSmYe3Rd60Bwo1Td9yHBFrcHuTGdHc7+N4=
Message-ID: <cd466fce-8e1b-5218-7e1b-5cbd68429aa7@apertussolutions.com>
Date: Fri, 22 Jul 2022 09:47:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-9-dpsmith@apertussolutions.com>
 <86f73a8a-5433-03c2-71fd-ee6a5abbe550@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 08/18] kconfig: introduce domain builder config option
In-Reply-To: <86f73a8a-5433-03c2-71fd-ee6a5abbe550@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 7/19/22 09:29, Jan Beulich wrote:
> On 06.07.2022 23:04, Daniel P. Smith wrote:
>> --- /dev/null
>> +++ b/xen/common/domain-builder/Kconfig
>> @@ -0,0 +1,15 @@
>> +
>> +menu "Domain Builder Features"
>> +
>> +config BUILDER_FDT
>> +	bool "Domain builder device tree (UNSUPPORTED)" if UNSUPPORTED
>> +	select CORE_DEVICE_TREE
>> +	---help---
> 
> Nit: No new ---help--- please anymore.

Ack.

>> +	  Enables the ability to configure the domain builder using a
>> +	  flattened device tree.
> 
> Is this about both Dom0 and DomU? Especially if not, this wants making
> explicit. But perhaps even if so it wants saying, for the avoidance of
> doubt.

The following patches will end with full conversion of both Dom0 and
DomU construction to be handled by a core domain construction framework.
If a device tree configuration is not present or this Kconfig option is
not set, then the domain builder will construct a Dom0 as it does today.
Turning this option on enables controlling the domain builder using a
device tree configuration, which (eventually) will be able to construct
any combination of Dom0, HWDom, CtlDom, DomU, etc. So I can add a
qualifier of, 'configure what domains will be constructed at boot by the
domain builder using a flattened device tree'. I can even add an
explanation that on x86 the FDT must be provided as the first multiboot
module.

v/r,
dps

