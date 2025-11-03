Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7506C2B561
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 12:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155291.1484795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFsiC-0004m7-FK; Mon, 03 Nov 2025 11:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155291.1484795; Mon, 03 Nov 2025 11:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFsiC-0004jT-CD; Mon, 03 Nov 2025 11:27:00 +0000
Received: by outflank-mailman (input) for mailman id 1155291;
 Mon, 03 Nov 2025 11:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9qLe=5L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vFsiA-0004jN-F6
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 11:26:58 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00f1d84d-b8a8-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 12:26:57 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SN7PR03MB7231.namprd03.prod.outlook.com (2603:10b6:806:2e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 11:26:53 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 11:26:53 +0000
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
X-Inumbo-ID: 00f1d84d-b8a8-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqZ71BPqDP1Vmb/rD0pj9WLKeXJ6FNG22j6pYgaZBaxc3jbeQav/SUUVRIU5dvJ5usOb4R5DanjVat0PljxM3ftSyW7odkO1XHzG/V66n5sgfxWO7/9IN/1pH60qrRv/VatR16YuVjM7W5a34SXJQb3Wbu6UsEFTeAXtWq2XyYrRdZ76cfT2ikqtYUz7q7Oqj/xvVWN2bp1Nct/zi6hSuxjg7TB5QQNzhe+yYnG+ceAguu8m9VLwXiq1UDYSP9RpZZE9Zl4zfmXq6tw17h8XNkYs7fKV1gAbhlChnUmC+7my2m1XuBZZDbWRywFjccBzQED9aonXbGrTc+kkvaHPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bz6NHlqvVuX/qzIUaXLjAjYgOzXqFBuLRwKCx+QlN4A=;
 b=KaHwbo6Uj41Er9NoUuOTaUBNRVMRpsA2/uStg5y/sKt1NI5qh2AV7VZdDESmI9JB8v/ByJOml6y2SQrnKMzsQl+o1qqD3YgsXqHdX6A3xlPzVp3uHgt85FJvhj+YoMbCso+LcFBx3EOI314KlVzVr57ZxdMnoz7s8JiZ/tbGHt3QLJ1hANXane5+DfxSzeTetWwAR5S6LLR5tb1yemn7ORWaU0rK9Ymy3Ro1fpQNb59dfoOVawmc5hHziP0Z9NyIcm2f7/sExVHr2QyX4ZM/fMKOdhq10Q5PzsH0vNnkINGLhO82hPeZhtBrMO2fW3K5/Jj/afhYtZpZJnL9l8bMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bz6NHlqvVuX/qzIUaXLjAjYgOzXqFBuLRwKCx+QlN4A=;
 b=PNKrMdU+f6GCU34y1pHk9IeMsgW/ZANz4mqo7kSpVWBmU0UIHsgrFGwXRfH/O1EsAa9MYGUuL/f+3PsC2/JY/mmyNHbb2E8N1hsUocUkXm9M5J3yitgRD29c8gX0wmuRoPqr32zh7bg0Pj6PeMjzFjGW8RXCymeeQtDVdUOsSf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7fb6ca46-3806-4aa5-a642-28384d6b944c@citrix.com>
Date: Mon, 3 Nov 2025 11:26:48 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: address Rule 11.3 in spin_unlock_common()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <812bf5574cb44727c561e0ebc3a54848823ed490.1762163173.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <812bf5574cb44727c561e0ebc3a54848823ed490.1762163173.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::17) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SN7PR03MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 5288b695-69e2-4127-6fd0-08de1acbe303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2lNNTNjWU5PVHBDWXdISkZLK3NEWEtJci9oVnB0bzF5WnRLRDNVMStGaUNN?=
 =?utf-8?B?K3Y1SzFIY2RvM1lKQjVJQ2lzSmZjbzZYc1NwZU05RWo4UTAzQi9ONm1JVHhO?=
 =?utf-8?B?bEdKbjl1YURXREJhRXBjMTdaaVBHY0FENmc0dnYrT3JMUE5vWW5RU3dnV3d0?=
 =?utf-8?B?WVRsU0s5MEdNcENpNlVkemtZa2hGTUNYTTlUOXg4YzFUWHgrc0dpbVQxaWNU?=
 =?utf-8?B?dTJxb281dzA5Q2laaU5uRmtiZnYrNXJZYlJYVkpDeVJUWVp2Z0creFF6QktK?=
 =?utf-8?B?cUc0d2VpN3NoL21xaDl2ZjkvUTkvbEl6ZlE5SWhKLy9zLzVrRldzU1JxL3VX?=
 =?utf-8?B?aXowNm1DdGE5YkVKaWxRbFV5TW9GUGhMWXdpUmh4Q3gzdUR0NGJkUmJscTls?=
 =?utf-8?B?MnNsWWVSbjJxUVdja0xLUjRyMlpqdG03V0hTTmlzYkw1QytoVUVla1Vjb1ZO?=
 =?utf-8?B?OGc4UjhGc3Q2MFl0Y1paYUlBNWtjcU91NlBqTU1sRHZQMEt6dVVkaDRJbGZy?=
 =?utf-8?B?MEx6ZU1NQXpnb1Ruc25FZ09XZE44bW1qeHZhZThMcWFQS1BlUjhFL1BGSFpw?=
 =?utf-8?B?dXlqempLRE9zeHJzclFsdW9UbXVpZlcrUHB2Q1FzMGFLTVhBNEZWN1BOM1hW?=
 =?utf-8?B?UnJXK3JlWFRFL2lYRnAvcFhBY1l6eDdSUjZoamx0Qm10cm5oQzgySWQ1eVRR?=
 =?utf-8?B?bWxDTDJUQ0lXbEEzVGdyRmFTbmZ2NVdDbCtnM25VQkVuNHNDaXhpS09kaFp2?=
 =?utf-8?B?TDJJcHBRUnVqWGFZaVdOdkh3S0VqMUpld210OGp3dVJPUUJ2Si91NngwUFln?=
 =?utf-8?B?RnIwdC8wYitmaW42eEd3NlJzKzhTYUNyNUEyKzlVTUhXc3VOMURQOVBmVzJB?=
 =?utf-8?B?ZFErMFQ3cmtNZGRtNWNtdVdRUFMzanYxTEp5YW1Fa1lNU3kxVEV0R3puRmxN?=
 =?utf-8?B?aFBlSkh3Y1RSeTBscVVwRmo4WUxpSTlNa3pUYitST2g4R2RORy9RZUVSSVhW?=
 =?utf-8?B?aU5yU1JqQUV0aHNwTGwwb1piOVVwQitmQXZMMVRaL2J6THFIWndidHJua3VW?=
 =?utf-8?B?cWpCWitHSWxNRmtDVUFTZ0ZjTGttWjk0M3ZzRnh5WUJBTWl2disrSm5rOHdD?=
 =?utf-8?B?UXNMV3RmOGZxUXg0YmlTOHAvRVduNW12aU9SUit1ZWd3Z2RlVW5WNFdoRzlJ?=
 =?utf-8?B?Z2hOd2k4ZTVJbGE0Q05KKzBtdWlIY1FrWlFvUmk3NnNBdWx2OVlSQU5sb3ZX?=
 =?utf-8?B?aFV1a3krYmlmU0E1Sk9wZ3VibGkvZTZrdGJjVDNpbnFzV2xCdllsMGhYNHN1?=
 =?utf-8?B?SVlZKzhTRllSTWsvd0cvTmNSZGxUV3ZWeFRCSXluUmNnbDM3Y2xrTGNvMkRm?=
 =?utf-8?B?endHaEN3c1VRK0huT2gycC8rWlk1ZnRkd0JCbzlwbEtUWmNGZjR4VXdEcnVK?=
 =?utf-8?B?SU5FYmJBQTZTSU8zV0J3cGtwbmF0UWxSMVB6WUtIRk1iTVl2YWo3QVpHWVNQ?=
 =?utf-8?B?Ly9KNHFMMFFKeXlJamFaZ0FhRGhNTmJFdlcrVldhVVNGdk9uV3hnMUhHb0Nx?=
 =?utf-8?B?UE8yODRNVFpHdkNHT1NpV2JlWDRnK1cvdjhoKzA2cjV0S2cvaWhPLzlRaFJt?=
 =?utf-8?B?WnFMdGVSSERJOWpYK2VuNy9FV09JeTM5djVsUEcwbmlHb0F6dXZJUGVvOVI4?=
 =?utf-8?B?QnFuTkpDMGFDaWJCTVZBSXRVN2dsQytzWWRzWCtKeUtMbWZqemY3VVZiN2RK?=
 =?utf-8?B?aGdDVzlNZXZ0N2FpYzllK1AvOXFNL1RCSjI2a1JadHI4Ni83TllrRDd5NmNz?=
 =?utf-8?B?dG1pd0Z6MVpyNm11d0NNVXY5ajhna1I2Y3p6bTBNV1MvZ05Ib3B5MDV6Q3or?=
 =?utf-8?B?b1U3WUtTL3ZyRU1VWEw5WEJPc2dyZGxBUERJM0gvRjN2UWsvTjRiTUNzQjhl?=
 =?utf-8?Q?IFUMLUItp+X5bo+NlvcT0sT7medonaTj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUlZZXRWNERpNGNEWm04RXo5Qml0OFVSaGJXNWNjOUcwR3NLU2dKWmx0MVpH?=
 =?utf-8?B?RUxwVHhxZE5FRFo3bnVVVVdaR29IRjBrSDZrWWdjaE1jMGEvOFJKZ0M4byt6?=
 =?utf-8?B?bm9zcEdJV0czS3c2WTdxMmtyZzdQalFJWjFCZDRlUEluVWZEN05TTzFMVTRu?=
 =?utf-8?B?cVJuMFkvNFAreXFINUZuYkE5MjliN3oxWnlCVWM5YUhKNVExZXRYblN3UWtV?=
 =?utf-8?B?aHBUeWZYc04wWlhaSVhLdWY3cUpzZ0VpalNWL3NESVZYTUxleU5mQkk5MUV5?=
 =?utf-8?B?anVRRVFtSGp1SzhtaEFpMFRaZVlhaTM5aFkyU0pra2JJUzlpZEg3d0xFUGwv?=
 =?utf-8?B?U3MwcGFvTUk4YzRuOWZ6ZXo4T29vTUhZQkp2NlpEZlUrc1Q0WW9kMjMyS2JX?=
 =?utf-8?B?ZEYvb0xyTVJBN1p5c0lsRUhZOXlLZTF6TzlNNXRGWXd6U1dIOGJrUkVzdmxJ?=
 =?utf-8?B?L2tEaGlraG9uUDUxck5hdG45QlVTWkR6VmZZT3IrUEJSUytrWlZJZWMrdGox?=
 =?utf-8?B?NDBVcjltZUplS2lRU29QYVh1SzhJUVQxSy9tbjkzYWdxb0hqNUFCYjhMWWxF?=
 =?utf-8?B?a1dUOUNkdDZhUzZxMVdLV1NuN1FDV3YxeUpVd1dCRXFrbjU0a2x3bU9UZVZj?=
 =?utf-8?B?Qjl2MUtVMGRVTEVLVWpGaGNCdDFjQVZJdk96NW1mZlB2Z0I1SzM1K0k3NGlm?=
 =?utf-8?B?VWxWa0o1aXcxWmZWUUJadkhLa3F5QXNvRGNLM1lGUXpNT0NnSXRTQ1p6UllP?=
 =?utf-8?B?aGlNOFErRElhaFFteGgwWjdNeUVMc2xZancvZ1cyWnlhblFjNHhGU0VudXlw?=
 =?utf-8?B?QTNqM25DTkV6b3IrTjBqTzN2dDBNR0NvalhmNTRjWitFUVJkbTdUemRGZnRQ?=
 =?utf-8?B?TEl5Q1pVNXpNT2hNTWo5cTBROXlFcVp4SXJxakRZUkUvNEtscEtJVHBZYlFo?=
 =?utf-8?B?Z2MwcU9yK1lYdVZoMmNGWkptaFdKb2tSejlhNmRDWEQ4Q2o4dTJSalVnbzAx?=
 =?utf-8?B?ZXdBbHRKalZiSTduT0E1M2pOWTh6QTlwcERET1krdCtCTWVRZ1BqM2xhSW14?=
 =?utf-8?B?S3NVcVVzWVNuamVUaE5FUGFXa3VSalZsVlpySnBxNituZE5mUjZwN01nZElp?=
 =?utf-8?B?c3BUNElMUUh5dFFsVklGL093d0xTc05odWdWbThkSGJrYWRQaHFiRmJRWktY?=
 =?utf-8?B?d0tOcWRLRVB6dkR4bDBiMDMyVkp1U3ZkdjlIYWkxWHlmT1VsNWpNTzlCdmV6?=
 =?utf-8?B?Ukhtc2xxb3ZJdlk0UkNFckhQQm1RM2pkRjNuN1RJZGROa3MrZER5bzNZcTBD?=
 =?utf-8?B?VTdhUS9XQUpua3Z2Sy9jVy9zeWJZcVFWSGR5cXEvb2ZSeHAwM0xNQ0I4aWFt?=
 =?utf-8?B?MElrZHpoYlNwd2NMVUlmQWFkeUVEVFhXckFYdFJ1M3ZJT0J0UGNmdVhWWjRW?=
 =?utf-8?B?N0hmVG1ocG5sZ3kwMFF5SzFsNWZja0FIeFJEYURWbFFYc255L3ZhNXVwOG40?=
 =?utf-8?B?SVlIcGg3WlZMV2w2OVBpd1V2aFQyVWZHS1J4MHkzMmh3bFI3SHpvWTNPd2pu?=
 =?utf-8?B?NEQzYlFKTnhhREhMb2tjWmFFblpLeTg0WnRhU05GbkUvbEF2ZVhTdjFMK1RE?=
 =?utf-8?B?OGVYTzJOMmlOemg0cDRTN044VzJvQ0IwYnhaUS8zWnpWczh4MnhrNkVaRmlB?=
 =?utf-8?B?YWRHOTBQNTNrOEYyOStHMk50RGdvR0REQm5UY0IyZXdDbXFaZWpYMTVuWkJi?=
 =?utf-8?B?bFJjbTh5STNLZGJNeVd2RU1WRVZLVGIzRlNDdGZ6MnF6UnRZQm9KQjBROXVK?=
 =?utf-8?B?Q25nM0JhMFVnY3RRSy9HTEI4a20wc05OUC80bVhoZnkyNUFGWEdsR2cwWFRI?=
 =?utf-8?B?alVLdmFpSzB0SmNaTTdYOWhYRitYSFVUOVFRM2V2SjRndFhnNWFJdTNOMW5D?=
 =?utf-8?B?RFhUK3ozaUVhOFVRRytMK3JPZ0F1RmY1MUVSWVVrajJMV01Jc2ZGWVRGZGp1?=
 =?utf-8?B?N3B3RFNUZG54L1M2ZENlNW9XY1V6bWhEeUEybXBUaDVMKytsYXNvMWJSY3pk?=
 =?utf-8?B?dXNpRGJvMGxYZ0RvKzF4SFRSZVNCOHUvTFVsUHRGUGlWU09TUk5JTTYxQzFO?=
 =?utf-8?B?ZGdLbzIvZkpZcnN6RGEvNGJHTUx4VGkyb0pzb3VRWlJsUmpWUWlMTjAyQTdQ?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5288b695-69e2-4127-6fd0-08de1acbe303
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 11:26:52.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDZbFn5B3Z7Pbv4QpW9ArzKTs4JSshEMFGgAYSbudGN25oXTzpHHKqKgx65E71YfOimtO80BJK1O09Rc3UR7h24IOEd0vN9SqaTYmj0aE0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7231

On 03/11/2025 10:11 am, Dmytro Prokopchuk1 wrote:
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 0389293b09..d9dc9998e6 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -367,7 +367,8 @@ static void always_inline spin_unlock_common(spinlock_tickets_t *t,
>      LOCK_PROFILE_REL;
>      rel_lock(debug);
>      arch_lock_release_barrier();
> -    add_sized(&t->head, 1);
> +    BUILD_BUG_ON(sizeof(t->head) != sizeof(uint16_t));
> +    add_u16_sized(&t->head, 1);

This is an example where MISRA's opinions actively making the logic less
safe.

It's not possible for add_sized() to use the wrong type (as it
calculates it internally), whereas it's quite possible to update the
BUILD_BUG_ON() and fail to adjust the add.

Specifically, you've made it more complicated to reason about, and
created an opportunity to make an unsafe change where that opportunity
does not exist in the code as-is.

Furthermore, read and write atomic have exactly the same internal
pattern as add_sized(), so how does this not just kick the can down the
road?

~Andrew

