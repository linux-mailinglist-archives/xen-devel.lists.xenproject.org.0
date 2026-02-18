Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCTiHoX4lWlMXgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 18:36:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA415857A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 18:36:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235899.1538735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vslS7-00022a-Oc; Wed, 18 Feb 2026 17:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235899.1538735; Wed, 18 Feb 2026 17:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vslS7-0001zn-LQ; Wed, 18 Feb 2026 17:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1235899;
 Wed, 18 Feb 2026 17:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnBM=AW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vslS5-0001zR-Lc
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 17:35:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 286a82be-0cf0-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 18:35:03 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6E67E4EE77EB;
 Wed, 18 Feb 2026 18:35:02 +0100 (CET)
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
X-Inumbo-ID: 286a82be-0cf0-11f1-b164-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1771436102;
	b=nyig5CSGCK2zBrWyVIJDyzyGSaODA9vA4yRH1xaAzuq73mgS3H7uskWjM3XpxGnqN9Xx
	 jOMXrqFHYqxhIGyZlxaa4aLacIaQKoj52UM9x8TymFRVLCCpRrdj2FPJRkxke/Y9kVn8o
	 3RIri8YmoJG+ZoTkFdMFkuyObZZQpt2F9aSLv7Ik9ro/K8fzpuN1jKo943NDFSl4m1Im7
	 rtSoVwwBQfeAMZqsrwoUMpIS7uEHdQO0ToZkueHOd7W/riY+Fxy9w8d0Ke42FlpbQ7Ag+
	 FX6I9L+6EZK1ETbm79lldkcfoD6m0FQzLJ5zv4BZwN2a8qROZeVSKBGn5OYvSS7ZpiJNL
	 I9/EF/qaZAxAxCyizB+IcW9vktWIP1foob1KW6wgH/9iVJnIfGnU2ET3neE+xk2wus7bm
	 K4ThFcnXIHoKP70H1k9BJqRnEj81tN3YFe9/yga8DKiHRwMH0NnhZ7g0Kxsi89we/YD9e
	 9G4n4QGlgjmDR+2A0OcYwaRVSFCau5IlZvr28rrEf16/7DPED94eQ/6z4ozAEI4bdcAuf
	 /sVCclpnH8rHOLoN8R2dSctdvwpkbqU2JTj4Bsk4+UpwBtrlcfYg45Ao2vOegsZXiuYxI
	 om95JvmPugtBlkiH3Z16zFZNj6CXFddjS2jFnBOdy0dmU9qWp5ka+5GEgaeJGsg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1771436102;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=f5mTqAhO4yMhbGETNkMlHBOPiyW1jV9cH35c+Gm1F60=;
	b=C2th59N435j/I+RSGeLq87otN8fgdzSDgx2ryK5IE1bsUPom0qABf0qXuqvfQOShcNOx
	 9YVIngfLakooFs/MbLaYSSKf9S+wQcUDBf7UljqL2+e88GhAtAQsx5QVKIKxDdR8YMei1
	 0IVEZvQgj3eV1XhrBZjHhHKAQC4CXOLxyslP6rLHDO9gaSvnnWIPH009CqNfB+N4P38/y
	 TLasaEw6oSbrggDTNxuo+mMczUTZlCzUpz3QXfa2zhLx2VeD0jJpg0byy6Xe2l3dmKfNW
	 AHJC4DOK1MlNEfxi3qj50LWC/k3oZdeVfKAe4OZ6v1z6nw8e9qgpv7WknjsrxcFpkbaQr
	 H10A4B8kCxWMXglnmRGXOMQ9Z4hS0FiKFcG30OPm44atWiGZSzl1RF1DQgxjTBGgH257a
	 tITOHZAum82tSmaJ2Gn2GpzJ6XZ/hHj1fXe1Jazs/BOGxE46yTURROtJMUnV10MaKbjMm
	 2Pvq/hP3bJ2ARjoDuLaAO5EXcuk2jbdYs+KxLTsa6pmtXE+C7kxTg3hu+tNSbiFwAZFUN
	 Z/5BYi51LiOgkfIXkXTHwynMv6iF4jjwytxZG+YeJGZ/mjriFwQ4kgaTwbGGrlUPylMOg
	 GvlXeZbdeXYYdT5lEKgTBLzPfZVLuO4Psg5VJJscMx/z7UiO2bAP1oEYjuPPKgU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 18 Feb 2026 18:35:02 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/shadow: don't use #if in macro invocations
In-Reply-To: <a0ff4341-2754-404c-8b42-95747e3cb6ab@suse.com>
References: <23951625-939c-4658-8146-84c1f12381d0@suse.com>
 <60a1bc11-f9a6-48c3-b7d8-d007799fbe91@citrix.com>
 <a0ff4341-2754-404c-8b42-95747e3cb6ab@suse.com>
Message-ID: <91756558bcee548bacf6264f898c2162@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,linkedin.com:url,bugseng.com:url,bugseng.com:mid]
X-Rspamd-Queue-Id: D2AA415857A
X-Rspamd-Action: no action

On 2026-02-18 13:42, Jan Beulich wrote:
> On 18.02.2026 12:30, Andrew Cooper wrote:
>> On 18/02/2026 9:03 am, Jan Beulich wrote:
>>> As per the standard this is UB, i.e. we're building on a defacto 
>>> extension
>>> in the compilers we use.
>> 
>> Is it a real extension, or just something that happens to work?
> 
> I was hoping I would not need to go through that large swath of gcc doc 
> to
> actually figure, because ...
> 
>>>  Misra C:2012 rule 20.6 disallows this altogether,
>>> though.
> 
> ... this I assumed was reason enough. Still, now that you forced me to: 
> In
> The C Preprocessor the behavior is described as intentional, but not as 
> an
> extension (section "Directives Within Macro Arguments"). Now you get to
> judge whether that's a "real" extension or a "de-facto" one.
> 

Well, since another alternative preprocessor may behave differently or 
even choke on this construct (on any instance!) my guess would be to 
regard this as a GNU extension.

FWIW MISRA disallows this completely because it can lead to UB 87 from 
C99: "There are sequences of preprocessing tokens within the list of 
macro arguments that would otherwise act as preprocessing directives 
(6.10.3)."

So it just sidesteps the issue without having to look at the actual 
token being formed and make our lives as tool implementors a tad easier.

Perhaps a reference to the GCC preprocessor docs could be added in the 
commit message or in the code, just to save some brain cycles again next 
time.

>>> Use helper always-inline functions instead.
>>> 
>>> In sh_audit_l1_table(), along with reducing the scope of "gfn", which 
>>> now
>>> isn't used anymore by the if() side of the conditional, also reduce 
>>> the
>>> scope of two other adjacent variables.
>>> 
>>> For audit_magic() note that both which parameters are needed and what
>>> their types are is attributed to AUDIT_FAIL() accessing variables 
>>> which
>>> aren't passed as arguments to it.
>> 
>> This is grammatically awkward.  IMO it would be clearer to say "For
>> audit_magic() note that there are more parameters than might seem
>> necessary, caused by the expectations of AUDIT_FAIL()." 
> 
> I've switched to using that, but one aspect is lost this way: I would 
> have
> preferred both gl1e and sl1e to be plain entries, not pointers to ones.
> 
>>> ---
>>> Leaving even the fetching of current to the helper in
>>> sh_rm_write_access_from_l1() looks tidier to me overall, albeit this 
>>> means
>>> the fetch will now occur once per present L1E.
>> 
>> This will not make a dent in the performance of the shadow code.
>> 
>>> Converting the #if to if() and #ifdef to if(IS_ENABLED()) wouldn't 
>>> work
>>> here, as identifiers are used which aren't available when the 
>>> respective
>>> conditions are false.
>> 
>> Personally, I'd have put this in the main commit message, because it's
>> the justification for why out-of-line static inline's need to be used.
> 
> I was wondering, so I've moved this up.
> 
>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>> @@ -395,7 +395,7 @@ static inline mfn_t cf_check sh_next_pag
>>>      shadow_set_l2e(d, sl2e, new_sl2e, sl2mfn, SH_type_fl1_shadow, 
>>> sh_next_page)
>>> 
>>>  static inline u32
>>> -guest_index(void *ptr)
>>> +guest_index(const void *ptr)
>>>  {
>>>      return (u32)((unsigned long)ptr & ~PAGE_MASK) / 
>>> sizeof(guest_l1e_t);
>>>  }
>> 
>> While fine per say, this doesn't appear to be related to the patch?
> 
> It does, the compiler told me to: type_from_gl3e() uses it, and I 
> really
> want to keep the const-s on both of its parameters.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

