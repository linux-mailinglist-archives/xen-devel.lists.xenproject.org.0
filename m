Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5A64CDF6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 17:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462434.720586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5UaD-0006Q3-Nk; Wed, 14 Dec 2022 16:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462434.720586; Wed, 14 Dec 2022 16:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5UaD-0006Mc-Ke; Wed, 14 Dec 2022 16:26:13 +0000
Received: by outflank-mailman (input) for mailman id 462434;
 Wed, 14 Dec 2022 16:26:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/MR=4M=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1p5UaB-0006MW-UD
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 16:26:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03d76287-7bcc-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 17:26:10 +0100 (CET)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1671035159837286.7464051219322;
 Wed, 14 Dec 2022 08:25:59 -0800 (PST)
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
X-Inumbo-ID: 03d76287-7bcc-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; t=1671035161; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gbRL9qgJjUKYpgU0PubO4J3m9Z20t3kmx0sF44i11WS9j/qXYtniaHVgXv287X+jFZHRUcTuHWsoJJIcyjElCVnR30gHXFdj2wq01usqmW5HigM91cx3YMFGbGX1NBDBVC+exFGDMW9gYg5wcvphUJE/pYiMtDb1i8xWgQPrmCY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1671035161; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=VW5pjBa/Gm0HRNFs/wA/xK0T+dMEFL/pzZrpPtto174=; 
	b=Grhj+LYtC9EtkyndlVMjNRjdohd/Y7oovNFN+mx3Y7nYO45atUmbS5KqkMl9nxG1uJXyAr/z/LE8R2fzNjCmB8Hc792brbQzlMi1C8owtYYuzqfY0lrv2Lo15dsMz8+iGKZELnaX8FViZgoU5QzOlMvjvkY9dWw2cBV0fdsyriU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671035161;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VW5pjBa/Gm0HRNFs/wA/xK0T+dMEFL/pzZrpPtto174=;
	b=D/1q0m4F8Q07a9TBPeCMCnK4df2MLjzJJp1Izb8I/44bZqtfS0jRzhcbiKEejRlo
	MqNjQ9jhJcErcSDWFJTCak1uAqSYlIWaXQNP5DrRDkG3eYz5vqz+GJRX1hAa09bcMWx
	cDg2hDQj2sB0xilYMp4PqaNteSVNl3XFL4QWMk7Q=
Message-ID: <d57129f5-cfaf-0ed7-0dac-985b3a646b79@apertussolutions.com>
Date: Wed, 14 Dec 2022 11:25:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 0/3] xen/spinlock: make recursive spinlocks a
 dedicated type
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=c3=b3wka?=
 <mateusz.mowka@intel.com>, Paul Durrant <paul@xen.org>
References: <20220910154959.15971-1-jgross@suse.com>
 <933c9378-8f0d-41e6-ec9a-3a702ef13f24@apertussolutions.com>
 <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d28412f2-2b94-5c69-c43f-481634562356@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/14/22 10:31, Juergen Gross wrote:
> On 14.12.22 16:03, Daniel P. Smith wrote:
>>
>> On 9/10/22 11:49, Juergen Gross wrote:
>>> Instead of being able to use normal spinlocks as recursive ones, too,
>>> make recursive spinlocks a special lock type.
>>>
>>> This will make the spinlock structure smaller in production builds and
>>> add type-safety.
>>
>> Just a little yak shaving, IMHO a spinlock is normally not expected to 
>> be recursive. Thus explicitly naming a spinlock as non-recursive I 
>> find to be redundant along with being expensive for typing. Whereas a 
>> recursive spinlock is the special instance and should have a 
>> declarative distinction. Only codifying the recursive type would 
>> significantly cut down on the size of the series and still provide 
>> equal type and visual clarification.
> 
> A "normal" spinlock is non-recursive.
> 
> A recursive spinlock in Xen can be either taken recursive, or it can be 
> taken
> non-recursive, causing further recursive attempts to spin.

Yes, I understand the current situation.

> So the explicit non-recursive locking applies to that special treatment of
> recursive spinlocks.

I understand this, but to help clarify what I am saying is that 
individuals coming from outside Xen would expect is the spinlock family 
of calls to behave as a non-recursive spinlocks and recursive spinlock 
family of calls would provide the recursive behavior. Currently Xen's 
behavior is backwards to this, which this series continues and is a 
valid approach. Here spinlock and recursive spinlock family of calls are 
recursive and must use non-recursive spinlock family to have "normal" 
spinlock behavior. IMHO it would greatly simplify the code and align 
with the "normal" understanding of spinlocks if instead 
spin_{lock,locked,unlock} macros were the non-recursive calls and 
spin_{lock,locked,unlock}_recursive macros were the recursive calls. 
Then there would only be two suites of calls for spinlocks and a lot 
less keystrokes for need for most development.

v/r,
dps

