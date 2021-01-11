Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626E2F184B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 15:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64904.114796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyBH-00065x-K7; Mon, 11 Jan 2021 14:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64904.114796; Mon, 11 Jan 2021 14:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyBH-00065Y-Gz; Mon, 11 Jan 2021 14:28:27 +0000
Received: by outflank-mailman (input) for mailman id 64904;
 Mon, 11 Jan 2021 14:28:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyyBF-00065T-8B
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 14:28:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f68eeec-0534-480e-9ae3-e530546185a1;
 Mon, 11 Jan 2021 14:28:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0290AB7A;
 Mon, 11 Jan 2021 14:28:23 +0000 (UTC)
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
X-Inumbo-ID: 0f68eeec-0534-480e-9ae3-e530546185a1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610375303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nps04r6eZe99kw28qxfrRscolLQlQOpmFHkOAxMFNLs=;
	b=o8SDwZQc0N0Bsc2LZyGrqrBHSIiEt/KMlSLn9j71mAWxR4aCkr6IUO6G38PiF39ZYaymSi
	U5+5vU6jGksgr9rYZ/om1Icp6MnWwYh8BdNtVARP5AiP4WGxZSUIKjb4KHX5HZokaxKHsL
	z8Gz4RGaHy73eHEfttprCo/hbW74SG0=
Subject: Re: [PATCH 5/5] x86/PV32: avoid TLB flushing after mod_l3_entry()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <181be414-49b4-3bd3-bb55-cef443191e60@suse.com>
 <20210111142308.3fowkgtvqy4dmnli@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf55e504-38f2-479d-524d-eb53e2f58b9b@suse.com>
Date: Mon, 11 Jan 2021 15:28:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111142308.3fowkgtvqy4dmnli@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 15:23, Roger Pau Monné wrote:
> On Tue, Nov 03, 2020 at 11:58:16AM +0100, Jan Beulich wrote:
>> 32-bit guests may not depend upon the side effect of using ordinary
>> 4-level paging when running on a 64-bit hypervisor. For L3 entry updates
>> to take effect, they have to use a CR3 reload. Therefore there's no need
>> to issue a paging structure invalidating TLB flush in this case.
> 
> I assume it's fine for the Xen linear page tables to be lkely out of
> sync during the windows between the entry update and the CR3 reload?

Yes, because ...

> I wonder, won't something similar also apply to 64bit and L4 entries?

... unlike 64-bit paging, PAE paging special cases the treatment
of the 4 top level table entries. On bare metal they get loaded
by the CPU upon CR3 load, not when walking page tables.

Jan

