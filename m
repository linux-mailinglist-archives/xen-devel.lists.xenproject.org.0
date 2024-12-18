Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5329F6B15
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 17:27:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860653.1272658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwsc-0005ZL-Eq; Wed, 18 Dec 2024 16:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860653.1272658; Wed, 18 Dec 2024 16:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwsc-0005WE-CA; Wed, 18 Dec 2024 16:26:34 +0000
Received: by outflank-mailman (input) for mailman id 860653;
 Wed, 18 Dec 2024 16:26:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLCT=TL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tNwsa-0005W8-Up
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 16:26:32 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d637e279-bd5c-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 17:26:31 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1734539181203404.7330976319006;
 Wed, 18 Dec 2024 08:26:21 -0800 (PST)
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
X-Inumbo-ID: d637e279-bd5c-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1734539184; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PVJBldduZ/VLUmJfzEJt1zXQ2S+jdks7frJYUkBlpWTx0WFSXqtp3+nuTgiq4whs1LD+M0sihwCoI5oYvhg1blz9DHvR0BZBnoGuHg3e/YW+wzMxvJCliZb5waB4DeM/mCbUrF1tIuxpKXBAJgqPJKruOK8zVM2bPVZa+XG2ENI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734539184; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8zB+zX4DmURxURBLM6sSPJcsO4CAdsxHqlB+51YY/x8=; 
	b=L5oJ7Swr8B6jX+U80i26thV0vTS6vtZlj7Thj6WOnPn5PLjK9Lz6liw2PKJOmVosq6/MgEyE4jEJ7uix6O5ME0rNMvlxvHBov5Ne6mzTVSB4EzXRkn35S1pk4BG8S+/rOQNlWC6dEWDcGEGZCwCQJSyZg3QX38996ddhxYkD1GM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734539184;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8zB+zX4DmURxURBLM6sSPJcsO4CAdsxHqlB+51YY/x8=;
	b=TQvHZPQK2RZmffA+zm35E39wO6tl0utvzlb4YHlc8e4MK9rARtknbIgVvK9RNxhg
	bUI9E5f/gMtAvGB3TfRkYfEhAaBEcDUDGvm4x8/A1Ko5jPT9Fv4xn1go1ksWAKpLsWT
	NtqI6elgOnKlZSO11xjGWmQUL7rYQD+iaEotfDGo=
Message-ID: <1f17eea5-c3cd-4a78-9973-b5996bb1dd1e@apertussolutions.com>
Date: Wed, 18 Dec 2024 11:26:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
 <63b21760-7dea-423b-a9d8-64d213c40b2c@apertussolutions.com>
 <2423b111-0a3e-42f8-a11e-02d81fa75eb5@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2423b111-0a3e-42f8-a11e-02d81fa75eb5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hey Michal,

On 12/18/24 06:04, Michal Orzel wrote:
> Hi Daniel,
> 
> On 18/12/2024 02:17, Daniel P. Smith wrote:
>>
>>
>>> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>>>> Allow to build ARM configuration with support for initializing
>>>> hardware domain.
>>>> On ARM it is only possible to start hardware domain in multiboot mode, so
>>>> dom0less support is required. This is reflected by dependency on
>>>> DOM0LESS_BOOT
>>>> instead of directly depending on ARM config option.
>>
>>
>> Just to make sure my assumption is correct, you are looking to do a
>> multi-domain construction at boot time, with at least two domains. One
>> of those two domains is the "control domain" and one is the "hardware
>> domain", aka late hwdom except it's not constructed "late".
>>
>> If you want such a configuration, I would highly recommend you first
>> enable setting flask labels via dom0less (assuming it is not there)
> Speaking about dom0less and FLASK. A year ago, I did sent you (privately, through
> AMD hyperlaunch collab) my attempt to add minimal steps to enable setting FLASK policy
> for dom0less domUs. You then told me that you have a slightly different vision on how it
> should be done. Any update with that regard? TBH I though that you're going to add this
> support together with other hyperlaunch patches.

As I mentioned back in my March response, the concern I have with the 
patch you provided was with the layering violation. A security label is 
a flask-centric concept, at least currently, and thus not a concept you 
want to expose in the general XSM api. The correct way to get an XSM 
module's specific info, or translation, is to use the xsm_do_xsm_op(). I 
do feel that xsm_do_xsm_op() has a laying violation in its 
implementation, and is what I want to fix, it is still the correct 
interface. Priorities in meeting the core requirements AMD needs from 
hyperlaunch resulted in several abilities to fall to the wayside for the 
time being. I understand things need to move along, so I would prefer 
the use of existing interface that can be just updated when 
xsm_do_xsm_op() does get fixed up.

v/r,
dps

