Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0F17E8D1E
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 23:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631078.984207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1wO1-0003My-Dw; Sat, 11 Nov 2023 22:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631078.984207; Sat, 11 Nov 2023 22:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1wO1-0003K8-Aq; Sat, 11 Nov 2023 22:23:29 +0000
Received: by outflank-mailman (input) for mailman id 631078;
 Sat, 11 Nov 2023 22:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sSCd=GY=casper.srs.infradead.org=BATV+506890241e50857960ff+7384+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r1wNx-0003K2-Ih
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 22:23:27 +0000
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecde4861-80e0-11ee-9b0e-b553b5be7939;
 Sat, 11 Nov 2023 23:23:23 +0100 (CET)
Received: from [31.94.60.97] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r1wNK-004NRt-4A; Sat, 11 Nov 2023 22:22:47 +0000
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
X-Inumbo-ID: ecde4861-80e0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=UFK1vHdO6GzG4Gs6TcxgZqUW3ESxK4rozJ5G7MTQTpQ=; b=rMgNF+RtBaC1yKs30+newQ95tC
	kJ/xfCILtuh4CmmRwfU+lxrK2uW+y2nF5vbK1DZRrPF0v4S/bS2pKqaZAwfP5GeC2e6bTIVxq6khN
	8WZBPALajJa1JpdOQ+jBs4EBQnY3G/EmVFvBKr4ywrPBn/v2lXpOoAsrx5H0Y2c4QwlnlO0kGfoji
	bWjwm1lLYLM5QVt4+/ZxHOfN/bwZgbN3c8+DpGhtGIFmwFENr9BrGM9tU60HZeeUw4TM27qZIGIRX
	wVO5TgXEq8Ze64MCooiSHMfrSbHKdWrMmz2KdNpRSYNRCWciaYSkwZWdwyaLqo7UFu9GVHYOXYd8+
	NL/7jT9A==;
Date: Sat, 11 Nov 2023 17:22:41 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH v1 1/7] xen-block: Do not write frontend nodes
User-Agent: K-9 Mail for Android
In-Reply-To: <d4eb2378-d276-47eb-a8a2-b3551020f814@citrix.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com> <20231110204207.2927514-2-volodymyr_babchuk@epam.com> <f2f7751a9ea5597e9f7a1417b761fe0802892aa8.camel@infradead.org> <db50c864-a429-49af-9762-8bc17d5b0336@citrix.com> <0F786C80-FB37-4AEB-8314-3DB4AC4600E5@infradead.org> <d4eb2378-d276-47eb-a8a2-b3551020f814@citrix.com>
Message-ID: <81BF040F-EE19-4367-9C4F-94FF2623C75B@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On 11 November 2023 16:51:22 GMT-05:00, Andrew Cooper <andrew=2Ecooper3@cit=
rix=2Ecom> wrote:
>On 11/11/2023 8:18 pm, David Woodhouse wrote:
>> On 11 November 2023 08:43:40 GMT-05:00, Andrew Cooper <andrew=2Ecooper3=
@citrix=2Ecom> wrote:
>>> Furthermore, the control domain doesn't always have the domid of 0=2E
>>>
>>> If qemu wants/needs to make changes like this, the control domain has =
to
>>> arrange for qemu's domain to have appropriate permissions on the nodes=
=2E
>> Right=2E And that's simple enough: if you are running QEMU in a domain =
which doesn't have permission to create the backend directory and/or the fr=
ontend nodes, don't ask it to *create* devices=2E In that case it is only a=
ble to connect as the backend for devices which were created *for* it by th=
e toolstack=2E
>>
>> The criterion used in this patch series should be "did QEMU create this=
 device, or discover it"=2E
>>
>
>Yeah, that sounds like the right approach=2E

I think we want to kill the xen_backend_set_device() function and instead =
set the backend as a property of the XenDevice *before* realizing it=2E


