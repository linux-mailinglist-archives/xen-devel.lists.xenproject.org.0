Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195BE8188D8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 14:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656824.1025279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaRl-0003GO-Fp; Tue, 19 Dec 2023 13:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656824.1025279; Tue, 19 Dec 2023 13:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFaRl-0003EN-Cj; Tue, 19 Dec 2023 13:47:45 +0000
Received: by outflank-mailman (input) for mailman id 656824;
 Tue, 19 Dec 2023 13:47:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFaRk-0003EH-MV
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 13:47:44 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e3669b1-9e75-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 14:47:43 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 13:47:37 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::87d4:680b:51ef:181]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::87d4:680b:51ef:181%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 13:47:37 +0000
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
X-Inumbo-ID: 2e3669b1-9e75-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSssbbDFK/RcCK+wIKzd9DL8Jf1/ShKy1lmnwo7dKsTbYjeiJPx4nGqQOnNhzqQEhDGO8ZR6wDQSX+4vT1yfUCJm2/eHwtVMOOJFjYcgydoIJLRJqaIVMb2YjXF2INyp8rkfancyc/d/zdN7YvkGbVqD4gzw7AnDqFXYsJx7li/mR3+BNn9ThaNS7Ld9FNKPF+hOiUkDMCj9LfyZQ1+AgiWmmFtB05DedBrmJgiZscnnF25zI083F5GOLAqyVeNpm8uQg3f2+GgX69dl80w90Nl8dYIwHfJ0FnisAD30dqwvJAH9vXtwb2aaTEYnSYCqWqvDdS5Q0F86PxbhYmtCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu9qE1fckvSHFFmwWket4wpttfMg/+RXOEm8NUjf+/A=;
 b=Fe6Jf1oEHb227n3/VRIK2aLh5F8qSXXzQ1/BHD8qOw+vnA5xKRb8lpQcl+w7C9S8lWZqLXc+i8pGthac1dWrzSzBskGL5e93mnfy7TAVaC0jpfgHAiomKPO85/pt6bJdEZJk9gVzP8CM15m5c87g+6qVNIbYW7rVFrAhb35La6/66eIW1Vk/YiicTRajSYzZSx6Z8SfS0HwCBW+m4fRLKq0D5XYt99h7XzNmBIpqKsOSRdm6WcpiMlmVRdHkNd+C+6ovZllMN+xLJ+4Coiuwj2vWcp8S+dU0MlKaEqOPgyOk/2XXurCkqgSaincWqDst5H8BdQZ3wGOqnWFUwIiEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu9qE1fckvSHFFmwWket4wpttfMg/+RXOEm8NUjf+/A=;
 b=TcoxYuUJQ1bfr9vxj202x0M9M5DnmR1mknmhlWi/hJInhwxj6xPNSsy2KKw0EukqHT/tIq+f32t25EJmd8ht7Ry+NPRTKuZC+dkLDrhHMaI0P1bQbenE3HS+NkaelwNBUDo7U5aFWFQmJ4zuTHbYcWnyEAB2C7PrqCw2Obp2aOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 19 Dec 2023 21:47:12 +0800
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
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
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 01/11] linux-headers: Update to kernel headers to add
 venus capset
Message-ID: <ZYGe4GcFPt0k5PTM@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-2-ray.huang@amd.com>
 <6adff6d2-7c58-4c78-93a5-5a4594a60d27@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6adff6d2-7c58-4c78-93a5-5a4594a60d27@daynix.com>
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c1e39c-24e5-4b3f-74b9-08dc00990fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SgZuP7XyijEisodHE6/WXOtJGKsMicbbyh8+yzbelB5P0m2sax+TP+f/oKWDjZ6Eiu9we2pZYd3FZGp2YNv8nl+aJUe/uOd67dwK122Bz6upIhJiiffmte4ImZXRGyd7nwNV4yFDiCzNz07hQw16RKlwMuOASMVY3KqBbLs5UA9V8jv5Kj8pMBOinw2eSA0KcPeU3jQY8AEo8x1A2phwwhqNlqXABHwsxG57UK5jdSH3W79fPZTJcnjbFJSL0kntRMV1tcQJlbrfSyebZUN6IuOhCHIi8hR3PCU+JxC+AqRH62kL7BDWw1KyTi8FoqpsYmqqzJ+roxDkssgCAqJEZDYHHrsYlslORkpyj8W5Z/fWILU/O+UbvkX8ZfsfpJqUIa+kxjF+fp3ZDnIGfXM7C9eDWF/E7eiuOBza8PHhwsSLmjDnP8+jsOjddOUXEg03td6Nvqap44WG5Ken/Nh5Iy1mbwcVnMt8yFjTvoTS2fJxVP2Gs3LtNz2RI6YaQsWAmdR76ohX4orL/iS0ZC1Oh2q7ZgoJ5CZs4gh4QpdCINY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66556008)(83380400001)(2616005)(6916009)(54906003)(66476007)(316002)(478600001)(38100700002)(966005)(6486002)(26005)(66946007)(4326008)(8936002)(8676002)(6506007)(53546011)(6666004)(6512007)(7416002)(5660300002)(15650500001)(4744005)(2906002)(86362001)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YIBPlg5agvbhdMzPKay9nnA5BhmcTutkEadnJEv88GWTFAphN1o0EKYcIUDO?=
 =?us-ascii?Q?MKU7WlLWm2evSnjy/8liOj/CABCCylLIbevVNnP5SP3DtMtMGN4hnqNUC5Gw?=
 =?us-ascii?Q?FRDEPp7LsgI7vuYp930KN/ArCliZTHqOL6RLtYufPpdU7CqgF18QfIA/1MNy?=
 =?us-ascii?Q?MDkUOcIJc1UTYhUYNoxwfmHaPIuT0paFE6IvWGRfcRI7e4IC233N3qD6pPXu?=
 =?us-ascii?Q?eRDHGZYEWJ4vy7hY9egMQHcTi3O/maq2nfX5l27VPR0SkNJwnsGtpZg+tWiQ?=
 =?us-ascii?Q?m16B8TjCg9S3m1GmDf5dnfr3Z1pLZKxhbvrUEQSWfL3LhDEW71rCE3ZmJNVv?=
 =?us-ascii?Q?/huNzKS40SUtdqkYvortzz1ueJPj9uSkqvcAuFrLeWw9Ci/RD4mAQ3iwRkN3?=
 =?us-ascii?Q?pO3JIc/2Pqc5ysfTyJtD2h4K6oDSpmTLN0fh2+R4Ctw9KoVMVFCDel0+7xKp?=
 =?us-ascii?Q?ErFtRV+Eyi6+16KF614f8qTGBkU5ejBN673v9Y4niGBtVCpbQBQQfP19z9P9?=
 =?us-ascii?Q?Wey75c7VyfQkcnH7nzCEhv65zE81PbANF3oMO+jyDc41YRzlu595CGVH4NoR?=
 =?us-ascii?Q?w4tNItEZ0SzzHvm30jXTM2C1y6fyEKnx/h9G0Rf1m3lnXpIEAHP4TXZDh81A?=
 =?us-ascii?Q?ZRHWMULLJrDDTPGI2QYv6ILZyfuhxN63bdDkrgc0Up9gP2nNBLASOYq2huCl?=
 =?us-ascii?Q?RJ/2eUeyWy1zTlx5VqdJoeW42KU74ehlvofSKIO4qgBYuTnrG4a8d1aXXEGT?=
 =?us-ascii?Q?qJTSLRPq6371wtmh3j3QjB3RgJga+QKr5jLibulkKfROC4tyQbVY3XTQghDa?=
 =?us-ascii?Q?9KBhl1LlE93uSejmoFtBUUlAa/5HNsXwkNOUr2/M82HO7DJAVaF29AcBEsEB?=
 =?us-ascii?Q?cAAiha5ozssQtNWgKBGklHQRCJN6E97hULYfu2km4faT+JuMNl9iPlxFJbmk?=
 =?us-ascii?Q?7qnrsdwNAYGrPysnJbIZirQCcmuA+7klWzMcAWSPIwFHc5eKDyzDe5hgqkZf?=
 =?us-ascii?Q?EOrodiIRm50bO3R2WGQeIkKKRHj4eYJh+w1o5NPCSCJASn6K+NUb8/WfjDRP?=
 =?us-ascii?Q?sgw8yrm8ObHbBUB4fAsLg3Z/pt8srUkN7XiMkbMCU55NTOE/64k3C7j4nPwz?=
 =?us-ascii?Q?HZ/PTB94j2gOVdczdCd/h22zLFV3QMzp57mgyWkpkIMev+6hVKmszlOuun1Q?=
 =?us-ascii?Q?6cZn84ih4vlqTgawdQWi5BXAkXSaJc4rKd50hgpL2zSpWlBnINM2JCFRX/Gj?=
 =?us-ascii?Q?zqaiiaZ8u/OMP0rCGpMeiGLVe92Bp2xfwomELrpc/c4fcJqbtEuOFCgbAVVk?=
 =?us-ascii?Q?+CNIrQtsZ0UYZvNnMCHC+TI9kgFKjJO65ssZzEz81jmohFxzxUHc0EZfduHv?=
 =?us-ascii?Q?s80fk+ihXwHqfl6JtrIA+Sf60mk3JoxBjsR+f4sgbcVhuqqH7SLrrtJXoq9k?=
 =?us-ascii?Q?1j07IskCps4vySxRsV4BJHBqtPoNIbjYy2vRBniNXmydiBWWFbMoAkrxDqvg?=
 =?us-ascii?Q?qcs1uCUZ+0i3fBwyn0PoKEgiP8DgszfWdwUYv78vfAb4dCFRzfm5spphdpXe?=
 =?us-ascii?Q?d+C4YfJAfoRAQTrx/Yckx5IWhZiQCnGufgoPdMkw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c1e39c-24e5-4b3f-74b9-08dc00990fc1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 13:47:37.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNKWHTpzH+Kg7oGuW9VkLkNBxiWSNnBU/DcmrPZbQ9Yg0fQdtTAUkfyr9nY1JYOLCBU985iLJMIUYKgfNNpaOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286

On Tue, Dec 19, 2023 at 08:20:22PM +0800, Akihiko Odaki wrote:
> On 2023/12/19 16:53, Huang Rui wrote:
> > Sync up kernel headers to update venus macro till they are merged into
> > mainline.
> 
> Thanks for sorting things out with the kernel and spec.
> 
> > 
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > Changes in v6:
> > - Venus capset is applied in kernel, so update it in qemu for future use.
> > 
> > https://lore.kernel.org/lkml/b79dcf75-c9e8-490e-644f-3b97d95f7397@collabora.com/
> > https://cgit.freedesktop.org/drm-misc/commit/?id=216d86b9a430f3280e5b631c51e6fd1a7774cfa0
> Please include the link to the upstream commit in the commit message.

So far, it's in drm maintainers' branch not in kernel mainline yet. Do I
need to wait it to be merged into kernel mainline?

Thanks,
Ray

