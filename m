Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA2BFB61C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 12:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147874.1480015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVzE-00083Q-Sf; Wed, 22 Oct 2025 10:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147874.1480015; Wed, 22 Oct 2025 10:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVzE-00080K-PC; Wed, 22 Oct 2025 10:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1147874;
 Wed, 22 Oct 2025 10:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+n4a=47=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBVzD-000808-3i
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 10:22:31 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02640caa-af31-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 12:22:28 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 10:22:25 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:22:25 +0000
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
X-Inumbo-ID: 02640caa-af31-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bY4GqyXmCd1G+Py5M5vfPkvMrin1WlfKe0JZmlwEM93JlZQ98yZvS9LtAD6mWhK3jJOhctNK2xpt8OrvJ1HWrZ+XOrxqh2vMDGHjoaw7c1QblUaRYKiW4EQHjo6sXJIdGBep+cWyp5WaRJ5OZoK+g/rYkZd8+SdzJN5FPQwsD3UJx2NHKQ4QT5GecqsG6jTipYlA5I3URWDw0NbO1+gdro0XDKecPACUbCnBZ9hqKZJhO4HfJWp6Y7ihhO2J7chF1uWNBFZ5irUsvIDIiYN6NlK0PVyIyWo2p0UUUqRkNmu180Fs4qZA+Fj2w67I59i9S0xll0Y3BhmTY+LMYgSh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuYiw2ae8Fg33zEpy9lQRUQxB0jHdD2BLe3ApLa6Alc=;
 b=qvVLfHpp4cjREEjW9jeDh5US4uNmvxNJTHTJY3ZzWHU6qNrZLrqG85xY4dEwMCIt0dzpWLQnT3ZRUI5l1ymhmi0MLBzxz9GryAZaxMtrAfa5R+32H9dqYojdEjiLtx7fcnZBlhJSJHJ6W00S4g4orQQE1Yw4L2eLxb090mErvSHc9UOjbWf8ucM5dmiUzXydDYyDJlI0hKhBpyyWd9R/Yf2IeJGU21qjOh969uReXXlJcMrlpqxFcZEAuXsWMpoxonswcrm47hbqCmYKNEd4uDH0ssodNLKYyNRRNdnXVPyPMx0QUUgCgn5CFGkr1N379eBIo2S9hebYz2eDppFCSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuYiw2ae8Fg33zEpy9lQRUQxB0jHdD2BLe3ApLa6Alc=;
 b=IppvCc17t20F5cS6c23hw3xrR/nlgIQ/Im52mO8f3fraLUQC66xHSLukijGpdTIFdDdfwpO4M9Ss5LPIlsMccgU7y6UY4mFmYY3G6bW7QSGYix7tEpKZz7IgU/7UPEFnYtHl4pF9NgOrey4SCeBvPqn/mjCynuytNSs6GVemAOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f99480af-a67c-4e7e-b191-06859b625cdb@citrix.com>
Date: Wed, 22 Oct 2025 11:22:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/ioapic: Don't open-code 32-bits rte reads
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1761124632.git.teddy.astie@vates.tech>
 <819a011a32c608f4aefaf692aeac5ee47381a998.1761124632.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <819a011a32c608f4aefaf692aeac5ee47381a998.1761124632.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: bab6bbb2-fe93-4ff1-446a-08de1154e528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tno1bXN3SGdFUjBlbTBzR084NGV3dUlFU3NYaHkrZSt5K1NvYUs0NmlQSXFQ?=
 =?utf-8?B?RmRYbWpUaXpDSXg3Z2o4VFpUQlFhNnprUW9vd0E5M1ZGRkFhWlhmUzZLblNR?=
 =?utf-8?B?NldxMUJSTWxXMm5XV2txWDZoMFZRbjNPK0xhSXhlNUtIVGhRUUJidUc2YWtK?=
 =?utf-8?B?RnVPTHZPbWpZWmlKYlQ1TVMxeFk4UjM4cGEwb25Tc1JVTXYySFFUYm1FREU4?=
 =?utf-8?B?amhwNUZMZFE2RUp4d1lsYWtscjB4N1lacGJaMEdZS210TWlRaUJFYnRxQklG?=
 =?utf-8?B?SUtuN1ZOc3g0YkpsR0VBeE9idzEyZlROYzdDMVBtUFBnQ0tzcFZiVm9yMjhI?=
 =?utf-8?B?RjVLcnppSWZQbkxDenZrLzhleHUrSlhxU3hWTTMrbytxcWJOeFRjMzFZZnIy?=
 =?utf-8?B?Zyt2SHNYWWgvRDZYNEhRM3Bhd2R6YmFsZWtUV3lOMkJSdTgxc2dwYU1vSHZo?=
 =?utf-8?B?OVUxWlIzcTJ2N1I5dmhNOFFqNHhlZTBDWExBUTRiOFhVbXBSVEFrUnZCNmRn?=
 =?utf-8?B?bWJtUXpQUGxZb1BmemdZTXlkcGpEWEZzZlROZm9jb1RhRFViTXZSOFM1RkVR?=
 =?utf-8?B?ZGZ5QzV4RVMxRnBKQitOU3VpQzAxL0tCSWxCMHdZNlk1cXBBcHJ6bjdwTnRM?=
 =?utf-8?B?T3FUY2I2Y3l3dStIaEl6Wmd3R1o2Sk9MdFhqYWwxQUlPUDExdGhvTlF6a1Yz?=
 =?utf-8?B?N2JJUmNEWEc3cG1iRkhlUmUvU3RaU2xMbWtqSExaVTNYZWRRdmo3UXRYV1lO?=
 =?utf-8?B?ZS9KU01tcFJBVlp6eXlVLzRKQ3IzVnk0T1VVaWttMVFMdzZPYWpZeENqREVr?=
 =?utf-8?B?clV1Z2pCOFdjWm43T0djT01MVlNIeE5tdGFBcEpMSHU5VHpTZ0o1SENNem00?=
 =?utf-8?B?cExQOXpUSE1JS1padVlrTGo2NmlvaEYwWkNYV3RjTlhId0tQYWY0elBMazE1?=
 =?utf-8?B?a0hBRnhLbEJ6Ly9KV2ZRNEYzYkZLUU1TYTFDdGJXRlp5cDQrRG9oakd2N0pr?=
 =?utf-8?B?bGxaT3dSYmdwUGV0aTRsN2hlQnBIcHFtS2owZzZ3NUxGZVRNUG1VT0VLcStj?=
 =?utf-8?B?bHlpUmVsbTdjZ2Z2WjZMZHZDdnNFZVlJaFV6M1g1RmRVMnZpeVBtb05rY210?=
 =?utf-8?B?c2xab1pOZ1I5MzRtQzEybXlIbTRsWHgzcnQwYWp0K3FFOWRaVkM0bzNBbHJR?=
 =?utf-8?B?ZHJIMEp6Q1ZocmV6RW1Jd1JDYjVyVE1MZStxa3pBdXRGQU9uaUhPajduUVFq?=
 =?utf-8?B?ZUhOQ2JIT1ZRTzB0cnA4emFYVHRqcjRvdHFxbGEzU1owb2EyM2ZsckxNRGcr?=
 =?utf-8?B?dmFTU0dJRXZIN213V0JuM21lNnY4bjNDZ1p4M29QYzJlaE02SEJTWDRad2t0?=
 =?utf-8?B?eUdxQjdZSVZvejI3cVpMRVpLRGNsQmJDSVRNUVFnRXFnTTR5cTlVL2U3S1Bw?=
 =?utf-8?B?TCtUaTYySlRxaWhuZEZUM3RNK1VTQnZvVEVaQlVaRkk4WXdVV1ZYaTdPa0dC?=
 =?utf-8?B?ZDJ3V09HRWdCeUJ2OVZISUNzSHZIcG90WGEwV1FqQU5kbnM2Yzh1QXJ5d1VW?=
 =?utf-8?B?eGNvSWV3aENiMGJSN1FJNHI2eEx2N21BMHVmaTlBSXduMElKOVpTY04zSFNk?=
 =?utf-8?B?NDNHVW04MzIzVkwyMWp1NXN2U3FyYUpnOGwrU2l4ZUFXd3lnYjFEU1pxWjN4?=
 =?utf-8?B?bm40MTFZV0R2Y0xoQzIrVFFxdE9vNmphUkhaSkJMdTVLc2V5MGZZZnNnRDhW?=
 =?utf-8?B?Qkk3enlNSW9Cd3ozSlgxQlJoYUljcTJMWUk2VU5TMVRqeXdVRURxQ3BkZEs0?=
 =?utf-8?B?TDVvRi9OeHp0QTdTOUJpNEhoNm9PbFJlNHVVdDJOWkpuUEpWYk15NmZzcWkz?=
 =?utf-8?B?c0d1eE9WYmtrRnY3L2FlM2phc0d4a0ZCcHZaWlJYVVhJKzI1azErNnI0ZmQ1?=
 =?utf-8?Q?85z/PQ/giC28s2aKQazogab4qLlsOv2e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aytMeVBPNEErTnhSZ0dlcm9JaTZHL21md2NTUVRrQjdzbWJaRWEvS2EzZUt4?=
 =?utf-8?B?clBqbmkycWVteDdzSlFFdlFjS0NlbUErWGVHcmIzQ25DemllcnBhcXVWWFJ1?=
 =?utf-8?B?TjhZYnUydHorSkx3MFZVMnNGbFJTWXg5WjN2ODhDS3dYaisyNWJRQ0R3VDY1?=
 =?utf-8?B?UlR3aHdFV1dBVERydzNmTDVOd3BsV3JiTktHaDR6MzJzczl4ZDNrN0pCZm1P?=
 =?utf-8?B?bXkrbzNxaGJhVzRaMEZVUlUxVHVNRkVXcXFuS0xFc0dUL2UzRWVBUlB2NWtX?=
 =?utf-8?B?TFBZUjN3Z3pvNVpwLzYreUc3QTlHS09meHM5QXlLa3FmOTMvMzZCdVhzUlNk?=
 =?utf-8?B?cmljUzZIeU5Rb0pFakhhUDloY3diRmM5WDBXM1JvRXRoclQ0ejJMMk9RNEhl?=
 =?utf-8?B?NFQxUFQ5QWFzbE9nNHRxS3dlYVdUNFM2UUdkdzZkR1ZVM3dBam1TQmZaVmE4?=
 =?utf-8?B?RGtYdU5Wck01SkpaYkptSzBXL2E2RUl2MDNvTzBkc2QvYW1iYVlmeGhsZ1V4?=
 =?utf-8?B?WTllSE1WQXcrMjZraEN0eUhKdk9aM2QxU2tsdXJVVDgrRDNzcjFNa25pTk5U?=
 =?utf-8?B?SEpOTnZ0MnhxZUhSTnlkMERQVnJwS2QzbGExdGNMU2c3RVB4T1RLZUtacmVW?=
 =?utf-8?B?am1ieDVabEVXNmhJdUZDcXg5L1ZKOTBhMklIRDlHMWRidm5Xc1NkcEFnUkN6?=
 =?utf-8?B?VTlLOUdBdDc3Z0sxdFRCZjUrcERETlJLbmJsWGQ1aFk2MU9Od2Z4Nnh3ditM?=
 =?utf-8?B?UVI3SC9Fb25BaHBGdDRWZktpUDJESWFRVm5FNlhvc0tIeXVPN2N1VTlLVWdp?=
 =?utf-8?B?dWlGRTVUTENwNGR4clhRRk1Td2l5akJCWE9xeE02T3pzdkRZVW9YT2E0VjBu?=
 =?utf-8?B?WTI4allSU1gvc2hTL3Q0TXFQYUhHcnBreXkwdTNIRjRpUGw2OFR2cW5Gejcv?=
 =?utf-8?B?YzNjSUVjMU1UZGpyWk5RYmFRSWtoVU5ET2VVRkx1OHR4c0tjRmhGT0tpS1ZN?=
 =?utf-8?B?ZnJvVVBDWXlmM0xhcVlPZHordDhKZDZTYTBndnJiSGZPZHYraUZYVElqOEJP?=
 =?utf-8?B?c01qR2tzTkhWTnZSUFpQN0MvcExCMjZHK1ZCT2pnTmcyQ21yYkpUYytSbHRQ?=
 =?utf-8?B?QndNWkRzQXd3Ynh2Y1BQTUlMUUJvams0b2Y3U2hTZk1WdVlRRytjdkFhc3I5?=
 =?utf-8?B?ZVRNSGROZnFXZmQyNkVzd20zSCtsNTVRY1cveXVjQ0NIOHVkWGtpTXhwc3VH?=
 =?utf-8?B?Y2Y5VTgrcFVoWDVDOWNTSDB3V0dOam05Z2kzMzJ1cXdYZ2hXYW9JQkFzczlt?=
 =?utf-8?B?bzdEZHIzbmNuU3NuUDZhU2J5eENDVmIwTlQyWW95NE5UWkxybTZsczBwYVRi?=
 =?utf-8?B?OHFJTnJPTnNZRTBhYURFdkdUbE05K01HSGhNdWw2QVgzL0xDRTZTcXNvaVFl?=
 =?utf-8?B?Zjc1Z3dQeXcrNm9DQ000Mkpsb1dxL0llaGphZ3BteFUzM3V1cUxlZ3hBWnd6?=
 =?utf-8?B?dlhhdHdaT1Z1aUN0NEtIOXJsYVJYSDZUVkIvUVphSEVOUzZNbnJCZi95TnVU?=
 =?utf-8?B?QW9YMHFURkRKN3RFQUU5cVF1cnBXTDI5K0pYV2hmSVFGQjVPODh0aGtJQzlJ?=
 =?utf-8?B?eVJvMEVEMU9BTlJaY3N0UnppZmFzRkw0bVU0TWdWRGt2QlcvdXF2UDhEQS8v?=
 =?utf-8?B?dkgzMlhkTDF2c1ord1Uya1l4aGZ1MmNMSUZtNjVLTEcxRW13V3pGeU9CZmEy?=
 =?utf-8?B?UmFQaGVveWpNU3BENEFDU3Fpa21rSUphRG8zNWRCYjRwUXFua0xYclIxbTRP?=
 =?utf-8?B?M1FQRDZVemVsQkg2eWNYRVZDamhGeGVvTUdyOHZuZCthOW1Nek5yZk9vcDV2?=
 =?utf-8?B?WUQ2dVd2cDUrTDNKNHVJRElvcU1UNEtoTkE0bzRZVzlKWkZuSk1qd2J3WGRN?=
 =?utf-8?B?R2J4N1JzbXV1VndGQTJVbnF2WFViTVNxK1pkTkxQa21aR1JvYkptUlV0UENG?=
 =?utf-8?B?bEpidEp4V0dlZTFPSXdWNFNMTysrNkJvR3hyWCswcTNtbDFqL1RuMW96MHJt?=
 =?utf-8?B?TklraG5TQlA4SFVwaVBGVlMxNVBoRUJ6S2ZiN2dia0IwYjZPVTlWdjExUTRa?=
 =?utf-8?B?cDU2cHU1VFBka1RNTnlKRno0VGg0Qlo1K3AvdGpKOFA5SWdmb3RIbEhHaEt4?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab6bbb2-fe93-4ff1-446a-08de1154e528
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 10:22:25.4493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mh6jiUDWjArxoBqVLsK7ouoHd2WiKCBUDry1saiJ1NXKKKeI0zGEfTCBy+vHqI8NfHLiSog1FghAgpsnFb36XY24lDjNCQ0hfwWxdmNnYNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

On 22/10/2025 10:51 am, Teddy Astie wrote:
> diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
> index e0314aa469..3cdb892559 100644
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -399,7 +399,7 @@ unsigned int cf_check io_apic_read_remap_rte(
>      unsigned int ioapic_pin = (reg - 0x10) / 2;
>      int index;
>      struct IO_APIC_route_entry old_rte = { };
> -    int rte_upper = (reg & 1) ? 1 : 0;
> +    unsigned int rte_upper = reg & 1;

bool?

But overall, a very nice cleanup.

~Andrew

