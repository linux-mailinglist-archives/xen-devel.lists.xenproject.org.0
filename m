Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882CCB223C7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 11:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078517.1439554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulljF-0005ck-0C; Tue, 12 Aug 2025 09:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078517.1439554; Tue, 12 Aug 2025 09:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulljE-0005ZT-T1; Tue, 12 Aug 2025 09:55:36 +0000
Received: by outflank-mailman (input) for mailman id 1078517;
 Tue, 12 Aug 2025 09:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WPHn=2Y=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ulljD-0005LM-Gx
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 09:55:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b472d4c-7762-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 11:55:30 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id AD1C04EE0744;
 Tue, 12 Aug 2025 11:55:29 +0200 (CEST)
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
X-Inumbo-ID: 7b472d4c-7762-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754992529;
	b=QpGX9XTTywofc4gI0da7rNhdizWJH4bqW2CjHmFHECTw014W2wDtg5xYnoEsils3FkM/
	 wX+Kz0MVJeGJUnZzZf4Yv8DBSX2A3+UyRNGFMpN6138btBKJV7xKzAfMSfMHmJ02XE0Ny
	 rGML3AdHtq7mKLpQ1ZR0ob4nIC95GHO/EbVGGAFSH5jr09rMv1Yb46tpxpuDS8/vTuo/S
	 4Fnu78cJkRtRGXpIG74YeOVoiZDnBaUgHrk+ahGNzfZAxhY5syDCbcmJ78PX7N26mNV6T
	 5zscf9ZsHptPsJBP4/IIV96qW69MxQrykCA3JKRqNe08HLioiLal/PXj+DeMgnPaNjwyp
	 xJb+2KYyfRee0rUIkQ9+dS1CJmG5m2/1oQlEXrO34GGnouzQ/RPzpv6A9GbR7a5u1GIPP
	 nSXUydEORKT30HCCUorKuh3PqB5BqksleqX2eAAS9L9B+zCVa87UOMKBWkCW8B4qb50Lj
	 9WgwWn8QtCHO9LPxN4X9UIH0hoInOgGMvJmvyHChSv/9cg4Mqp/WNMbbBUdae0UxmknYm
	 R+QJ6b3M9viUqZm6lGPF8BqcoSe8OzkgJ6jLW1BkC9/DME4r2IRmxohvg90FxvuTo+1GR
	 q3sEnBvjPH5H17EHXoHGv3YMqtOkzK9JnCaqzToh9EkGbyUZj9FyCl1+nlXI0lo=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754992529;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=zgCLErdLpKs/wpfDwOMcpwvPL3ZgyljHBF8UneGlrrk=;
	b=apfakXfvuo2VLpd9x2uPMSj0wBevjoB2MGfM/oUX9CEY2UDFqGqTFP3PsgOJgZgKYCk2
	 Q/aiuz7u32rIVNR6tjMlh2qlttO4KEpIzD+uehfn9lJM351EzkmD3oFzQpCE72YVy3AbP
	 cbnpALtTcXrotPn5FJrUUBzczhrRk4keFkER1i0xUY9ZEX5R7DuSBouo+nkKbS77az+3O
	 J5/c4D34E069R8Vm7PqGtOYNe1HrTgcwNF57xeliH1QKWRFmNg1HIhq3tPuRDP8htShxy
	 exvEDv6jy9IBs5vqYn2/yGc56Po/QA7wN6AaqnoSJvuBVXPYVBO6xtaM11UIeBZmua/Bm
	 zpLmtT6oVYE+XHBMcRpprqsEZm0jYz0PN6S9DTIza3NnkQb2RILQs7j/AXjMHUw8RF5gE
	 CDF3Z+lboSMolIi3oU4Vx4kCanZ+8rDg2Z8Ed25lCrmsuIIOugpquPWAq7JXVfBoQyWKF
	 1IfpwWt3XM5ke1ZZkkCSZM2kiJlnpamFrlGjOHj4gBDwY3gkjTW2gn6w66mbWtK72xBfB
	 rRCz9z0jraESNjsjDyhbhviEaQcmliPtT8YfHI75Q6khFgQ1G+us/NuOhpEY5I5Ty7Xct
	 RMqIwiGc0q0TaO/7CgXe1yJeLHvDdIxeLA0Qd7RLablK/rZ0PbydPvjmmMhLvyQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754992529; bh=bdPaF8/29s842X2nnDpdkkDi87DKbMEQlRA9W0U8szA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PIKYRDEzwt75Bbg23O9+FdeNez3fTjNDCKTcT9gCgWZmTHewizYt2SrSlenLb6BFu
	 RSNTULptYNMlNPAHcE8zxtfwMW5VlZXAxl5Xz/9SQi0bYl8rzSSuyEe60pPm7FRiHy
	 j52kFIB4VsKVKot8dSC0rCcDoolw6aOFekZdT13U8ouRvgLNkMnK7SjGGSfuBz2bz8
	 7E6cLxLBYF4RSRIRRJ/7PSo7lM99FMHYibLz1qruN1UQy0lI0AXOAWAbyEooApH+0g
	 zqdBGLPpKBa3611rdSrhf3y/CKQDoQg1sfR0oDCendlID7ea+dO6NNN6soNYe0mzXB
	 4m4Zzw8ibQJTQ==
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 11:55:29 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Dmytro Prokopchuk1
 <dmytro_prokopchuk1@epam.com>
Subject: Re: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
In-Reply-To: <c7f118a9-aea8-4f3a-8072-1bfa128d56b8@suse.com>
References: <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
 <a318ef2d5cad37d2fda0bb4a52c90964@bugseng.com>
 <c7f118a9-aea8-4f3a-8072-1bfa128d56b8@suse.com>
Message-ID: <8ce96224f88513e4041d33248456fab3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-12 09:25, Jan Beulich wrote:
> On 11.08.2025 23:25, Nicola Vetrini wrote:
>> On 2025-08-11 22:30, Dmytro Prokopchuk1 wrote:
>>> --- a/xen/arch/arm/decode.c
>>> +++ b/xen/arch/arm/decode.c
>>> @@ -178,6 +178,9 @@ static int decode_thumb(register_t pc, struct
>>> hsr_dabt *dabt)
>>>          case 3: /* Signed byte */
>>>              update_dabt(dabt, reg, 0, true);
>>>              break;
>>> +        default:
>>> +            ASSERT_UNREACHABLE();
>>> +            break;
>>>          }
>>> 
>> 
>> I think this is fine, and there should be no problems with the break
>> being unreachable in some configs due to the call property for
>> ASSERT_UNREACHABLE
>> 
>> -doc_begin="Calls to function `__builtin_unreachable()' in the 
>> expansion
>> of macro
>> `ASSERT_UNREACHABLE()' are not considered to have the `noreturn'
>> property."
>> -call_properties+={"name(__builtin_unreachable)&&stmt(begin(any_exp(macro(name(ASSERT_UNREACHABLE)))))",
>> {"noreturn(false)"}}
>> -doc_end
> 
> Did you also see Julien's reply? Imo, to address a complaint from one
> rule, another rule is then being violated: The "default" label itself
> is unreachable here.
> 
> Jan

Unfortunately only after sending my reply, however the point here is 
that ASSERT_UNREACHABLE() is now considered as if it was not actually a 
source of unreachability for any statement below (which is the case only 
in configurations where NDEBUG is undefined iirc). This was done mainly 
to allow stubs for Rule 2.1 so that their return statement just after an 
ASSERT_UNREACHABLE() is not seen as a problem, but given that the 
configuration to obtain that is global it influences treatment for other 
rules as well, and its addition is relatively recent compared to the 
text written in rules.rst.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

