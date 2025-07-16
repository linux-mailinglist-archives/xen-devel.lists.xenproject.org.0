Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F32B06F5A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 09:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044896.1414942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwru-0001c6-Nv; Wed, 16 Jul 2025 07:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044896.1414942; Wed, 16 Jul 2025 07:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwru-0001ZX-KL; Wed, 16 Jul 2025 07:47:58 +0000
Received: by outflank-mailman (input) for mailman id 1044896;
 Wed, 16 Jul 2025 07:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gK1i=Z5=bounce.vates.tech=bounce-md_30504962.68775924.v1-b4ef5d3643e84f54870a356a094f7bec@srs-se1.protection.inumbo.net>)
 id 1ubwrs-0001ZR-C7
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 07:47:56 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bb3731b-6219-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 09:47:50 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bhp7S5t36z8XRxVs
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 07:47:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b4ef5d3643e84f54870a356a094f7bec; Wed, 16 Jul 2025 07:47:48 +0000
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
X-Inumbo-ID: 2bb3731b-6219-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752652068; x=1752922068;
	bh=EADp+aC71ezYPnIGNnp9tcJQ4dkpoJJiqmWqgbZsDZ0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZJnGfK+YKbQhKLTWMKsefEbYI2q2gafakg4mnb4WIiLWBR+/fNS3+TlKzJzPg9BHm
	 8ldv/DBruHKSV6LxlRs/TMmQjKEXkT5RDt4mNU7XMRb5L3km4h5nvR1FPEf43n6kNi
	 ecw1DYscVqVjUOGEjIdNqHe7hItWDWtpE1c7j9fiz9iLEDhoUNyCaEMMwBbOQFdBdm
	 kH10lK2q6qrJDdg5atehodkj9iAxdlO9HLVzka7UYYLhlZxUEI+DgfEI2Wx8zfIkFe
	 lk+jJ94Ml7DmGMbfIzPAh4o2yY60PyiyxMA6lHWmG6ggA/QQQR23ddUDm+nDF1LdQx
	 la9NdGwiWoV/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752652068; x=1752912568; i=anthoine.bourgeois@vates.tech;
	bh=EADp+aC71ezYPnIGNnp9tcJQ4dkpoJJiqmWqgbZsDZ0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lLJtjaBlzlYy7BJwb3c5HT3Zm2lb3e6rxDsH2g/iAJis3vvL5bXmD2ZfFW3X3ZXl7
	 gbXBmvPSquaXWdVUXRr8OZXYWFOaPViFdfj1KUS1hsO3DHtnxCImr9x4EDXfCCLU/Y
	 lylppJF2IufHru+vMBmYcfxRqFF9ANTnVWrl4n7Mhw8EKaPt1Iz+ggRF+pQiBS9pzt
	 A0b4CLwoxzGk1oTKHkDV3jLmYeTiXkCatjZ8UKSU19ORhrZsDNfTO4FaAiDxwraZUm
	 k4Q1O9/bWzmPfuXRx66xC3tRXy6k8An84x9pOkt04yp5RADBQex9GDAsVSUU61eSUF
	 sOi7X82e+9Ing==
From: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752652067603
To: "Elliott Mitchell" <ehem+xen@m5p.com>
Cc: "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Message-Id: <aHdZInm-EC487zKi@mail.vates.tech>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech> <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com> <aHSth3FOCpiRRfwv@mail.vates.tech> <aHWi3ncNrVBO6jrh@mattapan.m5p.com> <aHYPktKlOyFJ49bb@mail.vates.tech> <aHapxmJ6miJnWYit@mattapan.m5p.com>
In-Reply-To: <aHapxmJ6miJnWYit@mattapan.m5p.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b4ef5d3643e84f54870a356a094f7bec?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250716:md
Date: Wed, 16 Jul 2025 07:47:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Jul 15, 2025 at 12:19:34PM -0700, Elliott Mitchell wrote:
>On Tue, Jul 15, 2025 at 08:21:40AM +0000, Anthoine Bourgeois wrote:
>> On Mon, Jul 14, 2025 at 05:37:51PM -0700, Elliott Mitchell wrote:
>> >On Mon, Jul 14, 2025 at 07:11:06AM +0000, Anthoine Bourgeois wrote:
>> >> On Fri, Jul 11, 2025 at 05:33:43PM +0200, Juergen Gross wrote:
>> >> >On 10.07.25 18:11, Anthoine Bourgeois wrote:
>> >
>> >Tested on a VM which this could be tried on.
>> >
>> >Booting was successful, network appeared to function as it had been.
>> >Spurious events continued to occur at roughly the same interval they had
>> >been.
>> >
>> >I can well believe this increases Xen network performance and may
>> >reduce the occurrence of spurious interrupts, but it certainly doesn't
>> >fully fix the problem(s).  Appears you're going to need to keep digging.
>> >
>> >I believe this does count as Tested-by since I observed no new ill
>> >effects.  Just the existing ill effects aren't fully solved.
>> >
>>
>> Thank you for the test!
>> Could you send me the domU/dom0 kernel version and xen version ?
>
>I tend to follow Debian, so kernel 6.1.140 and 4.17.6.  What may be
>more notable is AMD processor.
>
>When initially reported, it was reported as being more severe on systems
>with AMD processors.  I've been wondering about the reason(s) behind
>that.

AMD processors could make a huge difference. On Ryzen, this patch could
almost double the bandwidth and on Epyc close to nothing with low
frequency models, there is another bottleneck here I guess.
On which one do you test?

Do you know there is also a workaround on AMD processors about remapping
grant tables as WriteBack?
Upstream patch is 22650d605462 from XenServer.
The test package for XCP-ng with the patch:
https://xcp-ng.org/forum/topic/10943/network-traffic-performance-on-amd-processors

Regards,
Anthoine


Anthoine Bourgeois | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


