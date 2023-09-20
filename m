Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF3F7A7879
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 12:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605484.943054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiu1c-0004sC-3d; Wed, 20 Sep 2023 10:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605484.943054; Wed, 20 Sep 2023 10:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiu1c-0004pm-0x; Wed, 20 Sep 2023 10:01:40 +0000
Received: by outflank-mailman (input) for mailman id 605484;
 Wed, 20 Sep 2023 10:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7N78=FE=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qiu1Z-0004pg-TB
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 10:01:38 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ade0cb94-579c-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 12:01:34 +0200 (CEST)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 10:01:26 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::c3b:811:fd1d:c33e%6]) with mapi id 15.20.6792.021; Wed, 20 Sep 2023
 10:01:26 +0000
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
X-Inumbo-ID: ade0cb94-579c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adih42crd0Dy8b377n+dSqi3tnHJcwvQmUkTGvpF4yso/hMQOSb/5/NEuhSzf0BrH89kTDUK1mrwmvOgtu0QSPBxoVJpTnRei0relqr0xPLIA0SOlV2cDUtIn2ui47wzz0XzoLBp4k5JfLDrRAvaxBVAI/329evIKtkUZfIzjezz7Fy4SiKzKxnkCNPn1ans9W/eklpdG/wO+CvF1b2RPOUH+XQi91x04PaDgvcVlG6ZzmOZKGJAdBbDLZc2R1l3F3QCGmiOl+85ud0jkI64bDooW+Qgc+4YAKhBgWm5VrZ0xqNCz8cLuWpDhuff1ln6057TLbzCJHCWO7jiZUgMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imc0rNTMZq86xYdsy4fjYXqwQVAR4XrkSY8MU8QvQO4=;
 b=JuVAfWd89qH7fcNKfQFl1k7OoWgIJavdk6i+c+ID6dTpS7+dAdmak+HiV/ikCCxj5ACJ9sv8f6OWRgxzWIzidOyHr+Br7OAsx7uZcnAlxX9G9YP/U9IeduHskIi80o4zdV4/2/nnqQOqajDlzg2bjHpYEkVPGe3vb2Lmsw6/Y8m0yQErfFAS1i8nRPiKxltVFTS2f5UPxhxWOIN9K2HrpGoWB8L9SNWSKfE54CWoPlzZN/VXvltrHOGvphxmQj6XZnUBzmkNRLHsgi7A697b1gTPb7MPvIp6rU9bYqSjewKdB8cpvN9e9UTqtMsWBMAQpcwz5NDp/3NaOeqnU/+SVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imc0rNTMZq86xYdsy4fjYXqwQVAR4XrkSY8MU8QvQO4=;
 b=nmHTxJIJo+Wqu6n+Z+QeE81tz/0NJ8TmqNAzYJuJBMjqws98oG8Yg8BGKtBwymvZ30MdPqudOlajXdzXIs5iteDJf/NwYZXcUAHgwRwrVF+SucgGdOrZnClEvVCnphnigdqt8C9fw7HqZTxwewfUSmcVSsIqaFFB1hbTv+5keY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 20 Sep 2023 18:00:55 +0800
From: Huang Rui <ray.huang@amd.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Albert Esteve <aesteve@redhat.com>,
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
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [QEMU PATCH v5 10/13] virtio-gpu: Resource UUID
Message-ID: <ZQrC1xzMIUOqRhm3@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-11-ray.huang@amd.com>
 <CAJ+F1C+aWM+TeoLxEqYqsMUow53rEBGc_qJwNS2pU2T5D2J+xQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+aWM+TeoLxEqYqsMUow53rEBGc_qJwNS2pU2T5D2J+xQ@mail.gmail.com>
X-ClientProxiedBy: SG3P274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::17)
 To SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e114393-d2c7-4848-84ad-08dbb9c08d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	183tc36QTM167KIMTKrvJbwQxWI8kpAo5HJ8E2sP97k5YRWI8p29vQcv6wikG/nEVAZj+8b33D/0/UQ/nMq+WHmbLQUpSCUb3+z30WIPe3fxUoYu15XTtyYrGPP+ovzAxKRbWDUz5RSmV5/+jLnwp1nwyxkcSX8L1G+LoqAovwU8P0hN5d9unbPFoyci4qyC7lqXWR4fTf8SDqS89JPsUTPaybmG0fmwV6Iu2lIsrLoCyZ8V7tBfYoCVpXQoTIkQOLIkK0ptkfRlCr3VpwJbl+SyUahj2lEVI7136PWyinX0ufP2oUZX9o2v7jvLN0YAYh9nvShNjMuIX+uZ9J40GalcdPpvLTJwjs/o4eF8uTEgDODWpV+qeZbRpWmBBTxB7bPNeSBGc/pEWEnFQrogLEzfh6puiyRXzfqCAO/wVXGoyAxsaHawVcaHco9wj795hbNt5IG+xc1vA+jXKDKtpYvWTKxMYCvaf16Oj+LGndSrbwsMZzOyLrJNWOufb2ecduE7cemkPLt3+jTWpv9B7dON8potXoeLPvIJv/ARlNZ5eEEKDf5AOioOG5xzjYJ9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(1800799009)(186009)(451199024)(478600001)(6506007)(6486002)(53546011)(6666004)(86362001)(36756003)(38100700002)(8676002)(26005)(2906002)(30864003)(6512007)(83380400001)(8936002)(5660300002)(2616005)(4326008)(41300700001)(66556008)(54906003)(7416002)(316002)(66946007)(66476007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJrT0cyR0tNUG44TFNNQ2VhWlUyUXFRQ2JUazlqWUR1SEFieGp4bzlWSkI4?=
 =?utf-8?B?SmpCRUExN09IZ3Qza2lCT1Z5WmZqNjRpV1czcUFaczh3TWZlYWkrcXRBRSt5?=
 =?utf-8?B?UDVva0NFZWZ0RCtiMHE2b2cwdDFXUnNjSDdHZUlsQVNtVDUwbDVTN3VVUzlj?=
 =?utf-8?B?NXNzVEFEcVU2dVZZTjBTTHBaTzBHRHgrdXlVcU1lOWpIWER5NklraGllcWdw?=
 =?utf-8?B?OWE1SGg5aC9sZGM1bjNJWFJjemJEVmI1aFVLV1hra1FycU5ocGZ0Qzc1RjN1?=
 =?utf-8?B?eWtoZDJDdDQyZFg0NHdVZVpwZzNBcFV3K2E3ZlBWUitKMk1HWkVLak5XUkNR?=
 =?utf-8?B?Yk41U043bENHdlJmVW1UT2IwWWpycHdKUWtFWjdXNmx2S2NiNnRDOHh1U0N2?=
 =?utf-8?B?cXJPcndoOEFHQlJCamlESjU5cHV6RUI5d2t6bk1XdGl6WEZNWnUrV1B6cVdj?=
 =?utf-8?B?TFJTd0hrQ2pIdHhpVXVRb0ZVaTlOTDN3OVd2cTZ6TGZoWWlsZGkvV0FOVEs4?=
 =?utf-8?B?ZUd0RGFjMU95enVYNFJlbzVtNldFUDZRVlBibVY1ZVVFOTJ0MnFsVVZuTU82?=
 =?utf-8?B?MUV2SGd1d0dsMmVsRzNuU3YrdGEyZ1djM0RWZlVDakJ0dGxicG14bEh1RTky?=
 =?utf-8?B?cFJ5VnJRT3NETUlmc1FrWjBtSUI1YWpKVWRQYS96MlBGZEdnd0doZzFkNnJs?=
 =?utf-8?B?QlZHZUFEYVR1VWhmVTJpR252UDVrRTRrMkYveFFWT2tIUnRIbno2eHVXZjJt?=
 =?utf-8?B?VzlvcHN3UmdhTnhxWnZiRHVYRThsblJtVXlIWFJ0NEtyMllHUXpHdEg1SVFT?=
 =?utf-8?B?aVlnUlYySGxDTnl3cDExZkVoajZSODJpSjYzSTNNVytxWFdkcGMwWWFobmhI?=
 =?utf-8?B?bnF6VjJIK3hIWHZsRThabzQxVVZQTlF5OGZYaHd1VEY2WkR0WG85aE92V042?=
 =?utf-8?B?U1owWmFnRkNsQjVoL3Nxbk5acS9aL1pzNml2NVhQc1RlbUtKSmhFWE1Rckdh?=
 =?utf-8?B?czZiSytZS2RPVmhHMVlKcmtjUjhwak1TN1hrV0NOWkkwY0JoRlVHNWhuTmtx?=
 =?utf-8?B?RHl0dVNXRHdTVktMdUdaTjYxTGxIRzd1OWFRbzlIbkI1bUYyMnFnWjZraGxQ?=
 =?utf-8?B?QnNSVENGU0p6eFlzN3dkRDJGQjVJWDN1R1RZMDJlZURSanpncU5Ra3Z5eFEx?=
 =?utf-8?B?MldmeGk2dGZFS3dsNXpLd1J1VHB2R2lxQlh3WWVOQVE4TlVSekM5T3FnbmMv?=
 =?utf-8?B?MkVzUG9JRHpGRHJxUmdrWHpzTitNZHNpQ3lzWk94aVVKTytJelhSYnptVW5T?=
 =?utf-8?B?YXJ1NVVtbndFV0F3bjhINUJua1ZyeHV5NDJaa0wzaUFPMk1iUVlKbjFocERB?=
 =?utf-8?B?RjltRVI4UUVKSTlDUlUreVFYRHhVT2hyM09WaGw0SHE4d0RHR05pWk5rUGkr?=
 =?utf-8?B?RFZ1S3hlTlYwTU9najZtclo0YStidHBxWENzMkFHNmRHaEVjY291aHBidDE1?=
 =?utf-8?B?dGU1OW0wUVdGVjV5Sm96ZVhjc0hkQkREeC8wYjNZVDVOTUZMamE5aTAxU01K?=
 =?utf-8?B?bjJYMk0rTVJiYUVkYm8wM0lYckN2bHdOSUt6b3BTcTR4RjVYWjJQTmkwOGsz?=
 =?utf-8?B?WFN1Q202a05tYk41S3NUWE4waWRuZkF6dnpQbkswcmdIRC8xZmV6R2QvU3pG?=
 =?utf-8?B?enlNYmdUaFc2SjFuRG10dzVsSEg2dGk2VWRHYVl0TWZ3MUdqaEJEZkQxaEUx?=
 =?utf-8?B?K2JXaXZOT284Y2hGcUVES0lRUE5xL1NIUDJocWlxeWRzOG5sRlNIWGh5L04w?=
 =?utf-8?B?b3J0RDZWT2x6MjgrMTFaT3gybTBESjhKRjBJZFlMTnh6UStZcGE0RzVyNStG?=
 =?utf-8?B?SEwwaDB2MTlIKzF3bndPRWtqOCtYRk5UMm4wNWxUZUl1NURhRUY4TGpYYmVz?=
 =?utf-8?B?dEJNWTNLUHRoYkpVK2RFV2FoTnkxcUxVZ29wcUNWVEUyT0d4amhabTVBb29U?=
 =?utf-8?B?eENaRGhDWkd2WDBlczRlRytnYkFWakZwaDVPZzI3N3Erc3JGcGJpMTZmQ2hx?=
 =?utf-8?B?enJTTkczcFF4Y2l3cDhjSGdMY3FuOUsyNXdHSTRjaUwwOG81NVc5RW02SFBE?=
 =?utf-8?Q?85NBFvat1jUMcrGFFGA8B4cuU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e114393-d2c7-4848-84ad-08dbb9c08d20
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 10:01:25.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TXq9l/O/hMlLZhlRAQxuUGaSjsT+56UXLuEAyqB33lkUVGMAK1ZuSaBbksc983u58YSen3GSt6uBaE3VyaROg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995

On Tue, Sep 19, 2023 at 05:00:05PM +0800, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Sep 15, 2023 at 3:14 PM Huang Rui <ray.huang@amd.com> wrote:
> >
> > From: Antonio Caggiano <antonio.caggiano@collabora.com>
> >
> > Enable resource UUID feature and implement command resource assign UUID.
> > This is done by introducing a hash table to map resource IDs to their
> > UUIDs.
> >
> > Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >
> > V4 -> V5:
> >     - Add virtio migration handling for uuid (Akihiko)
> >     - Adjust sequence to allocate gpu resource before virglrender resource
> >       creation (Akihiko)
> >     - Clean up (Akihiko)
> >
> >  hw/display/trace-events        |  1 +
> >  hw/display/virtio-gpu-base.c   |  2 ++
> >  hw/display/virtio-gpu-virgl.c  | 21 ++++++++++++
> >  hw/display/virtio-gpu.c        | 58 ++++++++++++++++++++++++++++++++++
> >  include/hw/virtio/virtio-gpu.h |  6 ++++
> >  5 files changed, 88 insertions(+)
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
> > index 4f2b0ba1f3..f44388715c 100644
> > --- a/hw/display/virtio-gpu-base.c
> > +++ b/hw/display/virtio-gpu-base.c
> > @@ -236,6 +236,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
> >          features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
> >      }
> >
> > +    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
> 
> This changes what is exposed to the guest. We should have an option
> for it, and set it to false on older machine types (similar to what is
> done for edid).
> 

Did you mean we can add "resource_uuid" in virtio_gpu_properties[] like
below, user can set it to false on older types with the param?

DEFINE_PROP_BIT("resource_uuid", VirtIOGPU, parent_obj.conf.flags,
                VIRTIO_GPU_FLAG_RESOURCE_UUID, true);

> > +
> >      return features;
> >  }
> >
> > diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> > index 563a6f2f58..8a017dbeb4 100644
> > --- a/hw/display/virtio-gpu-virgl.c
> > +++ b/hw/display/virtio-gpu-virgl.c
> > @@ -36,11 +36,20 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
> >  {
> >      struct virtio_gpu_resource_create_2d c2d;
> >      struct virgl_renderer_resource_create_args args;
> > +    struct virtio_gpu_simple_resource *res;
> >
> >      VIRTIO_GPU_FILL_CMD(c2d);
> >      trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
> >                                         c2d.width, c2d.height);
> >
> > +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> > +    if (!res) {
> 
> needless OOM here too
> 
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +    res->resource_id = c2d.resource_id;
> > +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> > +
> >      args.handle = c2d.resource_id;
> >      args.target = 2;
> >      args.format = c2d.format;
> > @@ -60,11 +69,20 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> >  {
> >      struct virtio_gpu_resource_create_3d c3d;
> >      struct virgl_renderer_resource_create_args args;
> > +    struct virtio_gpu_simple_resource *res;
> >
> >      VIRTIO_GPU_FILL_CMD(c3d);
> >      trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
> >                                         c3d.width, c3d.height, c3d.depth);
> >
> > +    res = g_new0(struct virtio_gpu_simple_resource, 1);
> > +    if (!res) {
> 
> same
> 
> > +        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
> > +        return;
> > +    }
> > +    res->resource_id = c3d.resource_id;
> > +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
> > +
> >      args.handle = c3d.resource_id;
> >      args.target = c3d.target;
> >      args.format = c3d.format;
> > @@ -682,6 +700,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
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
> > index cc4c1f81bb..44414c1c5e 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -966,6 +966,38 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
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
> > +    uuid = g_hash_table_lookup(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id));
> > +    if (!uuid) {
> > +        uuid = g_new(QemuUUID, 1);
> > +        qemu_uuid_generate(uuid);
> > +        g_hash_table_insert(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id), uuid);
> > +        res->has_uuid = true;
> > +    }
> > +
> > +    memcpy(resp.uuid, uuid, sizeof(QemuUUID));
> > +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> > +}
> > +
> >  void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
> >                                     struct virtio_gpu_ctrl_command *cmd)
> >  {
> > @@ -1014,6 +1046,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
> >      case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
> >          virtio_gpu_resource_detach_backing(g, cmd);
> >          break;
> > +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
> > +        virtio_gpu_resource_assign_uuid(g, cmd);
> > +        break;
> >      default:
> >          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
> >          break;
> > @@ -1208,6 +1243,7 @@ static int virtio_gpu_save(QEMUFile *f, void *opaque, size_t size,
> >      VirtIOGPU *g = opaque;
> >      struct virtio_gpu_simple_resource *res;
> >      int i;
> > +    QemuUUID *uuid;
> >
> >      /* in 2d mode we should never find unprocessed commands here */
> >      assert(QTAILQ_EMPTY(&g->cmdq));
> > @@ -1224,9 +1260,17 @@ static int virtio_gpu_save(QEMUFile *f, void *opaque, size_t size,
> >          }
> >          qemu_put_buffer(f, (void *)pixman_image_get_data(res->image),
> >                          pixman_image_get_stride(res->image) * res->height);
> > +
> > +        qemu_put_byte(f, res->has_uuid);
> > +        if (res->has_uuid) {
> > +            uuid = g_hash_table_lookup(g->resource_uuids, GUINT_TO_POINTER(res->resource_id));
> > +            qemu_put_buffer(f, (void *)uuid, sizeof(QemuUUID));
> > +        }
> 
> This is breaking the migration format. It will need to be handled with
> an optional subsection instead.

I am using one byte to store res->has_uuid after pixman data, if check this
field is true, then have UUID data.

Would you mind to elaborate the optional subsection?

> 
> >      }
> >      qemu_put_be32(f, 0); /* end of list */
> >
> > +    g_hash_table_destroy(g->resource_uuids);
> > +
> >      return vmstate_save_state(f, &vmstate_virtio_gpu_scanouts, g, NULL);
> >  }
> >
> > @@ -1239,9 +1283,12 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
> >      uint32_t resource_id, pformat;
> >      void *bits = NULL;
> >      int i;
> > +    QemuUUID *uuid = NULL;
> >
> >      g->hostmem = 0;
> >
> > +    g->resource_uuids = g_hash_table_new_full(NULL, NULL, NULL, g_free);
> 
> Since it maps int -> uuid, it should probably use g_int_hash() /
> g_int_qual() instead of the default (g_direct_hash()).
> 

Thanks to reminder, will update it in V6.

> > +
> >      resource_id = qemu_get_be32(f);
> >      while (resource_id != 0) {
> >          res = virtio_gpu_find_resource(g, resource_id);
> > @@ -1292,6 +1339,12 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
> >          qemu_get_buffer(f, (void *)pixman_image_get_data(res->image),
> >                          pixman_image_get_stride(res->image) * res->height);
> >
> > +        res->has_uuid = qemu_get_byte(f);
> > +        if (res->has_uuid) {
> > +            qemu_get_buffer(f, (void *)uuid, sizeof(QemuUUID));
> > +            g_hash_table_insert(g->resource_uuids, GUINT_TO_POINTER(res->resource_id), uuid);
> > +        }
> > +
> >          /* restore mapping */
> >          for (i = 0; i < res->iov_cnt; i++) {
> >              hwaddr len = res->iov[i].iov_len;
> > @@ -1393,12 +1446,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
> >      QTAILQ_INIT(&g->reslist);
> >      QTAILQ_INIT(&g->cmdq);
> >      QTAILQ_INIT(&g->fenceq);
> > +
> > +    g->resource_uuids = g_hash_table_new_full(NULL, NULL, NULL, g_free);
> >  }
> >
> >  static void virtio_gpu_device_unrealize(DeviceState *qdev)
> >  {
> >      VirtIOGPU *g = VIRTIO_GPU(qdev);
> >
> > +    g_hash_table_destroy(g->resource_uuids);
> >      g_clear_pointer(&g->ctrl_bh, qemu_bh_delete);
> >      g_clear_pointer(&g->cursor_bh, qemu_bh_delete);
> >      g_clear_pointer(&g->reset_bh, qemu_bh_delete);
> > @@ -1452,6 +1508,8 @@ void virtio_gpu_reset(VirtIODevice *vdev)
> >          g_free(cmd);
> >      }
> >
> > +    g_hash_table_remove_all(g->resource_uuids);
> > +
> >      virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
> >  }
> >
> > diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> > index b9adc28071..67b39fccec 100644
> > --- a/include/hw/virtio/virtio-gpu.h
> > +++ b/include/hw/virtio/virtio-gpu.h
> > @@ -63,6 +63,8 @@ struct virtio_gpu_simple_resource {
> >      MemoryRegion *region;
> >  #endif
> >
> > +    bool has_uuid;
> > +
> >      QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
> >  };
> >
> > @@ -208,6 +210,8 @@ struct VirtIOGPU {
> >          QTAILQ_HEAD(, VGPUDMABuf) bufs;
> >          VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
> >      } dmabuf;
> > +
> > +    GHashTable *resource_uuids;
> >  };
> >
> >  struct VirtIOGPUClass {
> > @@ -285,6 +289,8 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
> >                                      struct iovec *iov, uint32_t count);
> >  void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
> >                                  struct virtio_gpu_simple_resource *res);
> > +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
> > +                                     struct virtio_gpu_ctrl_command *cmd);
> >  void virtio_gpu_process_cmdq(VirtIOGPU *g);
> >  void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
> >  void virtio_gpu_reset(VirtIODevice *vdev);
> > --
> > 2.34.1
> >
> >
> 
> 
> -- 
> Marc-André Lureau

