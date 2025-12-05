Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45818CA8A92
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 18:46:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179351.1502886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRZrU-0001mt-LV; Fri, 05 Dec 2025 17:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179351.1502886; Fri, 05 Dec 2025 17:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRZrU-0001kW-It; Fri, 05 Dec 2025 17:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1179351;
 Fri, 05 Dec 2025 17:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRZrT-0001kQ-PX
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 17:44:55 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19093e65-d202-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 18:44:50 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7513.namprd03.prod.outlook.com (2603:10b6:806:39a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 17:44:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 17:44:46 +0000
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
X-Inumbo-ID: 19093e65-d202-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahfgWCuuvcGjic9Oqznl6ym9gQCLkItxFsMFR9pSPwxjNaDICaaOvxe3cxwhyagkp1yptg1ibu6dxxPx/mknGgHmveVGuqLSecEG9Zht2B9iTkddJ8Ys/7Z6L9xCQED1yaVKnpTwzKb+lMGcSqUM6293TBmSHnVEuPM1GPR8rjYPk+5lXOJczDsEpL11PhG1rinKVbMrm7fJsKEMpRDqDe7YOqJr7DCf+tgtMih8qHjM9Mjl2G4nQdnff6FmRmASlWV4yu2m4ZRICQof86l7DFV9LnE9gzTPUXdpa8Bd3DTTHiW6cngbMcV/hZqW+Be3LE3VPwQIAeywhmxx6GIXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHnyBkRa5Ya2hGFkympgSn7RaXo9YdtHW0E2IgG5Ek0=;
 b=VxERUHCIuw8c04JPoE312FxU5P8zSTo++GeYE3r6FSihhbVP9YjffsP7RwsMxcJptKXICW05Qe57hgN/7jc7+rWxgLeX6jCvpgjHjjJB7w+TqaOsKGonh80JFn1waxnEHnChUfnPLGv7spRxPbAa4Ga7vw4o6+j91xf8CdwB7v6GNrkbOAYUONQSns6ueH7Y4ktW52g5P860HhM7q7aMPc9JqVxKwWNrbfoII2WXM14LeToGOZ8+t6HAQhMvyS/cON7zcgpdGyvXGiRMhrM3AuQLbr1k6+kTZkUhEKs5LQbcGbGA8m7nYGi8aAr5ipwdIumT4kXP4epNgudtaYpd/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHnyBkRa5Ya2hGFkympgSn7RaXo9YdtHW0E2IgG5Ek0=;
 b=nYIOECWP0OihttQrFjb1JrIsDLDx4vP85BSAPpIpuRcsg5WdzUz3qfyH+gpZ+59VBmc/S9D1hTnDpHuj8yv3DNOVwzDsz5ZGCwuVG3uugPz/KBt9BlX//baGMak9gW1bM/CnzblgOof2b/oYlgBbdmsvg7FhltkJVzIPY8TPlZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ac0a0539-572a-44a3-a2ee-b56a77e69794@citrix.com>
Date: Fri, 5 Dec 2025 17:44:42 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v9 1/2] Do not attempt to workaround older binutils
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
 <20251205160942.46694-2-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251205160942.46694-2-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0326.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4194e3-226d-47f1-b94b-08de3425fac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1FUQ3ZrbmpCYjdRTVFoaWJUdXFPaVNtZzQ4OEc5a3E1QVJ3aFlHN3AyaStU?=
 =?utf-8?B?SmlNdFU5YXNMYmY0bE1LTy9FYU5RdWhWbjV5R2lMeHZJYVhrbzNrN0ZrYm00?=
 =?utf-8?B?TjNZOEhsdjh5NlBNY3RHNGViYllpZWhCSjFBWFlzcGZTTUlhZEdCYjI2dGVK?=
 =?utf-8?B?dUVlQ2sxYVk4RUcyMUxxano3MTdseUtMMUNZd3FHK3Q0T1ppSGE0ZXYwMTJl?=
 =?utf-8?B?MTFYY0dxMHR2U1NEd05CNG51QTZLTmJkTDhFZ0pOcGpMUXRWaFhQMXQxV01B?=
 =?utf-8?B?Wnhqc0xRd3FTU2dvaFFWT1MvYnBKVnNSSmVsYW1HM1FqeWpyT0hHQjVCcDYv?=
 =?utf-8?B?M3h5OWtQVy9xeW9Yb0Fnc2xqUXA3c1pOWDB0ZGJZRE93VGNLbkI3YWVhR3l4?=
 =?utf-8?B?bjBVQnRzM0RETis2ZlVKMDZQS0NIbVR1SEdBWE1HZGd6NHlXUk45dXNOeWZM?=
 =?utf-8?B?Q3h3WHVqVVNZeEI1RDFoMEpnSXYwWFR6azNFS01McGJVYmtadElXVm80cjJ1?=
 =?utf-8?B?Z0MrVzYyTVVSTWlOMmRiWVJGbFhJS1pCMUVUbWpXQkxRMUUwcDh2eXBzejMz?=
 =?utf-8?B?NENqZ1JvbEdPT2s4TlcycVI4V0wvMjQ2SmZsQnRUdTllVHBtbWwwYm5Bcmln?=
 =?utf-8?B?NS9Uc2FsbGliZlEwNy82T3BxSHlwVVNXdXY5U0VGS1l4RzV4WU1yeUVTQ2Nn?=
 =?utf-8?B?Y0dzaXExclRaRXI1WFN3M3ZtWUluZTVWWTJvSVlONVVqTnB4WnFuSnJkeUZx?=
 =?utf-8?B?RmM0cWNRRmtMS1FESHgyYXloZHY1RkpnWE9kUk9TNzVjcFI0VTVsVm9kS3ps?=
 =?utf-8?B?L2VVMXBzbWYwRENHNHBUV081RVV2Q1l4NHVjTHoxNmV1VXFVOHVkL0xJNnZ5?=
 =?utf-8?B?NUxzQ0laeDZSSG05bFp2SUxoR2lKMS9oWVBYUzh0WE8xQUwycFBVamZyQldO?=
 =?utf-8?B?TU5aWlp0NDh1SGpaK1VRbUpQekxrTUhwc3MvaGdHNDVFVmtFOU52QU5rZm1p?=
 =?utf-8?B?Uk1QTDZQU0huMkFmcExIMGlBMjZSek1nZUx4NytLNjVMU0hqZ3ZrbWF2UElx?=
 =?utf-8?B?Rm1zUmN3OEgrUVFZV0J5eHBuNGpDRHJjZ1R0cE9ESk84ekhzVXhid29ZQ0Y0?=
 =?utf-8?B?VloyWkRiZ3c5VlZOR2dzZ3BSK2FrOEE3SEVKcnBIYzFqNSs4aHM2K1U2NlNh?=
 =?utf-8?B?TjdEQlBET3orR0hLRWErMzRBM0JqQ2RadDNEOCsza2xkR2hrTkRlU01zZE5j?=
 =?utf-8?B?UUYwWjAwbjloRE9Md0tyR0dobGlCYXI4VE00L2NpMmQveHlVM3JOM1oyL1hW?=
 =?utf-8?B?M29Od29aSGhOa1RyZzJDYTVzZ21qSHdCblpoYTV3bnJOZi9Tci92QUR2bDBN?=
 =?utf-8?B?WmhabW02Wlpjc3NNdThobEpZbXRlQ1BHVzB6SEhiM3VxZmRORFUvVSs1MW44?=
 =?utf-8?B?Vm13S0RPbjlxZmowczk1VnlNS25OZnFRRy9xeGM1aHZmQkNGUjZoMmRYc2pD?=
 =?utf-8?B?djkwZ0tMYllDaTAzSmNqeWQzQjFrNTl0T2JFblNZbHIxK2R1b2NKZTZXT0dE?=
 =?utf-8?B?T1cxY1FOL1BsdEZhNll4a2d3NXVzaHpqbk5aSDlYMVFxcUVTdGszTkhQRE5j?=
 =?utf-8?B?K0p4azh3d2prNURBa21lbDEvaWhkT0xaVEdDanYvL2R6UWgxKzdQNnp1Q3d2?=
 =?utf-8?B?cnhuK3hlcURiNTFWZzVTRzdkNkw0WHNPOGt5M3hHUVpEU1g5THNnb1VrRW1P?=
 =?utf-8?B?VGJmbnhLV044a1ZDcWlWbG40TUxzdGxFREdhTmJRdUZYTVg5UldEUmpYVEJl?=
 =?utf-8?B?OEU2WDNhZHdYMnRqZXdFcERocDR3V0tSNmQ1NmtQVUl6bEZQOUErRkNqVmZS?=
 =?utf-8?B?RXlQSCtVZGllenIzNldDU1hYSVloN3UvY3VTR3Rnd2hnYlloazhTa1FvbWNt?=
 =?utf-8?Q?p8iXPPDZX34yvaO/SxbwdXu29GJS3He5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1lOaC9aUmJHMTBTTE9CdmdKZEhGbWpjTWlheEJJUCs1aG5WWHN2T2NOUzNI?=
 =?utf-8?B?SGN4azA3aUluV3g3YVNMT2Y3blZjamkrQnFYVWdkT1BrdTBtc1Z3M1NaV2tE?=
 =?utf-8?B?MEdmTWdPRFdwRFRBU1g1SnlDazNiSFZ6cWwrTW5RTGFCSmNydEZKdVJyTzUr?=
 =?utf-8?B?VGtEZitoajN2NWN0MnJJeHpNLzVrMmxGWnZTVEE5dGlKUEFGVENrQXZNdEdC?=
 =?utf-8?B?ejJQbWpSNDJ4NTBOMGFyN21VU0UvbDkzRGtvMnl3RzFuTzlJdXNUZ2RuMVJl?=
 =?utf-8?B?ZnY1SUVZQWhWQktyRWd4WGkzNzh5eVFyQ3k2YWFySW9TdnFuZWZOTTByaDN6?=
 =?utf-8?B?S0JGN2ZzSjJic3FoU3ZXM0FnNWNFY3JFU2ROSnMrNDFiK3pXRXE3di9rWUQ5?=
 =?utf-8?B?RzdIS3dTR3hKOHg3ZjdRdlh4VEtnNXRDKzBubFJIbURwRWg5ZW5Hc1ZNcTFi?=
 =?utf-8?B?Z25xVU5pa3VCd3NaaFI1dVJoSXV0cjJleGFYcTc4ZXZlcHZpMHkwUFdzRjlP?=
 =?utf-8?B?R2hCeGttSmlTc3dSTU1GM294bnBRNC9jQlFKa2NhNUVBV1ByaVFjcWxKcWFG?=
 =?utf-8?B?OUVKbitaMlBWQ1Y3VE1MU05YejZWZUJ3QnZMUEVCdGxaTjQ4bUJWblRrTURB?=
 =?utf-8?B?L3hNNk0xMXNla3VGK0p4ZHR0UDZkQmhZanV4bEE2WU5yMjRxRWI0TDJEK1lI?=
 =?utf-8?B?YnpFckdjRXZMMEdqLzFpUmx5ckZVTittZ2tycHA5aThqQUVVMlhST004cVpa?=
 =?utf-8?B?VGlPTUdsWUVRTjhWWWFjZktncG9WYkFkR3BtRVJkcmhBYVlOMU5idkdFcUM2?=
 =?utf-8?B?ODV0K1hGcGUwYmNkK0E1T2tySG5UYW5lTURIYlUxdnJNZEtoRVNKN3RhVWVj?=
 =?utf-8?B?cURkWGVaNGdudGh5U1RDZ2RuYndlOWtqQUxnQ3JHYmxmZmo0YTNQTStqb0xM?=
 =?utf-8?B?ZEJZVXU0TmV4a3Q0c0wxMkxXbkpNcWxTaGpYT3FiTFZpK2FLZE4ydWk1RHZO?=
 =?utf-8?B?bFNlNTVsbzFBSVFCYi82UmIxdnlDUTZDZDM1T2IrNWZ5alArajV3Situdzk1?=
 =?utf-8?B?dUhwYng3NGdyVGJ3OCtCa09nTTU1Qldmc0U4bTJLZmhXRysyaTRud0ZWOGVO?=
 =?utf-8?B?Qld4VVZtaEZrVjZncjA5SXdFWUFtSmtrcEc3L2oyakh5eHVYeTB6NnFkQnda?=
 =?utf-8?B?TzVJSFBHUlM1WTJ5VGxHeXFvdC9lcDlTcDhZa0FyTHQyWEVRZU5xd25BaFQx?=
 =?utf-8?B?d1hmTmE1Ly81dDViQWkyak1jSFUxckZRMUFTQ3hKSU41RXFkR0hadUgxRnVr?=
 =?utf-8?B?dU9HSk1RU1RiUHB4MkhEQW5sTTdESDVxa0xGcGlIa3p1bHNhWmM3bExydmtE?=
 =?utf-8?B?bFhrNWozcHRPZWdCclVyU2hGQ1V1U3lvNDBHMXpXWGo1VlloY1U4WTdmZWtq?=
 =?utf-8?B?cngyWnRPT0puQXlDcG4wYW5wMnREbEdkRkp0TEpNdUlZWjBORTRZbTN0ajQr?=
 =?utf-8?B?VTJBcTB2VVkwVVIxVTVLeittSUJOQ3doL3hnSk5QY0JRZFVWNndOK2lOak1z?=
 =?utf-8?B?c3hzWVZXTVRrMmdMUDNSeDU1K28xU05uTkxlb2hxUXAzNjVxNHE4OXR5WmNa?=
 =?utf-8?B?VmhkMXRSa05IR3A0LzFEdEE0ZkE4N0dHUzlVZkowZ0dndXk4SG9OUk11c0tm?=
 =?utf-8?B?UEgxbWZXbGR6ZzZrU2x0aHRpRlFkaDJTM2c4RFBqT0s2bDNxbjYrWmFwQU1u?=
 =?utf-8?B?YUxZMmFWU3JjY3Z3Qm9ZVytjMTVkQ1BTSngyNkxMVk5CeW1vMnRFeElsenF3?=
 =?utf-8?B?dFh3amNMV0NiRHpQV2ZCY0hxUThEWDVoTzhDU0J5V0Z0U2h6dEdjTC81UlVO?=
 =?utf-8?B?L1JURnhDOXl2d1pXM3B1cHdDTFdwOThCOEhzQ0tIbmtmL3NyMkltdzMwTjdY?=
 =?utf-8?B?a3ZUMnJVdzJqVVo5VGNzdHZxYWR0T0xhdWNvREs1MW5tL21NU2QzM1VUSWJs?=
 =?utf-8?B?bVBIb3ZtM1VQNUhtY3BJazh2NS9qZUhYeXhYcnIrU3owc1lRNlcwcUdkY1Fs?=
 =?utf-8?B?dG9ZNk5YUGlnSWx0Vnlma2pyTFJWeEF6aTJ4NzBoS0IyREdXcnJSZmw5Rllz?=
 =?utf-8?B?VnlMSmhkSXZqZGhwSFhNOGhMVlJlWm9WWk4wR2JmVTl2dTZ4SnZqaG1Id2I2?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4194e3-226d-47f1-b94b-08de3425fac0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 17:44:46.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOErTFlJWhwxejZT5TmPZKPt7Thnz5hHBcMFXpN48+cHhntXz0PK+8RJU+yEKdHODI9EfrifwIwXYI+8AabqhD81y5KutB+l2O8fB9Wk9WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7513

On 05/12/2025 4:09 pm, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Older binutils versions do not handle correctly PE files.
> It looks like they could work if they don't produce debug information
> but they mess the PE file in other way like putting invalid
> flags in sections.
> Also different tools will complain about the format (like
> objdump and strip).
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/arch.mk | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> index 16368a498b..10eb8e4292 100644
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -88,13 +88,6 @@ EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10 --enable-long
>  LD_PE_check_cmd = $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(efi-check).efi $(efi-check).o)
>  XEN_BUILD_PE := $(LD_PE_check_cmd)
>  
> -# If the above failed, it may be merely because of the linker not dealing well
> -# with debug info. Try again with stripping it.
> -ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
> -EFI_LDFLAGS += --strip-debug
> -XEN_BUILD_PE := $(LD_PE_check_cmd)
> -endif
> -
>  ifeq ($(XEN_BUILD_PE),y)
>  
>  # Check if the linker produces fixups in PE by default

Given the practical breakage, it's clear that noone's using xen.efi
generated from toolchains these old.

So, while it's not completely ideal to be "dropping" xen.efi on such
systems, it firmly seems like the right thing to do overall.

EFI support is still available on such systems via xen.gz + MB2.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>




