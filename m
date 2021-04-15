Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B4360FAF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 18:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111385.213036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4Su-0003M3-Io; Thu, 15 Apr 2021 16:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111385.213036; Thu, 15 Apr 2021 16:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4Su-0003Le-FW; Thu, 15 Apr 2021 16:03:36 +0000
Received: by outflank-mailman (input) for mailman id 111385;
 Thu, 15 Apr 2021 16:03:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX4Ss-0003LW-QV
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 16:03:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b7448f6-069a-43e6-baf1-1f028ef5f7de;
 Thu, 15 Apr 2021 16:03:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C532B2D8;
 Thu, 15 Apr 2021 16:03:33 +0000 (UTC)
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
X-Inumbo-ID: 8b7448f6-069a-43e6-baf1-1f028ef5f7de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618502613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UzfE0PaUp7J2RT+ZAV06P54hrkqD2rJJVto8fz06cZg=;
	b=U+ktEh0BNlYGlOjWJvAMbePAvLnmwlnpaqTg54GRltPe9yVosLpgbnohbnh1fSC5hRBeiW
	ZQ8RiRDYsHM/ZTnk/bH6oN4Q5M/egIzVb2HHcmRwYeiQ5gC+zQv1D1hI864Lnr3kbcJyZb
	2T9dOhkkrfKHKregWPXscqq9Nx1h8zE=
Subject: Re: [PATCH] x86/shadow: adjust callback arrays
To: Tim Deegan <tim@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <621aa6f6-d7f8-25eb-9aeb-f181a9cb3bbc@suse.com>
 <YHhi19OqHN2cqMBA@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20c9d5b3-6194-0e55-d6a1-94fd3323bb69@suse.com>
Date: Thu, 15 Apr 2021 18:03:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHhi19OqHN2cqMBA@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 17:59, Tim Deegan wrote:
> At 12:42 +0200 on 12 Apr (1618231332), Jan Beulich wrote:
>> Some of them have entries with stale comments. Rather than correcting
>> these comments, re-arrange how these arrays get populated, shrinking
>> their sizes at the same time (by omitting trailing NULL entries: Use
>> dedicated element initializers, serving the purpose of what the
>> comments did so far. This then also makes these arrays independent of
>> the actual ordering of the individual SH_type_*.
>>
>> While tightening respective ASSERT()s in hash_{vcpu,domain}_foreach(),
>> also tighten related ones in shadow_hash_{insert,delete}().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Looks good, but please leave the arrays at full size.  With the full
> array, a bug could lead to an assertion failure or NULL deref; with
> a short array it could mean following a bogus funtion pointer.
> 
> With that change, Acked-by: Tim Deegan <tim@xen.org>

Thanks, but let me ask back about which of the two possble meanings
of "full" you mean: Dimensioned by SH_type_unused, or dimensioned
by SH_type_max_shadow + 1? The former would leave the arrays as they
are now, while the latter would shrink them a little.

Jan

