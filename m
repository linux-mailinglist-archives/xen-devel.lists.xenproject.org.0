Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE39FC4C1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Dec 2024 11:24:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863178.1274629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQOY0-0008QD-5E; Wed, 25 Dec 2024 10:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863178.1274629; Wed, 25 Dec 2024 10:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQOXz-0008Ob-Tx; Wed, 25 Dec 2024 10:23:23 +0000
Received: by outflank-mailman (input) for mailman id 863178;
 Wed, 25 Dec 2024 10:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f9zV=TS=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1tQOXy-0008OV-Jj
 for xen-devel@lists.xenproject.org; Wed, 25 Dec 2024 10:23:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41ea8786-c2aa-11ef-99a3-01e77a169b0f;
 Wed, 25 Dec 2024 11:23:18 +0100 (CET)
Received: from IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 by CH3PR12MB9027.namprd12.prod.outlook.com (2603:10b6:610:120::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 10:23:11 +0000
Received: from IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b]) by IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b%7]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 10:23:11 +0000
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
X-Inumbo-ID: 41ea8786-c2aa-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNw0ZdfBfNrssALkF9ip1krADmwOOPT/zhihKBc++Djo9G2mpVXyjY4QGWLvO6nm/3oTIrrDRAqxcLBq/vVGUKnvAG4VuZ3vb5EJ3lmX3Tp+2NHsGibDDBcp1Ix+1lfzoyEGNfpEEtQso29WTpK83u1g+k235JP3uofI2J2NGq/O9uljdRHIza0am+X0adzPojcNrBjeUXaX2bdumGtL4G5GMpSNtai6+TUYo8jxhvs+N+itLwKnIH+zeL7U6OMwr94H0SbGLbEURssya7Aw7/lWi8B+FYeo4H02RUUELNQuIqQf5AnvHOh6bZ9wBiwDruUZMkfK5yDcsTl2OQG5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXwxYgXhUXyibklzXUKFJjyQ15Y8tgPzIfP7eQWflyo=;
 b=XHYUkp9juUIvqNYMobcdOWg4SW87RFXQTnGMr++dqaT/Lc8BvVZS2kX8AkMWDgfo1WPYAPO6+WTJ57sJj4p918H5x/tgxlnJ/mhH6toK9V3UMAIDoI78LYyGVKPM5qVhlZ+50ojhvZiM+MVu7C276oR0kntowj2y0FwP9qCiMvI7ven3PZrKzuKe/Toa5QA3MxmORrYu+bBnkrVZ3xiQ0BnpPEwRBHHBrytSB7537pHVOwFTuYr6fbGaEtUOyMPhnt49RH/DH2YmDWg8VUpmdYd15h2Haz/xpmelhXss1FPF8OYJvoSEtQy4rwcl5/IM2uHfpXq0rHKZ6/rJ77upSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXwxYgXhUXyibklzXUKFJjyQ15Y8tgPzIfP7eQWflyo=;
 b=ox/+86VhNtrAs6YdZ6ECXHj9azlTS2GYeeS0DcCzBwj1C1TkLhpLWB3EK0Fv4AtXd+W4erxjn5rb0cWQSTLjXTdUY1yBWXz9wE9CzVzYOtX1MmRCkzpQjI9YYypCyk3wj6B5I6Ojy4fusJFL98u1CPPrkcTZn9TKWL401Pcuqvc=
From: "Zhang, Julia" <Julia.Zhang@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Zhang, Julia" <Julia.Zhang@amd.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
	<Christian.Koenig@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Penny,
 Zheng" <penny.zheng@amd.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>, Paul
 Durrant <paul@xen.org>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Juergen Gross <jgross@suse.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: add privcmd ioctl to get p2pdma_distance
Thread-Topic: [PATCH] xen: add privcmd ioctl to get p2pdma_distance
Thread-Index:
 AQHbSJdDNMdfRsD4vkSvz8Ngpfn4L7LdjBaAgAuOxQD//4svAIAB3fOA//+tJwCADTGaAA==
Date: Wed, 25 Dec 2024 10:23:11 +0000
Message-ID:
 <IA1PR12MB6532C530BC01CA16DA6E53E6F20C2@IA1PR12MB6532.namprd12.prod.outlook.com>
References: <20241207105946.542491-1-julia.zhang@amd.com>
 <03504a1e-c801-47fc-ac66-ab7e10ab6695@suse.com>
 <IA1PR12MB6532F32D012A63000F34823AF23B2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <0284d807-ae85-4d43-93b5-91fb29528d62@suse.com>
 <IA1PR12MB65325D9E7C0FA79B1928A646F2042@IA1PR12MB6532.namprd12.prod.outlook.com>
 <837391e6-5ffd-4f4a-9bc4-c4431b5b25a2@suse.com>
In-Reply-To: <837391e6-5ffd-4f4a-9bc4-c4431b5b25a2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB6532.namprd12.prod.outlook.com
 (15.20.8272.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6532:EE_|CH3PR12MB9027:EE_
x-ms-office365-filtering-correlation-id: 52293a54-58ef-4929-65b9-08dd24ce225b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1d0Q21peEljTy9SbFNTMHc5RFNPRm8ycngvbGprT1dLejFIUkthcjdlL080?=
 =?utf-8?B?UTdvZVl0NUFtWDNKL05zY0doa1MwaWM4cFZvM1ZQd0QwVEp5SVVZVEk4bkt6?=
 =?utf-8?B?V1MwL2NqNHBhRTJZMmZ2T1NXL1ZzNnhrL01Mc1BZVVdhaWJtYW4xTG5naFZl?=
 =?utf-8?B?V0lWNzB4aXlpSlMrYlpVaVhNOG0vUTkzSkxJeW03V0IwaXRSR1JwbkkvaVdY?=
 =?utf-8?B?bXhTL0orSVlTK0RQTS9Vc0Z2UVZDZDFUY0xKckNwc2I2ejM1OE1xRTFyMGhk?=
 =?utf-8?B?V21TbVJRWWlqdFJRTHdjbHpVUU5UR285QzhSaWUvSVd1UHd2M2hNZy9LWUVL?=
 =?utf-8?B?bStpWGxweGJGLzA2Q0lxclhtQlhEd2ZWa0N3aE5tb2djbjZFd3B3dFBrczJV?=
 =?utf-8?B?eDdza1BVMzl0ZVo0ekl5ZWtZOFlaYjNwY2ljd24yR0JuTVJ0QW9EUnl5OW5U?=
 =?utf-8?B?dzMxbllCeFZVOUZ5SEhCMVZlenkyUHFmRFFDT2pFbHMxRmpIbXJReGt2MElM?=
 =?utf-8?B?RTBnMVRLS3c3QkhsTjN2WlRqRnEyRzlSaHFVRG9KWXBmMkFoeS9wTkZMaktF?=
 =?utf-8?B?WjQrQ2lBWTRRUkhKWjlqVTQ3Y0krckhFSUJNaG0zWEJYTzZzL3RpL1RHUGZ3?=
 =?utf-8?B?alZrTGZEcWlUNUs5aWFmRFNxR2lYcWJnbkJOb3Raem9lNUd3di9VTTJGeVZE?=
 =?utf-8?B?VkdRMGxQNi9DNkJYVThzMjJuVVBiK0lqc1I1ckNxTDlBYUp5clJyTDI0L21t?=
 =?utf-8?B?SHB0Y2gzMzh0SEZxbXNDUjVRK1hQdTdKTUZoN1hzSVozTE5tdVdlU0owWFdU?=
 =?utf-8?B?Q2hQRzNrVXk1dCtMSGs4VmxPbkFzdVd3Z3B3YmgxSUdPV3lTY1E4WUhlNlVr?=
 =?utf-8?B?SmdsQ0dUa3Y2VmpsOXpndlBIR0NucDdlcUJ2d3ljeW44VEVMSlk0eDY4QjNP?=
 =?utf-8?B?UnIwUEczLy9aSmRLeUFCSGIyeTk5N3NlcWc2WW1BNG8ydHJrclowK25RTllq?=
 =?utf-8?B?Q3ltbEwvT3cwTk9sZ2VKUWt0T253QXR1TUpodUlrK2FEQkZldW5VTmVHdnBX?=
 =?utf-8?B?WXptMGhYSG44RlR3VFU4QjB6ekZOT1VRV1ZVM3R1UWNJdi9CejcvSFZOVnpZ?=
 =?utf-8?B?N21VS0w0bElGUkFOVlpqc0lWRlY0cEh1Z3IvMWFSU1hqYlFYS1NCRU9oOTd5?=
 =?utf-8?B?Y1YrNGxmNlV1d2lFR2JKcFFiNHM3V3l0QUlrb0owcytBQzlISEJHcXU2VmhW?=
 =?utf-8?B?eHcvdW8xR25LT2NEOWI4em1IbVNzYVQwTWlMd1RjUzE3SytDVm45MlN4V0tv?=
 =?utf-8?B?ZGRNbkpjRzBFZERaTitGWlQyWkc0bHNGQzNIbFFoUjN4RmhWWngyWGkxUVJk?=
 =?utf-8?B?Q3MvRE1CcnZZcFovUXYrbE1BemExVWFST0JrdXBQMThXL0JZc1h4N2ZoazBz?=
 =?utf-8?B?cVp2UURrKzFUYzZ1SE9Bd0hQRjRKNjJCc3duK0RZci80YldZbnlwcGp0SXFu?=
 =?utf-8?B?c2JTY1lMWUVLZStyN2JxNnRyUkZIWTJoaTNKVVVqK0diV1NGQ1lWY3hRRUhC?=
 =?utf-8?B?UDIzY3ZGd1JzRWQzQXlMcUZFcWNFSzJwUHRlSE94Y2JOQkhsMUMzUldKTjh0?=
 =?utf-8?B?Mm0weit1NTU4UEpiMGZNY2s5ZW1JeUJhS2RicVJqSkt2bmRoK3ZQK2hHZDM5?=
 =?utf-8?B?bGN1VDhKbDJWZWpOYUxYRmxKU0lHZGFINzVkSGxZNzFBbCtRM1BMZkllZ0ow?=
 =?utf-8?B?d1N3TEl2WmxydlR6LzRja1JyVERueUNZalE1R0JNc3c3SlBJS051K3VoWUJq?=
 =?utf-8?B?YmswMUVBcnZJcWxzVWlHNXo2UElvaEdwdGdKWGhJWEl3blJxZGQwQnlnU2ts?=
 =?utf-8?B?d0VERGkyTm5nV1F1L29zS1BDcFBoVlhXTWJvNForckVIbjhuaDVXUXlYNTAx?=
 =?utf-8?Q?fgaEUAenMcDqBDZhbkDdJUUhVvG1fPXe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6532.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1VwSUt1WmZONzlsZmZBY2pSWCtsbzE4dVhGZnJCbXFJSFpQcFhZU3o1amYy?=
 =?utf-8?B?a3hlQ1QrckdPbTZ6NW5QbkloejBSbytpZ3FrVXB5U1hnbTRUS2tQNjVKR1V5?=
 =?utf-8?B?QXFvTHptOUZVNDFWZW8xNEUrWEh4a1UrM2RBa1dXZ2hqam0rSFJDZEVFNWNE?=
 =?utf-8?B?TE9rdTIxNm1VVXZ1eCtFbGdkdzFva0Y2L0dWcmY0cnRTaEVXU0V6bVRtaEdI?=
 =?utf-8?B?ZXdHQzUrVnlKVHE4SnF6WTZISnV4ejBvd1JKU2JoRGhaTjRXelhud1JsOERo?=
 =?utf-8?B?SXY1ZEhrempnSjNSTG8zNDJkWTdJOHV5eE4rZzhmcFQvNTlmK1llT05LK1Uw?=
 =?utf-8?B?Q2NCVUFJdGM0bTI3Ty9oazJZSlYrM1NGQTcvTUpxQW00WjJCeWJHcGoxaHJu?=
 =?utf-8?B?cTdtUm9JRzhrYlFOdlpzd216eGpjMFZROEpqUXcyK1MxYlNUOUxIYjRuMGZC?=
 =?utf-8?B?R1NWV24rRFl4ZDV4UGJvc24ydzZmS1pHa0NQbE83Vzd2eXhRend4dE1IMjY2?=
 =?utf-8?B?a1RMa0xGZXJudzZHQkk3dEpYWU1iQkdRcFlLMmozaC9ZdUVNSFR6K2hiQVR6?=
 =?utf-8?B?Zng0U3lURHdhVXgyVU5hcUIva09tdWRjRFB4cHdwaHcrd05DdkI1VGJGRFVG?=
 =?utf-8?B?WTh5QS85enIzSXMvWTI4V3JMOFhZMGcvQjVpVVFqYUF6WnB5K3c4bmNnbnJa?=
 =?utf-8?B?UWNvWXp6RkovSDFQM1pjcktLVTYrRHRlaW5CT0c2NEY3MW1zb2xqMmVlQ0xI?=
 =?utf-8?B?NmZSODFITTVybFlCZFd5cTY4aDYvK005SmNOOXdNakdxZ1BBMHkzc0w0Ym1s?=
 =?utf-8?B?dkttLzhWQVpsQ1pxU0EvV21SSHI2MFpSQVRhTkZ6UEdEbVI2empRYXJuQWZB?=
 =?utf-8?B?Z21oaEw4Uk9aZktGa2w2WVloOEV4bTM5aGFVVXI2MFFmQU03dWZNdWVvaEti?=
 =?utf-8?B?TCt6VWdNR1ZUR2s0eGRQQ3VPSTFuU2U0T2V2YmFleGxUSkhWRmEvcEZYSHBG?=
 =?utf-8?B?YXFZY2lzZlBSVnhBVUgzV096aU1SK1pBdE1sdkJxV09vTXdwbG5KNmZ6b3hX?=
 =?utf-8?B?cnovMzUzOHQzRTVqNHhEQXZkUXNKUzF6MnJicUQwR3BOaWc1ZFA5Uy9SMDIw?=
 =?utf-8?B?b0lKaHRycUtwRHV6NGN6K2lpaTYyMGNpT2VNR1hGZmE2Uk1rcVdvU2V2cVdK?=
 =?utf-8?B?OE1RSlFHM09WUjNnMi9CcXVTbjVKYm9EakVoNW9kRlVuK3FydkNZZk9HWnZ2?=
 =?utf-8?B?alIwWjNFUHd3M3doRzgwVXBCSXRsK1pMYlpaRDdMbVlPUmE5a1J6bTU2cmQx?=
 =?utf-8?B?K09wVzcwZ3M5ZFlRVzYzaWYwelJ2Wm12K3UzS2d6SXlyeGNZdU5paktSdTFn?=
 =?utf-8?B?RkdwbW1NTXA0SkJhM3JLT2xwYVdtL3VqV3RCUlgzODV6NG9iYjJaSHRhd0JB?=
 =?utf-8?B?T0xVMGlWakpvYm10SXV4K095enJoOTd0eW9xdDFzNVVQNzJqQVY2cUduTlpP?=
 =?utf-8?B?bzF6Wm0yUUc0aEErVWZlcHo0MjdsZ1luaVduR3NSaWZaQzMwTjF0K2xDZ3E2?=
 =?utf-8?B?UFh5VVFwcjhMZ2pBeWFUd2xyR2EvVVczSWk0SmVHZElkSm9CR1hUOVQrcVIx?=
 =?utf-8?B?NzNkcEtiS1AzWTgzd2RJeTZpNTMxWWp3SktXZzRkY0VpRWM3RlB2UGg5WWZL?=
 =?utf-8?B?L3JKZjB1YXJzZ2NiYTJscEJnUmVldWFVT2dSZkQwelNyMFg2S1JKNEpBVHZM?=
 =?utf-8?B?M21TWEJ5dFFaNjFiaEppd2s2cTZPazQvNlI5WldSNzJUcFVTcXRDQjg2cnJ4?=
 =?utf-8?B?WDFIdkNmQTFBbkFpSGxYa0MzWFNENjNlc1dMQVNSL2ZDSmJqQ1JVL1VJMXh6?=
 =?utf-8?B?RnNTdElrajVkOHM0QVhMaUhZdjBBWWoxenY5L21jUUU2YVh0RXdrTEFtMmJI?=
 =?utf-8?B?dndhdnZMMXg1ZVhXYllNRkZkaDdHZ1lCeTBFVnI5UHF2S3BVL3Y5alY0T1BX?=
 =?utf-8?B?NGswTE9hc0ZVVkEzTWhDZnB2WWJ3WHhDMld1bXBWTzFOai9lYTdwS0ZtSFMw?=
 =?utf-8?B?YU93WFhYcXUrZGljN0tXUlQweGN6SE4wQi9pSm9OODM3V3FUSkZWazdjTDRF?=
 =?utf-8?Q?h8fY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B46189E8ED3FE84DAD3AC71907746F5C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52293a54-58ef-4929-65b9-08dd24ce225b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2024 10:23:11.4218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OC8c4K/53n62PKmK6yT9nF5ovqHe4L4FelHupvAWktpBC/p+EHuxH4hQQMEJ4O7OU9XWbxEh6N/Dvni2rCghIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9027

DQoNCk9uIDIwMjQvMTIvMTcgMTY6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4xMi4y
MDI0IDA2OjUzLCBaaGFuZywgSnVsaWEgd3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDIwMjQvMTIvMTYg
MTc6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE2LjEyLjIwMjQgMDk6MTgsIFpoYW5n
LCBKdWxpYSB3cm90ZToNCj4+Pj4gT24gMjAyNC8xMi85IDE1OjQ3LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4gT24gMDcuMTIuMjAyNCAxMTo1OSwgSnVsaWEgWmhhbmcgd3JvdGU6DQo+Pj4NCj4+
PiBZZXQgYW5vdGhlciBmb3JtYWxpdHksIHNvcnJ5OiBQbGVhc2Ugc2VuZCBwbGFpbiB0ZXh0IGVt
YWlscy4gWW91J2xsIG5vdGUgdGhhdCB3aGF0DQo+Pj4gSSBzYWlkIGFuZCB3aHkgeW91IHNhaWQg
aXMgaW5kaXN0aW5ndWlzaGFibHkgaW50ZXJtaXhlZCBiZWxvdy4NCj4+DQo+PiBUaGFua3MgZm9y
IHJlbWluZGluZy4NCj4+DQo+Pj4NCj4+Pj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94ZW4tc3lzL0xp
bnV4L3ByaXZjbWQuaA0KPj4+Pg0KPj4+PiArKysgYi90b29scy9pbmNsdWRlL3hlbi1zeXMvTGlu
dXgvcHJpdmNtZC5oDQo+Pj4+DQo+Pj4+IEBAIC0xMTAsNiArMTEwLDE2IEBAIHR5cGVkZWYgc3Ry
dWN0IHByaXZjbWRfbWFwX2h2YV90b19ncGZucyB7DQo+Pj4+DQo+Pj4+ICAgICAgaW50IGFkZF9t
YXBwaW5nOw0KPj4+Pg0KPj4+PiAgICB9IHByaXZjbWRfbWFwX2h2YV90b19ncGZuc190Ow0KPj4+
Pg0KPj4+Pg0KPj4+Pg0KPj4+PiArdHlwZWRlZiBzdHJ1Y3QgcHJpdmNtZF9wMnBkbWFfZGlzdGFu
Y2Ugew0KPj4+Pg0KPj4+PiArICBfX3UzMiBwcm92aWRlcl9idXM7DQo+Pj4+DQo+Pj4+ICsgIF9f
dTMyIHByb3ZpZGVyX3Nsb3Q7DQo+Pj4+DQo+Pj4+ICsgIF9fdTMyIHByb3ZpZGVyX2Z1bmM7DQo+
Pj4+DQo+Pj4+ICsgIF9fdTMyIGNsaWVudF9idXM7DQo+Pj4+DQo+Pj4+ICsgIF9fdTMyIGNsaWVu
dF9zbG90Ow0KPj4+Pg0KPj4+PiArICBfX3UzMiBjbGllbnRfZnVuYzsNCj4+Pj4NCj4+Pj4gKyAg
X191MzIgZGlzdGFuY2U7DQo+Pj4+DQo+Pj4+ICt9IHByaXZjbWRfcDJwZG1hX2Rpc3RhbmNlX3Q7
DQo+Pj4+DQo+Pj4+DQo+Pj4+DQo+Pj4+ICJEaXN0YW5jZSIgdHlwaWNhbGx5IGlzIGEgc3ltbWV0
cmljIHRoaW5nLiBXaHkgdGhlIGFzeW1tZXRyeSBoZXJlPyBBbmQNCj4+Pj4NCj4+Pj4gd2h5IF9f
dTMyIHdoZW4gX191OCB3aWxsIGJlIGZpbmUgZm9yIG1vc3QgZmllbGRzPyBBbmQgd2hlcmUncyB0
aGUgc2VnbWVudA0KPj4+Pg0KPj4+PiBwYXJ0IG9mIHRoZSBkZXZpY2UgY29vcmRpbmF0ZXM/IEZp
bmFsbHksIHdpdGggaXQgYmVpbmcgbWVyZWx5IHN0dWINCj4+Pj4NCj4+Pj4gaW1wbGVtZW50YXRp
b25zIHRoYXQgeW91IGFkZCBoZXJlLCBhbGwgZGV0YWlscyBvbiB3aGVyZSB0aGUgbmVlZGVkIGlu
Zm8NCj4+Pj4NCj4+Pj4gaXMgdG8gY29tZSBmcm9tIGFyZSBtaXNzaW5nLg0KPj4+Pg0KPj4+PiAi
RGlzdGFuY2UiIGlzIHAycGRtYS1kaXN0YW5jZSBiZXR3ZWVuIHR3byBQQ0kgZGV2aWNlcywgaXQn
cyBjYWxjdWxhdGVkIGluIGtlcm5lbCBkcml2ZXIuSSBkb24ndCBnZXQgd2h5IGl0J3Mgc3ltbWV0
cmljPw0KPj4+DQo+Pj4gRGlzdGFuY2UgZnJvbSBBIHRvIEIgaXMgdXN1YWxseSB0aGUgc2FtZSBh
cyB0aGF0IGZyb20gQiB0byBBLiBCdXQgeWVzLA0KPj4+IG5vdCBuZWNlc3NhcmlseSBhbHdheXMg
KHRoaW5raW5nIG9mIGUuZy4gcmluZ3MpLiBZZXQgc3RpbGwgSSdtIHVuY2xlYXINCj4+PiBhYm91
dCB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiBwcm92aWRlIGFuZCBjbGllbnQuDQo+Pg0KPj4gUHJv
dmlkZXIgLSBBIGRyaXZlciB3aGljaCBwcm92aWRlcyBvciBwdWJsaXNoZXMgUDJQIHJlc291cmNl
cy4NCj4+IENsaWVudCAtIEEgZHJpdmVyIHdoaWNoIG1ha2VzIHVzZSBvZiBhIHJlc291cmNlLg0K
Pj4NCj4+IEluIG91ciBjYXNlLCB3ZSB3YW50IHRvIHVzZSBwYXNzdGhyb3VnaCBkR1BVIHJlbmRl
ciBkYXRhLCBhbmQgdmlydGlvDQo+PiBpR1BVIGRpc3BsYXkgZGF0YS4gU28gZEdQVSBuZWVkIHRv
IGltcG9ydCBkaXNwbGF5IGJ1ZmZlciBvZiBpR1BVLiBpR1BVDQo+PiBpcyBwcm92aWRlciBhbmQg
ZEdQVSBpcyBjbGllbnQuDQo+IA0KPiBSaWdodCwgYnV0OiBJcyB0aGlzIGFycmFuZ2VtZW50IHJl
bGV2YW50IGZvciB0aGUgbmV3IGlvY3RsPyBBcmVuJ3QNCj4geW91IHNpbXBseSBhZnRlciB0aGUg
ZGlzdGFuY2UgYmV0d2VlbiB0d28gZGV2aWNlcywgb2Ygd2hpY2ggeW91cg0KPiBwcm92aWRlci9j
bGllbnQgbW9kZWwgaXMgbWVyZWx5IGEgc3BlY2lhbCBjYXNlPw0KDQpUaGUgbG9naWMgb2YgdGhp
cyBpb2N0bCBhYm91dCBwcm92aWRlci9jbGllbnQgaXMgdG90YWxseSBmb2xsb3dlZCANCnBjaV9w
MnBkbWFfZGlzdGFuY2UoKSBvZiBrZXJuZWwuIFNvIEkgdGhpbmsgb3VyIGNhc2UgaXMgbm90IGEg
c3BlY2lhbCBjYXNlLg0KDQpKdWxpYQ0KPiANCj4gSmFuDQo=

