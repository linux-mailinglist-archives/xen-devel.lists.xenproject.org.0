Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907FD20043B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 10:41:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCaF-0006rK-6R; Fri, 19 Jun 2020 08:41:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DmpW=AA=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jmCaD-0006rB-PL
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 08:41:09 +0000
X-Inumbo-ID: 9ed8c7d8-b208-11ea-b7bb-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ed8c7d8-b208-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 08:41:08 +0000 (UTC)
Received: from webmail.moloch.sk (w3-s.a.lucina.net [62.176.169.73])
 by smtp.lucina.net (Postfix) with ESMTPSA id BDF71122804;
 Fri, 19 Jun 2020 10:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1592556067;
 bh=asZAW8ytMFfTsgxokf5mQeT7kTk0KwF+C+X+TX76kis=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gBdOW0isyKQbxhes8TGpBinbxv+ekQpFt73NxNCMIZPWZ9Ie3ZjdNKotH+UEW1Z2A
 rz58VGU6FO00Lew2vgwzvRq9WO7ji5SmxHzSCxWdUdmLkTWWNX8FtVeyb9jq/RUU5N
 uV4qP+5LM68PlEWHg17BnLJ2c/iH9nhQoPXVbxQZ5dtta+2dFdcjzOU4iBS3Gpgp/0
 haDWVqD6a07/Ti4brGxWiK+9PDb1MILdv1URQj2u6eGivUX2DPj3NkvP6upOpV+j/v
 9bA9gW6rODd8c8rnJC6cd5P4QsHMamUO7GJMp4WeyhU6yCMN2oZ66c6YRlee6wBHk9
 K8PwGr+DrBf+w==
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 19 Jun 2020 10:41:07 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Event delivery and "domain blocking" on PVHv2
In-Reply-To: <2f5c8fbc-0153-17b7-4a44-8f8ba0e3179f@citrix.com>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
 <20200618101330.GB10330@nodbug.lucina.net>
 <2f5c8fbc-0153-17b7-4a44-8f8ba0e3179f@citrix.com>
Message-ID: <c30b6f3274cf109d7667ed677eecde64@lucina.net>
X-Sender: martin@lucina.net
User-Agent: Roundcube Webmail/1.3.3
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
Cc: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-19 01:43, Andrew Cooper wrote:
> On 18/06/2020 11:13, Martin Lucina wrote:
>> On Monday, 15.06.2020 at 17:58, Andrew Cooper wrote:
>>> On 15/06/2020 15:25, Martin Lucina wrote:
>>>> Hi,
>>>> 
>>>> puzzle time: In my continuing explorations of the PVHv2 ABIs for the
>>>> new MirageOS Xen stack, I've run into some issues with what looks 
>>>> like
>>>> missed deliveries of events on event channels.
>>>> 
>>>> While a simple unikernel that only uses the Xen console and
>>>> effectively does for (1..5) { printf("foo"); sleep(1); } works fine,
>>>> once I plug in the existing OCaml Xenstore and Netfront code, the
>>>> behaviour I see is that the unikernel hangs in random places, 
>>>> blocking
>>>> as if an event that should have been delivered has been missed.
>>> You can see what is going on, event channel wise, with the 'e'
>>> debug-key.  This will highlight cases such as the event channel being
>>> masked and pending, which is a common guest bug ending up in this 
>>> state.
>> Ok, based on your and Roger's suggestions I've made some changes:
>> 
>> 1. I've dropped all the legacy PIC initialisation code from the Solo5
>> parts, written some basic APIC initialisation code and switched to 
>> using
>> HVMOP_set_evtchn_upcall_vector for upcall registration, along with 
>> setting
>> HVM_PARAM_CALLBACK_IRQ to 1 as suggested by Roger and done by Xen when
>> running as a guest. Commit at [1], nothing controversial there.
> 
> Well...
> 
>     uint64_t apic_base = rdmsrq(MSR_IA32_APIC_BASE);
>     wrmsrq(MSR_IA32_APIC_BASE,
>             apic_base | (APIC_BASE << 4) | MSR_IA32_APIC_BASE_ENABLE);
>     apic_base = rdmsrq(MSR_IA32_APIC_BASE);
>     if (!(apic_base & MSR_IA32_APIC_BASE_ENABLE)) {
>         log(ERROR, "Solo5: Could not enable APIC or not present\n");
>         assert(false);
>     }
> 
> The only reason Xen doesn't crash your guest on that WRMSR is because
> 0xfee00080ull | (0xfee00000u << 4) == 0xfee00080ull, due to truncation
> and 0xfe | 0xee == 0xfe.
> 
> Either way, the logic isn't correct.

Oh, thanks. Don't you wish C had a "strict" mode where you could 
disable/warn
on implicit type promotion? I certainly do.

> 
> Xen doesn't support moving the APIC MMIO window (and almost certainly
> never will, because the only thing which changes it is malware).  You
> can rely on the default state being correct, because it is
> architecturally specified.

Noted. I'll change the code to just verify that APIC_BASE is indeed 
FEE00000
at start of day and that the enable operation succeeded -- I like to 
keep the
code robust, e.g. against cut-n-pasting to somewhere else that might be 
used
in a non-Xen context later where the precondition may not hold.

Martin

> 
> ~Andrew

