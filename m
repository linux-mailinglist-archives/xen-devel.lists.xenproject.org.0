Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MiCEir6gmm2fwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:50:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD14E2D47
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:50:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220113.1528829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXdn-0005I1-5j; Wed, 04 Feb 2026 07:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220113.1528829; Wed, 04 Feb 2026 07:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXdn-0005Fd-1p; Wed, 04 Feb 2026 07:49:35 +0000
Received: by outflank-mailman (input) for mailman id 1220113;
 Wed, 04 Feb 2026 07:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnXdm-0005FX-E5
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 07:49:34 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a3c99bc-019e-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 08:49:32 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA3PR03MB8256.namprd03.prod.outlook.com (2603:10b6:806:47e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:49:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 07:49:28 +0000
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
X-Inumbo-ID: 0a3c99bc-019e-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcCmstUOOfDQvPI8E7UswNU7YHS9ml4/PL2/vsCHfCaJyxqSWUQuCOg8laIjx5cmOsudWxkzk7B6tzDcW9IQUvWsoHyrS6n7/1kZ0mLnhxhhd/t5SVbjxf0/cYON652b7f00Uljl4IrTUVTYpxKXlv0iUl55id3tmRRM+erBQNVsFuVkAp3KeRluxxsbmAmWAanDJHrUTcgGCuMomjoNHsk8QK2kioQ9cEbJ65vyoRknzxQAPvzKhBDAMGnDThcw3vsVw0J/8ZIhlI55Ared6IItoU1Dhd0vTmS55BqKjSXCO9xV/9x1qqSva70Yetz3IR3ured49Y1SjhDnPRR4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yDVv4m53JsOaKZEkehEVOtiUXsS+b42I5NofGPbcHk=;
 b=xMwKA43aLNWOx2OAinRtqvv+mLbNHpRjFcIg0F2oCxZg/Q2QScJaw00sxMGHtQxNAmQ1P5O13zL/BxgI4ynuIqasZrtcGHUyxa+pgHXPlZkigC/bvRn5nSgG5cs/Yll8SuMViUdLEVIH1hnIoygJFApTMMHQOabeLlJK2XGBP8yiao73ZZ2SwT0IoEtP/hOXLS5X0nbUxTnUfiidIHh7XR3FB0PzjJ6A9dPB/W78harF/9DVQVlEliQsgti3oAHlDIkN2UnCIfVOgqCn0PLjH12QQaJ5QgHCjLlOiBa68FcSVjmZK6QuFAkx4O5uz2ti2Twodagemips0QBxMO4voQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yDVv4m53JsOaKZEkehEVOtiUXsS+b42I5NofGPbcHk=;
 b=DgL/jZG/Ry6nqkQIHdQWo1AzxEN3w36eOUELsEBDiHS2BtIJcgeGNylix/7IaXuB0PasfI4JSu/ct5PDeZyFmGn0rWV6NzRgn6rkDTeUMz38z9LnqHSP0dZxr8LB4Vpte6aHS6b8SuiDCSIgDC9MoTduHwITDN7dDdwmvVd3JvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 08:49:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
Message-ID: <aYL6Bt3Cs3HgeMPm@Mac.lan>
References: <20260109140747.195460-2-dmukhin@ford.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109140747.195460-2-dmukhin@ford.com>
X-ClientProxiedBy: IA1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA3PR03MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: b8371a61-04e9-47a7-1b81-08de63c1ecd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NENaL08vTTZpT1ZNLzBxRDJSazZZNE9HU0ZoemVHUTBVUWNHSy9HUHkzaDRO?=
 =?utf-8?B?aDZXdDczR3dYaUlXZ0NqakdrSmptVHFJYWdPeUk3R2FzLzZ6VDVPbHp3dWlu?=
 =?utf-8?B?ajArc3lnTGx5OVlFYzhKMUlLTHdCUmlnZnBtYlJmUnJPK2tTY1QyQnFQM3J1?=
 =?utf-8?B?RkU3SnlYZUhDb2pVVitjRUFYeVpCaSs2cjJCREJTOGQyS05UOCs5b3FCeWMx?=
 =?utf-8?B?NGdTTGJuaVJIQWttT1ZEd1hQOU94SERJblVIUFFBSkQ2ZHZRQnhqcVdldEVT?=
 =?utf-8?B?dzkwcFNPSldHNjRlNjJ2RzVzTis1bHhrNFFrS01JMVRLQ2dudzB4ejlDaWc0?=
 =?utf-8?B?RHZwTVpPdUk3c2Q1a0tmb2JPaXRWMEtJRHVDZmNqRE9YV1BJNHBzOWljSnpP?=
 =?utf-8?B?MHVzMXpyZ1h2ZXdhZEIzWmN4enpyWVJKVXhHakNMczZQcWVmNkplREo0K2x5?=
 =?utf-8?B?aHZ6eDNCUFZDelJUd1NVTUx5T1F1UEdpNGoya0VydnRPYkhlYklabU9vWnJk?=
 =?utf-8?B?WU5rYUJFUzJxdkJXdzJBbXVyaHlXcHMvZ2d5NEVuTWVVeFdxdVVtVlFSSFNY?=
 =?utf-8?B?b2Jid3dqTHBVNGRhdmJYNXhkTjJHRHA0OTBKQ2dYbTFrejJYZlFvMDJsRkVZ?=
 =?utf-8?B?NFlncDg4UGwrbUZPaGZ3ZnNxKzNHQ2ZFeWpydGZ3Z1IyMDUwVzltU0cwdjNa?=
 =?utf-8?B?K2FIRTYxaUpBYVZnNzVYQ3dvUm9LVGdKRUFBZFY1VWQzeUtwQ2hWYTE2WmRu?=
 =?utf-8?B?YlRBUkpoRmlhQmMxVkVNaEc1a3R5cFgza0JvMVRVUXlxaGREQSs2ZktDcTNu?=
 =?utf-8?B?V1hISFNzdndSaFNDSi85Nm1ETnkvWWpscmV6ZHZxTU9TZHhYRWt5dW9sejZ4?=
 =?utf-8?B?UlNRQVZRWDM4RytKSC9xYStpV1VJR0tEV1Q1M2FPWkwyWDdZVEMxWCtUVWJ6?=
 =?utf-8?B?endXdVhDc1orTWdUampZd1dNSFlUZytNcllUTUZRbTBKSytLQjlYNHp3R3I0?=
 =?utf-8?B?VFU4eHBXaE4wWXNGY1ZqSStBZlc4cUdnaGp2ZGdpeWw5OHZiWTMyWWxwY01v?=
 =?utf-8?B?aEhWaHhrWnNPRWVDMjZObEtrN3pQR0F5elVPOGJSN2k1djJia2pTYTNXN3JB?=
 =?utf-8?B?Q3hkS3M1ejFiMVJmY1NZM0xiUnk5djJHbEhUVS9OaHlrdkhHWTlpbm9NM2Yr?=
 =?utf-8?B?eXR1aXd5QkFwNEFTU1dWbVZFTmwzVmdjQnpsZkZ3M2ZVc2wxK0ZoU0dhV08y?=
 =?utf-8?B?eXNKdEFSK0M1ZEJhN1RMRndqMUJ3RXgyZVliT1ZGbnFNdTlPTWNtTS9XOVVJ?=
 =?utf-8?B?QXJ0T3NxY21EQm9GZll1QXpZS3M5R2JMUzgwZFI4dTlzVTU2aVcyYTBxb2Ju?=
 =?utf-8?B?OERZOStzMldmcitCNXk0MWd5WmxEc3VERENEbjZBckorL2FTY29ydmwrZFo5?=
 =?utf-8?B?bFhpZ3NSOGVXMXJZdnJvNi9FL2JCYk9tTVJMdThvb2I3UG5HWUJsWEFuZElO?=
 =?utf-8?B?UDZLWEc1SWpoeVRwakxQYlI2cHRjU1A1YXBsUWNlMjJCd01OdVdFNWt4czh5?=
 =?utf-8?B?ZkdDbDFEQWY4U0szbVpZdUFUYTl4ZUFkbHdENmNrOTU3Tnc0TXpYQ0dMSVpQ?=
 =?utf-8?B?ZTJXcnluTUx1dklucnV1UTM2aUJoUE1yWUZ3dk4xcjZwNVFsMWl1VUtpM2px?=
 =?utf-8?B?RExwWWJpUkJwM1N1RFBPRDJPMTd2VU5VY1BpcFdGNDhScllQcS9nb0FjRWF5?=
 =?utf-8?B?d2NOcExwc0srNGRNSWMrRmhyaGp1aEJ3VTlOL3pUeWcwYUN6aGxqZUlHc2Yw?=
 =?utf-8?B?UUQrT3c2RisxNTduZGZDRXlTR1VOZkppK2c0WGtack12L2krQm1GVCsrOXYx?=
 =?utf-8?B?NGhZM3ZLY3dGYnNsU2owRi92cGJyQ0txZUU0akdJTXV3QWFGSXk3OWIrLzQw?=
 =?utf-8?B?Rk5qQjE0UmFyb2NPbWNGOG5UUWtRM0xWanM0OGx3NDYzRGZub3d4azRMeVpE?=
 =?utf-8?B?dXhEQktRVjJJdXNBMmdtNEdrUmdYcy9RQ1pSUnYyd0QzMEFETDEzeFRQVHpj?=
 =?utf-8?B?Z2tubS9QUm9aK29QbUNUYmdNNUFFUGRmQnorR3V6RytjSE9xMjhSaGdCRWdH?=
 =?utf-8?Q?Lzw4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clhjbXJpMXNiR05OcnR2SmpUUEx2VExQckcrVnc5ZjJucDZrNjlTSGwxNWlO?=
 =?utf-8?B?N2l5WE42dnV4ZHNKTjJHRGliTTN0eC9Dd3EzV251dnlyVDNVQW5SR3h6RkJR?=
 =?utf-8?B?MEdOSzlJdXEzbTRWUHlOUE4yUjltQUw1Vm1zMnl0TXNGWXlXekkrNFNIQ2NQ?=
 =?utf-8?B?a2xjc3E5dEFKaThZaWN2TjFUN1h1SFRkVDI3SWJXamZudTh4TFcrUUxkdk5z?=
 =?utf-8?B?N3UwNFIwWDFpMkIxbkg4RzBDYnZyQkQ1aUtaTW5iMTlhc2JNVjJWNUViamRm?=
 =?utf-8?B?NXlaVzl6U3g5elE2OERMZHplQXhkVjBqV0hLdG5DdVFOU0VKMTdnRzlkTStr?=
 =?utf-8?B?SXBEOS9OOFpmcVFEREVjR1pReUFuaGs0QWsxY0VkN0RKS3NvVnRqTGw4NlNt?=
 =?utf-8?B?T1lRTDFNNUJGNmFHKzhQNEVteGg1NFN5R01ESXFmRU5WMmF1eGMzdS9Gb0g4?=
 =?utf-8?B?QU9XbmVuSmtvUWsraHhqZEpaZ0I0YUpUUUxMQkQ2OEcyZWtFT1o4aVVydU5j?=
 =?utf-8?B?TkFnYVNpZ1ZBbUhkdWlaVVVZUllld0QzZnhEYUxteENTUGI0eTI5NTQ3alZq?=
 =?utf-8?B?UGRHclRPTklhODJXdENiMDBKVVgzSi9pSCtaUFdOUUhSVEVQQXBYYWRxUVFE?=
 =?utf-8?B?VkROTkNHLzBlcTE3ZXVRQVJSRVVIdFl1K21QMmQyVXFsZndsTVdBcm01c1VB?=
 =?utf-8?B?YVY4bGc0cVF6cjBwN2krSkdzanlHWElETVVPditjMWJNdVQvMGFqTWc4K0lG?=
 =?utf-8?B?L3A4ZTkrcTdPYnpXUGREclVrU0RhVWl6YS9oUXg3cTh3dzJxeGVzQ2kvQU1S?=
 =?utf-8?B?M0NXV3VVS0RvSG5OTWhPaTlXU2phRjZnamNvNVRxUnlmRUNOSnpBeHlWTlRV?=
 =?utf-8?B?NW5RK3Jvd3lxdWRsdkZMMkpEdW80NFRQSVBvVWgxcDRTMzlFQVNkQVU0S1Fz?=
 =?utf-8?B?c0FoZ0RKeFFvSUE3YlEvTDRRWDZ1T0JqUzIrU3RjQXNZRkFIV0phNHBoZVRF?=
 =?utf-8?B?aUFUQUlSMzJ5Yy9FSEx1SVhCNEtaNEltNit2Sjd5RnJpZFFkSDJBd1ZXcGNv?=
 =?utf-8?B?QjFGekwyT21kd3N4SWRtaWZQVWpJTFYzREdpUlhQQlk2UXRER1p6MnBoaUcy?=
 =?utf-8?B?bDMzWHlmSnRKNEU1djg1ZmxzK2NqdGxqb1JDT0NhSUNVMnR1ZEVUNGtBTzE3?=
 =?utf-8?B?Vmk4Yk43Ym40MXBOOS9SUjdpWjh6d0t4c2tPVzdlOWR4U0g5WHpucXplc0Nl?=
 =?utf-8?B?UzUxREJ3dXQ3c055SW1zMzA2SXU4eXpOUENidUdFdEhNbk95TTVHVUpuVXhK?=
 =?utf-8?B?dlFiOVBiSFdXZS9QeFMycDVTcDNmeWxHRnpYUEplZmtSTjBBWlh6UUZIbmEz?=
 =?utf-8?B?WFhYN0JpVGJhTXJVSWp5U0NxVFVMbnlXMk5iL1E1Q2tnMzFFQWtvTTlEM1dU?=
 =?utf-8?B?MzE2Q1dnczY4cEp6ampmUTg0NmNFRzY0QnVaMTYxdFB0OHR2SWVmMGVzck1V?=
 =?utf-8?B?dG1IaGFEekNEcHRvWXVHS0RIOVZvSDRyZ2h1WTBsTFZNWHVBSjZlNUxvYnZZ?=
 =?utf-8?B?QXhYL0dobW96RkFjYzNkL3kzWklLMEVMMFJoZzNnV0RQVHh4bU1mbzlEblJF?=
 =?utf-8?B?MTFxMlA5Zlh1aWxuTm1xQkFGMjJlNktQS1ZrT0xPZmxwdlo1cTB6WHBwN1Zn?=
 =?utf-8?B?MWpORk1qZnZndFdra3cwR1lpdXF3MWRPNFhobW1IOUgwbTdBWnZnR3FqcHUy?=
 =?utf-8?B?NzJjd1l6bUR5NlI5N0p3bys5VnRnc2hrTFd4MDEwWWZwSCtkN3dnMC85dU43?=
 =?utf-8?B?czNUSXNzd25JZTNhaTF3S0J0THBYNnFwVlBKdUIwbFd3K2M0SDVsbytIOHNn?=
 =?utf-8?B?TVduaFdDa3JpTy9sMnB3eU95SEZjWFZ0WGdFNWIza00xcGpDSi9RQ2ErUi82?=
 =?utf-8?B?ckZWK3lEbytiR3NJZGx1bHNsYWkxbS9ZYXhvWHpQR0ZNRXRIUkhPL24xR0RU?=
 =?utf-8?B?QlJGQWptaER3bzVNaFh2RTBEQzRWeldEWWVQb3k4eDlydXR2NTgzcVpUYy92?=
 =?utf-8?B?TGJZbVlyMFpOSWJ3aTR1Z0pHc0RkajFod2NyR3cycUk5MitCalBJS28wMUFR?=
 =?utf-8?B?cGNBdjhTbEF0RDRJQmhxMTIveTY4V21vVFdGZ3poUzFVaTN6eGdkK0tNbmhr?=
 =?utf-8?B?M3lQUk5sdUN4cHdhNGhXbHRLVmlTVmxwMGJNenV1NzAyTzNlTGVKb2RtQkF3?=
 =?utf-8?B?M2IyZnhEL0ZQQkI4QVhqb0FzY1Z2Yk1JRTFGdWkyMHhUcEU4b1NFRGZXdUMy?=
 =?utf-8?B?UUMxaGdieDJwUS9Vd29jVXp2bXk3dVdzc2dZeVlSSDYyQkl6eDRtUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8371a61-04e9-47a7-1b81-08de63c1ecd5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 07:49:28.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msDv+i441yk2WHDoPIXCysehdENmLDqFHmSkxW91l33kc+5hI8IrigGqeHgpGxaEQ0NmsYrVW92kyA7hH+FIow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8256
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email,xen.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7AD14E2D47
X-Rspamd-Action: no action

On Fri, Jan 09, 2026 at 06:07:48AM -0800, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add a new symbol DOMID_ANY to improve the readability of the code.
> 
> Update all relevant domid_alloc() call sites.
> 
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - new value for DOMID_ANY instead of aliasing DOMID_INVALID
> - Link to v3: https://lore.kernel.org/xen-devel/20250924030630.122229-2-dmukhin@ford.com/
> ---
>  tools/tests/domid/harness.h             |  1 +
>  tools/tests/domid/test-domid.c          | 12 ++++++------
>  xen/common/device-tree/dom0less-build.c |  2 +-
>  xen/common/domctl.c                     |  2 +-
>  xen/common/domid.c                      |  2 +-
>  xen/include/public/xen.h                |  5 +++++
>  6 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
> index 17eb22a9a854..65da0d075a2b 100644
> --- a/tools/tests/domid/harness.h
> +++ b/tools/tests/domid/harness.h
> @@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
>  
>  #define DOMID_FIRST_RESERVED            (100)
>  #define DOMID_INVALID                   (101)
> +#define DOMID_ANY                       (102)
>  
>  #endif /* _TEST_HARNESS_ */
>  
> diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
> index 5915c4699a5c..71cc4e7fd86d 100644
> --- a/tools/tests/domid/test-domid.c
> +++ b/tools/tests/domid/test-domid.c
> @@ -41,20 +41,20 @@ int main(int argc, char **argv)
>          domid_free(expected);
>  
>      /*
> -     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
> +     * Test that that two consecutive calls of domid_alloc(DOMID_ANY)
>       * will never return the same ID.
>       * NB: ID#0 is reserved and shall not be allocated by
> -     * domid_alloc(DOMID_INVALID).
> +     * domid_alloc(DOMID_ANY).
>       */
>      for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
>      {
> -        allocated = domid_alloc(DOMID_INVALID);
> +        allocated = domid_alloc(DOMID_ANY);
>          verify(allocated == expected,
>                 "TEST 3: expected %u allocated %u\n", expected, allocated);
>      }
>      for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
>      {
> -        allocated = domid_alloc(DOMID_INVALID);
> +        allocated = domid_alloc(DOMID_ANY);
>          verify(allocated == DOMID_INVALID,
>                 "TEST 4: expected %u allocated %u\n", DOMID_INVALID, allocated);
>      }
> @@ -64,7 +64,7 @@ int main(int argc, char **argv)
>          domid_free(expected);
>      for ( expected = 1; expected < DOMID_FIRST_RESERVED / 2; expected++ )
>      {
> -        allocated = domid_alloc(DOMID_INVALID);
> +        allocated = domid_alloc(DOMID_ANY);
>          verify(allocated == expected,
>                 "TEST 5: expected %u allocated %u\n", expected, allocated);
>      }
> @@ -72,7 +72,7 @@ int main(int argc, char **argv)
>      /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
>      expected = DOMID_FIRST_RESERVED - 1;
>      domid_free(DOMID_FIRST_RESERVED - 1);
> -    allocated = domid_alloc(DOMID_INVALID);
> +    allocated = domid_alloc(DOMID_ANY);
>      verify(allocated == expected,
>             "TEST 6: expected %u allocated %u\n", expected, allocated);
>  
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 495ef7b16aa0..9130c38681df 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -842,7 +842,7 @@ void __init create_domUs(void)
>          if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>              panic("No more domain IDs available\n");
>  
> -        domid = domid_alloc(DOMID_INVALID);
> +        domid = domid_alloc(DOMID_ANY);
>          if ( domid == DOMID_INVALID )
>              panic("Error allocating ID for domain %s\n", dt_node_name(node));
>  
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 29a7726d32d0..e2c8990531ad 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -410,7 +410,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_createdomain:
>      {
>          /* NB: ID#0 is reserved, find the first suitable ID instead. */
> -        domid_t domid = domid_alloc(op->domain ?: DOMID_INVALID);
> +        domid_t domid = domid_alloc(op->domain ?: DOMID_ANY);

I don't think you need to do it here, but you want to check the
parameter passed to domid_alloc().  It should return an error if:

domid >= DOMID_FIRST_RESERVED && domid != DOMID_ANY

>  
>          if ( domid == DOMID_INVALID )
>          {
> diff --git a/xen/common/domid.c b/xen/common/domid.c
> index 2387ddb08300..76b7f3e7ae6e 100644
> --- a/xen/common/domid.c
> +++ b/xen/common/domid.c
> @@ -19,7 +19,7 @@ static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
>   * @param domid Domain ID hint:
>   * - If an explicit domain ID is provided, verify its availability and use it
>   *   if ID is not used;
> - * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
> + * - If DOMID_ANY is provided, search [1..DOMID_FIRST_RESERVED-1] range,
>   *   starting from the last used ID. Implementation guarantees that two
>   *   consecutive calls will never return the same ID. ID#0 is reserved for
>   *   the first boot domain (currently, dom0) and excluded from the allocation
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index 7f15204c3885..b5789c32ae1f 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -608,6 +608,11 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>  /* DOMID_INVALID is used to identify pages with unknown owner. */
>  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
>  
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */
> +#define DOMID_ANY            xen_mk_uint(0x7FF5)
> +#endif

I would attempt to word the comment in a more generic way.  While this
is now only used for the domain ID allocator, it's likely to gain more
uses going forward (Juergen already expressed interest):

"DOMID_ANY is used to signal no specific domid requested.  Handler
should pick a valid domid, or handle it as a broadcast value depending
on the context."

Also, I would remove the tools guards, I think once a DOMID_ constant
is allocated it becomes part of the public ABI, and it cannot be
withdrawn.  See for example DOMID_IDLE: it's only used internally in
the hypervisor AFAICT, yet the define is fully visible in the
headers.

Thanks, Roger.

