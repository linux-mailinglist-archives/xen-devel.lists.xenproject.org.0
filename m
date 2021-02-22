Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C63032146B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 11:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87916.165149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8nE-0003rp-8x; Mon, 22 Feb 2021 10:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87916.165149; Mon, 22 Feb 2021 10:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE8nE-0003rP-5e; Mon, 22 Feb 2021 10:50:20 +0000
Received: by outflank-mailman (input) for mailman id 87916;
 Mon, 22 Feb 2021 10:50:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lE8nC-0003rK-7K
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 10:50:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e2e892f-94f6-4a4b-b68f-d951737117e3;
 Mon, 22 Feb 2021 10:50:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFD22ACBF;
 Mon, 22 Feb 2021 10:50:15 +0000 (UTC)
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
X-Inumbo-ID: 6e2e892f-94f6-4a4b-b68f-d951737117e3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613991016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSH6tyFf1SH97IvQoE4h8V3voyOjxH+M7HbTvsiMaJo=;
	b=K0hwPjY0ZIVQqG1L9OaxcafrMUSCvqHXyge0v/FiPDKmVbQ/lw0L3UmzpYX7czqs/9tYnP
	TA1wzFMM/W1z9mCtH4crwBkaRLwVsizg3D+W3LsxSJCoGKfSZuiXOsoDe/mUjiN0i4KnDL
	tcmsuvLQXArwRo/UcA881suLcl3bVLU=
Subject: Re: [PATCH for-4.15 v2] VMX: use a single, global APIC access page
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <a895386d-db14-2743-d8f9-09f9509a510a@suse.com>
 <dcada8be-a91d-87f0-c579-30f3c7e3607e@suse.com>
 <24623.61403.440917.434@mariner.uk.xensource.com>
 <dfdd4440-3c37-8cb5-b7d3-a86b7c697b2e@suse.com>
 <8B51B3E9-901A-491D-A54E-1F67641D03F0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5759150-e028-ac68-b8b5-8abcea02b5d9@suse.com>
Date: Mon, 22 Feb 2021 11:50:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8B51B3E9-901A-491D-A54E-1F67641D03F0@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 11:26, George Dunlap wrote:
> 
> 
>> On Feb 22, 2021, at 7:51 AM, Jan Beulich <JBeulich@suse.com> wrote:
>>
>> On 19.02.2021 18:05, Ian Jackson wrote:
>>> Jan Beulich writes ("Re: [PATCH v2] VMX: use a single, global APIC access page"):
>>>> While this patch was triggered not just by Julien's observation of
>>>> the early p2m insertion being a problem, but also many earlier
>>>> times of running into this odd code, it is - especially at this
>>>> stage - perhaps a possible option to split the change into just
>>>> the movement of the set_mmio_p2m_entry() invocation and all the
>>>> rest, in order to defer that rest until after 4.15.
>>>
>>> I infer that this contains a bugfix, but perhaps other
>>> changes/improvements too.
>>>
>>> George, I think you're our expert on this refcounting stuff - what do
>>> you think of this ?
>>>
>>> I guess my key question is whether this change will introduce risk by
>>> messing with the complex refcounting machineryt - or remove it by
>>> removing an interaction with the refcounting.
>>
>> If anything, then the latter, but largely neither afaict
> 
> Does it actually contain a bugfix?  It’s not at all clear to me from reading the description that it’s anything other than a clean-up.  If there’s something else that needs to be called out explicitly.

Hmm, yes. The change wanted making anyway, for a long time imo. Hence
when putting together the patch I forgot to call out that as a side
effect it addresses a memory leak, as reported by Julien. With the
splitting of the two changes that'll be necessarily mentioned. I'm
about to submit v3.

Jan

> It should indeed theoretically make things safer long-term; the current vlapic_page allocation is using special-case of the refcounting rules, making it much more prone to being the subject of an “oversight”.  But at this point in the release we don’t have much time at all to shake out any potential bugs in the new implementation; as such I’d consider anything other than the minimum necessary to fix a bug to be not worth it.
> 
>  -George
> 


