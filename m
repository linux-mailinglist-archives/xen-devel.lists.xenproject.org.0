Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A01B7933F5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 05:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596164.929942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdivS-0005L4-Cs; Wed, 06 Sep 2023 03:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596164.929942; Wed, 06 Sep 2023 03:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdivS-0005IL-8r; Wed, 06 Sep 2023 03:09:54 +0000
Received: by outflank-mailman (input) for mailman id 596164;
 Wed, 06 Sep 2023 03:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3g10=EW=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qdivQ-0005IF-MN
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 03:09:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20618.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d636cfc1-4c62-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 05:09:49 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DM4PR12MB6399.namprd12.prod.outlook.com (2603:10b6:8:b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Wed, 6 Sep
 2023 03:09:44 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::da13:5f6:45:fa40%4]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 03:09:43 +0000
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
X-Inumbo-ID: d636cfc1-4c62-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBUj/8tifbYXj/EVdq6evlaUeiftNBYBc3A9K1TsjQ+wTk70EEk1uDm5YL3ds+l7jR5dn7kZzcE/3fc8gLV74h01HmsoLV2514JvHSXEwJ8NkQ6RlKnmtkt0+UgMJkgunjNxSO4+hmBvMgp6fNmWwYnwGLwntrI+WIRw6XTKHnOQuJEQ00vxhMcoaGSZG3fxJWdBKCEl3360TUEtP1sBh5Q7NLG//HntLfOENtsHhcKFF9MmIFCDzf2mPbTG0+6BB1QdKyX4b4ywy0q6/ThLyfBPGouXf8hDnb1R/wtEJO2b8H4cLqhYZ/vea1s6/ux7ptqQ4wj7NyCFitu3e8rkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+celjngktGnUavdb7WI9WREN6aut1Hcf2eD0KLO2jBQ=;
 b=MNzmsKbOTfwPxTYyrSU/aET6YUJlnuQkn0RlKzuhdfWk6kCAzZ8lVX+X5KsnADF1Tm4+rMu0hpMJJ9RqRYuX9G3MUMQ8LB+iIL+Kl0O5hOPFTbLCnB3jE2Exm0DtP41ra9RQc2hVp3lhKdJyFOJFSXfe3akJQfLDqPkPj4gD35oFDgvSfzDU2oHLVR/6if6DE4Xm+Uw4ugbbp9FyYTKVkKwOg3qaAIsjGdpfbS2kUc9h+1r2V+mIn2lYWj076WEnsXF4jFodeKLU02v3kOeXZpgSTdNPRTvA6jSsYol9f0hZp8lDTSK8WPWN9/2IpSF3mnmBFT9dvyKW6h3wr5qbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+celjngktGnUavdb7WI9WREN6aut1Hcf2eD0KLO2jBQ=;
 b=ULWuH3m9igff57/6NVoKHuYu0Dh6cDXoIxJvEQBk1sG+RVrLxP9thI1W0/8Yol5mM/rtDb+5uGVcduG192Z2c5mZXH0G0NrFA/+Fza0CZvIQxyPVgscYyLtKkk2VCDlEbJ8gOPhh82lbCcFzknDKH7J/JK/y6iNUqaejI6D4XOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 6 Sep 2023 11:09:13 +0800
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
Subject: Re: [QEMU PATCH v4 09/13] virtio-gpu: Handle resource blob commands
Message-ID: <ZPftWfuwLKafLPah@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-10-ray.huang@amd.com>
 <ba478789-5db0-4011-bed1-7dd6901eccd6@daynix.com>
 <ZPbwGA3apjQTtCeu@amd.com>
 <053ecca7-f76d-4289-9189-0c3600d4804b@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <053ecca7-f76d-4289-9189-0c3600d4804b@daynix.com>
X-ClientProxiedBy: SG2PR04CA0186.apcprd04.prod.outlook.com
 (2603:1096:4:14::24) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DM4PR12MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db210d6-fe60-4935-9f43-08dbae86b7a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t8Eh7wAzdUuuCvCxjSIfNIx9DcACNsfUmytnVetGAtGVBJGjsTHcsx0e5uIxHUL+n1oi4pp3CnqGdSKP8e7nuYdx6cABJ+grJsoQWiIgUgZcZx2EqlVvn0IkPx0VLBJalHBRIDle206FMI6stL3AhrfuFLzyRJo/+Ts6tJw8U0znpWec5YhbYBdmHPSzKxlSSgtpu31IuTWzvUW9uRMch+rHIeAAqSR6sBbqmiI6B9EhJBkCMI9n9gSSrEZ1ildmWT4507a7N15d1MBhcFTDf74FoGaXhO2sqekyMO9V/N4hDuumqybCnqT2oPWljhG2v1h90McwvJHmASobVCknW7OEuZxKmjW/GikLCyuZ/lhB6avPhoXM7iVfryMqV4/vBu0rkvSV64ROTSC6EFqEURyNMWygxOgp9U68oFMx7UILumdq8kVMbedzKUPjXzcw/22XcuGJA82WqJFZAj/ZW1lsE86H+07o4mWjCH98kMvxMWBwzZO6ftJw4Fww8yVEnuGNPGYwgxW41OVywkRsa8XIO38I9P7l3nF3Ev/sht02mdoa37P4RNkaaTZozfzo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39860400002)(366004)(136003)(186009)(451199024)(1800799009)(83380400001)(38100700002)(5660300002)(86362001)(7416002)(41300700001)(36756003)(66946007)(2616005)(66476007)(54906003)(66556008)(6666004)(53546011)(478600001)(2906002)(6486002)(6916009)(4326008)(316002)(8936002)(26005)(6512007)(6506007)(30864003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GTvX0ZwNWQgnPAcNzNKg9KrRK923eI+vTgT2PGK4eKrSjx48LSCBEzLsMrVv?=
 =?us-ascii?Q?zIjPXBpPzxgEKI8qumtJkxJ1GP3guaCTZwXrd65ERb+QXwseSU5fV0mBlehB?=
 =?us-ascii?Q?8uipYfJYztzRBEvWc4Q0Hol1+QQbjmPwvpUXoBwkaIGoCQIx2wo9cPvtUsIM?=
 =?us-ascii?Q?Mq2odFMtZWeJEFXtBE0Xue7G0d3j9BpMhr/JJoghgVAoDhf2b63cNxbP/AHY?=
 =?us-ascii?Q?FOq1MywXktgkxwI9Wqb3UYyLkwi0at51Nd8DasQVk5R0BZ5b3fk4Knoitb8L?=
 =?us-ascii?Q?s80bFfP4b+dQZR9sz0Y6RHzV+omhHbb4t5+kzJ9ZbyaxcugMvWM0JBRVIaf8?=
 =?us-ascii?Q?bR8TdVy1WfWB9k8rtJRvqvHen9Ipi6HNC5zA3+3bLQkLGfwk0Y9LnJZPVm7b?=
 =?us-ascii?Q?fyAUkiDtFO0e97IkcOoV4uoaB7CJERwbqWCg4DXRWzsCxYyC1IqW+bXSq96Z?=
 =?us-ascii?Q?fqliIVXL1vLEsuJFbHufny6UOC+vJlA6c5D0xV0k6x9Uv8nPK76vTYfwsY6T?=
 =?us-ascii?Q?rGgWCcLrVPvqeEoEhWz6wuXDfiqvcL9W7ij14SN/GecH9onwY8Xsm/4z/rWf?=
 =?us-ascii?Q?B3JPym3xBFKywEAmRSA75u+5ViPLU16Cpd7ochB3aVSUwNjb08f2ZTFL4hc7?=
 =?us-ascii?Q?1RjW+rccrrMQd7DMHAdrRcC0umJP0nZuKkLbKcSpUCyv9tgPfto/focStM07?=
 =?us-ascii?Q?wD8UCTIVw46wm/DqHlgImmefAY92I7Ki+oyhhMeDE1z26UT7Zzxgyd2ZcC9i?=
 =?us-ascii?Q?+mdkpDF3Ww/8nByyPacrx3D0uP89vqlANzeP6bd8WhgXqW7zKIf0sEzl3SWe?=
 =?us-ascii?Q?T+ZKsIR4eGUdaFmTT3unzrQ8gWrg3fauX6gwb/EuvciojcRG3OCPzqCTe97K?=
 =?us-ascii?Q?AcQQCFbrCtdB/AmvkOSG1L6R77lui+sTNp9r/gx4FczIKys/bw69NZFySTa2?=
 =?us-ascii?Q?1UGiVXyaKdGksVAY6jyvsvKliFHNYOOlgnpLv1CBwqm5Y12b59LMrI0tRtbR?=
 =?us-ascii?Q?4Cs4nn9WYVSc8Jwi7bSp1ap/idj4oyelaNEDMJRYt7mfYdPp+4VsUmiAzelp?=
 =?us-ascii?Q?YITSCBoXIXfzAEP1bj2Fa0xlvqvUqcR8fg5ZijufXqXy3VWITIyc61onpcFr?=
 =?us-ascii?Q?s5PKQVAc4g3Mo1fRhqPNckZycbZV7F8iBUq3yHG/V143LDhnB9p7qZN+v30I?=
 =?us-ascii?Q?WJ8/d1iVPqgNlGcGMH6v7a0SxJxmfggOi2E4AdXWrTFrwsm/6RMycJoeDdPI?=
 =?us-ascii?Q?kpJMkUoc7YKeaSPH9d+qS6SebZ4/epzAvTrSSayQGHAqDdPB0+MwxUUOMovv?=
 =?us-ascii?Q?XlDODSuU48KvypfjfOHPzVhAR3PsvDuQPYQh5PTYW87/zCWIAVXIfLTIHVBd?=
 =?us-ascii?Q?b7CWia97kG/KyvtS7qmGzqh98uAI7NtNEAjpGHtmJ3VCPYO3DLutD63t7h8+?=
 =?us-ascii?Q?ASF7xAiB7czp+4xk6ikG8G6+J3kBUTtJyQVNCHXqLyQG4KmqbDMNp2Qm97NM?=
 =?us-ascii?Q?X9oDV0wsSo8deCsVrtc4rv0GBvCvgdHM23nYJBEOX4/g3Yjrv3BPd7ZeKOkv?=
 =?us-ascii?Q?90HOsRBp3vFzcw1+j4pR7xTGtXXHk/VoLZYHcYWV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db210d6-fe60-4935-9f43-08dbae86b7a9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 03:09:43.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb0UcE37kwjczKOVVeN10Zu4+LJ/6iuVMHmXXIcEOjTPncM6AZFV3pGxXAwEYQTsm+lso3bZa/lex2QikLax3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6399

On Tue, Sep 05, 2023 at 05:20:43PM +0800, Akihiko Odaki wrote:
> On 2023/09/05 18:08, Huang Rui wrote:
> > On Thu, Aug 31, 2023 at 06:24:32PM +0800, Akihiko Odaki wrote:
> >> On 2023/08/31 18:32, Huang Rui wrote:
> >>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>>
> >>> Support BLOB resources creation, mapping and unmapping by calling the
> >>> new stable virglrenderer 0.10 interface. Only enabled when available and
> >>> via the blob config. E.g. -device virtio-vga-gl,blob=true
> >>>
> >>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> >>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> >>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>> ---
> >>>
> >>> v1->v2:
> >>>       - Remove unused #include "hw/virtio/virtio-iommu.h"
> >>>
> >>>       - Add a local function, called virgl_resource_destroy(), that is used
> >>>         to release a vgpu resource on error paths and in resource_unref.
> >>>
> >>>       - Remove virtio_gpu_virgl_resource_unmap from virtio_gpu_cleanup_mapping(),
> >>>         since this function won't be called on blob resources and also because
> >>>         blob resources are unmapped via virgl_cmd_resource_unmap_blob().
> >>>
> >>>       - In virgl_cmd_resource_create_blob(), do proper cleanup in error paths
> >>>         and move QTAILQ_INSERT_HEAD(&g->reslist, res, next) after the resource
> >>>         has been fully initialized.
> >>>
> >>>       - Memory region has a different life-cycle from virtio gpu resources
> >>>         i.e. cannot be released synchronously along with the vgpu resource.
> >>>         So, here the field "region" was changed to a pointer that will be
> >>>         released automatically once the memory region is unparented and all
> >>>         of its references have been released.
> >>>         Also, since the pointer can be used to indicate whether the blob
> >>>         is mapped, the explicit field "mapped" was removed.
> >>>
> >>>       - In virgl_cmd_resource_map_blob(), add check on the value of
> >>>         res->region, to prevent beeing called twice on the same resource.
> >>>
> >>>       - Remove direct references to parent_obj.
> >>>
> >>>       - Separate declarations from code.
> >>>
> >>>    hw/display/virtio-gpu-virgl.c  | 213 +++++++++++++++++++++++++++++++++
> >>>    hw/display/virtio-gpu.c        |   4 +-
> >>>    include/hw/virtio/virtio-gpu.h |   5 +
> >>>    meson.build                    |   4 +
> >>>    4 files changed, 225 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> >>> index 312953ec16..17b634d4ee 100644
> >>> --- a/hw/display/virtio-gpu-virgl.c
> >>> +++ b/hw/display/virtio-gpu-virgl.c
> >>> @@ -17,6 +17,7 @@
> >>>    #include "trace.h"
> >>>    #include "hw/virtio/virtio.h"
> >>>    #include "hw/virtio/virtio-gpu.h"
> >>> +#include "hw/virtio/virtio-gpu-bswap.h"
> >>>    
> >>>    #include "ui/egl-helpers.h"
> >>>    
> >>> @@ -78,9 +79,24 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >>>        virgl_renderer_resource_create(&args, NULL, 0);
> >>>    }
> >>>    
> >>> +static void virgl_resource_destroy(VirtIOGPU *g,
> >>> +                                   struct virtio_gpu_simple_resource *res)
> >>> +{
> >>> +    if (!res)
> >>> +        return;
> >>> +
> >>> +    QTAILQ_REMOVE(&g->reslist, res, next);
> >>> +
> >>> +    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
> >>> +    g_free(res->addrs);
> >>> +
> >>> +    g_free(res);
> >>> +}
> >>> +
> >>>    static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >>>                                         struct virtio_gpu_ctrl_command *cmd)
> >>>    {
> >>> +    struct virtio_gpu_simple_resource *res;
> >>>        struct virtio_gpu_resource_unref unref;
> >>>        struct iovec *res_iovs = NULL;
> >>>        int num_iovs = 0;
> >>> @@ -88,13 +104,22 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
> >>>        VIRTIO_GPU_FILL_CMD(unref);
> >>>        trace_virtio_gpu_cmd_res_unref(unref.resource_id);
> >>>    
> >>> +    res = virtio_gpu_find_resource(g, unref.resource_id);
> >>> +
> >>>        virgl_renderer_resource_detach_iov(unref.resource_id,
> >>>                                           &res_iovs,
> >>>                                           &num_iovs);
> >>>        if (res_iovs != NULL && num_iovs != 0) {
> >>>            virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
> >>> +        if (res) {
> >>> +            res->iov = NULL;
> >>> +            res->iov_cnt = 0;
> >>> +        }
> >>>        }
> >>> +
> >>>        virgl_renderer_resource_unref(unref.resource_id);
> >>> +
> >>> +    virgl_resource_destroy(g, res);
> >>>    }
> >>>    
> >>>    static void virgl_cmd_context_create(VirtIOGPU *g,
> >>> @@ -426,6 +451,183 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
> >>>        g_free(resp);
> >>>    }
> >>>    
> >>> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> >>> +
> >>> +static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
> >>> +                                           struct virtio_gpu_ctrl_command *cmd)
> >>> +{
> >>> +    struct virtio_gpu_simple_resource *res;
> >>> +    struct virtio_gpu_resource_create_blob cblob;
> >>> +    struct virgl_renderer_resource_create_blob_args virgl_args = { 0 };
> >>> +    int ret;
> >>> +
> >>> +    VIRTIO_GPU_FILL_CMD(cblob);
> >>> +    virtio_gpu_create_blob_bswap(&cblob);
> >>> +    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
> >>> +
> >>> +    if (cblob.resource_id == 0) {
> >>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> >>> +                      __func__);
> >>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    res = virtio_gpu_find_resource(g, cblob.resource_id);
> >>> +    if (res) {
> >>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
> >>> +                      __func__, cblob.resource_id);
> >>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> >>> +    if (!res) {
> >>> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    res->resource_id = cblob.resource_id;
> >>> +    res->blob_size = cblob.size;
> >>> +
> >>> +    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
> >>> +        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
> >>> +                                            cmd, &res->addrs, &res->iov,
> >>> +                                            &res->iov_cnt);
> >>> +        if (!ret) {
> >>> +            g_free(res);
> >>> +            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >>> +            return;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> >>> +
> >>> +    virgl_args.res_handle = cblob.resource_id;
> >>> +    virgl_args.ctx_id = cblob.hdr.ctx_id;
> >>> +    virgl_args.blob_mem = cblob.blob_mem;
> >>> +    virgl_args.blob_id = cblob.blob_id;
> >>> +    virgl_args.blob_flags = cblob.blob_flags;
> >>> +    virgl_args.size = cblob.size;
> >>> +    virgl_args.iovecs = res->iov;
> >>> +    virgl_args.num_iovs = res->iov_cnt;
> >>> +
> >>> +    ret = virgl_renderer_resource_create_blob(&virgl_args);
> >>> +    if (ret) {
> >>> +        virgl_resource_destroy(g, res);
> >>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
> >>> +                      __func__, strerror(-ret));
> >>> +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >>> +    }
> >>> +}
> >>> +
> >>> +static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
> >>> +                                        struct virtio_gpu_ctrl_command *cmd)
> >>> +{
> >>> +    struct virtio_gpu_simple_resource *res;
> >>> +    struct virtio_gpu_resource_map_blob mblob;
> >>> +    int ret;
> >>> +    void *data;
> >>> +    uint64_t size;
> >>> +    struct virtio_gpu_resp_map_info resp;
> >>> +    VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> >>> +
> >>> +    VIRTIO_GPU_FILL_CMD(mblob);
> >>> +    virtio_gpu_map_blob_bswap(&mblob);
> >>> +
> >>> +    if (mblob.resource_id == 0) {
> >>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
> >>> +                      __func__);
> >>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    res = virtio_gpu_find_resource(g, mblob.resource_id);
> >>> +    if (!res) {
> >>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
> >>> +                      __func__, mblob.resource_id);
> >>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>> +        return;
> >>> +    }
> >>> +    if (res->region) {
> >>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already mapped %d\n",
> >>> +		      __func__, mblob.resource_id);
> >>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    ret = virgl_renderer_resource_map(res->resource_id, &data, &size);
> >>> +    if (ret) {
> >>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
> >>> +                      __func__, strerror(-ret));
> >>> +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    res->region = g_new0(MemoryRegion, 1);
> >>> +    if (!res->region) {
> >>> +        virgl_renderer_resource_unmap(res->resource_id);
> >>> +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> >>> +        return;
> >>> +    }
> >>> +    memory_region_init_ram_device_ptr(res->region, OBJECT(g), NULL, size, data);
> >>
> >> I think memory_region_init_ram_ptr() should be used instead.
> > 
> > Would you mind to explain the reason?
> 
> The documentation comment of memory_region_init_ram_device_ptr() says:
>  > A RAM device represents a mapping to a physical device, such as to a
>  > PCI MMIO BAR of an vfio-pci assigned device.  The memory region may be
>  > mapped into the VM address space and access to the region will modify
>  > memory directly.  However, the memory region should not be included in
>  > a memory dump (device may not be enabled/mapped at the time of the
>  > dump), and operations incompatible with manipulating MMIO should be
>  > avoided.  Replaces skip_dump flag.
> 
> In my understanding it's not MMIO so memory_region_init_ram_ptr() should 
> be used instead.
> 

It actually maybe the video memory (mmio) or system memory here. :-)

We will get the host memory for blob from host with
virgl_renderer_resource_map() in virglrenderer. In virglrenderer, there are two
types of VIRGL_RESOURCE_FD_DMABUF and VIRGL_RESOURCE_FD_SHM to indicate the
memory types. The shmem is the system memory that won't need GPU
accessible, and dmabuf is the memory that required GPU accessible. Host
kernel amdgpu driver will register dma-buf to export the resource buffer
for sharing, and here, it may have video memory that exposed by amdgpu pcie
bar0 in the dma-buf buffers. And we also have system memory(gtt) that can
be mapped as gpu page tables for gpu accessible.

07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Renoir (rev c1) (prog-if 00 [VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Renoir
        Flags: bus master, fast devsel, latency 0, IRQ 56
        Memory at fcc0000000 (64-bit, prefetchable) [size=256M]
        Memory at fcd0000000 (64-bit, prefetchable) [size=2M]
        I/O ports at 1000 [size=256]
        Memory at d0400000 (32-bit, non-prefetchable) [size=512K]
        Capabilities: <access denied>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

Thanks,
Ray

