Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD53CA188B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 21:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177107.1501511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQtFn-0000Pq-Oe; Wed, 03 Dec 2025 20:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177107.1501511; Wed, 03 Dec 2025 20:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQtFn-0000OP-Li; Wed, 03 Dec 2025 20:15:11 +0000
Received: by outflank-mailman (input) for mailman id 1177107;
 Wed, 03 Dec 2025 20:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Ymo=6J=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vQtFm-0000OJ-RA
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 20:15:10 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c39d6434-d084-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 21:15:08 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PAWPR03MB9689.eurprd03.prod.outlook.com (2603:10a6:102:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 3 Dec
 2025 20:15:06 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 20:15:06 +0000
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
X-Inumbo-ID: c39d6434-d084-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmKDLmfGANVk+Fu9re2VY6n7uA7uL7RzfvrnQjCSIgJB1sXpqdlHgSpqjDya7O0OmvrDmzRN1JcG76Y8IzyT0pOU3D1z2vDnijRF4A5L2dtxUz1OdEqRRqyW6E/JQliOF5TQcT4cK578cZznkT5dOFZLjcN1KqV+brwAuvewEKTSUdMMg7UVbw5QzzPljT33+BUFPUXcY3USfu9aCqEUxeD2Cp1+UWmjhHvq0AgKfkUOUoujfOvVxEFa9Bh4yI02jQqLfRQEo2TnWfjL9yrOTjJoX0BTnQiYew3Ef3rej48tTqDdzoT2wzkiwER7OdkfR5W5PMYg0bbz25KWo2Jvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOFmLvdYGGyIfQP9eMobra+CovqHFu5AZXo6eqWj3uA=;
 b=fOaAR3kCCRqVlfScEJXmCYfPY3DPEpcRKmOIi9ptddKNvwS3z6M1FHZEt3V8bdIOjpst3p2/sQScagQTgCeYhkiqu9ahnMCE9YTYgP93chodszZNqh7PM0R1ec0tS3RkudBdHjK6w8BzQrEvZJNZ133zpaylvU1sVVCWGYp8fDG2rh5ZWaWF4VVz/ZsVWkYJKjSV/9F7WRCU1L55tvmvb7zwUXI+LJ1uusldGriCZEgJfad1ZIqg3N1iYLBQljrSjwTCaqw6aL18M1IUkEP9NEAYxsD/1VzV9L7t2YnqA5fXSq/mqa02oKA4f50lE890AObWCFa2724OziECNYDpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOFmLvdYGGyIfQP9eMobra+CovqHFu5AZXo6eqWj3uA=;
 b=km0ET96jdleCfrK6Ih4Q/+y+B+O6mxdp0yG5vkzhFoxeGYIfoMqhHrROeCc8kM329BprUrwktdtLlkKF7ioouCYvVNpEAna5iExALfEZxGk+PNWHUbmJ4uitnh4kmFU3MOovhv0AHceBSyk3eicilc5E+wdRAjuPT/orreqZBfIHByvJDoP18tzawZMwf41d+odCTJTQUSvwPNzM5RIz3CBw0Ix2pFSCAf4t39tfBbtNsYFa/vFZ/nyjkAe8Rzcms4KjpGnlrEo8somMjtKdWbY4EHpnFjrfac3JRxVF47n9QCboYZ/tpr+ch8M8gPSu3FMyQsltViVSka39WpEKnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <bbc41ec8-8ee6-4562-9b33-cf17da0812b7@epam.com>
Date: Wed, 3 Dec 2025 22:15:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PAWPR03MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: 414c7bbc-d66a-4505-28bc-08de32a8a681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0kzNjhocGYydlZ5aVc3aXZPSDBRRUErV1VaeUZkVzEzY01Qa0dnZml1bFVT?=
 =?utf-8?B?Z1JwK0JreGFhczkvMlEvS1NlZkNjL3kvZEVzS0RJeUJzZTg0OUdBL2htRTJX?=
 =?utf-8?B?UVZXcnhCV1UyTXhyeDB6aUtyRXk2YjFqVE1SK2tKM3Z0OUJ0MjJZMlpmYkFx?=
 =?utf-8?B?Q3gzcFhOV2FPRWJlUkFsTHQ3aEtSV1pTRGFEN2FRNVBrcmhoL0dpcThvWkdv?=
 =?utf-8?B?MEdaVUVhbENjMHZrdUhSVDhEVXpCQXIzUnNGNHBieGVJQ1VBdEwxZ1NSNDRW?=
 =?utf-8?B?MkVXVkl5N1MwR3RTTXhYKzMrS2dIYTRBWmQ0T1hudlljTWtyYlBqanRONFY4?=
 =?utf-8?B?KytoY3ZrUmRCbTdEb0Z4TUFlblhCWWdoTGNocUQ5TXBYbXpxNGVRZUNoVE5U?=
 =?utf-8?B?YzhlUDBzcWs3M1NYMEkrM0dCekVwd2cweTRMSEtRd1A4dlBoNExOUVM2VnVP?=
 =?utf-8?B?QnI3YndoUTFNRDgxbktvK3V1T0pxTEJoUXRsbzl5dkxOYzg0Z0tGTmU0N0o1?=
 =?utf-8?B?UFN2elhWd0hxYUJId2tMM1hGOVo4dTV0bktvTkhhcDl6aEdzampncFhwaTl2?=
 =?utf-8?B?bnA3UGdtNmRnVHUwcHc3cER6UnBORERKUFQ2YU80WTNScU1IUU5jVFFnRTBP?=
 =?utf-8?B?djY1c3lnS0ZyU0tTRU02Y1JTVkZEdXhMTDM5cVVrSXI5Tk1tWFlIMEFlb0Jv?=
 =?utf-8?B?aC8xemRTQnJJdzNJUVVFVFRwTVZGT2VKaE55d1FxM3Y2NkRmN1AxQWNobzM1?=
 =?utf-8?B?NVJTSDJRTDlPL1ZNZmpRTXZVZ0prMXNDMmxvQzc4OGx0dnlkYklnRWw3Z2I1?=
 =?utf-8?B?bTdFNzFBSElmekpIVlNyYkJ6RGpUS29OZStsWGJLS2FLNmdnSUFlcDZNcTc1?=
 =?utf-8?B?aHE4STF0Rk5UZThpUVNMdURNV3UzOVNqVXRTS1p1Ymk5WUFCbHJMa1hyTXlq?=
 =?utf-8?B?a0s0aGw5TzA1clJncjNlNWxiTmVsUE5HbThURUt0UE93SThhVHkxOWRJYkpI?=
 =?utf-8?B?ZEVLMG9PQVR1eWVDRzcwb01tYjk0TGhEK3lLVEVoOUNmTG5sTmxBZDUwVllK?=
 =?utf-8?B?TEhQNjZEVXFubHl3ZlpKVTlpM1RGYTZXVGVNRkZqUzZybXN5WnpuOFQwMWZQ?=
 =?utf-8?B?L2F4WHJncERyVW56TWVyT3hxY3JIZlNxVFZhNHJiQklsVExEQ3J5VWNsUk5B?=
 =?utf-8?B?RmNHc3pWWWNrbnN1Zzg0WldUNlVFdWtSWVQrNTRRNE84UFkyRGhGRmVnRUhV?=
 =?utf-8?B?aTJ5S1k0N1dMYUxMd1d0dWdQYkZ1djlSN0pXZmxrRFJsMHoreTgvRjNPakda?=
 =?utf-8?B?aEVwYlBrT1poeXNnemg1RVlnc1ZtNDBKa3ROdDJYRzRoaE5uQmFPazZya3Rk?=
 =?utf-8?B?SU1mLzBJdExaSjhIVGlQM3kyV2lobGVjeGtHZG5YKy9lNFNzZEhValNIV1JR?=
 =?utf-8?B?Tkc5Y3JtSVIxcTBhb1l4Rkx5NmlNVzI0Z2t2V3pKNndUb1NHaXpEVE91V3Ns?=
 =?utf-8?B?Z3ZjdUNHbG84eXp0V2xCSCsxMGh4bVpxaW95UXZ6UXlOa0QzZTJLNGVPR3pZ?=
 =?utf-8?B?QytYci9lb2JKck82MDdsU3RLeDlndFpQckw0TUEzOGFTT2YrV1ZRZ0M4NWh0?=
 =?utf-8?B?cXlrbmxCa0VwcjN4WXFlMXNydzUydTBCaEJXL3BKUUpQSlFOckp5TXEzQTZN?=
 =?utf-8?B?ZVpUZjEyUU9mam4xeTN1TWp6MGhIWUM3MlRBNEp5NUZOR0F1b0VEdTNHVy9T?=
 =?utf-8?B?M2JVeDkyRENZYWFnVmI4b1RQQlpKQi9SL01JSUlTNTJxM2tDWlNMeVU3WEVQ?=
 =?utf-8?B?Z04yV3F6Vnc0aXVHNGZUdUVHZ3Q2VE9FTGp1V3ZLRkVORUN4NG1tVWQyVGZV?=
 =?utf-8?B?MlJ3TVBZVk1vVUhvSjFWMXlWWkxQUHVFaVdEMU0weGVuMVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmNuYW1QNEV5WXlOSGtzcE5ydnFPT2M1TWNNMTFZa0Q3RzdFRlcyRURzeWZi?=
 =?utf-8?B?TENWWDVadlZpc2F2SDVQSm9ZaW1ib3RhK0k4aGo4RmFXTVdCRkdYMW5jRjJD?=
 =?utf-8?B?K201eklZSllvbDB4MkFhMTg1VUMrcHViK0t2cjBXYkxMTWFRLzdtU1QyWktz?=
 =?utf-8?B?MEkyWmRDSFMxQXVFa1ZrR3JRdUF2RjFrdHhaQWRaWFFmaUl0UUNmZFhJMkY4?=
 =?utf-8?B?Yy80V0djUjR6OFhGKzFZa2U1RXRhNlV5aHJseEd2aFBZb1Rsbkw5UFlJSGpT?=
 =?utf-8?B?Q0Q4OC9CYzl0Q3lyU0ZLaE1WUklDcnNlaWExVU5zUzZRK3U0d0VSQUdZbWZz?=
 =?utf-8?B?QkZha3Ntb21WWStiUWVuaVVpYkZIZjhmMnJ2aHlKdk9lUnR6QUlxaGRGREt0?=
 =?utf-8?B?ZTR5Zys4dEVpLy9ySlFkM01aOFVTVzAwY0s2R0Yva0Mvb1JJdVl1VkNyam9x?=
 =?utf-8?B?VElWMStCS29OcDNGM3V5ZmhxZ3p5U1lGUnUzdXdLSDZIdzMvVzFyL0VydjFR?=
 =?utf-8?B?K3RqNEFibHVsZVZCTXliaHFzY1VXNXg0VFFSRVdHK0FkY1gzbll3UnFSZDFu?=
 =?utf-8?B?dFJUYjh2MGViWjY5NzJ2a09YaTJ0Z0NYRnJrWUdHL2VER3IzOHVmMEoyQldZ?=
 =?utf-8?B?YityanhNVEdsemFmNGM4MFVhTEpWZXRCODIzTzRwUTBFKzVtRXZvc0FyTjhn?=
 =?utf-8?B?OXpESFFFYlJMQmtvWUZPbUt4RkhINVdwZmd3SVFQU09vQU9lYldkRlVZRDBO?=
 =?utf-8?B?eUlsNG4zMHpid3JCNkVtcU02YjdkNmp0cU5JNHR2QmNaU3JaMXVFTHBlTFo3?=
 =?utf-8?B?N04zNTN4UWx4c0g1RjAxZkpBM1Y2RkZZQmJoakRNb0FyS3F5R3VibmE0dGF4?=
 =?utf-8?B?MGtGMGU1UXpEOThESXoxZUxrVktKOGsyZlFOZzhaS2h6a2dwaVEyakVVbTk0?=
 =?utf-8?B?YytvQXI5UklLMStNVlpHTEdEL0w0MEFhZnBoeDBmU3JWZGFiN2NlN084d294?=
 =?utf-8?B?VEMwRXp5QndwYU1ZYnFMcWFnVmUwKzZ4Q09sRjhUb2hwTEpIc0N6M054ZTU1?=
 =?utf-8?B?VGo4OG10OXdFcUtZdWdHT0FSY0cvU0poTDk0cTFsV2RKeFVlRlhIYjVzeGxB?=
 =?utf-8?B?bWRvNW1pY2F0STJqYlBCV1hIcXpDYkJaZFdmMmVPOTBjZ05nd09ZdXdIaFBO?=
 =?utf-8?B?Y25rQ09iL01DR1prMWVqR2J5YVI5L3BQVVFnSGJtQjFRRk5QWlJMZHlmRko0?=
 =?utf-8?B?ZmNsTTh0azUzaWpxZGF0V3htNjVycTJqQXBJVjRKN2s0VmRKZlFSZ0lrSzBU?=
 =?utf-8?B?UHB1Q2h2TDY0ZU5EK2dBSmV4aVdsRlBobXQ4TXZmdjdmVTR0TEp1Q3VUTmlx?=
 =?utf-8?B?cWloaXFwcWdEQ1k0WU0rV2JGcjFycy9mUGtjTzZzTmdxajg4aC9ZR1dPTSs2?=
 =?utf-8?B?UXFRcnBzRVVoc2xPVjNrT2NCWFYzaGhZOVJ6WE5rSUlSUXhUbGhFeWIybnNS?=
 =?utf-8?B?eFZyVWNUaTlPS2VhUUxBalgyaFAvQjdyc25laktFUHJnMzBGUXI1bWFockpq?=
 =?utf-8?B?SWpLamorRXdiRUtrSXk3Z25VblhKWEtqTzdFZXJFanY5SmhyVm5sOG5UYlFs?=
 =?utf-8?B?L3d6blF2YU9zUWtPNloxM2VsZU9TZCtNSU8wSDFNZEk0TXpRcWlWOHdud2Qx?=
 =?utf-8?B?YWJhOTB2NmpzTmxhTUluWWxNcjdKSWd2Z0tvdnNZUzE3U25COTgyZmYySHRs?=
 =?utf-8?B?MGtnU0JlNEFYQkFYZTYxTTA1VEZlZHJBOGYxanlmb0ZOaXQ0YU5TbzdybHA4?=
 =?utf-8?B?UVhRaHNRMExTVnhueG85aFg0cmhnWjl6QUlDdW1uL3BNaVFnc2N1ZkxjbXA2?=
 =?utf-8?B?U1JLTk1DSkpYekI5SitCc1Y2UWlzQ0twU1lyTUlHNEREYnJPRUhOY2FQbHdB?=
 =?utf-8?B?VDlYUFMrWFpTVTlWd1VsdjBZLzZIdXdWdmc5ZFdzRStnV1NXM1Rtb0toNEQz?=
 =?utf-8?B?UStrMytvUDI4eVNTTFpTeWRJMGNES1ZLeTBUbmNzU0dsYzdqTlpyN3VYeTh5?=
 =?utf-8?B?Nno0b1pGTGtTZEMxWmhqSTl5dHpOVGhCWTM3NFYyNjFKY2FCbmNMUFV5elk5?=
 =?utf-8?B?ZDFEZXRuQm9ad01jY2pPZmxmUEpjZ00xTmdKU1JuQkN1UThPZ1kyVXpMTmN4?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414c7bbc-d66a-4505-28bc-08de32a8a681
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:15:06.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwonww3ib2VCEbct/8vrIy+isGQzJnm6FHfA5TBRLPfkVlYH0Vpp6S3pgNi3/8U4ElEyrJ+JBsnkVoxfIIM9YdEvrSpTvycNwz+iPBjZgMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9689



On 03.12.25 20:58, Oleksandr Tyshchenko wrote:
> Creating a dom0less guest with a high vCPU count (e.g., >32) fails
> because the fixed 4KiB device tree buffer (DOMU_DTB_SIZE) overflows
> during creation.
> 
> The FDT nodes for each vCPU are the primary consumer of space,
> and the previous fixed-size buffer was insufficient.
> 
> This patch replaces the fixed size with a formula that calculates
> the required buffer size based on a fixed baseline plus a scalable
> portion for each potential vCPU up to the MAX_VIRT_CPUS limit.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> V1: https://patchew.org/Xen/20251202193246.3357821-1-oleksandr._5Ftyshchenko@epam.com/
> 
>    V2:
>     - update commit subj/desc
>     - use a formula that accounts MAX_VIRT_CPUS
>     - add BUILD_BUG_ON
> ---
> ---
>   xen/common/device-tree/dom0less-build.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 3f5b987ed8..38a5830813 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -461,15 +461,25 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>   
>   /*
>    * The max size for DT is 2MB. However, the generated DT is small (not including
> - * domU passthrough DT nodes whose size we account separately), 4KB are enough
> - * for now, but we might have to increase it in the future.
> + * domU passthrough DT nodes whose size we account separately). The size is
> + * calculated from a fixed baseline plus a scalable portion for each potential
> + * vCPU node up to the system limit (MAX_VIRT_CPUS), as the vCPU nodes are
> + * the primary consumer of space.
> + *
> + * The baseline of 2KiB is a safe buffer for all non-vCPU FDT content.
> + * Empirical testing with the maximum number of other device tree nodes shows
> + * a final compacted base size of ~1.5KiB. The 128 bytes per vCPU is derived
> + * from a worst-case analysis of the FDT construction-time size for a single
> + * vCPU node.
>    */
> -#define DOMU_DTB_SIZE 4096
> +#define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))
>   static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>   {
>       int addrcells, sizecells;
>       int ret, fdt_size = DOMU_DTB_SIZE;
>   
> +    BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
> +
>       kinfo->phandle_intc = GUEST_PHANDLE_GIC;
>   
>   #ifdef CONFIG_GRANT_TABLE

Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>

-- 
Best regards,
-grygorii


