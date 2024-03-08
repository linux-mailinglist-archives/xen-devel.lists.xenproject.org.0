Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4F876969
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 18:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690359.1076259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ridnk-0001F0-6h; Fri, 08 Mar 2024 17:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690359.1076259; Fri, 08 Mar 2024 17:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ridnk-0001DR-3r; Fri, 08 Mar 2024 17:14:32 +0000
Received: by outflank-mailman (input) for mailman id 690359;
 Fri, 08 Mar 2024 17:14:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c5Q=KO=samsung.com=m.szyprowski@srs-se1.protection.inumbo.net>)
 id 1ridni-0001DL-0y
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 17:14:30 +0000
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f86b800-dd6f-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 18:14:26 +0100 (CET)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240308171423euoutp01b376bd1afabfb23ebe82e3516c38fac9~62WtkzBrg1001510015euoutp01s
 for <xen-devel@lists.xenproject.org>; Fri,  8 Mar 2024 17:14:23 +0000 (GMT)
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240308171423eucas1p2371311a5b08d9706eaf93179362c94a4~62WtQk0AA1558315583eucas1p2a;
 Fri,  8 Mar 2024 17:14:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D8.9D.09552.F674BE56; Fri,  8
 Mar 2024 17:14:23 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240308171422eucas1p293895be469655aa618535cf199b0c43a~62WsXkhLx1558115581eucas1p2O;
 Fri,  8 Mar 2024 17:14:22 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240308171422eusmtrp24638ab6298336da4c1c0e8a41a4a64fc~62WsW41FF2621526215eusmtrp2E;
 Fri,  8 Mar 2024 17:14:22 +0000 (GMT)
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 02.2F.09146.E674BE56; Fri,  8
 Mar 2024 17:14:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240308171421eusmtip21f5afb8678a08bd51cca727cfeea567f~62WrRSVaA2266422664eusmtip2R;
 Fri,  8 Mar 2024 17:14:21 +0000 (GMT)
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
X-Inumbo-ID: 4f86b800-dd6f-11ee-afda-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240308171423euoutp01b376bd1afabfb23ebe82e3516c38fac9~62WtkzBrg1001510015euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1709918063;
	bh=DSDacrVBnLQUXSKvLn3/E67RoDPwbljmlkbfkQl9jbw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=c9Xdc3MH/xVf6+dULK54d9bPJDYmO7KLujMYxCNxfOcZcvVDqr8/dd7163R7/ZzL1
	 Ap5hL6uI8DFKeOqH8jhDEbyJLQ955dLiCyVsA5dfOENtXhUu3TrDktjjb33dXu6Ja2
	 RSYL6IamUWzMUdlJ3NuP5ynIy1s0n41r1uV2fplQ=
X-AuditID: cbfec7f5-853ff70000002550-40-65eb476faf57
Message-ID: <1f49d568-24f9-4003-b222-515f33a99cf2@samsung.com>
Date: Fri, 8 Mar 2024 18:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 bpf-next 1/2] mm: Enforce VM_IOREMAP flag and range
 in ioremap_page_range.
Content-Language: en-US
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org
Cc: daniel@iogearbox.net, andrii@kernel.org, torvalds@linux-foundation.org,
	brho@google.com, hannes@cmpxchg.org, lstoakes@gmail.com,
	akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
	rppt@kernel.org, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
	jgross@suse.com, linux-mm@kvack.org, xen-devel@lists.xenproject.org,
	kernel-team@fb.com
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240305030516.41519-2-alexei.starovoitov@gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7djP87r57q9TDVadFLGYs34Nm0XD4w5W
	i++/ZzNbXJzeymLx+chxNourPZ9ZLBYv/MZssXqTr8XpCYuYLObcNLI41vee1eLemv+sFne+
	zWO3OLJ+O5PF6nXxFo/63rJbrL7IYvF9y2QmByGPw2/eM3tMbH7H7rFz1l12jwWbSj02r9Dy
	6Lpxidlj06pONo9Nnyaxe5yY8ZvF4/CHKyweH5/eYvFYv+Uqi8fnTXIBvFFcNimpOZllqUX6
	dglcGScWzWMsOKdc8WzdWfYGxslyXYwcHBICJhLrbiZ2MXJxCAmsYJRY2DOFGcL5wijRM+kd
	I4TzmVHi768zQA4nWMfaqU1MEInljBL37/+GqvrIKPFm01VmkCpeATuJbQ8XM4HYLAIqEn/a
	H7NDxAUlTs58wgJiiwrIS9y/NQMsLiyQLHH57wUwm1lAXOLWk/lgvSICXhJ3t7axQMRfM0ns
	vloBYrMJGEp0ve1iA7E5BZwk9j56zApRIy/RvHU22A8SAvc4Je5u+80GcbaLxP7tk6BeEJZ4
	dXwLO4QtI/F/53wmiIZ2RokFv+9DORMYJRqe34LqsJa4c+4XGyjImAU0Jdbv0ocIO0pM6XjH
	BAlJPokbbwUhjuCTmLRtOjNEmFeio00IolpNYtbxdXBrD164xDyBUWkWUrDMQvL+LCTvzELY
	u4CRZRWjeGppcW56arFxXmq5XnFibnFpXrpecn7uJkZg2jz97/jXHYwrXn3UO8TIxMF4iFGC
	g1lJhJfF4mWqEG9KYmVValF+fFFpTmrxIUZpDhYlcV7VFPlUIYH0xJLU7NTUgtQimCwTB6dU
	A5M4z6VXBs4R515kOB54fal0Y0Pt2Vcr1E8F7tRgiGmPWXjm1I50i/5bTc1Ho4O5e1I4A393
	xxQun3b1I3d7eN6uHlezg2L/vm8yZolO04iZo75cYbf46Sw17fTkztWT+1Z9tn20/cS2D6+s
	1+s62rydEf6t8fQ7xRvvL2/ylnr590JUoWJN2Y/b/EwLayesOprhzNd16/ESry9Xipcv+lw6
	g4HJOsFBYuebx7btx0Krzz+RuZellpA86a7z9I27vDQePjNITNQ/foyv7c6Mp+tj8oKWf9q6
	aSbH1nfVEj/a1f+d1BZ7PWVh8T2m3fvPyac3PJQ/cOCm6mnHskXTNfS1YupdGhQkDylV+aXr
	M2crsRRnJBpqMRcVJwIA1gwiTQoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42I5/e/4Pd0899epBq3bpSzmrF/DZtHwuIPV
	4vvv2cwWF6e3slh8PnKczeJqz2cWi8ULvzFbrN7ka3F6wiImizk3jSyO9b1ntbi35j+rxZ1v
	89gtjqzfzmSxel28xaO+t+wWqy+yWHzfMpnJQcjj8Jv3zB4Tm9+xe+ycdZfdY8GmUo/NK7Q8
	um5cYvbYtKqTzWPTp0nsHidm/GbxOPzhCovHx6e3WDzWb7nK4vF5k1wAb5SeTVF+aUmqQkZ+
	cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexolF8xgLzilXPFt3lr2B
	cbJcFyMnh4SAicTaqU1MXYxcHEICSxklXsx/wwqRkJE4Oa0ByhaW+HOtiw2i6D2jxN5zrewg
	CV4BO4ltDxczgdgsAioSf9ofQ8UFJU7OfMICYosKyEvcvzUDLC4skCzx8uUjsKHMAuISt57M
	B+sVEfCSuLu1jQVkAbPAayaJ+0tbGEESQgKVEu/Xd4M1sAkYSnS9BbmCk4NTwEli76PHUIPM
	JLq2djFC2PISzVtnM09gFJqF5I5ZSPbNQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ
	+bmbGIGJYtuxn5t3MM579VHvECMTB+MhRgkOZiURXhaLl6lCvCmJlVWpRfnxRaU5qcWHGE2B
	gTGRWUo0OR+YqvJK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpic
	Js67+29/Ar8Dd3hCoWv05FdBc6SCp88z5RXlWbfmaZLzIUmn6K4wgZaFff9d/LeaLOZ71FQ+
	fYHrg46rc44eutZkl3zj9VEbmYmv5zembVjNVnvVs8LT/tOBW09ZV9vY37OZxxzP/qNUcMIW
	UbeCaVN/eT14l8ms73Ks2aZKdEYAX/3Ry5sNE0ymGcT6faybv4XjX29B80bLr32RFssm+Nfy
	7+5zqWirdOY6q7xsQdVjL+b2CxKeuXPT5P5KP9Lgklq/7vo6qalaLTYzvRTmSnreXS5+4Lzg
	kUTv73YCfQFn351dEH6l0sCXK0BVRok7QTvU3u3iuvnaFTyM899oXvptySbxcubJKuGl4kos
	xRmJhlrMRcWJAJJePS+dAwAA
X-CMS-MailID: 20240308171422eucas1p293895be469655aa618535cf199b0c43a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240308171422eucas1p293895be469655aa618535cf199b0c43a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240308171422eucas1p293895be469655aa618535cf199b0c43a
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
	<20240305030516.41519-2-alexei.starovoitov@gmail.com>
	<CGME20240308171422eucas1p293895be469655aa618535cf199b0c43a@eucas1p2.samsung.com>

On 05.03.2024 04:05, Alexei Starovoitov wrote:
> From: Alexei Starovoitov <ast@kernel.org>
>
> There are various users of get_vm_area() + ioremap_page_range() APIs.
> Enforce that get_vm_area() was requested as VM_IOREMAP type and range
> passed to ioremap_page_range() matches created vm_area to avoid
> accidentally ioremap-ing into wrong address range.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> ---

This patch landed in today's linux-next as commit 3e49a866c9dc ("mm: 
Enforce VM_IOREMAP flag and range in ioremap_page_range."). 
Unfortunately it triggers the following warning on all my test machines 
with PCI bridges. Here is an example reproduced with QEMU and ARM64 
'virt' machine:

pci-host-generic 4010000000.pcie: host bridge /pcie@10000000 ranges:
pci-host-generic 4010000000.pcie:       IO 0x003eff0000..0x003effffff -> 
0x0000000000
pci-host-generic 4010000000.pcie:      MEM 0x0010000000..0x003efeffff -> 
0x0010000000
pci-host-generic 4010000000.pcie:      MEM 0x8000000000..0xffffffffff -> 
0x8000000000
------------[ cut here ]------------
vm_area at addr fffffbfffe800000 is not marked as VM_IOREMAP
WARNING: CPU: 0 PID: 1 at mm/vmalloc.c:315 ioremap_page_range+0x8c/0x174
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.8.0-rc6+ #14694
Hardware name: linux,dummy-virt (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : ioremap_page_range+0x8c/0x174
lr : ioremap_page_range+0x8c/0x174
sp : ffff800083faba10
...
Call trace:
  ioremap_page_range+0x8c/0x174
  pci_remap_iospace+0x74/0x88
  devm_pci_remap_iospace+0x54/0xac
  devm_of_pci_bridge_init+0x160/0x1fc
  devm_pci_alloc_host_bridge+0xb4/0xd0
  pci_host_common_probe+0x44/0x1a0
  platform_probe+0x68/0xd8
  really_probe+0x148/0x2b4
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0xdc/0x164
  __driver_attach+0x9c/0x1ac
  bus_for_each_dev+0x74/0xd4
  driver_attach+0x24/0x30
  bus_add_driver+0xe4/0x1e8
  driver_register+0x60/0x128
  __platform_driver_register+0x28/0x34
  gen_pci_driver_init+0x1c/0x28
  do_one_initcall+0x74/0x2f4
  kernel_init_freeable+0x28c/0x4dc
  kernel_init+0x24/0x1dc
  ret_from_fork+0x10/0x20
irq event stamp: 74360
hardirqs last  enabled at (74359): [<ffff80008012cb9c>] 
console_unlock+0x120/0x12c
hardirqs last disabled at (74360): [<ffff80008122daa0>] el1_dbg+0x24/0x8c
softirqs last  enabled at (71258): [<ffff800080010a60>] 
__do_softirq+0x4a0/0x4e8
softirqs last disabled at (71245): [<ffff8000800169b0>] 
____do_softirq+0x10/0x1c
---[ end trace 0000000000000000 ]---
pci-host-generic 4010000000.pcie: error -22: failed to map resource [io  
0x0000-0xffff]
pci-host-generic 4010000000.pcie: Memory resource size exceeds max for 
32 bits
pci-host-generic 4010000000.pcie: ECAM at [mem 
0x4010000000-0x401fffffff] for [bus 00-ff]
pci-host-generic 4010000000.pcie: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: root bus resource [mem 0x10000000-0x3efeffff]
pci_bus 0000:00: root bus resource [mem 0x8000000000-0xffffffffff]
pci 0000:00:00.0: [1b36:0008] type 00 class 0x060000 conventional PCI 
endpoint

It looks that PCI related code must be somehow adjusted for this change.

>   mm/vmalloc.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index d12a17fc0c17..f42f98a127d5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -307,8 +307,21 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
>   int ioremap_page_range(unsigned long addr, unsigned long end,
>   		phys_addr_t phys_addr, pgprot_t prot)
>   {
> +	struct vm_struct *area;
>   	int err;
>   
> +	area = find_vm_area((void *)addr);
> +	if (!area || !(area->flags & VM_IOREMAP)) {
> +		WARN_ONCE(1, "vm_area at addr %lx is not marked as VM_IOREMAP\n", addr);
> +		return -EINVAL;
> +	}
> +	if (addr != (unsigned long)area->addr ||
> +	    (void *)end != area->addr + get_vm_area_size(area)) {
> +		WARN_ONCE(1, "ioremap request [%lx,%lx) doesn't match vm_area [%lx, %lx)\n",
> +			  addr, end, (long)area->addr,
> +			  (long)area->addr + get_vm_area_size(area));
> +		return -ERANGE;
> +	}
>   	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
>   				 ioremap_max_page_shift);
>   	flush_cache_vmap(addr, end);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


