Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1B6300A07
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 18:44:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73008.131628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l30U1-00019d-OG; Fri, 22 Jan 2021 17:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73008.131628; Fri, 22 Jan 2021 17:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l30U1-00019E-Kw; Fri, 22 Jan 2021 17:44:29 +0000
Received: by outflank-mailman (input) for mailman id 73008;
 Fri, 22 Jan 2021 17:44:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=530u=GZ=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1l30Tz-000199-WC
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 17:44:28 +0000
Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.13]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2aa96b0-a485-4883-9e25-fc74532b3231;
 Fri, 22 Jan 2021 17:44:25 +0000 (UTC)
Received: from [192.168.101.129] (h77-53-239-0.cust.a3fiber.se [77.53.239.0])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 76c8e193-5cd9-11eb-a8e7-d0431ea8bb10;
 Fri, 22 Jan 2021 17:44:23 +0000 (UTC)
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
X-Inumbo-ID: e2aa96b0-a485-4883-9e25-fc74532b3231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:to:subject:from;
	bh=pXYuLPB+VTW0S1FR4T7jmHV9SYK1jKmmlE8i+PWh9fM=;
	b=LSz9ME5o+tNQ61TVSK7ZH6HSQ8Uq3jiDerGcFJOuiKdrNFO1LJzVfihDbybw21YIN4cLHpDaPAqfy
	 m8wtubdq1JUhUHbbZLdczW1nIBBMH1OPG5zyQRunwJr2nPK683MuB/CSvTNvaEmzp4ikjh2cLD1zKv
	 zEfWY/nZly0ghxajJoYfBxNiXIhYI9Uf1P/nAXoq8OCiDiMF2A42KAIgg/P2Dnz97IbqSJ6X2ydJFV
	 FFmIKCb/cIIHWtWHtXqFrIuHfX57yvZ8sbXXfUktN+FTR3/CpgpVibvHz1MCs/dbYaFUcLfoFc9LJz
	 JBGqihIr42BEDafZPWMCBfN0wS5nKJA==
X-HalOne-Cookie: abcb0c112efd680717da00e61315fae726c3b411
X-HalOne-ID: 76c8e193-5cd9-11eb-a8e7-d0431ea8bb10
Subject: Re: Null scheduler and vwfi native problem
To: Julien Grall <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Message-ID: <8eef0e27-63bc-5202-9857-8143c94acd04@codiax.se>
Date: Fri, 22 Jan 2021 18:44:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 1/22/21 3:26 PM, Julien Grall wrote:
> Hi Anders,
>
> On 22/01/2021 08:06, Anders Törnqvist wrote:
>> On 1/22/21 12:35 AM, Dario Faggioli wrote:
>>> On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
>> - booting with "sched=null vwfi=native" but not doing the IRQ 
>> passthrough that you mentioned above
>> "xl destroy" gives
>> (XEN) End of domain_destroy function
>>
>> Then a "xl create" says nothing but the domain has not started 
>> correct. "xl list" look like this for the domain:
>> mydomu                                   2   512     1 ------       0.0
>
> This is odd. I would have expected ``xl create`` to fail if something 
> went wrong with the domain creation.
>
> The list of dash, suggests that the domain is:
>    - Not running
>    - Not blocked (i.e cannot run)
>    - Not paused
>    - Not shutdown
>
> So this suggest the NULL scheduler didn't schedule the vCPU. Would it 
> be possible to describe your setup:
>   - How many pCPUs?
There are 6 pCPUs
>   - How many vCPUs did you give to dom0?
I gave it 5
>   - What was the number of the vCPUs given to the previous guest?

Nr 0.

Listing vcpus looks like this when the domain is running:

xl vcpu-list
Name                                ID  VCPU   CPU State   Time(s) 
Affinity (Hard / Soft)
Domain-0                             0     0    0   r--     101.7 0 / all
Domain-0                             0     1    1   r--     101.0 1 / all
Domain-0                             0     2    2   r--     101.0 2 / all
Domain-0                             0     3    3   r--     100.9 3 / all
Domain-0                             0     4    4   r--     100.9 4 / all
mydomu                              1     0    5   r--      89.5 5 / all

vCPU nr 0 is also for dom0. Is that normal?

>
> One possibility is the NULL scheduler doesn't release the pCPUs until 
> the domain is fully destroyed. So if there is no pCPU free, it 
> wouldn't be able to schedule the new domain.
>
> However, I would have expected the NULL scheduler to refuse the domain 
> to create if there is no pCPU available.
>
> @Dario, @Stefano, do you know when the NULL scheduler decides to 
> allocate the pCPU?
>
> Cheers,
>



