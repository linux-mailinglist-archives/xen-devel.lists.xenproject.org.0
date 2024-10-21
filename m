Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AF69A68C2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 14:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823512.1237515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2riQ-00040g-SB; Mon, 21 Oct 2024 12:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823512.1237515; Mon, 21 Oct 2024 12:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2riQ-0003xZ-Or; Mon, 21 Oct 2024 12:40:54 +0000
Received: by outflank-mailman (input) for mailman id 823512;
 Mon, 21 Oct 2024 12:40:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLLp=RR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t2riP-0003xT-Il
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 12:40:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2418::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b45bfe8d-8fa9-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 14:40:52 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH0PR12MB8579.namprd12.prod.outlook.com (2603:10b6:610:182::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 12:40:47 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 12:40:47 +0000
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
X-Inumbo-ID: b45bfe8d-8fa9-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otqoy5vm8r5aBm/AmjCz/sP5kzaT7JnBcqms6SD4Id/cKnVbfZ3GvPlhAcOHof4pjpNUUD6dFxU3GX3FDaADZff9KH09hZHiZwhUNEVuj1q/Y0hlW+5qfA9F00eQKpAkS0ke96knQjuQVIUF7XPqam03SBGhdA3xBOWoZvFpaZP658LVaV3ufbWfsDw4V5H42D018ZRtzUe7QXVYwUfpI08+Ueibo/qkz58mZ/ucyfZ6AooVQQsTN0nCw3Gn3qHvXfPGYHY8oZQTn5BGBbgJGfyGrKpv4O60Kkd2+lWnr2LgQJtbeqySc5hDRWcy5kmGDILtk9IkNIkSmUGqbW3Wdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFN2UDjaEnLN9eJmO5kwiez4nOlZrLYP8urHK7eEdQ4=;
 b=stGMae+fl1SaiFLYJVAPlKc01AltpFQ7/kWLIz3b/k7dCAU2AupB8jaC1KPjT8mhiJcfept9iljCHYbFh0A282lXctAY2WltPLIagAmQ8FHk4FgvBJPsg8LBu8lMXQlaPgV2tN5G7i9JrW3j+wxDtorRh3/3y1g+1iFQtu95WZd/y/FxYdHkwKESwCOMcDcNxEhxXPUO8AIJRFljUMFm2RdrZEMCb3jDYSUxC3WWnsjfdEJ+0z/gkpwTLuf581ab39f4l0c9LJ5YIGahbKD0oK338E2CCu2qUw2PAqQ/irNszTUkdqiRmhfWl1tsmow404TsGS1KQtT9zzGzCkerQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFN2UDjaEnLN9eJmO5kwiez4nOlZrLYP8urHK7eEdQ4=;
 b=h2bGsJwWIWLWy05CKdn0i7PQ0TZ1o58DtyJ7eG2V54Z9I243OqzoBhzFn0pqy0ArstJltAh7LZEadZwjffK8yOPIi04k+ank2eqqnHvjJQSAZyo2UARRNQCVL7nkZriIbkXfCO/PevTvilAXKebGVFQVtvcG7KvKCTADgARdeYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a92993c9-8af9-4d53-a934-79e7f5a5f92a@amd.com>
Date: Mon, 21 Oct 2024 13:40:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-4-ayan.kumar.halder@amd.com>
 <5740cd89-1064-4ad1-a0a6-90c03ab99768@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <5740cd89-1064-4ad1-a0a6-90c03ab99768@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::17) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH0PR12MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7ab63a-501d-4818-e19f-08dcf1cd9672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2xNQ3ZzSjVHN1NUc1k4ZEpnY3Q4cnQyRmw0cXdJSElrOFNmdzJqazN5Yk5j?=
 =?utf-8?B?YnRxNjJ0OVNuNDJDWndCbEpBWnNUSnhoUENJQXBzU0lseVF5UXhPbEIvUGpu?=
 =?utf-8?B?bFZFSG1sQzd5UXovUHN0c0szelRDRTZkZUh0a01TYkRqWENIMEZEcGJmWDBJ?=
 =?utf-8?B?Q2dOWmhnSDlleURPNHhIeHNjbCtrd0JBTlBUZzg3UUI5VUdDQSt3ZmdVT2Nl?=
 =?utf-8?B?WWhJUURvUnkxYmRBbkwzMllodG8zL2wvdWFWakt1R1lLR0hSUk0vaXVmcU8y?=
 =?utf-8?B?SjRZV1NRRklCMUhPbFU0WUJzMGJJcmk3WlFTVm5vdmZRMUNnMTAwb2pVd0JY?=
 =?utf-8?B?Z0JXTmpZUHZDMnA3K0Z0cGhtVlF6RTRRdkhTWVQzUnpLdVZWT2FjRmJEUHlo?=
 =?utf-8?B?MVh3YTlpL3gxYjJwU09tWFM5SFRqaXRuYzhZY3g3aGxHWEROc2ZrakJ5Q01X?=
 =?utf-8?B?Z3pyaUhzbmxuZGVpMG8ybWU2ZWZ1VXJDTm0vek5sdm51QnRoU1pZUkQrbVBJ?=
 =?utf-8?B?WXFPeXN4QjhmNzNNTEtiTmk4MmhsdEVsWnhVMnJCcUJCSFRiRlRyTHB6Q1ZF?=
 =?utf-8?B?UGlTNU85NkdhRmY0L3FaWXBuWUo1SG1RSUJjRVRsYXpEeFJDY2ZHcnVvNVNF?=
 =?utf-8?B?TlhCbENqRG1sbHA0QkZYdkJwdi9UTnZEN0R3aVJwQ2d1NVJPSEJrbDRhbjRk?=
 =?utf-8?B?eWVaQXZ4SXU3YklGa21ua285NDlBeFZJSU1SQnk2cEFPTnBEeGhTYmxTOFVV?=
 =?utf-8?B?TGEvNjVHVlBQSlUxWXZtbS9PSFVoZFZzRURKNDdycGMvcnYzUXpEa3l2Rkxt?=
 =?utf-8?B?MnpYTnV6ekJ6L2pqYUh3bCswZlRPdTF5ekRZSUptSlIzM0lrWHZKUzFjeUQ1?=
 =?utf-8?B?amhWNkVSV3dDZFFCTlI0TEM1Y09wQnNOeURwK1IzYlZJMWJuNnNrYU5NMERv?=
 =?utf-8?B?c1dhUDhWRWdpYnBjZ3VTZnQ0UTNZN1A4UWZCODFWQWk3cXkzT09WV25pYXUr?=
 =?utf-8?B?ZTIxSmlBRXBidURmbU55aE5IWDZoaitKQVZmaCt6WmwxSkJxMWhMdTErZG90?=
 =?utf-8?B?K3M4YkRWRGJlZkRBN0lnSUUvWnlkZktla1NrcTVZdDhvT0tkYzhyaWYwZFdE?=
 =?utf-8?B?VjE2V1g4QkpyeTJrTitjSGllemFlbGRJcWZ4Y21ydWdPWERYU3JQQVlnbVNn?=
 =?utf-8?B?MjcrU0pueFBmbGNUUDR3WHZyMkJ2Q3Q1Z2dvNG43SVRpdk56dTJJUTBReUZ2?=
 =?utf-8?B?OHZ3L3JKL2NBV0xweHN0ZGpHKy93K2hXU2tHaUJPTXBWVk54c2hEcEJBcW5B?=
 =?utf-8?B?N1lBdytMOGtXRDVSU0tZUkhMbm9GdmNTV1FpMjU2VzRpM1NNSHgwS2RwVU44?=
 =?utf-8?B?VWo2WWMvWUExWGYzOHBneGMvczR3Q0dmQUN3NkRESVhOVE50Vitwdjh2SHkx?=
 =?utf-8?B?K2N6RXI4aDIvU2lkYm9MdkxVYUxxN1RVU2NTZUVFK2tLTEo5THBzblNnZU85?=
 =?utf-8?B?dU1BS0R1N3BDRU8vUVBQRFA0MDV3SHIrOW9TYjNlTkk5dnlFQk9KcDR3TTRt?=
 =?utf-8?B?Tmpic3lXVElvRlpVV1FpdU43V3JacWd6N3RINEJ5c25hMmp2T3UyanJQaGRr?=
 =?utf-8?B?ZVBIajBUOEJycUpwMVpIZjVXdTEweDNZcmJueGg0UzdzdlVCbG84TGJxMGxD?=
 =?utf-8?B?MGxUU29iSTRDQ0JWMEV2b3p3andCbmNpd3dWSGdtMmxySDFvK0NMSWR0ZW1C?=
 =?utf-8?Q?KskCripeEXRhnbdYxDErEWMsF2wr2uWvyab11WU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXo0T0tTd0tLTU12SjJBczlZbHR5c2lEWnh4djlIaGFRQ21nWFI3SU5uM2RS?=
 =?utf-8?B?M0hlRTNvWHlOVUpOVmp0YlFJL1lIVVV4QStmbldTb1FOTURidkxWQVhUWUd6?=
 =?utf-8?B?SGFFQ28zREFxWUkzWjBFUzU4Wi93cWRINTZPY3k0QlptUG9QRXpoL1JsTkFE?=
 =?utf-8?B?Ylc1TjlHYWpVUUhUc0ZLbEJ3TUJPRnZKL01vdHJ4RE9CVkt4Zzc2WUovOStR?=
 =?utf-8?B?bkFEdkZMUWRyMW40OW1SbHlMZjc3bUkxTmpRbmNhdUxvTWNubUJJbzNlWW9O?=
 =?utf-8?B?TEZPR2Q3NFFpRUxaTENVTVlPUTFmSzRhVlRna29DcFUxbVdLcHJVeC9FMXE0?=
 =?utf-8?B?ZTVLV21CNm12a055UzNqU0RsOEJtVEljVkdRVnFSSlpZWjRDMXRmR3BRZDNj?=
 =?utf-8?B?UjJ6Vkt3YTRGNkpqb1RRVlBMTEYyVFdLU2xzb3pPVzhTZi9EOTFCMG94Vjdv?=
 =?utf-8?B?T2hKZDBXc0hDMjg3ZFNhdndoVlRueVdUNEZzdWRIb1dTNTRxZ2REamJVZEQw?=
 =?utf-8?B?VExrdEZMRml5aG81RXFya3U2a2hBZHFscm9aSVUxTDZpdGNJVTJ5R1d5bUMz?=
 =?utf-8?B?dG5uMHVEYWNIU3ZrYVFmWEVURW9hdW1sU0xxL3g2TE8rOWtCbDlVRUdJNUFI?=
 =?utf-8?B?QVl0YmVSWkN2Z2dyeWhkNS9WRkgxTVZaRXVmWDJaY0R6MS9QSm1tWlJyRXhN?=
 =?utf-8?B?NE1SU2Nabkh4WVZkZUk3V0VGeFlnak5NYkNSenBFVUtKN0R6K2ltUVFhbkhj?=
 =?utf-8?B?akJ0bVJhZFh4NmFNbXBZSUt4dUQ1NW90V3FCbnIzeURVeXBoZWFEb3J3d3NB?=
 =?utf-8?B?WGROZlExQ2xZQk9YYWpSQ1dXd0NiTHlvdHZzYXJ6OXZKTmZVUHlXSFliVVdQ?=
 =?utf-8?B?TFhMa0ZxVHFlbVlHMkNPNXA3VDU1UG5yNEl0WHdvc2xUalE3TEJnZmU2dndI?=
 =?utf-8?B?VmdIclRJVjJJbXN2bEpOY0djeCtYMWwyR0QrL0hPeHIyMmNIV0YyS1VQUTBl?=
 =?utf-8?B?ZkJUdWRTdDlBYXJLNEY3TXFzTXhkSk1WdGZCWmwwRVZKb2FVV2tuNlhweEIr?=
 =?utf-8?B?KzJmWm5hY3Y0TE5DZmRDL3FMU3dTZzcraVZtekVwenVHaWJhV0RxR0t5MjFs?=
 =?utf-8?B?dlVTT3VCSzRiaEtkbjNvU0xzR2ZRR24rS2NsVmd1NSswQnBDUmVDTEp1dzd2?=
 =?utf-8?B?cm53RkU2WjRhRXo4QUVoRWpOVHl4RXNsdVZMTXJrTkJZMEpwcWlzNkxWMmlq?=
 =?utf-8?B?MWZ3ZXNieTdWWmNNNmE4RmowUmMxTEV2aW4xVTNPb3hOWnJvZm9MMzEwTkF0?=
 =?utf-8?B?UzlFa0NEY09BZURZTlFBdG9MRDdmeXVNakluMmZNQ3ZTVVdoOGs4d1NGc1dm?=
 =?utf-8?B?WG5pNEJ2Wnp6dVVyYkMwem1CRThVbUVPaVRXOGJvd3RyRFVhY2NKZXpEVTlJ?=
 =?utf-8?B?aFA1MXJNaGVGMzExZGFSeDkxOHNyKzlZUkpObGtaNk91RTg4MStSaFdlOS9F?=
 =?utf-8?B?bVVTOVFTdG8wbE5hd0N5eERid0p3dGhjU01mRlU4QWRTUjZ1TitoUE1hVXh5?=
 =?utf-8?B?WG9PM1RabGhEYmhNb2RuNE5MSnVjaEFXWnJ1YVFXdUNGbHduM3hVYmJVNmpr?=
 =?utf-8?B?eFVNQVF3dUlPK2dwM2cvMks4MmpTc1RtT0tOQmhRb0lURXJLemc1NlJNRkdX?=
 =?utf-8?B?bk8zK3BkZUZ4M1VHcVlNakNSZWwwakFQais1MGxmSWhkWThRclFpaWMzSkRJ?=
 =?utf-8?B?cm5HR3BiSUc1SUVFOTg1RG9FTUoyQlJDNkdIcGMzSEgrMzRQVVdPcDBvWUF5?=
 =?utf-8?B?ZWFxeVdscFNTNy9ia3pDY21mYXlKYldRSnJnZm1sR0dlMFpFR0pNa01wbFM0?=
 =?utf-8?B?djBaYzNXSTNaaktwYVNXTk5BbkJteWd6a2JudnAxVTR0Z242VS9IR0dnck1Q?=
 =?utf-8?B?d2RmTzBjejU0WHZONTlxb2Z5bjNlN3IrRXU5Z09EVEs5Y0s0Q1RrTzYvQjZa?=
 =?utf-8?B?UTdtdUFMaEFodmF5YTkyZWhJVk1LVlF3RUNRVzZlWndRdXEvZk5qajlHYmZK?=
 =?utf-8?B?Q2lBalJtbVBPbndqWHEwTi9SQTdUK0VzRGU3WTlLK01IeDZKeFhDcG9jQ1NE?=
 =?utf-8?Q?6odKxJJhpfkRTm2M2PE2SM/0i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7ab63a-501d-4818-e19f-08dcf1cd9672
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 12:40:47.5857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BifhuIB3wx/9PENaG5qTrFJYwghIhv9wXm7If5pVZlWmb0+PLEQ/JhNy21y+Dz66R0JzTqalAlfIQsBH83t0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8579


On 18/10/2024 22:59, Julien Grall wrote:
> Hi,

Hi Julien,

Few clarifications.

>
> On 10/10/2024 15:03, Ayan Kumar Halder wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> On Armv8-A, Xen has a fixed virtual start address (link address too) 
>> for all
>> Armv8-A platforms. In an MMU based system, Xen can map its loaded 
>> address to
>> this virtual start address. So, on Armv8-A platforms, the Xen start 
>> address does
>> not need to be configurable. But on Armv8-R platforms, there is no 
>> MMU to map
>> loaded address to a fixed virtual address and different platforms 
>> will have very
>> different address space layout. So Xen cannot use a fixed physical 
>> address on
>> MPU based system and need to have it configurable.
>>
>> So, we introduce a Kconfig option for users to set the start address. 
>> The start
>> address needs to be aligned to 4KB. We have a check for this alignment.
>>
>> MPU allows us to define regions which are 64 bits aligned. This 
>> restriction
>> comes from the bitfields of PRBAR, PRLAR (the lower 6 bits are 0 
>> extended to
>> provide the base and limit address of a region). This means that the 
>> start
>> address of Xen needs to be at least 64 bits aligned (as it will 
>> correspond to
>> the start address of memory protection region).
>>
>> As for now Xen on MPU tries to use the same memory alignment 
>> restrictions as it
>> has been for MMU. Unlike MMU where the starting virtual address is 
>> 2MB, Xen on
>> MPU needs the start address to be 4KB (ie page size) aligned.
>>
>> In case if the user forgets to set the start address, then 0xffffffff 
>> is used
>> as default. This is to trigger the error (on alignment check) and 
>> thereby prompt
>> user to set the start address.
>>
>> Also updated config.h so that it includes mpu/layout.h when 
>> CONFIG_MPU is
>> defined.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Fixed some of the coding style issues.
>> 2. Reworded the help message.
>> 3. Updated the commit message.
>>
>> v2 - Added clarification for the use of page and page size.
>>
>>   xen/arch/arm/Kconfig                  | 10 ++++++++
>>   xen/arch/arm/include/asm/config.h     |  4 +++-
>>   xen/arch/arm/include/asm/mpu/layout.h | 33 +++++++++++++++++++++++++++
>>   xen/arch/arm/setup.c                  |  8 +++++++
>>   xen/arch/arm/xen.lds.S                |  6 +++++
>>   5 files changed, 60 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index ed92eb67cb..15b2e4a227 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -23,6 +23,16 @@ config ARCH_DEFCONFIG
>>       default "arch/arm/configs/arm32_defconfig" if ARM_32
>>       default "arch/arm/configs/arm64_defconfig" if ARM_64
>>   +config XEN_START_ADDRESS
>> +    hex "Xen start address: keep default to use platform defined 
>> address"
>> +    default 0xFFFFFFFF
>> +    depends on MPU
>> +    help
>> +      Used to set customized address at which which Xen will be 
>> linked on MPU
>> +      systems. Must be aligned to 4KB.
>> +      0xFFFFFFFF is used as default value to indicate that user has not
>> +      customized this address.
>> +
>>   menu "Architecture Features"
>>     choice
>> diff --git a/xen/arch/arm/include/asm/config.h 
>> b/xen/arch/arm/include/asm/config.h
>> index a2e22b659d..0a51142efd 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -69,8 +69,10 @@
>>   #include <xen/const.h>
>>   #include <xen/page-size.h>
>>   -#ifdef CONFIG_MMU
>> +#if defined(CONFIG_MMU)
>>   #include <asm/mmu/layout.h>
>> +#elif defined(CONFIG_MPU)
>> +#include <asm/mpu/layout.h>
>>   #else
>>   # error "Unknown memory management layout"
>>   #endif
>> diff --git a/xen/arch/arm/include/asm/mpu/layout.h 
>> b/xen/arch/arm/include/asm/mpu/layout.h
>> new file mode 100644
>> index 0000000000..d6d397f4c2
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/layout.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ARM_MPU_LAYOUT_H__
>> +#define __ARM_MPU_LAYOUT_H__
>> +
>> +#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
>> +
>> +/*
>> + * All MPU platforms need to provide a XEN_START_ADDRESS for linker. 
>> This
>> + * address indicates where Xen image will be loaded and run from. This
>> + * address must be aligned to a PAGE_SIZE.
>> + */
>> +#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
>> +#error "XEN_START_ADDRESS must be aligned to 4KB"
>> +#endif
>> +
>> +/*
>> + * For MPU, XEN's virtual start address is same as the physical 
>> address.
>> + * The reason being MPU treats VA == PA. IOW, it cannot map the 
>> physical
>> + * address to a different fixed virtual address. So, the virtual start
>> + * address is determined by the physical address at which Xen is 
>> loaded.
>> + */
>> +#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
>> +
>> +#endif /* __ARM_MPU_LAYOUT_H__ */
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 71ebaa77ca..0203771164 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -295,6 +295,14 @@ void asmlinkage __init start_xen(unsigned long 
>> fdt_paddr)
>>       struct domain *d;
>>       int rc, i;
>>   +#ifdef CONFIG_MPU
>> +    /*
>> +     * Unlike MMU, MPU does not use pages for translation. However, 
>> we continue
>> +     * to use PAGE_SIZE to denote 4KB. This is so that the existing 
>> memory
>> +     * management based on pages, continue to work for now.
>> +     */
>> +    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>> +#endif
>
> I think it would be better suited in mm.c or mpu/*.c.

We do not have mpu/*.c at the moment. Also, I am not sure within which 
function in mm.c, should this change be incorporated.

Can we take out this change from the current patch and put it in a later 
series when we support the lateboot of Xen (ie start_xen() onwards) for 
MPU ?

>
>>       dcache_line_bytes = read_dcache_line_bytes();
>>         percpu_init_areas();
>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>> index bd884664ad..fe4b468cca 100644
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -231,6 +231,12 @@ SECTIONS
>>    */
>>   ASSERT(_start == XEN_VIRT_START, "_start != XEN_VIRT_START")
>>   +/*
>> + * On MPU based platforms, the starting address is to be provided by 
>> user.
>> + * One need to check that it is 4KB aligned.
>> + */
>> +ASSERT(IS_ALIGNED(_start,       4096), "starting address is 
>> misaligned")
>> +
>
> Shouldn't this be protected with #ifdef CONFIG_MPU? 
yes
> Also, it would probably be useful to start the exact size in the error 
> message.

Do you mean ?

ASSERT(IS_ALIGNED(_start,       4096), "starting address should be 
aligned to 4KB")


- Ayan


