Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFBCCCDB56
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 22:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190266.1510799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWLe5-0005Qz-LS; Thu, 18 Dec 2025 21:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190266.1510799; Thu, 18 Dec 2025 21:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWLe5-0005PY-HH; Thu, 18 Dec 2025 21:34:49 +0000
Received: by outflank-mailman (input) for mailman id 1190266;
 Thu, 18 Dec 2025 21:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6E0R=6Y=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vWLe3-0005PS-SG
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 21:34:48 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f3346c7-dc59-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 22:34:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PR03MB8233.namprd03.prod.outlook.com (2603:10b6:408:2e1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 21:34:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:34:43 +0000
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
X-Inumbo-ID: 5f3346c7-dc59-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZ1IrAEqkrz+DpgDK4xOL1ZcexsQLywfmyd66+nuO9kGXMMvzEOkN6Cq0Sa7v/onBGXUpFcrtkI4kQHbOZWr62QycYzm4jQjbCwTByi8IljZj/LkzqIcGjFZhqutNtrQFEVdbpnZx/B4dga5vs7WiSN2YfTlcNHZxC292vKJe6xyqh4o/S7PZQBso447crFWBaNOeG4BnLOJReuk7kFW3GN8D867CjmUrXeTr79Ful4W7WJHGbKptI+cabCZFCGV5kUHnmwq6K6LfLfDdUEXJX0rRnw3FcobReOSDa4OOE1+cK7a82itYHxnKSAX2npHeL2lDH5nqvgV74kv0gARhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbMx2D5RQ+AK0UWiTpeI1pqmKfhiWejFXP1z+JCN778=;
 b=WsF9KFwLJyFHj5szLLCXEJk7yCVggV+zTMUysS9wn8tb6xUWKFNER/X7BCXM0eY0px2C3cgEo+DoqKDZhk8zlStDGcWCD/dZr2d61GZBvkHFARCpRo8OtKHESynIZT4UAQIgymX9owDY+P8pruaF6uXykYN6CxfPtlEf2Wh26+8iwnhonbQkDU8iWGA6bHoh2SRQy/cxFOfzjkm49Z4o+5RXwz04Udhn1g3dtjZ2VhpLrynrY3P1WYfCDTGYpe1rkqqwTVGQnEIUBwgFVwkGPJlHC4pMBPSQ8G/EEMaRU4UesgP2cYiBZmTQW8VCnz+AReujPPqy1Bw9e42DRqWpHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbMx2D5RQ+AK0UWiTpeI1pqmKfhiWejFXP1z+JCN778=;
 b=zP11GitFZ0NbIolcUfpCuBB7VTs1kwMcnocGJ/yFXrTP7fjspgiSAq5aLFWf4A6tCmiXJkRxAqwHqsBNsWoWLaAst44UBMFFdEjo9K2j6r6NexSvHCsBIPDVzkXCSzo7z35wEuVxTl+KUbnH+rK++0rCw209HSiuZjG/HB9b5Wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <70177c8f-63b1-4c6e-8b4e-52b7435e9197@citrix.com>
Date: Thu, 18 Dec 2025 21:34:40 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] libs/xg: allow caller to provide extra memflags for
 populate physmap
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20251218151728.28339-1-roger.pau@citrix.com>
 <b9e1d2d9-22c9-4574-9f83-46ab649d28af@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b9e1d2d9-22c9-4574-9f83-46ab649d28af@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PR03MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b61e134-3807-4201-a30f-08de3e7d4244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OCt0blRRUXAvVW1LOVdzSjAzUEt5Ynl1MUxZTWYyaExuYm5rRmo1akNyakdF?=
 =?utf-8?B?dWp1TVFvVkF3WlFKZElkSGR6dTZqYitCRTRTanNjTTdLMlJ0dHFXMGdRNXhv?=
 =?utf-8?B?OWZMZHVtQzRKZmhFT0dsNWx0ckhKWVhhc2k5VE00WTBEanZWcXR4NDZ3QkFy?=
 =?utf-8?B?UHdiY1Z0U0pGdUxON3JSeTJQQ2E3cDA2RURNTzJ5dWljeFRNdjZwMERPblI0?=
 =?utf-8?B?UllTbGErTEk5KzgwcURtNGc2TkNITUdEVm5XSk0vbElqWXpmM3QyWTdrSWxl?=
 =?utf-8?B?RWJSRVU0YWpoalcwVnd2UlJiSHFXRWdEdXVORUEySGtxcmM1ZG1YK2dPTkIv?=
 =?utf-8?B?T09Ua0x2N0lvdEZUYUFYZFg4YlpkMDVEd3BjZ0t0V2FicTZja1dBSGRuRXFy?=
 =?utf-8?B?QkJwdHlsZ082SW4zNHZlbEJabmVEZ0pCbm5oVE1qR2M4TjJLVWpadDhJenRp?=
 =?utf-8?B?TlFpeEtSbjFhTlJ4UXZQTWFTNFJ3MndzTC9jSnFLWC9Zc2xaTnRyclNkR0ho?=
 =?utf-8?B?RzdPdjRCL2MxTlVlalBWTFA0RGhPUWZkUEx1S256YzRPRXRIOHpsWFZkUi8z?=
 =?utf-8?B?MVlrS0Y3ZFUreDNBZDc1NDZieHZGd2prSWV0OTRzS3BkcTVFUXJSbXBlanl1?=
 =?utf-8?B?dU9xUUFlTkVDMkdBbnkyUTJvK1pCMXg1RFZ3QmVyazUreFR5Z0J4Smh2ZlpX?=
 =?utf-8?B?M09VWk9UVXlWSE9Qa2krdENUQXBWSGxZVFFIWWNvMlJGNHY0WEFwaVRrTkwy?=
 =?utf-8?B?SjZKWEJFdEowYmdoVXlSeE1SOVBRTWRTNGNTbkJxUTlBWlR5U2NDRGtzKzhi?=
 =?utf-8?B?bGZ0dnc3OHliM2ZzL1JFZDZKOGVMWGRzUUhpZ254cXR0aHBIK1lJcmtNMWI2?=
 =?utf-8?B?RDBOVzZDRXVCaFZIVExXR3FRd1Z2RGVxemplYXhFalFGUkRCMWhiQURCVFlM?=
 =?utf-8?B?SDhHZWNMeXUxTEFicDI3RXVRUmp2R2FXM0xnZ1A0VUp2a056VTBkejJUNCtx?=
 =?utf-8?B?VWRlNndhMTd5Q0ZkUmtQY1BJZEtNUWw5SndkNDc1VVZyWGI5eTU1WXZQSVd2?=
 =?utf-8?B?OWtScEtIUHlPWmthcW1lK1A3UGM2MUsrblllSnBKTkZ3Y0J1MklFdGVHak4v?=
 =?utf-8?B?NU43NFFJWU9WaVpkdktVSUxqZUN6cURyQ2k3TFN4aWF0SFlvZkh5cVBnVnJR?=
 =?utf-8?B?LzJKQTR3aXU2SmJHZldCaDVWY2FSOTFOUGI0eEkxNjIwaDlFN2dDMXdxc2Y0?=
 =?utf-8?B?azFkVkNEenFuMyt1WTFaZUJNQ2dSVW05S3pPRTBaWFo3Y3RDOGFiVnpFTjMy?=
 =?utf-8?B?cjh5eDN1TVlRdkJIUmRoNkRpRHlCOEFIM3FWaFhkbGRXQnk3SCsydHJTTm94?=
 =?utf-8?B?THBxeU1uZmxyRzVRdExVTmxzOG9MQTc1NVNtaklSZWs4QmwrVWFWRUYzSC9B?=
 =?utf-8?B?RlhNY1NMblhqaDlHRnprdjE5VmdRRGNMdEJVRWVuaU5QNkNmYmJSbUtlblVt?=
 =?utf-8?B?d0U1YjlzU3FoSWtUcGdUL0loaDBJRmRTT0sraUNoSkNjZ1Z4RkRZWjFYOTlm?=
 =?utf-8?B?MXZ4KzBuNjlKaVh4YzdSVmtVL2gzSkt2M3FhakFBanNwR2s4N0ZyeVNVMk9X?=
 =?utf-8?B?UzQ3MnhqcTJiKzhoOWNOTkRJZ0c3c3JGU05LMHI0VEtHNjQrdlZoOHlLZHJY?=
 =?utf-8?B?RG5TVjdIWDlmWG9ZSzZUb3lZYnJDYVAvWExIV3dyQlNLZDNPNDQ1SlV6emdl?=
 =?utf-8?B?cUlXcUI4RU9paVJXYlYwazZ3NkFZdk1pYzhKZlpZeDU0VmY4dXhQTXNMWVA0?=
 =?utf-8?B?ZEhBYUZEaGVVSmVFYnQ5TE5ZNk1ObGQxUlFuYmdaRTBQNjNnV2tYd3d2UzFY?=
 =?utf-8?B?R0xKQ21sOHBSaFp6dTZ3NlBQRS9vTlUrMG5Ocmd0dGNTYnVUNlh4V1NlVHlh?=
 =?utf-8?Q?3im1vKUYm4V6ACguxGbJ2M7IC0YQItxt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHNZSmZLKy81aXlWTUZvQXhvbExPTkNEdjRXTFRzUnYyY2hlSG8xS3I1dE5w?=
 =?utf-8?B?Y0hjNWdiYlR5L1FSM1hlRDlnemN0Z1F1K0E4VHN3eTZBTkgreVJsWEY0MVY3?=
 =?utf-8?B?Kzgvd05iOG9XRThWeVhoUHEvLzNpcDNJZWlXekx2UHhuVnVnVVd3T0F2ZzF1?=
 =?utf-8?B?QllhditSOHRnT0pBY0QxMlgrM2RKQmtjOXRiTmNIZUI2K0grYnFaVVVOcUVE?=
 =?utf-8?B?YnY4cXFERXpodVBxMWJRMWk4RkxoUDBZa0d1M2tJSitlT1pQbm1ERWlDSGZH?=
 =?utf-8?B?QmVFbFMrWXlQbUVGV0EyUEdQZXd1dUV4NVl3c01hcGgvV0tDa2FSbGx0bTl3?=
 =?utf-8?B?ZDFXL2pvUmZPb2pIWWdta0JhdjRMY3BLWU9JWGFvUUZ2L0srNHBLdmR1NkFi?=
 =?utf-8?B?aURmREt5ck95ZHpVdDhVZmtnZ2N5RWRzdVNyc2J2dU01UHJqdnI1Tk9uZFI4?=
 =?utf-8?B?ZFY3MnZSWHBKeElIcWdPT0FBbXBIdjRGek9WMElPdGQ1MWxBcHFhd3ZMbExa?=
 =?utf-8?B?VGNxTFBSZXNtOE9vYy9yRFNjUHZpWXRadmx2Y3E4Y3p5T0xlWjQ4ck5nMzVQ?=
 =?utf-8?B?YkxWN2d5YmJxdlhtcFIrRXFiVy9HTklmQjhWNk9qVmNMVVJxY2d1L0dZdEsx?=
 =?utf-8?B?eCthWW1CcVA4R2xXR0pXOTV3T2lYb1ExVDAycU9yZHV0eXArVWpuMjhKVno3?=
 =?utf-8?B?OEM2MnhvdzhZWS9udGw1cnFySHhzNXdyZVRZb2g0UmlxZGdqRmhscUJrZUNV?=
 =?utf-8?B?SlhHelB6aVFMYjlkOXc4ZS9jczk4WEJJR0QzMkd0emx4emdJMnREVFZLWXY5?=
 =?utf-8?B?YmttaGlSTy9PUWtnSmlDbmFOaktzVFBHbHhwUFFiaUttYlBiVGtrTlA3TU9I?=
 =?utf-8?B?czNIQzYvcnRyZXEwVHY4bFQrd3JlTHBuaU91TzU5cmV6ZmtjZnVpaTNSaWZm?=
 =?utf-8?B?SDdKd0VObVJqZFBXcTJTRXpISEo4aEZEVXVzRTRYS1BVQ0s0NnVUK0xIL3hx?=
 =?utf-8?B?bVlsWndGbG8zVWlrSWl4NWFQUzgrNVpYTitOMkhTR1lDUGpVNEwwVnVwbisv?=
 =?utf-8?B?RjZqcktEWTlvQUhkRHZVNmZ5cFJVdlRjM3RHMkh3QnM2MjRBemF2NW8vNTRp?=
 =?utf-8?B?WEo1MUZJRXdiVXFaNFlRbktGMlpwZ2NkQ21oWFFYblY4WTd3U1BUaGlSdnBx?=
 =?utf-8?B?LzNCYmdzZnk0RUc1M2I0QkNoTDI0U1RXZFpYcWZyRGpqUEZaWk9ha2E2S0sw?=
 =?utf-8?B?a2xmaEZyd2VmT1JoS0tKVkxqYlFBelBFVDJhVzNTbkhyV1VobEUvK242bE1T?=
 =?utf-8?B?MTV5TlNCRDVUUTNMcm1HSWZqcGlqN1dtMUpkVWNYZXRkT1hmK0tFSzhsMmg1?=
 =?utf-8?B?RUVaTHJzQmtCNlphQUtFZ0FuN1pyRHJiamlzalhhOFRGYTcwMWlPV1BoazRS?=
 =?utf-8?B?aGdqU0Z4ZExEZCtZc2ZqZHptMUp3cXRWZC9ReVN4QWFMaHhubHREc0VZb1Fn?=
 =?utf-8?B?Mzd6Yk1MWkJRb3J0WG8xZEUvd05JN0VsbXYwTk5wVEpKaXNTQnhleVVxZCsr?=
 =?utf-8?B?cnhCOE1zSXlMS3NMMTZ1bjErUldBTFg1LzkwbXBNaFNwREdHZXNMcS8vY0Zq?=
 =?utf-8?B?WWJkMG9PbU5lR3dIY1NEUkRJMk8wdTlWZXovcVNtZ25ZaEtHTFN0eStDVFFQ?=
 =?utf-8?B?VUV6NnRaRDVSaWJjd2RGUUFWU1g5RC9xdStqYjU0aW9yTEZvZlh2STNyTDZT?=
 =?utf-8?B?SFI2akppYnZtbVQrQ2ZwYTF4SGl3L2hxWVBQSTZ2TVVOUHJ2VUhTZmtLZk9h?=
 =?utf-8?B?Yy9oZ3FLRFZKTE92NVVhS04vbjE3aEp1VjU5cVJ6SnBSN0hkRGkzb0hLcWtE?=
 =?utf-8?B?bzFib3Z0Q0prdGs0UmFGc2J1OG9QQVNsL3FPYWYvYW5WRWZxaGpleEdtMHJV?=
 =?utf-8?B?OW80aFR3eTAxeWhJcHB3U2JwbWlGbXd4dVZlcTI1blpWMmZ1ejJqUnd2VEJa?=
 =?utf-8?B?aDFKTHlFZkdQMlZSdE9rMUIxVkdVNEVyY0lTWnJmY1p4OUFubzEyZ1Q4SGxS?=
 =?utf-8?B?ejJNUkxONGdrajE3cUNkQnNhcTJ3eTRZQnNLWjhjeG1hY2ZicC93cVBZbzgr?=
 =?utf-8?B?czlpbHRzZjVuZERoZmQ3MmRCbzZIakNZL0I5Q3hwa040VkdIMnBjbHJTQjcz?=
 =?utf-8?B?b29XQ2owM2Z0OHhPV2RhakZzYmI2N1pIWEJqTEl5YmhneWNiYzg0MU1PbFZZ?=
 =?utf-8?B?R1BGekFQL0NWS1BEaEZMc3hrb0kycGpXRFVjdTAxNmNJa1NZNGpVK21vNi9u?=
 =?utf-8?B?T2ZsdEVYQXBkUlI0UnEwV3JHSWp4SklaTUZicDJZb3FLWGtkcklOZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b61e134-3807-4201-a30f-08de3e7d4244
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:34:43.8412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zg90Tr41pX+hifWNQmlp38GKJLMukgtN5ckpCJOfPXNeUjodfcTTybKNihNy9UCQYSQGZD285T0LH13FMAWEx3LYpAChe5t3L1GvFiU3bVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8233

On 18/12/2025 3:27 pm, Jan Beulich wrote:
> On 18.12.2025 16:17, Roger Pau Monne wrote:
>> --- a/tools/libs/guest/xg_dom_x86.c
>> +++ b/tools/libs/guest/xg_dom_x86.c
>> @@ -1260,14 +1260,15 @@ static int meminit_pv(struct xc_dom_image *dom)
>>      /* allocate guest memory */
>>      for ( i = 0; i < nr_vmemranges; i++ )
>>      {
>> -        unsigned int memflags;
>> +        unsigned int memflags = dom->memflags;
>>          uint64_t pages, super_pages;
>>          unsigned int pnode = vnode_to_pnode[vmemranges[i].nid];
>>          xen_pfn_t extents[SUPERPAGE_BATCH_SIZE];
>>          xen_pfn_t pfn_base_idx;
>>  
>> -        memflags = 0;
>> -        if ( pnode != XC_NUMA_NO_NODE )
>> +        if ( pnode != XC_NUMA_NO_NODE &&
>> +             /* Only set the node if the caller hasn't done so. */
>> +             XENMEMF_get_node(memflags) == 0xFFU )
>>              memflags |= XENMEMF_exact_node(pnode);
> I'd like to suggest to avoid open-coding the 0xff here and elsewhere.
> XENMEMF_get_node(0) will be less fragile overall, imo.

XENMEMF_get_node(0) is even more meaningless than 0xFF, which is at
least obviously a sentinel value.

~Andrew

