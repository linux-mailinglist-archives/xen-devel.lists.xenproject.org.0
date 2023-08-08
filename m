Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B85774964
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 21:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580409.908607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTSmO-0000Z3-3k; Tue, 08 Aug 2023 19:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580409.908607; Tue, 08 Aug 2023 19:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTSmO-0000WY-0O; Tue, 08 Aug 2023 19:54:08 +0000
Received: by outflank-mailman (input) for mailman id 580409;
 Tue, 08 Aug 2023 19:54:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTSmM-0000WS-7p
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 19:54:06 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52fcd48e-3625-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 21:54:04 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691524439090360.089032463114;
 Tue, 8 Aug 2023 12:53:59 -0700 (PDT)
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
X-Inumbo-ID: 52fcd48e-3625-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691524440; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OSRsXbbEZoXLkhFyYOoWxl1EkyA0chm2kkoBnLzViYFyN73Codh5pub56Gek2XfZ/lTe8U+hKPh2TnASxvLMiSjmF4LBOXum/k6jrRoJeySdoXhVeVGI/GPIt1d+c5UxTYutOVWbhHyVgZfB1xw7RNHd37uFs4N8L6y9cqZjhsU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691524440; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DmZPxTSfNhc0mZHMD+7OFVxhiA+rfHCfTf2zgwRrq7M=; 
	b=dAqToByapNa/zpK3lpbUmx+jNPvKKpXu7tvNSqwbqmsGV16VVNiO8U9atfxpBETJmaKjGPiEgjedTO9fGD5LXyOpo4hBuBM9gpVw8Bm8axWyh174COptFTu/ASQg3Y9vcuKXGaEG59mGOjd1IWUZw5/eJ/G5yslsY88tzGYLhVI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691524440;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DmZPxTSfNhc0mZHMD+7OFVxhiA+rfHCfTf2zgwRrq7M=;
	b=JWOj4FFIgOSdp9I0u0stIOt89U+BY0WiKkIRp68S7W6LPSijR4hJEpWSF4nia+EE
	tdJ9IgT6O3EXuZ/IvmjRZAonbl4mL6ZdDuEsCedbvu5Bo0zMjSDAKGpvb2fbyf8RLzg
	FRq/3sZHH9vfncE4mdy6mUoicMrZD13ZTzbbISrY=
Message-ID: <fc91ad7b-df94-a1ec-abe1-9472337024b6@apertussolutions.com>
Date: Tue, 8 Aug 2023 15:53:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-2-dpsmith@apertussolutions.com>
 <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com>
 <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com>
 <alpine.DEB.2.22.394.2308031620160.2127516@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2308031709070.2127516@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031709070.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/3/23 20:09, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Stefano Stabellini wrote:
>> On Thu, 3 Aug 2023, Daniel P. Smith wrote:
>>>> Also, what is the plan for the existing dom0less dt properties?
>>>> Will they need to be moved to new /hypervisor node or we will have to parse
>>>> both /chosen and /hypervisor nodes?
>>>
>>> In the proposal I sent to xen-devel in response to Luca's RFC for rebranding
>>> dom0less features under hyperlaunch, that is the purpose of this commit. Get
>>> this document up to date with what was done in v1 along with what we are
>>> planning/working on for hyperlaunch. One could think of this as effectively
>>> the API to the capabilities hyperlaunch will provide. Not just how to
>>> construct a domain, but what kinds of domains can be constructed by
>>> hyperlaunch. Step one of the proposal is to publish a patch upon which we all
>>> can iterate over and get to an agreement on a suitable interface for all. The
>>> next step would be the introduction of hyperlaunch dom0less compatibility
>>> mode, that would see the moving of the parsing logic for the existing dom0less
>>> nodes under /xen/common/domain-builder. It would continue to exist there even
>>> after hyperlaunch proper is merged and can remain there for backward
>>> compatibility until there is a decision to retire the compatibility interface.
>>
>> I like this plan. The two interfaces are so similar that it is basically
>> one interface with a couple of tiny differences.
>>
>> So I expect we would move the existing dom0less parsing code to common/,
>> add a couple of extensions (such as parsing /hypervisor in addition to
>> /chosen) and use it as it.
>>
>> Later on, after a few years of using /hypervisor instead of /chosen, if
>> nobody is using /chosen anymore, we could retire /chosen completely. But
>> this is just one DT node/property that gets retired (there are a couple
>> of others). I don't imagine we'll have a full new implementation of the
>> DT parsing logic that supersedes the existing implementation of it
>> (especially considering the difficulty of maintaining 2 different parsing
>> logics in the hypervisor for similar interfaces).
>>
>> Same thing for the DT interface documentation. I don't think we need two
>> DT interface docs? We could start with the existing dom0less interface
>> (docs/misc/arm/device-tree/booting.txt), and move it somewhere common
>> like docs/misc/device-tree.
>>
>> Then add any changes or extensions required by other architecture, such
>> as x86 and RISC-V.
>>
>> For sure for x86 we need "module-index". I don't know if anything else
>> is must-have to get it to work on x86 but if there is, we should add
>> those too.
> 
> 
> For clarity, I think we should definitely have
> docs/design/launch/hyperlaunch.rst, and maybe we should also have
> hyperlaunch-devicetree.rst as an overview description and user guide.
> That's useful.
> 
> But in terms of official device tree bindings interface description
> (basically what in Linux would go under
> Documentation/devicetree/bindings/), I think it would be best to only
> have a single document. The current one is
> docs/misc/arm/device-tree/booting.txt.

Does the proposal to your first message align with your follow-up here?

v/r,
dps

