Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F781BA5B5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 16:10:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT4Rc-0006LP-N3; Mon, 27 Apr 2020 14:09:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jT4Rb-0006LK-GS
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 14:09:11 +0000
X-Inumbo-ID: a9fce6d6-8890-11ea-9797-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9fce6d6-8890-11ea-9797-12813bfff9fa;
 Mon, 27 Apr 2020 14:09:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59E49ABB2;
 Mon, 27 Apr 2020 14:09:08 +0000 (UTC)
Subject: Re: [PATCH] x86: refine guest_mode()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
 <20200427095913.GN28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40d5c1b8-b68e-1aa8-b17e-77ba9afc6529@suse.com>
Date: Mon, 27 Apr 2020 16:08:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427095913.GN28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.04.2020 11:59, Roger Pau Monné wrote:
> On Mon, Apr 27, 2020 at 10:03:05AM +0200, Jan Beulich wrote:
>> --- a/xen/include/asm-x86/regs.h
>> +++ b/xen/include/asm-x86/regs.h
>> @@ -10,9 +10,10 @@
>>      /* Frame pointer must point into current CPU stack. */                    \
>>      ASSERT(diff < STACK_SIZE);                                                \
>>      /* If not a guest frame, it must be a hypervisor frame. */                \
>> -    ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
>> +    if ( diff < PRIMARY_STACK_SIZE )                                          \
>> +        ASSERT(!diff || ((r)->cs == __HYPERVISOR_CS));                        \
> 
> Why not use:
> 
> ASSERT(diff >= PRIMARY_STACK_SIZE || !diff || ((r)->cs == __HYPERVISOR_CS));

Except for the longer (without being helpful imo) string reported if
the assertion triggers, I see not difference.

> I'm not sure I fully understand this layout, is it possible that you
> also need to account for the size of cpu_info?

Depends on how paranoid we want the checking here to be, but in going
further I wouldn't want this to become sub-page fine-grained if we
aren't first doing e.g. what I'm mentioning in the post-commit-message
remark.

Jan

