Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5232EC0C5F7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 09:44:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151449.1481980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDIot-0002Q3-9x; Mon, 27 Oct 2025 08:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151449.1481980; Mon, 27 Oct 2025 08:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDIot-0002OW-7F; Mon, 27 Oct 2025 08:43:15 +0000
Received: by outflank-mailman (input) for mailman id 1151449;
 Mon, 27 Oct 2025 08:43:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vDIor-0002OQ-TW
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 08:43:14 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f793a3c0-b310-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 09:43:11 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DM4PR03MB5984.namprd03.prod.outlook.com (2603:10b6:5:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 08:43:08 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 08:43:08 +0000
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
X-Inumbo-ID: f793a3c0-b310-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJ7QVMsGvS7ex7VgB0VgoDeSFc8SlqhAawz4w6Uj1PwS0nigov8ycZIX0ilFTNA6zXcw7pEwgz5WM0ddaKe+wfi5yUlFqEpJHFZso18VnyhP6TbdWqhDC6uwXrUBZBMRi0OYollI5KIGtL64Hpv73QSLbvHbYi3UFj0BbQU/V0UNPPHn5AYUSbtQpgdfenqcOp86tNhPFzMKcGCg8EtEvOQ4y0dqoXenuQE2Vj/Nqoj7/mION4SNg86gEzCy33+Mzk6YBBd2LWWQAvar3WTjTs6IVioGvdX06u/HXpKXTAN6qVqMFKZFxH/VrP0S+cOEfFJX9mX4NmSqwGuVwJ+FwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/7Z10zYOAsa/TEjiw0CG+ZreGNRAvcNEKHiSQlFDO8=;
 b=qrr9zgTtYfpRWvD235+Mbev9cdgbcDz0//tBqOOKACRq643eyUx5GHfbZQea6s0U9TgUr8dP983CBXr64T3MwbSgN6zpYTwoRQGIQpi48XkJmr+HPmDxhvXW1SUyZB/JX0Ftl27pRRdnLpcYCz/nk2TdzM6WH2Ygi56D1T8y8OH1/aQpvrgbJwhqwBxQqKu0XKiVwoqxQR/m1qEhRVR2As2VXSqXg/kIJvRMDuqvmLPSmgbzFRa42L6xrSHQPC1h/XlsoDFVtWIChoz3mQFuK3Ie80bO6Fk41a83TGD6RjFSPWgKf8YED1KSdct6lTgifGs9c8tWYqUdKgeOEYilPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/7Z10zYOAsa/TEjiw0CG+ZreGNRAvcNEKHiSQlFDO8=;
 b=nUsCNlwUFs7Kh0+iVaWQ530FOOX6f0Bi/MtF/D77ExmC9fnfF8x9qS4g2VggLStcRVetXHuS68+ARvJmYMNhnTBa/UHw4F2inV0uzFZYCFBNYX8uVvJxYJNwuy9yAm62aH8ULT9atpJhOAfT4ekfWl41kfXUu7hzYLlSvV/2gBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Oct 2025 09:43:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/pci: prevent infinite loop for faulty SR-IOV cards
Message-ID: <aP8wmPXdt7gsb8cI@Mac.lan>
References: <CAHt6W4dnM1pLMnDVyywc_2d-6nry7pFCYomSvRjyuH7sRm0J4Q@mail.gmail.com>
 <72a2f002-23fd-4d06-8c44-3e535533bec2@citrix.com>
 <9f202cce-71a8-4f15-967b-b2b109959c2a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f202cce-71a8-4f15-967b-b2b109959c2a@citrix.com>
X-ClientProxiedBy: MA3P292CA0007.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::13) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DM4PR03MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 919fc285-74fb-4aed-c911-08de1534da2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkVVdDZlOHBpbkhCRHZkVXhMS1A2OGUydVJXbUNBTytoTmE2a0dFbHRIUE1h?=
 =?utf-8?B?VUpKcGpyQWNHRlFNaWtCWHJPUHl3eTkxMUVkTlJrMmVsTkdWR3dtUGVhQnhJ?=
 =?utf-8?B?aFQwQ1F0OUxPUUwycVNUK2xqUUNVN0tyNFc4QlpxV0RVK0VIMmZvSENXYjhN?=
 =?utf-8?B?a0tXMlRYdko1aVM5UGMrL1k0OUR5L1hPdXhuMnB6aXZMbzRRSXo3RlQ2M2J4?=
 =?utf-8?B?VUVyQzlJQkVuUDhtUG5nczBSYXRqdW1qRnlyWWRYWDVlOG1MMjhEODNMSlFp?=
 =?utf-8?B?d0pJeXpUZ1ZSTTlYblN6TjBNWk5TZUlQNmczd1FVdFBlREJubUQrcnRFekIy?=
 =?utf-8?B?RVNSUFVHU1IyeW02M25kTEdTbUllUGJqZGZyYWxCMzd2UitZY3lZQ3RtY0xw?=
 =?utf-8?B?M1VENithU2U1K1dsWStnMnpiTGk2REVtOEpRUk9aa3Q0SHFJYkMvcStmYUg3?=
 =?utf-8?B?cXNKZ21JdG9iSU41bWROdjVOS3lVRGd2Sm5OZWtrZy9lTVkxeEEyQ0NCemJZ?=
 =?utf-8?B?TVdVQ0xBbG4vNHgyTTRkUFhxRTVjMkdSdytiVHU1cit3M042cXExK3FDbmgy?=
 =?utf-8?B?enFLRmZ6MVp5VHQ4d2hrcnloN1RqdnV5VDM3OExRS1pkVFpFNHhzdk16Q3gv?=
 =?utf-8?B?M0k4QUdJOTVYcHZudktmcEg1STVScE9KRDJITDhWV1RQSm9ZWW50UzVYeW9Y?=
 =?utf-8?B?UnJZbFlGazF1SXFaaUlGeGNOSlhCRlFYQ01jMW1CeHRQQXprUUZ3ajhubGJs?=
 =?utf-8?B?WEZhN1NVRmx0YnYyYVlRbCttUlBsY0VuVXFzTEN4azJQSnQ4alpNWHJTMWZn?=
 =?utf-8?B?ZkNCbVBmaFhSZm5JR0ZuemwzQ1lNL0RjV0R1SFQyTGJQWW1aK1Rtczlaazly?=
 =?utf-8?B?MkR1bzZZaHQ5R0lxYU5OLzZGcDc2bmRhODY3Q3BmNWxadVc1WVQ2UVdwOTl3?=
 =?utf-8?B?Rk9JNzQrM1hYeStTd0RXZVlSSklTTzBXOTNZbG5Jc2s3MjlGUjhlMlFOREd0?=
 =?utf-8?B?Z0dJV1R3a1YxRGpFdmlvNGhnYTZPK3c5U21KdFBoMmt3akt0S1hvVmttb25D?=
 =?utf-8?B?SWp6U3pndnBoZnlOSUhmRlZlaThLTFhqWmxUSjhvNTYwNHNUaGVzS1ZGYU9i?=
 =?utf-8?B?NU90VUtUU0FCZUJ5eWdvdnlnZURqNW1qb2xEYndTc1hnRWQ3NFM4YXdNMUh0?=
 =?utf-8?B?OWJYcWt5ZVFDdUJQY0IreXIvK3AxV2d2UmpwR1FNclhmbEZsOXhlSDA0dVU5?=
 =?utf-8?B?dlB2NHY3SFFIU09zQ0xDTWNpbU5TTDVRako1ZlIzbG1QR01UZUV2d2x6VG5O?=
 =?utf-8?B?QnNKNWF0Q2EyQUhDUk5EczNqa01udWZKSVhpOElOd1luSkZ4dE9XV3JWTHBt?=
 =?utf-8?B?eHU3Zk5TNFdZOW10ZG1VbFhMRzhtOUE0SlRXZDNlejNYZ0ROSkdWd1kxM3Jv?=
 =?utf-8?B?bmUweWs2WU40Z2I0dEJrM0ZoRkZBdFl0UXhDZHhQNFlOQllJbWxDTHloT0RM?=
 =?utf-8?B?VFVoTFVjVGlpLys0UlBQSThRbXdUcGZOcFlHa1hBWUFlNzZPSW1LSVE4YW52?=
 =?utf-8?B?VXFtTERPeU4xRERKdk53UHpqMDlvU1hETTZwRkovcmp5d0lFWFFqem1MQUZT?=
 =?utf-8?B?TnpaejVXZnpOeUMrTkZHbXJpWHNBd3dSZXFreXdkTEVZWlFkVEFPbDlSSUc0?=
 =?utf-8?B?QWRvV0RMZ1ZmaG5tUWIvNTNXQXR2ampld3BNNUVOWXk1RFdJNVU0eGlRa0E4?=
 =?utf-8?B?VTdVNU0xL3IzZjgrVjVjbHBoWWs3MDJkVzNTc1VvTE4vWm1Mcm42WXlVYWVL?=
 =?utf-8?B?ZUZQdzFXK0RQdWZzUTg2ZDFYNjVWUFFPUUJLNXVzMHNYaDZ4a2dsSGtSNUdH?=
 =?utf-8?B?dCtJTkhNVlJRSUlxbG1uL1IvVlpnRTkwR3QwOWJ6NzliT3BhVmMzQTFTRTN3?=
 =?utf-8?Q?GLf3UB9R3Qwa7ejH3vOjCn6ct+zfMF7v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlRkYVdTcDhrc1R5ekxvWThtajl0ODZGcTdQNVcxeEIwL1FUS05xcnJ5YzZE?=
 =?utf-8?B?SjNPTlBOc2JBazNwVWdSY0VvM1k3SVo2dkJkVU5qV3NySnQ0OWlFc2xFMnFD?=
 =?utf-8?B?c0loL3FzOGRjSkIxWi90NTlPMmpHTkMzS3RWSnN5UlI3WEhYL01QenpDNkhw?=
 =?utf-8?B?THBqNEJCV0RmK1REZUJtUVVudVR0RE84U1FZZi9hU3MxRFV1OUkrOThWTEZn?=
 =?utf-8?B?NkNEVVlEZ1hYcXJubWswdS9UV1hCb2dOL3E1bFR0Y1pQd3hTbE5tZTQ3U1BD?=
 =?utf-8?B?cXVCM0I2V0E2eU92QUQvU1NjMFl3MklrS3JCb3VsVXNyMkRnY0tPVktCWjV5?=
 =?utf-8?B?NzZQd0p4ZCtmQ1l5UHFCeGlubUJPeHNLUXhkY1FFZ2hjN3UyV1g0ZkwrNnNB?=
 =?utf-8?B?WjRVU0gyRmRPVFYxWVN6MWNGMS8vUVZRd0NzN294REFjK3M4eEMwWHNvd1Bx?=
 =?utf-8?B?U2tTdDRnZk5XOUxUczFtSjQzVWFRZG5vcjhpdGYzK243dlJsNHhNY1Q0RjE5?=
 =?utf-8?B?OEIrV0t1emV5QnJTR3VBTWJtUTU1T0p2SUtkS2JRaVdwSmlrRkFvdVRXa3JJ?=
 =?utf-8?B?R0NrZEpVWFFBRGJvT25WZVBNUzAwTWVkZG84bjZmRnlFREp1Z25Xb3NZSWkz?=
 =?utf-8?B?emEzU2ZlWDBtL2pvaGZFOXNQK25rRXZabzV2b2NRQkpzRDBYTGcwMFFGTC83?=
 =?utf-8?B?TjJ2bW9oaXh3VHN3czVmZzJlRkozWFhncHdyalpsbmtWTGVDam82TDdVc2J5?=
 =?utf-8?B?ZlZ2TEhYSVJKQTZJL0NOK1RBL3FsZGhLYVV4TFZRUVBKc1Q3V3dGQlR5OE1z?=
 =?utf-8?B?a2VqNCswbGxzR1pxWHRWeVcxcVkyWGtzOExKTWk3dis4d2drTnFqRlBWUnpQ?=
 =?utf-8?B?MHA0Nzhyc3ZvTVFFTHFQa3UvQVFXd2lqL1hxWlBndFJwaVRiNkNGRVZvR3U4?=
 =?utf-8?B?QkNOblNVcllLRVZ2OHpLVHpJaWdpc2M3MFd3MXA3TUdRZGZYNXFGa2pIdEUz?=
 =?utf-8?B?TGh0S3ZvelB1LzRuaURjbXJvblkrZ2NFend1SzExNjVSUklGYkNBMXFyQ0VX?=
 =?utf-8?B?SVczc2ZEVFpmRUpUdkNMOUhXZ0dZSlBUZzVIbnVac1ZzaCtXNVhGKzJ3N0JD?=
 =?utf-8?B?WWprUSs0SVpYaGFlWHlnbTIzM1BlMmU2cmFPb1d1dzM2Zmd3ZlFjMlAwMjhT?=
 =?utf-8?B?Q0pxZDNINUVYVFk3ckV2VUErd3N2ODROOFFWTWExVHBwbTl6bVFuWjYwR0JJ?=
 =?utf-8?B?Z1JRdFBvRkwwZTZEMXR5d2owdldyU3RKMDZ0a0hMSzRnT1NjaGkwTUh6TktX?=
 =?utf-8?B?czlIajRlL0cvN20yZHJvUVpMNHVEY0pQY1grTHYwWXlGRG94WGtnWGFTMDFm?=
 =?utf-8?B?bHdmajFEbjhyTzVGa3BmY0R6QnpPaGE0REJ5cXRPMHpITGFuS0NsS2N2V2ZJ?=
 =?utf-8?B?OHhlMkRkVWZkL0pGZUtrYWZzbHhGbVZ4M0JhQjBKQXl1b3hCaWx0K2tPNlVX?=
 =?utf-8?B?R254MzAyL0YwTG44bTFHYStTU05TV1U0K0tDUllvMTV1OVBtVE16VzMvQklr?=
 =?utf-8?B?MUx3QlJEMHB4REh0bUV2ZGw0RktmdDZJelpocVQ2ekJESzVwYTN4Q3dhL2tD?=
 =?utf-8?B?VlhrY2k2QkcxWHVtSjZ6SzdoVmVUN2ZGSFI5M09NaHdBZE9nd2hjcHZ6d1R6?=
 =?utf-8?B?eWY4alFMQWRvTGhzMmFEM2wwWmJMRmJXU0hOdGdOQVZVeWRPM0VzekRkd2to?=
 =?utf-8?B?WFNPQ0Nkc3Q3RHpNeldZczgrWC9PdHRmU1luNlJSNEJ1SWxwYU5XQkpIYWZM?=
 =?utf-8?B?RTFUZDBSaWpaQjNqS1F1MFQwZFFDS21xVVZaaUNIOEp4YVIyNDF1WEtOUXRB?=
 =?utf-8?B?MTkwQU1LVGU2dG1IbFZYcHJ3Yll0YkxNZjFtRmJXWWlpaVJIek9VblRQUnc2?=
 =?utf-8?B?Q25OeEFkdXE5OEZSMi9UUjM4alJWb255a3hwV1FGVXUweVNFS1ZFVVlrMDhG?=
 =?utf-8?B?L1Mxb0ozOUtpYXBDMGpmVkxzZEt4Z2s1bkVJU3ZMNEtlOXozNmR1ZklTRGx5?=
 =?utf-8?B?ekxEWWowZ2NiODFxcVF6YXlYSzRURVZIcHArMW5vblNiWXBmRHc0UTk3V1RV?=
 =?utf-8?Q?+2IlNaFVr5TWmPfjM25Z395n/?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919fc285-74fb-4aed-c911-08de1534da2a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:43:08.3347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajSdROI2nsOlh1y6sqWdKCQQFJGYzUWuRYjPeQyPnTXRpVXy9TCn3qCBZHQr4O3Rhefx+3b5jrfEFZmFR58hIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5984

On Fri, Oct 24, 2025 at 05:00:34PM +0100, Andrew Cooper wrote:
> On 24/10/2025 4:58 pm, Andrew Cooper wrote:
> > On 24/10/2025 4:13 pm, Frediano Ziglio wrote:
> >> If a SR-IOV card presents an I/O space inside a BAR the
> >> code will continue to loop on the same card.
> >> This is due to the missing increment of the cycle variable.
> >>
> >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > Yes, that's buggy.  Was this from a real card, or just code inspection?
> 
> Sorry, sent too early.
> 
> This was broken by a1a6d59862f4 ("pci: split code to size BARs from
> pci_add_device") when it changed the loop from having an increment, to not.

That was my fault.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I think we want to consider, this for 4.21, what's your opinion
Oleksii?

Thanks, Roger.

