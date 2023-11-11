Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FFE7E8C8E
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 21:20:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631054.984186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1uSC-0002iv-Cy; Sat, 11 Nov 2023 20:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631054.984186; Sat, 11 Nov 2023 20:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1uSC-0002go-AE; Sat, 11 Nov 2023 20:19:40 +0000
Received: by outflank-mailman (input) for mailman id 631054;
 Sat, 11 Nov 2023 20:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Ms9=GY=desiato.srs.infradead.org=BATV+309277d91504b99347a0+7384+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r1uS9-0002gi-7f
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 20:19:38 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f38d82d-80cf-11ee-9b0e-b553b5be7939;
 Sat, 11 Nov 2023 21:19:32 +0100 (CET)
Received: from [31.94.72.62] (helo=[127.0.0.1])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r1uRO-00H0a4-2z; Sat, 11 Nov 2023 20:19:00 +0000
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
X-Inumbo-ID: 9f38d82d-80cf-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h5oxW5dgHw8XVPfXbwVF8tdSJ71sift0mn8OzSj2xw8=; b=QtqAWbtTKe/mQ7HwXCF9gjnyPU
	VOSYRiSgCMwxZpYkJk8SEs+4dutFlA3RoDD0u1PV9H8Xh/SaI8SfcvHzAe5Ie8vI/kU2JSMuf6XYW
	4A49d0TCnlkjtKs3FcXSWY4StKVPpQlmuW2W74VkgiIxuz5DvWRfg02vU7d/Cof8eooAZhkkeMw+f
	T/7KvoN2HKhB9LOR+0tMNxljBi26o76xnMHuVcZBMziAiB6gMXiXtCcIjUvK43FwQw4ktBXMy1uRl
	fETc+tzG3Ld3E5cmGKBos21VP1DqgL5sBWcss/sx4zryD//+uGCxI6koXyo1eOPirLGD7aRy5N+Za
	zkG/w2Zg==;
Date: Sat, 11 Nov 2023 15:18:35 -0500
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
In-Reply-To: <db50c864-a429-49af-9762-8bc17d5b0336@citrix.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com> <20231110204207.2927514-2-volodymyr_babchuk@epam.com> <f2f7751a9ea5597e9f7a1417b761fe0802892aa8.camel@infradead.org> <db50c864-a429-49af-9762-8bc17d5b0336@citrix.com>
Message-ID: <0F786C80-FB37-4AEB-8314-3DB4AC4600E5@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 11 November 2023 08:43:40 GMT-05:00, Andrew Cooper <andrew=2Ecooper3@cit=
rix=2Ecom> wrote:
>Furthermore, the control domain doesn't always have the domid of 0=2E
>
>If qemu wants/needs to make changes like this, the control domain has to
>arrange for qemu's domain to have appropriate permissions on the nodes=2E

Right=2E And that's simple enough: if you are running QEMU in a domain whi=
ch doesn't have permission to create the backend directory and/or the front=
end nodes, don't ask it to *create* devices=2E In that case it is only able=
 to connect as the backend for devices which were created *for* it by the t=
oolstack=2E

The criterion used in this patch series should be "did QEMU create this de=
vice, or discover it"=2E


