Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C06315274
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:15:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83280.154554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Uiy-0005rs-Bs; Tue, 09 Feb 2021 15:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83280.154554; Tue, 09 Feb 2021 15:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Uiy-0005rV-8M; Tue, 09 Feb 2021 15:14:44 +0000
Received: by outflank-mailman (input) for mailman id 83280;
 Tue, 09 Feb 2021 15:14:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9Uiw-0005rQ-Im
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:14:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 398a33ec-0192-4276-a988-e8691c4c73cd;
 Tue, 09 Feb 2021 15:14:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE300B21A;
 Tue,  9 Feb 2021 15:14:40 +0000 (UTC)
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
X-Inumbo-ID: 398a33ec-0192-4276-a988-e8691c4c73cd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612883680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U6qYsU4In/PbhGu50pUxSSjZI/9AictEFwYLXUfuVZg=;
	b=djzeuIbxCdOI0K1rlXfuzOffmqPJR4Svmm0VvWKzHGR8z1WNB74/dLnMNB7hv5+toL7fbJ
	SEMV6dJYztymzF6xxGodJ5e8F6tP+pYNco36eI+4NRoahLF0u5eh7t4awDQdLGuB+Nfo+V
	OceDJXyzxbgWivcbm65WhlD6/OwlUcc=
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
 <YCKibN0mjROss4M4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11d58555-97d2-0489-b123-cbcf084a0094@suse.com>
Date: Tue, 9 Feb 2021 16:14:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCKibN0mjROss4M4@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.02.2021 15:55, Roger Pau Monné wrote:
> On Thu, Jan 14, 2021 at 04:04:11PM +0100, Jan Beulich wrote:
>> The "guest" variants are intended to work with (potentially) fully guest
>> controlled addresses, while the "unsafe" variants are not. (For
>> descriptor table accesses the low bits of the addresses may still be
>> guest controlled, but this still won't allow speculation to "escape"
>> into unwanted areas.)
> 
> Descriptor table is also in guest address space, and hence would be
> fine using the _guest accessors? (even if not in guest control and
> thus unsuitable as an speculation vector)

No, we don't access descriptor tables in guest space, I don't
think. See read_gate_descriptor() for an example. After all PV
guests don't even have the full concept of self-managed (in
their VA space) descriptor tables (GDT gets specified in terms
of frames, while LDT gets specified in terms of (VA,size)
tuples, but just for Xen to read the underlying page table
entries upon 1st access).

>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -274,7 +274,7 @@ static void compat_show_guest_stack(stru
>>      {
>>          if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
>>              break;
>> -        if ( __get_user(addr, stack) )
>> +        if ( get_unsafe(addr, stack) )
>>          {
>>              if ( i != 0 )
>>                  printk("\n    ");
>> @@ -343,7 +343,7 @@ static void show_guest_stack(struct vcpu
>>      {
>>          if ( (((long)stack - 1) ^ ((long)(stack + 1) - 1)) & mask )
>>              break;
>> -        if ( __get_user(addr, stack) )
>> +        if ( get_unsafe(addr, stack) )
> 
> Shouldn't accessing the guest stack use the _guest accessors?

Hmm, yes indeed.

> Or has this address been verified by Xen and not in idrect control of
> the guest, and thus can't be used for speculation purposes?
> 
> I feel like this should be using the _guest accessors anyway, as the
> guest stack is an address in guest space?

I think this being a debugging function only, not directly
accessible by guests, is what made me think speculation is
not an issue here and hence the "unsafe" variants are fine
to use (they're slightly cheaper after all, once the
subsequent changes are in place). But I guess I will better
switch these two around.

Jan

