Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D561D226923
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 18:27:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxYd9-0000nb-1t; Mon, 20 Jul 2020 16:27:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxYd7-0000nW-O6
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 16:27:05 +0000
X-Inumbo-ID: d8c650fe-caa5-11ea-84a5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8c650fe-caa5-11ea-84a5-bc764e2007e4;
 Mon, 20 Jul 2020 16:27:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 515B8B662;
 Mon, 20 Jul 2020 16:27:10 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
 <20200715121347.GY7191@Air-de-Roger>
 <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
 <20200715133217.GZ7191@Air-de-Roger>
 <cd08f928-2be9-314b-56e6-bb414247caff@suse.com>
 <20200715145144.GA7191@Air-de-Roger>
 <ff1926c7-cc21-03ad-1dff-53c703450151@suse.com>
 <01509d7d-4cf3-7f3f-4aa1-eaa3b1d3b95b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e15eb2d0-800f-4fbd-6d58-8bceb408593f@suse.com>
Date: Mon, 20 Jul 2020 18:27:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <01509d7d-4cf3-7f3f-4aa1-eaa3b1d3b95b@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.07.2020 17:28, Andrew Cooper wrote:
> On 16/07/2020 11:06, Jan Beulich wrote:
>> ACCESS_ONCE() guarantees single access, but doesn't guarantee that
>> the compiler wouldn't split this single access into multiple insns.
> 
> ACCESS_ONCE() does guarantee single accesses for any natural integer size.
> 
> There is a section about this specifically in Linux's
> memory-barriers.txt, and this isn't the first time I've pointed it out...

There indeed is text stating this, but I can't find any word on
why they believe this is the case. My understanding of volatile
is that it guarantees no more (and also no less) accesses to
any single storage location than indicated by the source. But
it doesn't prevent "tearing" of accesses. And really, how could
it, considering that volatile can also be applied to types that
aren't basic ones, and hence in particular to ones that can't
possibly be accessed by a single insn?

I'd be glad to see you point out the aspect I'm missing here.

Jan

