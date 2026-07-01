Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fsdPK6lyRWrUAQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 22:03:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1537E6F13FC
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 22:03:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=eXh1+rNK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from list by lists.xenproject.org with outflank-mailman.1350852.1608288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf19h-0005hN-NG; Wed, 01 Jul 2026 20:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350852.1608288; Wed, 01 Jul 2026 20:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf19h-0005fs-Jh; Wed, 01 Jul 2026 20:03:33 +0000
Received: by outflank-mailman (input) for mailman id 1350852;
 Wed, 01 Jul 2026 20:03:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wf19f-0005dR-TJ
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 20:03:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf19f-003doP-6H
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 22:03:31 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a457292-bab6-0a2a0a5309dd-0a2a4501c7e4-0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 22:03:30 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a457292-400f-0a2a45010019-d561b33887a6-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 22:03:30 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wf19G-007jIE-GQ; Wed, 01 Jul 2026 22:03:06 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wf19E-008PvG-Bh; Wed, 01 Jul 2026 22:03:06 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wf19E-0000000DrRf-0aWf;
 Wed, 01 Jul 2026 22:03:04 +0200
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=h8lMXBcYlOyRE4pQKie/bg8QzKCuakYmyioerwHH1+M=; b=eXh1+rNK/Agog1Cz9/pcvxMMW9
	sokenI9OuaFH9ZytFg5ZjyaJb9ougXQkL1fK0EnDBBYg+As7+DktzNVpksHIjBLtYNE3tciRfdB+J
	smM6qRWJljDWQgB7Aru2gemMvxXuBjar+KMOm0Qlvya6KdDj26dKF52iVQUFGtXtH4ho1uvxfx98u
	NMgN6oI8Qj704OXcOvEBXc6LMDalNRKcCTEpuT3DTLaNJoVZbUcOYciV7ESsTdmVPyyk8hLoRpaLX
	rGE/oMpiw9F06Rz+hwRNdaL0p34gLprKVUN6E5ZSAB/0E5+U2pipMQNYsusK7IiwU4DKj9gpYrddg
	Sx4pRuzQ==;
MIME-Version: 1.0
Date: Wed, 01 Jul 2026 17:03:04 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH RESEND v5 1/3] x86/asm, x86/boot: expose inline memcmp
In-Reply-To: <fed9dc5860b96063c06592080f957589@igalia.com>
References: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
 <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
 <20260701184014.GDakVfDhIgaIKurzTb@fat_crate.local>
 <fed9dc5860b96063c06592080f957589@igalia.com>
Message-ID: <ccdc4d450a8683991f53038cde393597@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.7, Tests=ALL_TRUSTED=-3,AWL=-2.551,BAYES_50=0.8,URIBL_BLOCKED=0.001,URIBL_DBL_BLOCKED_OPENDNS=0.001,URIBL_ZEN_BLOCKED_OPENDNS=0.001
X-Spam-Score: -46
X-Spam-Bar: ----
X-purgate-ID: tlsNG-d62444/1782936210-D04D51E0-18ADB142/0/0
X-purgate-type: clean
X-purgate-size: 3118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,igalia.com:email,igalia.com:mid,igalia.com:from_mime];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com,igalia.com,vger.kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[igalia.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1537E6F13FC

On 2026-07-01 16:57, Mauricio Faria de Oliveira wrote:
> Thanks for looking at this again.
> 
> On 2026-07-01 15:40, Borislav Petkov wrote:
>> On Tue, Jun 30, 2026 at 02:21:46PM -0300, Mauricio Faria de Oliveira wrote:
>>> Move the inline memcmp function currently only available in 'boot/string.c'
>>> into the shared string function header <asm/shared/string.h> to be reused.
>>> 
>>> This is not done through <asm/string.h> to avoid pulling unnecessary code
>>> in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
>>> and 'purgatory/purgatory.ro'.
>>> 
>>> Note that the inline memcmp() returns 0/1, not -1/0/1 as regular memcmp()
>>> (reported by David Laight <david.laight.linux@gmail.com>).
>> 
>> This belongs ...
>> 
>> 
>>> 
>>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>>> ---
>> 
>> ... here, if anywhere.
> 
> I'm not sure, as Reported-by and Suggested-by mean something different.
>

Oops, I missed the triple dash in your comment.

That would discard the credit attribution when applied, AFAIK. So,
still:
 
> Maybe a simpler statement would do? e.g., '(Thanks to David Laight for
> noticing the return value difference between inline and regular
> memcmp())'. That gives credit while avoiding confusion with tags.

Thanks,

> 
>> 
>>>  arch/x86/boot/string.c               |  6 ++----
>>>  arch/x86/include/asm/shared/string.h | 16 ++++++++++++++++
>>>  arch/x86/include/asm/string.h        |  1 +
>>>  3 files changed, 19 insertions(+), 4 deletions(-)
>> 
>> Also, PeterZ has a point - we should group all __inline_ functions into
>> shared/string.h and say why that is the case at the top of the header.
> 
> Ok.
> 
>>> diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
>>> index ac0f900ebc47efa81c92e1bb2010ea41677899c4..be454a6864225f3a972c3e81826b77ed4e8a57fe 100644
>>> --- a/arch/x86/boot/string.c
>>> +++ b/arch/x86/boot/string.c
>>> @@ -15,6 +15,7 @@
>>>  #include <linux/errno.h>
>>>  #include <linux/limits.h>
>>>  #include <asm/asm.h>
>>> +#include <asm/shared/string.h>
>>>  #include "ctype.h"
>>>  #include "string.h"
>>>  
>>> @@ -31,10 +32,7 @@
>>>  
>>>  int memcmp(const void *s1, const void *s2, size_t len)
>>>  {
>>> -	bool diff;
>>> -	asm("repe cmpsb"
>>> -	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>>> -	return diff;
>>> +	return __inline_memcmp(s1, s2, len);
>>>  }
>>>  
>>>  /*
>>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..422952152f533ad75b98f3873297b39c4f5e2477
>>> --- /dev/null
>>> +++ b/arch/x86/include/asm/shared/string.h
>>> @@ -0,0 +1,16 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ASM_X86_SHARED_STRING_H
>>> +#define _ASM_X86_SHARED_STRING_H
>>> +
>>> +/* Note: this memcmp() returns 0/1, not -1/0/1 as regular memcmp(). */
>> 
>> Please document it properly - what does 0 mean as a return value and what 1.
> 
> Ok.
> 
> cheers,
> 
>> 
>> Thx.

-- 
Mauricio

