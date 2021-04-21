Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B529F366948
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114388.217992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZAA2-0001nz-VC; Wed, 21 Apr 2021 10:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114388.217992; Wed, 21 Apr 2021 10:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZAA2-0001nZ-Rm; Wed, 21 Apr 2021 10:32:46 +0000
Received: by outflank-mailman (input) for mailman id 114388;
 Wed, 21 Apr 2021 10:32:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZAA0-0001nU-VF
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:32:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9e5d131-4018-4409-a45e-30a201c77d5a;
 Wed, 21 Apr 2021 10:32:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39A4EAEE6;
 Wed, 21 Apr 2021 10:32:43 +0000 (UTC)
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
X-Inumbo-ID: c9e5d131-4018-4409-a45e-30a201c77d5a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619001163; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSrOHyZFETTy+Q5cNQUqkrntrgvqKpTcWutAaxCAQa8=;
	b=kN94TTupyZaVedPxiUy2BHdG9BKXY946uj7zVOoKwDmLiVOyxpfFh+e0sjaumqg3Iv/6NA
	rB9IaLfyqy+z/9d07ipwBHgiE/CVSSev0WY1STJJWrX+bRMCM6OAt6UF1HIb3go4HdQCu8
	UPtukIi3vBlAS7lmO0+mk3K5Xeqifz4=
Subject: Re: [PATCH 2/8] x86/EFI: sections may not live at VA 0 in PE binaries
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <5d7c61b0-8441-dccc-4917-cc8a436fd96f@suse.com>
 <YH/nzmkQMhsJE4mw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <deee924d-f124-5563-727a-71ddb39403f3@suse.com>
Date: Wed, 21 Apr 2021 12:32:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YH/nzmkQMhsJE4mw@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 10:52, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 11:44:45AM +0200, Jan Beulich wrote:
>> PE binaries specify section addresses by (32-bit) RVA. GNU ld up to at
>> least 2.36 would silently truncate the (negative) difference when a
>> section is placed below the image base. Such sections would also be
>> wrongly placed ahead of all "normal" ones. Since, for the time being,
>> we build xen.efi with --strip-debug anyway, .stab* can't appear. And
>> .comment has an entry in /DISCARD/ already anyway in the EFI case.
>>
>> Because of their unclear origin, keep the directives for the ELF case
>> though.
> 
> It's my understadng thonse sections are only there for debug purposes,
> and never part of the final xen binary as they are stripped?
> 
> Could we maybe remove the section load address of 0 and instead just
> use the (NOLOAD) directive?

(NOLOAD) is meaningless for PE.

> Does it really matter to place them at address 0?

That's the convention for ELF, and also what ld defaults to for debugging
sections.

> I also wonder, is this change fixing some existing bug, or it's just a
> cleanup change?

If there were sections at 0, the resulting PE binary would end up broken.
Prior to binutils 2.37 this brokenness is silent, i.e. the linker doesn't
issue any form of diagnostic. The change therefore is addressing a latent
issue - if any such section started being non-empty, we'd be in trouble.

> I also only see the .comment section in my binary output, so maybe
> it's fine to just remove them from the script?

Which binary are you referring to - ELF or PE? In the former case, yes,
that's what the statement is for. In the latter case I can't see how this
would be, with .comment being explicitly part of /DISCARD/ in that case.

> Does the Arm linker script need a similar treatment?

No idea - they don't use ld to produce a PE binary. In fact during my
work on the binutils side for all of this, I was given a hint that on Arm
linking ELF objects into PE output may currently not be possible at all.

Jan

