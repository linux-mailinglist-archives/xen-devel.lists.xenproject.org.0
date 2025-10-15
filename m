Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0838DBDF020
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 16:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143713.1477353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v92RF-00034h-El; Wed, 15 Oct 2025 14:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143713.1477353; Wed, 15 Oct 2025 14:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v92RF-00033D-Bw; Wed, 15 Oct 2025 14:25:13 +0000
Received: by outflank-mailman (input) for mailman id 1143713;
 Wed, 15 Oct 2025 14:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v92RE-000337-1A
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 14:25:12 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1b8552d-a9d2-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 16:25:10 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB7226.namprd03.prod.outlook.com (2603:10b6:8:124::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 14:25:05 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 14:25:05 +0000
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
X-Inumbo-ID: c1b8552d-a9d2-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+bvFwyUTLo0ozW8jIWEsi8INhMJ0gfg5dTjkp4zhcN0n2Z+MxrspaOQsIHYxD4N8zIv4Za3/3UgIwiRpa6bKcqSWoCa7CfSrI6tfSHGMlB0cE0R3Wkx96efzTOQtY4MgKg9tcPL7YrKIxmE57JHHjW6M46iJR4mqw/HQ0X3+8tOUkopQcndqxzZ66AOt7u3K3pdJXfqLuuCwd0Ejexei6ysAP9AD7eZDuCPM3nNFDeVTgILqDmV/9/KogL9vIGbGIoYliUKWFw3rW6FsBOF9VmRnLMiDMsw0mkpwG2WVoz+gzhRPNVtxhDq0zW4WFr6pPXMiF7B35hTfzQW8wIebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QImsDN2wK5fEuya1HulGCy+SFNNLC+96ZR78mu8jqk=;
 b=KmXXlacJRBEKJRO4CuYJ6R6zl25n15bBWT5fs8XsRQyf4oH4Fe7WVLDeyU+Zt1PPdRm5g+zfyCpSYWZCOHIeUTdYDT17sxnQxP7uH0vOnS1GslLbnyyOJ44lkHYWBGezfYjR8x9BLQ2BIda/dL5fmV6cnSTnOSdl6Cayw13AcjmsqrNKFG2+cEEPvq5hY7p9aGuUDSz6zJMpH0o94IBGO0ToxwUdV95sFqGT+JhJyigvjAd/XKxygtd3WBRyVnaIhM0XBxeLi3z71QZ1XJJfoioqfDJuj3E5FMqg+3/JSa5eyTQcTiE+0SFWZZOIxPKf6G7VpKTnR2AMSnEXS7wUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QImsDN2wK5fEuya1HulGCy+SFNNLC+96ZR78mu8jqk=;
 b=DNqbSTmcg0yTNKwv7rGiDUYQoQz0zUW5o/2SvUui4PsfYPMaLDueZwDm1+CZk065lOFQw5Yumhr5aq9XkINmjVOman1lkTpIz30qk4kR8sRlL84sAxOhsDT8jJQdoEl3w4qSxgmmLcTquPk58jZc7bM8nAP3Lejp37QrfVdR+Oc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 15 Oct 2025 16:25:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.21 1/6] tools/{lib,}xl: fix usage of error return
 from json_tokener_parse_verbose()
Message-ID: <aO-uvRMvSsz7w9Qw@Mac.lan>
References: <20251015134043.72316-1-roger.pau@citrix.com>
 <20251015134043.72316-2-roger.pau@citrix.com>
 <096f8bea-f8aa-46cb-9d05-2d222d517fad@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <096f8bea-f8aa-46cb-9d05-2d222d517fad@citrix.com>
X-ClientProxiedBy: MA2P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::18) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: 973be1a6-96ed-4071-5487-08de0bf6a29d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0dERFNEcDRyYUFHK00zSW4wSjBVeEdPWk9lc2lvdElJZUJ1TnlUdVpwcUFI?=
 =?utf-8?B?Zi92cFFBVkRLSlQ5d3hnOUlFNDAzU21EcVE0SDZEWWw1bEl6cEFieU9nU2xU?=
 =?utf-8?B?Ykl0YUxFc0dDNHJ2OHV2SE9teEsyZHp6bE91UHMzUG1Sd3JlaUlCeFQ1c2Nz?=
 =?utf-8?B?ZHhhaWQ4RkRIbjBVaXQ0VWxNdGxZb05SdmJlVzl3UGV6UmNaY1NiVHRXQWZV?=
 =?utf-8?B?bk01WnRlTUMzNmNnbVRtRzc2R3I5ZTdxR2JZbXlWQzR4UDVDQzRXTW44anBL?=
 =?utf-8?B?M1FDZjl5ZXVJb2RhOFU2bzkwTnFjNUw0QTdLaGJoeFg0NzNvY1ZoalgzcHhi?=
 =?utf-8?B?TVEvSkhnaFQyaGszSjlpQ05WYlljREUxU25FQ0Y5S1M1OWo4OGZuQlJTRWpU?=
 =?utf-8?B?NFN3WkVWVUVZM1pyaFJrRXpRcm5WYThwdk9hckkyaU1rejgzUHZuODlFMGkv?=
 =?utf-8?B?WXowQjVHdWdKZjhUNWMvU09tOEhDeEFyRzRGYXcvdmpldGxvZ2g1ZFY1dUtK?=
 =?utf-8?B?dC9Sd2hDY3k0aUdTeTdPMmNteS9XWkNkVDZZNWp4MjdFNlR6ZTZqR0cwK0Jn?=
 =?utf-8?B?RnpKNHdJWFBld0p1N09kanJmUXQ2ZmxwOEJCYlNrM1FaQ3M0bnp3eCtUeWJn?=
 =?utf-8?B?UlI0K3hlQ0VmM0I5a1RteExHVWp6UEdreVZkemcyMU9JS3Z2QmVSZG0xbEFI?=
 =?utf-8?B?bmsyeG01TW1MOVJRMmN2aDRCZG95RS95TWVlbC9nSkxMVWI3TXI0NHBNMUdv?=
 =?utf-8?B?S3grNG1iUUVvd1NnZ05zTkR3STdpUE56VGxyMjZ1czhRZ3NXbDhJM2JXOG9a?=
 =?utf-8?B?ZExXSFBpYklLR1RUazZ2Q1JtemtTaFVkQ0Y1Zkt3aG1mbDJKNUROWGNvZFBo?=
 =?utf-8?B?WlhIc2JIWTJVV2dxZU1ZNmwwOGg0dzBaU1lTVTNjd3laNVV3NjlHK0tUc3Fr?=
 =?utf-8?B?Skdpc1BGR3pLdFF3UWR3bEUvRW9lLytVa0lDbHNQaXFlVlM2QmtuSDJrZnNM?=
 =?utf-8?B?NEpNdERTOGJ0TEtmd21rOENJYVRpdUJtY2FUellodzk4ZWIwV1lTeStLdUJ3?=
 =?utf-8?B?anM2Q2ZLMjZhbUJTRG9xN2xFUkZrbnFnMzdQV1B4VmFWakFYOCt0SENicWwv?=
 =?utf-8?B?ZHRmM1NDd2VJL3pVbTN5cUxUS0o3TTVyQTAwRlNmUWlPc1FFMnpYcjN2Qm5Z?=
 =?utf-8?B?SEFYS2JJdWhXZHpUZnNzdGlkL1U1MnpVa2t3dlBBQ3p1bVVKTWhXbUdnaUxZ?=
 =?utf-8?B?WEp2R3ZxNjlvWFFJZWR3WEtjdGFuVnVKeDk2WHNlM0RXcUhzczBDK3VTVjVk?=
 =?utf-8?B?TGpuNnpmdEpXSVhlaGw1UzF0Ui9kZ0NhZnl1UURvdnFuVkhxL2FFNDlTQVVi?=
 =?utf-8?B?ZklrVWh5UnJldGtoaUhmT3o1RWFJNERMVXZYSUt1dm5GaUdVNVpBd0U5VS81?=
 =?utf-8?B?dFYwbmx6YUU1bksyYmt0SmNNMmx0ZUJDakFhelJuZmkvOFRTaG15UldpY1Ex?=
 =?utf-8?B?M3B0ZVhNSFd2L3hYMkREUWpFU0FxeEVBVjhzakZlL21naEdmSmVsWlJRbTRW?=
 =?utf-8?B?UlRaazlpT2N3TThmTGxJRUlmbi83YzFRTUJzZGRiWm9Cakc4Z212c0RCT0w3?=
 =?utf-8?B?UzFDS29Ya3dYWW1kNXhuMUYrT3N1ZWlqYjJERWc1Y3hMTHVMclRMbFhKejhI?=
 =?utf-8?B?TW1GUlNmVEw1bnZKK0J2TGlSdjBjSmYwTGljLzRSdTdSQnFnbitmK1VJa2Ir?=
 =?utf-8?B?blF6b2xhYmpHcU5Mc1A4TlI1ZmQ0c1c3WS9yY2RaVVk3VTIxWHR2emtKRXkv?=
 =?utf-8?B?LzhCbUVkM1RMeHpWeGE1a3NwSG9YajFTTE93SlZNeEdRM0pDNmdQMk02S2or?=
 =?utf-8?B?TUNVNURwVHlZWHNHeFo3ZWtIUWRzS0ZrTWtUYnF5QUpMZjZ3T1BhN1d3ejBE?=
 =?utf-8?Q?2hxVvnw1Vzly+daeAsg8JakSfYnI2Pvy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUNXRWhpdjJDNUl6bGJZbGJId3RBTnJoWFR4K20yWU5VNGRhTzh6cHdQc21Q?=
 =?utf-8?B?M1ZzbGdpT1NjVS9ENzZlUFppQ3JQc3lMNUFQdUxwUmZRcC8wck9UcG1NWFBu?=
 =?utf-8?B?dDN0SnRwUGdIQ2ZLNGJyNkdaK0xydmIxaWJCYjJFWjluMHhXTGZVekV4dm9M?=
 =?utf-8?B?MTNYZGJIK3pHT2FQYmVDRHgxdVNScDdjV0RacjU1Zzd2VFBTM0JnUHFDN3Nx?=
 =?utf-8?B?L1podGVqNUFYV2x3NmhrbDJiTnhsT2sxZk1xMG53bDJZL09pNGUzek94V1Vy?=
 =?utf-8?B?MC9XRW1PeUYxRWM4NU1YUXJMOUYraXVJM2c3SldvMGJYSGJ1czZnTkZ0K0NJ?=
 =?utf-8?B?RjdRYjlSNUhyRUZMUm9oQytUMmRyc3ExeXk2Q1JTMVlRVWxDc3VSR0JMd2JP?=
 =?utf-8?B?OWkrcDV5V1Eyb3RteHlPRktmdGRjWjhMd3d2REV3RXZyRkdHZUNNbDdnT21j?=
 =?utf-8?B?eFVqcWVQVnBEcGRzcDdzMDAvamp5TGZSUm1qc3N0R2tQOTVIbE9DcjhaWksy?=
 =?utf-8?B?eDlYekorTExTUDh5Yk4yK1NIQzV3d2twbnM0d2dUNlBkbVlEZjBBMmFUZDla?=
 =?utf-8?B?RTcrR3FuZTNyYTVkV0RFbUE2UVVCZTVNNmlNem1YQkFRbzhrZEpkUi9SbFpK?=
 =?utf-8?B?NllMcHN4VzB5aHJIanRZbnh2aC9KaW5wUnFiZmJweWhLY0NsNDdJUHNKeXF4?=
 =?utf-8?B?Z21lb2cva0NpbWNCUlVaRmxjMDRSdTB5QVZsbi80aHBaZm5CSzNTdkJURVlh?=
 =?utf-8?B?VlgwV3hNZ3NtSy9ybDdRK0g5YnQ2UTJ2QU9IbmRxOVlUZm9VQks4SlhNS0l1?=
 =?utf-8?B?RitsQlVMbUlqWVRjUVRQR0RBQWhDWlVnWVRwTzJlMkVYSVo4ODhrcDhWWTgy?=
 =?utf-8?B?b0VWSVE1UnZ0R1paMFJreDFnWitTQVRYbUI3VHYxZDl4UzJOQ21teXpVRFht?=
 =?utf-8?B?Y1oyQ3VGaUx3dVlWNmVtblBDQWNtZE4zQTNuVDBWanUwVnd0Z28xdUVqclAx?=
 =?utf-8?B?SmNpNWdxMUEwaEJWQkFpRzVJTnE1dE1TSjdUWVhKTmtxVm1DckVab2JIM2dW?=
 =?utf-8?B?UlFBd3dsOUtoT0wvRzdOdm8wTWlpSjRCbSsvUmxYM0xaOVloU25LTDJkdHFU?=
 =?utf-8?B?NUR4b21WRUZtYkEyU1RFVVAxaU83UDJCaDBpV1N3bFNOanl2bzJkSHl5Ujdq?=
 =?utf-8?B?anVzMjg2RkJlTC9EQU5jOWNWUjA5VmU1bWNROXd0U0ljVEpDVjJzeGpwU3BZ?=
 =?utf-8?B?QWlQVmExSzJwN1RESHVsSVBlSVRCcXZVZnJDbWhDZnQ4bUNVS0ZuUE5oVldT?=
 =?utf-8?B?UEV2TXJIb3hnN3h1VHM0eWlRNzE5UmdyT0pBVTZ4UWRWMkFQaDFxWHNnMzBX?=
 =?utf-8?B?a01YRnZRcW1sWjBWZlp6aEFKUXFTTCtWQ2E4ZDkvMGdZSEFxQ3lmaWNibTVw?=
 =?utf-8?B?Wkk2YVZ5ekZKSDU4aG0zTDFiWk5Mb0xHN1Y3aHVOZ09WcGZTdG1taStBd1U2?=
 =?utf-8?B?SUdHQmVvUlJYM3ZSS1F3QVpWZ2FzdzBJUjQrbXdVWDl4TFVTQUxlYjlsYlRR?=
 =?utf-8?B?ZURmY0J5LzN5dGtDeFA2T1RweFh6N09SSkZRekRHQlhhVHpwelIwY2dmT0dy?=
 =?utf-8?B?dTFENHZoUFdQMmsvVFhlUUc4U1ZBbVBGMXVHdkRRbTdQNWdkMHFRbW5RYzJZ?=
 =?utf-8?B?Z21ubnlVVDIzSGJLUElFVTg4V3k1cFJYYnd1QXBQZGM1ZTRyaUFFbURwMVZ6?=
 =?utf-8?B?ZHdsVnJITVBxaDNqTWRxK2xwUWYvWnpIV0h2akZhc3ErNEZIMStqbXFNT0xi?=
 =?utf-8?B?dDFuWUtqK0NVSk9PTUQvRUlMVE0wZ1VPU00wTUxlWExpN3ZCUWRSZEpJZU1R?=
 =?utf-8?B?VkM0ODB2R1h2OXY5anFJN2NMS2NyazNwcnpOR1hsdWJBbSsrcUNHbzlYaUpB?=
 =?utf-8?B?NTd5Tm05MjR6NDhWOHdaQUlxb3E2QkFuZnVaUzZJSVRNVVdFbEZKRXhEM1RL?=
 =?utf-8?B?ODJTY052VWhMQm1SdGZkUVBpR3F0L0VweVlQbGtVeitXWkxnSitYZ2hwRW5E?=
 =?utf-8?B?R1BGa2djVXIwUlBRdHdIMmdUT0RzbmxibDdGZ0IzUWwwaCt1eXR2ZmQ2azR3?=
 =?utf-8?Q?qTdBhGesg+Y/M1tDotLX1+BGs?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973be1a6-96ed-4071-5487-08de0bf6a29d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 14:25:05.4047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNitxEpEtLlNxp9+KvG0Kw0DlxpYiLx6m6x8eo/IBZdtZLAjChJSVz7fpMtWCT7FA5078PkNHRqnbPP1WwAYPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7226

On Wed, Oct 15, 2025 at 02:59:25PM +0100, Andrew Cooper wrote:
> On 15/10/2025 2:40 pm, Roger Pau Monne wrote:
> > diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
> > index c76ae9f64a9d..a9e06b06932d 100644
> > --- a/tools/libs/light/libxl_json.c
> > +++ b/tools/libs/light/libxl_json.c
> > @@ -1366,11 +1366,13 @@ libxl__json_object *libxl__json_parse(libxl__gc *gc, const char *s)
> >      libxl__json_object *o = NULL;
> >  #ifdef USE_LIBJSONC_PARSER
> >      json_object *jso;
> > -    enum json_tokener_error error;
> > +    enum json_tokener_error error = json_tokener_success;
> 
> Looking at the options available, I'd suggest initialising to:
> 
>     json_tokener_error_parse_unexpected
> 
> and dropping the rest of the hunk.  I wouldn't assume that success
> cannot be passed here.

That error code translates to "unexpected character", which I didn't
think was very accurate here.  I didn't find any good error code to
map here, hence why I went with this kind of weird solution.

I don't mind using json_tokener_error_parse_unexpected, just
mentioning why I didn't use it in the first place.  Anthony, what's
your opinion?

Thanks, Roger.

