Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A12DFE3B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 17:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57456.100522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOTV-0001FD-G7; Mon, 21 Dec 2020 16:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57456.100522; Mon, 21 Dec 2020 16:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOTV-0001Eo-By; Mon, 21 Dec 2020 16:55:57 +0000
Received: by outflank-mailman (input) for mailman id 57456;
 Mon, 21 Dec 2020 16:55:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krOTT-0001Ej-Bj
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 16:55:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 221e57ce-b1dc-4874-91e3-f26c037c5003;
 Mon, 21 Dec 2020 16:55:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FFCBAD2B;
 Mon, 21 Dec 2020 16:55:53 +0000 (UTC)
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
X-Inumbo-ID: 221e57ce-b1dc-4874-91e3-f26c037c5003
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608569753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wM2QmjhwXz7QS9UN/SlgvatkLyo0wr5EUvEu2sjxZAY=;
	b=sv+jXz7hoxyDU3qYICaIyESTTDpO/S5qEclcJi2Axpa6d3Tp5QQu24dZU31LkvA1hsnZtv
	N3o4JW9SwnH5b1GQ3DvoeMhyqxGXUND9Mr0xll4RP7GVNiQTABRmQX/03D4H8ten52KFuf
	FRtzckdt4bTA21NKe68Br2idEAQ9nRc=
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, Cheyenne Wills
 <cheyenne.wills@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
 <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
 <f4ff3d16-40f6-e8a1-fcdd-ca52e1f52ca6@suse.com>
 <c90622c4-f9e0-8b6d-ab46-bba0cbfc0fd9@oracle.com>
 <0430337a-6fcd-9471-4455-838390401220@citrix.com>
 <c6e05b63-b066-9bd0-9da1-1fc089cd1aea@oracle.com>
 <10958d4a-154f-a524-35e9-a75eaf50fe55@oracle.com>
 <90740e33-c69a-16d7-2622-fa57a1f34272@suse.com>
 <0dbfa20a-5c3d-77c5-1ef0-4baf74e60195@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c869736a-afbf-a52b-e7ce-d7f4bb3d7faf@suse.com>
Date: Mon, 21 Dec 2020 17:55:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0dbfa20a-5c3d-77c5-1ef0-4baf74e60195@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.12.2020 17:21, boris.ostrovsky@oracle.com wrote:
> 
> On 12/21/20 3:21 AM, Jan Beulich wrote:
>> On 18.12.2020 21:43, boris.ostrovsky@oracle.com wrote:
>>> Can we do something like KVM's ignore_msrs (but probably return 0 on reads to avoid leaks from the system)? It would allow to deal with cases when a guest is suddenly unable to boot after hypervisor update (especially from pre-4.14). It won't help in all cases since some MSRs may be expected to be non-zero but I think it will cover large number of them. (and it will certainly do what Jan is asking above but will not be specific to this particular breakage)
>> This would re-introduce the problem with detection (by guests) of certain
>> features lacking suitable CPUID bits. Guests would no longer observe the
>> expected #GP(0), and hence be at risk of misbehaving. Hence at the very
>> least such an option would need to be per-domain rather than (like for
>> KVM) global,
> 
> 
> Yes, of course.
> 
> 
>>  and use of it should then imo be explicitly unsupported.
> 
> 
> Unsupported or not recommended? There are options that are not recommended from security perspective but they are still supported. For example, `spec-ctrl=no` (although it's a global setting)

"Security unsupported", i.e. use of it causing what might look like
a security issue would not get an XSA.

Jan

