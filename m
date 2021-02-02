Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4DD30C38F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 16:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80600.147500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xXB-0001nh-Ok; Tue, 02 Feb 2021 15:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80600.147500; Tue, 02 Feb 2021 15:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xXB-0001nI-LJ; Tue, 02 Feb 2021 15:24:05 +0000
Received: by outflank-mailman (input) for mailman id 80600;
 Tue, 02 Feb 2021 15:24:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l6xX9-0001n6-El
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 15:24:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l6xX7-0007yS-Om; Tue, 02 Feb 2021 15:24:01 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l6xX7-0000Nz-Iw; Tue, 02 Feb 2021 15:24:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:Cc:From:References:To:Subject;
	bh=Mw4IMl4Ae0U2lXSykBhjVy2sBzxa2prqjIT4wRg2xAs=; b=CDkCecAwn9Pr/GmDSvoGCjaRS6
	WPI4tCp3w/VXG98KwumOkznD1GDNqmYntXBjURUesUn/UnviHtsyQxJA3x7+IoKohhJtqMjPwBYlc
	8kqSxErqK5Gju/DX8nOhUsHJop6OLCQLnDvc3aUj2sd6jC8a2xSQ0z8EPkPSGdZ8rKvs=;
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
 <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
 <4760cbac-b006-78bc-b064-3265384f6707@xen.org>
 <311bb201bcacfd356f0c0b67856754eceae39e37.camel@suse.com>
From: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Message-ID: <7f2ec84a-9814-ffb1-0940-e936a80afbbb@xen.org>
Date: Tue, 2 Feb 2021 15:23:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <311bb201bcacfd356f0c0b67856754eceae39e37.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(Adding Andrew, Jan, Juergen for visibility)

Hi Dario,

On 02/02/2021 15:03, Dario Faggioli wrote:
> On Tue, 2021-02-02 at 07:59 +0000, Julien Grall wrote:
>> Hi Dario,
>>
>> I have had a quick look at your place. The RCU call in
>> leave_hypervisor_to_guest() needs to be placed just after the last
>> call
>> to check_for_pcpu_work().
>>
>> Otherwise, you may be preempted and keep the RCU quiet.
>>
> Ok, makes sense. I'll move it.
> 
>> The placement in enter_hypervisor_from_guest() doesn't matter too
>> much,
>> although I would consider to call it as a late as possible.
>>
> Mmmm... Can I ask why? In fact, I would have said "as soon as
> possible".

Because those functions only access data for the current vCPU/domain. 
This is already protected by the fact that the domain is running.

By leaving the "quiesce" mode later, you give an opportunity to the RCU 
to release memory earlier.

In reality, it is probably still too early as a pCPU can be considered 
quiesced until a call to rcu_lock*() (such rcu_lock_domain()).

But this would require some investigation to check if we effectively 
protect all the region with the RCU helpers. This is likely too 
complicated for 4.15.

Cheers,

-- 
Julien Grall

