Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB0822825
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 06:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660893.1030572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKuH9-0003G1-8f; Wed, 03 Jan 2024 05:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660893.1030572; Wed, 03 Jan 2024 05:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKuH9-0003Dg-5R; Wed, 03 Jan 2024 05:58:47 +0000
Received: by outflank-mailman (input) for mailman id 660893;
 Wed, 03 Jan 2024 05:58:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=08Ob=IN=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rKuH7-0003DY-UM
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 05:58:46 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b26b3e-a9fd-11ee-9b0f-b553b5be7939;
 Wed, 03 Jan 2024 06:58:43 +0100 (CET)
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by SA1PR12MB8985.namprd12.prod.outlook.com (2603:10b6:806:377::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 05:58:36 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::9b8e:816d:20b9:9845%5]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 05:58:35 +0000
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
X-Inumbo-ID: 25b26b3e-a9fd-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWkwc2bkoSvvQln1Gu2zjFUHISCpFmAhPuFfN1zygBK7ZYWwm0uuZpCGkINDDygrQqMvl8cIB3IGt2wEFta6hoXG/r2xyp5FAhqWLFoTAjDAPMJvJtEZnihC3sg7C5hKo3wHosUJ6PsmEiIvH/PaVuUr+DHD3fXI/9Dw0JhlXycP9xl/jELa5PNmHYba+tNVWHA6Dl3QTPwFN5jYTyr506/4aRKmFAsC+uBs2h2WN0VqcOJh9RPtc7snyJtyI7bnf0+nALIUE+tOCXit5Es5EaoWgyxpIm6z4Di9LK5hRMa4NxAJZvTWo5fcMH+96xbQVshiFKGYaIUWGLZlhqrrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1jaHvZHUzXcrhv92fjJ0baTkP8/HSKem5AfXymKesA=;
 b=TUGq9agQZNvJetWNsZl0y7sga6Kx46qNC95sJt6iNSVr3Zp+sCXrfLni4bud8eB4cEZkBVQnN/I/biDYzJONfsUOdvF4VM2/Ix5VZs/jy8H6se18xXNldpFI1hUaHAsBtoxOzM0EIBnf+1/fJNImXbJ0QOYkCWXYvBlRGFdEDnzHyy1ecRSkz33fi33bi3spH/zQzR/Fi5WoiCybnrVcaojW4uEFN77XJ+KZ86vPzFNlw9wF59z9dn07BHdrme5thDDuZ3W0BRdNsDhey1Nmx3Val4kqDLJAtBwIcNe+D9FPP6IVjUi6CYOpsqsdnIJMF1P6Zodi6zdHX4Mlns0oGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1jaHvZHUzXcrhv92fjJ0baTkP8/HSKem5AfXymKesA=;
 b=TADxnQ0GmJ76D2TRBLyYnUP9dtE1m9j+Uwa67bXlGEyNkDe8sqHosdYKEykA9QiWQ+TtRc8SgCRPAxcX1D1Y+DnuJn2oLxScuusn1gfpnik+UfljMTSDc4/xYpssGzmJJuJ+0BJm/VqkcsZivPzizHMzOdkQOX+PD35U1kYonH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 3 Jan 2024 13:58:09 +0800
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
Message-ID: <ZZT3cSw3dKai90LV@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-2-ray.huang@amd.com>
 <6adff6d2-7c58-4c78-93a5-5a4594a60d27@daynix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6adff6d2-7c58-4c78-93a5-5a4594a60d27@daynix.com>
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|SA1PR12MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: 1365a7eb-6b86-4009-248f-08dc0c210624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nQGuTkc3yY37QjaxTd55dW+n7VJqQ3MNdGOYIpzamNs4x7fWsKlqq/8mbuo7IjlPyCdNaJ7cPaz6qYi6gZXg9tuURTIp0fAsa31rqqDCbR4s54uzg0t/ugls1vdRrnr5KvUZZQFsDE0OrorG0oqp5mjRiSZVcaqhzBBQTQ7nS84Ha+pEu9Vmbja3iDbFLekDBd7uqeDSr89yTJQxLjds/vF2u99ZHPLi/n/fi9oMsdzGzceQw5TFVleNI8cP10CfmklEgLGiHI0SIZo6i5fnoZA0Tz1uCDS8tBpQ5nq4r61XvOdQjnf1YvlVSMdGRk8Z+lRyKGh3ocT/hd9jgRUr/puyTEAPlTVMRqcDQgUPoH2Nsj1gfw7Qb5pA7gBbqaQuOJatQjsrUFjIf47WUEtZlgijv8VAAZmn/OLuexunzHpipZqiW9Psi1bTVbU8jdVPCjK9AWKfZ8RoG7LhjH+NLzAjpJlmzJUcDi0aZ+/wpYUyz7z5nzcnJX0jlL8vSeHdpGnuIu8uIIgHzG17aS0oSafExt+H2++zO4KVaA4z7/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(4744005)(2616005)(38100700002)(54906003)(8936002)(8676002)(5660300002)(316002)(2906002)(4326008)(41300700001)(6666004)(7416002)(6916009)(966005)(83380400001)(15650500001)(6486002)(66946007)(6512007)(478600001)(66556008)(6506007)(86362001)(53546011)(66476007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VxCOgNodG/ELCQUEB25feEZpmWLvedF8xTfhcmxTFfUvxAkSUijjXwnWR0kh?=
 =?us-ascii?Q?Kedt2mYAt/9KPZEcLQDCeidvqjAesbKopD/oX7nn/fkUHIcgdbgEf7XDYnXZ?=
 =?us-ascii?Q?v4jxjnZxKQ+GV+wBV3meEZXstVI5aK2EKWam26AifuBC/jp24xVdoOUtFXai?=
 =?us-ascii?Q?lF0w8OxMU58SlT3m+zX0mkFVV/CvcH+aJ8dFlcqBAru3MrQpBjFuPlPul7W1?=
 =?us-ascii?Q?6XoLiju8MDT0bEDe1j/GWCsF7PWA63cUqxDY2wL/3kKJdEBat9wJTVofyf22?=
 =?us-ascii?Q?Y2UrCVNLuUOUsswwkNdMeE4OIypE7m1ka+qe1pPhPwaj6yv9pNjdiPztQACx?=
 =?us-ascii?Q?qzjELcAQdXhGE9u+7AP1g6yOp0j4H5hvOxjYvSBNkSdWPg84XZ71pouoOHUP?=
 =?us-ascii?Q?GujPvj7d2zQcs3wxSMI57oQtPqeYI6908KYByH2OG7nYPruCpnodldso5QJR?=
 =?us-ascii?Q?JUzlYZF7Da1YSbNqChyIBH52BOO337qGNKKLBXBVHTUlh3yAgFAOY2NqbILj?=
 =?us-ascii?Q?4E8ffmnYGHQpkGKpJZ484XI32tUDBo64lLgJGqrFsJEJfHOlO1LNIBfVR24F?=
 =?us-ascii?Q?yzR9jMQjDqmHZti1ezt3V7DllnWfJ3rNDh3t9nJFl2oOGsFs+QKa7b870Qqn?=
 =?us-ascii?Q?NG9dN9XlNmHR3Qs6TysIYUdlqIqImVK79PxOOV+Dddv1Ppi93rQroWZGE94X?=
 =?us-ascii?Q?8JJWvc8CPNj95mtUiUtK2IX0+GLXW300lKzQUfioR+XBaENzbj7tyFsjWDiT?=
 =?us-ascii?Q?3xGWYo0LxUw8Lj4DHQOsas0SLfRTxlVQnLvwMpu6IzCVnaC19d6yeLzy0Oou?=
 =?us-ascii?Q?c/PtpG1KeGRJEbyt9vimJiY2i8dzBi4EskakRHMnrefy0aHn5lj6MF18YSHk?=
 =?us-ascii?Q?CMQMWNEPIPYL75CVmtP/k9N9oOAMIjmYJQm2Td9UnO+GPUNKOJEdpe/Xac7p?=
 =?us-ascii?Q?sGGs4MzM040ADRkkip13NYf2uIJSJZVXgSPVbrMGrMxihrqGoPUvAS3RAkb3?=
 =?us-ascii?Q?deSQIK3IgVXopkulIxKMCm4fa0la4WZN8NOSmK/+yXK+nBNlDMlA3lcD4bmp?=
 =?us-ascii?Q?uNSE8ln24Bb9lWdoFDIYR+UPlp/X9V37aOgIaJS92Bo5VqK5HuE+0xDDWzUO?=
 =?us-ascii?Q?2S3HQHsQxVJOPczv8sTYQfBd36Exl+SgVfj+YHjCAiPrHw0gXYMGsqLE/E7Y?=
 =?us-ascii?Q?J6SSdIA4GBOIllsYv5ZyDMG13oSQ1NR0dl7o/AjrbWh2smHgBNlldnQ7C0eK?=
 =?us-ascii?Q?JBbajGCU4dfWD+D+8TrwtjB7GM2ARJ3HzruR6YHpCQnkOPSM9pAa8twGTu7I?=
 =?us-ascii?Q?MxY/uWalg1bapDM4+yAIoSfYQ9AzKCAIu0hU9rng2CKR84kaMOYhf1kcH2jE?=
 =?us-ascii?Q?vdMYRrwGqwfLbCqEMLMOY5lL9uElpI5j9GpEuDAzUwJXNd2stOgCbtf9GOOf?=
 =?us-ascii?Q?SwGhH1g5NGL1ckE+cJr/K2/iG6E68uj7nYJtNXRKPNu+y76hF54y5It/Q1O9?=
 =?us-ascii?Q?AFekXhx5nTJEJffdfk6AN3nll4ZsJQToTIldVlLvmDIJfxJlQ6+7Y/Y2Okih?=
 =?us-ascii?Q?Drn7tlFSnq+oACZbH4yrv/2kiiKk0j+fXHmJdNEp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1365a7eb-6b86-4009-248f-08dc0c210624
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 05:58:35.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4ugCWreKYj5v/BwtnxU5We6BBHdHAgI/m6kaasXHBCSUdONHxv8QL5Z1vHnGDvkf+zL4pvWNMSE0/dQk9xrNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8985

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

OK, I will add this info in qemu commit message.

Thanks,
Ray

