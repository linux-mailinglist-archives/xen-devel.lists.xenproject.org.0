Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E592C792313
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 15:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595703.929293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdW8P-0007Mu-Sn; Tue, 05 Sep 2023 13:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595703.929293; Tue, 05 Sep 2023 13:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdW8P-0007Jx-Pg; Tue, 05 Sep 2023 13:30:25 +0000
Received: by outflank-mailman (input) for mailman id 595703;
 Tue, 05 Sep 2023 13:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Og0L=EV=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qdW8O-0007Jr-IJ
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 13:30:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e89::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b6f1b8c-4bf0-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 15:30:20 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 13:30:16 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 13:30:16 +0000
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
X-Inumbo-ID: 5b6f1b8c-4bf0-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIfWOeEtFjTmuOKYVogyoWUFs19QXdkV/FRr/wRg7xFroqTxkJGKJ1Bx6ttfi5V3ZpMom8R1r1FSOb3+JjGbRfC9eoZe0nQgQuhI536ZuZNp2xjp8dift024IycJ7743UKYbjWEHyLtcJvNE0gQZxGG18k9bS26VnTT65PGdFT50LcJupVjybQo63HqjU42X/v00ArvDuisJn2JjI3q3FlM4VvmpO9Bu9EEuR9XZcuyGCG4PQYcxplYW0AyLnlmoPU8cavhjpVmD2weATWdU3gdqmu1XS5fxJdzwARVHLbNGLURBCPXiuE1JcQKysjRgywnxHBeJAX7KRrlnzQLomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0EvEhSxCOUFPRdO6OaJzKLDAzBGY2q3d/3oKLd5TG0=;
 b=HHsbF7JerWClNZ59LGKb3Up+e6e2kfyGkDS4SnunoXcmYjZBL4fZcL6/gAku4amW1DaRuJ0B+ZMOaWtUCA5GQzBX+Z4+k9GqXN+ZtVgGcTVVT7puRXb9FR1MJDIjTCTzb6CKwNMfZAFs8ZblMPy+0YSrkzipuq8w4Qo2p44M5E5N7tmqHKV6dMTG+f6h5kiDudWzW6Xw2qz8wWN6ar1NzD5sNPph3t4fPQ4RH8oRtSdwVqcSyUT5Xv6TuzNJKNG9BmLSDjVGoRXmDISp257saMU0+DwzZV4CinMXVUPc53PGmvTlnddGHHCXmk4EE1Qz6un2/dvelZ2M8LDyqfp5UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0EvEhSxCOUFPRdO6OaJzKLDAzBGY2q3d/3oKLd5TG0=;
 b=4t7NdFHO1BnfQwhQnXXKn2S38qwZTO2uOpG2saDIU4LBIvQugdvn/HYOzUYqXBEvYmBgffI3rCPQ2hlJ3IV9cz6uSoaOJTZkcis62GkuFQqJeTzasoJ2u6vRcvEtOdAfXRNj7AUvYadfo1JdcIaWD616IgMiAoZ5EIBbspfKuVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 5 Sep 2023 21:29:52 +0800
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
Message-ID: <ZPctUPqt/eHeqJqb@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-8-ray.huang@amd.com>
 <b988f9d4-69d7-4cc4-b13e-3e697acf9fe9@daynix.com>
 <ZPbvyDsikvvzierv@amd.com>
 <2ec5929b-eb79-4848-8ab4-517c89f6b476@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ec5929b-eb79-4848-8ab4-517c89f6b476@daynix.com>
X-ClientProxiedBy: TYCP286CA0244.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::19) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 948617e9-5289-4502-304e-08dbae143dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lyNhL2NS5IdvPQ3O5HLwX8xHeeM4bCIMGYlii/KZYDuPBg6QUg9JYsgXiSXOeplPQxQQBJtBOT3GTmHkOvMz/kEO1oY/ImypDI9e3SBbazrNLV2ckeaHNcRZdwXmsCSXtwpR4B4Jht/VKJ5NAbyT2itE/gcJwLMDVvbvAWEHA7Wl4A/H+1WB3c8Fzsp1it0QDgMZf+c+64nsxRHfdmLDk++bfblB2aWifMdlUFaIDfQC+Sz8Sk6hcqleM0L+j6NkMBjVIGGJgDs/AUOhuL8Ccm4DNH0pIW+OjcDMxFLlC7H8AzNJ/fFS6W4gw9UZ9889mRtMahQQ7A/yi/om7UyJRdQwMwWtCK6G6dxtpRB0h2nmbdv7P9iw2nt6h9S3TJGKAVNrWvvpAJtBnJLXJstYfqVk2TFlt82TJwZJN2OZCLHvoNcL6KLV2mthrL71h4fCioQtZ78/31cmufQUCPlbXH01t6SXnxYp0JBJ9izBbUVYQ7Axhm2FJ8fus7cyyR37/rHfG1Tf1/0S56k25Wl1zpqDFwORv5M6wm7lt5D3ReZ6eQjhGACE2cwWZnnIvh96
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(376002)(39860400002)(1800799009)(451199024)(186009)(6666004)(83380400001)(86362001)(38100700002)(36756003)(53546011)(6512007)(6486002)(6506007)(26005)(2616005)(478600001)(66556008)(66476007)(4326008)(6916009)(66946007)(8936002)(8676002)(41300700001)(2906002)(54906003)(316002)(66899024)(7416002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yVHyN8ZcO1DIZL4hEWIhUZf9enwyQnosvrc0qWJZye92JmYHns6a854YZDWX?=
 =?us-ascii?Q?engenXRfFIjqs6t1UXrrYSo+isbcw50J3WtpJSEJeouWII9/1KurnR44Hzw2?=
 =?us-ascii?Q?oMX/+vWkPqki6kENYoPNexnIpiFyl3zxJ4C0vg+eZMsvzk+xJ3JfwYVuKMd+?=
 =?us-ascii?Q?u8102wvX5TRf32HdCVuDPxpydw8gZis2Lsn14QXCHYEQw1RrMPWlbF7O80au?=
 =?us-ascii?Q?u1knnEvT/46u0XhNJJZeuKV6hvKBU8YsdnwHTkCyRqqKsXaFDItDd2bvdksR?=
 =?us-ascii?Q?EFrQCV25lKiHD9tqxExPF2J12UWcz3wAtO0/zAHjVj45r9KlUtRfDBUN4gNy?=
 =?us-ascii?Q?9S8IxE7vPEHfcDtOzG3EffP47pXrCAWqPJfcXeWTeONPj9H7c1UzzKMS7oAT?=
 =?us-ascii?Q?XUDL7xnaB+PD5BTR/Enyl5h+w66MMAowTpSa0D4MwKewy8vPpa1t0H8Aom29?=
 =?us-ascii?Q?Gvdou+W7S1c4yA0Z18CqthU8dhxhUt3O2rGfC727baEPbBpIvI51Qjj8kNyF?=
 =?us-ascii?Q?sDkNR/hpbaorVyXj1CWZ1TRTh028TSzRaJy1myOB/X9GTPBrtle82j3Jd7NN?=
 =?us-ascii?Q?Ap3mSIKffkAys7k8VhuEDjRVAlZV1mDsduSBUfrCD615a+6ZWckdgGGtlJb2?=
 =?us-ascii?Q?eB/EYur0tXFcKG/9XVU7QJTF0tl9rLEn/SPnGej+5F4MJ9tq6BT9sNjgTjfa?=
 =?us-ascii?Q?uBeICvEWkiuUyGCSWNCPqaoPmpPEYQKHGog3KkyTfU0kCcP/mOmjKY3z3Srp?=
 =?us-ascii?Q?uMGIXcyPKCRjoGuZaLPg/1wSZlYDIQTTSxyb3qO+/UqCCH2C9vTxEd3iN/AQ?=
 =?us-ascii?Q?vLwuIaN1h0S5h3Hvrt0g3Z4u5lm8NQc5pvOhBmdfBQM1POlCtEjJmhgAoX3D?=
 =?us-ascii?Q?+G+4LT27hIk6H8zin/Uo4F6O0nif6j0aZFPHeQaQSIAEW6/ohVzc69cqSXVC?=
 =?us-ascii?Q?0qjn84yMlVh+tVF/sGDQ7oFTImtQ7YIksLckWNXSvBqvxw5PQzLnzQVGk8Xb?=
 =?us-ascii?Q?cNpZjFHHg4dVMbfM4+FSg7I8rIEJ7UO5BCBKfXg0YL20QIAxik6FxgIbBMmD?=
 =?us-ascii?Q?ntHGqCHu96lYSJS8/3AM4hSFeQiwKUd38cwzqQO9jdL1nwnOjAPC2/qqO4KH?=
 =?us-ascii?Q?aYznVr2quZoDiZyS6pXL9kiy5cUQJ9T1O/nzr6B0H8qFNFOuhj/ZjwEWhyuT?=
 =?us-ascii?Q?DSH5lC018dnXTSBtw6+FohEnnJI5DfD8HcoUGQHmWivYoRmfQyTPoKf6eR1W?=
 =?us-ascii?Q?XZXOcAyzzkRIc0RRXIXuhlKsPn30zSZK0gZFFA5iYAFj/rZ9J1Btc2YZuC2D?=
 =?us-ascii?Q?ZOgZWzPm/xeSEaFhfnRawwDoBwoe+eNZxai8jMm5tyH3Zpgfx8PiDh9Zuslg?=
 =?us-ascii?Q?1CPi/zr7DXzfDksw6pOJJ01LWd7ZjdaYJQMtMe3VrOjY3yJvJs1N0LNb2ysf?=
 =?us-ascii?Q?gmVMKTS8S4M220GDnGbTcxoInW2mJzS5HfRdKZMR6X8Xg4Ay54sZZ6TfqX5H?=
 =?us-ascii?Q?mIIknHcwfHz6xM+kiG2FozhkDgXs+Ad/IdGItPkfcBmzI/FgRedDX7Umwe+j?=
 =?us-ascii?Q?FiTnXn9iBUA/DmIhJPJw6l0QyR0t+LQKQSEInhg8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948617e9-5289-4502-304e-08dbae143dc1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 13:30:16.3229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33G004RyzIl3CLVkSer9bIhZlHeA8lVbuJ/wQoBejxprCyuz7ajBmz0AgCfR3p375rAi7VuZbDuHI4zZXpiX0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218

On Tue, Sep 05, 2023 at 05:17:32PM +0800, Akihiko Odaki wrote:
> On 2023/09/05 18:07, Huang Rui wrote:
> > On Thu, Aug 31, 2023 at 06:10:08PM +0800, Akihiko Odaki wrote:
> >> On 2023/08/31 18:32, Huang Rui wrote:
> >>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> >>>
> >>> When the memory region has a different life-cycle from that of her parent,
> >>> could be automatically released, once has been unparent and once all of her
> >>> references have gone away, via the object's free callback.
> >>>
> >>> However, currently, references to the memory region are held by its owner
> >>> without first incrementing the memory region object's reference count.
> >>> As a result, the automatic deallocation of the object, not taking into
> >>> account those references, results in use-after-free memory corruption.
> >>>
> >>> This patch increases the reference count of the memory region object on
> >>> each memory_region_ref() and decreases it on each memory_region_unref().
> >>>
> >>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> >>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>> ---
> >>>
> >>> New patch
> >>>
> >>>    softmmu/memory.c | 19 +++++++++++++++++--
> >>>    1 file changed, 17 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/softmmu/memory.c b/softmmu/memory.c
> >>> index 7d9494ce70..0fdd5eebf9 100644
> >>> --- a/softmmu/memory.c
> >>> +++ b/softmmu/memory.c
> >>> @@ -1797,6 +1797,15 @@ Object *memory_region_owner(MemoryRegion *mr)
> >>>    
> >>>    void memory_region_ref(MemoryRegion *mr)
> >>>    {
> >>> +    if (!mr) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    /* Obtain a reference to prevent the memory region object
> >>> +     * from being released under our feet.
> >>> +     */
> >>> +    object_ref(OBJECT(mr));
> >>> +
> >>>        /* MMIO callbacks most likely will access data that belongs
> >>>         * to the owner, hence the need to ref/unref the owner whenever
> >>>         * the memory region is in use.
> >>> @@ -1807,16 +1816,22 @@ void memory_region_ref(MemoryRegion *mr)
> >>>         * Memory regions without an owner are supposed to never go away;
> >>>         * we do not ref/unref them because it slows down DMA sensibly.
> >>>         */
> >>
> >> The collapsed comment says:
> >>   > The memory region is a child of its owner.  As long as the
> >>   > owner doesn't call unparent itself on the memory region,
> >>   > ref-ing the owner will also keep the memory region alive.
> >>   > Memory regions without an owner are supposed to never go away;
> >>   > we do not ref/unref them because it slows down DMA sensibly.
> >>
> >> It contradicts with this patch.
> > 
> > The reason that we modify it is because we would like to address the memory
> > leak issue in the original codes. Please see below, we find the memory
> > region will be crashed once we free(unref) the simple resource, because the
> > region will be freed in object_finalize() after unparent and the ref count
> > is to 0. Then the VM will be crashed with this.
> > 
> > In virgl_cmd_resource_map_blob():
> >      memory_region_init_ram_device_ptr(res->region, OBJECT(g), NULL, size, data);
> >      OBJECT(res->region)->free = g_free;
> >      memory_region_add_subregion(&b->hostmem, mblob.offset, res->region);
> >      memory_region_set_enabled(res->region, true);
> > 
> > In virtio_gpu_virgl_resource_unmap():
> >      memory_region_set_enabled(res->region, false);
> >      memory_region_del_subregion(&b->hostmem, res->region);
> >      object_unparent(OBJECT(res->region));
> >      res->region = NULL;
> > 
> > I spent a bit more time to understand your point, do you want me to update
> > corresponding comments or you have some concern about this change?
> 
> As the comment says ref-ing memory regions without an owner will slow 
> down DMA, you should avoid that. More concretely, you should check 
> mr->owner before doing object_ref(OBJECT(mr)).
> 

I get it, thanks to point this exactly. Will update it in V5.

Thanks,
Ray

