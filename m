Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94967BA97A3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 16:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132923.1471130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3EWv-0003Rn-2R; Mon, 29 Sep 2025 14:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132923.1471130; Mon, 29 Sep 2025 14:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3EWu-0003QP-Vn; Mon, 29 Sep 2025 14:07:04 +0000
Received: by outflank-mailman (input) for mailman id 1132923;
 Mon, 29 Sep 2025 14:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v3EWt-0003QJ-Dk
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 14:07:03 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90f338a1-9d3d-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 16:07:01 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SA2PR03MB5836.namprd03.prod.outlook.com (2603:10b6:806:117::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 14:06:57 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 14:06:57 +0000
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
X-Inumbo-ID: 90f338a1-9d3d-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5NQ3hovvNy4r7YEuBi1uhRpSzrrUBzKs/fGRuBNsv/x/uAGfyi2E68S7foDAgZttW9M1wll64rGheMx9XfAF/AFBgOTiqVELBYeRLS3CpprM4NCxdUlW/p471oB1XwuVZtXCSQk228jTSjogIPMMyc/D5UP2g4h7ipWk/zi2JM3xI8KMWW38+BxFG7E6DWXpmKtJTyp3INkHnyL/qanEbZ6TwPXUtkrlTUP7PghUrBID5nbtQigJjxWPyRSQazE8UkMFkDWuXI283FHyJVBWFKJGxOOGVLeFrtNTsYqkoLR4ZPSZWHgLZue72JBuEY0ZwyOWHJHdxhm+RdyEPlhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1G4m2NgbWFk6y6iUxPeTGt/UefIoHwrKolFI+FVtUU=;
 b=WClPhGtOiSgUHn1+3i/ZG61notvZnmOMXtEWKqTuAbVii1keTwi1qFbfzBCdoHydyUILDeXWY98YZg+qCPQW9XMVb2xjYmCfJZiIyBiwOdKPj/jsvhuApP/vz4EyfoVGc1Z5322KbilCEdIJZ4bHaatZad3tI/q9bzPjFMI3BQzqvn1krtrifaxXEbMmZGIJrQGPK3wW746YEsxZYkbVJObFoMyuj1PixkyNDhYgdM1j+enP5TGr1F7MHChwM/Hn8EvY4q74EdlWO0KAX+ioF+w6Fyf7o9SO22eHU1qKA7taW5lw01mE5yQSwCbZ2AED/IdM0NlOUJ03CPaWl4ypQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1G4m2NgbWFk6y6iUxPeTGt/UefIoHwrKolFI+FVtUU=;
 b=T+KSg8dny6sdzNPzSWincRUnzgLjo2xaAvFE20cicqvInPh114m8RFFHOS8S8a5B/vXLGBT/0V2dbhrealEZPzb+dDeGRgEbRUqGqd5SXsxRW8P2pVl9vuUETEci5KE6u7fXyY+J5oXZPcRNzlj6HaveYTcqM+KmCFjrV1fSQfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 29 Sep 2025 16:06:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hap: Inline "flush_vcpu" in "flush_tlb"
Message-ID: <aNqSfAW448rOMCW-@Mac.lan>
References: <bb570008f237cb77f2c74c5f025375ca6c4f140a.1759148418.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb570008f237cb77f2c74c5f025375ca6c4f140a.1759148418.git.teddy.astie@vates.tech>
X-ClientProxiedBy: PA7P264CA0244.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::17) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SA2PR03MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 96100735-61d5-45d2-18b7-08ddff61730f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0E2L2xGMWdZN1JLT0VIcXJSMzlUQnMrK1dPMnV4cjB1eUwxaEVwWlNXejFJ?=
 =?utf-8?B?bUhzWGM1UVp2MWxReldGTUVSQWQzOU1FTVlzRFQxU1BPTFVLZjZ2eDFXbnpl?=
 =?utf-8?B?cllUODl1YzJQZW5wSjE0Nkdjd00xTitwbSsyeHRKRzRCYVcvRVhobUdlcTZC?=
 =?utf-8?B?aG5XVWxxMllpVnJXRmkrSG1mclZCdmdFcnEwZFF3am1iQ0hGYk5NcC9ELy84?=
 =?utf-8?B?c1A4K2oxc1VGRHBYRk0vQW1hRnZGODN6NUdxMkliMDQxMTZLWFBlRXVrUVJT?=
 =?utf-8?B?dERYSERtWWduM1VYNGY3TC92QzdqSFgwajltUUhJUmkxTUhIWFp5QlFRZjEr?=
 =?utf-8?B?OEVYNjdPTnpybnNjMmFnS0lKTm4rWEo3Wis5WGhtSy9TdTFtOExsS0taQWlQ?=
 =?utf-8?B?N3Q4TkcwSEhKTjdOb0Z1UmdTMndhczRjMHd5UkxFUml6V0xYZjhRcUZzaGQx?=
 =?utf-8?B?bTM3bXdrMG5tcVhWMUp6a1JDckdwbzlLV3hYeStqcXQvRWpUNW84QmNFL3I5?=
 =?utf-8?B?QXdPd1BXZitXTmt3dWhaU3U5WlI2N0VtYzREbHlPUXpKMUpMNnFqZlREQm9H?=
 =?utf-8?B?aE02dzJXa0ZRMnlSSGJaOE9PREIrcjJIMDhzcXRYeUFMcWJjY1ovMlhTcWdI?=
 =?utf-8?B?WHNMSkxoU2k2czVTcXVxMFlSMGZpR3RCYmJzeStIZ1o4U0xxb0xCSGtGYVUw?=
 =?utf-8?B?Z2s0ejZYUzBpR1JLVzdEdjZieWVpRSs0ZXRXd3dWTzlaelJVV1NlMHBUZkhr?=
 =?utf-8?B?TU91dFA2YUNQN2FIVWVRYjZIK1VKS2ZCSmxaTFJZYkE4UVFtTFpVWW54bXdE?=
 =?utf-8?B?bWppcnFQazRRWkluWmExU2Z6ZVhLM1QxU0k3VGd5V1lhMWpOaHNCRU1pVXln?=
 =?utf-8?B?YjBVaU0xdGtWR0lvUVdhOVBJWk5vcFNEMVBocHRVK0xGZzlFWDhVb0REbDVz?=
 =?utf-8?B?TldLazhQZVVad3A0R01tYi9nMU9EdU9GZUZROTJuUmdPS012SUJZLzVzSmV5?=
 =?utf-8?B?WWcwK0dyc0xnYjJaTEJ6MnJOd0syRXlSb2tqM214WmFpVG5CcTJPQTJhMlNq?=
 =?utf-8?B?NW5peHowRWY3RUI3NCs0bzFFdzhFN3pSR1E5Ym0vQnBvQlB0ekM5b21ib2F4?=
 =?utf-8?B?ZXdnZnl2OE9ta00xS1lNQkZBWGV3ZHIzL3pzVGZDVFd3ZjRlWHpEQW9aV28x?=
 =?utf-8?B?bGVnRXFQcnhBam10c3pyVUJMakFIZUg5ZU1NWkhHSU8xb3pXZ1M0V0JLSkVB?=
 =?utf-8?B?bVA5UWI1RmxMc2YwNnovb054M2RXSm1tWXJTYmNNdG1rRmJGSTBndThRbEVV?=
 =?utf-8?B?empySDg1aTFDRlNvMWtYMjY2a3plN29SQXNiY2MrdzdhdjB3Qzhacm9oV1dV?=
 =?utf-8?B?ZnlKdVRCeTU3RllhanZyc29lVnVuQVBJTFQ3ZHhhMXFSYmxCOWJQbjFlZkV6?=
 =?utf-8?B?WDdXTEJ4eWQwbDlPeHBCYmJoNnhsb3FIOHdqeS9MWHdHSXdDMnM4cWwxWFNa?=
 =?utf-8?B?b0ZvQS94aGlwaHBZNjQ2MjdjbGFhNS8wT24ycFNUVHdoMUttSWN4cHZEMzdF?=
 =?utf-8?B?TEFlaTlDWmJwcFd5d1RzcW5MbFpWOElXQTVsV2ZJaWFjdFNKWTBtQWRLR2ZT?=
 =?utf-8?B?eUwzTVNFcWlWVkorR0NOMkl4QkZwZGZzTmJvOVJONEg0eU1ETTNvOGFtc2xZ?=
 =?utf-8?B?SHJxbjJiOFhTdzZBSlp2YU5GaVM2WWw1WlhKUnhEU2VtMUFWRnhuVmdkdzRB?=
 =?utf-8?B?S3lFNWgyNDAyZTMyNVJYS2VjamRMUGlBSFh2d1FlbTIyTEFCRjhEQVpVbG1t?=
 =?utf-8?B?UTN2NHhUajhsSVJVOWZqR20rUjRhNThiaE9ZVzhlUWhXdEd2LzRLQlZNWmtI?=
 =?utf-8?B?SjRXUWp3b0xyTmE5VzdxK1VGSVFNWWhWc3BIOFh3UmFKbURobEhjbUd0S0RK?=
 =?utf-8?Q?Aw63bYQNafAI+tEHlJEctFLhP0DT0BrH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2RXeE8zMUdCYUZ1VnlPelZ6WkRuM0RuSlVRUU5WaFJ1TFd0ZlhncEoxaHll?=
 =?utf-8?B?LzBYZm12RFRndXhlSzlmYW12YnVrT0c2S0NOd0xRdkdpcnlnTXdRTWhhNCtt?=
 =?utf-8?B?Um1JWFNCeHROa25zcTlSRzNjZGg4Y3FjVkp1RTZUS0kxdjhuU1pCa29SZXo4?=
 =?utf-8?B?SUVudWx6aFFzSndkZm5aZFNvMEdWM1laN1B5dFdHZ1hQSnNpR3BBNTMvcTE0?=
 =?utf-8?B?eHg2aVNUZ20vZEVqc1RLMEkwbVBONktOQWhwSEhNbENUL2t3N2FBVHhSanNx?=
 =?utf-8?B?d1FGOG0zWUUxTDVOcDl0N04ycVl1Y1h2R2RrY3A0eDZIaWlRVFhTamcrSDN1?=
 =?utf-8?B?bTRuT1ZMRVdMUWxNY01SdVYwbkozTnJqMU00NWdXQ2RoQmMxb1Z0MTJxMFpN?=
 =?utf-8?B?Vml2c0FrdENEUTFtVmw2SXRwWTZqYi9BUlFRNCsrNldHWFJLVHNZUGloVWE4?=
 =?utf-8?B?cXhZdUEySHVYWUlQUFhRMnRMTjFqMHlhSEI0SkNrbyszd2ZWNUwvaXA3cENp?=
 =?utf-8?B?QlZma2JZblA4U1BXK0M5K1NEOEhlUmdYazRxTklKM25LNytJU1RnOTFlWk53?=
 =?utf-8?B?Y2VNVzd6b3piYzlYMmdtTEo3SGMrNTViSDB1amEwQldIQnE3eEZLc29Hekdv?=
 =?utf-8?B?bzNWdTIyTy8wRWQyUDEzM2dnZHNlTXVPK2hLeVZwbCt1Q0NUT0Q2ZGRENHBL?=
 =?utf-8?B?VDlnaHJ6V1lpU2dHWHdBbS9CZk9IaDFidkh3WEJuakFDRGF3cVNnZTZaR3NZ?=
 =?utf-8?B?Q3VSb3hBRmN2Z2kvNnZHTUx1d0lhWTBicXlVeVNmWG50QWcyNWI1MDl0eTRo?=
 =?utf-8?B?di9BQnN0QVpmamVrQU1Jb0FJR2Z1OXlSZGtKdjNSZUxMVXdlWkpuWS9WeU5z?=
 =?utf-8?B?UXRJVTJ5U2ZkOFFPUU5veldTSlhwb1BaeEhuc0hMQnZ1bDJYSlVaRDl4NzNw?=
 =?utf-8?B?ZjRmdW1raUs5bE1xV3RweTlBa1Q3TTkvMlN2NUZUVlZIODZSdnl1TGtXYzJU?=
 =?utf-8?B?WFl0MUNZbThJRi91WlVFTWU4dEFFbTlTbnJTVVlNUVYvMENrd2IySExPeFc3?=
 =?utf-8?B?SEhoZk5jdlpSTmhhVVZ3YVJZRnllamlseHBJYVZmRUJmcDEvcGJVUTd3Wk1a?=
 =?utf-8?B?RzZqTFVLWEJtS2dMMjFCQTJqSERGMGNGMjl5Wk9NaDNjNzBsNkhjME0yd01x?=
 =?utf-8?B?SlFmaXpQNU5haHBKYWM0R3RORFFkamw4aTZDNjdFcVl6VGJhb1c3Q0xIMlU0?=
 =?utf-8?B?Nlc5RW5vWTNZcmRHOHltcGI3QmdBdlBxUGplRGNHQzkza2FGanRTSE0zbnlz?=
 =?utf-8?B?NENpbWtmTDl6SjhHdGNhYXBFd3ZpV05aRVlramFzWWN4TWJtQTVzWUU3V2E3?=
 =?utf-8?B?N1Q0ZjBMK2ozVGFKNjVLVjlibnlXbnIzRklCcXBnNml4QWRTTGRJSWhmK3Va?=
 =?utf-8?B?YVhBSU8rNU9SRVNsQWJYSC9pZmxsdFpWQnZMeGxmbExoUUJBZk1wSG5vMzNy?=
 =?utf-8?B?WWRuQnVWeWNjNDQyVlpxZkYyVm9xOEF1OG5mRHpUeVFTZFBuM1NuSnV4OUdi?=
 =?utf-8?B?VXBOaWRJRmx1ejI2Mm5ocnVhZGJjM2dxSTUxWjZ5NG5aUUE0MUN4NWJ2WHhX?=
 =?utf-8?B?aU01Qld5MTRLRXI2c0hOYzNlajdxSDRqNmVhQTFkQjhNZDJPVkZvNEVvU25v?=
 =?utf-8?B?L3lKR0pNTDVPNWd1V0J4RnRibGR1aGthcjNjNUVoOCs0cEsyV1Brd0RZd2dp?=
 =?utf-8?B?WGZNblQzY1gyNUdITnJlSnpJYmh5RjhPTzMzSjVVSnczczlDZ05NMzRrRS9R?=
 =?utf-8?B?UmZQSVVDOTY2cmxkSjZla3ErdGxwbnBudXZoYjloRDJMUHlJWjVLZG1IUDc3?=
 =?utf-8?B?TjdyaFZ4ODZTVnkvSmhOSWRtdlNTRlRBTzZVRldac29EWFlNQTdLV0NaMktJ?=
 =?utf-8?B?SXpBS1FkLy9mWEVaT0hndDVseFNmRkw1VzIvNERoWmtlQ2dRZ3JSeVFGZXIv?=
 =?utf-8?B?N3JCUkVWRGUxeXN6U1AxdHZlWGtxdVRsQ0I5dEU4Nkl4bERmNWZYdVNVTjd4?=
 =?utf-8?B?eHUyUnIyNHhBUnQvU2owRk5GSmNuVkFtczhiVEo3ZVo4REJPZzVzWDU5d0x4?=
 =?utf-8?Q?lD1NODVnpoKhWQflzXWSBSDSk?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96100735-61d5-45d2-18b7-08ddff61730f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 14:06:56.9596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/iRwamMT7IPctydVOMGosR254Bdz9tz4C89XTva8wbyn4cJ4uUs9v8MJH4/lAYnQfLY20hFmetx72eYGl8Aug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5836

On Mon, Sep 29, 2025 at 12:36:30PM +0000, Teddy Astie wrote:
> flush_vcpu static function here is only used in one place which is just below
> where it is defined. Inline the function to reduce the noise and clarify
> what we are doing.

Did you check that the compiler doesn't inline it already?

It seems like an obvious optimization for the compiler to do.

> No functional change.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/mm/hap/hap.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index 2f69ff9c7b..407c80afab 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -721,11 +721,6 @@ static pagetable_t cf_check hap_update_cr3(struct vcpu *v, bool noflush)
>      return pagetable_null();
>  }
>  
> -static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bitmap)
> -{
> -    return !vcpu_bitmap || test_bit(v->vcpu_id, vcpu_bitmap);

The same construct is used in shadow code also, maybe it would be
helpful to place the flush_vcpu() helper in a common header as static
inline?

OTOH we don't care much for shadow, so it might be simpler to leave
shadow as-is and do the change just for HAP, but would be good to
mention in the commit message why shadow is not adjusted in the same
way.

Thanks, Roger.

