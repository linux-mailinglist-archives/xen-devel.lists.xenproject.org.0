Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B62B18AA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 10:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26259.54492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdVlS-0007J9-7G; Fri, 13 Nov 2020 09:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26259.54492; Fri, 13 Nov 2020 09:53:06 +0000
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
	id 1kdVlS-0007Ik-3i; Fri, 13 Nov 2020 09:53:06 +0000
Received: by outflank-mailman (input) for mailman id 26259;
 Fri, 13 Nov 2020 09:53:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdVlQ-0007IE-Hf
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 09:53:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb3613bf-b9b5-4331-800e-4f3210143ac6;
 Fri, 13 Nov 2020 09:53:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0AB1AE44;
 Fri, 13 Nov 2020 09:53:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdVlQ-0007IE-Hf
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 09:53:04 +0000
X-Inumbo-ID: eb3613bf-b9b5-4331-800e-4f3210143ac6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb3613bf-b9b5-4331-800e-4f3210143ac6;
	Fri, 13 Nov 2020 09:53:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605261182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NwDVrFfky0ASlO5W+e+NuHFVPCB6tofe3lMJsBD2Gik=;
	b=IhfMW9DKZaVILdlnQ8valjr/ywAhrbQP3tZwOpcEBaLi3gmZnQUEgnYdKSsdUMf36KmiI9
	97GLPU59UfiRdf7KMVm63YgRj3C6xOjU3Jk5tUQPD0+Z0x5OZiep/wjZy/PU885UnbZpvg
	d96SSaFqwmhshRvPyDoxJTOY3ectxrA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D0AB1AE44;
	Fri, 13 Nov 2020 09:53:02 +0000 (UTC)
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
To: Tim Deegan <tim@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
 <20201110135944.hbsojy6eeyw53has@Air-de-Roger>
 <d73234b0-f22e-0783-3fbe-759ccb0ecc48@suse.com>
 <20201111121730.pblsf6inot5gixfc@Air-de-Roger>
 <7f916527-9a9c-8afe-5e5c-781554d1bd73@suse.com>
 <20201112130709.r3acpkrkyck6arul@Air-de-Roger>
 <51e646d4-3e1b-3698-c649-a39840275ec9@suse.com>
 <20201112175221.GB43943@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40055cf5-ab16-ad73-4446-3f8f730a6613@suse.com>
Date: Fri, 13 Nov 2020 10:52:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201112175221.GB43943@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.11.2020 18:52, Tim Deegan wrote:
> At 15:04 +0100 on 12 Nov (1605193496), Jan Beulich wrote:
>> On 12.11.2020 14:07, Roger Pau Monné wrote:
>>> On Thu, Nov 12, 2020 at 01:29:33PM +0100, Jan Beulich wrote:
>>>> I agree with all this. If only it was merely about TLB flushes. In
>>>> the shadow case, shadow_blow_all_tables() gets invoked, and that
>>>> one - looking at the other call sites - wants the paging lock held.
> [...]
>>> The post hook for shadow could pick the lock again, as I don't think
>>> the removal of the tables needs to be strictly done inside of the same
>>> locked region?
>>
>> I think it does, or else a use of the now stale tables may occur
>> before they got blown away. Tim?
> 
> Is this the call to shadow_blow_tables() in the write_p2m_entry path?

Yes.

> I think it would be safe to drop and re-take the paging lock there as
> long as the call happens before the write is considered to have
> finished.
> 
> But it would not be a useful performance improvement - any update that
> takes this path is going to be very slow regardless.  So unless you
> have another pressing reason to split it up, I would be inclined to
> leave it as it is.  That way it's easier to see that the locking is
> correct.

Thanks for the clarification.

Roger - what's your view at this point?

Jan

