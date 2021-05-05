Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B737391C
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 13:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123006.232054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFSI-0006ul-Ny; Wed, 05 May 2021 11:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123006.232054; Wed, 05 May 2021 11:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFSI-0006rY-KE; Wed, 05 May 2021 11:12:38 +0000
Received: by outflank-mailman (input) for mailman id 123006;
 Wed, 05 May 2021 11:12:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leFSH-0006rS-M2
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 11:12:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0a2f8d9-1c02-4594-82fc-598509bff442;
 Wed, 05 May 2021 11:12:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7ECCCB172;
 Wed,  5 May 2021 11:12:35 +0000 (UTC)
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
X-Inumbo-ID: b0a2f8d9-1c02-4594-82fc-598509bff442
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620213155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5cRZYvjUUKBn+qHSaA9gkKGP4aqsnrsEZ1ZGLLWmiEw=;
	b=NL3PaJNeR+prAtq29hkpHudH1DDcvCQOD5O4homxXn9lmXs/QkwiCYViPfSMCGH/CX680t
	TJZURjtpLF4PqdWemtsWerQGg3V9r7V5V5/22lCnjQt+MtXIeBehISgJAh+SDdpFMSYBAI
	ZGIA3WZpEQIZ2PTT/zLdUr7NZ9mF/s0=
Subject: Re: [PATCH v4] gnttab: defer allocation of status frame tracking
 array
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <74048f89-fee7-06c2-ffd5-6e5a14bdf440@suse.com>
 <4450085e-be97-a1ba-dbd8-c72468406fd5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d0dc687-d667-95ea-18a3-a6d7da9529d6@suse.com>
Date: Wed, 5 May 2021 13:12:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <4450085e-be97-a1ba-dbd8-c72468406fd5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.05.2021 12:49, Andrew Cooper wrote:
> On 04/05/2021 09:42, Jan Beulich wrote:
>> This array can be large when many grant frames are permitted; avoid
>> allocating it when it's not going to be used anyway, by doing this only
>> in gnttab_populate_status_frames(). While the delaying of the respective
>> memory allocation adds possible reasons for failure of the respective
>> enclosing operations, there are other memory allocations there already,
>> so callers can't expect these operations to always succeed anyway.
>>
>> As to the re-ordering at the end of gnttab_unpopulate_status_frames(),
>> this is merely to represent intended order of actions (shrink array
>> bound, then free higher array entries). If there were racing accesses,
>> suitable barriers would need adding in addition.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Nack.
> 
> The argument you make says that the grant status frames is "large
> enough" to care about not allocating.  (I frankly disagree, but that
> isn't relevant to my to my nack).
> 
> The change in logic here moves a failure in DOMCTL_createdomain, to
> GNTTABOP_setversion.  We know, from the last minute screwups in XSA-226,
> that there are versions of Windows and Linux in the field, used by
> customers, which will BUG()/BSOD when GNTTABOP_setversion doesn't succeed.
> 
> You're literally adding even more complexity to the grant table, to also
> increase the chance of regressing VMs in the wild.  This is not ok.

To me, arguing like this is not okay. The code should have been written
like this in the first place. There's absolutely no reason to allocate
memory up front which is never going to be used.

> The only form of this patch which is in any way acceptable, is to avoid
> the allocation when you know *in DOMCTL_createdomain* that it will never
> be needed by the VM.  So far, that is from Kconfig and/or the command
> line options.

Well, may I remind you that this is how this patch had started? And
may I further remind you that it was Julien who asked me to convert to
this model? And may I then remind you that I already did suggest that
the two of you should come to an agreement? I'm not going to act as a
moderator in this process. But I insist that it is really bad practice
to drop the ball and leave patches (and alike) hanging in the air.

Just to be clear - in case I don't observe the two of you agreeing on
whichever outcome in the foreseeable future, I'm going to make attempts
to get another opinion from yet another REST maintainer. Since I can
live with both forms of the change (but would prefer the more
aggressive savings as done in this version), I can also live with
whatever 4th opinion would surface. But in case the result was not in
your favor, I'd then consider your Nack overruled.

Jan

