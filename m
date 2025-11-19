Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F81C6FE98
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 17:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166110.1492736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLkdt-0000Hg-NC; Wed, 19 Nov 2025 16:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166110.1492736; Wed, 19 Nov 2025 16:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLkdt-0000ER-K4; Wed, 19 Nov 2025 16:02:49 +0000
Received: by outflank-mailman (input) for mailman id 1166110;
 Wed, 19 Nov 2025 16:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRf7=53=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLkds-0000EL-4e
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 16:02:48 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fc075a3-c561-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 17:02:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5910.namprd03.prod.outlook.com (2603:10b6:510:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:02:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:02:35 +0000
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
X-Inumbo-ID: 2fc075a3-c561-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXAzE2tMVTTew3t2sp3q1ZfkuHLoAPg4WkI2ptCw4lUY6+rtpLPssvqVaZgsOtpWVE2T6pvHv5UQGFhPMKceqnd4NTvrHmkkqUxjLmL63wb/62Bj+FRpQdFlx4fcQVfh6TpfSI7ow7yxsthAWWMfrtmqBjATRKdM53z8zrOr6DEQHHKzVqwinV05mDLQ3nrfwil3Wtx8AgNaPHPyze2tgydahmon7tGAyD7QBhdxbYvN0gKYC58da36VBzEHLEVzOwbAZm62M32p+hWIvXmRQY0ZoPkA9GpiDL7/Qfh/SSXHGYVdZWnD8rvgBWrigng24Y+ACdhAqYeDXeDjkcFEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFzVkDdrnd7R9L/HMUgLcm4veUPC8HuKrFB18LWsz28=;
 b=kCsl9Nt0HgsYDd8vnDBmDzF9YC4rGHMvch0XEDWCjIRhBW+rQH/1zqhfOqqJ8c2MW7tC219bGvhtAFyKfL7alC2V1ON2oabXO/qD9aQG8wXXzmGZaR8oLj3AbJuY8lSAwZ2/pr2FFG8XoHv2h3LwMghD5N9Bzn385akg+pUNF8TWldZIDOWqQ4UrNGgBmW9kYvK+jElKXtznLOnavyYeDoFX8CetVhAi8U/jsOTdQDTCyKInnG3E6IqwK0fmMw6Iy1FuOYmWHsKCrLWsokGLMDX4rxBSTIsKnW3RZ7DMJRHfnHQ8Hs9kWhDgHcph9ILyNC0vXouvdgk4rkl1ilYMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFzVkDdrnd7R9L/HMUgLcm4veUPC8HuKrFB18LWsz28=;
 b=eKIVw9TUnlYmmCFmmeWCgUTsjyv2RJ38KzBWDDoV9jFetPXxXz2Ith+o1M6X4WnZ7Z/576DtDh5PNaynHHNSqaFwz1saY7zbpo30a7MGhNWGYpOKQbqY4Oy2PGu75U3omYD8ZXh9eFfLAxfnsacnKNJBzT8ZE7DGbtecazaZ144=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <38ba402c-6920-47f6-91d3-7b499c407c36@citrix.com>
Date: Wed, 19 Nov 2025 16:02:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Frediano Ziglio <freddy77@gmail.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com>
 <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
 <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
 <aR3dFPTeH4Wegodd@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aR3dFPTeH4Wegodd@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8cad4b-8a38-4373-9e09-08de27850e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blNPRk5sOUIxVGJjUFh2RXIycWdjYVFibjc0b3Ywem5hWlFXQm5CRGhrM1NQ?=
 =?utf-8?B?U3hCN2RyVW5tYVRmS2FsZitqRm5aSStpaElLYjYxSnpzdGwxL04zY3VWaUJN?=
 =?utf-8?B?ekNPSytTYjYzZGVNTFJoaEV0bXhodCt0cGtvdk1qak1helVyVWE3OUlybDJz?=
 =?utf-8?B?R0kvd29PZjdMZFBqYlo4U1lPR2VFSmdwRTJBOEZiZGFqc0dqbnRpNjRYTVVD?=
 =?utf-8?B?cUt4OWpMSTBkR0U0a0lvSmtIZlFnODd5dHFvVHhRbXJDakN5Zi9hRHphWlRw?=
 =?utf-8?B?Tk9BWHVnYVR1REpLNTh0Z2gxVEREOS9wNGpMWXRzUk1kaUo4L2dmNXQ2dW5H?=
 =?utf-8?B?Vk12UnFVZmc2RGgwdlpvVjFWbzdVWE5sRGhaTXV3RjNrMmZLRGN6RnBzMFho?=
 =?utf-8?B?WGxpTDhBUklHb1U0YzYrNWg4MDJoSUxMekZoTHliY2ZncjQ2R1lWM1htS21N?=
 =?utf-8?B?QnQ2NE1qUzljZFUxVzkzazhuL2Y4RG5UMWV0WG1Mc0kwVVBzakpXTy9ZZWJB?=
 =?utf-8?B?NEkweDEyY1lHMjd4Q0lha0xjVmhqc2JQbzkyOUtTcU81NmlFREc5R0FNMXZX?=
 =?utf-8?B?cFFaelE3c1B5ME0wUlNmZnhmdEMyYVRTWC9QSDFqeXRMZHBsSEJFbVNkZDZU?=
 =?utf-8?B?OUlkbi9rbGx5UWFLSlhOL2pqOFZQeHgweFRPaDdjb0NRV005ckdyMnUreXhU?=
 =?utf-8?B?Q0tNZU54TmlZNXhVRit0QWdadis0OHA4REpqdVNWbkIzZmZ4bHRLY0pVa2x6?=
 =?utf-8?B?UGRZTnNDZkMvSUgvelVMOVZTdHZXckI1UnBJWTBNb1Fta1FmaG8xdEU4VEgv?=
 =?utf-8?B?bEpiZTlNcVVWeFdWSUplRkdhLzkzRzJjRjZPODNxOTlDYjB1SXV0UzZ2aGk1?=
 =?utf-8?B?ekc0T2pCREo2UUFSdXRqMzJ5c01MR2dIYXZYK2MzVldQU3VKUVBuZ0wwMFp5?=
 =?utf-8?B?Y3c5Yk9lYTAxM0IyK0x1SzVVNmZkNHA4SjArOWc0K1BZTjRkQ2xIUDlsaVpt?=
 =?utf-8?B?UStOMkJEZkwrMHI5YnYwc3JXR01URThCSWRhd2tLZW5tY2M4T3kya3hPa0wr?=
 =?utf-8?B?QmFxTlhZaXgrenBGK1p4UUVLSzhycXRzZDBYVkNodnlkaUI0S25NeEhWd1ZQ?=
 =?utf-8?B?QmdlMUhyQkFwU25nUlE0NVhpWnlVM2JUbmpERzZMdjRXN0RjdWxadHBhb01T?=
 =?utf-8?B?dDlrMnBodkF3TURLcURXMFNUN29tb291dFdOTVVWTTRCTXU1bGRNYmJzeGx3?=
 =?utf-8?B?Q2dwOE1lWXNzcEFJUUNBTkhyckc0VzNJaHJxTHFZcGpIYVlUclB2Z3VOTG80?=
 =?utf-8?B?Qm9NbFhYR2c1N3NWSEdwZ1k1cFcxeDhKdkhjOEJ0TTZGYmprclE2bmVVbUxC?=
 =?utf-8?B?bm5sUWs0Z0lpVWxncmNhdS94b05mRUpjazErQUJFMnNQcEsxZ08xWitmOWpG?=
 =?utf-8?B?dTg5RW9LdVBCQ2JYcnpteUR2NjZsdEdLMllOUml3U3lhSnc0Tm13ZWR4VXJk?=
 =?utf-8?B?dm1UY2VEbEtKVjNzZ3BmU2J6U1lkR3dlUkpFNlJPclpoRE1PYlQrTlFkWTBI?=
 =?utf-8?B?RVNseXlpaWF2TDRDdG00MkQvclc2TGZNaGFyaGNOdWJ2cXNkY0tNTGtab0Yv?=
 =?utf-8?B?RVkzckFiWjFxVHQ1TTRuYVNZbHZUQW8zTjdkZmloWVJVdk1xRndYYzZ1a0hB?=
 =?utf-8?B?c08yZW16UU5vRFFyWE1YU2wrVWdRK2VDZEt1eHZUMlpHMDRFdmVpa0pxeDE2?=
 =?utf-8?B?Znp0dHYyblBqTTJJMkh5NXd3SUZOeC91RmlXOUJ5YWxtQW5sbEVKak9pZits?=
 =?utf-8?B?ZTI0UVhjMzBVQ21LR1JCeC9kYWg4VlNKWTQ2NWwwSCtabnN1dWRQck5vUU9D?=
 =?utf-8?B?aWxOSUptMW0rZE81QmlXY09ITWcxUUZOTVo1Wm0yd1VyajRQYUtyRDQrTnpJ?=
 =?utf-8?Q?RwGupjQsiK8lv9lYQMkHlu3vIMXp6X53?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHVFVTU5bzFrTmVWNTkzQVY2eHZodTlmdXhNb0FLd3M4OEkwVXZFSkhta0tm?=
 =?utf-8?B?ZUVtSzU1VW1hbFZYdlpDQ2hoMG9INzNtMXUvYmI5N3dRaGtTVVhFR01VVFQ2?=
 =?utf-8?B?Y0dIb1ZuRkR0Vmw3N3dyc1lReWpOdi92RUJLL0YzWWNHMnIyeVVuUTRoYjhy?=
 =?utf-8?B?dDVTM3lsMG5NRjFJQTYvS2FNVlIwVTFpL1FhVk85Yjhwbkw2M0plSXh0aVNT?=
 =?utf-8?B?UzY0MG1PTzB0eWlEYmNuNHU0OWt5aDlURWRpTC95dWpNZTZaNGc5SmxUa0hG?=
 =?utf-8?B?WlR4VnQyaVROYkF1ZEFpMlZpQURiQlcwMFdDOEI3Z2MwRlFqUk9qSHNWaG5i?=
 =?utf-8?B?T29iQXNBdENDTFNxYmRXNDJCbkdmaHg5MnQ5enZPdGJqMnhKQ200MnlGT2pN?=
 =?utf-8?B?VDFDWE5VWXZPMWZWSEJYSEQ0cUxyeHh5d1Y0VFppbTlZT0tySndTRDMvejJU?=
 =?utf-8?B?bzZEa05YdU5TSjV3bTYybmtYU20xcWJkbzdNUUxVOGVmMGxyMU40cEFHQzJD?=
 =?utf-8?B?VzdRcXVBYm5rY0pqQnBwY0RyNUw4U2NpZUt2MUVkZmNvaFd0UVUxdFlIbjRI?=
 =?utf-8?B?ek85bkZPdFVTRGxtQWZqMVc4OUZUckMvSzFQb3FSSThiU3NyMVg0bDZ3Wkcv?=
 =?utf-8?B?d3B5b3FQM3pHdEpFZFNPN3dPb3ZJN3lDdEVzVFpTOFlSZGE2Y2NUTHdVVjdY?=
 =?utf-8?B?ZENWS21jclFkZ2dNWkovOVlaUkhvKzYxeTdYcWlydnRwb1l4cWVETzVESzlU?=
 =?utf-8?B?eUNkbGR2WWcramtOZ2RRdEI4ODdrUktpaFVHSnVLa1RqbExINGNFUHV4REdo?=
 =?utf-8?B?MFpJeGJHc1dJelN6SVVKVnBMdWY4TFJVTVFETUIrdWQydFZ4bkhQaXRIaCtG?=
 =?utf-8?B?WGlPVDhRemgraXYzQWdNU1hMbm9tTlp6cjlERC9PSldYTGtTcXhEV09ING1y?=
 =?utf-8?B?OUFqajhFYno1b2VtNi9zeHc3UFQwS1JwcytSTXorWVYwT1lOVHpLdGkvcmxZ?=
 =?utf-8?B?SEhQNGRITmtZVlZ0ZTIrQ2FQakt1K1NxZU95N2Y5M0FUdzFZOFpjQ1N3Tzdn?=
 =?utf-8?B?b3F3UEE4VkEyZVBuS2IzMWRLWUFjVVU3R1lwbEUwWFlKLzBRaGsxVmlEb2Fv?=
 =?utf-8?B?eTFzaWtZV0dxQmgzMFE1c0JLSlJLYlZTVVpKcnBLTStjV1lhTHJXajQyK05s?=
 =?utf-8?B?SXk2MFlKUCtDaEs0Um9IZ1FDSGxRR25vU2I4R0pDK1NZM3NMVjFXektmeERB?=
 =?utf-8?B?bnViMEd6MnBlV1RmVG93NTF6c2FZWitVN1FwZnkyYi85QkR6dDRBZ3F3bTg0?=
 =?utf-8?B?ZTdTVHFycmVQdWZ2eXdqVHJLT0gzUmNuRk5GTVRyYXF2NWZhbVJGSXE1bHR6?=
 =?utf-8?B?cG1kS3A2Wmp3UWl4UktoUmdlUVdEUlF6T2ZrL1pWWjFiNTZHZWN1ZHFuMjZ6?=
 =?utf-8?B?L0dBdG9RVG9PdTEweTlFRnREaEZZK2F3SzU5ZHROVEVIL3R0bDExbVFwbUpt?=
 =?utf-8?B?SDV6Z2ROOFpnVUhvems4SURrSzNpMmhwMy9OUUw2aDRBU2gxQ05nSlNjbEpC?=
 =?utf-8?B?elpDUlkwWmUxRXl1RFRVc0FBMjZaaWxzU1dueVZrQmxWYnVkNHl1SG1OWXR2?=
 =?utf-8?B?SHNtb3VxZ3l6WDJZYVJ5YlB0blBzTUkvU045WFlqU1J0bXpMUHRTMFQ4RGJL?=
 =?utf-8?B?UXpiL2dkZ2JUQWhkOEdHUGVic3E0Lzh4VGsyM2V0TlBqQktyNW5kWEtxdVlC?=
 =?utf-8?B?ZkRSLzFtT0t4OFNWb0J4bFdaNUJpQjF4akdLdUpBN3ZKMkZ4b0s3QzZTTEJQ?=
 =?utf-8?B?YnZINWlqYkVuZkROVzRRTE51ZFFqRzhTaDBDY0RSaytENncvVEJ5ZkxTYUlu?=
 =?utf-8?B?QlZxM0s2RytkT1NXbGZib1pMenFSalk5SG9wcDZPMUVaUm1zcnVTdHNQdEF0?=
 =?utf-8?B?YVA0RDBMeWNSRkphL29TaUkvck1LU29uVjRvRmpIY2JnWWRzRVR5bEhPODAv?=
 =?utf-8?B?OERBUzlKTWU3T1lyZ0UvcThrdE9FY3BYY3plKytCY2NPbnRWdGtGSm5nSXEz?=
 =?utf-8?B?S09GRzJqMDlaQi9GOXNDVTlhYkQvYitVUVNXQnRDQVdrYW1nS2NpUlc0MzE0?=
 =?utf-8?B?cm9mcTYxcGNnNGJHSDNCZUxBcVR6bXF4SksxWDdXVnpTUGU3VjB1RnNIeW1a?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8cad4b-8a38-4373-9e09-08de27850e33
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:02:35.6395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOGnKdEWbU7p6+3Ex02UkXpgmKL3QYaerkz2P4ISvFiN3qDibmCK11ot02OEqfWVerJjPZTfGgM7K3ixYuH1Rcq72rT7iv4wRtPubUJXh/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5910

On 19/11/2025 3:06 pm, Marek Marczykowski-Górecki wrote:
> On Sat, Nov 15, 2025 at 06:23:08AM +0000, Frediano Ziglio wrote:
>> On Fri, 14 Nov 2025 at 19:18, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>> On 14/11/2025 3:40 pm, Oleksii Kurochko wrote:
>>>>
>>>> On 11/13/25 4:43 PM, Frediano Ziglio wrote:
>>>>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>>
>>>>> For xen.gz file we strip all symbols and have an additional
>>>>> xen-syms.efi file version with all symbols.
>>>>> Make xen.efi more coherent stripping all symbols too.
>>>>> xen-syms.efi can be used for debugging.
>>>>>
>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>> Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>
>>>> Thanks.
>>> Thanks.  Unfortunately CI says no.
>>>
>>> Ubuntu's 20.04, 18.04 and 16.04 all fail:
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2159622869
>>>
>>> From 16.04:
>>>
>>> 2025-11-14T18:01:51.192964Z 01O strip xen-syms.efi -o xen.efi
>>> 2025-11-14T18:01:51.198151Z 01O strip:xen-syms.efi[.init]: relocation count is negative: File truncated
>>> 2025-11-14T18:01:51.198166Z 01O strip: xen.efi: Failed to read debug data section
>>> 2025-11-14T18:01:51.198169Z 01O strip:xen.efi: error copying private BFD data: File truncated
>>> 2025-11-14T18:01:51.198932Z 01O arch/x86/Makefile:207: recipe for target 'xen.efi' failed
>>> 2025-11-14T18:01:51.198937Z 01O make[3]: *** [xen.efi] Error 1
>>> 2025-11-14T18:01:51.199616Z 01O build.mk:90: recipe for target 'xen' failed
>>> 2025-11-14T18:01:51.199619Z 01O make[2]: *** [xen] Error 2
>>> 2025-11-14T18:01:51.200402Z 01O Makefile:600: recipe for target 'xen' failed
>>> 2025-11-14T18:01:51.200409Z 01O make[1]: *** [xen] Error 2
>>>
>>>
>>> I find it hard to believe that the relocation count is really negative,
>>> and given that newer binuitls works, I expect this is a binutils bug.
>>>
>> Unless the message is just misleading I find it hard to have a
>> negative number of items in a container.
>>
>>> Nevertheless, we need some workaround.  Given that the previous
>>> behaviour was not to strip, I think we can reuse that for broken toolchains?
>>>
>> Something like that ?
>>
>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>> index a154ffe6b2..c465eb12e2 100644
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -236,7 +236,9 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
>>         $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
>>                 -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
>>  endif
>> -       $(STRIP) $(TARGET)-syms.efi -o $@
>> +       $(STRIP) $(TARGET)-syms.efi -o $@ || { \
>> +               LANG=C strip $(TARGET)-syms.efi -o $@ 2>&1 | grep -q \
>> +               "relocation count is negative" && mv -f $(TARGET)-syms.efi $@; }
>>  ifneq ($(CONFIG_DEBUG_INFO),y)
>>         rm -f $(TARGET)-syms.efi
>>  endif
> On Ubuntu 20.04 it fails different way:
>
>     strip: xen.efi: Data Directory size (1c) exceeds space left in section (18)
>     strip: xen.efi: error copying private BFD data: file in wrong format
>
> Looks similar to:
> https://lore.kernel.org/all/3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net/
>
> Qubes has this patch:
> https://github.com/QubesOS/qubes-vmm-xen/blob/main/0608-Fix-buildid-alignment.patch
>
>     diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
>     index 9a1dfe1b340a..26a23a7b0651 100644
>     --- a/xen/arch/x86/xen.lds.S
>     +++ b/xen/arch/x86/xen.lds.S
>     @@ -171,6 +171,7 @@ SECTIONS
>             __note_gnu_build_id_end = .;
>        } PHDR(note) PHDR(text)
>      #elif defined(BUILD_ID_EFI)
>     +  . = ALIGN(32);
>        DECL_SECTION(.buildid) {
>             __note_gnu_build_id_start = .;
>             *(.buildid)
>
> Lets see if that helps:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2167783980

That seems to have fixed 20.04 and 18.04.

The extra line wants a comment at least identifying roughly which
binutils it's a workaround for, so we can drop it eventually.

And, as it's already in a downstream, it should be upstreamed and
backported.

>
> And few lines earlier there is also:
>
>     ld: xen-syms.efi: warning: section .init: alignment 2**15 not representable

This can't be helped.  It's not an error, but you also cant get LD to
shut up about it.

>
>> It will fall back to not stripping in case that bug is detected. I
>> don't know how to test it.
>> (the LANG=C is to always force the English message).
> If going this way, use LC_ALL=C (otherwise LC_ALL=something present in
> the env would override your LANG=C). But given there are different
> messages, this may not be the best option.
>
> And TBH, I don't like silent behavior change based on (unknown) version
> of binutils. Lets see if the alignment adjustment helps. While it
> shouldn't be necessary on newer binutils (thanks to Jan's fix there -
> see thread linked above), IMO it isn't too bad to add it, to keep older
> versions happy. And it can be dropped, once we raise toolchain base
> version next time.

Given it's now only 16.04 broken, how about simply excluding xen.efi
with these broken toolchains?

~Andrew

