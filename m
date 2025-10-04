Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B86BB8A3F
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 08:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137262.1473574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4w6G-0007Ng-2i; Sat, 04 Oct 2025 06:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137262.1473574; Sat, 04 Oct 2025 06:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4w6F-0007Kw-Vr; Sat, 04 Oct 2025 06:50:35 +0000
Received: by outflank-mailman (input) for mailman id 1137262;
 Sat, 04 Oct 2025 06:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uhzs=4N=csgroup.eu=christophe.leroy@srs-se1.protection.inumbo.net>)
 id 1v4w6E-0007Kq-SO
 for xen-devel@lists.xenproject.org; Sat, 04 Oct 2025 06:50:34 +0000
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6c3884fc-a0ee-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 08:50:32 +0200 (CEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4cdwNt1QHbz9sS7;
 Sat,  4 Oct 2025 08:19:42 +0200 (CEST)
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_idirMR5ok8; Sat,  4 Oct 2025 08:19:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4cdwNt0Pvmz9sRy;
 Sat,  4 Oct 2025 08:19:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8E218B768;
 Sat,  4 Oct 2025 08:19:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FGXi2r7cLeL7; Sat,  4 Oct 2025 08:19:41 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A40F08B766;
 Sat,  4 Oct 2025 08:19:40 +0200 (CEST)
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
X-Inumbo-ID: 6c3884fc-a0ee-11f0-9809-7dc792cee155
X-Virus-Scanned: amavisd-new at c-s.fr
X-Virus-Scanned: amavisd-new at c-s.fr
Message-ID: <909c5ab3-b3d3-4b5b-bc64-8b30c220ac92@csgroup.eu>
Date: Sat, 4 Oct 2025 08:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/9] powerpc: Convert to physical address DMA mapping
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Leon Romanovsky <leonro@nvidia.com>, Andreas Larsson <andreas@gaisler.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Geoff Levand <geoff@infradead.org>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 iommu@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux.dev,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 Magnus Lindholm <linmag7@gmail.com>
References: <cover.1759071169.git.leon@kernel.org>
 <f2b69a0ac2308cc8fd8635dceac951670d41cea2.1759071169.git.leon@kernel.org>
 <20251003163505.GI3360665@nvidia.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251003163505.GI3360665@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 03/10/2025 à 18:35, Jason Gunthorpe a écrit :
> On Sun, Sep 28, 2025 at 06:02:24PM +0300, Leon Romanovsky wrote:
>> From: Leon Romanovsky <leonro@nvidia.com>
>>
>> Adapt PowerPC DMA to use physical addresses in order to prepare code
>> to removal .map_page and .unmap_page.
>>
>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> ---
>>   arch/powerpc/include/asm/iommu.h         |  8 +++---
>>   arch/powerpc/kernel/dma-iommu.c          | 22 +++++++---------
>>   arch/powerpc/kernel/iommu.c              | 14 +++++-----
>>   arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++++++----------
>>   arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++++-----
>>   arch/powerpc/platforms/pseries/vio.c     | 21 ++++++++-------
>>   6 files changed, 60 insertions(+), 53 deletions(-)
> 
> I think this is good enough for PPC anything more looks quite hard

Can you tell what you have in mind ? What more would be interesting to 
do but looks hard ? Maybe it can be a follow-up change ?

Christophe

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason
> 


