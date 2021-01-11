Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766382F1439
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 14:22:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64827.114610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyx9Q-0007af-Vu; Mon, 11 Jan 2021 13:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64827.114610; Mon, 11 Jan 2021 13:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyx9Q-0007aI-SO; Mon, 11 Jan 2021 13:22:28 +0000
Received: by outflank-mailman (input) for mailman id 64827;
 Mon, 11 Jan 2021 13:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyx9P-0007aD-Oi
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 13:22:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31578468-fe18-432c-8bfb-6e2f4814acce;
 Mon, 11 Jan 2021 13:22:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1631BAC95;
 Mon, 11 Jan 2021 13:22:26 +0000 (UTC)
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
X-Inumbo-ID: 31578468-fe18-432c-8bfb-6e2f4814acce
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610371346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ce9jBy1xiKufqwkMxrp4/MUoXvNh6zc1YHJVM3UrHBY=;
	b=S8Oq8v6FgZohtOp1OgZ0f/u50uSaC/TJRfe3hOs9Vt53G21l/lpQaG7zS0jB4beZTkumgF
	2Di2wqYcMTGAfO05FdUvKEMUBht8oHNlMc2Cm1pNoLRk+8r7OYVtLnjRk1yTWtBel3JUUM
	PrI/lbUQ0nIBbYq2AiBkyXhG7X9XJZo=
Subject: Re: [PATCH 4/5] x86/PV: restrict TLB flushing after
 mod_l[234]_entry()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <eac90675-bcf3-3818-1f5f-f9825349e22c@suse.com>
 <20210111130020.ogpsylc7sh3wzb7i@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bee9e95-17f7-4089-4adf-29db50c5c4fd@suse.com>
Date: Mon, 11 Jan 2021 14:22:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111130020.ogpsylc7sh3wzb7i@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 14:00, Roger Pau Monné wrote:
> On Tue, Nov 03, 2020 at 11:57:33AM +0100, Jan Beulich wrote:
>> Just like we avoid to invoke remote root pt flushes when all uses of an
>> L4 table can be accounted for locally, the same can be done for all of
>> L[234] for the linear pt flush when the table is a "free floating" one,
>> i.e. it is pinned but not hooked up anywhere. While this situation
>> doesn't occur very often, it can be observed.
>>
>> Since this breaks one of the implications of the XSA-286 fix, drop the
>> flush_root_pt_local variable again and set ->root_pgt_changed directly,
>> just like it was before that change.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> LGTM, so:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> It would be good however if Andrew can give is opinion also, since he
> was the one to introduce such logic, and it's not trivial.

I can certainly wait some, also to hopefully get a comment on

>> ---
>> While adjusting the big comment that was added for XSA-286 I wondered
>> why it talks about the "construction of 32bit PV guests". How are 64-bit
>> PV guests different in this regard?

... this, but his email troubles make it hard to judge for how
long to wait.

>> @@ -4054,7 +4053,9 @@ long do_mmu_update(
>>                          break;
>>                      rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
>>                                        cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
>> -                    if ( !rc )
>> +                    if ( !rc &&
>> +                         (page->u.inuse.type_info & PGT_count_mask) >
>> +                         1 + !!(page->u.inuse.type_info & PGT_pinned) )
> 
> I think adding a macro to encapsulate the added condition would make
> the code clearer, maybe PAGETABLE_IN_USE, _LOADED or _ACTIVE?

A macro or inline function may certainly be nice (indeed I did
consider adding one), but I think here more than in some other
cases it is crucial that the name properly reflect what it
does. Unfortunately none of the ones you suggest nor any of the
ones I did consider will meet this requirement. In particular,
the check is about "is there any _other_ use". Hence I went
with the not very fortunate redundant open-coding.

Jan

