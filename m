Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F05469B44
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239215.414615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFdc-0001LD-CV; Mon, 06 Dec 2021 15:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239215.414615; Mon, 06 Dec 2021 15:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFdc-0001Il-8C; Mon, 06 Dec 2021 15:10:44 +0000
Received: by outflank-mailman (input) for mailman id 239215;
 Mon, 06 Dec 2021 15:10:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gMFW=QX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muFdb-0001Id-4T
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:10:43 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad1382f1-56a6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 16:10:42 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35436)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muFdY-000s8w-8u (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 06 Dec 2021 15:10:40 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 875621FDB9;
 Mon,  6 Dec 2021 15:10:40 +0000 (GMT)
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
X-Inumbo-ID: ad1382f1-56a6-11ec-a5e1-b9374ead2679
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <bd34ada6-15b2-6720-7669-4247aed536f3@srcf.net>
Date: Mon, 6 Dec 2021 15:10:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211206133828.8811-1-andrew.cooper3@citrix.com>
 <b7c3525e-9acb-cef8-56b6-894975eeb530@srcf.net>
 <1884c09b-2583-efd7-bcfa-8413865c53b6@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/irq: Improve local_irq_restore() code generation and
 performance
In-Reply-To: <1884c09b-2583-efd7-bcfa-8413865c53b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 14:07, Jan Beulich wrote:
> On 06.12.2021 14:55, Andrew Cooper wrote:
>> On 06/12/2021 13:38, Andrew Cooper wrote:
>>> popf is a horribly expensive instruction, while sti is an optimised fastpath.
>>> Switching popf for a conditional branch and sti caused an 8% perf improvement
>>> in various linux measurements.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> ---
>>>  xen/include/asm-x86/system.h | 9 ++-------
>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/xen/include/asm-x86/system.h b/xen/include/asm-x86/system.h
>>> index 65e63de69a67..4be235472ecd 100644
>>> --- a/xen/include/asm-x86/system.h
>>> +++ b/xen/include/asm-x86/system.h
>>> @@ -267,13 +267,8 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
>>>  })
>>>  #define local_irq_restore(x)                                     \
>>>  ({                                                               \
>>> -    BUILD_BUG_ON(sizeof(x) != sizeof(long));                     \
>>> -    asm volatile ( "pushfq\n\t"                                  \
>>> -                   "andq %0, (%%rsp)\n\t"                        \
>>> -                   "orq  %1, (%%rsp)\n\t"                        \
>>> -                   "popfq"                                       \
>>> -                   : : "i?r" ( ~X86_EFLAGS_IF ),                 \
>>> -                       "ri" ( (x) & X86_EFLAGS_IF ) );           \
>>> +    if ( (x) & X86_EFLAGS_IF )                                   \
>>> +        local_irq_enable();                                      \
>>>  })
>> Bah.  There's still the one total abuse of local_irq_restore() to
>> disable interrupts.
> Question is whether that's really to be considered an abuse:

These are Linux's APIs, not ours, and they've spoken on the matter. 
Furthermore, I agree with this being an abuse of the mechanism.

>  To me
> "restore" doesn't mean only "maybe re-enable", but also "maybe
> re-disable".

nor does "save" mean "save and disable", but that's what it does.

The naming may not be completely ideal, but the expected usage is very
much one way.

>  And a conditional STI-or-CLI is likely still be better
> than POPF.

It likely is better than popf, but for one single abuse which can be
written in a better way anyway, it's really not worth it.

~Andrew

