Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E432F01F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 17:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93894.177352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDNa-0004VI-K6; Fri, 05 Mar 2021 16:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93894.177352; Fri, 05 Mar 2021 16:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIDNa-0004Ut-Gi; Fri, 05 Mar 2021 16:32:42 +0000
Received: by outflank-mailman (input) for mailman id 93894;
 Fri, 05 Mar 2021 16:32:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lIDNZ-0004UY-DG
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 16:32:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c3bcc94-cee5-42d0-be22-89ba5e19e16c;
 Fri, 05 Mar 2021 16:32:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CE72ACCF;
 Fri,  5 Mar 2021 16:32:39 +0000 (UTC)
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
X-Inumbo-ID: 0c3bcc94-cee5-42d0-be22-89ba5e19e16c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614961959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KQ2/vWMUuKzn9F3oHXv1LsJAwdrsxvRMcVPYk52WAWI=;
	b=bZ44BAmW4XcM1txeK4Q79K1bmCKG6D47K87eNyEZd9KyrCJYpkE/NigiJR2mPE/6O50GcF
	wmNt8WEtywjeSngbELztO+ABVNX9oSxAGbOxt+ZX2OpniF4YhDqugBeXMcbAzWcglC8jJz
	zpY5vejISlnyFb+LXc72cTPUsNPSB5Y=
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
 <2e09dfd0-5da4-bdcc-900b-d40a112d832b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f2a1a97-f062-fa2a-5f5c-ea776e463c44@suse.com>
Date: Fri, 5 Mar 2021 17:32:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2e09dfd0-5da4-bdcc-900b-d40a112d832b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.03.2021 16:47, Andrew Cooper wrote:
> On 05/03/2021 15:37, Jan Beulich wrote:
>> We can't make correctness of our own behavior dependent upon a
>> hypervisor underneath us correctly telling us the true physical address
>> with hardware uses. Without knowing this, we can't be certain reserved
>> bit faults can actually be observed. Therefore, besides evaluating the
>> number of address bits when deciding whether to use the optimization,
>> also check whether we're running virtualized ourselves.
> 
> I think it would be helpful to point out why we can't even probe at boot
> - the behaviour may genuinely change as we migrate, and if we ever end
> up on an IceLake system levelled down for compatibility with older CPUs,
> the "paddr_bits < PADDR_BITS" check will malfunction in an unsafe way.

I've added a sentence to this effect.

>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

