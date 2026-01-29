Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EyhADNqe2lEEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:09:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E68B0BE1
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216534.1526464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlShx-00073F-9Q; Thu, 29 Jan 2026 14:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216534.1526464; Thu, 29 Jan 2026 14:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlShx-00070O-61; Thu, 29 Jan 2026 14:09:17 +0000
Received: by outflank-mailman (input) for mailman id 1216534;
 Thu, 29 Jan 2026 14:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlShw-00070I-7B
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:09:16 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 174e3bc6-fd1c-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 15:09:15 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS4PR03MB8397.namprd03.prod.outlook.com (2603:10b6:8:328::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 29 Jan
 2026 14:09:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:09:11 +0000
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
X-Inumbo-ID: 174e3bc6-fd1c-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5yI8+R0QkpGksdr10x6SYtT3s72vD2QbFFoJe4JuwgRo/09a7ImpAo530kBUvG9WlxyCPmf+xpQ/qbv4FkmBs70jOoufrEAxIkSAbk+1Ua4LbMC/FGhTLyu6g4sj+wVCmIoSCOljOPQ0wITQMnYKKQuk0oHKOwKAIldStf9ktNZG33YWkIozdl7bjjlHXPQ2rnXXKMBuqwbVwHtaRnFkgeAnyujcLhAwuNNAvnGvaHIZ26xZrFqvfqSFDhJwVFzVOQCzIxUuK9aA7MSfgQRrzyO5MPC5MLTJ82iPyR0IsMqP+ZPozwiaRVQZWn2AYUEtdc0Av7TdDrCVbkRLJ1Zqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfVWljgzAYBjnRL93HAlyxWwSWTevIJlRtOtVLjUZXQ=;
 b=aDobC4pyRBHbJUEYtA0x4VWynZO1aUFvjLvX6Nhs7u4UpGagxXz5UVB7ge+n4+wJL3J40pQrI1EU4+81ZJy2zhxquZvnd2t9DW8UGHy5qytoVtrFD8GnY3euaurgUeO85KZCPLd7Z4QKcBe3hNoqdbk+AZgWPbsxoG6LWj2BY6lAMFRRycCDeSa5ogxiD07kMddELrqX/vfGyct+Jx8+a5HCD4Q3XFrAZfMwQQBqO5+kUnl8aOcfB0gMn4AlHBa86UH8E3jbx1xFlnRlMS8WCa/vKmCkxwBRu7d5vYNr0jx+8wdf6Ov0fe0C8dyYFV3vDasmbJZaWveptWi+kMC1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfVWljgzAYBjnRL93HAlyxWwSWTevIJlRtOtVLjUZXQ=;
 b=Apk/HbGEIRYOz8w2q/alHiQzda+H1FQoMck7Il+ogQQ97+RfrSU3FpGZILlK481mLZaYTLo5Sl/EzszPGTaeI2y3C/R763yOrqQRtnCOQQzx2VluF5Tl0NWYgdBThKs+/VVYGWWdRiB2l3qkD2BZqblw7zIO1X3nbustTuqdHH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 15:09:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 2/6] PCI: determine whether a device has extended
 config space
Message-ID: <aXtqBEyhPgFSmvZA@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <99d45a27-ce67-4f10-9883-dba96f055285@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99d45a27-ce67-4f10-9883-dba96f055285@suse.com>
X-ClientProxiedBy: MA3P292CA0072.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS4PR03MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 480ee646-11d8-46b7-4896-08de5f3ff9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODhpUnpTZ2VtVnk5M3NqQlBHbDg2ZWlsalo5MEdNZlZqczViL1ZQbHphTGVS?=
 =?utf-8?B?c0w0OHlRN0VzOUcvQ3hIU0tIOGRLYjZXQjk1NCs0QlFBVkRHQkRialROZGFu?=
 =?utf-8?B?S05HOXZEbkNsblZUK2JNVC9RV1dTVjdwK0dtWXFVYUxUNU9CTnR6Z2R2OTRp?=
 =?utf-8?B?V05KV1FYQWdNa1JhSkcxeERxMW9lc296VVNVczN5d1FTM0ZsTFJ1WVcrRzNK?=
 =?utf-8?B?MUpQUXpVUFNhc0lzaU5kMUxwVXNnci9mbHJUU2VSL1NlNVloTDdRZ1Y0YVFn?=
 =?utf-8?B?QUhneGczTUZFeDZPVlFSL2dWVlZCazVyZFRnUHBiNFMzR01RbjdYUmFkRjBW?=
 =?utf-8?B?SXJtTlR5bHZYV0xnaDh4NnVIQVFSRzl2YjlDKzBYKzZvT2hIMllZalFsSXpD?=
 =?utf-8?B?eklyQklKK0FQRTd1eFJZYTlUeW84QStrZStmbVlaMDY3N2FvMjlHSUx1RU9k?=
 =?utf-8?B?TEFhWU5KdGJQb0F1UmtsK0JEdGRBaXRtY0plL09GVDV3dkp5UUVhTVRSVWtT?=
 =?utf-8?B?bnFmZWtCSWd0VHVFTTdKaWhGMWJOc2JRUkIvQncwcVVGdDQzcjVWVGRlUW52?=
 =?utf-8?B?N2podVd1RmRQRGcrUnZhVVc0bVk2cTk2azhDTTVlQzA3RVNVTFl2Z0YxbVZS?=
 =?utf-8?B?bjhJTEV6amlYL3B0TkRWMks5TkczRjFuaU0wdXB1dDZrZ1FINkd0NWFpK2Uy?=
 =?utf-8?B?YXJ4Unp1U0xaaVJXdmZVaEN6ZXZvSmt4bzRod0M3U0p4SXA5NFZjblUvL1hT?=
 =?utf-8?B?dXhWUHE2YSsrZUZuOS9PQ0pjemF3eVhqOHcvTk5UYWxieWExVG1KWVUrem1R?=
 =?utf-8?B?TElhWHdmZzVFUUlDbEhPdkN4eGRTSTdXWW4wdVlZNEswSUlqMmoxcy9oVitS?=
 =?utf-8?B?SC9qRmFNd2xQcWM1cXVwR3I1WldGQTc1Uk8yaGhvS2tEVlNGUTBBZUVXS082?=
 =?utf-8?B?ZHZhZ2syRGlPNkJTdkUrSmdLRTFvM3JuNmJjWTFzSktWd2tqQjJsRXhyVlI4?=
 =?utf-8?B?K253endGaFlZeHovM2g4U1pnb0g3emdhS2VDQjBMRklpVFkzOElMV25ZRkoz?=
 =?utf-8?B?MzJTdVVmcmVQR3JGN2xUQ0tmVEpGREhRcndlZWo3WDNwOExubThVYjIzMWlJ?=
 =?utf-8?B?LzVUSmxjeS9hU2xyMUJhRVpuQ1ZtTkF4OGtFQ2dOYVJNQmd6dm54QjJNM2NE?=
 =?utf-8?B?RzdXM1FjcTZxNERIZTNia09ZNDFDczVxblg1RTNiS3JjLytnakowTUxGei8x?=
 =?utf-8?B?WGZheXNRVWRvNkQvMS80aElPQ2dUWFdGaGw5SVExczNyaFpMc3FEN09QcU04?=
 =?utf-8?B?L0t6Rk1qNW5jVE42TTY5OWEyTzZjQ2RWcUhPWVF6RU9TUGdqNjdTRW1sVkE4?=
 =?utf-8?B?cjZSL2Z6OXBjSUVvZWlmN1JUd0dESUlPMHdoVEY1WUY3L1NvcmFBV29RQTk1?=
 =?utf-8?B?UVpqSDB2OWkwRUdObUZCcjJVbnkwQy8waFM4V29kSkVJaGd5Y2dzUnBqN1l4?=
 =?utf-8?B?R1N6bzlvZjlpVlFCTFhkZS9kRVJmRkR3OEwzbTh2RlFQVnlmMGlkVzhqbmRS?=
 =?utf-8?B?UVFjZDNENHl0QTIxVi9KOWpHTVlrMlZQSnVWYnczdHhJNURGd01ORHF4bklr?=
 =?utf-8?B?dHlIbVpSeDVBdFBzTHUrQTdPYko0ODNIVVBjRUU2TmsrSWZJaDdsN1VkYnQw?=
 =?utf-8?B?T2tJdCszd1k0TmRzeXFDb3pnZjYxTE95Wk1WeFd3bUtoajBDaG1jT08vY2w0?=
 =?utf-8?B?M1FBVHovVDFWbTRnVXU4U3FMWFNaM3UxMU82QkhMcno2YStlZmNEcUxkakVC?=
 =?utf-8?B?d05aMmdUZlI3V09wSWFzRHlDeldld21mWDk5eE9oak40QXN0VXNVNWpVbFI4?=
 =?utf-8?B?N2FjSGhlSTBPaGxPZnMwTnpoSUJ5R0hhRXlkblIxSGVCUHc2WklIWUNta0Vp?=
 =?utf-8?B?VDZyUVRUOTBlSnBWbkVUYWVuRjBsSDBydndJZVMvYzhDQ25jdGVYc0xYZG1E?=
 =?utf-8?B?dEFCRWk2RWdPSE9DZFFXNzdhM05Qby8zYmdJc0N0UFNoS014TTVZT2paMTRN?=
 =?utf-8?B?bTFrWE85d0tQMmJjVllqdTVMWjM5NDVPUDRqS2hBb0MyV2RQZGNSSHpjMllK?=
 =?utf-8?Q?jvMo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkUzaTV3bm5aRFV0SDM4VHZ5UDN0Q1dQSTNXbnpMLzlSMk1CMWNqblEvRS9m?=
 =?utf-8?B?dDQxb0M2ejRVSlh1RWtyK2dPamE3QlJWUnB1R1FzaWYyYm8xeEdBVGxkemlO?=
 =?utf-8?B?SW1yZHp6bXJRZGNNTHFvWWV1dW05OHpMd0QxbXNobW5HakR2SmNSbnYwcmxT?=
 =?utf-8?B?VXM4eDlJSkVTbEw2RjBvME5SaFlIUThaTGlWU1dqVWpib2xSOGVFOGZDd1lG?=
 =?utf-8?B?Wm16cHZaUHRUK1pLRVlvRTF3N0pMeDBjU3dVNkxhSHk4aUt0NHQyY0VSUzJr?=
 =?utf-8?B?YS9ZM1NhWUNHdno1U3htTC9pUDFvam5JNTl3Q1luT0s4SU1ocWhJMUJkd0RE?=
 =?utf-8?B?a1VyT1J0UXp0MmpEM3hkVmdWRVlpems2SHRvaHR5WG1nUEVJM1pVM3lxZUtX?=
 =?utf-8?B?VjE3SFAzaS9XN2xxTTVCYmtNaWh3UUFjejRjMlRWUkxncmFrdElZWndoWUxw?=
 =?utf-8?B?QkZ4WnJ5RGE0VTBJZHMwTFQ0T3IxR1p2VFVxNEFlWUxqWDFsQXdrZVplODRO?=
 =?utf-8?B?Zmh1QUFzbXlEMEtKZWlreEJJR1RKNy9PbFBJSVlrSlNkUzkxQk5HandhWm5v?=
 =?utf-8?B?QlFPUld4Rk5ML0k2L1craitZOVhrblRGOXp6Nk5SYkphRmZnME9sVy82T1Bz?=
 =?utf-8?B?VjJqalNaZ2RLYzdpQ05JYjFmcVdaUEZBczR3QWRPMUNLTkl0U1l6QkZmc2ZN?=
 =?utf-8?B?NXUyNjk0Y1NSM1hZd1NLUkU2WENmUFZML05tOXltYVJrM0ZpUDlzNjlacUk1?=
 =?utf-8?B?dzFGUk5hUmw4UUhiNy9KeUZINndTVEdoRzFsYXdCTXQvNldUOXYvQWFOUWJL?=
 =?utf-8?B?SW9YRmhib3RRbVh2Q0RFT1FYQzNVbXNFYmhNbU5MUTJXM0JiRDhFVzIzNTl3?=
 =?utf-8?B?ZFpVYVIwRTA2L1Vkd3BJUDhyRnRCeXNOOWlJMzdVcW9GUHdueVZHN05Wam1G?=
 =?utf-8?B?S0ZqTFVFQXF6ZTFBSmdsUzF4S1hHV3N0L0xtUEpHWE5scnlQY0F2L2E2MjZv?=
 =?utf-8?B?ZDVIMGJBYTE0cHpObXJEVGhmdWlGYkszckZEQVZzKzVDNUd6V0pSTGZ3eXl4?=
 =?utf-8?B?UGtVT1ArK3BHWThHUCs0WGI4S2YzUTZ0T0ZIbzRYaVJLTy9YbklGS1hVUVhF?=
 =?utf-8?B?N0pkN3hVdklpYjFmOGpLSFFLWWZTdnJnUnM2OGVWVVNNRXhYWUZFUWZoK2c2?=
 =?utf-8?B?d3hOMjRTYU9VUytmMEFDRUx0cUhJL29RU2FrNERqV2k2QXFXNE45Mk1mNW9L?=
 =?utf-8?B?dmdlUHFSK0NxeTNFR1kvdDIzU3dOWEdCN2FNTFUxVDZSQVJ6emhPMTFxQkxT?=
 =?utf-8?B?UzBmUXhha1JOOStoSTkvRFlWZkJqNE9iZllsQURGbjhIamFCdTNmLzNUZjc4?=
 =?utf-8?B?THBJMkIySHRpanE1ZllUZ1RqbjV0SHNEdjFyVTBNRE04dXFCa0M2SlZWTHlF?=
 =?utf-8?B?ZXAxRzZmby9HRDJkckU2Rk5OOFZuYys4b0o4U3dOVGs3ME52cXJxdGthSzND?=
 =?utf-8?B?eW11dXJrbU9TYXdDVk9aWVJoZVNTVnhsWWJ4UE8xdmM4OTNnKzZYQi9BRTJu?=
 =?utf-8?B?WXFvU1MwTThBNmtMNDdadHBoRFdtMk5xWVVScE96NnNYZGk2Z2syMXUrSGdW?=
 =?utf-8?B?NGJZMDMrUmxVOHNIRGh4b0hna2kvNGFJTVpwdnFqTHhaTkpVQnJQb2c3V3BJ?=
 =?utf-8?B?aUtsNDVSenF1MEZMK2ZlYm13eG05SktIbzVzQ0x3b1laSXJvRzJFNjlvTHQv?=
 =?utf-8?B?cWUzU0pINS9lZnkrVkdhM0lRUEFmOUtxc3dCN2N1dTU2YWhxU2lTbjMrNTcr?=
 =?utf-8?B?OGFjb2hjZCsrY3RoOFJZZVRNa29zVmdQWVV6cTlYWGo2amhzQlg0QnRGUEFL?=
 =?utf-8?B?Lzkza3ZseGV6S3V0MVVXN0NOeVkwNDRFUktlQWJCd3FhZlkvdTR3QUw1VXdF?=
 =?utf-8?B?b1VibHdhZkN4azErK1RscFZuNlZFeGZ5MnJKbjg2c1R1NzBXU0xrdFVCMUsw?=
 =?utf-8?B?N1lMQWs1UkpWc2llNG8xNFpLd3N4VTMxdXRUdER3azFRUjJ4NXJoYkRUTHZ5?=
 =?utf-8?B?dGhzOFozY3M4WG11d0tJUUcvRVlidUhXOER0SFNxOEIyZGhzSEZXcTJKeFBX?=
 =?utf-8?B?dEtmU2xWUm5wN1FxVStnME9nT1pkMWtpNmYzaUdIYXBsWkpzWUl3VTUzT2tS?=
 =?utf-8?B?emxRT3I2RkU1N1dWMEdCR1J0ZW1Dck9uVDF6YnA4WFZyN0JJUmw2eXZ3d0dl?=
 =?utf-8?B?VVA1Y0tScFVkTmgzcVdmenFRT2dENkl1a29aTmlZbzJHdnpiT2lHTVQzNFAv?=
 =?utf-8?B?N1I5VkpPemV4S2ZhaGRFVU9YYXRTNFVERGl0VjN4QmxCekhkMUdvZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480ee646-11d8-46b7-4896-08de5f3ff9e5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:09:11.5448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wP/fPlE+DUONiwi+PgUPm2DyuUTnCZRqdiDUSFmF00v+OFMJpiFqH7eYn8Q3TiggBkfMInF/NWqEWKjP77I50w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8397
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,suse.com:email,citrix.com:email,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 63E68B0BE1
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:08:27PM +0100, Jan Beulich wrote:
> Legacy PCI devices don't have any extended config space. Reading any part
> thereof may return all ones or other arbitrary data, e.g. in some cases
> base config space contents repeatedly.
> 
> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
> determination of device type; in particular some comments are taken
> verbatim from there. Like with Linux'es CONFIG_PCI_QUIRKS, only the alias
> detection logic is covered by the new "pci=no-quirks". The singular access
> at PCI_CFG_SPACE_SIZE is left unconditional.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> The warning near the bottom of pci_check_extcfg() may be issued multiple
> times for a single device now. Should we try to avoid that?
> 
> Note that no vPCI adjustments are done here, but they're going to be
> needed: Whatever requires extended capabilities will need re-
> evaluating / newly establishing / tearing down in case an invocation of
> PHYSDEVOP_pci_mmcfg_reserved alters global state.
> ---
> v3: Add command line (sub-)option.
> v2: Major re-work to also check upon PHYSDEVOP_pci_mmcfg_reserved
>     invocation.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2009,12 +2009,21 @@ Only effective if CONFIG_PARTIAL_EMULATI
>  behavior.**
>  
>  ### pci
> -    = List of [ serr=<bool>, perr=<bool> ]
> +    = List of [ serr=<bool>, perr=<bool>, quirks=<bool> ]
> +
> +* `serr` and `perr`
>  
>      Default: Signaling left as set by firmware.
>  
> -Override the firmware settings, and explicitly enable or disable the
> -signalling of PCI System and Parity errors.
> +  Override the firmware settings, and explicitly enable or disable the
> +  signalling of PCI System and Parity errors.
> +
> +* `quirks`
> +
> +    Default: `on`
> +
> +  In its negative form, allows to suppress certain quirk workarounds, in case
> +  they cause issues.

Not that I oppose to this, but I've assumed that you would introduce
an option to fallback to the previous behavior where Xen would just
assume extended space to be accessible.

I'm fine with this, just assumed it would be a proper fallback to the
previous behavior (which doesn't make much sense as it's partially
bogus when used with vPCI).

Regards, Roger.

