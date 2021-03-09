Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80508332B79
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 17:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95606.180545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJetk-0004Jc-UJ; Tue, 09 Mar 2021 16:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95606.180545; Tue, 09 Mar 2021 16:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJetk-0004JD-Qo; Tue, 09 Mar 2021 16:07:52 +0000
Received: by outflank-mailman (input) for mailman id 95606;
 Tue, 09 Mar 2021 16:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJetj-0004J6-5H
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 16:07:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2900864-d6fe-44a5-8d7b-393045be25e5;
 Tue, 09 Mar 2021 16:07:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14678AF0C;
 Tue,  9 Mar 2021 16:07:49 +0000 (UTC)
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
X-Inumbo-ID: a2900864-d6fe-44a5-8d7b-393045be25e5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615306069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuzxC2VAAcoZxRiP1UTz555AsK1O/NCW3/YWheLLu1k=;
	b=AYzLSd21doUDbJ4gcjLWqWTzSlj62q5xMcC2/8nLMcHSwuMgQSR6VEijPJblXPMAOufBvT
	+ATvXh6wRHJFzxwiHdqC8zGyQpiM4HISQgMHnkEFQtVOSaqNfVrz7BJFAmELIYOqAOQ1C9
	PgJm7FtQhlHQD+RbyLmdskk5n10FxrQ=
Subject: Re: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
 <YEXmvp02UvvY8Fve@Air-de-Roger>
 <1f19ced7-183b-8f08-3a90-c06039e053a6@suse.com>
 <YEYUbGw5J1VMnuxd@Air-de-Roger>
 <b8ab7ac3-036b-d226-dc82-c61bf42f13d6@suse.com>
 <YEdLO04upNrxNTmI@Air-de-Roger>
 <204d73ec-a46a-6cef-9bc4-4219a7d00350@suse.com>
 <YEd6GTXJqRIjijl6@Air-de-Roger>
 <6dd26887-4246-8c5d-bf94-de03657230c1@suse.com>
 <YEeSE0oWzY4jUN6G@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eafaee05-cdf8-bea6-65d7-7a9b8e1dfb3d@suse.com>
Date: Tue, 9 Mar 2021 17:07:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEeSE0oWzY4jUN6G@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.03.2021 16:19, Roger Pau Monné wrote:
> On Tue, Mar 09, 2021 at 03:50:59PM +0100, Jan Beulich wrote:
>> On 09.03.2021 14:37, Roger Pau Monné wrote:
>>> Right. So given this awkward position Xen is in, we should maybe make
>>> the lack of #GP injection as a result of an MSR access when no handler
>>> is set formally part of the ABI and written down somewhere?
>>>
>>> It's not ideal, but at the end of day PV is 'our' own architecture,
>>> and given that this workaround will be enabled by default, and that we
>>> won't be able to turn it off we should have it written down as part of
>>> the ABI.
>>>
>>> If you agree with this I'm fine with not injecting a #GP at all unless
>>> the handler is set for PV, like you proposed in your first patch. IMO
>>> it's not ideal, but it's better if it's a consistent behavior and
>>> clearly written down in the public headers (likely next to the
>>> hypercall used to setup the #GP handler).
>>>
>>> I know this can be seen as broken behavior from an x86 perspective,
>>> but again PV is already different from x86.
>>
>> I'm certainly not opposed to spelling this out somewhere; iirc you
>> said the other day that you couldn't spot a good place. I can't think
>> of a good place either.
> 
> After looking some more, I think placing such comment next to
> HYPERVISOR_set_trap_table (in arch-x86/xen.h) would be fine.
> 
>> Furthermore before we spell out anything we
>> (which specifically includes Andrew) need to settle on the precise
>> behavior we want. I did suggest earlier that I could see us tighten
>> the condition, and there are many possible variations. For example we
>> could record whether a #GP handler was ever installed, so we wouldn't
>> return back to the relaxed behavior in case a guest zapped its handler
>> again. But for behavior like this the immediate question is going to
>> be what effect migration (or saving/restoring) of the guest ought to
>> have.
> 
> Replying to the save/restore part: this is covered by my patch. Any
> restore (or incoming live migration) from a source that doesn't have
> msr_relaxed support will get that option enabled by default, so that
> guests migrated from previous Xen versions don't see a change in MSR
> access behavior. That applies to both PV and HVM guests (unless I have
> messed things up in my patch).

Well, yes, that's for your changes. But here the question is about
mine (and remember we didn't settle on the precise condition(s) yet,
so the migration aspect may not be relevant in the end).

Jan

