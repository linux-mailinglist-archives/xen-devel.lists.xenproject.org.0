Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301209BF156
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 16:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831208.1246404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hjo-0008Mr-DN; Wed, 06 Nov 2024 15:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831208.1246404; Wed, 06 Nov 2024 15:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hjo-0008L3-9P; Wed, 06 Nov 2024 15:14:28 +0000
Received: by outflank-mailman (input) for mailman id 831208;
 Wed, 06 Nov 2024 15:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQdK=SB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8hjm-0008Kx-61
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 15:14:26 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc208a99-9c51-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 16:14:21 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730906054875949.5198788689;
 Wed, 6 Nov 2024 07:14:14 -0800 (PST)
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
X-Inumbo-ID: cc208a99-9c51-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg0LjU3IiwiaGVsbyI6InNlbmRlcjMtb2YtbzU3LnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNjMjA4YTk5LTljNTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTA2MDYyLjA3MjY4NSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730906056; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ajOBBlmPpdiPMi4H+uFe75d8YpjPkn5PHh0LtqoZyVBj+U+DRQw1SnOE9kY0Xq51ZzqCMpvn2RndFGTKWaL7tKEHQpxtGatEHb80VUaZ3U1wiHSQXmdA8p5Vpqlpz+dAiMwq9lLZ9gyHMtBhgtMqBB+iLKa/utVJ2ImAbm0PZlM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730906056; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Woo7u0NI4cUUtonYX/cO6RK325mjxb/ZfHTPVVOKLvg=; 
	b=e2HQwdDIfRC90eGb7q9EARDAKvGj9q7NsnHaHZNpJ7AyXxTtkeHEgUm4q/9poLBNc6GpgDZqXfdfLtA9NJLkJPVm5ofFVabVSBlzDxvBgmBGZnw8gvR8wuKrjOphUqXyHjxWvIZq/t66IEODgXxomCEUiUIwGLqV9B6mYqIvePA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730906056;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Woo7u0NI4cUUtonYX/cO6RK325mjxb/ZfHTPVVOKLvg=;
	b=QeA1WiJqp/+q5eqGnuZ+FTAztxNZvsz1MsmTlOQmLzgJpEstQg/CeRlRF20Hr0+K
	EUYtk6metY+GUmyh3fWhiWO02qcRFUrJyv9LIG3BPG8zr9shvxXfiJSzc82cexoPN1s
	Li2srRO/lrbnBOs900Qoo4sDYnx7j7FQMbChAsNU=
Message-ID: <d9c96a68-4c34-4217-8700-b38c9cb78e84@apertussolutions.com>
Date: Wed, 6 Nov 2024 10:14:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/boot: eliminate module_map
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-3-dpsmith@apertussolutions.com>
 <2faf07d6-35a2-46c8-92db-8cf26a304800@citrix.com>
 <111206f7-2a87-4a31-a6fd-003b5941cb85@apertussolutions.com>
 <68d95851-0938-4efc-b885-de564600b40c@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <68d95851-0938-4efc-b885-de564600b40c@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/6/24 09:55, Andrew Cooper wrote:
> On 06/11/2024 2:50 pm, Daniel P. Smith wrote:
>> On 11/6/24 09:34, Andrew Cooper wrote:
>>> However, despite looking at this many times, I've only just realised...
>>> This semantically changes things in a direction that we won't want.
>>>
>>> Today, BOOTMOD_RAMDISK only happens a side effect of being "first
>>> BOOTMOD_UNKNOWN standing at the end".
>>>
>>> But the EFI boot code ought to set bi->type=RAMDISK explicitly from the
>>> ramdisk= argument (it can probably set type=MICROCODE too), and future
>>> plans with a large HL config probably will be similar.
>>>
>>> Anything which sets type=, and type=RAMDISK in particular, prior to
>>> early_microcode_load() excludes it from the search.  This is definitely
>>> not what we want.
>>>
>>>
>>> It's a latent bug for now, but I'd suggest keeping the plain for
>>> loop, with
>>>
>>>               /* Search anything unclaimed or likely to be a CPIO
>>> archive. */
>>>               if ( bm->type != BOOTMOD_UNKNOWN &&
>>>                    bm->type != BOOTMOD_RAMDISK )
>>>                   continue;
>>>
>>> as the selection criteria.  Probably also want to start from idx=0 to
>>> remove assumptions about the dom0 kernel.
>>>
>>> Thoughts?
>>
>> Yah, as much as it would be nice to use the helper, this is the
>> exception where there is a complex match condition to be handled. This
>> will be switched over to an explicit for loop.
> 
> This is simple enough, and I'm happy to fix this all up on commit.  Save
> it going around the loop yet again.

No objection on my part, as I was just going to make the changes as you 
suggested.

v/r,
dps

