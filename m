Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB7B23578
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 20:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079056.1440042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulu52-0004I8-8v; Tue, 12 Aug 2025 18:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079056.1440042; Tue, 12 Aug 2025 18:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulu52-0004Fw-5s; Tue, 12 Aug 2025 18:50:40 +0000
Received: by outflank-mailman (input) for mailman id 1079056;
 Tue, 12 Aug 2025 18:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSMc=2Y=csgroup.eu=christophe.leroy@srs-se1.protection.inumbo.net>)
 id 1ulu50-0004Fh-TB
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 18:50:38 +0000
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3a093cb3-77ad-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 20:50:33 +0200 (CEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4c1gK71N21z9sSN;
 Tue, 12 Aug 2025 20:39:39 +0200 (CEST)
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W34agYFEkjYq; Tue, 12 Aug 2025 20:39:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4c1gK707Z2z9sSL;
 Tue, 12 Aug 2025 20:39:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D45368B764;
 Tue, 12 Aug 2025 20:39:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KCsZS5tQGZ3E; Tue, 12 Aug 2025 20:39:38 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 03CD88B763;
 Tue, 12 Aug 2025 20:39:36 +0200 (CEST)
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
X-Inumbo-ID: 3a093cb3-77ad-11f0-b898-0df219b8e170
X-Virus-Scanned: amavisd-new at c-s.fr
X-Virus-Scanned: amavisd-new at c-s.fr
Message-ID: <1cc6f739-3891-4cc7-84ac-676fef62c445@csgroup.eu>
Date: Tue, 12 Aug 2025 20:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] powerpc/ptdump: rename "struct pgtable_level" to
 "struct ptdump_pglevel"
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>
References: <20250811112631.759341-1-david@redhat.com>
 <20250811112631.759341-7-david@redhat.com>
 <dac9e243-33ce-4203-a598-2877cf908cad@lucifer.local>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <dac9e243-33ce-4203-a598-2877cf908cad@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

Le 12/08/2025 à 20:23, Lorenzo Stoakes a écrit :
> On Mon, Aug 11, 2025 at 01:26:26PM +0200, David Hildenbrand wrote:
>> We want to make use of "pgtable_level" for an enum in core-mm. Other
>> architectures seem to call "struct pgtable_level" either:
>> * "struct pg_level" when not exposed in a header (riscv, arm)
>> * "struct ptdump_pg_level" when expose in a header (arm64)
>>
>> So let's follow what arm64 does.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> This LGTM, but I'm super confused what these are for, they don't seem to be
> used anywhere? Maybe I'm missing some macro madness, but it seems like dead
> code anyway?

pg_level[] are used several times in arch/powerpc/mm/ptdump/ptdump.c, 
for instance here:

static void note_page_update_state(struct pg_state *st, unsigned long 
addr, int level, u64 val)
{
	u64 flag = level >= 0 ? val & pg_level[level].mask : 0;
	u64 pa = val & PTE_RPN_MASK;

	st->level = level;
	st->current_flags = flag;
	st->start_address = addr;
	st->start_pa = pa;

	while (addr >= st->marker[1].start_address) {
		st->marker++;
		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
	}
}

> 
> Anyway:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   arch/powerpc/mm/ptdump/8xx.c      | 2 +-
>>   arch/powerpc/mm/ptdump/book3s64.c | 2 +-
>>   arch/powerpc/mm/ptdump/ptdump.h   | 4 ++--
>>   arch/powerpc/mm/ptdump/shared.c   | 2 +-
>>   4 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
>> index b5c79b11ea3c2..4ca9cf7a90c9e 100644
>> --- a/arch/powerpc/mm/ptdump/8xx.c
>> +++ b/arch/powerpc/mm/ptdump/8xx.c
>> @@ -69,7 +69,7 @@ static const struct flag_info flag_array[] = {
>>   	}
>>   };
>>
>> -struct pgtable_level pg_level[5] = {
>> +struct ptdump_pg_level pg_level[5] = {
>>   	{ /* pgd */
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>> diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
>> index 5ad92d9dc5d10..6b2da9241d4c4 100644
>> --- a/arch/powerpc/mm/ptdump/book3s64.c
>> +++ b/arch/powerpc/mm/ptdump/book3s64.c
>> @@ -102,7 +102,7 @@ static const struct flag_info flag_array[] = {
>>   	}
>>   };
>>
>> -struct pgtable_level pg_level[5] = {
>> +struct ptdump_pg_level pg_level[5] = {
>>   	{ /* pgd */
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>> diff --git a/arch/powerpc/mm/ptdump/ptdump.h b/arch/powerpc/mm/ptdump/ptdump.h
>> index 154efae96ae09..4232aa4b57eae 100644
>> --- a/arch/powerpc/mm/ptdump/ptdump.h
>> +++ b/arch/powerpc/mm/ptdump/ptdump.h
>> @@ -11,12 +11,12 @@ struct flag_info {
>>   	int		shift;
>>   };
>>
>> -struct pgtable_level {
>> +struct ptdump_pg_level {
>>   	const struct flag_info *flag;
>>   	size_t num;
>>   	u64 mask;
>>   };
>>
>> -extern struct pgtable_level pg_level[5];
>> +extern struct ptdump_pg_level pg_level[5];
>>
>>   void pt_dump_size(struct seq_file *m, unsigned long delta);
>> diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
>> index 39c30c62b7ea7..58998960eb9a4 100644
>> --- a/arch/powerpc/mm/ptdump/shared.c
>> +++ b/arch/powerpc/mm/ptdump/shared.c
>> @@ -67,7 +67,7 @@ static const struct flag_info flag_array[] = {
>>   	}
>>   };
>>
>> -struct pgtable_level pg_level[5] = {
>> +struct ptdump_pg_level pg_level[5] = {
>>   	{ /* pgd */
>>   		.flag	= flag_array,
>>   		.num	= ARRAY_SIZE(flag_array),
>> --
>> 2.50.1
>>


