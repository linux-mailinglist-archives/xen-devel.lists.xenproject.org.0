Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9lsVOJxI+2lqYwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 15:56:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0194DB6C8
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 15:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301764.1575968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcjd-0004vW-BD; Wed, 06 May 2026 13:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301764.1575968; Wed, 06 May 2026 13:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKcjd-0004t2-89; Wed, 06 May 2026 13:56:21 +0000
Received: by outflank-mailman (input) for mailman id 1301764;
 Wed, 06 May 2026 13:56:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKcjb-0004rq-PI
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 13:56:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKcjZ-007bkp-KI
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 15:56:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb487e-bab6-0a2a0a5309dd-0a2a450aaf8a-14
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 15:56:19 +0200
Received: from [52.101.46.9]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69fb4881-56b3-0a2a450a0019-34652e09ee73-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 15:56:18 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5064.namprd03.prod.outlook.com (2603:10b6:a03:1e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 13:56:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 13:56:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcter3EntOVvhI+c3ux5PGR/jI59fiaXgVhOTif97OtoZ5q4qFG5JTLvXk1H0+Oqr0XOgWDaXb8LDZsczlPE6pfX4wRA1y7zIUkvX4v60B4l6JDzPCyDVUduwmTiPVPDUeKwFZ3DBsVhBv23+etRljTctD8rYVvScumuiukEN2BeRd3T+Hb/1rRnjePX6zJA49juG1RD1NkC31h46gZcUdBDuQazVkmAaNXQMsn7PSjkm9w9paYJfrEOk2gLJ+ZtotbXFq9VnGgMbmSck8yr8mTSeOAEZV2msO+HV//CN9xdcRGDtWDLvURLKc0fdxQsaygZ8Mo+Bbgo+FD4USAVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrwxSKkv7rRh6ev0v8/Wi7eDOFVfG4pmI1FUsQ+FFwI=;
 b=AAO5IAYZxj3gKj06n84P+d/bu/qLuE+XrNvYrVZmjpWJHQA1RMNuOr1jWYfPGbRMc2rtSgDNA6INlBMsoNIR+AKkgpc7pEGp8MBNYNGpjGWX0RtpZxV6WrhxGtLzZa2jsUL5ZlZf4IbfoMmZ0LRK17qvm681pT7Z11jnrmuFijIKqSTe6YZWyIhwHd/L9y4Ho/jZ5v0YMTS93lgCXuT8/kXOr2r6NAXeXYqU1mSVwuevNvmcIPARUKTWUbOmiVDNe20hkA82aUMpF17tbxGsAJgqvMAwgqF1i1/uRzmTE59yx2RWFkvTuaAxC4Gqm1UDcNwRAXdhFAeChmfJyT/afg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrwxSKkv7rRh6ev0v8/Wi7eDOFVfG4pmI1FUsQ+FFwI=;
 b=SO3Gn8tGlq3r1XnzlKFyHZ/h9Rz/V/yKpIzwvImlXWVqHVIDAF70ovcJMMBmJUYiWF8Pdamus84IN5Icxb3zjCcK4uNpypCOtnMUJvTO20g0iht3goFu+1gbdJNdHq1mgZ3g8IoPAaZX01yU6OSHXp4v9eItplHthZQ3XmDu4U8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
Date: Wed,  6 May 2026 15:55:14 +0200
Message-ID: <20260506135514.47310-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506135514.47310-1-roger.pau@citrix.com>
References: <20260506135514.47310-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0173.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: 136dcfb9-2514-4f7f-119d-08deab773c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qGDmAPs3hMQM6sTSqPJE/2N8pHcRGk84sEmz3vz9iNZvj31bjF/thUICafHljCWi1Dg17DncZQ6QCDJj0dDFhOt91cMgG/97THCGNBVS9ZyOtLC+akEcWw6caNONYcva/oC3z5mbNzSkrUfLqpaJG6GW869j+AHNrcSKMIRCDhNEO5PLMSEuLc8uj7IlvBzLzvmhXEPWf9MCZp4wkglPSd6ZFtMlsRU+Xp3Q5lILZr8zPfpR1hE9UIMO4+uLkl0me5kBoZlZ7oilhmmwM7A52OqGla3moF5tiJdtJJW/ham+GUaFxP9yNxi5ieHT+5PwZeSZqbTsqG/ojoOzKob+JSMl0tXWRxPsfyvi5FbSpmoLrDHzOY+ytheHdCJkInhmEg2FCxlY2zLSbt+Hk6vyN3S9ggiIMKtHbTHJDSeKuYTJDBP8baQCKdvmJZP//P5eu6r7wiDXJeJZM6Kr1XSy4VxI4k3dC0KUH7gAL640fAnQ6kpCaQbZZrD1oFEv6sG72+NcwPPSQMxUafVyix4ZgD8qTiefM9znRD2AOpGvOzraGeQP6NLa3eIBqlq9P1hH+aYER0A5USOfm97Py6ME67GLojtrmMNE3PrQVx6A3FrtL6MRd9PMrMe9OD9/PkEOdIm55Sw+v5HKXQOf3v56zVwebCQQS3M+xGZh6I/OSxD6tcuJO7P2mJDv1XcKAwhP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVVTVnQ0akxsNEFRTjJ4SXFYMG1jbGVYZ2gxYTJBdmU5MFdRSTh4aTVUcmJB?=
 =?utf-8?B?UjBMcHVBRGF3L05aQ24wcFZDa045Y1l2RGt6RXdud1hnaThlWTY2SHdtUHVI?=
 =?utf-8?B?N3FvbU1SeExDZU93b3BWQnlza1Z1NmxsUDI3elpaT3FkemRwbW9NdWFUQzh3?=
 =?utf-8?B?aGpWR0xEbnByZ3BwNWRxOU9UeTBlajB5ME1HT0xYaGVQdmphWUxiRXJUaExY?=
 =?utf-8?B?SUtyMVpLVTRYa1FSeHE5VTlkdWUzNXBzSndYR3lJM1VUalprWWE1V0YxT2hj?=
 =?utf-8?B?R1RtRk50RnMxaUN2QXFyRkUvS3NSajdGaWFsdVZ0cXVtS0E1S3dHbTNpa1RY?=
 =?utf-8?B?MGQ4d2lNdlMvRmtNeStzbXBPQTNmNXVYaDdhR1ZZaHNmbW0vOTV0VHJDR3NC?=
 =?utf-8?B?NGpkWjZZOWJMOUdIRHdkUEQ3WkkwMmt4Y05pQ1BzT3FYMERZOTZRa1ZVOE9N?=
 =?utf-8?B?S2UxdVFPOEhWK2M5RE5mTlF6SjFxZkxscXMxRzh4eStsK2JiZE4xWGlrSXJ3?=
 =?utf-8?B?ZXNrNDdseG0xcGVKaVkweUJOd0JBRHBFVEJSdm1aSmc5TzRMYlE0eE1rQ0Vu?=
 =?utf-8?B?V09mbWh1eURZRmN5c2w0S0pYVnRkcGNoOFFsY0g5ckRQbFdZMjJocUVqUU1S?=
 =?utf-8?B?MXZxeWQ1UzMyM0Eyak5BTUovdkRTZVZXZS9VeTU1dG1aWXdVRm1va2poeGww?=
 =?utf-8?B?VkVrMk5QQWM0STN2bnZlZVo5MWcycDRVa0UyQWRkdldXQjAvVXlTVDBWdXdW?=
 =?utf-8?B?S3ZtT2RSc3ZrRXdtdDdkNzVBL05zZnJvZVk5L21ONzkyd3praFBqcFE4YWVY?=
 =?utf-8?B?MFcvVGtPK3UvL1BnTmFMeDhLTVJTWjY1aTRtZXd1VHpGbDl3RGpiR1hwWkNH?=
 =?utf-8?B?TFRIMkI5SzVsZ2swdUZnVWdxbjE5VDN5T1A5YXBTSDNQb1VVYjZucEZwQmV2?=
 =?utf-8?B?a3ZvdHdCcko5T05DU1BnRE5VazFid29CaGtoWHhkOVY3aWxKQzNabmNqZHRW?=
 =?utf-8?B?VXlVR1lIaHVycm5vYTdLRjNJNkFLcUdraEluUGU5bzBOcUdzNDNCQzdWbndE?=
 =?utf-8?B?S1pvcDFiSFR0MXdEVHBCVUlkY0x1Z3h5QWp0SFBBZ0hadlpvSHZNNkgwL3F4?=
 =?utf-8?B?ZkdTdXdSY3FuSHJwTkcrZlZTQWV4UUNzRVVhYm9Nd3V3bnU1S0J6K3JUVHRu?=
 =?utf-8?B?bkNCN0w0a3cxYnV3TmdPVllYd2wyZHBCR2JNc08vUzFHVlUvbEtLSzVpWk54?=
 =?utf-8?B?Y3JvRGlYSU1sVDFsZGZtcEFiajIxRjRSQ1RiSjFRQ2FGaWZnOGdkS2RCblNB?=
 =?utf-8?B?cU5aL2NFT1VINEhjL0tZNm5NM3RLaFlRamZGN0htS0JYTlFheTRMZXd0UW1U?=
 =?utf-8?B?bllqQm5BV0lzL1o0a2IzZHNXeE1LTlRnWHN0bmExNWVWM3RSN3FLWE45eDBH?=
 =?utf-8?B?Qm1pNHYwbG1FN0lVN2pKUFVZWjZKWUVjVzl6NFNXVEw3bytIODhwV3FkZExm?=
 =?utf-8?B?VFN1U3BOcTBkMmUydFNCZ0tYcVlCUi91d1V0QWlrN3BsZHNZaXpNcm83L0t2?=
 =?utf-8?B?MlNRVkRYYnkwUkN3UXdySDF3U0FDNVdXSXNoUHVIbzc1STRUaUJESXcrQWlC?=
 =?utf-8?B?dWc3OE1GaHJ4VU5BZ0JoTmRpb0dZMVZhMVJ5d1BJbkVkT2Z3K0EyZzRZdllm?=
 =?utf-8?B?TXRHbkVHczllM1I4SVlQeWF5OTBVMWxiM2lxV3Y3L21ycGlXcytXbDYxWG9V?=
 =?utf-8?B?YzB5TGpZOUozU240NHVkT2RUbkNkL0lPNjIyOUVLbURlUjBKSkpNcFNuN1lr?=
 =?utf-8?B?a1hMSmNIbzdSQ3JkcnByOTNrUDVmVGFOMXdMMHBUV3MxTVRKekZYZmJQankz?=
 =?utf-8?B?ODdtd2tCMm5FTGFySTdyaTBpaFJvRGI5aW9laGRYUnVuOGJKUmMyemR0Y3lP?=
 =?utf-8?B?eUtXalgrMm1obEN4VFZ6OHV2blR5YmM0VHUvOUt1aWpnK2k3UzhUVUs0cFRP?=
 =?utf-8?B?Znd0bHNhU2NoSmtQYlJRZUEvajFYQ0s1bFQrZTVrNEVhb2hkQjdLaGhlZGFT?=
 =?utf-8?B?U2J5c0ZQREFzZDZMTXdEN3djMXZCMHUvVGJlZWJVZlVFaFI5M0JTdElJbDdD?=
 =?utf-8?B?bEpDZGF0M1MwbFVXdnZUZncvcStucDFmVmZDdlcydXZucWxRMUFnRzJ4VmJ4?=
 =?utf-8?B?TWE1ZzJhNkRvUU9mc0tOUmxuSldjOVdlQUlJUEdLNjd1b2syZ3VGVVVBWUtl?=
 =?utf-8?B?SWdZL1N5b2gydG5OUHNuVmtDdXNiOE0yRkRJclFDL2lnZHJhU3ZjQUhwMGVn?=
 =?utf-8?B?R1UxVXdDS0Jqem9XQU5YTVNiV1lNOWRqejBBcFIyazNUbUpuQS9QUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136dcfb9-2514-4f7f-119d-08deab773c97
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 13:56:14.1335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHJLRlJr1efc8hnijnjl+9td/8Am/Mm8hudgAZ9BTkT53bLylHS9pa8GlD6tvBI3lEPP28fDqnUjwhx4kfkPCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5064
X-purgate-ID: tlsNG-4011c0/1778075779-729768B7-6D0FD97D/0/0
X-purgate-type: clean
X-purgate-size: 3059
X-Rspamd-Queue-Id: 8D0194DB6C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

Attempting to memset the whole IOMMU MMIO region to zero is dangerous to
say the least.  We don't know what registers might be there, nor which
values might be safe for those registers.  On a forthcoming platform doing
the zeroing of the MMIO region does put the IOMMU in a broken state, which
is not recoverable by the IOMMU initialization procedure in Xen.

Instead attempt to forcefully disable the IOMMU ahead of enabling it.  Fold
map_iommu_mmio_region() into it's only caller, as the function body is just
an ioremap() call after the removal of the memset().

Fixes: 0700c962ac2d ("Add AMD IOMMU support into hypervisor")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Zero the control register after calling disable_iommu().
 - Print a warning message if the IOMMU is handed enabled to Xen from
   firmware.
 - Fix commit log grammar issues.
---
 xen/drivers/passthrough/amd/iommu_init.c | 31 +++++++++++++-----------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 76ae78e5ea53..ffc041211fb5 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -42,18 +42,6 @@ static bool iommu_has_ht_flag(struct amd_iommu *iommu, u8 mask)
     return iommu->ht_flags & mask;
 }
 
-static int __init map_iommu_mmio_region(struct amd_iommu *iommu)
-{
-    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
-                               IOMMU_MMIO_REGION_LENGTH);
-    if ( !iommu->mmio_base )
-        return -ENOMEM;
-
-    memset(iommu->mmio_base, 0, IOMMU_MMIO_REGION_LENGTH);
-
-    return 0;
-}
-
 static void __init unmap_iommu_mmio_region(struct amd_iommu *iommu)
 {
     if ( iommu->mmio_base )
@@ -1367,11 +1355,14 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
 {
     int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
 
-    if ( !rc )
-        rc = map_iommu_mmio_region(iommu);
     if ( rc )
         return rc;
 
+    iommu->mmio_base = ioremap(iommu->mmio_base_phys,
+                               IOMMU_MMIO_REGION_LENGTH);
+    if ( !iommu->mmio_base )
+        return -ENOMEM;
+
     get_iommu_features(iommu);
 
     /*
@@ -1381,6 +1372,18 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
     if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
         return -ERANGE;
 
+    /* Read current control register and forcefully disable the IOMMU. */
+    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
+    if ( iommu->ctrl.iommu_en )
+        printk(XENLOG_WARNING
+               "AMD-Vi: IOMMU %pp enabled by firmware (%016lx)\n",
+               &iommu->sbdf, iommu->ctrl.raw);
+    disable_iommu(iommu, true);
+
+    /* With the IOMMU disabled zero the control register. */
+    iommu->ctrl.raw = 0;
+    writeq(0, iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
+
     return 0;
 }
 
-- 
2.53.0


