Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81B28E3E5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 18:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6824.17957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjEH-0002nI-2w; Wed, 14 Oct 2020 16:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6824.17957; Wed, 14 Oct 2020 16:02:17 +0000
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
	id 1kSjEG-0002mt-Vk; Wed, 14 Oct 2020 16:02:16 +0000
Received: by outflank-mailman (input) for mailman id 6824;
 Wed, 14 Oct 2020 16:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSjEF-0002mo-NG
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:02:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c901b96e-ee31-4c5b-8169-8631ed022c1f;
 Wed, 14 Oct 2020 16:02:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFF69AB95;
 Wed, 14 Oct 2020 16:02:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSjEF-0002mo-NG
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:02:15 +0000
X-Inumbo-ID: c901b96e-ee31-4c5b-8169-8631ed022c1f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c901b96e-ee31-4c5b-8169-8631ed022c1f;
	Wed, 14 Oct 2020 16:02:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602691334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TM75gjrOKOQOYIVqj36yGiifNPOCac22GvcGkd56HZQ=;
	b=PeU8k3QgW50o68hEKqdxQyLymApfVqrPafynzrrvPWhGETNQnFZBavDowbuQR3+zXt91ap
	7BgnN73O7qhjypDFDrKmPrOqbEGPcsxJoYc+Jwc51AxrGYyswi3qnx7v0aGSEnatw0Jx1k
	+OMNGUNmE/TMSrJO2TyasiPyQ1JCnqo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EFF69AB95;
	Wed, 14 Oct 2020 16:02:13 +0000 (UTC)
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201014153150.83875-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
Date: Wed, 14 Oct 2020 18:02:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201014153150.83875-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.10.2020 17:31, Jason Andryuk wrote:
> Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  A
> kernel build CONFIG_PVH=y CONFIG_PV=n lacks the note.  In this case,
> virt_entry will be UNSET_ADDR, overwritten by the ELF header e_entry,
> and fail the check against the virt address range.
> 
> Change the code to only check virt_entry against the virtual address
> range if it was set upon entry to the function.

Not checking at all seems wrong to me. The ELF spec anyway says
"virtual address", so an out of bounds value is at least suspicious.

> Maybe the overwriting of virt_entry could be removed, but I don't know
> if there would be unintended consequences where (old?) kernels don't
> have an elfnote, but do have an in-range e_entry?  The failing kernel I
> just looked at has an e_entry of 0x1000000.

And if you dropped the overwriting, what entry point would we use
in the absence of an ELF note?

I'd rather put up the option of adjusting the entry (or the check),
if it looks like a valid physical address.

Jan

