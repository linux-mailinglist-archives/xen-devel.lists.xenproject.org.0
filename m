Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A307860D82
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684678.1064675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRUq-0007aG-EP; Fri, 23 Feb 2024 09:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684678.1064675; Fri, 23 Feb 2024 09:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRUq-0007Yj-BU; Fri, 23 Feb 2024 09:05:32 +0000
Received: by outflank-mailman (input) for mailman id 684678;
 Fri, 23 Feb 2024 09:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqZf=KA=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rdRUo-0007Yd-KW
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:05:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af30bb49-d22a-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 10:05:27 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DM3PR12MB9326.namprd12.prod.outlook.com (2603:10b6:0:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 09:05:24 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::e7a:5022:4b7d:ade1]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::e7a:5022:4b7d:ade1%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 09:05:24 +0000
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
X-Inumbo-ID: af30bb49-d22a-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lx7YqNic0jCnKxQxNUtNJ0D2NvhbsHKXko7iv4CAg4/OiGb78mZLGYpjaddgVCuLRbH3beDjfkPG6aelcMALvZ6s5x/OjXTE7/5eXik8tcbxYw7qQmAJ89AFmkGf3HYQ24RZFuWQGPOekoVP92cQGZ2o8t/kuEYXn2Cz/yoQheHaaPEP/shrmF92XWM8UaD4ga1aPfYa/NOjl/FqDMXdx9pPdNY9NqV0r+MTiHkN799bKpiPZSVavIdJEk+6KpoEqn3yu/cwAM6l5i4FCM/V7JUCbHFPnPBjx3PW/jyRR/Vuz0O4rk/lMBiuKmkLGdWaYKIxGAG8YFpx3pymRdQKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh62kUWafKq/zvrKyfXL6ltH0QXBb9WHQ12LE//thAc=;
 b=O6mdSkNOFLy6R+WNp/uDJxqPmIgxryGv5gWKiLJl0Qf8c9ykBBrM/iTwflcYDSEiomhx+O7QwtG6RP3+PSDD9q7PXsRlz/S4YgzUs5yTAaF5HbRYD7k1pRGENps03I5+Z/2BR34eX2P6BeJjMLpa5ppslKWc9ImNZql/X/KiBt3GzB1uc5mublhAC0Wffg3q+epFtLgts3OlTY214e05YkpeKzOOrI393sSe8/PeMBiukVvgZ5E8V6+hVUHlweTOpt5AkTP/dK8cTTNbHt4DQu7JFwLQIeGC89fwohSreknbKILrsmrUF76BWUJTCHmBq/Gtw155H+idV8jr2ycltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xh62kUWafKq/zvrKyfXL6ltH0QXBb9WHQ12LE//thAc=;
 b=f/nAZJuzCSZB0l4IYvI+wr7a2UVrzhKrzHoK2qAH5PoYkV5zzZlZZYGbaP6++QN/hG9CmsRTrwJVcf719i5i2cDpEViS/qd2Xjwnbsg4HMYucHj+gRL+HfilbkExfDxzTDW+i06NahkIKKJ08pi2wjVkthE/wZlaRH5/8tC58r4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Fri, 23 Feb 2024 17:04:24 +0800
From: Huang Rui <ray.huang@amd.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	"ernunes@redhat.com" <ernunes@redhat.com>,
	Alyssa Ross <hi@alyssa.is>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH v6 08/11] virtio-gpu: Resource UUID
Message-ID: <ZdhfmJZC8ws4KIhi@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-9-ray.huang@amd.com>
 <CAJ+F1C+NbeFkiGkN=JRifbs6QU2zyiMKUfQxA9KdonfFrL1CUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+NbeFkiGkN=JRifbs6QU2zyiMKUfQxA9KdonfFrL1CUg@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::19) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DM3PR12MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 395f87f5-cca7-4c24-a5da-08dc344e91a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/3LotZfBoyVYR1wtDhmZ0W4rlX75e3wOPkYMw2vORoUA87C5FScd8tXcrSKjzu81PdXtpptw0Lyh0O/KbOYBCyFtUhjFG/8XEtgys8c1Ryp09PQI6nfu9QTVDWjeNJt6CVqJSZdaqg9OAgnCmX7gpFEIwJOIh4yardah0GahYzKQgV5hcmzPfLV0mT9mLh9j+NR2jvP2fXaWFvgVIb6mVcIi0o4gJCgbo2pIu3jxvhCqFGOKcBhBYJ8MUMlg29GKJbVaQBeFLNzDHfJdpcQ/wzCgYHz36FPOoqgU5Gwno8MqKRhRkX973/cZkGtqEusXqpc8X/lcALcNbNcmeBfEkzCJB0GfoZbDsa1qnGFgitdKT8kAua9cCx3KGPZ4SEYteFZ6EyJB8zYpwRVx35+AlCSfxGwFFWJ4J8rAf/pB//fT9WgyhyrlNMu+HqWT/5hdVgpTx1arTArD246ZIot+ghp8t1Yso5aKeRQd1pc/K0iKBKKSretQZ28yjbuQGq1O+6MzlJ7oW9MMGSKygu8Xe4b51K3tKpouzhkyKdhbuNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWpoYW40WUtNeEwydEZwL1BuSDI3dDNEVnNOS2pacEd0Rmx2SWI0bm1YZndD?=
 =?utf-8?B?ZnZLWWFGMlNPc2xoYVVFY1JjWTdjRUR3UWY2RFdyVlI0RGpIaXd3N3N0dC91?=
 =?utf-8?B?N3h5ajdENVlKNmFoTys3cVdkdUdodFVLYWR0RzJvaTlla0tLMVFyVTMyNThk?=
 =?utf-8?B?OXg4bHZybWUvWFdBbTVFTTJ4NGRrbi9lMk1LZS9UdFZ1RU1YYnAxckIwZGhs?=
 =?utf-8?B?NHRONE9SOWFWVHhjTEoxcEk1bUtWMFpzK05UTTh4SWRMQjl5STRNaURUTjAy?=
 =?utf-8?B?QUtRK0lvVFVSUnZTVk9LcC9Ka24rVENwV0VLVUxreDEyYnlENUROTTg0MDk0?=
 =?utf-8?B?UHNJZXBxY2ZhRncwR01aeVB0RnhDR3B3U0x4eVJOMVVWeGZ6ZVlOQTNtRkU2?=
 =?utf-8?B?UjdLY0R4K0hGME1WcHJJa2pRbWtYczRnbmRocmZSRW51bWJKT1FNYnl6M1d3?=
 =?utf-8?B?M3M1T3lsMTlueWZTa25FSlJTZkJ4Y0puSytTNXpaSnRsZUdXa21keEhOQUR3?=
 =?utf-8?B?VFQzNTltNVlnNmxDVFNYNS90Ym5lQVVoM0RNRTZFVFc0WXpWbjZ4a1VZYlBZ?=
 =?utf-8?B?eXFWamtMQ09HM1FZbldGU0I4V1Z5YUhxUkY1OWdyVVd5a1RFNGxXa21ycTNa?=
 =?utf-8?B?cm4vbXl1aUc3eHRzSVJOblNFNWxUSXBIZlh4TVpTdVRhbUIrRGg0UzkwNHh0?=
 =?utf-8?B?S29lUUMrVTQyRnpLOUk2Z3NURkJUZHJvNVhoQmUwTXRHZVdleTUraFZEenZK?=
 =?utf-8?B?QUd5MFY5dklOWXl0czgwYjRER09MbnNnS0t3ZmIxcmswbEExWVhuSC9ya2JD?=
 =?utf-8?B?WEtxL1hvZ2g3TVVwdnJUNEx1dmRjeWlIeTc3K2ZnQjJ0WmVVQ0c1ZURKSWJ0?=
 =?utf-8?B?K0dOcEQ5R01XREtDcHVyL2swWHZudUR0SXdUNFB6czVLbzg2ZVpNRGhzczhL?=
 =?utf-8?B?Q2lra1ZKVVZEVm5NTWs1WkwrWVJMSXFUSHVvNFAvQlB0MkNSRFFyUC9MOGdD?=
 =?utf-8?B?dFpIMXVoazUxdk5BQzZYaHI1T0ZWNUJHM1YvRUw1WW5xVHJUTGdyR01UZzhN?=
 =?utf-8?B?aWtvNldVWHFpSDB5MVozL1E5Zm82aHpyZjZqdnAwdnBkNEppNHBQZHBxMXpo?=
 =?utf-8?B?WGM0TzIvZXdkcDRsZWVZbjRNUHpmQk9GL0F1ckhKdk1lUzJvOEwyeUtHeUEr?=
 =?utf-8?B?U2JGUzUxS09GKzZ6SFNxdXFhbTZtZitWQ3lzRnMyUXJKYlBVNU9PL3pUTHZI?=
 =?utf-8?B?RGpwSWFiLzNBeHRSVVI5WFF5ZCtIamNQUlVUbVpTaFZNMHFaTGNMR2hBYitN?=
 =?utf-8?B?eHMzWEY3RHpCRW9vRVBKTXJaMHNpT2xqODBMMmVmK1o5OTRXRUEwV2pRZXNT?=
 =?utf-8?B?aTd0bEg1NWpON1BwalR1VHBFRGt5S1FLeGl6MnRrenYwVTRBTEJldVYwUm5T?=
 =?utf-8?B?ci8xd3VOWDVrKytkanU1OWs2b056QUJqcUY5bzVOWHk5d09tOUoreDA4WEF5?=
 =?utf-8?B?cS9WNWYwVWFKZTZWbnJBSDg4Z0lDM2dTYU9BaUFyaFNqZkRmUXdVYTB1QUQ2?=
 =?utf-8?B?NFBIYUsvNlRjQTlpcE81RW5MeldodmVLblJPM29iQzQ4N2dCVTB6QSs1L1hR?=
 =?utf-8?B?TnQzaC9yUDZkMTdNa1NjQXNIU0duaTJ0VG1vQ3FVbmlLM0MrT3RaVm0reVJh?=
 =?utf-8?B?MnRTYVFzWjRQTHQyU3dLT2dVMk9YWDJVbU44NmU5VnorUzNvNGVKKzNBam95?=
 =?utf-8?B?RDhiL2RHSk02SmJyeFJXWUJtaldTdGpIWEkrd2tWdDdhVmxwWHRKRnpxelB5?=
 =?utf-8?B?cVdiVW1hU3JNTHJsTUJsWW44dFJIREV5VVZwUlJsU21pbXRjQzFUcmFST1VH?=
 =?utf-8?B?UHM3U0puVTRnK3pPMzZiN1NLR0lIN3Nobm8zZ2FJSXJISXNVWDNGejZFTldU?=
 =?utf-8?B?K0t2a3c3cDFVaUViTHk4dlZrSUNTM2xrc3Z5U1dqZmpJVDNncXRSand2WFNZ?=
 =?utf-8?B?NVdNQ2ZWcGQxMnBZR3RLUzJRMzVGV2svZkxhMy81bmdKdlhJWHZDak03Skly?=
 =?utf-8?B?aXpQUEhKQktzdHdHaklGMUwzZDBUY1Q0Ly9GTklkVFZmcXZwSGNMbEpramM2?=
 =?utf-8?Q?cbg83vUmCyxtssz9EWgcHAM1/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395f87f5-cca7-4c24-a5da-08dc344e91a9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 09:05:23.8932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSgAaWTo3cx1Rhy5Q0Hjpv46UEc+mtPmmNAKHKE2rRC8CG0c02eZ11U0IrVxApUnC4gOwL/bghX6KXZSJWlpow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9326

On Tue, Jan 02, 2024 at 08:49:54PM +0800, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Dec 19, 2023 at 11:55 AM Huang Rui <ray.huang@amd.com> wrote:
> >
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >
> > Enable resource UUID feature and implement command resource assign UUID.
> > This is done by introducing a hash table to map resource IDs to their
> > UUIDs.
> 
> I agree with Akihiko, what about putting QemuUUID in struct
> virtio_gpu_simple_resource?

OK, I will add a member of UUID in simple resource structure.

> 
> (I also doubt about the hash table usefulness, but I don't know
> how/why the UUID is used)
> 

The system cannot be without this patch, let me figure it out the reason.

Thanks,
Ray

> >
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >
> > Changes in v6:
> > - Set resource uuid as option.
> > - Implement optional subsection of vmstate_virtio_gpu_resource_uuid_state
> >   or virtio live migration.
> > - Use g_int_hash/g_int_equal instead of the default.
> > - Move virtio_vgpu_simple_resource initialization in the earlier new patch
> >   "virtio-gpu: Introduce virgl_gpu_resource structure"
> >
> >  hw/display/trace-events        |   1 +
> >  hw/display/virtio-gpu-base.c   |   4 ++
> >  hw/display/virtio-gpu-virgl.c  |   3 +
> >  hw/display/virtio-gpu.c        | 119 +++++++++++++++++++++++++++++++++
> >  include/hw/virtio/virtio-gpu.h |   7 ++
> >  5 files changed, 134 insertions(+)
> >
> > diff --git a/hw/display/trace-events b/hw/display/trace-events
> > index 2336a0ca15..54d6894c59 100644
> > --- a/hw/display/trace-events
> > +++ b/hw/display/trace-events
> > @@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" P
> >  virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
> >  virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
> >  virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
> > +virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
> >  virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
> >  virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
> >  virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
> > diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> > index 37af256219..6bcee3882f 100644
> > --- a/hw/display/virtio-gpu-base.c
> > +++ b/hw/display/virtio-gpu-base.c
> > @@ -236,6 +236,10 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
> >          features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
> >      }
> >
> > +    if (virtio_gpu_resource_uuid_enabled(g->conf)) {
> > +        features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
> > +    }
> > +
> >      return features;
> >  }
> >
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 5a3a292f79..be9da6e780 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -777,6 +777,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
> >          /* TODO add security */
> >          virgl_cmd_ctx_detach_resource(g, cmd);
> >          break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
> > +        virtio_gpu_resource_assign_uuid(g, cmd);
> > +        break;
> >      case VIRTIO_GPU_CMD_GET_CAPSET_INFO:
> >          virgl_cmd_get_capset_info(g, cmd);
> >          break;
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index 8189c392dc..466debb256 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -958,6 +958,37 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
> >      virtio_gpu_cleanup_mapping(g, res);
> >  }
> >
> > +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
> > +                                     struct virtio_gpu_ctrl_command *cmd)
> > +{
> > +    struct virtio_gpu_simple_resource *res;
> > +    struct virtio_gpu_resource_assign_uuid assign;
> > +    struct virtio_gpu_resp_resource_uuid resp;
> > +    QemuUUID *uuid;
> > +
> > +    VIRTIO_GPU_FILL_CMD(assign);
> > +    virtio_gpu_bswap_32(&assign, sizeof(assign));
> > +    trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);
> > +
> > +    res = virtio_gpu_find_check_resource(g, assign.resource_id, false, __func__, &cmd->error);
> > +    if (!res) {
> > +        return;
> > +    }
> > +
> > +    memset(&resp, 0, sizeof(resp));
> > +    resp.hdr.type = VIRTIO_GPU_RESP_OK_RESOURCE_UUID;
> > +
> > +    uuid = g_hash_table_lookup(g->resource_uuids, &assign.resource_id);
> > +    if (!uuid) {
> > +        uuid = g_new(QemuUUID, 1);
> > +        qemu_uuid_generate(uuid);
> > +        g_hash_table_insert(g->resource_uuids, &assign.resource_id, uuid);
> > +    }
> > +
> > +    memcpy(resp.uuid, uuid, sizeof(QemuUUID));
> > +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> > +}
> > +
> >  void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
> >                                     struct virtio_gpu_ctrl_command *cmd)
> >  {
> > @@ -1006,6 +1037,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
> >      case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
> >          virtio_gpu_resource_detach_backing(g, cmd);
> >          break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
> > +        virtio_gpu_resource_assign_uuid(g, cmd);
> > +        break;
> >      default:
> >          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >          break;
> > @@ -1400,6 +1434,57 @@ static int virtio_gpu_blob_load(QEMUFile *f, void *opaque, size_t size,
> >      return 0;
> >  }
> >
> > +static int virtio_gpu_resource_uuid_save(QEMUFile *f, void *opaque, size_t size,
> > +                                         const VMStateField *field,
> > +                                         JSONWriter *vmdesc)
> > +{
> > +    VirtIOGPU *g = opaque;
> > +    struct virtio_gpu_simple_resource *res;
> > +    QemuUUID *uuid;
> > +
> > +    /* in 2d mode we should never find unprocessed commands here */
> > +    assert(QTAILQ_EMPTY(&g->cmdq));
> > +
> > +    QTAILQ_FOREACH(res, &g->reslist, next) {
> > +        qemu_put_be32(f, res->resource_id);
> > +        uuid = g_hash_table_lookup(g->resource_uuids, &res->resource_id);
> > +        qemu_put_buffer(f, (void *)uuid, sizeof(QemuUUID));
> > +    }
> > +    qemu_put_be32(f, 0); /* end of list */
> > +
> > +    g_hash_table_destroy(g->resource_uuids);
> > +
> > +    return 0;
> > +}
> > +
> > +static int virtio_gpu_resource_uuid_load(QEMUFile *f, void *opaque, size_t size,
> > +                                         const VMStateField *field)
> > +{
> > +    VirtIOGPU *g = opaque;
> > +    struct virtio_gpu_simple_resource *res;
> > +    uint32_t resource_id;
> > +    QemuUUID *uuid = NULL;
> > +
> > +    g->resource_uuids = g_hash_table_new_full(g_int_hash, g_int_equal, NULL, g_free);
> > +    resource_id = qemu_get_be32(f);
> > +    while (resource_id != 0) {
> > +        res = virtio_gpu_find_resource(g, resource_id);
> > +        if (res) {
> > +            return -EINVAL;
> > +        }
> > +
> > +        res = g_new0(struct virtio_gpu_simple_resource, 1);
> > +        res->resource_id = resource_id;
> > +
> > +        qemu_get_buffer(f, (void *)uuid, sizeof(QemuUUID));
> > +        g_hash_table_insert(g->resource_uuids, &res->resource_id, uuid);
> > +
> > +        resource_id = qemu_get_be32(f);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  static int virtio_gpu_post_load(void *opaque, int version_id)
> >  {
> >      VirtIOGPU *g = opaque;
> > @@ -1475,12 +1560,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
> >      QTAILQ_INIT(&g->reslist);
> >      QTAILQ_INIT(&g->cmdq);
> >      QTAILQ_INIT(&g->fenceq);
> > +
> > +    g->resource_uuids = g_hash_table_new_full(g_int_hash, g_int_equal, NULL, g_free);
> >  }
> >
> >  static void virtio_gpu_device_unrealize(DeviceState *qdev)
> >  {
> >      VirtIOGPU *g = VIRTIO_GPU(qdev);
> >
> > +    g_hash_table_destroy(g->resource_uuids);
> 
> better:
> g_clear_pointer(&g->resource_uuids, g_hash_table_unref);
> 
> >      g_clear_pointer(&g->ctrl_bh, qemu_bh_delete);
> >      g_clear_pointer(&g->cursor_bh, qemu_bh_delete);
> >      g_clear_pointer(&g->reset_bh, qemu_bh_delete);
> > @@ -1534,6 +1622,8 @@ void virtio_gpu_reset(VirtIODevice *vdev)
> >          g_free(cmd);
> >      }
> >
> > +    g_hash_table_remove_all(g->resource_uuids);
> > +
> >      virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
> >  }
> >
> > @@ -1583,6 +1673,32 @@ const VMStateDescription vmstate_virtio_gpu_blob_state = {
> >      },
> >  };
> >
> > +static bool virtio_gpu_resource_uuid_state_needed(void *opaque)
> > +{
> > +    VirtIOGPU *g = VIRTIO_GPU(opaque);
> > +
> > +    return virtio_gpu_resource_uuid_enabled(g->parent_obj.conf);
> > +}
> > +
> > +const VMStateDescription vmstate_virtio_gpu_resource_uuid_state = {
> > +    .name = "virtio-gpu/resource_uuid",
> > +    .minimum_version_id = VIRTIO_GPU_VM_VERSION,
> > +    .version_id = VIRTIO_GPU_VM_VERSION,
> > +    .needed = virtio_gpu_resource_uuid_state_needed,
> > +    .fields = (const VMStateField[]){
> > +        {
> > +            .name = "virtio-gpu/resource_uuid",
> > +            .info = &(const VMStateInfo) {
> > +                .name = "resource_uuid",
> > +                .get = virtio_gpu_resource_uuid_load,
> > +                .put = virtio_gpu_resource_uuid_save,
> > +            },
> > +            .flags = VMS_SINGLE,
> > +        } /* device */,
> > +        VMSTATE_END_OF_LIST()
> > +    },
> > +};
> > +
> >  /*
> >   * For historical reasons virtio_gpu does not adhere to virtio migration
> >   * scheme as described in doc/virtio-migration.txt, in a sense that no
> > @@ -1610,6 +1726,7 @@ static const VMStateDescription vmstate_virtio_gpu = {
> >      },
> >      .subsections = (const VMStateDescription * []) {
> >          &vmstate_virtio_gpu_blob_state,
> > +        &vmstate_virtio_gpu_resource_uuid_state,
> >          NULL
> >      },
> >      .post_load = virtio_gpu_post_load,
> > @@ -1622,6 +1739,8 @@ static Property virtio_gpu_properties[] = {
> >      DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
> >                      VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> >      DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> > +    DEFINE_PROP_BIT("resource_uuid", VirtIOGPU, parent_obj.conf.flags,
> > +                    VIRTIO_GPU_FLAG_RESOURCE_UUID_ENABLED, false),
> 
> why not enable it by default? (and set it to false for machine < 9.0
> 
> >  #ifdef HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS
> >      DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> >                      VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, true),
> > diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> > index 584ba2ed73..76b410fe91 100644
> > --- a/include/hw/virtio/virtio-gpu.h
> > +++ b/include/hw/virtio/virtio-gpu.h
> > @@ -98,6 +98,7 @@ enum virtio_gpu_base_conf_flags {
> >      VIRTIO_GPU_FLAG_BLOB_ENABLED,
> >      VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
> >      VIRTIO_GPU_FLAG_RUTABAGA_ENABLED,
> > +    VIRTIO_GPU_FLAG_RESOURCE_UUID_ENABLED,
> >  };
> >
> >  #define virtio_gpu_virgl_enabled(_cfg) \
> > @@ -114,6 +115,8 @@ enum virtio_gpu_base_conf_flags {
> >      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
> >  #define virtio_gpu_rutabaga_enabled(_cfg) \
> >      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_RUTABAGA_ENABLED))
> > +#define virtio_gpu_resource_uuid_enabled(_cfg) \
> > +    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_RESOURCE_UUID_ENABLED))
> >  #define virtio_gpu_hostmem_enabled(_cfg) \
> >      (_cfg.hostmem > 0)
> >
> > @@ -209,6 +212,8 @@ struct VirtIOGPU {
> >          QTAILQ_HEAD(, VGPUDMABuf) bufs;
> >          VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
> >      } dmabuf;
> > +
> > +    GHashTable *resource_uuids;
> >  };
> >
> >  struct VirtIOGPUClass {
> > @@ -307,6 +312,8 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
> >                                      struct iovec *iov, uint32_t count);
> >  void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
> >                                  struct virtio_gpu_simple_resource *res);
> > +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
> > +                                     struct virtio_gpu_ctrl_command *cmd);
> >  void virtio_gpu_process_cmdq(VirtIOGPU *g);
> >  void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
> >  void virtio_gpu_reset(VirtIODevice *vdev);
> > --
> > 2.25.1
> >
> 
> 
> -- 
> Marc-André Lureau

