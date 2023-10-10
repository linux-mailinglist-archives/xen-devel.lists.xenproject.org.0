Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD37C427A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 23:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615157.956394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqKES-0001mB-NJ; Tue, 10 Oct 2023 21:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615157.956394; Tue, 10 Oct 2023 21:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqKES-0001j0-Jl; Tue, 10 Oct 2023 21:25:36 +0000
Received: by outflank-mailman (input) for mailman id 615157;
 Tue, 10 Oct 2023 21:25:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlcS=FY=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qqKEQ-0001iu-VF
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 21:25:35 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88ff2f36-67b3-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 23:25:30 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 21:25:25 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::7c95:99c7:7f5f:c24a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::7c95:99c7:7f5f:c24a%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 21:25:25 +0000
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
X-Inumbo-ID: 88ff2f36-67b3-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUSM7ViTS+OlQmHsavors+rDzVZT0LVG9CIia+r5KnXAhenr6Hv9iAj8otH3s3x1LA10dGb1/F9ZYoHtUsc/cLTqQrH+rSz6O4xuG3RaTj8w2uXb1m+Mt9yCh/5LNSGIr/30XpJq5jcKIfaDdwHEjClFJIq3gIsyUPxG2S9UGfTabAOXJTEIz4keVYcNBWke1yIbDyDakrQQC6R2gIFyeDH1PI0ASQp+RGEYqAhzLmmDV0SoGSpJXgKxnZ0hVNEWEW/jfCuvNCgpt+hdXudt1ckLaK0tG/5rBycKLE4YN/jgmL8pzZ+yEUOMypxLsy18JjAL/8SsEhjC8cfqrUuZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ru3iKP+0Xf8JpOwjbAlhgLW/NB+krGMTDzVgt1EF8bg=;
 b=Ty8dlrjUnPpEXKbusMLlzN+rdN3Qqw81RKUY8LLxUpskLuCCRXSvwrYvM9ADoqy2Tygs2gr+Ra7FMfyhC4E5PVElALae9PNURcP3pgSmcscsOjWvaiejzvpN13gexjCrRoP/GFfCwmj5vC/k15Ncyn+NyCkCAzdsjrDNuPW5rIKRzmg6aV3RfHQba4LZ8OGUu9IcrXAJAgkoX1q5yCzuE0VqU8AND6Elk2HhbT3nEkUOSTlvsYq4cu66iWkOS+q2Ofd106/HuG3M2jRFc2R0qBsh+Q2gQGATkgvvXjnWa2AX+wiJpGHF3twkE0bToI8zElo8SALIQePrn9/mCR8gNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ru3iKP+0Xf8JpOwjbAlhgLW/NB+krGMTDzVgt1EF8bg=;
 b=rSuuQEUZtOb343DKq0ZxfRYDRANiSG/n+HfesDU2QOd1nIuLXrUB/Jv5adbniskH4zsCrJR7DJdQhS5P9It2xW6xJiwqEEzBnr/jRM3JG/whtn52D/Y8KKhGGOYNogarWyrMWOPa2dzsNFbvW9YDlVcyRVAHdwYrRoXJTSUcM1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 10 Oct 2023 14:25:18 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, Juergen Gross <jgross@suse.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCH v1 2/7] xen: add pseudo RAM region for grant
 mappings
Message-ID: <ZSXBPlQF1Y2Gx5P1@amd.com>
References: <20231005181629.4046-1-vikram.garhwal@amd.com>
 <20231005181629.4046-3-vikram.garhwal@amd.com>
 <alpine.DEB.2.22.394.2310091653270.3431292@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2310091653270.3431292@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA1PR12MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 523ae2c3-c910-4e5e-ddbc-08dbc9d76b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sq9PUDKTkn8Fw+yr7nFBRgSO89/lDTYbRRsXbwJhy0DetSk3lEbuQUWN6O11cF9gLfI0FCcQrNe9Ii1q2orLpdpdhJCe6I5A0q6HY4Ck8kPFbgfU5ymGdHPysXtzIRLDdid7v2EvAAsCPj2nVgIpfvF9p63HR3SnR2z/maYWDAQTNgbZr5u/MdU4NqUjhkb/BdMux1M8PbmskAsF0ULs+2qb1DxF9CCSr9aBtoW9zxDwJFVfYhF77uhMQ1K5dGmkcZ0bVxGKx3+dQaJzLVXPFyzyOjk3r6OUsl7kPLg6Gyo/emXQmuwUatKoTXyVL8X8wEzkch5qVLXZAAkg68i4dfxXFd5At6lCYrjbDmIcavlPkUp7BrRCG8Gyl2JlZwivEHjOympRLOqRqnfE/ygwe/2LO/Yub1QSk1iGu/IiSh6BnBv/8GWZupOEuMX/A5D+W0NgphGgJSnO/DyHr0Tk4hLFa92JkkMymfGOx0kQRazxwox4OCksAwdS5nGAd4R9dzUutDAiPLJnPJkrx3njKuI53ZidKEnJXnppGJ3/N5EMVC5PgBokrazbAzESqIUg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(26005)(2616005)(38100700002)(86362001)(36756003)(6512007)(4326008)(2906002)(7416002)(8936002)(6666004)(6506007)(478600001)(8676002)(44832011)(6916009)(66946007)(83380400001)(41300700001)(316002)(6486002)(66476007)(54906003)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STNuNEpvcW9BM0ROY2dxTDZqOWRyZCs5QjlMTzl0QlVXYURpZ2pHZkt1ZHFV?=
 =?utf-8?B?djQvQzdrS0cvRkJSN0xyRG1ISWU5Q2NhTFp6eElta0NZMkxmeXJ1VXNacDlx?=
 =?utf-8?B?eDM2dU4vS3RmbTRYR1ZBMXVpSUtOWUhxOWZ6RjlzR1R3QktZZ09TeHVUVGdV?=
 =?utf-8?B?WHVlQWpscTZ3ZkZoRUNnMXhCdWF0VlBXNjFCU0RyZWl2bTVqRm1rVDBzTEpx?=
 =?utf-8?B?NzZ2RnN3b2d1YUJlQkRyaEtWZFF2a1JmS01SdTZXbHN0K2tQU212QURydlJm?=
 =?utf-8?B?TUlUM3Z0cmFoSGE1bm1pcFJRQkgzc2FvbDB1VE55SmY4cEZaTEs3SHF3ekdP?=
 =?utf-8?B?NE94bUFkQ1RCMk41UWtxUlI0bnhucldOQkY5bW9BTXFMeUF0TUhENmsvWHZL?=
 =?utf-8?B?eW1YMVYvZXFMWlUxOW5TZzcvdnBSTUpsWmFmODhORXR4VTlkbEkwNG5xcFoy?=
 =?utf-8?B?OGhlSDNLZnpkKzhhUkNLd0JBSk1xRnpBSC8zZEh1NlhudEF4bzRhdEVnUUlG?=
 =?utf-8?B?L2VSTytGMG4zTFNZZGpYcXdPL0dyRHJZdi9aVUQvREx3RVlqS0pEeFVOTENS?=
 =?utf-8?B?bG1QNmx6YVlTYnp0ZlArMjJ6SzBWTUhKYlQxYjFSUDVHendvU0FuQ3o0VzVJ?=
 =?utf-8?B?ZkVXcVk1ak9SUVRiZlVJWlVnZGJwbWV4K0o3WkdaSXVpWm9STUVkVTVVWXJs?=
 =?utf-8?B?bnVvWVhNbFNNZkxFRmU3TmhzdlZReWVHY2hWV0FQa0hPYlh1dFRWbFVYUVo1?=
 =?utf-8?B?THlYWmtVcG5NV1lEdWVVRGVVaEZoSnBVYUlKTmpsYmVKa09uNmtvcFRkRXp4?=
 =?utf-8?B?VnRHVXJBWEYyVjJYNjgyWXVaN0lJNUdlaE5qSTBaNkh2TlRXK0VSUDAyZENR?=
 =?utf-8?B?MWhTeUJJUGQ3YXc3dTBOLytDR0VvZmsrZU16c21pc0JldHBDQzJ1SG44RHEz?=
 =?utf-8?B?RXlxSzh6UWF5MzdDOEVVdzZsL1Exd3VzVUtTYVFHeXUzbktlSzlubnE5RkJT?=
 =?utf-8?B?V0xwZmlrT2ZoY3dMZ1QwMFdUem90TU9tVW96ZUJMeGFDaXRnZXBISUJVMGFL?=
 =?utf-8?B?ZktOUVhXQnJCWUxCcXExckxmZDlER0FIOHJ3NHA5blJrZndBU0xrL0dNV21H?=
 =?utf-8?B?ZWw2c1FTY1RFeW1UVTF1dDZqYmNZWlpQZmpHM3lGYkIzRDJkOUdiS1hoMWdH?=
 =?utf-8?B?Qk1JYUNJY01VSUJCSFViM1RobzhZSHpTVktiM0I3SXpSWUttcm1qeGxrQ1hM?=
 =?utf-8?B?dUQ3VWdOMUwyeEFmMW9vMWhVSWxQVDRqWlNyb21JL2IrT1I5NCtUR2swZmY3?=
 =?utf-8?B?NE5GdEVtdkhvVjJ3VUhNbE9oSU16WjEzd0lvSkpOOTlwdVNpVndoNHdmY05y?=
 =?utf-8?B?dTZkRlhBcGdhUjhOTjdCRkRwcmRORUNuYmkvUzhCMWo2akxsWEltQjdVYWVE?=
 =?utf-8?B?Z3FzUVNEUTZOR2pNY3VENk9wUmZOcGFrRDUxUFMydDRFblpPZThiUm1BWVZO?=
 =?utf-8?B?cVVjUzhaeDFCNWk0Ny9Lcmx2Wk9PaitXU29kWWkzNzhtc2NiNjRCL2dNejNT?=
 =?utf-8?B?RjlYMmZYMlZrcDE5YmhhNTJRbDNhLzcrTlZUY29hSEovWDNvdU5abWpRZkRh?=
 =?utf-8?B?bGl5Y0ZSU2p6QTZoWmZnZFNiejJOR3JJSTYzdndJanFDNkRkYlVHRDdyc01I?=
 =?utf-8?B?N3pDTERZeDlBQVJzQytNSmtQV3c3SGs3eHJoQjlRckJPcDF2YldhbTU0NlFJ?=
 =?utf-8?B?UDdIaHcvdEpPT29kV0RJcVRHRklpcllFTHl2N2R5dkVMeVFKdCt6dmc0c2o2?=
 =?utf-8?B?aWxueUNIVmN2c3A5eUdVWi9KekVqZ2E2REV4VDdpL296OGdPZ1dYcGlQL1FK?=
 =?utf-8?B?SFJVZWFtSXh0KzR6aDI1STl0Y0hvVWhtZUxwdktjeE96bmY0bzNXcitlRjJj?=
 =?utf-8?B?WWJSZmErVXNaREw3OGcxb0xUNzFPR3JTN0hZWXlkMkkweFF1a1lFOFFOMW1s?=
 =?utf-8?B?Qlo1VmdpVy8vU1FQazBxeFpEd013Y285bDFKZkdxdVpqUHhuY21yWFMrMkFj?=
 =?utf-8?B?SXFSZkpSVWYvTlFGSUZEc09MYWxOYUlKaFBUdlBBdzV5Q3RqMWFBek9OSmIy?=
 =?utf-8?Q?ADfxc0oNFAJTA7X61uwiK4Iu3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523ae2c3-c910-4e5e-ddbc-08dbc9d76b13
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 21:25:25.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zionzn2nzBo8BrAfmOiRHwZnmS3l+tdnWTU6l04nxO+AF2CMbkC6BVGrp7OtfjWrxn1VOxkDuwVFE1sLV++iqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286

Hi Stefano,
On Mon, Oct 09, 2023 at 05:02:14PM -0700, Stefano Stabellini wrote:
> On Thu, 5 Oct 2023, Vikram Garhwal wrote:
> > From: Juergen Gross <jgross@suse.com>
> > 
> > Add a memory region which can be used to automatically map granted
> > memory. It is starting at 0x8000000000000000ULL in order to be able to
> > distinguish it from normal RAM.
> > 
> > For this reason the xen.ram memory region is expanded, which has no
> > further impact as it is used just as a container of the real RAM
> > regions and now the grant region.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> This patch doesn't apply to staging anymore
Will re-base it. I rebased it against master branch.
> 
> 
> > ---
> >  hw/i386/xen/xen-hvm.c           |  3 ++
> >  hw/xen/xen-hvm-common.c         |  4 +--
> >  hw/xen/xen-mapcache.c           | 27 ++++++++++++++
> >  include/exec/ram_addr.h         |  1 +
> >  include/hw/xen/xen-hvm-common.h |  2 ++
> >  include/hw/xen/xen_pvdev.h      |  3 ++
> >  include/sysemu/xen-mapcache.h   |  3 ++
> >  softmmu/physmem.c               | 62 +++++++++++++++++++++------------
> >  8 files changed, 80 insertions(+), 25 deletions(-)
> > 
> > diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> > index f42621e674..67a55558a6 100644
> > --- a/hw/i386/xen/xen-hvm.c
> > +++ b/hw/i386/xen/xen-hvm.c
> > @@ -172,6 +172,9 @@ static void xen_ram_init(PCMachineState *pcms,
> >                                   x86ms->above_4g_mem_size);
> >          memory_region_add_subregion(sysmem, 0x100000000ULL, &ram_hi);
> >      }
> > +
> > +    /* Add grant mappings as a pseudo RAM region. */
> > +    ram_grants = *xen_init_grant_ram();
> >  }
> >  
> >  static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
> > diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> > index 565dc39c8f..b7255977a5 100644
> > --- a/hw/xen/xen-hvm-common.c
> > +++ b/hw/xen/xen-hvm-common.c
> > @@ -9,7 +9,7 @@
> >  #include "hw/boards.h"
> >  #include "hw/xen/arch_hvm.h"
> >  
> > -MemoryRegion ram_memory;
> > +MemoryRegion ram_memory, ram_grants;
> >  
> >  void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
> >                     Error **errp)
> > @@ -26,7 +26,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
> >          return;
> >      }
> >  
> > -    if (mr == &ram_memory) {
> > +    if (mr == &ram_memory || mr == &ram_grants) {
> >          return;
> >      }
> >  
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index f7d974677d..8115c44c00 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -14,7 +14,9 @@
> >  
> >  #include <sys/resource.h>
> >  
> > +#include "hw/xen/xen-hvm-common.h"
> >  #include "hw/xen/xen_native.h"
> > +#include "hw/xen/xen_pvdev.h"
> >  #include "qemu/bitmap.h"
> >  
> >  #include "sysemu/runstate.h"
> > @@ -597,3 +599,28 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
> >      mapcache_unlock();
> >      return p;
> >  }
> > +
> > +MemoryRegion *xen_init_grant_ram(void)
> > +{
> > +    RAMBlock *block;
> > +
> > +    memory_region_init(&ram_grants, NULL, "xen.grants",
> > +                       XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE);
> > +    block = g_malloc0(sizeof(*block));
> > +    block->mr = &ram_grants;
> > +    block->used_length = XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE;
> > +    block->max_length = XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE;
> > +    block->fd = -1;
> > +    block->page_size = XC_PAGE_SIZE;
> > +    block->host = (void *)XEN_GRANT_ADDR_OFF;
> > +    block->offset = XEN_GRANT_ADDR_OFF;
> > +    block->flags = RAM_PREALLOC;
> > +    ram_grants.ram_block = block;
> > +    ram_grants.ram = true;
> > +    ram_grants.terminates = true;
> > +    ram_block_add_list(block);
> > +    memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
> > +                                &ram_grants);
> > +
> > +    return &ram_grants;
> 
> It doesn't look like xen_init_grant_ram has anything to do with the
> mapcache. It should be in another file. Maybe ./hw/xen/xen-hvm-common.c
> or ./hw/i386/xen/xen-hvm.c (but this is x86 specific and we need grants
> on ARM too)
Do you mean to move all grant related functions? As moving this alone will not
be sufficient. There are lot of new grant related function added in later patches.

I am okay with moving all to xen-hvm-common.c

Following code movement will happen in this case:
1. All grant related static function to xen-hvm-common.c.
    xen_ram_addr_from_grant_cache(), xen_ram_addr_from_mapcache(),
    xen_map_grant_dyn(), xen_unmap_grant_dyn and xen_init_grant_ram().
2. Remove static from xen_ram_addr_from_mapcache_try().

Does these changes looks good?
> 
> 
> > +}
> > diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> > index 90676093f5..c0b5f9a7d0 100644
> > --- a/include/exec/ram_addr.h
> > +++ b/include/exec/ram_addr.h
> > @@ -139,6 +139,7 @@ void qemu_ram_free(RAMBlock *block);
> >  int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
> >  
> >  void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length);
> > +void ram_block_add_list(RAMBlock *new_block);
> >  
> >  /* Clear whole block of mem */
> >  static inline void qemu_ram_block_writeback(RAMBlock *block)
> > diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
> > index 4e9904f1a6..0d300ba898 100644
> > --- a/include/hw/xen/xen-hvm-common.h
> > +++ b/include/hw/xen/xen-hvm-common.h
> > @@ -17,6 +17,8 @@
> >  #include <xen/hvm/ioreq.h>
> >  
> >  extern MemoryRegion ram_memory;
> > +
> > +extern MemoryRegion ram_grants;
> >  extern MemoryListener xen_io_listener;
> >  extern DeviceListener xen_device_listener;
> >  
> > diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
> > index ddad4b9f36..0f1b5edfa9 100644
> > --- a/include/hw/xen/xen_pvdev.h
> > +++ b/include/hw/xen/xen_pvdev.h
> > @@ -80,4 +80,7 @@ int xen_pv_send_notify(struct XenLegacyDevice *xendev);
> >  void xen_pv_printf(struct XenLegacyDevice *xendev, int msg_level,
> >                     const char *fmt, ...)  G_GNUC_PRINTF(3, 4);
> >  
> > +#define XEN_GRANT_ADDR_OFF    0x8000000000000000ULL
> > +#define XEN_MAX_VIRTIO_GRANTS 65536
> > +
> >  #endif /* QEMU_HW_XEN_PVDEV_H */
> > diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
> > index c8e7c2f6cf..f4bedb1c11 100644
> > --- a/include/sysemu/xen-mapcache.h
> > +++ b/include/sysemu/xen-mapcache.h
> > @@ -10,6 +10,7 @@
> >  #define XEN_MAPCACHE_H
> >  
> >  #include "exec/cpu-common.h"
> > +#include "exec/ram_addr.h"
> >  
> >  typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
> >                                           ram_addr_t size);
> > @@ -25,6 +26,8 @@ void xen_invalidate_map_cache(void);
> >  uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
> >                                   hwaddr new_phys_addr,
> >                                   hwaddr size);
> > +MemoryRegion *xen_init_grant_ram(void);
> > +
> >  #else
> >  
> >  static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
> > diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> > index 309653c722..e182a2fa07 100644
> > --- a/softmmu/physmem.c
> > +++ b/softmmu/physmem.c
> 
> 
> You might want to split this change out of this patch to make it easier
> to get the physmem.c maintainers' attention
Understood, will create a new patch for this change.
> 
> 
> > @@ -1803,12 +1803,47 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
> >      }
> >  }
> >  
> > +static void ram_block_add_list_locked(RAMBlock *new_block)
> > + {
> > +     RAMBlock *block;
> > +     RAMBlock *last_block = NULL;
> > +
> > +    /*
> > +     * Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
> > +     * QLIST (which has an RCU-friendly variant) does not have insertion at
> > +     * tail, so save the last element in last_block.
> > +     */
> > +    RAMBLOCK_FOREACH(block) {
> > +        last_block = block;
> > +        if (block->max_length < new_block->max_length) {
> > +            break;
> > +        }
> > +    }
> > +    if (block) {
> > +        QLIST_INSERT_BEFORE_RCU(block, new_block, next);
> > +    } else if (last_block) {
> > +        QLIST_INSERT_AFTER_RCU(last_block, new_block, next);
> > +    } else { /* list is empty */
> > +        QLIST_INSERT_HEAD_RCU(&ram_list.blocks, new_block, next);
> > +    }
> > +    ram_list.mru_block = NULL;
> > +
> > +    /* Write list before version */
> > +    smp_wmb();
> > +    ram_list.version++;
> > +}
> > +
> > +void ram_block_add_list(RAMBlock *new_block)
> > +{
> > +    qemu_mutex_lock_ramlist();
> > +    ram_block_add_list_locked(new_block);
> > +    qemu_mutex_unlock_ramlist();
> > +}
> > +
> >  static void ram_block_add(RAMBlock *new_block, Error **errp)
> >  {
> >      const bool noreserve = qemu_ram_is_noreserve(new_block);
> >      const bool shared = qemu_ram_is_shared(new_block);
> > -    RAMBlock *block;
> > -    RAMBlock *last_block = NULL;
> >      ram_addr_t old_ram_size, new_ram_size;
> >      Error *err = NULL;
> >  
> > @@ -1846,28 +1881,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
> >      if (new_ram_size > old_ram_size) {
> >          dirty_memory_extend(old_ram_size, new_ram_size);
> >      }
> > -    /* Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
> > -     * QLIST (which has an RCU-friendly variant) does not have insertion at
> > -     * tail, so save the last element in last_block.
> > -     */
> > -    RAMBLOCK_FOREACH(block) {
> > -        last_block = block;
> > -        if (block->max_length < new_block->max_length) {
> > -            break;
> > -        }
> > -    }
> > -    if (block) {
> > -        QLIST_INSERT_BEFORE_RCU(block, new_block, next);
> > -    } else if (last_block) {
> > -        QLIST_INSERT_AFTER_RCU(last_block, new_block, next);
> > -    } else { /* list is empty */
> > -        QLIST_INSERT_HEAD_RCU(&ram_list.blocks, new_block, next);
> > -    }
> > -    ram_list.mru_block = NULL;
> >  
> > -    /* Write list before version */
> > -    smp_wmb();
> > -    ram_list.version++;
> > +    ram_block_add_list_locked(new_block);
> > +
> >      qemu_mutex_unlock_ramlist();
> >  
> >      cpu_physical_memory_set_dirty_range(new_block->offset,
> > -- 
> > 2.17.1
> > 

