Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27224168D1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194655.346800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTYqe-0003AT-0V; Fri, 24 Sep 2021 00:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194655.346800; Fri, 24 Sep 2021 00:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTYqd-00037x-Tm; Fri, 24 Sep 2021 00:13:51 +0000
Received: by outflank-mailman (input) for mailman id 194655;
 Fri, 24 Sep 2021 00:13:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTYqc-00037p-7J
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:13:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a2b7818-1ccc-11ec-ba94-12813bfff9fa;
 Fri, 24 Sep 2021 00:13:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6656604DA;
 Fri, 24 Sep 2021 00:13:47 +0000 (UTC)
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
X-Inumbo-ID: 4a2b7818-1ccc-11ec-ba94-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632442428;
	bh=AClTcpI6SS4SJZM02TDSA/EjB0ezS8k/vLR0zqvwqRU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ubl69uLnOmRxDTGQmwtLXp0cqOBO83r8QigFnSR6v0SypAcNp/clbkCbYsvBe+iGA
	 MIGASeRYM24jaux6bBtJfLrNPbODZeBjPsx71YEO9AzuzaKlJ3oJY8+1gfazoCeRoL
	 3D+e2Erq5xWz5Pl5IgNSAwCuxiKYGRE8yv7ML9LN3dM+LvFTzcuAfsawKVS30sYr5M
	 k1pj1c4N6+aywHhHitR397kYk8UvBWv3fnuBGVmQMsiG1o+2j+q6Qd5ndARUwIOr2w
	 kNrHnOZLu3J+VqV/hNVyQv7Z/dAqjshIudLLsFDwpF5smt23+wZ9vl2x7S+Dwk8YWR
	 0qMPJm6H7m3Fw==
Date: Thu, 23 Sep 2021 17:13:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org, 
    julien@xen.org, Bertrand.Marquis@arm.com, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 07/37] xen/x86: use paddr_t for addresses in NUMA node
 structure
In-Reply-To: <alpine.DEB.2.21.2109231709360.17979@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2109231712550.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-8-wei.chen@arm.com> <alpine.DEB.2.21.2109231709360.17979@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

You forgot to add the x86 maintainers in CC to all the patches touching
x86 code in this series. Adding them now but you should probably resend.


On Thu, 23 Sep 2021, Stefano Stabellini wrote:
> On Thu, 23 Sep 2021, Wei Chen wrote:
> > NUMA node structure "struct node" is using u64 as node memory
> > range. In order to make other architectures can reuse this
> > NUMA node relative code, we replace the u64 to paddr_t. And
> > use pfn_to_paddr and paddr_to_pfn to replace explicit shift
> > operations. The relate PRIx64 in print messages have been
> > replaced by PRIpaddr at the same time.
> > 
> > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > ---
> >  xen/arch/x86/numa.c        | 32 +++++++++++++++++---------------
> >  xen/arch/x86/srat.c        | 26 +++++++++++++-------------
> >  xen/include/asm-x86/numa.h |  8 ++++----
> >  3 files changed, 34 insertions(+), 32 deletions(-)
> > 
> > diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> > index 1fabbe8281..6337bbdf31 100644
> > --- a/xen/arch/x86/numa.c
> > +++ b/xen/arch/x86/numa.c
> > @@ -165,12 +165,12 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
> >      return shift;
> >  }
> >  /* initialize NODE_DATA given nodeid and start/end */
> > -void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
> > -{ 
> > +void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
> > +{
> >      unsigned long start_pfn, end_pfn;
> >  
> > -    start_pfn = start >> PAGE_SHIFT;
> > -    end_pfn = end >> PAGE_SHIFT;
> > +    start_pfn = paddr_to_pfn(start);
> > +    end_pfn = paddr_to_pfn(end);
> >  
> >      NODE_DATA(nodeid)->node_start_pfn = start_pfn;
> >      NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
> > @@ -201,11 +201,12 @@ void __init numa_init_array(void)
> >  static int numa_fake __initdata = 0;
> >  
> >  /* Numa emulation */
> > -static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
> > +static int __init numa_emulation(unsigned long start_pfn,
> > +                                 unsigned long end_pfn)
> 
> Why not changing numa_emulation to take paddr_t too?
> 
> 
> >  {
> >      int i;
> >      struct node nodes[MAX_NUMNODES];
> > -    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
> > +    u64 sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
> >  
> >      /* Kludge needed for the hash function */
> >      if ( hweight64(sz) > 1 )
> > @@ -221,9 +222,9 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
> >      memset(&nodes,0,sizeof(nodes));
> >      for ( i = 0; i < numa_fake; i++ )
> >      {
> > -        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
> > +        nodes[i].start = pfn_to_paddr(start_pfn) + i*sz;
> >          if ( i == numa_fake - 1 )
> > -            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
> > +            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
> >          nodes[i].end = nodes[i].start + sz;
> >          printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
> >                 i,
> > @@ -249,24 +250,26 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
> >  void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
> 
> same here
> 
> 
> >  { 
> >      int i;
> > +    paddr_t start, end;
> >  
> >  #ifdef CONFIG_NUMA_EMU
> >      if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
> >          return;
> >  #endif
> >  
> > +    start = pfn_to_paddr(start_pfn);
> > +    end = pfn_to_paddr(end_pfn);
> > +
> >  #ifdef CONFIG_ACPI_NUMA
> > -    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
> > -         (u64)end_pfn << PAGE_SHIFT) )
> > +    if ( !numa_off && !acpi_scan_nodes(start, end) )
> >          return;
> >  #endif
> >  
> >      printk(KERN_INFO "%s\n",
> >             numa_off ? "NUMA turned off" : "No NUMA configuration found");
> >  
> > -    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
> > -           (u64)start_pfn << PAGE_SHIFT,
> > -           (u64)end_pfn << PAGE_SHIFT);
> > +    printk(KERN_INFO "Faking a node at %016"PRIpaddr"-%016"PRIpaddr"\n",
> > +           start, end);
> >      /* setup dummy node covering all memory */
> >      memnode_shift = BITS_PER_LONG - 1;
> >      memnodemap = _memnodemap;
> > @@ -279,8 +282,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
> >      for ( i = 0; i < nr_cpu_ids; i++ )
> >          numa_set_node(i, 0);
> >      cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
> > -    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
> > -                    (u64)end_pfn << PAGE_SHIFT);
> > +    setup_node_bootmem(0, start, end);
> >  }
> >  
> >  void numa_add_cpu(int cpu)
> > diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> > index 6b77b98201..7d20d7f222 100644
> > --- a/xen/arch/x86/srat.c
> > +++ b/xen/arch/x86/srat.c
> > @@ -104,7 +104,7 @@ nodeid_t setup_node(unsigned pxm)
> >  	return node;
> >  }
> >  
> > -int valid_numa_range(u64 start, u64 end, nodeid_t node)
> > +int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
> >  {
> >  	int i;
> >  
> > @@ -119,7 +119,7 @@ int valid_numa_range(u64 start, u64 end, nodeid_t node)
> >  	return 0;
> >  }
> >  
> > -static __init int conflicting_memblks(u64 start, u64 end)
> > +static __init int conflicting_memblks(paddr_t start, paddr_t end)
> >  {
> >  	int i;
> >  
> > @@ -135,7 +135,7 @@ static __init int conflicting_memblks(u64 start, u64 end)
> >  	return -1;
> >  }
> >  
> > -static __init void cutoff_node(int i, u64 start, u64 end)
> > +static __init void cutoff_node(int i, paddr_t start, paddr_t end)
> >  {
> >  	struct node *nd = &nodes[i];
> >  	if (nd->start < start) {
> > @@ -275,7 +275,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
> >  void __init
> >  acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> >  {
> > -	u64 start, end;
> > +	paddr_t start, end;
> >  	unsigned pxm;
> >  	nodeid_t node;
> >  	int i;
> > @@ -318,7 +318,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> >  		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
> >  		                !test_bit(i, memblk_hotplug);
> >  
> > -		printk("%sSRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with itself (%"PRIx64"-%"PRIx64")\n",
> > +		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
> >  		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
> >  		       node_memblk_range[i].start, node_memblk_range[i].end);
> >  		if (mismatch) {
> > @@ -327,7 +327,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> >  		}
> >  	} else {
> >  		printk(KERN_ERR
> > -		       "SRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with PXM %u (%"PRIx64"-%"PRIx64")\n",
> > +		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
> >  		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
> >  		       node_memblk_range[i].start, node_memblk_range[i].end);
> >  		bad_srat();
> > @@ -346,7 +346,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> >  				nd->end = end;
> >  		}
> >  	}
> > -	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIx64"-%"PRIx64"%s\n",
> > +	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
> >  	       node, pxm, start, end,
> >  	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
> >  
> > @@ -369,7 +369,7 @@ static int __init nodes_cover_memory(void)
> >  
> >  	for (i = 0; i < e820.nr_map; i++) {
> >  		int j, found;
> > -		unsigned long long start, end;
> > +		paddr_t start, end;
> >  
> >  		if (e820.map[i].type != E820_RAM) {
> >  			continue;
> > @@ -396,7 +396,7 @@ static int __init nodes_cover_memory(void)
> >  
> >  		if (start < end) {
> >  			printk(KERN_ERR "SRAT: No PXM for e820 range: "
> > -				"%016Lx - %016Lx\n", start, end);
> > +				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
> >  			return 0;
> >  		}
> >  	}
> > @@ -432,7 +432,7 @@ static int __init srat_parse_region(struct acpi_subtable_header *header,
> >  	return 0;
> >  }
> >  
> > -void __init srat_parse_regions(u64 addr)
> > +void __init srat_parse_regions(paddr_t addr)
> >  {
> >  	u64 mask;
> >  	unsigned int i;
> > @@ -441,7 +441,7 @@ void __init srat_parse_regions(u64 addr)
> >  	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
> >  		return;
> >  
> > -	srat_region_mask = pdx_init_mask(addr);
> > +	srat_region_mask = pdx_init_mask((u64)addr);
> >  	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
> >  			      srat_parse_region, 0);
> >  
> > @@ -457,7 +457,7 @@ void __init srat_parse_regions(u64 addr)
> >  }
> >  
> >  /* Use the information discovered above to actually set up the nodes. */
> > -int __init acpi_scan_nodes(u64 start, u64 end)
> > +int __init acpi_scan_nodes(paddr_t start, paddr_t end)
> >  {
> >  	int i;
> >  	nodemask_t all_nodes_parsed;
> > @@ -489,7 +489,7 @@ int __init acpi_scan_nodes(u64 start, u64 end)
> >  	/* Finally register nodes */
> >  	for_each_node_mask(i, all_nodes_parsed)
> >  	{
> > -		u64 size = nodes[i].end - nodes[i].start;
> > +		paddr_t size = nodes[i].end - nodes[i].start;
> >  		if ( size == 0 )
> >  			printk(KERN_WARNING "SRAT: Node %u has no memory. "
> >  			       "BIOS Bug or mis-configured hardware?\n", i);
> > diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> > index 8060cbf3f4..50cfd8e7ef 100644
> > --- a/xen/include/asm-x86/numa.h
> > +++ b/xen/include/asm-x86/numa.h
> > @@ -16,7 +16,7 @@ extern cpumask_t     node_to_cpumask[];
> >  #define node_to_cpumask(node)    (node_to_cpumask[node])
> >  
> >  struct node { 
> > -	u64 start,end; 
> > +	paddr_t start,end;
> >  };
> >  
> >  extern int compute_hash_shift(struct node *nodes, int numnodes,
> > @@ -36,7 +36,7 @@ extern void numa_set_node(int cpu, nodeid_t node);
> >  extern nodeid_t setup_node(unsigned int pxm);
> >  extern void srat_detect_node(int cpu);
> >  
> > -extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
> > +extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
> >  extern nodeid_t apicid_to_node[];
> >  extern void init_cpu_to_node(void);
> >  
> > @@ -73,9 +73,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
> >  #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
> >  				 NODE_DATA(nid)->node_spanned_pages)
> >  
> > -extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
> > +extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
> >  
> > -void srat_parse_regions(u64 addr);
> > +void srat_parse_regions(paddr_t addr);
> >  extern u8 __node_distance(nodeid_t a, nodeid_t b);
> >  unsigned int arch_get_dma_bitsize(void);
> >  unsigned int arch_have_default_dmazone(void);
> > -- 
> > 2.25.1
> > 
> 

