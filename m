Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C076BAC1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 19:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574446.899708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQsop-0008H1-TE; Tue, 01 Aug 2023 17:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574446.899708; Tue, 01 Aug 2023 17:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQsop-0008FP-QU; Tue, 01 Aug 2023 17:05:59 +0000
Received: by outflank-mailman (input) for mailman id 574446;
 Tue, 01 Aug 2023 17:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jaq7=DS=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qQsoo-0008FJ-RK
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 17:05:58 +0000
Received: from frasgout13.his.huawei.com
 (ecs-14-137-139-46.compute.hwclouds-dns.com [14.137.139.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad73914e-308d-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 19:05:56 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4RFh6D0F8tz9yMKx
 for <xen-devel@lists.xenproject.org>; Wed,  2 Aug 2023 00:54:28 +0800 (CST)
Received: from [10.81.206.119] (unknown [10.81.206.119])
 by APP1 (Coremail) with SMTP id LxC2BwAn2bg5O8lkq2QeAA--.14915S2;
 Tue, 01 Aug 2023 18:05:17 +0100 (CET)
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
X-Inumbo-ID: ad73914e-308d-11ee-b25c-6b7b168915f2
Message-ID: <56be3268-60ee-a496-4781-a59ce34bfca8@huaweicloud.com>
Date: Tue, 1 Aug 2023 19:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] Allow dynamic allocation of software IO TLB bounce
 buffers
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
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
 Roberto Sassu <roberto.sassu@huaweicloud.com>, petr@tesarici.cz
References: <cover.1690871004.git.petr.tesarik.ext@huawei.com>
 <20230801160339.GB13111@lst.de>
From: Petr Tesarik <petrtesarik@huaweicloud.com>
In-Reply-To: <20230801160339.GB13111@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwAn2bg5O8lkq2QeAA--.14915S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY77AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4II
	rI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
	cVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2Kf
	nxnUUI43ZEXa7VUbJ73DUUUUU==
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

On 8/1/2023 6:03 PM, Christoph Hellwig wrote:
> Thanks,
> 
> I've applied this to a new swiotlb-dynamic branch that I'll pull into
> the dma-mapping for-next tree.

Thank you.

I guess I can prepare some follow-up series now. ;-)

Petr T


