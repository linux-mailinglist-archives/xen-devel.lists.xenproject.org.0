Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFAC591E8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 18:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161970.1489781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJb3f-0006d0-N1; Thu, 13 Nov 2025 17:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161970.1489781; Thu, 13 Nov 2025 17:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJb3f-0006ac-Jd; Thu, 13 Nov 2025 17:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1161970;
 Thu, 13 Nov 2025 17:24:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FGOC=5V=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vJb3d-0006aW-S7
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 17:24:29 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97e9a101-c0b5-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 18:24:23 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by MN2PR03MB5279.namprd03.prod.outlook.com (2603:10b6:208:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:24:19 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:24:19 +0000
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
X-Inumbo-ID: 97e9a101-c0b5-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfscAavuZgOzJtuj5GmhSMbRjAiiAAXuue9j9b6HrY5XIGlzx9AMgkn3gIHoDurgd/CvpWZJ2UDHeWOPwvk90kPJhEOpvPwKrtpbfSV34ttDqU/9lB6DrR40d5xQzane5GpCKvrKOmVRlKmq+nbvyHV28MHYTb3i1G4lyF7UrBYKYL18oNMwqpVi4hNSp47c9zq0JpxOMAFtaQ98ljqLeqDJS5mcmxhD1P0DLP1nt3NKM1tuXCLVLkTDrEiyTX2e8BGrCshRO+QJXsC59tyN23J7IUMNSGRtBykMTGnzi+NzrWbmU683kmAJ2SkuTOQYy7UlUoCuTN6J/AqUX++b/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omjgH2/Ytr/JMzgk432l+AEgHftGK54jZmXwcwMUGj8=;
 b=wpndd5HDbvvONqta1VXaSiIug6IZBYX5aR2odNfrvAuunLCfcsaefXEOydaIFU5gbjBLX0XdKLMKxc5Qne5EVcFKQH/vehHBQ5chh3OJmTwCuIkzn487ryaTrCDlmXGtGeAyBg7l1skF9xtKHCcvSBp8HdGyYFlYZEtGrJ/II0nCv0W2NJxFWyH4VRnobsM1XTx3ylvMWvRfwwNL5E3UBO7JqjhEwJF8rCxwcvZzSn3Uvv4EKeNk4bymhgHpEYm/pYP62GpX3LfsQKRi8/JhR6FY/Hr1NeSdJhpTQA62OgkWvuPLhqxDxQKazJbvPFHnmqbJUK+krHvqUwnCH1eKtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omjgH2/Ytr/JMzgk432l+AEgHftGK54jZmXwcwMUGj8=;
 b=GfO1YtbdBKXxptCtkf3OneqDIbcztYg60PzWati0eznaRlB/7p2AUTB+YM9xmFfE34pqa3wWWshJT+g1AZnW+oVTRKoFKfbu2PY6aTSn6XTwY2ASakyqt/S+CO7BpCBXktjCR1kBHkAO7Si1AUuDDznBkVKRHxQ8HlVdKeKy1ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/viridian: use hv_timer_message_payload struct
Date: Thu, 13 Nov 2025 18:24:13 +0100
Message-ID: <20251113172413.87938-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0025.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::15) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|MN2PR03MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: c92b1fa0-133f-454a-9fd9-08de22d97a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SStYMTVmb1dTeWdSMXJMVFlrTTlSOE44R0FSK0ZMTnBvUUV2TThFdlh1bEFz?=
 =?utf-8?B?bmcxaStZdnJzRitsYnJZVEtISlR1SndidWc0K0s0MUNkUFVGRXhsaUNyeXJL?=
 =?utf-8?B?TVN1cXVYTnpKMlRQUnBWSC9JbmFtWjVrSzl6aGQ3d3VrT3BhOVZwV1JRVW5T?=
 =?utf-8?B?YW9JVjQxZmhvMEtBYVBBdnM1Y0VMSFc4UkduMHdFbEFGQjd6bEV0ZFFYa3Rt?=
 =?utf-8?B?TzFhdk9zR2FvMUxJT2kwRmNXNzlodFpEUlhiaWRJSFZEaURJcDljdFJMNEwx?=
 =?utf-8?B?aXdhTlU3UzlkNGRiZWludWJWU3hxQ3BWblN1UktYZ2w0bk9PWnlYcUxERXNh?=
 =?utf-8?B?REo5SlViU2ZHOFpvb3B1NlRWS0k1YnUwSGZGNjJrMkg5eVlHV24xRmQzODFG?=
 =?utf-8?B?RzJ5alVudUtFZCt4ZC82clovNThvd3VGb3JhWlpOSk1RZXI2TWh3YmF0Yy9U?=
 =?utf-8?B?Tm8wQnBNRnhoa01FVjUvcUVGdk1qMTJwSWZ3eEdheDQwbnNzNHFueGU5L1Ar?=
 =?utf-8?B?WFQ1d25TV25SQzlVUmRkUndBdVpza1RsK1l1NWJhYmZ1c2J0dUp2bVRHdHFD?=
 =?utf-8?B?eHBSd0c3U1ZCSEhZSGpqSTBtaDlBVVRsQ2MxVk1lNVpNVDdYYkI2MVk2ZWM0?=
 =?utf-8?B?VHdoOXovTnhOSHc2V1lEcVJCbDNKeksxZWN2eXZXeFVNb1YxVnBUbWhZbEVx?=
 =?utf-8?B?NzVuVHRSNlFGamhFQlAwanhSVG1BZzJoUkc0UWxXVDRsNmg1M2xXNlR5UXlw?=
 =?utf-8?B?Nm9iZ2pId3pkeitBeE5Pa2lzTHNWWUVNb2ZVbkFZeDF5WHJ2bGJIaFFPcGxU?=
 =?utf-8?B?TGM3SVo3QmJCRG4vUTNtdWF3ZlgxMVBCQ1ZWZUNSRVIxeDByYm11Y2E4ZEJD?=
 =?utf-8?B?eWhvSG9ucWR3YXJGdjZtQXh2eUlXZCtlS0JGRFhRdkUrSUlOZ0FBdlcyeENI?=
 =?utf-8?B?aW1CQVpnaHZMSUJNTDhtWjQrWXhmSmtua2dkb1J6NnB6WW5jY2c2OEQ5bXB1?=
 =?utf-8?B?TVRBUE5NUnV1STFhS1Fnd1ZxdldXeDdjdmdicGJjMnd6YnFaZ2NxWDBpR21S?=
 =?utf-8?B?bkxoalVvSTZXMGNQUnpBRml5Qk1Mb1dmR1dXNFl5R1BOSUtVUzBkeU9URzFY?=
 =?utf-8?B?S1hxVDY5SHJBR29keTN0OEpGV2h5VVFaak9QQlRVOWtzUEsycEJtQUNudE16?=
 =?utf-8?B?dm14ZWNiVEdhZ05NZlBVMm51ZG1jL1B0K1BYL2xlNkNmNHIyRjZZMFh6dGVz?=
 =?utf-8?B?MXRMeUlGQW1YVy8wVHFTcUR0Y3pFb0J0RDk0UXFCaUdYVVBxR1ZIUSsySlk4?=
 =?utf-8?B?TXU4RUx3V3g5ZDRxUVR3ZUZBSC91bVRXVUMyOHBJZ0FoUnZycTUyYkwvL3Zp?=
 =?utf-8?B?WUovVGxvOFp4QUNNR1Yzb3d1bFZySUdlUHRVMVR4MUoySjMxT3hKWDUzSWpy?=
 =?utf-8?B?VFBmMFdsNy9oVzJKWDRjUTRXZURsYmFRc1hvVXJ2YTNNZzRWT0ExdDhoVTVT?=
 =?utf-8?B?aEtKdWZtR0hqUTZCY1VjVUR5L1N2QXRUY1RicnBkUHFFcHplc2VpVlIrMXZR?=
 =?utf-8?B?dDliWnQraVhJZy91UWdIQTRQYWl3dUxqejBWNTlaSmhCSGtNOXdKTlFoWUVs?=
 =?utf-8?B?NUlzY1RRMDhpam1aTGlCejhvMjdYMnhad2JBdUxSQldQOFNtTHEwQjRuRERE?=
 =?utf-8?B?YkhUNU1nWTE4Qlo4R2R4QmZmQkpBaGRUdXBybW9UQmdsRFBwc2pSTGFqMFM0?=
 =?utf-8?B?YUF4L3MvTTMyRldLNjdWblhuVFh0dmlERVJ4SDBsWXpFblpSU25Jb09JbkVU?=
 =?utf-8?B?WFpyZCtqWlpkZC81MEQ1NVNVN2R5ZGwwRlZQVXdjOXdOWjZHSGF0RjBXRlBk?=
 =?utf-8?B?anA1bFBiTkRCRmd5YUtMbDNFRUZLSlRWaG1zWEZLa2hZTWpPaG1FcTcvbGMy?=
 =?utf-8?Q?u5t34YrfOL2xd9wXhbIEanNj1ybytYsP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTZrckhRek5BWHQwK3MyQ3ZVZ2xiNXBEMk0xOTkyQUZqK2x1U3JFb2Z0UG5j?=
 =?utf-8?B?NjdtU01aZTJaRVRyL2hMeUd5Wnc3cDFoOWV2aWw3NXZ2Z01EVkx6ZStlL1Bx?=
 =?utf-8?B?SXBJZVZ5ODdQM2IydEJwajVHdTRSeStIU21uRXd5SGppOHdOdXlFL0VGZjFs?=
 =?utf-8?B?SisxcVNsU3NaR3ZlUTFQVlpVRXNoeHc1dnRZdFBpZTk2cUY1TUpRbUxWaGpM?=
 =?utf-8?B?M3hPeXdXeU9va09MNkRuTzVFOUovRWNNM2ZOVmlya09XQ3Q4d1AyUXJiVUs4?=
 =?utf-8?B?YzdIZWxYOWFBTXk1V1lKUHJlZWJqSUF2SWxVT3dNMTcyVDlCOWkrait2RXYv?=
 =?utf-8?B?dHgvOS96K1lNNXk4NDI2SjFrelBYcTZlRE5Ock5YRHdNdDRQWjVSWlVxTEYw?=
 =?utf-8?B?L040YVZRUjVCTm5yNndCRHRlQXppdkUvYzFMRU5UQWZPaXAyTWZleTEweHNh?=
 =?utf-8?B?eVp5dDMvTTBRRWZYVjBVOEt4RTI2MVFlN29KQVlPdUFIWEVrc3owcGV6UEJJ?=
 =?utf-8?B?WXVpL2FFWno1YWVueEhveTh3cTVGVjZ2ZHcwY3hpLzhsTjNHN1R2VHRLUHRG?=
 =?utf-8?B?ZlRnckpHRDU1MFZtN3RjUlBYalo5MHk3L3VzN25hOXNXTGJ1V1FnQTlqUm1h?=
 =?utf-8?B?SDlKU1A4b2ozMFlxRkhHTUJpL1JpYXdCR2hzYXdCM1RTVXpSOEpIVk9aTVNp?=
 =?utf-8?B?c0w5VTliOER4TU55TG9zaER4RnRrYU9mVkR5QXRCTi9BQjByS3UyYXp2RVNK?=
 =?utf-8?B?ZjRCbWdkbklnSENPaFVBQjZmaVY1UVViSjRBbjRMdXpKZ3ZGRi81K1dpMWIx?=
 =?utf-8?B?ZUVLVmRIaEtUR1lqOUNyM1FzTEVUWkVBc3BhVWkrZHNETDFCeDVEWHBuZHpn?=
 =?utf-8?B?bktMWnBISGlVMy9ja2RSNFQwVmlSem4rLzhvNzFqZlpncjRHOHN4Wk83UEJp?=
 =?utf-8?B?bzRtYlZ5Ly9ESkV6VGx1cEwvSlI0cDQ0aUJYd29uVlRxWjNaQWNKSFJUUnlo?=
 =?utf-8?B?V0U1MEJtYWk2b2RpeXloOGdRQy8vdnZ3aWZPQmNYMzF6RDQ3bEJ1TWRkRk1Z?=
 =?utf-8?B?VHZSaUFyQWZ2VTRCcldPbEN0Y1FnZG5HVjZUU2NVRzQvZC9QZVJGK3dhTHV0?=
 =?utf-8?B?bWI1dzhvSUJqUUNtb0swbmovM3ZZaGVjNENQaFdmK2Y1eVM1QjZGUFEwYk9l?=
 =?utf-8?B?RENBa3RkL05yYUVpNGhSWDIreUNNVWM3dzBXSnZiNk9Dc3NWQVdXVFpoNEJL?=
 =?utf-8?B?Um9wbkJ6QjU1MEhZUDEzcFd1TDN1SHBxRUlIaEEwY251WnJaUHlMY3o2THpw?=
 =?utf-8?B?ZllvMWFOd0MvRE9lYXRtSHhoK3E5alFZOXlwNjJrS3d6WE5INjB4SkRJeFVE?=
 =?utf-8?B?cDVOVzhranI5a3E4cU0vUWx4MHdnZWQ1L0RxQW4wQ0JPakRTVjZ2aVBpdGdD?=
 =?utf-8?B?STJSUDNrc0ZyUzZHMmVnWm1XcUxmSEpyYWN6OWtKc1BxeXl2b2tqTU9LZloy?=
 =?utf-8?B?ZUJvTmsxMyt1UUl3dHN2ajUzcnpOZnQrTkdEN3R5SDc4bnlEVzhhd05ZS0FI?=
 =?utf-8?B?a0JNVURuRjZqRGgrdlo3QmRVOURGbXp0UlF5VUQ4RHNqTkJLSU5MclFHbWNZ?=
 =?utf-8?B?UGVTRkxmNXhkcC9iYlorYm83alY0cHRSMEhRdndrSmFNTUg0MlkyNVlZMERU?=
 =?utf-8?B?SXpBMHA5NThnb3o0M2pkb2t3bUU4dEZudGZUR0pzNGZqUTBXUm5RWStqd3Bi?=
 =?utf-8?B?SVd5dDREbjBwemFKRGlBU1JFYlpITVF5Vm5nM2dtWjVtakMzRzZ0R3pOVGs0?=
 =?utf-8?B?b3RQV3VPd0hZTHVlY0VHNDJ4RVZnc2NjUUlqLzl5NnlWMFo5T0JJYnRpWnNn?=
 =?utf-8?B?d2I5TGVIRHVONUorTTEwYnBUajlPRjdKdnM4YjFqS2M3N3hUeXRlTmYzY2ZJ?=
 =?utf-8?B?eGkyOXI3N3hzMTZYRW95RmtDUURySGlCN1l6cTVBdktmZkdxUDBibGcwNjAw?=
 =?utf-8?B?WGJvSmhNeENwSnpjcWlMNHQ3TXdyZHJjSUM3bm5hdFhyaCszS2drZHZpUTdB?=
 =?utf-8?B?clFIKzRmUXRIckNBc0xQR1dsZlFSU1FITU9ISWR4WnYwWFBhWi94djFyRU1Z?=
 =?utf-8?Q?BxtwQJbW3tgK41s6tva/gOPf2?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92b1fa0-133f-454a-9fd9-08de22d97a87
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:24:19.4856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B972H5OYn4z3JFyAq4TWuw+SbBkU+xXOlBSpuZqYbVHtPu7b9qCKAYVSqPdDYCTwM+zJ9YaDmxHdhVxgaqSYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5279

Instead of open-coding the struct type in
viridian_synic_deliver_timer_msg().  Additionally expand the union field
in hv_message struct to contain the timer payload, this way the memcpy in
viridian_synic_deliver_timer_msg() can be replaced with a struct assign.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/viridian/synic.c            | 17 ++++++----------
 xen/arch/x86/include/asm/guest/hyperv-tlfs.h | 21 ++++++++++----------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index e6cba7548f1b..6d7b6bd0eda2 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -327,15 +327,10 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
     struct viridian_vcpu *vv = v->arch.hvm.viridian;
     const union hv_synic_sint *vs = &vv->sint[sintx];
     struct hv_message *msg = vv->simp.ptr;
-    struct {
-        uint32_t TimerIndex;
-        uint32_t Reserved;
-        uint64_t ExpirationTime;
-        uint64_t DeliveryTime;
-    } payload = {
-        .TimerIndex = index,
-        .ExpirationTime = expiration,
-        .DeliveryTime = delivery,
+    const struct hv_timer_message_payload payload = {
+        .timer_index = index,
+        .expiration_time = expiration,
+        .delivery_time = delivery,
     };
 
     /* Don't assume SIM page to be mapped. */
@@ -359,8 +354,8 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
     msg->header.message_flags.msg_pending = 0;
     msg->header.payload_size = sizeof(payload);
 
-    BUILD_BUG_ON(sizeof(payload) > sizeof(msg->u.payload));
-    memcpy(msg->u.payload, &payload, sizeof(payload));
+    BUILD_BUG_ON(sizeof(msg->payload.timer) > sizeof(msg->payload.raw));
+    msg->payload.timer = payload;
 
     if ( !vs->masked && vlapic_enabled(vcpu_vlapic(v)) )
         vlapic_set_irq(vcpu_vlapic(v), vs->vector, 0);
diff --git a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
index 79cfc90dd8ec..18da73c74e03 100644
--- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
@@ -527,12 +527,21 @@ struct hv_message_header {
 	};
 };
 
+/* Define timer message payload structure. */
+struct hv_timer_message_payload {
+	uint32_t timer_index;
+	uint32_t reserved;
+	uint64_t expiration_time; /* When the timer expired */
+	uint64_t delivery_time;   /* When the message was delivered */
+};
+
 /* Define synthetic interrupt controller message format. */
 struct hv_message {
 	struct hv_message_header header;
 	union {
-		uint64_t payload[HV_MESSAGE_PAYLOAD_QWORD_COUNT];
-	} u;
+		struct hv_timer_message_payload timer;
+		uint64_t raw[HV_MESSAGE_PAYLOAD_QWORD_COUNT];
+	} payload;
 };
 
 /* Define the synthetic interrupt message page layout. */
@@ -540,14 +549,6 @@ struct hv_message_page {
 	struct hv_message sint_message[HV_SYNIC_SINT_COUNT];
 };
 
-/* Define timer message payload structure. */
-struct hv_timer_message_payload {
-	uint32_t timer_index;
-	uint32_t reserved;
-	uint64_t expiration_time; /* When the timer expired */
-	uint64_t delivery_time;   /* When the message was delivered */
-};
-
 struct hv_nested_enlightenments_control {
 	struct {
 		uint32_t directhypercall:1;
-- 
2.51.0


