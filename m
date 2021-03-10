Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B193339D3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95951.181204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvwz-00012f-9M; Wed, 10 Mar 2021 10:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95951.181204; Wed, 10 Mar 2021 10:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJvwz-00012I-5l; Wed, 10 Mar 2021 10:20:21 +0000
Received: by outflank-mailman (input) for mailman id 95951;
 Wed, 10 Mar 2021 10:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJvwx-00012D-UX
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:20:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d56b667a-1de8-4d05-8854-626f3910cfe3;
 Wed, 10 Mar 2021 10:20:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48FCFAC24;
 Wed, 10 Mar 2021 10:20:17 +0000 (UTC)
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
X-Inumbo-ID: d56b667a-1de8-4d05-8854-626f3910cfe3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615371617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W+LCkCzG3w3GXCtXrY1m7wP3TiuaQHK4fpn65yDyRWw=;
	b=C5mDVrvjISQFRPrX08rPJm3NOJUIdY0VafVFVhvTlwZ1vJOFsJi5qfAMrSctH7QLNnMGkt
	gIscOjxijQHUNgBHHZJVVzB7YJUELRgVWYtDJPX/wER9iKzBo/mIfqy8I/c5uQ7XdVN0n4
	kL5TYFRllaIDYMsGkzWH9pAwFnvDtDQ=
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210309105634.7200-1-roger.pau@citrix.com>
 <dbf31ab3-bae4-0b86-9bb6-bdd4e66e155b@citrix.com>
 <YEiSXWDSo4WVuwas@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0371bfa5-7dd5-9ce2-ca1d-20e7f850938d@suse.com>
Date: Wed, 10 Mar 2021 11:20:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEiSXWDSo4WVuwas@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.03.2021 10:33, Roger Pau Monné wrote:
> On Tue, Mar 09, 2021 at 07:13:26PM +0000, Andrew Cooper wrote:
>> On 09/03/2021 10:56, Roger Pau Monne wrote:
>>> --- a/xen/include/public/arch-x86/xen.h
>>> +++ b/xen/include/public/arch-x86/xen.h
>>> @@ -304,6 +304,14 @@ struct xen_arch_domainconfig {
>>>                                       XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
>>>                                       XEN_X86_EMU_VPCI)
>>>      uint32_t emulation_flags;
>>> +
>>> +/*
>>> + * Select whether to use a relaxed behavior for accesses to MSRs not explicitly
>>> + * handled by Xen instead of injecting a #GP to the guest. Note this option
>>> + * doesn't allow the guest to read or write to the underlying MSR.
>>> + */
>>> +#define XEN_X86_MSR_RELAXED (1u << 0)
>>> +    uint32_t domain_flags;
>>
>> The domain prefix is somewhat redundant, given the name of the structure
>> or the hypercall it is used for.  OTOH, 'flags' on its own probably
>> isn't ok.  Thoughts on misc_flags?
> 
> I'm fine with it, will change unless Jan objects to the name.

I'm fine with the suggestion.

Jan

