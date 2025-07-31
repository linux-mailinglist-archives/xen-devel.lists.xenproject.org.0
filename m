Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7FAB16EE6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065290.1430735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPpc-0006Gp-HH; Thu, 31 Jul 2025 09:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065290.1430735; Thu, 31 Jul 2025 09:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPpc-0006E1-EU; Thu, 31 Jul 2025 09:44:12 +0000
Received: by outflank-mailman (input) for mailman id 1065290;
 Thu, 31 Jul 2025 09:44:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XXc8=2M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uhPpb-0006DW-44
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:44:11 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8106a0c-6df2-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:44:09 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB9863.eurprd03.prod.outlook.com (2603:10a6:20b:53d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 09:44:06 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 09:44:06 +0000
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
X-Inumbo-ID: e8106a0c-6df2-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABoOhfBc02Y4hbeNrWfYfWxCvzoWsYVX3r43u1mT8KtYp6LpcE8hiRbq5mqgzGq/3K33VnwkRAFA0t9WdKXw1PNXeSIVrPNeGEUxvSoB2l6u+vHXyVv8Jjd8FPoJAWm81Hgnf2VguS/904te6GhyNqvZ5N4c+w42qYpktKw5HAW1uF0K7yJR9qmv6ABxRw9x0g3b9yAD+jXemHZXmWSglsdZlt0luaE7igl9U7YtRo3Nyzfw3COnIzjozYk77arWbSS2Jbz36tcrtpCGfXRmjsQVP+f930YtkAjVQpdC0PjWfHD/qS1rnzPtu7y9vjiBicK0mqDwhGrJfo2j8ByP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OY9dFuUw0RlhET8v5X3xIK6bJIoUGEJqfIYBKVg+qJQ=;
 b=kk+0eFFXjR6bS4Em2/9a/KjrBtcImKow7UQIyIkEwge3hXJEALCbcB3E6/q7C9G3FdJK6pjDM8SdxPk5P6U33slURYJgaa/8q4XYZuqUHPuOCYaUt+BfTDucxsn9Hr+j7aHsY5w9H7AKWMTv0ug4kjaWKnrfhTwWtZstPAO7lXAtaYHg6V3iF1wsVVnQsFOyWqnH/Bmae2YtlfXgzpVcy07+sdybLKJHGRaYLy5/KFHF1PNhdgHseKCX3FpSJCOtjq9O4aQZ/CbxP29V4k3YvN9PSDaOXt03Hp/zmIBT2++4RMVo1kachQrFnTYX1Dgymx5Ps0r1Tlt7yVQiRxz+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OY9dFuUw0RlhET8v5X3xIK6bJIoUGEJqfIYBKVg+qJQ=;
 b=D9R8GTw0b56EvyRKoJ8fs9/vuNgIbsWywVUtzj/Erg8E2WVyRnXeFx///7nFhj9jaUmbK/te/kZM9QXzucKIzOwH5MUeB1xQvP6axUmS2lM/jmfPn6rCYczoU0Mp+j9Wogem0wS4vc9qHZM7K6nO2u5SrLEsEOLyasHeJm/yM3TMrF2NHH0X8B3ju3Wpibk3xCT7NwuIKo7i//qC5x7mirvyXfNrWakeCF7mObZZ3YAwhBlTRfoyhRgOkAJX9I7ijeBgiuuIYG6ASCTh649xjysu+gPEE/QAn4Q33DliNFWfoBRj+RmFb6/AnjDlt88TKkN+Ihwz4rXoK57Fm1twrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <031cd4a7-f865-4ab7-8b40-885d8be20d90@epam.com>
Date: Thu, 31 Jul 2025 12:44:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 1/2] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <f1605fd9-4e98-4ab3-8fa8-ed52b0f76b56@suse.com>
 <614706a4-8bb8-4c40-aec8-3031ec465ae8@epam.com>
 <549a1bf2-f27e-423c-883f-6d50c576f00b@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <549a1bf2-f27e-423c-883f-6d50c576f00b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0347.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB9863:EE_
X-MS-Office365-Filtering-Correlation-Id: 38593a07-2197-461e-7091-08ddd016ca66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzNWMWZxUHZSK3Fib2Z3ZWhPQitzSE9FdExiazIrdTI0dHhTL1hFdkJURTJX?=
 =?utf-8?B?d2pzdXJKVkJpdmkrYjUyL2laYmhqVTh6aHlqY3ZqWlp4YU1HMWc3bkc5NUYr?=
 =?utf-8?B?WUZCdkhVN210MnpsUllPVThzby9XZFdZNHIweXY4amRrVDhEaTdLcUFXSTV2?=
 =?utf-8?B?Q0wrbWxPQjBtd2tRYS9QSmpFaDhEOE95Skk3QkgrdXY3bFBobGNvK2ZBV0tz?=
 =?utf-8?B?K1pNNi9FVStld1Zpa1c4SGtBeFZubW1hUHVBZWZySi9NN1hNWnVPTm13dWxa?=
 =?utf-8?B?OXYxd1lrM1NFbTR4R2srSnZBWUFtMENnZk53UXFEdUlCMXRONnhHVTJXV241?=
 =?utf-8?B?VFpZV2VQc0pLWFVQVzA5Q1NXbXltNXdmcFJRaFBYeTBmOE15Y0dZa0QrNlZL?=
 =?utf-8?B?U2xSY0ZIaUo4MTluMlpKKzdsT1JKR0d1VjZPVXoyVnRkeHhXdmxqcmJURUJk?=
 =?utf-8?B?QkJ2WjhjdWcrU2ZtMkpHMnN5VGZtMXpWS1JTY0dVeHFLaWJkTFF0NkdpSXpT?=
 =?utf-8?B?TENrYnduL1Z6U1FLK1l2aUx0Qk9qcFV3MW9mTEJCTENzSlhwV1JnTGpId0lz?=
 =?utf-8?B?dHVPTFI5UkFta1pGL1NVOFdiVWNET1R3aGhWUjFsSUpaQ1JJRHVqc3RYR1J3?=
 =?utf-8?B?Z3hJb1JrMW5CMGZRY3dvTmFlVkZ2L1RTVkZxSU9xUWpzclhnbUNwbTdqUWk0?=
 =?utf-8?B?dHJxRnBCQzltN3V1R2pMY1dtY0N1TzhsMlBwZGFxZkUvdmhtZEFZNW1zQ3Nr?=
 =?utf-8?B?RlZIbG9DMmc0ZlczcnU2ZUR5Qm02VFRTMURTZXQ1Umd3TDdDZ2NRenZzSUY2?=
 =?utf-8?B?Q05oUDd4WWdzODJza1Ixb0xoM3Job3p5dzlaWmF4WkF2NGYwM0lsUXI5ZlNY?=
 =?utf-8?B?L0RxZTlyeEMzeTRUdkxIekpsTUVsV01QbXdFUUdrVzB3SXhQZ3A2QWFjU25G?=
 =?utf-8?B?RXNLRElEckZpTng3cmtwZDNXOW91d24zRUQ2aS9oQUhiaVF1QUJ6Umh1QjdJ?=
 =?utf-8?B?NEYzVEJyQ1RuWXpxanJVSVR2cVlMM0JYcUdkcWR6Z1JCelRJWWxUUW81VnVJ?=
 =?utf-8?B?K1k4UU81cU10U3RxRG9yYWVOemFnekxrSlFZakdBcGF1WDhwa2dUcmlYa0F0?=
 =?utf-8?B?WFRVUUlocGRMZmMwa1lIYTFRVGJoYmdYWTdQdnhPc3FpZjNDQ1FvSkVtZVBU?=
 =?utf-8?B?MFBybG00N1V1Sm43RXVkK1RZQmY1Ulg1VzZPVytBU2x6bzNXYWZWT0d4NjQ0?=
 =?utf-8?B?dzdhTGM5RHhZOFlJT09rR2FQbWowcHdjWHZOL3ZvMUN2d1F1ZmhGVHpJVHMx?=
 =?utf-8?B?amhPbFJzVDhWalkrZ3loYzh0Q21LY3IwQ2xwVFVUQzdLbnFnMlNoU0JiVjhr?=
 =?utf-8?B?MENHSFUzMWhpUkxjR1FxcjNCbEZkT2hsVlpzRHB2eE1jeXVzbDN3RVhvTEcv?=
 =?utf-8?B?K2FwZzZnQzBjM3grRXNZUTZPR0V5ejJQTnVvbEZYMXZGeHJPcEltYnRLOXRC?=
 =?utf-8?B?SDd5Nkk4azVHdWUvc3liNHVRTE1CTTlTZElHMm5kMWc4aXJSNktHM3RHM3Vl?=
 =?utf-8?B?VkRHYzBacStCRXp3Zmk3VGliQUdtMTdUOTQ1WFp1MGxYUWZMWXdwUFNlR0t6?=
 =?utf-8?B?RXN4MDUyZjVyYXFrS3Jad1Z0UWRRbk8yK3VVVHR2d0ozUmIyK0tlNG42bXFy?=
 =?utf-8?B?Rm5nV2lydEkyZFhQMUlGcEtRM01YVU93VWNHV2NmellqSzhDek91aW5peWlH?=
 =?utf-8?B?SzArczZEVjZ5cHArMXpOVkN4YjVjaXY2OGZMeU1CU1A1azhnMmVkelFRSFJi?=
 =?utf-8?B?T3RXT0hjZUVLc1dORHgwM09vcm9CRFlPZVRUQkNJdE1aZUROMVVlUVloN2ZP?=
 =?utf-8?B?SzVSTVMyQWhlMHY5Qzcxa3Y1MEFJako3SklhSEV1bGRhc1Vhc1lZK3d1cWVY?=
 =?utf-8?Q?AqkHjxRsE1A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFpvWHc3dlJzanZDaEJZL1ptV1pQZTJoT0pMWVAzdEtZbkpiajBaVGU1ZGxs?=
 =?utf-8?B?L2gzWHBGdnkrRkJGaUpmcHd4dTNOSG4wVWtueG43U3c3ckNMU055NTcxa2ZT?=
 =?utf-8?B?U3gxejlkVzdTWmtORExvbTlDNUY5aEdWUEwzUW15aHI1VG02WE0xMkZFSFd4?=
 =?utf-8?B?L1ByZ0pkbzR0STUyUHFEWlN1dVpEWjNYalU0Ymc1QWd0MkZKZlRYMU5rRWR2?=
 =?utf-8?B?NEs0UUVoSlcxQ0tqQ3h1TkVHd1ROdUpKMjJtZVlBSnhZYUp3cVVubzhwOFNk?=
 =?utf-8?B?cG5leDBaakVNaGk4TGd1QUk2RFVudWJuQXhSWEtacnQ3UW1XVTlsc0VNMURK?=
 =?utf-8?B?eVkvclZPOHJxTWpIS0kxcGpHNS8zV2tLZGs2bmtEVlM4UW9pTWZZeElPa1ZB?=
 =?utf-8?B?WU1TdS9OTSswU2t0RUJHNStxRDZSMlZHRCtxVDk5Z09XTDBmNjErYlFhQS9C?=
 =?utf-8?B?N1FJYlhIdTYzYkRUVmNOb24rV09TMkh0amVtcWw5SzBNMmswT1FoWTFYZWZr?=
 =?utf-8?B?U1BJZnh4WnV6V2c1cnFWRjNnTzF5U2cwMXNMTWdTOStpM2xXY3JHdlFWUE5a?=
 =?utf-8?B?KytxdU1IU0xDUVFUTU5KT3NsMEVObW4ycElxMnFDUjdacmlXeDBEa01NVzRF?=
 =?utf-8?B?cXh4cUs4ZTFpQ1hka1dPMzc1SmdEYzdTR0Vpc1pGOCs5blZhRFI4bzdDdURz?=
 =?utf-8?B?d3hFbDdHaEIvMTltTVdJVTlWZ0g5dVJIa0pPSmljdElTL0FZT2IwNjF6RU53?=
 =?utf-8?B?aDdEVyt5SkltZDg5NXdVMzNnZjIrSU5OVVNtdThNRU4vVnNOYVlmZ0Y4NDE5?=
 =?utf-8?B?NjR5WlV0SDRIbFNmT3U5eFZMZDZTZW11eStCQUxYcnFiYVJ2U0dmMm1FU2xn?=
 =?utf-8?B?QUdlSUExMDY2d0UycjEwTFF2dTQ5TDZFcWxzdUhUN1N1UmQzNUtLS0JDOXZ3?=
 =?utf-8?B?N08rbVhYZUNsM3dMNHU1NmEwY0FuRy9DbXMyeURvQWttZHdGcnRZUDM5Mnlo?=
 =?utf-8?B?eUpmQ0xxL2NDS0d5WWhNU01vU1hzM3IwVEtrKzZLQTFhaDY5QUF6Q1JOc2JF?=
 =?utf-8?B?eXlMbTlxMjhyb3hVMUwyTGxDekxXRk1jdU9vRmhnRjVieVZPWUFyanpuUll0?=
 =?utf-8?B?U2I3QTBkb3dadVhIb3R5QlZwTDdLUEM1ZGhlYVNZUlVIQXpkcXJFL1hBRlhM?=
 =?utf-8?B?dkJzRWs2M01JUmZRaGJac1BMMTNrMGxpeTIyS25IMTBpbDJENGc4dWxUUW8w?=
 =?utf-8?B?cnI2b1g3QmovdHpiN3FrTzZBTVBJM3UvNUF6clBlL2JlKzVEYU1qR1RCWk9T?=
 =?utf-8?B?cTJJNkRmTjgyMTc3S1dGbFlmS1Y4am9SMllnK2RFWE9Zc3F2ZE5tWGhZeHE4?=
 =?utf-8?B?WlF4c0NFb2FZNGR6RkNRZFJuY0RvTnpPeWJRMFZQZjZqOFVUTCt2OStWWGh4?=
 =?utf-8?B?RHhVTVBiS01GbWMwck1KRk9LRHhCRmhucWZGbmhDWFlYajJ6YzV0MTNLSzBC?=
 =?utf-8?B?TXEyNnN1dVY0NWoyZzNQalJUeEFyWkkweFhFTEJLblpLL0lUVFdhb2Y0cXlE?=
 =?utf-8?B?R0xIak1vbG9yd2lrSURnVFdWcXNZcWRDcUxSSkVBcXZ1d29VL3A1Q0xqQzQw?=
 =?utf-8?B?TFZCc0kyb1J6MkcvcjJGZGs0VTlKV1hXRUpLYlQwT1JiaUZ0ejZHK1V6cFBp?=
 =?utf-8?B?dFY0WWo3RFBJQnZDZ1lXSnlCeHhVaGZoRENDVGZzbUNiQ1g2TnRPZTEzMVY0?=
 =?utf-8?B?a3dpMHNQd0YzV0hYSXpDbldmbUxiY0Z2d0xaM2tBMTJxemYxTC9VOW9OcGQ4?=
 =?utf-8?B?aXQvRElaTkNXY2VlZ0VYNWx3TmlqNUNQekJCYVRHWS9mR00xSDR0THhlbks5?=
 =?utf-8?B?dG5VVWIySGY5bU5ETHRYSWwwVzkrVWMvdDFrRUMzajU1WERrNXN3NmZuQmJO?=
 =?utf-8?B?YjBlU3JqUnh2MjBrUzNId1ZJQkFwU0UzSVNNK3FFT3ZVYU9UcXZITnBHdlpD?=
 =?utf-8?B?Sm9VdEM1b09xWFZSemlOdm9jN3dBdzhaNFhiUzFJZ1JXQkhwcVJQRGxsZUFX?=
 =?utf-8?B?OTFmZzhWaEVqVTdabzVGNlVDWGYvbGJETWJMVTUvNUhlM0lRWGtjL3RmcFJy?=
 =?utf-8?B?TnIwWjZwaGVzWWhCeFZOUUhxdkYrdUVsZ3REQ3lhTER4ZEJYNDUxQkN0bERH?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38593a07-2197-461e-7091-08ddd016ca66
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 09:44:06.0905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hETTjP7Wef0g5v1VhUjc/K97raPSutN5N78EQ7ylkWLz4RZLjaGsb6ntSBrcOuFXBtaSvwG/G3Ag2cQU27D6x0bFN4rrTWyuIvX11YO0QU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9863



On 31.07.25 10:42, Jan Beulich wrote:
> On 22.07.2025 15:46, Grygorii Strashko wrote:
>>
>>
>> On 22.07.25 11:23, Jan Beulich wrote:
>>> On 18.07.2025 12:11, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> On platforms without PIRQ support evtchn_move_pirqs()/send_guest_pirq()
>>>> functions are unreachable (Misra rule 2.1).
>>>>
>>>> Move these function under CONFIG_HAS_PIRQ ifdefs to fix Misra rule 2.1
>>>> violation and resolve call of evtchn_move_pirqs() from common /sched/core.c
>>>> vcpu_move_irqs() code by moving evtchn_move_pirqs() into x86
>>>> arch_move_irqs() callback (which is converted to define).
>>>
>>> The patch title isn't quite appropriate anymore with this description, I
>>> think.
>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> preferably with ...
>>>
>>>> @@ -1707,6 +1709,7 @@ void evtchn_destroy_final(struct domain *d)
>>>>    }
>>>>    
>>>>    
>>>> +#ifdef CONFIG_HAS_PIRQ
>>>>    void evtchn_move_pirqs(struct vcpu *v)
>>>>    {
>>>>        struct domain *d = v->domain;
>>>
>>> ... one of the two blank lines also dropped here, just like you do ...
>>>
>>>> @@ -1722,7 +1725,7 @@ void evtchn_move_pirqs(struct vcpu *v)
>>>>        }
>>>>        read_unlock(&d->event_lock);
>>>>    }
>>>> -
>>>> +#endif /* CONFIG_HAS_PIRQ */
>>>
>>> ... here. Happy to adjust while committing,
>>
>> Thank you.
>>
>>> but please consider suggesting a replacement patch title.
>>
>> Honestly, I, by myself, not sure about proper patch title :(
>> My options would be:
>>
>>    "xen/evtchn: evtchn_move_pirqs()/send_guest_pirq() fix MISRA Rule 2.1 violation"
>>
>>    "xen/evtchn: opt out of common pIRQ code for arches without pIRQ support"
>>
>>    "xen/evtchn: fully restrict concept of pIRQ for arches with pIRQ support only"
> 
> I would probably pick one of the latter two, but as said - an ack is still
> missing here. FTAOD: It is on you to chase it.
> 

Could you merge first patch and I'll send cumulative arch clean-up patches?

-- 
Best regards,
-grygorii

