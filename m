Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D986CB5535
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 10:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183704.1506309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTclS-0003DA-6e; Thu, 11 Dec 2025 09:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183704.1506309; Thu, 11 Dec 2025 09:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTclS-0003Ai-3d; Thu, 11 Dec 2025 09:15:10 +0000
Received: by outflank-mailman (input) for mailman id 1183704;
 Thu, 11 Dec 2025 09:15:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BerU=6R=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTclP-0003Aa-RS
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 09:15:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e16a8647-d671-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 10:15:05 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A88224EEBF88;
 Thu, 11 Dec 2025 10:15:03 +0100 (CET)
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
X-Inumbo-ID: e16a8647-d671-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765444503;
	b=Z1lXcRuZ3mmYHNzE9qzZ1XjCPsAABUrae+oXjKkDCy7yZODCBNc6k7SUiUmq4RTWXvG3
	 3SeYxWDvtDXqh27sA+ROwE//ts8cmSyEOK+NZ88L75XDkDvqBHdenvvBMRxDh+vp6FsgW
	 8dKeNFgVgk7qPSzleq+8m3vsMitFeXGI7ggLap82GGs/W5y/9CWcNCCqdW3xPJVAc02vb
	 U1Gl9Qw2J4vOAzF+GNcMA4/+/GKhM1VpLX+qqajfED35I7nW0G/9qqtsM8GjZkp5GdILb
	 LUJpFOO+UuS7DaTZ8zm5moeWJfg3tbQaxW8b3AnqhvPGxrVL4ImchTfgDRlGeVc5+0WY5
	 EtPJL97Pm5+BZ67HGycTFZyM8p0p07I5YTSrlQ7gXPLRBDkLXpjTGdggUxNxM8tdXxhvz
	 ml69cXWDWa9YwrDGmUd8/LFgM+v4wgI/Zek2Wo77HO/dtb8t7rPOnUU/SxdaEzeyrZU+D
	 03w17HL+i/7xIymy7zHqWs+MvFve6hyymHDJFrQffUr7lkVTivkK84tnlP8ggI457LKe0
	 eFUVYk2CnIVwzbKcMFXa8IIHjVFhp7KB3xvO5ROk9mOGB0trFkJQ6IRmR9aVBH151Lrct
	 FupT+v2hIJ1kSr4h3XZM5M/+OF5JVn7YwCRoM33Kk5+LKr5CV/5ZgjZ1JlLvjYk=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765444503;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=91SbIRJN2zsGRMjeRO8zf/beDLNZG1ESzx60jkLvZdM=;
	b=qsXEcbpizrD94+Q+NMnZA9oyJZbdceXjJqYQGO9Q6hgy2d6GmxjEagIQ0Ni1ksq0+YdD
	 kmm5PRdBH9kRiwmV3BmxILs8NyOjQ+sybR48v6NYeKzJeUYK/mI9e14V64vhOMndTiM1D
	 gGPliAn3q3ySmDAfLoUBjogKbEqtOrXdXhX4n9JubZEo0ph8qmFOMS9qHVhPsZID1JPiD
	 upSuaE7uZ8EWnzLAnKsrswq0HHF+VaVSYmjDTg0HBr2FyAaX5nmh+l2Y6L9UrebZ90mvf
	 2iOgJg9ohEXkBnt7bJwa1SdiK2kuWyJoB4SEAZpgTwmHYyZyW1qfzCvn0LYbK5jeLiZLe
	 0/YM1Q1Xh7/Q7p8AnvURDnr9tleyIQrrAhdNCTvVUkdL6sFzRWFTKhN1rE0tGddnshaTg
	 9xRtO2vFup6a0TtDnL8QncyOoinvGu42q/dLsYExf1kqwqIug6GaYOuWUtvNI+2JQ1ZnC
	 KEzKTHOhYB+njsB9lAHYl4GooR0t6M1QdBwBzteYIoXTWp4YqYNptMLcWt/Uwq3pu8UWj
	 Lx7B8NyVRrwxKLA8wKEsfIvoevSHjnbXqQtRtIZ3oJu6spR1KkWBtpgMTL4TiY/HEsEOz
	 FnTS7yOp/AsyU/V7x+GxfAalTIsfbUEXUepUvNl+EWEqizX9PgUFUqZd2kwnv6A=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765444503; bh=uhPJH6xlm8vWjIT6ofSrC71YeHb9HgSHFWDOPDHDznA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aPK53EU//K4oSpLWJ+v8F5AMiwoDPJ22T2ORpjR30q6Y11MqzMNPGJ4kYTfr0oGV4
	 4cPOq7UFcVBIVLPbmQegNK/+0XUMV7UHVjnulPEr4qjWjoNp79dzpl5ZzYTET9BQLj
	 iqsxxa3HHsYEvIg8hZRxAJAtGzYiCzseY2r5522yqa19ZIHXgfCCcS5FipWiH7q+vc
	 21O+AphjWM4JHhlUMhUetiDB2HOSK2JpoBGCBjhOXKspM2JqiXCI5dpZBkMY8xT3dW
	 lZLn8WVEJlTInRieE5h2/c/V02BIyoKg5p0SPDmaS6b7ndmozNYsIDbqBuLSD+gv3v
	 +91AWpPB5D0jg==
MIME-Version: 1.0
Date: Thu, 11 Dec 2025 10:15:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/5] x86: Fix missing brackets in macros
In-Reply-To: <5a4695fa-1520-4d52-adc3-72c159892e33@suse.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-6-andrew.cooper3@citrix.com>
 <5a4695fa-1520-4d52-adc3-72c159892e33@suse.com>
Message-ID: <fdf95d1d02274a6442d4eb4c6b7284b8@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-11 09:36, Jan Beulich wrote:
> On 10.12.2025 19:30, Andrew Cooper wrote:
>> With the wider testing, some more violations have been spotted.  This
>> addresses violations of Rule 20.7 which requires macro parameters to 
>> be
>> bracketed.
>> 
>> No functional change.
>> 
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: consulting@bugseng.com <consulting@bugseng.com>
>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/arch/x86/mm/shadow/multi.c     | 2 +-
>>  xen/arch/x86/mm/shadow/private.h   | 6 +++---
>>  xen/drivers/passthrough/vtd/dmar.h | 2 +-
>>  xen/include/xen/kexec.h            | 4 ++--
>>  4 files changed, 7 insertions(+), 7 deletions(-)
>> 
>> diff --git a/xen/arch/x86/mm/shadow/multi.c 
>> b/xen/arch/x86/mm/shadow/multi.c
>> index 03be61e225c0..36ee6554b4c4 100644
>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -781,7 +781,7 @@ do {                                               
>>                      \
>>          (_sl1e) = _sp + _i;                                           
>>   \
>>          if ( shadow_l1e_get_flags(*(_sl1e)) & _PAGE_PRESENT )         
>>   \
>>              {_code}                                                   
>>   \
>> -        if ( _done ) break;                                           
>>   \
>> +        if ( (_done) ) break;                                         
>>   \
> 
> I don't understand this: There are parentheses already from if() 
> itself.
> 

Yeah, syntactically there are, but those are parsed as part of the if, 
rather than its condition; the AST node contained within does not have 
parentheses around it.

>> --- a/xen/arch/x86/mm/shadow/private.h
>> +++ b/xen/arch/x86/mm/shadow/private.h
>> @@ -636,9 +636,9 @@ prev_pinned_shadow(struct page_info *page,
>>  }
>> 
>>  #define foreach_pinned_shadow(dom, pos, tmp)                    \
>> -    for ( pos = prev_pinned_shadow(NULL, (dom));                \
>> -          pos ? (tmp = prev_pinned_shadow(pos, (dom)), 1) : 0;  \
>> -          pos = tmp )
>> +    for ( (pos) = prev_pinned_shadow(NULL, dom);                \
>> +          (pos) ? (tmp = prev_pinned_shadow(pos, dom), 1) : 0;  \
>> +          (pos) = tmp )
> 
> What about tmp (twice)?
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

