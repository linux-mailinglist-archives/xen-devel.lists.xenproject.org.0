Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B52B19F5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 12:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26384.54703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdX8A-0008Si-WC; Fri, 13 Nov 2020 11:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26384.54703; Fri, 13 Nov 2020 11:20:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdX8A-0008SJ-T4; Fri, 13 Nov 2020 11:20:38 +0000
Received: by outflank-mailman (input) for mailman id 26384;
 Fri, 13 Nov 2020 11:20:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdX89-0008SE-R2
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:20:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43b4a371-7853-4d07-983d-c36a34d06fc4;
 Fri, 13 Nov 2020 11:20:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DDECAAEFB;
 Fri, 13 Nov 2020 11:20:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdX89-0008SE-R2
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:20:37 +0000
X-Inumbo-ID: 43b4a371-7853-4d07-983d-c36a34d06fc4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 43b4a371-7853-4d07-983d-c36a34d06fc4;
	Fri, 13 Nov 2020 11:20:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605266435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLQ9FVom6R6KKOTePpK0JU7y8/s9rbU+RkGF1j+/oRQ=;
	b=dWJ1cu8+k+o7bhRvIQwO188OTvg/oK7KFot9HskOrlTJ4bKbTWOcKQbi45d9/fgOWqboUI
	gQrelVR5VvWyD12hr8LFNVLjh4v86BNCKE+QD+TWvw1I8SnwFOgcN/xQVWJmk723yVAneh
	aQvHzUkVPDeL7mlzgKtismHKYMns82E=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DDECAAEFB;
	Fri, 13 Nov 2020 11:20:34 +0000 (UTC)
Subject: Re: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
 <61ea02e0-bdd4-5a0a-dd6f-b22e806e6d1e@suse.com>
 <cd16e1f2-849d-ec12-3325-382b8f6689ff@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e08459d9-dd0a-7875-5d12-d374c69fe775@suse.com>
Date: Fri, 13 Nov 2020 12:20:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <cd16e1f2-849d-ec12-3325-382b8f6689ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.11.2020 12:09, Oleksandr wrote:
> On 12.11.20 12:58, Jan Beulich wrote:
>> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>>> @@ -855,7 +841,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
>>>   
>>>       domain_pause(d);
>>>   
>>> -    p2m_set_ioreq_server(d, 0, s);
>>> +    arch_hvm_destroy_ioreq_server(s);
>> Iirc there are plans to rename hvm_destroy_ioreq_server() in the
>> course of the generalization. If so, this arch hook would imo
>> better be named following the new scheme right away.
> Could you please clarify, are you speaking about the plans discussed there
> 
> "[PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved 
> function names"?
> 
> Copy text for the convenience:
> AT least some of the functions touched here would be nice to be
> moved to a more consistent new naming scheme right away, to
> avoid having to touch all the same places again. I guess ioreq
> server functions would be nice to all start with ioreq_server_
> and ioreq functions to all start with ioreq_. E.g. ioreq_send()
> and ioreq_server_select().
> 
> or some other plans I am not aware of?
> 
> 
> What I really want to avoid with IOREQ enabling work is the round-trips 
> related to naming things, this patch series
> became quite big (and consumes som time to rebase and test it) and I 
> expect it to become bigger.
> 
> So the arch_hvm_destroy_ioreq_server() should be 
> arch_ioreq_server_destroy()?

I think so, yes. If you want to avoid doing full patches, how
about you simply list the functions / variables you plan to
rename alongside the intended new names? Would likely be easier
for all involved parties.

>>> @@ -1215,7 +1153,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>>       struct hvm_ioreq_server *s;
>>>       unsigned int id;
>>>   
>>> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>>> +    if ( !arch_hvm_ioreq_destroy(d) )
>> There's no ioreq being destroyed here, so I think this wants
>> renaming (and again ideally right away following the planned
>> new scheme).
> Agree that no ioreq being destroyed here. Probably 
> ioreq_server_check_for_destroy()?
> I couldn't think of a better name.

"check" implies no change (and d ought to then be const struct
domain *). With the containing function likely becoming
ioreq_server_destroy_all(), arch_ioreq_server_destroy_all()
would come to mind, or arch_ioreq_server_prepare_destroy_all().

>>> +static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
>>> +                                                   ioservid_t id,
>>> +                                                   uint32_t type,
>>> +                                                   uint32_t flags)
>>> +{
>>> +    struct hvm_ioreq_server *s;
>>> +    int rc;
>>> +
>>> +    if ( type != HVMMEM_ioreq_server )
>>> +        return -EINVAL;
>>> +
>>> +    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>>> +        return -EINVAL;
>>> +
>>> +    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
>>> +
>>> +    s = get_ioreq_server(d, id);
>>> +
>>> +    rc = -ENOENT;
>>> +    if ( !s )
>>> +        goto out;
>>> +
>>> +    rc = -EPERM;
>>> +    if ( s->emulator != current->domain )
>>> +        goto out;
>>> +
>>> +    rc = p2m_set_ioreq_server(d, flags, s);
>>> +
>>> + out:
>>> +    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>> +
>>> +    if ( rc == 0 && flags == 0 )
>>> +    {
>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> I realize I may be asking too much, but would it be possible if,
>> while moving code, you made simple and likely uncontroversial
>> adjustments like adding const here? (Such adjustments would be
>> less desirable to make if they increased the size of the patch,
>> e.g. if you were touching only nearby code.)
> This function as well as one located below won't be moved to this header
> for the next version of patch.
> 
> ok, will add const.

Well, if you don't move the code, then better keep the diff small
and leave things as they are.

Jan

