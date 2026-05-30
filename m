Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB/2Co95G2rcDQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2026 01:58:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7B4613EF4
	for <lists+xen-devel@lfdr.de>; Sun, 31 May 2026 01:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323243.1589111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTTYs-0004q0-HD; Sat, 30 May 2026 23:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323243.1589111; Sat, 30 May 2026 23:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTTYs-0004nZ-Dv; Sat, 30 May 2026 23:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1323243;
 Sat, 30 May 2026 23:57:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wTTYq-0004nT-Fi
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 23:57:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTTYp-0096OQ-Oj
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 01:57:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1b7951-2eae-0a2a0a5409dd-0a2a4507e2e8-12
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 01:57:47 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1b7978-229c-0a2a45070019-d561b338bc78-3
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 01:57:44 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wTTYO-00APX3-4O; Sun, 31 May 2026 01:57:20 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wTTYL-003ubH-Lj; Sun, 31 May 2026 01:57:20 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wTTYK-00000005chD-46OS;
 Sun, 31 May 2026 01:57:17 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Bg/X9f6yBi+M3ht1lgBwAQhSZSPfBcd2GOjHrohqvmU=; b=qnIO4wNx9IYcl3RIa2Apc4VNJ+
	cjBxfwb8om/Gs7YOpR/rP93sZyQ7rXqz8c95t9ldYTf551SN4jkfsP1atTEHS3bLFVP73JwnC4qHk
	1QB/gnv9V0vnBeuMN+afB0Liw/Zmje/GXWu6aRo5lajuPZBIRaf2oSKJjPNqafHBU8xPbkA/o5mVr
	IlJUzR5SE8hMhqt0J/X3YYxoVch3ElvNMyqYgfvkYadvmJpn2TJRoysvbYPS7I4sVCrhNDb4/utko
	khUBZ4QfMyP6X1RLInaopyYW2h2eViW2GmgQQepSJScYaF4HmfxKt1yeA5h6wPkvtHTFXog2Zwmoh
	ZsCSAXXw==;
MIME-Version: 1.0
Date: Sat, 30 May 2026 20:57:17 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 1/4] x86/asm: move inline string functions to
 <asm/string_inline.h>
In-Reply-To: <20260530234840.GBaht3WL8L15zfNvBF@fat_crate.local>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
 <20260526-pvh-kasan-inline-v4-1-a310e6a25ecd@igalia.com>
 <20260530234840.GBaht3WL8L15zfNvBF@fat_crate.local>
Message-ID: <482d866c513a0ada46b221602a0824f8@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-4.7, Tests=ALL_TRUSTED=-3,AWL=-2.550,BAYES_50=0.8,URIBL_BLOCKED=0.001,URIBL_DBL_BLOCKED_OPENDNS=0.001,URIBL_ZEN_BLOCKED_OPENDNS=0.001
X-Spam-Score: -46
X-Spam-Bar: ----
X-purgate-ID: tlsNG-ef75cf/1780185467-08B60C48-A9DF8917/0/0
X-purgate-type: clean
X-purgate-size: 3590
X-Spamd-Result: default: False [0.61 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bp@alien8.de,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:lkp@intel.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,igalia.com:mid,igalia.com:email,intel.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com,igalia.com,vger.kernel.org,lists.xenproject.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_SPAM(0.00)[0.985];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 8C7B4613EF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-30 20:48, Borislav Petkov wrote:
> On Tue, May 26, 2026 at 11:52:33AM -0300, Mauricio Faria de Oliveira wrote:
>> In a future patch, 'boot/string.c' will include inline string functions.
>> 
>> Using the header <asm/string.h> is problematic for a couple of reasons
>> (i.e., build errors), which can be addressed, but introduce unnecessary
>> complexity and regression risk (beyond these _found_ couple of reasons).
>> 
>> Using a new header <asm/string_inline.h> is simpler and transparent to
>> existing users of <asm/string.h>, with less changes to 'boot/string.c'
>> and its users (eg 'boot/compressed/string.c' and 'purgatory/purgatory.ro'),
>> which minimize regression risk.
>> 
>> No functional change intended.
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202605140922.q7IlUv7o-lkp@intel.com/
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>> 
>> ---
>> (*) Reasons not to include <asm/string.h> in 'boot/string.c':
>> 
>> 1) 'boot/string.c' is built for 16-bit/real mode thus some type and word
>> size errors happen when <asm/string.h> include, e.g., <asm/string_64.h>.
>> 
>> This can be addressed with '#ifndef _SETUP' (defined by 'boot/Makefile').
>> 
>> 2) 'boot/string.c' is included by 'boot/compressed/string.c' which is
>> the source of 'purgatory/string.o', linked by 'purgatory/purgatory.ro'
>> (CONFIG_KEXEC_FILE).
>> 
>> In 64BIT, <asm/string.h> includes <asm/string_64.h>, which references
>> __memset() and __memmove() with KCFI_REFERENCE(), ie, __ADDRESSABLE();
>> however, 'purgatory/purgatory.ro' is not linked with implementations.
>> 
>> So, CONFIG_KEXEC_FILE and CONFIG_CFI without CONFIG_KASAN hit errors:
>> 
>>   >> ld.lld: error: undefined symbol: __memset
>>      >>> referenced by string.c
>>      >>>               arch/x86/purgatory/purgatory.ro:\
>>                        (__UNIQUE_ID_addressable___memset_0)
>>   --
>>   >> ld.lld: error: undefined symbol: __memmove
>>      >>> referenced by string.c
>>      >>>               arch/x86/purgatory/purgatory.ro:\
>>                        (__UNIQUE_ID_addressable___memmove_1)
>> 
>> (Note: this is not hit with CONFIG_KASAN because 'boot/compressed/string.c'
>> adds aliases __memset()/__memmove() to memset()/memmove() in that case.)
>> 
>> This can be addressed with 'CFLAGS_string.o := -D__DISABLE_EXPORTS' so to
>> disable KCFI_REFERENCE() in 'purgatory/Makefile' (it removes CC_FLAGS_CFI
>> anyway).
>> 
>> ...
>> 
>> However, since a change in this series would need more changes to address
>> errors it causes, it is reasonable to change the series not to cause them,
>> by using a separate header with _just_ inline string functions.
> 
> This is very long-winded and it meanders across things. Write it more
> disciplined, please, and formulate it such that you're writing the commit
> message of a standalone patch. It should have merit on its own and not talk
> about future patches and so on.
> 
> And yes, the intent to have a separate header which doesn't pull in
> nasty deps between decompressor and kernel proper, is ok.
> 
> For that, we have arch/x86/include/asm/shared/ which contains functionality
> shared between the two objects so I think you should move it there. It'll also
> make it a "clean" header which contains solely this stuff and doesn't pull in
> any other shit.

Ack; thanks for the feedback and pointers, I'll take a look.

> 
> Thx.

-- 
Mauricio

