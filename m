Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5719F274003
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 12:54:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKfwD-0002MM-65; Tue, 22 Sep 2020 10:54:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKfwB-0002M9-LA
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 10:54:19 +0000
X-Inumbo-ID: d66e4eeb-0ac2-4b6d-88e1-f93833166ef0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d66e4eeb-0ac2-4b6d-88e1-f93833166ef0;
 Tue, 22 Sep 2020 10:54:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600772057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDwbxQkA7tooC705lRRmqi0t5mtmIudx0Q9zXbJ4f3I=;
 b=Bg6wwWYM0OScgfRlNOhrdUxNQH+JOWonEpq1rxy09LE+xiuq2wN5/bZkOiTi6w3klPytuz
 vt8+IH3IYuOeenCp2E3pObb75znHmqH2Rd7qgqAnYvkSIWeafp1MxXB+a3JV8FgAG9P9Lw
 CNjSNQsF4FYe0JAhGAOZ5k+I9EiwJkE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69E0CAD85;
 Tue, 22 Sep 2020 10:54:54 +0000 (UTC)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
 <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
 <bf128337-699f-5942-b387-aa896000700c@suse.com>
 <97b48017-55e1-8464-031a-b54dd8e4e474@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d7d6d211-1a24-b452-d1ea-efb0105995b7@suse.com>
Date: Tue, 22 Sep 2020 12:54:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <97b48017-55e1-8464-031a-b54dd8e4e474@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.09.2020 11:58, Oleksandr wrote:
> On 22.09.20 09:33, Jan Beulich wrote:
>> On 21.09.2020 21:02, Oleksandr wrote:
>>> On 14.09.20 17:17, Jan Beulich wrote:
>>>> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>>>>> +#define GET_IOREQ_SERVER(d, id) \
>>>>> +    (d)->arch.hvm.ioreq_server.server[id]
>>>> arch.hvm.* feels like a layering violation when used in this header.
>>> Got it. The only reason why GET_IOREQ_SERVER is here is inline
>>> get_ioreq_server(). I will make it non-inline and move both to
>>> common/ioreq.c.
>> Which won't make the layering violation go away. It's still
>> common rather than per-arch code then. As suggested elsewhere,
>> I think the whole ioreq_server struct wants to move into
>> struct domain itself, perhaps inside a new #ifdef (iirc one of
>> the patches introduces a suitable Kconfig option).
> Well, your advise regarding ioreq_server sounds reasonable, but the 
> common ioreq.c
> still will have other *arch.hvm.* for both vcpu and domain. So looks 
> like other involved structs should be moved
> into *common* struct domain/vcpu itself, correct? Some of them could be 
> moved easily since contain the same fields (arch.hvm.ioreq_gfn),
> but some of them couldn't and seems to require to pull a lot of changes 
> to the Xen code (arch.hvm.params, arch.hvm.hvm_io), I am afraid.
> Or I missed something?

arch.hvm.params, iirc, is an x86 concept, and hence would need
abstracting away anyway. I expect this will be common pattern:
Either you want things to become generic (structure fields
living directly in struct domain, or at least not under arch.hvm),
or things need abstracting for per-arch handling.

>> This goes
>> alongside my suggestion to drop the "hvm" prefixes and infixes
>> from involved function names.
> Well, I assume this request as well as the request above should be 
> addressed in the follow-up patches, as we want to keep the code movement 
> in current patch as (almost) verbatim copy,
> Am I correct?

The renaming could imo be done before or after the move, but within
a single series. Doing it (or some of it) during the move may be
acceptable, but this primarily depends on the overall effect on the
patch that this would have. I.e. the patch better wouldn't become
gigantic just because all the renaming gets done in one go, and it's
hundreds of places that need touching.

Jan

