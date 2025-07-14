Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB0B0379E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042569.1412621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDLJ-00023K-PY; Mon, 14 Jul 2025 07:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042569.1412621; Mon, 14 Jul 2025 07:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDLJ-00021k-Mp; Mon, 14 Jul 2025 07:11:17 +0000
Received: by outflank-mailman (input) for mailman id 1042569;
 Mon, 14 Jul 2025 07:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyE0=Z3=bounce.vates.tech=bounce-md_30504962.6874ad8a.v1-e0e9daea4e6741478931affd1e02daa4@srs-se1.protection.inumbo.net>)
 id 1ubDLH-00021d-J5
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:11:15 +0000
Received: from mail179-35.suw41.mandrillapp.com
 (mail179-35.suw41.mandrillapp.com [198.2.179.35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b64ca728-6081-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 09:11:08 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-35.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4bgYQ26Ch9zDRKJHh
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 07:11:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e0e9daea4e6741478931affd1e02daa4; Mon, 14 Jul 2025 07:11:06 +0000
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
X-Inumbo-ID: b64ca728-6081-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752477066; x=1752747066;
	bh=lqgQMT9dxbb1ndNmkBKNtKgHrfIioadzMQSzrRFoVmc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qMQ8rnPUkd9ZVpYRzsS+TG8t/etvHFWQF7BoguExhsZD2rWr/wQ0JJDq0yC4NyoNe
	 aBwVL7Uu1ZgsE45amjespR0TC6cMwn/HXB8cTozbmqEv+DY79vGzURo/VmYPDuqats
	 c1jUuGPfas88CwmQmymI8qJ5Fb3e/30XlTmNH7LxacOTu7yIYBxPLIqRKo6XbY06i2
	 cJLGWK8lnmM1HqrckLlUbiymPe3sbrHWFW0OsbFxlsXNVDt7JaxHNRG0y5qM5wO7ZI
	 Vyl04qOlG4qSw3N/2SgISrlNOtQgGlox4Og/Xr3bbE5Vgj4ayb5Aqp1tgcSFibNpk+
	 VL7T2qo8+Bl5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752477066; x=1752737566; i=anthoine.bourgeois@vates.tech;
	bh=lqgQMT9dxbb1ndNmkBKNtKgHrfIioadzMQSzrRFoVmc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=p/pJfVzz3WiyRl81nAXYW3x1hQnfUA4qRIIetgvb0o2ZImi+GL63+TExJir7F0OoG
	 p47iGhgPQjOKOJ4YHKT9bNs6Swe13aCQH3cgLPcs30nVbGVsR4vdd66P0Vu+ZlYtTY
	 GpS2RZeZH59NsuRXYbb9szEFCH64jQVUPI6w4ZkYcTH8cAHvkwbEXFT6erpM3R4ArF
	 A7+8SJvzX+nCo45zzZYwgndDxwDnISsK7/QYNH9stzReinZheoj2AZUw+6FInC/p4X
	 CHg87Tu/gR9vwmMwkWlY6XWtxt8OAe+iUXjZnQx6JfWM/f91run7q+tV8DZ6jlL7yf
	 Ehmx7jyvoYaFw==
From: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752477065807
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Message-Id: <aHSth3FOCpiRRfwv@mail.vates.tech>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech> <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com>
In-Reply-To: <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e0e9daea4e6741478931affd1e02daa4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250714:md
Date: Mon, 14 Jul 2025 07:11:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 11, 2025 at 05:33:43PM +0200, Juergen Gross wrote:
>On 10.07.25 18:11, Anthoine Bourgeois wrote:
>> We found at Vates that there are lot of spurious interrupts when
>> benchmarking the PV drivers of Xen. This issue appeared with a patch
>> that addresses security issue XSA-391 (see Fixes below). On an iperf
>> benchmark, spurious interrupts can represent up to 50% of the
>> interrupts.
>>
>> Spurious interrupts are interrupts that are rised for nothing, there is
>> no work to do. This appends because the function that handles the
>> interrupts ("xennet_tx_buf_gc") is also called at the end of the request
>> path to garbage collect the responses received during the transmission
>> load.
>>
>> The request path is doing the work that the interrupt handler should
>> have done otherwise. This is particurary true when there is more than
>> one vcpu and get worse linearly with the number of vcpu/queue.
>>
>> Moreover, this problem is amplifyed by the penalty imposed by a spurious
>> interrupt. When an interrupt is found spurious the interrupt chip will
>> delay the EOI to slowdown the backend. This delay will allow more
>> responses to be handled by the request path and then there will be more
>> chance the next interrupt will not find any work to do, creating a new
>> spurious interrupt.
>>
>> This causes performance issue. The solution here is to remove the calls
>> from the request path and let the interrupt handler do the processing of
>> the responses. This approch removes spurious interrupts (<0.05%) and
>> also has the benefit of freeing up cycles in the request path, allowing
>> it to process more work, which improves performance compared to masking
>> the spurious interrupt one way or another.
>>
>> Some vif throughput performance figures from a 8 vCPUs, 4GB of RAM HVM
>> guest(s):
>>
>> Without this patch on the :
>> vm -> dom0: 4.5Gb/s
>> vm -> vm:   7.0Gb/s
>>
>> Without XSA-391 patch (revert of b27d47950e48):
>> vm -> dom0: 8.3Gb/s
>> vm -> vm:   8.7Gb/s
>>
>> With XSA-391 and this patch:
>> vm -> dom0: 11.5Gb/s
>> vm -> vm:   12.6Gb/s
>>
>> Fixes: b27d47950e48 ("xen/netfront: harden netfront against event channel storms")
>> Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
>
>Please resend this patch with the relevant maintainers added in the
>recipients list.

Ok, I will resend the patch tomorrow.
>
>You can add my Reviewed-by: tag, of course.

Thanks!

Anthoine






Anthoine Bourgeois | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


