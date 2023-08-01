Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9476A9E1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 09:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573718.898685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjg6-0005Uj-Vs; Tue, 01 Aug 2023 07:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573718.898685; Tue, 01 Aug 2023 07:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjg6-0005SR-S9; Tue, 01 Aug 2023 07:20:22 +0000
Received: by outflank-mailman (input) for mailman id 573718;
 Tue, 01 Aug 2023 07:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSu=DS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQjg5-0005SL-Fr
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 07:20:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df36b3f0-303b-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 09:20:20 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C882D4EE0737;
 Tue,  1 Aug 2023 09:20:19 +0200 (CEST)
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
X-Inumbo-ID: df36b3f0-303b-11ee-b259-6b7b168915f2
MIME-Version: 1.0
Date: Tue, 01 Aug 2023 09:20:19 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/4] xen: rename variables and parameters to address
 MISRA C:2012 Rule 5.3
In-Reply-To: <f12b9c37-b7d0-ce03-024d-709a7fda7f26@suse.com>
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
 <8aebc67a150cb4116affdd6da755a8e82c827ffa.1690810346.git.nicola.vetrini@bugseng.com>
 <f12b9c37-b7d0-ce03-024d-709a7fda7f26@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <2e0a88de6c6d0e7ef23bf14f0f945c0f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 31/07/2023 16:34, Jan Beulich wrote:
> On 31.07.2023 15:35, Nicola Vetrini wrote:
>> Rule 5.3 has the following headline:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>> 
>> Local variables have been suitably renamed to address some violations
>> of this rule:
>> - s/cmp/c/ because it shadows the union declared at line 87.
>> - s/nodes/numa_nodes/ shadows the static variable declared at line 18.
>> - s/ctrl/controller/ because the homonymous function parameter is 
>> later
>>   read.
>> - s/baud/baud_rate/ to avoid shadowing the enum constant defined
>>   at line 1391.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/common/compat/memory.c   |  6 +++---
>>  xen/common/numa.c            | 36 
>> ++++++++++++++++++------------------
>>  xen/drivers/char/ehci-dbgp.c |  4 ++--
>>  xen/drivers/char/ns16550.c   |  4 ++--
>>  4 files changed, 25 insertions(+), 25 deletions(-)
> 
> This is an odd mix of files touched in a single patch. How about 
> splitting
> into two, one for common/ and one for drivers/?
> 

Ok, I'll do it.

>> --- a/xen/common/compat/memory.c
>> +++ b/xen/common/compat/memory.c
>> @@ -321,12 +321,12 @@ int compat_memory_op(unsigned int cmd, 
>> XEN_GUEST_HANDLE_PARAM(void) compat)
>> 
>>          case XENMEM_remove_from_physmap:
>>          {
>> -            struct compat_remove_from_physmap cmp;
>> +            struct compat_remove_from_physmap c;
> 
> The intention of the outer scope cmp is to avoid such inner scope
> ones then consuming extra stack space. This wants making part of the
> union there.
> 

Makes sense, though I've not been able to find a definition for the type
'struct compat_remove_from_physmap'.

>> --- a/xen/common/numa.c
>> +++ b/xen/common/numa.c
>> @@ -382,7 +382,7 @@ static bool __init numa_process_nodes(paddr_t 
>> start, paddr_t end)
>>   * 0 if memnodmap[] too small (or shift too small)
>>   * -1 if node overlap or lost ram (shift too big)
>>   */
>> -static int __init populate_memnodemap(const struct node *nodes,
>> +static int __init populate_memnodemap(const struct node *numa_nodes,
>>                                        unsigned int numnodes, unsigned 
>> int shift,
>>                                        const nodeid_t *nodeids)
>>  {
>> @@ -393,8 +393,8 @@ static int __init populate_memnodemap(const struct 
>> node *nodes,
>> 
>>      for ( i = 0; i < numnodes; i++ )
>>      {
>> -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
>> -        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
>> +        unsigned long spdx = paddr_to_pdx(numa_nodes[i].start);
>> +        unsigned long epdx = paddr_to_pdx(numa_nodes[i].end - 1);
>> 
>>          if ( spdx > epdx )
>>              continue;
>> @@ -440,7 +440,7 @@ static int __init 
>> allocate_cachealigned_memnodemap(void)
>>   * The LSB of all start addresses in the node map is the value of the
>>   * maximum possible shift.
>>   */
>> -static unsigned int __init extract_lsb_from_nodes(const struct node 
>> *nodes,
>> +static unsigned int __init extract_lsb_from_nodes(const struct node 
>> *numa_nodes,
>>                                                    nodeid_t numnodes,
>>                                                    const nodeid_t 
>> *nodeids)
>>  {
>> @@ -449,8 +449,8 @@ static unsigned int __init 
>> extract_lsb_from_nodes(const struct node *nodes,
>> 
>>      for ( i = 0; i < numnodes; i++ )
>>      {
>> -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
>> -        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
>> +        unsigned long spdx = paddr_to_pdx(numa_nodes[i].start);
>> +        unsigned long epdx = paddr_to_pdx(numa_nodes[i].end - 1) + 1;
>> 
>>          if ( spdx >= epdx )
>>              continue;
>> @@ -475,10 +475,10 @@ static unsigned int __init 
>> extract_lsb_from_nodes(const struct node *nodes,
>>      return i;
>>  }
>> 
>> -int __init compute_hash_shift(const struct node *nodes,
>> +int __init compute_hash_shift(const struct node *numa_nodes,
>>                                unsigned int numnodes, const nodeid_t 
>> *nodeids)
>>  {
>> -    unsigned int shift = extract_lsb_from_nodes(nodes, numnodes, 
>> nodeids);
>> +    unsigned int shift = extract_lsb_from_nodes(numa_nodes, numnodes, 
>> nodeids);
>> 
>>      if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
>>          memnodemap = _memnodemap;
>> @@ -487,7 +487,7 @@ int __init compute_hash_shift(const struct node 
>> *nodes,
>> 
>>      printk(KERN_DEBUG "NUMA: Using %u for the hash shift\n", shift);
>> 
>> -    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
>> +    if ( populate_memnodemap(numa_nodes, numnodes, shift, nodeids) != 
>> 1 )
>>      {
>>          printk(KERN_INFO "Your memory is not aligned you need to "
>>                 "rebuild your hypervisor with a bigger NODEMAPSIZE "
>> @@ -541,7 +541,7 @@ static int __init numa_emulation(unsigned long 
>> start_pfn,
>>  {
>>      int ret;
>>      unsigned int i;
>> -    struct node nodes[MAX_NUMNODES];
>> +    struct node numa_nodes[MAX_NUMNODES];
>>      uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
>> 
>>      /* Kludge needed for the hash function */
>> @@ -556,22 +556,22 @@ static int __init numa_emulation(unsigned long 
>> start_pfn,
>>          sz = x;
>>      }
>> 
>> -    memset(&nodes, 0, sizeof(nodes));
>> +    memset(&numa_nodes, 0, sizeof(numa_nodes));
>>      for ( i = 0; i < numa_fake; i++ )
>>      {
>> -        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
>> +        numa_nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
>> 
>>          if ( i == numa_fake - 1 )
>> -            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
>> +            sz = pfn_to_paddr(end_pfn) - numa_nodes[i].start;
>> 
>> -        nodes[i].end = nodes[i].start + sz;
>> +        numa_nodes[i].end = numa_nodes[i].start + sz;
>>          printk(KERN_INFO "Faking node %u at %"PRIx64"-%"PRIx64" 
>> (%"PRIu64"MB)\n",
>> -               i, nodes[i].start, nodes[i].end,
>> -               (nodes[i].end - nodes[i].start) >> 20);
>> +               i, numa_nodes[i].start, numa_nodes[i].end,
>> +               (numa_nodes[i].end - numa_nodes[i].start) >> 20);
>>          node_set_online(i);
>>      }
>> 
>> -    ret = compute_hash_shift(nodes, numa_fake, NULL);
>> +    ret = compute_hash_shift(numa_nodes, numa_fake, NULL);
>>      if ( ret < 0 )
>>      {
>>          printk(KERN_ERR "No NUMA hash function found. Emulation 
>> disabled.\n");
>> @@ -580,7 +580,7 @@ static int __init numa_emulation(unsigned long 
>> start_pfn,
>>      memnode_shift = ret;
>> 
>>      for_each_online_node ( i )
>> -        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
>> +        setup_node_bootmem(i, numa_nodes[i].start, 
>> numa_nodes[i].end);
>> 
>>      numa_init_array();
>> 
> 
> I think renaming the file-scope variable this way would be more logical
> and less risky (the way you do it it's easy to miss one place without
> the build breaking).
> 

Ok

>> --- a/xen/drivers/char/ehci-dbgp.c
>> +++ b/xen/drivers/char/ehci-dbgp.c
>> @@ -424,9 +424,9 @@ static void dbgp_issue_command(struct ehci_dbgp 
>> *dbgp, u32 ctrl,
>>           * checks to see if ACPI or some other initialization also
>>           * reset the EHCI debug port.
>>           */
>> -        u32 ctrl = readl(&dbgp->ehci_debug->control);
>> +        u32 controller = readl(&dbgp->ehci_debug->control);
> 
> Why "controller" when the field read is named "control"? Perhaps
> easiest would be to drop the variablöe altogether: It's used exactly
> once, ...
> 
>> -        if ( ctrl & DBGP_ENABLED )
>> +        if ( controller & DBGP_ENABLED )
> 
> ... here.
> 

I was fooled by the comment above its declaration. At first sight I 
don't
see anything wrong with dropping the variable, but I'll check it 
properly before submitting
a v2.

>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -1473,7 +1473,7 @@ static enum __init serial_param_type 
>> get_token(char *token, char **value)
>> 
>>  static bool __init parse_positional(struct ns16550 *uart, char **str)
>>  {
>> -    int baud;
>> +    int baud_rate;
>>      const char *conf;
>>      char *name_val_pos;
>> 
>> @@ -1504,7 +1504,7 @@ static bool __init parse_positional(struct 
>> ns16550 *uart, char **str)
>>          uart->baud = BAUD_AUTO;
>>          conf += 4;
>>      }
>> -    else if ( (baud = simple_strtoul(conf, &conf, 10)) != 0 )
>> +    else if ( (baud_rate = simple_strtoul(conf, &conf, 10)) != 0 )
>>          uart->baud = baud;
> 
> So along the lines of the earlier remark on common/numa.c: Here you're
> actively introducing a bug, by not also renaming the further use of the
> variable. Please reconsider the name change.
> 

Good catch, I'll do as suggested in v2.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

