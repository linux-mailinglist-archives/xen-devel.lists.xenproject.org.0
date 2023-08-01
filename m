Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB976A916
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 08:29:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573691.898636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQit7-0005Mp-6e; Tue, 01 Aug 2023 06:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573691.898636; Tue, 01 Aug 2023 06:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQit7-0005JV-2a; Tue, 01 Aug 2023 06:29:45 +0000
Received: by outflank-mailman (input) for mailman id 573691;
 Tue, 01 Aug 2023 06:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jaq7=DS=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qQit5-0005JL-B3
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 06:29:43 +0000
Received: from frasgout13.his.huawei.com (unknown [14.137.139.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbda619b-3034-11ee-b258-6b7b168915f2;
 Tue, 01 Aug 2023 08:29:41 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.229])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4RFQ063Qhbz9y7l5
 for <xen-devel@lists.xenproject.org>; Tue,  1 Aug 2023 14:18:14 +0800 (CST)
Received: from [10.81.220.249] (unknown [10.81.220.249])
 by APP1 (Coremail) with SMTP id LxC2BwC3abkdpshkKRcYAA--.13561S2;
 Tue, 01 Aug 2023 07:29:03 +0100 (CET)
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
X-Inumbo-ID: cbda619b-3034-11ee-b258-6b7b168915f2
Message-ID: <4c2f96bc-f6c0-4a04-e4fa-6ab1b5e56bd6@huaweicloud.com>
Date: Tue, 1 Aug 2023 08:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/9] Allow dynamic allocation of software IO TLB bounce
 buffers
Content-Language: en-US
To: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>,
 Christoph Hellwig <hch@lst.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Lameter <cl@linux.com>,
 Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Petr Tesarik <petr.tesarik.ext@huawei.com>, Jonathan Corbet
 <corbet@lwn.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, James Seo <james@equiv.tech>,
 James Clark <james.clark@arm.com>, Kees Cook <keescook@chromium.org>,
 "moderated list:XEN HYPERVISOR ARM" <xen-devel@lists.xenproject.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:XEN SWIOTLB SUBSYSTEM" <iommu@lists.linux.dev>,
 "open list:SLAB ALLOCATOR" <linux-mm@kvack.org>,
 Roberto Sassu <roberto.sassu@huaweicloud.com>
References: <cover.1690459412.git.petr.tesarik.ext@huawei.com>
 <20230731160409.GA8991@lst.de> <20230731214618.6e7cde05@meshulam.tesarici.cz>
From: Petr Tesarik <petrtesarik@huaweicloud.com>
In-Reply-To: <20230731214618.6e7cde05@meshulam.tesarici.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwC3abkdpshkKRcYAA--.13561S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYc7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87
	Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwAC
	I402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI
	42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWI
	evJa73UjIFyTuYvjfUoL0eDUUUU
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

On 7/31/2023 9:46 PM, Petr Tesařík wrote:
> V Mon, 31 Jul 2023 18:04:09 +0200
> Christoph Hellwig <hch@lst.de> napsáno:
> 
>> I was just going to apply this, but patch 1 seems to have a non-trivial
>> conflict with the is_swiotlb_active removal in pci-dma.c.  Can you resend
>> against the current dma-mapping for-next tree?
> 
> Sure thing, will re-send tomorrow morning.

After commit f9a38ea5172a ("x86: always initialize xen-swiotlb when
xen-pcifront is enabling") removed that call to swiotlb_init_late(),
there is nothing to patch, and the hunk can be dropped.

I have just sent v7.

Petr T


