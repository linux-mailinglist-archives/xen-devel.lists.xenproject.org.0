Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED01A10E39
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 18:52:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871640.1282623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXl56-0002bB-66; Tue, 14 Jan 2025 17:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871640.1282623; Tue, 14 Jan 2025 17:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXl56-0002Y7-3I; Tue, 14 Jan 2025 17:52:00 +0000
Received: by outflank-mailman (input) for mailman id 871640;
 Tue, 14 Jan 2025 17:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OE6R=UG=bounce.vates.tech=bounce-md_30504962.6786a43a.v1-16d5f6469727431f935812596bcb2286@srs-se1.protection.inumbo.net>)
 id 1tXl54-0002Xz-Al
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 17:51:58 +0000
Received: from mail128-16.atl41.mandrillapp.com
 (mail128-16.atl41.mandrillapp.com [198.2.128.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e808a9a-d2a0-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 18:51:56 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-16.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4YXcBy5nJdzRKLlGc
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 17:51:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 16d5f6469727431f935812596bcb2286; Tue, 14 Jan 2025 17:51:54 +0000
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
X-Inumbo-ID: 3e808a9a-d2a0-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736877114; x=1737137614;
	bh=az8rpG0APRcxLiWSmI+/bj3xR4gqvWnpdGPbdfScdrk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VlGpXUuJn8Jz2oaK/ZJTwN0W9aMXf793YJWAokZMUSmPjFJwKM8j/ByKpeZs5AUZk
	 zczuJj22N4ZDbsYtqv6N0Y7z58wHQqXthFQ1i3rtL51OtZS1/DlIGM7j6l3mR9C2Su
	 Aw3BZtrqrJo9Tn+E4Uq04wtcaCTFAONz5GFLdvCCnpB3ZkAATbxB7v0Oj31Oek6e6s
	 bQzdKxZ0319KbTJEaEayqB3AP6GUPxGLMj8keOxoUvzzDPNEZ6iG3Fq2o5QLQzyX4X
	 /BwVD+rhyCqLbirP979/6RTnsBwU8jWJAJ7H5E+O1spqWT0sp2TLbkqUVlLhDgerhX
	 xxBZfSjcoLYAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736877114; x=1737137614; i=teddy.astie@vates.tech;
	bh=az8rpG0APRcxLiWSmI+/bj3xR4gqvWnpdGPbdfScdrk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YyNTQjEFcCrEpflceEe0lOYeKaDMVTiRW5SXUCaIVTzXPQvxMrr+yUI5zDB/4e97w
	 4vo58Y7uwgZL+Jw/0bXI1f3nP6+xQIR8ehKzWQipHfQ1tKpUvMgDmBGkOU7S5RfpR0
	 jlkdZlV30mgo9BvdgGtMW2sq1deCDjzg1e7OWDmsci1qriVm01I3SYCqHwdF1bGFli
	 Jxu7PIsBn59BI8XWp8sILKz/eMoaWTLhdlKRJd2k5zxUZH8trrOkMzGN06NXzoOwTK
	 irQfj7NJDURr/rEM6MviOfkPW0eyg2U9Td5iaVdkGEedSTOHYSFreTbj5Hg/uhvSR8
	 /1aXJF9knFBYQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20riscv:=20Add=20initial=20Xen=20guest=20support=20for=20RISC-V?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736877112710
Message-Id: <0cac0b13-128c-4d8b-b235-09d7b440ad8e@vates.tech>
To: "Milan Djokic" <milandjokic1995@gmail.com>, linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, Slavisa.Petrovic@rt-rk.com, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, sunilvl@ventanamicro.com, takakura@valinux.co.jp, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, iommu@lists.linux.dev
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
In-Reply-To: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.16d5f6469727431f935812596bcb2286?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250114:md
Date: Tue, 14 Jan 2025 17:51:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 14/01/2025 =C3=A0 17:13, Milan Djokic a =C3=A9crit=C2=A0:
> diff --git a/test.txt b/test.txt
> new file mode 100644
> index 000000000000..e54267998982
> --- /dev/null
> +++ b/test.txt
> @@ -0,0 +1,21 @@
> +WARNING: added, moved or deleted file(s), does MAINTAINERS need updating=
?
> +#120:
> +new file mode 100644
> +
> +WARNING: do not add new typedefs
> +#808: FILE: include/xen/riscv/interface.h:15:
> ++=09typedef struct { union { type * p; uint64_aligned_t q; }; }  \
> +
> +WARNING: please, no spaces at the start of a line
> +#1006: FILE: include/xen/riscv/swiotlb-xen.h:10:
> ++    return 0;$
> +
> +total: 0 errors, 3 warnings, 810 lines checked
> +
> +NOTE: For some of the reported defects, checkpatch may be able to
> +      mechanically convert to the typical style using --fix or --fix-inp=
lace.
> +
> +0001-riscv-Add-initial-Xen-guest-support-for-RISC-V.patch has style prob=
lems, please review.
> +
> +NOTE: If any of the errors are false positives, please report
> +      them to the maintainer, see CHECKPATCH in MAINTAINERS.

I am not sure you want this here.

 > diff --git a/arch/riscv/include/asm/hypervisor.h 
b/arch/riscv/include/> asm/hypervisor.h
 > new file mode 100644
 > index 000000000000..3a117afe57f0
 > --- /dev/null
 > +++ b/arch/riscv/include/asm/hypervisor.h
 > @@ -0,0 +1,9 @@
 > +/* SPDX-License-Identifier: GPL-2.0 */
 > +#ifndef _ASM_RISCV_HYPERVISOR_H
 > +#define _ASM_RISCV_HYPERVISOR_H
 > +
 > +#include <asm/xen/hypervisor.h>
 > +
 > +void kvm_init_hyp_services(void);
 > +
 > +#endif

kvm_init_hyp_services seems KVM-specific and doesn't seem to exist (yet) 
for RISC-V.

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


