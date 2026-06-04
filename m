Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6dEXCkIYIWqB/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 08:16:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010263D33F
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 08:16:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=bugseng.com (policy=none);
	arc=pass ("bugseng.com:s=openarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327421.1592380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV1MB-0005kY-OE; Thu, 04 Jun 2026 06:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327421.1592380; Thu, 04 Jun 2026 06:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV1MB-0005hn-HS; Thu, 04 Jun 2026 06:15:07 +0000
Received: by outflank-mailman (input) for mailman id 1327421;
 Thu, 04 Jun 2026 06:15:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wV1MA-0005hh-Ms
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 06:15:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV1M9-005UFi-Vg
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 08:15:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a2117e2-2eae-0a2a0a5409dd-0a2a4506c954-26
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:15:05 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a2117e9-7371-0a2a45060019-a237832f9dfa-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 08:15:05 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 98CF84EE4078;
 Thu,  4 Jun 2026 08:15:04 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1780553705;
	b=5e9FOYGq9lUc4S2ZjKxzW7ilJnVZsJkKomwLkVZZnI1Dl/WnYFQhNl0lEdZJ4CNQ5emO
	 UHXoxO446rixNd/W6ulnQGrDYnW57ZjB6B7N50jTZbpN4C6jL4PU2uz5AvOSSw9gpptVX
	 lgkveQcAafP8GHbk7Thz4yYVSk594vftriD622vii6ixqNS5VNWuJBCD+/8WvEBfinPd+
	 9FwD7MaRHtYP7XZozyzlsLLzZgWS0IR+0zvrBQBXnMfJ3C0PHqbycG+9t040oY6Wql6N1
	 OPIR8ip7VhEhHg+L2BCDoLbvxgG8P1RwbKt5iyKpa7403u31ZQ3IDcfqVJ5lLtr+hurFK
	 SdXuIj+oM49wgwNf5CER/WcbgB/mvb6yRXgxoZliuyGv0TyOGmyC4DWQlb9acCKMiBwI3
	 aYwO0hnosmkS7GnmCECOziue6t8YK0BF5Y2+wnEWSy2J7MQconEsw0c8RdCvUCn8XAKUN
	 3VAuQfPYLmzi+SFeE9ODTBlt7ayzvNmJRbbvjkvMvQmtlyzPHvcWP5x5wLjwf+Nf3uXxE
	 qvnUSy+EKRMYr48tbGPdipChlHU55XJSD/DHMU48r0K8zsW5XgTYA6pLE1YWErra81o4N
	 eaM1iRvvAqQZQV1fJnyJ53j1xDowOmJJX7CMsS2YT1Zqru2azfHpEgOHX3zem1Y=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1780553705;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=f50FscTQVCVS1vVVjIjZefggcc+1Gg2ilawB9UkV+kA=;
	b=oNgh5NVw0+zVltZWsAeR3jZPS3RZQtcIVPoibpsLHDy7zRqkwWmaB/BgRtQane+zGhp6
	 VU2cNV5Yn9UfVCI0E35RMV2E3z4Iv7Kk7q9/OZ4JwGJkd8XHS+hSd/C+p4qpkgvSjDwR5
	 r47lR/7Yc6uNrM1RGl2TVNllpIkHHhPMFgIo5BdIWjUd3azCFQ6B4DTLh5r6CFsfoEtTh
	 LqzOuvsXNcfNoPl7avuWU92WWKRjXYIWUar8bN2Y/Wg11VEeC+/FNlQ9cMZ02+HbX4w6Y
	 C9p62zA0U2payRPJbUCxdkgvH5PTqtRoK7FMk7r973H/3aK2pVzwxb5ycc4ryVJ5RaSd0
	 BcmTMeR4eFnkdDg/+hgmvnoz+0iRVXI56HMNMrF4UUrQpEVJsy/JA45J7b+EnyZQJ2xhT
	 1K3IXiDIYy30qLqDH+4zOTe6K5v/6KWoKuNHL8WOk/ul46T0Ilc5SbyadE0VljTcPrcXt
	 F3sbGZAIMaX1m/B//OxIJ5magw5RVPzs1WXXjEosSjWjcbbZvjT9AH/ZNIOIgBmQLQ7WX
	 cZFcapvfEmdch5O9U7qpNwodvJd08C/7aTPzL1nkF77myVeLt/6B3kzLbSaTjXk9CoU5z
	 Vghu9LkUHIEgTpsANDiVKEf8ggsils7C6OyepPfdn9uK4PRYlRr4MXXJCDHCQt0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 04 Jun 2026 08:15:04 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jbeulich
 <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Dmytro
 Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
In-Reply-To: <alpine.DEB.2.22.394.2606031341070.1200252@ubuntu-linux-20-04-desktop>
References: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com>
 <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com>
 <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop>
 <62abdafd-a49c-46e0-b529-0646a8d2425a@suse.com>
 <alpine.DEB.2.22.394.2606021840110.550703@ubuntu-linux-20-04-desktop>
 <b443469b-01fe-4196-a79f-811bfb6e17d8@suse.com>
 <aiAj7duOGUAkbB05@macbook.local>
 <616db16e-3c3e-4000-b6ea-d2703f5a848b@suse.com>
 <alpine.DEB.2.22.394.2606031341070.1200252@ubuntu-linux-20-04-desktop>
Message-ID: <faaadd2c717694c89ac75d19e772126f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780553705-86974D75-47ADCBEA/0/0
X-purgate-type: clean
X-purgate-size: 7154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.39 / 15.00];
	ARC_ALLOW(-1.00)[bugseng.com:s=openarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[bugseng.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[nicola.vetrini@bugseng.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,bugseng.com:mid,bugseng.com:from_mime,bugseng.com:url,b.sc:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7010263D33F

On 2026-06-03 22:43, Stefano Stabellini wrote:
> On Wed, 3 Jun 2026, Jan Beulich wrote:
>> On 03.06.2026 14:54, Roger Pau Monné wrote:
>> > On Wed, Jun 03, 2026 at 08:04:25AM +0200, Jan Beulich wrote:
>> >> On 03.06.2026 03:41, Stefano Stabellini wrote:
>> >>> On Tue, 2 Jun 2026, Jan Beulich wrote:
>> >>>> On 27.05.2026 00:12, Stefano Stabellini wrote:
>> >>>>> On Fri, 22 May 2026, Jan Beulich wrote:
>> >>>>>> (extending Cc list)
>> >>>>>>
>> >>>>>> On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
>> >>>>>>> --- a/xen/drivers/vpci/header.c
>> >>>>>>> +++ b/xen/drivers/vpci/header.c
>> >>>>>>> @@ -586,7 +586,7 @@ static void cf_check bar_write(
>> >>>>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>> >>>>>>>              gprintk(XENLOG_WARNING,
>> >>>>>>>                      "%pp: ignored BAR %zu write while mapped\n",
>> >>>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>> >>>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>> >>>>>>>          return;
>> >>>>>>>      }
>> >>>>>>>
>> >>>>>>> @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
>> >>>>>>>          if ( guest_addr != bar->guest_addr )
>> >>>>>>>              gprintk(XENLOG_WARNING,
>> >>>>>>>                      "%pp: ignored guest BAR %zu write while mapped\n",
>> >>>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>> >>>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>> >>>>>>>          return;
>> >>>>>>>      }
>> >>>>>>>      bar->guest_addr = guest_addr;
>> >>>>>>
>> >>>>>> Well. If I'm not mistaken we had discussed situations like this (long ago).
>> >>>>>> Imo the added verbosity gets in the way of readability. If we absolutely
>> >>>>>> cannot or don't want to deviate such constructs (of which I expect we have
>> >>>>>> more), then we ought to consider alternatives (like changing the variables'
>> >>>>>> types in the case here).
>> >>>>>>
>> >>>>>> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
>> >>>>>> shifts would be okay to use with a bool operand. What's wrong with also
>> >>>>>> permitting this for other operators?
>> >>>>>
>> >>>>> In my opinion, if we are going to treat bool as its own type, it makes
>> >>>>> sense not to silently mix bools into arithmetic with int types. I also
>> >>>>> do not find this patch less readable -- I actually find it more
>> >>>>> readable, since it makes it more obvious that hi is a bool.
>> >>>>
>> >>>> Well, okay, we have different opinions there. This reply of yours applies
>> >>>> to the first paragraph of my earlier reply though, despite its placement.
>> >>>> What about the aspect mentioned in the second paragraph?
>> >>>
>> >>> You mean "then we ought to consider alternatives (like changing the
>> >>> variables' types in the case here)" ?
>> >>
>> >> That's another option, but not what I meant. I simply don't understand why
>> >> some operators are okay to use with booleans while others aren't. Adding
>> >> (for example) booleans can be quite helpful. Take this example from gas
>> >> sources as example:
>> >>
>> >>       if (overlap.bitfield.imm8
>> >> 	  + overlap.bitfield.imm8s
>> >> 	  + overlap.bitfield.imm16
>> >> 	  + overlap.bitfield.imm32
>> >> 	  + overlap.bitfield.imm32s
>> >> 	  + overlap.bitfield.imm64 != 1)
>> >>
>> >> And then see how the added verbosity would hamper readability:
>> >>
>> >>       if ((overlap.bitfield.imm8 ? 1 : 0)
>> >> 	  + (overlap.bitfield.imm8s ? 1 : 0)
>> >> 	  + (overlap.bitfield.imm16 ? 1 : 0)
>> >> 	  + (overlap.bitfield.imm32 ? 1 : 0)
>> >> 	  + (overlap.bitfield.imm32s ? 1 : 0)
>> >> 	  + (overlap.bitfield.imm64 ? 1 : 0) != 1)
>> >>
>> >>> Other alternatives could be OK, but also this patch as-is is OK to me.
>> >>
>> >> I'm not going to veto it (not being a maintainer of the code I really
>> >> can't), but as per above the transformation imo is setting a bad example.
>> >
>> > What about getting the BAR index based on the register value, and
>> > hence avoiding the pointer arithmetic plus the boolean type addition?
>> > I think that's clear and doesn't violate any MISRA rules, it would
>> > obviously not settle the discussion about boolean type abuse as
>> > integers, but would be fine to solve the specific issue in vPCI IMO.
>> 
>> For the case here - sure, that should be fine. But I specifically
>> wanted to understand (generally) why we are limiting ourselves, as
>> surely other cases are going to show up.
> 
> My view on this is that booleans should be treated as booleans, and we
> should not rely on implicit conversions to int types. I prefer the
> second form because it makes it clear these are booleans. The added
> verbosity helps me see at a glance that these are booleans and should 
> be
> treated as such. The first form is more dangerous because I might 
> forget
> they are booleans, assume they are int types, and use them in an
> operation that would result in undefined or implementation-specific
> behavior.
> 
> I am also fine with Roger's proposal.

I will try to give some context on why the configuration is written in 
its current formulation. There are now about 100 violations on x86, but 
just 2 left on Arm64 with Dmytro's patch applied, from what I can see. 
So, I think the reason why a code change was proposed is because the 
actual changes to make this clean on Arm would be quite limited.

>> >>>>>> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
>> >>>>>> shifts would be okay to use with a bool operand. What's wrong with also
>> >>>>>> permitting this for other operators?

well, you'd need to say that it is fine to use booleans as rhs or lhs of 
just about any operator (+, -, and their compound counterpart, as well 
as assignment come to mind). The deviation justification talks 
intentionally about the value, not the type, to avoid ambiguity, but it 
is not extended to other operators, such as addition, because we deem it 
more likely to have an unintended type mismatch there (for bitwise op 
you are already working with bits, so a boolean-valued operand is less 
surprising). Later, there is another clause for the opposite conversion 
(int-to-bool) for conditionals, which is quite natural. You are right in 
saying that (bool-to-int) conversions would be low-risk for most 
operators, and we could write a deviation with a corresponding 
justification for + or - for instance, but ultimately we decided that it 
would go too far against the spirit of the rule. Perhaps there had been 
a discussion among the maintainers when the rule was discussed for 
adoption, but I do not have notes regarding this specific aspect of the 
rule. If it is agreed upon to use booleans in arithmetic expressions, 
then I can help draft an appropriate deviation.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

