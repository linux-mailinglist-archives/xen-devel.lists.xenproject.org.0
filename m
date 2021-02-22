Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D5F321A1F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88105.165533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEC4Z-0001Mp-Sw; Mon, 22 Feb 2021 14:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88105.165533; Mon, 22 Feb 2021 14:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEC4Z-0001MQ-Pu; Mon, 22 Feb 2021 14:20:27 +0000
Received: by outflank-mailman (input) for mailman id 88105;
 Mon, 22 Feb 2021 14:20:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEC4Y-0001MK-DL
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:20:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9c3f9c7-c2d7-44d5-854d-fa3691615cd1;
 Mon, 22 Feb 2021 14:20:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DDC39AE04;
 Mon, 22 Feb 2021 14:20:24 +0000 (UTC)
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
X-Inumbo-ID: b9c3f9c7-c2d7-44d5-854d-fa3691615cd1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614003625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0Jl9Bcg7pqGHTTJc5Uzuuj9YDW7llrK2+vjY5FAdrE=;
	b=YeDaQco3Mod0WzCZw8DIG6oTDohnVjzSDVqdZIM8+dWYCf1l8Rs3TPK2hlhFDwSRBDA7r+
	jt7z1brz01gjyMCp2eMJdxo0kilKh4C6EdMB8Di8cn1YbUCYnc7t6udZ7ZMFbnYkCE/jf7
	fPPAwP4TObF24O5VRvzwYeAsShi/CkE=
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
 <YDOW+ftkNsG2RH3C@Air-de-Roger> <YDO8CM0prPjoo/X1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d66da403-8054-0313-cf1e-cf3c539ce33a@suse.com>
Date: Mon, 22 Feb 2021 15:20:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDO8CM0prPjoo/X1@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.02.2021 15:13, Roger Pau Monné wrote:
> On Mon, Feb 22, 2021 at 12:35:21PM +0100, Roger Pau Monné wrote:
>> On Mon, Feb 22, 2021 at 11:27:07AM +0100, Jan Beulich wrote:
>>> Now that we guard the entire Xen VA space against speculative abuse
>>> through hypervisor accesses to guest memory, the argument translation
>>> area's VA also needs to live outside this range, at least for 32-bit PV
>>> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
>>> uniformly.
>>
>> Since you are double mapping the per-domain virtual area, won't it
>> make more sense to map it just once outside of the Xen virtual space
>> area? (so it's always using PML4_ADDR(511))
> 
> Right, that's not possible for PV 64bit domains because it's guest
> owned linear address space in that case.
> 
> It seems like paravirt_ctxt_switch_to will modify the root_pgt to set
> the PERDOMAIN_VIRT_START entry, does the same need to be done for
> PERDOMAIN2_VIRT_START?

I don't think so, no. Argument translation doesn't happen when
the restricted page tables are in use, and all other uses of
the per-domain area continue to use the "normal" VA.

> I would also consider giving the slot a more meaningful name, as
> PERDOMAIN2_VIRT_START makes it seem like a new per-domain scratch
> space, when it's just a different mapping of the existing physical
> memory.
> 
> Maybe PERDOMAIN_MIRROR_VIRT_START? Or PERDOMAIN_XLAT_VIRT_START?

XLAT would be too specific - while we use it for xlat only, it's
still all of the mappings that appear at the alternate addresses.
I did consider using MIRROR, but it got too long for my taste.
Now that I think about it maybe PERDOMAIN_ALT_VIRT_START would do?

Jan

