Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1BBBF1FF3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146471.1478890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vArT3-0004Gw-MF; Mon, 20 Oct 2025 15:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146471.1478890; Mon, 20 Oct 2025 15:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vArT3-0004Ed-JS; Mon, 20 Oct 2025 15:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1146471;
 Mon, 20 Oct 2025 15:06:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BTWa=45=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vArT2-0004EX-6L
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:06:36 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b2cf1f2-adc6-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:06:31 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SA6PR03MB7567.namprd03.prod.outlook.com (2603:10b6:806:43e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:06:25 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 15:06:25 +0000
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
X-Inumbo-ID: 5b2cf1f2-adc6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyA+gKBCv+Pqbjw3lZTolgfKiohLBLtdKv+muvfTTSERxFLpoqu7jSEi1kYGAWHEv5CgP29H/tb6v16nA20VNI44EIxdIlI+4h1gZ43j9lTFcS3woVINUFMatNoaFE+8Q7/Bt53dvHeUMhBspgI7PSU7UkVD3SbMLEaAqi4da6Mco8WEXSOqUlLFKzWojKhkTYGUudCHG1OZ3WlWaFD8mr55powdp9Z1h5C/P7WPoxtAhzwMKYDMEgdvsD7BY1Sh8lC1U4D1vcBwkDi1u7FYwpP7VX8DX+r6QV+raj6gLpYiXf63GycYLe4TAmIU46vBYDRQUYMPFU4/BxfARugyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYOqrP2rWqbDMKyo9GU2OkPr+tthQ9fgDuo01I0j74o=;
 b=FKIxnNW3xtwYXtdKxdLI3QEM7gCOajmwNF750Tl6PN0Dxq3A0kUDFkbjqG132hMXogMX14cW3Ebg5jam9Y2D917SLULGtEKgGCp5B8F4XVmg0pOWMO7NLSKa+5LkJ3aZgRIT/yl/JIcPIGs4zptSI4hqTP4APwMqmZm+Iv0YDjWv/MwNn3Owr/07e7jatFpN1cpThOLOVsb3J1pyJbMe5JYJjnIyvdob99n66zo2n7pSS1xwcwMwj0JNp5FXgsy6BZOdYGK0KeJrKlRcey6EgkNMctIq7yGCLAsYjsuYYeEik9PkAR6sb3UkNN9cEfM7hccFEIWfmEoJChs5F6uJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYOqrP2rWqbDMKyo9GU2OkPr+tthQ9fgDuo01I0j74o=;
 b=st90mh4fIGqnTCcBYcJJvWbJDczznujqRQQON350qNT+QDFVLdH9GIZE+ixQW/sAHMbdiVFEMybhgl70mNtTOBO8izxR+bvLctVeNQPZjSb3eEcRa8OS9a8c+6N6iMsTgqXL9X/F+FSxIRrvg9lGM/09piz8a/v+rX6pb1g6W2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bac7d354-f0f3-457a-9b11-3200506c1f2d@citrix.com>
Date: Mon, 20 Oct 2025 16:06:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/ucode: Relax digest check when Entrysign is fixed
 in firmware
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-6-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251020131955.2928261-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0248.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::8) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SA6PR03MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 35aefa9b-a712-484e-bc13-08de0fea3d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFB0OFlrekFJdlNQbk02TCtVOHdHV0lTQkxHRFVGS1diVVNnK1I3eUlOcGtt?=
 =?utf-8?B?L2tMU25xNUI5VEtLYnZUMVVwZ3E4eDZYN3FFdGFGTERnb1B6bko0blFoejBS?=
 =?utf-8?B?WmdQNGFxSjN5WTFyY05VTjIxRmFqdDlwZmNXd2JPRG9ZR2NQQUxhL0dvaVA1?=
 =?utf-8?B?U0hYbHljUU4vTUdsbC9FNkZoUUVTS1prYi93cVpaSmlOWW8rWmorNER3YThT?=
 =?utf-8?B?TitoOGlCQmpTU0pvK0ROdTNFZnB5MlNTZFN4b25LRFo1MWV4VjJLRjlhVm1l?=
 =?utf-8?B?aDJjUHNhQU1tTVVWaDdtTk5iTWxLbFdyV3NyS3FMdit6OFhQd3V2bXJ5NFVi?=
 =?utf-8?B?ZTlZUnlKQU5oTTlHemQ0Y05YanFNY0d4ZVRnZnVwRVRzZGVpU1BOMXBCd0pw?=
 =?utf-8?B?TTBIRmpPN0JZREJoVzR6dU5DS0lJSy84c3JJQ3JzNnRqQ2xnQy9hN1lkVFND?=
 =?utf-8?B?bHBEQkpQNVJubTdRSU5xanJCSi9ZT3RKUFR6ODF6Z01oVWpZd1h4SHZ1bHdP?=
 =?utf-8?B?VVZEMWNqNXBnUENEWHVNdjQrSENCcEhHWVVZK0VBaDl1LzRtbEFwcUJ6NTJO?=
 =?utf-8?B?QXhKSCsrVy9yaG9hc0phUWQ0NkxYRDkzYS9CSGZEeDVIUHBQMUFMdFBuLzlv?=
 =?utf-8?B?RWxsTHlNK3JaRE54SG1aVnhFL1NuWjFrOGFlRktHKzl3ZkVjMGQ1SUw3SnRv?=
 =?utf-8?B?MlhQYXQvK0tlS3lnRlFrSG00QUkxOXgrTmU2ZS9VWHVYUEpDUnRkdVJGMHl4?=
 =?utf-8?B?QUVSclROTEg3YTdhOVBCYm1LMGRXSWZvYmczTk4zenFLOWxhaExBZlNjT3pW?=
 =?utf-8?B?ZHlDTG9lcGRRVUQxMjFmSmVRd1JhaFkyRmNkczlRUHk0b0lVUmlwRjFqMWps?=
 =?utf-8?B?ZnlQWWZES24vS2VUeWNDZ3h4NkpRekViSjF5dG1FdGg1VWsxYU9BWmhBaWx4?=
 =?utf-8?B?STFRZkxrTXRqTEZ2OGQxRTBMQkFBME80aXlWc1BidlBHMXMrb0FYK080Z3VE?=
 =?utf-8?B?bStaM0V5NVJQV0VlZkJkNXZJeHlld0JwWkdUYmFnOUl3VDk1V3RTekdCZ1Ar?=
 =?utf-8?B?M09QbEVFVUhHS3pQQmx3eXArc2xaQUh4RTdDdGErK2tySEYzb2FobEhVNmxz?=
 =?utf-8?B?NkhsZTR6YmhJU2s0ZktjK1duREROQUhUR0RjQjlMTi9aaHJ3R1loQm9LOXp4?=
 =?utf-8?B?VEZMVFBmT1RsWHB5YUJwNjh5WjVWWlg3YWw2d1pFdGRqZWo1ejZ3SnNhQkRB?=
 =?utf-8?B?TTRtbHA0dFJiTi9kNjhuMWtRZ1lKU0htY2V3WkhoaDRHaWRjSmNmMVVjOUN5?=
 =?utf-8?B?S25WTlIrT3NiSUpTZWtxUWlnOHRsbUxPUUMvS1dhWHg0eXpTSS9XcEpORWxo?=
 =?utf-8?B?d1NtMCtZR2pSeUZmYVVyd0I3ZHBrUWF4b0dUSDByL3BJaXFqS3Q1bzdHVWFw?=
 =?utf-8?B?UVIvbi9weG5OVWFBTGl4YitNbVJrSk12WGJtNXN2alAxL0NHRjVtMS9MZ0Jw?=
 =?utf-8?B?U1YxQ2JSek1FVFUwL2UzcU5qWkdVMGZIOTVKK1hwbU5CWHFIMU5McWhyYy9r?=
 =?utf-8?B?aDY5amx0MlJyOEVaamdFOWZ6U3RuWTliTGxEb21tVGEzV25yOVRTK0dYZWlS?=
 =?utf-8?B?d0FrNk0yVWFiWDlKZ1BPZG9Yc3FoMDNQa0FMU2dtakhoN0xlOUlVTWNVd2h2?=
 =?utf-8?B?ZDVQRFMwRHdVZnpNUGQrMGxSM0YwSG5RbzlraGhqelNIbnMwbnZuUUVmMTA0?=
 =?utf-8?B?ckN2dXZBdFBpZjdqVnYzRERFa2tkcGY2WWY4NFNHMkdoZWZCSlFhWENUSmpZ?=
 =?utf-8?B?d1FJN2MwTTZlR3JYSGdUcWtsTm9oaVRGb2VDWFc4bUREZjFOekpBWWp0eTN0?=
 =?utf-8?B?YzBlZnM3MXpBWVpuOGNXMVlsbnNWSzk2eFpKaDFuQmQ1R3F4SHlVZE9raE1r?=
 =?utf-8?B?N3lERkt6c1I3eUs1aWZ3dkZmYkhTbmNsMWM0UXh2M2JmTDhEWlBwbGFrbkhD?=
 =?utf-8?B?Yi9zR0xOa2F3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHJZV3hyV21udDh1NmVYVjBpNTUycC8vVzBML2RPUzNaVWNZZXBBSDNTN0Q1?=
 =?utf-8?B?L2RRVWtRMkdIR2pJbGQ1ZVJPZU5oY2pZc3UrVWplV29HazZ0RWZobEFLVS9s?=
 =?utf-8?B?UDdoOUpVUlV1V2VkTVhpclNrSXJ3NlUrNWhlL3RxUlprMFhuN2d1UWxFNnVB?=
 =?utf-8?B?dXBtb0c1SC9Scng2ZEtWRjZIQ09WZUZqTktkT2U3S2ZBUjVOeVk2Y09uUFNI?=
 =?utf-8?B?UStKK0lHSXVHTHlkcHl0ZHJpbms1L2dSNmRUYW8yYVZCVDRFbEo5QS81LytE?=
 =?utf-8?B?c1VRY0NaTjRyRzlldjJ1ZTlMbDVoSXBmV0xCQnRZMkpmRDF3dzY5L3luWWNx?=
 =?utf-8?B?a2FxRGlNWWV2QzlxY3hEZ3NvSlBBNXVRUzBEUG4rSk91cFM3NmdDWVNaY242?=
 =?utf-8?B?N3JzYWorQ1B2N2pyeHAxZXQ4WVRjb0JZQnVaVnYrTjlxVnN2NXhMdWRVOTFB?=
 =?utf-8?B?U1RiSlhNRkROMzNzc1MweFdmRG5WOHVoYWtCTzgxVzlHeUFTWmpLNlphRjNW?=
 =?utf-8?B?akpPYjB1ZERteWpvMGVxVjl4RzRFMGZOWHVhNHhHWG15QXphcEhzSkJhVDlz?=
 =?utf-8?B?QUcwNkRVVmFVYldNYnl3cFZRYW9RVXR5clVVYTFWQlM1KzZ4SU0wMW9tVlFQ?=
 =?utf-8?B?T2lvSlRsQ2R5UXkwL3B1OGNuazE4cVpHTnNZdStRNGpORCtxdmYvaWJuYTMw?=
 =?utf-8?B?WTRYR2VjTGpCQUtjVk1Mc1hvTDZtL1hZWHJCb29la3h1Ylp5elhJNCtDMGRl?=
 =?utf-8?B?UWdZZkR5bmhyTmUzQ0pYZzdzQ3VnM2NneUtDN3N2bnFLcUw3NlQ2TURLU0E4?=
 =?utf-8?B?Wk84Ym1WUXJSa2JDMW9TT1h3QWFneUp5K1N3ZTVuZWpuSDNOd0Q1UzJrNURl?=
 =?utf-8?B?U1FmTlZqb09vVFFwQmFubG53RGlLRFZERDhOQUtwZkpxcWs1OFpwclJZcnJz?=
 =?utf-8?B?UEthdG0xNzdSYXlVRG91UUdCcDBLTVFyT2JtRFVQcE9pdCtLemtPVkJTeEdG?=
 =?utf-8?B?QzZIckZ1MjcrSkhxNlhwOU5YTEEvZ0FUTi9aREJNZjBpK20vUVhWV1FmWHoz?=
 =?utf-8?B?WHVOVGRPMjNiYTRrTXBxOGQrY09Ed1VsT01yVENUNzJWVFFhaThEeGp0c2VG?=
 =?utf-8?B?N3lMOFpWaDkxa3lINFRJa2NKM0NBMWoyN2ZkMS95eWxiRjdoelBNY3pmTTlT?=
 =?utf-8?B?UTFyd29wQ0RNV0VjNnNSci9yV0VJbm4rQ2FPQjRPZXMrV0NJaUFSODJkUjlY?=
 =?utf-8?B?ZDM0UXc3VnBHOVU1bk5FVnF0U2Q2R2RMazdWNVFxOXk0RjV1M2VKQnZZcnZr?=
 =?utf-8?B?RjcwcWY2UWJvSEU1TU0yZFlyZndPMk9nWHJKa1lSMSs5d2drTTAybGdUZVhN?=
 =?utf-8?B?R1N5YllieUVqVHAwbTYxTEd5elJMdWdIWGdtalRWbGpLSk5rUnI3V0JpSkEx?=
 =?utf-8?B?ZE15Q0pBdGUzcEtUMWt6M05Wb2gwNFh6ZWFhZjBGZ2tUR09hM25UTURid3hJ?=
 =?utf-8?B?ZEo3dzh2dEFaNWM0eSswUWs1UEUwa3NWS2swWTdpbC9PWHI1c1ZQNTdtMkl0?=
 =?utf-8?B?NXV3UzV0L3p0clBzTmpjUTRIMWlGSUVhMzZUdXlCektqUmRMY2NFalR5Vi9z?=
 =?utf-8?B?bVdiYk1qcXBUeVRLeXJWQVIzc2E4UUhjUHV5NEtKVElWbDJFa1RwQXBrRnVs?=
 =?utf-8?B?dDVrNlVSR1ZLZzRoU2xRRHJOcERKSERSeXFmeGFJYVR0R2pYVFFLallScGxR?=
 =?utf-8?B?MThLQmNtM2F0QzM0ZEF1aVpjSjNpUWFZdC92Ykx4cE45cjNKUWpXbzluWExG?=
 =?utf-8?B?UUJQWW9hNHdmWHI3SnRybm1iNDk4QmpnZmpGaHJjK0tUbk9UWGtsZjE2c1A1?=
 =?utf-8?B?Y1ZxWS9GVisyOTJiTkFFRkJJSWdld0JXTFl2WFZ2Z3BDY210LzZCbmNLZHAw?=
 =?utf-8?B?SWZnN3NBZGYrQjh3ZEtIaDAyM0ZCaHQwbEM5Ym1rUTZlUVR3RVhMZmhLUXZZ?=
 =?utf-8?B?SFdmRllTT3hKQkhGWHkvaGtWb2Zzc1UyTlpDTk1weVkyKzNDdzhtZzZFS05D?=
 =?utf-8?B?VFk2UlM2ZlVYMWNSeC9JOVpvLzlQak01V1lodnVLQ0ZJVkFZdkpoaXFLa0pM?=
 =?utf-8?B?RFpPQlVoSUs3dUVaZkNpVy9pYll1YjA2ZVpKelZHV1E4WUFFL1hKYUFUeVFC?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aefa9b-a712-484e-bc13-08de0fea3d16
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:06:25.8040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMEpHKmJdTZ7FvH6x6BAdvGNsNO53afIxJH6zsTkr542bmGhN08kgGev6Q+w8Ks0GpeubM5C9TGJ3Sdn0L1kNbHJZAyUjSOWbm3E4/IHnOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7567

On 20/10/2025 2:19 pm, Andrew Cooper wrote:
> When Entrysign has been mitigated in firwmare, it is believed to be safe to
> pass blobs to the CPU again.  This avoids us needing to update the digest
> table for new microcodes.
>
> Relax the digest check when firmware looks to be up to date, and leave behind
> a clear message when not.
>
> This is best-effort only.  If a malicious microcode has been loaded prior to
> Xen running, then all bets are off.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
>
> I need to double check the revision table.  I think I need to submit a
> correction to Linux first.

Yes. 
https://lore.kernel.org/lkml/20251020144124.2930784-1-andrew.cooper3@citrix.com/T/#u

Also there's a general off-by-one error in the revisions, owing to a
difference in how Linux and Xen are using the boundaries.

Both fixed locally for v2.

~Andrew

