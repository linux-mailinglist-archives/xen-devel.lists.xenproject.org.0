Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C181303E04
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74975.134851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4O0y-0005x0-1i; Tue, 26 Jan 2021 13:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74975.134851; Tue, 26 Jan 2021 13:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4O0x-0005wb-UV; Tue, 26 Jan 2021 13:04:11 +0000
Received: by outflank-mailman (input) for mailman id 74975;
 Tue, 26 Jan 2021 13:04:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4O0w-0005wW-J3
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:04:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fd5eabf-0996-4c8f-b796-1374f41c003a;
 Tue, 26 Jan 2021 13:04:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE86AAD6B;
 Tue, 26 Jan 2021 13:04:08 +0000 (UTC)
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
X-Inumbo-ID: 8fd5eabf-0996-4c8f-b796-1374f41c003a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611666248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VP10G6mCQ+VgCz2cXLIMxwYEzuvSdrBnXFaYQMLoRPw=;
	b=i3Puc3p+8plmspViBIkQD8mpx6ahWOIHUh8/ZCNWzFxeOzVfxd8SQKs6OQ9q7H8t3r2m95
	s2n03f7M5SuulIpLiywq+XEoN6npGF4Cu2JySXjhsLJIAGATu5BBdihm+2Sbpi2rYxWU/f
	Q/8m+GKY7NS3EdhYqaDXHFlvV83nt7k=
Subject: Re: [PATCH v3 00/15] zstd decompression for DomU-s + fallout /
 consolidation
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <24592.1425.471671.120897@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e47c3312-a815-286e-9c7c-8abc75800e0f@suse.com>
Date: Tue, 26 Jan 2021 14:04:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24592.1425.471671.120897@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 13:05, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH v3 00/15] zstd decompression for DomU-s + fallout / consolidation"):
>> Only patches 1 and 2 are strictly intended for 4.15, paralleling
>> the recent Dom0 side work (and re-using many of the files
>> introduced there, for the stubdom build), but ones up to at least
>> patch 6 may still want considering (and 4 already has a release
>> ack).
> 
> Thanks.
> 
>> 01: libxenguest: add get_unaligned_le32()
>> 02: libxenguest: support zstd compressed kernels
> 
> So these two are fine.
> 
>> 03: xen/decompress: make helper symbols static
>> 04: libxenguest: "standardize" LZO kernel decompression code
>> 05: libxenguest: drop redundant decompression declarations
>> 06: libxenguest: simplify kernel decompression
> 
> I approve of cleanups of course.  But:
> 
> Which of these cleanups were posted before the LPD ?  I'm not
> currently aware of any reason for a freeze exception here, so I think
> those patches which didn't meet the LPD should wait.  Ones which *did*
> meet the LPD should be considered on their merits.
> 
> If you could direct me to which those are I would be happy to review
> them.

All of them were posted after that date; only the Dom0 zstd
decompression part was ready in time. I view this entire
series as a logical extension to the earlier patches though.
I'm unsure anyway how new patches in a previously submitted
series would be treated in general; so far I've been under
the impression that if in doubt the series as a whole would
count, not every individual patch.

As said (still visible above) I'm not meaning to insist on
patches 3 and onwards to be taken. In fact it was you to
ask whether patch 3 would possibly want a freeze exception.
And you did give patch 4 a release ack already, based on it
containing a bug fix. (The latter is true of patch 6 as
well, btw.) Are you implying you withdraw that release ack
now?

While we're at this - how are bug fixes to be treated in
this two week window? Do they need a release ack too if
they did miss the LPD? I'm asking with specifically
"xen/include: compat/xlat.h may change with .config
changes" in mind, but there may be others, like Roger's
3-patch series posted today, which I intend to look at
rather sooner than later.

>> 07: gunzip: drop INIT{,DATA} and STATIC
> 
> I release-nacked this because I saw you posted it with this Subject
>   Subject: [PATCH v3 01/15] gunzip: drop INIT{,DATA} and STATIC
> which made me think you were targeting it for 4.15.  If not then fine.

FAOD - indeed it was a mistake of mine and was meant to
be 07/15.

Jan

