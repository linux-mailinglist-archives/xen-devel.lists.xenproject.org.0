Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0328F2723E9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 14:31:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKKyJ-0004xQ-Nl; Mon, 21 Sep 2020 12:31:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKKyH-0004xL-Qa
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 12:31:05 +0000
X-Inumbo-ID: ee4b0913-7c9a-4697-898e-f3878d3d7e29
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee4b0913-7c9a-4697-898e-f3878d3d7e29;
 Mon, 21 Sep 2020 12:31:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600691464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fVSfqWCoN5tRkSjUlkyP+s00M2RfTX5PcorzKuEdoU4=;
 b=rKrtCT3mjOdCVknR5ESd2kbYxPJXED2gMRMt+7HBOkaWGyibFv4pnTeKihjoq7gPZBPnvL
 bhYesG+5Fbjpt8hW66tlsbazgxd31Bpf4LhKVBlrssRibGrPv03OloKqUsbqs1MkOSEW48
 Y1eSFWSuFIYvr6f9lmldwe5qxERolmQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A4B3B2F2;
 Mon, 21 Sep 2020 12:31:40 +0000 (UTC)
Subject: Re: [PATCH V1 01/16] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
 <98420567-40a9-7297-d243-4af90f692bf9@suse.com>
 <123d8e2a-96c2-a97c-a0c0-a5dca4288a2b@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2dea0b83-5178-7768-eaab-ff4a8878eeb0@suse.com>
Date: Mon, 21 Sep 2020 14:31:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <123d8e2a-96c2-a97c-a0c0-a5dca4288a2b@gmail.com>
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

On 21.09.2020 14:22, Oleksandr wrote:
> On 14.09.20 16:52, Jan Beulich wrote:
>> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>>> --- a/xen/arch/x86/hvm/ioreq.c
>>> +++ b/xen/arch/x86/hvm/ioreq.c
>>> @@ -170,6 +170,29 @@ static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
>>>       return true;
>>>   }
>>>   
>>> +bool arch_handle_hvm_io_completion(enum hvm_io_completion io_completion)
>> Do we need "handle" in here? Without it, I'd also not have to ask about
>> moving hvm further to the front of the name...
> For me without "handle" it will sound a bit confusing because of the 
> enum type which
> has a similar name but without "arch" prefix:
> bool arch_hvm_io_completion(enum hvm_io_completion io_completion)

Every function handles something; there's no point including
"handle" in every name. Or else we'd have handle_memset()
instead of just memset(), for example.

> Shall I then move "hvm" to the front of the name here?

As per comments on later patches, I think we want to consider dropping
hvm prefixes or infixes altogether from the functions involved here.

>>> @@ -1215,8 +1233,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>>       struct hvm_ioreq_server *s;
>>>       unsigned int id;
>>>   
>>> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>>> -        return;
>>> +    arch_hvm_ioreq_destroy(d);
>> So the call to relocate_portio_handler() simply goes away. No
>> replacement, no explanation?
> As I understand from the review comment on that for the RFC patch, there 
> is no
> a lot of point of keeping this. Indeed, looking at the code I got the 
> same opinion.
> I should have added an explanation in the commit description at least.
> Or shall I return the call back?

If there's a reason to drop it (which I can't see, but I also
don't recall seeing the discussion you're mentioning), then doing
so should be a separate patch with suitable reasoning. In the
patch here you definitely should only transform what's already
there.

Jan

