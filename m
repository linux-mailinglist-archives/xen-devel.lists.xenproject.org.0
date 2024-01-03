Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D138229BA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 09:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660920.1030611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKwwE-0004i7-8a; Wed, 03 Jan 2024 08:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660920.1030611; Wed, 03 Jan 2024 08:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKwwE-0004gI-5k; Wed, 03 Jan 2024 08:49:22 +0000
Received: by outflank-mailman (input) for mailman id 660920;
 Wed, 03 Jan 2024 08:49:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=08Ob=IN=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rKwwD-0004gA-28
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 08:49:21 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb109e15-aa14-11ee-98ef-6d05b1d4d9a1;
 Wed, 03 Jan 2024 09:49:19 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 08:49:13 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845%5]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 08:49:13 +0000
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
X-Inumbo-ID: fb109e15-aa14-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5pWTeRjfLlrr5CuzPG8UtFL2Vyap2570rOYsyFhptFAQ2wPbFpyV3d0/XNNjXS8BB1GF6moaMM7C+72j+5Dj4K91Vm0QNRqxqPUadwRgzxJROc7AeAWvzIje1Z0OhEwk4mSLgkAfxgPL0KSqT/b2UfJlEpWsgmlUsuUmwcvTfSuPeQNuXGIhpUL/i6J83ZEDQFyW5tFgCHYlfWW1rOOFtpFBfRPLpC60TG74ydSwudMoObO51Rr6ylGgvwuXeKpM6i1jdWdKf3IqMbZcMUnfeXaDnT4buzCTY3jieEyBivFD/l1gPi5QYJISKTQjuyOXKopub7g31zWMPO+1F09WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn2ThuHqlgJOFeiBw7gJaeZ7iDX0yPVeR+GYzaTbJ/Y=;
 b=Ufv8P9IaJSoLapmU7cIL4hceE9EYW+nCGYg+j+Pq5MKpymIU9tb7vJ9FhAxXS+QWp1c10PYJn16k6mmm9eAFUFS+sLRNH4qHekVbn6tbAe7MmtQiyRqYjUV6UUokQF8gorkzvatO4fxqkKGL5JzgjngL9ACre71wSZGlZW+KRHfQT6eOkltKeL7+BFjkvicMvxa3+SpH3oAymVdwHFZvf4QpBezC3ZkLAis4vaPjicMWIOrYrDEw7q7qNcu+Au839YrN4Ohcef/ZeDtNpa3c4ocH1bDPKUuDzLXIEa5eOBgTHgDWYDQPeG+I5FnRuhiXCk5KUmzBMY1EpUb9WdnfrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn2ThuHqlgJOFeiBw7gJaeZ7iDX0yPVeR+GYzaTbJ/Y=;
 b=1yFZ0TBV22aYkfr0LVJiantkOG32lrTJFQqfMmrZUQckHP11VeiV6gnb7UHyM/DaRwm/sB6cdNcf0Ps46pG8GSgjjD9yMrTwafvilQxIT9aWsM6bQt4n19S1bgpkJSglIiDRr8uLqJkzK4ZizDGZzDZyOcJAq/dZ8lECfF9b9z4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 3 Jan 2024 16:48:47 +0800
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
Subject: Re: [PATCH v6 05/11] virtio-gpu: Introduce virgl_gpu_resource
 structure
Message-ID: <ZZUfb/t652zPyey1@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-6-ray.huang@amd.com>
 <3105531c-bfc4-4421-a197-4ab8ddb9f4a5@daynix.com>
 <ZYGaWs6OmZpaMH46@amd.com>
 <c5d9e074-de7c-4056-becc-8fd1ce24f3e4@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5d9e074-de7c-4056-becc-8fd1ce24f3e4@daynix.com>
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: f9697f18-64d5-4108-dbc7-08dc0c38dc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EmZPKhZRx20f8LeMx89snZsM+11EvKu5JDiZvmhBm8WaLnUqC/pM03GQe/Vrzhogq/+UrNI3mJh11fh9u2n6owJEIaq6XTAUDXzvOmqMieYif1/usPL5UEL3L3pQHHhrJGI7VjMrsBqKNgyJrzPu7Ra1iv0WW75T6rZOXnz0rkpq8mMk63bKBSPG6tPW+q6Kde0b+jl9jn6efAdFWFcoVNgflqvh/5ZveINtsLHxHLudyaNbNXllOJzxvufJEOo6KE96pq5uT0DWxm9ndwLPR0qtqXyrKQjtXiz7ng9E6YBMAa5XVIQk5Q1DtAa0fa2XLUPYGtkixzW7C9fisdHwkl5UMs3IWzAAtDDaG4pGlP/gq7F+hwx48hDQDXJDJ0owrmC6dh5GCKjd54gygXZqX+32cxMD+kCo5Jad9Ne1O78CqCpznSf3WF3SIUlEQQzHEZ/ueuloP7yIZAFUSQ3y6wARhLV8PzJFvyKKmz9hSeRXCrjrVODTdF52mz8vfRJmUVPr5xIgMIpFuRRxITliS0qQ7mLekKdCtaBCh+LUFxnzks76xBOM50vhoa8YYgc7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(26005)(2616005)(66556008)(38100700002)(66946007)(83380400001)(36756003)(66476007)(316002)(6916009)(54906003)(478600001)(86362001)(6486002)(5660300002)(2906002)(7416002)(4744005)(8676002)(8936002)(4326008)(6506007)(6666004)(6512007)(53546011)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eaSb+Ra/g5P5CKDAMlC+olAj3AUfEFj2d9aUiMopJ+zVEF9f+fWNZOGoMFWa?=
 =?us-ascii?Q?xlSia15fJZjfpiBLywZLCK8dwKjoekn1xnKWnn7gmzi9tgjt10CKfirlPoX6?=
 =?us-ascii?Q?n/KpFZ4zPN90ywxuzMxvkP65hp5K4VAkhSmY9B+kVTPcpI44a+IDbOFXBbaE?=
 =?us-ascii?Q?zHKRTzSmrSgFKDlPrrB8rZRSj6sJIdMb1068wP+3h0TQBZVbVRnXgBQAS/Bd?=
 =?us-ascii?Q?X2UMT7Ac5NKA4buuqd3A8muTrk1wPF7fzLbKQrPEcVhIMJZjyO5YMJ6JD+63?=
 =?us-ascii?Q?tpdnEvjMf9bxvgBP6SZ35Y8khZECZ4ZVlLc/crFMcMyZQxDExyyNH/NVIsUb?=
 =?us-ascii?Q?DS6CNCO62vyIMf0SFaXn8RHfvhcmFYVnKvuy1sTiK1IHMWp9ojf+XvRI9mjq?=
 =?us-ascii?Q?ygmuuw7RHH4+gjrb3CwtKXSOPGg/xA1cWSHdTiInO2rxwNVlkkjZX0OJB2mH?=
 =?us-ascii?Q?UvSiE2XOVuJa4x9uw0oUTQz0gA76MDtQhePENx08roNSim+6t9z6hp6p3KS4?=
 =?us-ascii?Q?Eav1KzUR06YbF62/J6vA/yc2zDtDaFaxAq6tSO5fdccmljhdy0FDeDeDqz8F?=
 =?us-ascii?Q?HxRWeMm/sRNgOmDUqCPwxp69pJmvK6moCqZ9r7HlTBd32nfgp2nk7459izvS?=
 =?us-ascii?Q?Ypl3V9uh/507n9IZR4UojE4LydaLachE12gJCPa/z5l6tUlCP91ud4d+J66y?=
 =?us-ascii?Q?124qiAQx9rEYic+9FheoU/P3VsmL+CIBvXIhOikbBBtAzy1SsU1sEb0LwLOm?=
 =?us-ascii?Q?RSksYQlh0vvpjjoVTOQ8Opb0XwM4xu2hOHi9vWgGq6HZjq0a6kRjoSUbcMbB?=
 =?us-ascii?Q?qkCeljywFWrTxousrPkvmZEDQheRxPMXBjlR/9nkSRv9A5WbzSXzFbrdN/cn?=
 =?us-ascii?Q?ELOJHWN+4JyH1E4/BYdLv9/ZAQSvYHCd5m2XnMz1X7qQ+pbk1TBNg+hddmsQ?=
 =?us-ascii?Q?Ny13jSC57/yFYuohIDmeSziPmSVT/zRqkOAbIIhTZh5DhpLsCmLMeJuvz/na?=
 =?us-ascii?Q?NyeGHR67WeDGr1wEiifFfF7xqDghXgbAcuebKO6YL76ch+wn/beHoycUw2Ns?=
 =?us-ascii?Q?Az7rlJ+gSQCN8YCWvF2Va8cYeJGm02q2rGceI1UnGPGi06srAqJ6pAPlgPTb?=
 =?us-ascii?Q?SDP0DpipKPoCR97DZSv+S0aGtS//4kzw7MIJ95oOGmUPemU93TCraWnY+HsQ?=
 =?us-ascii?Q?Ihd4R77xfmsUZzTGXowZSsdtaJrjSFFVZ6o4iG0+52HWENjoAx7xtrhcoTEg?=
 =?us-ascii?Q?eitugK0ZPdCCfsp1TLvCmH4VEUlNVjBlGf9CS3QLCMzZYyb9FdCyvhjXqbPg?=
 =?us-ascii?Q?Mwsgi7abF3+iHXMlsGKg7lMWn6wf++v0B1217E0xtrl0Gqc2QkcIS7UPCXIf?=
 =?us-ascii?Q?m3O6FEBHShkJUypMNJSAyOL7PPEquxYiMvYVRB+Qap3MdchbAqc6+n1t3sCl?=
 =?us-ascii?Q?4YTzgArHy6L2arCZfxsuATp1341znkThmWDveEt1waPVDjzuywRJT9NCdVXc?=
 =?us-ascii?Q?XL8vKiiejK36gKhSeXnYMuIG47cI3YObLCFa1FFZQGJWucNx9C8eUDIt222F?=
 =?us-ascii?Q?lQwrcBdjPxe3HwV8llfSIxTMW9YxBIVT+LTmRNGd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9697f18-64d5-4108-dbc7-08dc0c38dc2f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 08:49:13.3674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULg6QtEhJzV22SoWiZdi2FBKS2hQ8n/X+zp494tHpNGqop8XGUQa7ErOytitf4Q+BxTmq84HFvA1JL8AaV5NDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748

On Thu, Dec 21, 2023 at 01:43:37PM +0800, Akihiko Odaki wrote:
> On 2023/12/19 22:27, Huang Rui wrote:
> > On Tue, Dec 19, 2023 at 08:35:27PM +0800, Akihiko Odaki wrote:
> >> On 2023/12/19 16:53, Huang Rui wrote:
> >>> Introduce a new virgl_gpu_resource data structure and helper functions
> >>> for virgl. It's used to add new member which is specific for virgl in
> >>> following patches of blob memory support.
> >>
> >> The name is ambigious. It should tell that it's specific for virgl.
> > 
> > How about "virgl_resource" which inherits virtio_gpu_simple_resource? But
> > this name is exactly same with the name in virglrenderer.
> 
> You can prefix it with virtio_gpu_virgl as virtio_gpu_virgl_init() and 
> other functions do.
> 

Thanks, will update it in V7.

Ray

