Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D39AB2701B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 22:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082475.1442324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umePd-0002hV-Tx; Thu, 14 Aug 2025 20:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082475.1442324; Thu, 14 Aug 2025 20:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umePd-0002fL-RB; Thu, 14 Aug 2025 20:19:01 +0000
Received: by outflank-mailman (input) for mailman id 1082475;
 Thu, 14 Aug 2025 20:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQqN=22=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umePb-0002fF-RZ
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 20:18:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e84a6493-794b-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 22:18:57 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 3903B4EE3C04;
 Thu, 14 Aug 2025 22:18:56 +0200 (CEST)
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
X-Inumbo-ID: e84a6493-794b-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755202736;
	b=pc0wvpGc8W71vHRjr5lZWV0niM88fe/Rx5H/xCsYU5FhMC7ve+mrzUeQt/t1JwOU5XKd
	 m0f2GFeutDvjxKZCAlHRZ+2AGn3oUCwSHHA+/0JHcatuz6gG+M4nCKJHZr5OCeYKO3lPv
	 39jczqac1M3BWoD0iwBf2aos1JL0mXDudXjVAlymUVI8WtCc1V+RGUZ+Z7u9XYNooOgs5
	 X9D4NZBvUwpm8WTwgVkRoVGiu8fM8AOzA3oBiWd18jnakQIObfIfYUMGeHy3pbEDvqTJG
	 2h9d+WN3J8nJE91h15WWFZ4bFqb/BJEyGNAlfMEHzksbMz3F0HOfy5CamRxie/ePd0r80
	 xXMDBJJML9Kypcutl9rrR1mcm85AtCpuhEsOeRNFFOFAFvRGvkJtnAMpcn8I7ChjMZftZ
	 YkdtT0538QB+Vx1m5wEdw2OgPJs3thZj1Juaa+bE7t0ViKcivyJtxNNsOpEi4/wOF6os5
	 OQQT/PEbFDr5j5t0qG5ocauhQROpqE6FE1QqOFeEt3NN3S25Mh+vacO0xvrLTLj7YIz60
	 Gb8WVJNz5nSj+c7PM9quxY9WuvZ77seCF54FRA59QA2jeyuoziexuTx7yC525jWoq32v2
	 laNeN/uq2dtAckRf0cU9egVUkJ30NijTKOkYjoZl8BnA74dOadUoHZ9QNM1dBd0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755202736;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=J0M3XxeIUeWOBUmBkuPSheRSMFm4wMPEVIu+y0iS+ak=;
	b=cWj7kkMBPvg0n4RjCGgJavwi09c52lClqZOEeCkSyUsYnZYOParaE5i+cikfz07p0S0Y
	 aXKzWiKleLVqOeyMzWZkqnox/qrso0OAeXEhElTS1i/H2132wsNvRnuivVIFs4nOXv7YO
	 5zlp3FwcuYtjeaXksXmNgxTdl8XNbOVVhDtMdDHybIioQoGnRJmnISZCvpT5/m1Sf7GmY
	 5xoiTkLK4VY2QSB5mQ9xgxf+aiNGKe0v1HOhofwKcDCZpDvfTnsjGo9EWlfIN2DcexT7E
	 f1Cjcu+sfgVqsXIzM2HfEgIKjLz3YAoWxPAsGD6TNekRx9rRMcQ5Yw+zQAa/dmIGV7LAI
	 db+3B2vKkUcAk+kXahkVeJnnIKluU86j8R5pdavJRTvJquigpYTvbfjxdUOoRi993CSce
	 KYb+CqOPy4uHTRGOMqrsdMo5sDHx0NLrpUEv2RNH67of28aDvx5SN3AbUiREkHhA1ywc2
	 Dq60xlxQjwlkzFYl3AifqQzwaNxrkoxilQoA+2pljM4OGg+y/xa6OzdBm82ahqPD2xH5a
	 lmLzKR0ZDlc623Qd4/ExjKDAr/y58sBNYOk2PaYU+0mNo3eb9ljgnrdwtacn9JFypF5FF
	 vdOfRWLRGNVYBJTVAN+Xjkkxh4NwWC+xh/9gc50XReKXEeV5Agrix0eOE3rl0eU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755202736; bh=yA8OSl03SMr2pvzqi72fRbftOACITWQQrGaGZnwZnsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=y3zMI56Kwgjx8Y75BCR6vViS8ivcZol88bXIN2GPgjocN4+NWzUB540j7sVj1jarO
	 NdEVPcRQA/FrKEfOUXFfFs0se9wEZCmVD5nXKoCrutbBF265V7JY9Rt17QOYc/Zw95
	 DAC5SdDHQMXHiQTS0BFwDBQypp/HFt+5x1vihkBGPtYuxGJbLtAb5xzI1lE26q39Q8
	 wg1tsO/2GZzaf0Y5jYct9AxbuD0KYJhQd5ihHRwrXPfaJ3wMw3F4tyllaKVCMr04Tk
	 P0rzooPdwF3cBaBIqtHgbA2v2gvqt7Qe3aXkSCd3r//0rwxIBBbIx0cj/qulSd6Uwu
	 l54NZQXtsQK/g==
MIME-Version: 1.0
Date: Thu, 14 Aug 2025 22:18:56 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 13/22] x86: FRED enumerations
In-Reply-To: <e3416a404c78156ff33de829c7b4b664@bugseng.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
 <9cc46920-b1a6-4085-8481-abf0f1cd0aab@citrix.com>
 <c7e82bee-1b38-41e1-89c6-d1d3717087b2@suse.com>
 <b058cb18-7a03-403d-b0c4-402fc0353da2@citrix.com>
 <e3416a404c78156ff33de829c7b4b664@bugseng.com>
Message-ID: <539e7b06b6f8faed2f35edb8c1851db0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-14 21:37, Nicola Vetrini wrote:
> On 2025-08-14 13:47, Andrew Cooper wrote:
>> On 14/08/2025 12:44 pm, Jan Beulich wrote:
>>> On 14.08.2025 13:42, Andrew Cooper wrote:
>>>> On 14/08/2025 12:20 pm, Jan Beulich wrote:
>>>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>>>> --- a/xen/arch/x86/include/asm/x86-defns.h
>>>>>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>>>>>> @@ -75,6 +75,7 @@
>>>>>>  #define X86_CR4_PKE        0x00400000 /* enable PKE */
>>>>>>  #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement 
>>>>>> Technology */
>>>>>>  #define X86_CR4_PKS        0x01000000 /* Protection Key 
>>>>>> Supervisor */
>>>>>> +#define X86_CR4_FRED      0x100000000 /* Fast Return and Event 
>>>>>> Delivery */
>>>>> ... a UL suffix added here for Misra.
>>>> I was surprised, but Eclair is entirely fine with this.
>>> And there is a use of the identifier in a monitored C file?
>> 
>> Yes.  traps-setup.c which definitely has not been added to an 
>> exclusion
>> list.
>> 
> 
> Might look into it before the end of the week, if time allows. Is [1] 
> the right branch to look at?
> 
> [1] 
> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/fred
> 

Actually thinking about it, this is indeed represented in a signed type 
in x86: according to the standard it's just a signed long [2], therefore 
the rule does not apply. Then you would have a R10 violation due to the 
conversion at the callsite. I would put a U regardless, since the 
intention was clearly to have an unsigned long.

[2] https://godbolt.org/z/rT5j4j9vj

>> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

