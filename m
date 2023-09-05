Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F280C79214A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 11:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595489.929070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdS2S-0007gM-Hb; Tue, 05 Sep 2023 09:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595489.929070; Tue, 05 Sep 2023 09:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdS2S-0007du-DY; Tue, 05 Sep 2023 09:08:00 +0000
Received: by outflank-mailman (input) for mailman id 595489;
 Tue, 05 Sep 2023 09:07:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Og0L=EV=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qdS2Q-0007d2-TY
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 09:07:58 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3b172dc-4bcb-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 11:07:57 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS0PR12MB9037.namprd12.prod.outlook.com (2603:10b6:8:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 09:07:50 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 09:07:50 +0000
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
X-Inumbo-ID: b3b172dc-4bcb-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UT39xLUPCKFDSxDkJTptSle1oIimjCNGSvWvmQnuC7sz2Jxtk/CSKUfzOyg8A00/kINJzkdL2PP8TuEu7ZVnvU7O2FJ6bCb7cNu6ap6U7ku5tUJxXirFM6IMC0JUVzbv0HUHeMKzUxpTsCZF4uAltfga1C76f0S+Nl3VOev7Dna+/Qaq7PcDCY/EZ/HFgzlKpUAvcSH7pvsd1lMdcwZOthxoSvaATrlZkQqSgr2kB44BEESVLHyKmbWibxfO/pQHGIL5GjTaQTzz2ro9diaqXNgVZZZVjqXpKLd66jmwToxr6IUwMxTm9RHuKjMciI+aekvRkIzjrSUQ0YjyOs9kgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6bD8Dmuxp+VS6LhVzgyPaD7tX6Y8BFtDWoybBL9UdQ=;
 b=Ra2t4CPnjfXAoqiz6RBPUEIbpH2MRZVL+Oi0Wdbr/rISIBFcg4u8zy1enM+5c0gO2xbNPm33SIFgFdCumf5K24uWJaf8kFp+aOG7lpRYssATjQku3qe31rACupIAbDn6o6R2NLOYMmBm1phWN9ZOmAx3DP2y21H77kwdLlV+uduGBmqIDAat/ltAiw1i0uxznUMcKjKPVSEzPY+LMKuszjFLIc100ZPCfyS+BIS3RXZUefC3ut24ugw+WDbuq/J5IWu7I51p7VS0/WCbIVaeAsDCyKB1Wx3SKjrg6kgprldHI8BZj/fuw69yCWnSWZezxq8J6RPGYqLAXd1X0UyJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6bD8Dmuxp+VS6LhVzgyPaD7tX6Y8BFtDWoybBL9UdQ=;
 b=JDsdWY7lPiaYNYl/qVzMxZOsqdKRcGrIGRcdaLhTPh59E2ZdBECoGESK9UDH4vme2XlBA8N0iSJVopepH2GVb/Q62NOxHsNdNaP++3e6K6g5Gsd/4snyHPLZi+SLPF8imqNov4anS3aGhseMHn5jF38XZhjvxkOKOZMdlVy0tYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 5 Sep 2023 17:07:20 +0800
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	"ernunes@redhat.com" <ernunes@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Alyssa Ross <hi@alyssa.is>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v4 07/13] softmmu/memory: enable automatic
 deallocation of memory regions
Message-ID: <ZPbvyDsikvvzierv@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-8-ray.huang@amd.com>
 <b988f9d4-69d7-4cc4-b13e-3e697acf9fe9@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b988f9d4-69d7-4cc4-b13e-3e697acf9fe9@daynix.com>
X-ClientProxiedBy: SG2PR06CA0235.apcprd06.prod.outlook.com
 (2603:1096:4:ac::19) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS0PR12MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1317ac-c6dd-4276-77a0-08dbadef9425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1KyKkk4i/SAn5bYPu9kGfv63IBLQYhq3oh2y9KdK/ayUNAdXXSNqztkgmuXaAPxHP/Jgk6Qwq9A3Za/b7QpoLvLIhTwfffEeG4fOQIJGnfVcO17S03iOBPQqmKJyyIlLtq8Vvh1fX9rABBLBf2peqn4Jp/g2G0o31D5JyzEJDB/1+csRBRtqf480ddDXFsZHu6N5282o3q/nVBmO5+TXnlEpbalavnbq6uOHAsgnqIjjTHLf/AImR+/dqOM2UAUXq2d3deupmyRRNhnYtuImFCXgK8JS9DweeWT/9LLxz2dfyZCU4oHQ5acpZe15IZOMHqDbt2gI2RDrrd7fU0lH2EpSHz2Lvcx7+tET09sJzlzcj3/PX4kLiZESIrpdYKYy3X/Z7+u54Fnr/pu2YNgQkHkZvIm7AXVc0OU6ehn/8MWdXsWlsTHdr9nXaEQEfieC7ZYa649FTkq7JAYJEr4aWKQVDHsiHCyBS3W2lwMfvjIHaSs1sbA5XBRQXSxehKY7oobWAfUjVbHRXRuj1r/xIQoJOvhI59WRLH/CZNIXWZWe4WtbK6DP26H1b5ML9Yvp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(1800799009)(451199024)(186009)(5660300002)(8936002)(66476007)(7416002)(41300700001)(54906003)(66556008)(6916009)(66946007)(316002)(2906002)(6666004)(53546011)(6486002)(6506007)(6512007)(4326008)(2616005)(8676002)(478600001)(26005)(83380400001)(38100700002)(36756003)(86362001)(66899024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?780OJ5YKoF9e4DhNdKFNsckHnHP0/tjfY2zbyKUMffFclh8kvqAIGsZluvnB?=
 =?us-ascii?Q?Lf0tY1XcazUuC082Svnb/J38a5wmW2fXpOHim2jSFV/YSVgIjeRhXPDDsz5V?=
 =?us-ascii?Q?4NhrYpc7GlKsOVOGtdBstfsmKzSCHCrDx2h9mpYGMl/VLq+Xir9Kj62mrgkS?=
 =?us-ascii?Q?QYnLRKZgUOvpwasrXNuG7CZno0isOBPn584rOQO/ba9nXj/mVGP2ugghkYl1?=
 =?us-ascii?Q?aeHl/Ka7a9vmSzAjms5BmPmaiOJwCS2i9N8ZTOeKSbq2gqKZKbEHPkNroN9I?=
 =?us-ascii?Q?Z/txy9db4dUWEoNXuqyo4TCfIWWdbc42nq3THOx+YDBuCLHEEP9qyy3tRhOF?=
 =?us-ascii?Q?1WsdBkz63R/1DC0a8B0SfrSCOCbMKCfqd0OLUOOATqXSIetsDzk/FTxjXmbK?=
 =?us-ascii?Q?e0u0aihud6MeDWMJNiMPS1I1IKYHYuhPm46KXfcPEHHXW2LvuA72zR2qJ1WG?=
 =?us-ascii?Q?4exBBpMk5cA6BGNneNniAwzOihH9leFlYCzT6tVu6SEOl+N9sPUKkS2vDtkd?=
 =?us-ascii?Q?e87ih/niJX9+zrhgXDrq3ErRynj07QhsWjw2bhXogtYjxYhhr7b6X7UTlsOq?=
 =?us-ascii?Q?haJUCOTzrpJlrezqbwx2aL6AJ5zzCgqHYwaY36lTBr8bQ0IPJ90f98S4WVWX?=
 =?us-ascii?Q?oXcXjl+4hc72hbVx/pD2NMWBeME+sGD1TCKvxAwqOw+0uzITolPY0fcT3o4v?=
 =?us-ascii?Q?gOpERC74Zpb7ar0e6xu9RKk4qlS3GLXt5tCUB/iL4l21NFV92EHsPfZerL9Z?=
 =?us-ascii?Q?EDY7ucqy6QnVaaqI73gsxKrTRG0J3+XtFT+w6pUZoJIwWDL6vGBByVYjy1Pv?=
 =?us-ascii?Q?KHkNG42k26R5TsZk+AWaEQ/Nugig9cxnbG5Ci0t2KmRCnxShtAin3VN2iICY?=
 =?us-ascii?Q?AIYr4WhgnGgFCerqo3vkIAkEiSFdqDitVz1d8XWZTYMyR7tMqEChLv65lMRE?=
 =?us-ascii?Q?/6vs9PcY4PK5L4W6J+cJvQyvjQ9aJ2Xhf/eizI+5TtpG+GHjxnwiLVu07Dmf?=
 =?us-ascii?Q?5VLGwKsW7YRaEn7Mufc+i7SMwruRekLgCk3mDydTd5byZ3ePkwZ4qtId8e0W?=
 =?us-ascii?Q?74YnSL2P6gSriI5M7uXxt0Zs4A59D0o3J+Lk/KSLQKSoDxz1btZskfsHDowk?=
 =?us-ascii?Q?ejILlJwQWUQqKDsQRuEB+Dxxs81roiVl31y3EF3GmSCsYvd9iXNZMY34jUXv?=
 =?us-ascii?Q?4+aCntMg9DgqQWFmHpmgQ58hyffS9zgaEQDJ9K2Al6QTzR/vtXqy8s2gmkJT?=
 =?us-ascii?Q?pGv4sDvin7LPV88+MpBNRyn3kDFx1AEjrGt3t+9+CmlkBYIdKsQ2Gp8TMFQY?=
 =?us-ascii?Q?BpnljpVemnwa/Xgrs13czzKq6tR5UDdGjXurRNTN7rRcZFOegN/Q08JKgQLS?=
 =?us-ascii?Q?vnp77U2GW39dmLGOVO8VZNV2IciJPCgzuTcLx0/cMa7IbXeOWU9fy3Mi7Hr5?=
 =?us-ascii?Q?hreqEMG6EWFlC0kJuAKXR2t31nAZF3ylyatQRmvW2zUtGyCPajpQsRh4kQEu?=
 =?us-ascii?Q?80pG8iz/sR1UPU8MxdgwrKfMLNSVCstgJ8bTAgC9CtHak05UUDMolMVE8h3w?=
 =?us-ascii?Q?CLy1lkmm4BVskj8O6RAdi/V20LLFBiio44ImYwoe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1317ac-c6dd-4276-77a0-08dbadef9425
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 09:07:49.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUpuGd4nEE33L8MUsK+WRrkJk3FISuDt9LYqCwRwLv4BMQlC7SGASn5i7HMPnIjG6uee9KM9cTib4Ib2HM1Vlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9037

On Thu, Aug 31, 2023 at 06:10:08PM +0800, Akihiko Odaki wrote:
> On 2023/08/31 18:32, Huang Rui wrote:
> > From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> > 
> > When the memory region has a different life-cycle from that of her parent,
> > could be automatically released, once has been unparent and once all of her
> > references have gone away, via the object's free callback.
> > 
> > However, currently, references to the memory region are held by its owner
> > without first incrementing the memory region object's reference count.
> > As a result, the automatic deallocation of the object, not taking into
> > account those references, results in use-after-free memory corruption.
> > 
> > This patch increases the reference count of the memory region object on
> > each memory_region_ref() and decreases it on each memory_region_unref().
> > 
> > Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > New patch
> > 
> >   softmmu/memory.c | 19 +++++++++++++++++--
> >   1 file changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 7d9494ce70..0fdd5eebf9 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -1797,6 +1797,15 @@ Object *memory_region_owner(MemoryRegion *mr)
> >   
> >   void memory_region_ref(MemoryRegion *mr)
> >   {
> > +    if (!mr) {
> > +        return;
> > +    }
> > +
> > +    /* Obtain a reference to prevent the memory region object
> > +     * from being released under our feet.
> > +     */
> > +    object_ref(OBJECT(mr));
> > +
> >       /* MMIO callbacks most likely will access data that belongs
> >        * to the owner, hence the need to ref/unref the owner whenever
> >        * the memory region is in use.
> > @@ -1807,16 +1816,22 @@ void memory_region_ref(MemoryRegion *mr)
> >        * Memory regions without an owner are supposed to never go away;
> >        * we do not ref/unref them because it slows down DMA sensibly.
> >        */
> 
> The collapsed comment says:
>  > The memory region is a child of its owner.  As long as the
>  > owner doesn't call unparent itself on the memory region,
>  > ref-ing the owner will also keep the memory region alive.
>  > Memory regions without an owner are supposed to never go away;
>  > we do not ref/unref them because it slows down DMA sensibly.
> 
> It contradicts with this patch.

The reason that we modify it is because we would like to address the memory
leak issue in the original codes. Please see below, we find the memory
region will be crashed once we free(unref) the simple resource, because the
region will be freed in object_finalize() after unparent and the ref count
is to 0. Then the VM will be crashed with this.

In virgl_cmd_resource_map_blob():
    memory_region_init_ram_device_ptr(res->region, OBJECT(g), NULL, size, data);
    OBJECT(res->region)->free = g_free;
    memory_region_add_subregion(&b->hostmem, mblob.offset, res->region);
    memory_region_set_enabled(res->region, true);

In virtio_gpu_virgl_resource_unmap():
    memory_region_set_enabled(res->region, false);
    memory_region_del_subregion(&b->hostmem, res->region);
    object_unparent(OBJECT(res->region));
    res->region = NULL;

I spent a bit more time to understand your point, do you want me to update
corresponding comments or you have some concern about this change?

Thanks,
Ray

> 
> > -    if (mr && mr->owner) {
> > +    if (mr->owner) {
> >           object_ref(mr->owner);
> >       }
> >   }
> >   
> >   void memory_region_unref(MemoryRegion *mr)
> >   {
> > -    if (mr && mr->owner) {
> > +    if (!mr) {
> > +        return;
> > +    }
> > +
> > +    if (mr->owner) {
> >           object_unref(mr->owner);
> >       }
> > +
> > +    object_unref(OBJECT(mr));
> >   }
> >   
> >   uint64_t memory_region_size(MemoryRegion *mr)

