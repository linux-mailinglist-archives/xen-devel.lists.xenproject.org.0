Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA560D088F2
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 11:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198528.1515447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9kI-0003mf-Lk; Fri, 09 Jan 2026 10:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198528.1515447; Fri, 09 Jan 2026 10:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9kI-0003jj-IB; Fri, 09 Jan 2026 10:29:30 +0000
Received: by outflank-mailman (input) for mailman id 1198528;
 Fri, 09 Jan 2026 10:29:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5fL6=7O=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ve9kH-0003jd-LQ
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 10:29:29 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12f4adda-ed46-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 11:29:28 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5065.namprd03.prod.outlook.com (2603:10b6:5:1e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 10:29:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 10:29:24 +0000
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
X-Inumbo-ID: 12f4adda-ed46-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOeesVOkv319W0tvcZFOHytqAiJ5YjDm4FXuAlBaNSatEXBhIAE6BBx/c/DwRrg/Ops3BDrQgHf3JSwr7uTYofp6+VFChqO2S09B9fppTqJVO/hrcuQtGLf9eD4G4eiNGvpIWRE8c0/D9Jl+2xP11uMGw2uilFIji4dmWeLV4JV2TM8WdqLb0mqZWNrp68yavZgTbE5Us8VuxwMzr0ielLKTRylz3vU0p/xQIvkXR7BIAdSAkYMEWBvshUXb5lM/ugbBrigVOL1m54iw4SEpZtFjIq/h69++KLDkgSdilXyDK9ZtdcseE1X0WiMzGGuAnnY5pKVXoe/pVocJqW3IyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8Kiv3g0HXuAFdz8U4Z/Yr9RVDAKlbyY5D2x8e+aL1I=;
 b=CmrcrhYTShwJFpaLk6BCnGxZdcoZ3tRjHv4eLdA04aOY3wPN3XwhnvIjnz3XAbhYd4B4PiUVvWZ3bs1+/xgKiAJJeJ0OLoN4iLVIIgusdn8r0SWMUWfWayvOqilHF00T964y2HQPtipuwCOH070I83VsoR7nAhUIMoFfXTiVSuzEUgUPyO6uXJhx+RT229AhwHaFoZc6HdvuSbeAG24VKdUKKsOp2nqAOjrNoaQjYPb88FzUqWFY6hqLsONc/gdGW489oIdExIiRqOOBz9uZx0jPcuKBR1oE/h/PFuLGNRjnSNGipK+0It2ZPbi2L0o26IIw9KwfKgcGJxwZCxSAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8Kiv3g0HXuAFdz8U4Z/Yr9RVDAKlbyY5D2x8e+aL1I=;
 b=HupfWUqBEchKlnxOiuAWJvL13xtswEPQklPLexv9hv+8szYsW3c7HInjkwtL0FPBPdXU864jkqIK9edeEUjwsIXFSMK6oM9TOKQGOPBjUU643f0j1u8bFRhn4RixqDw+bHW13Bb6st8ZXe+rO3KXTJSAeuNT/WLS/VXkU+8fCqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b6befa76-c80c-43d1-bda3-e60e1217fa80@citrix.com>
Date: Fri, 9 Jan 2026 10:29:20 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] xen/mm: limit in-place scrubbing
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <6b4c352b-f4fd-4b81-84ac-41b7d3e04f92@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <6b4c352b-f4fd-4b81-84ac-41b7d3e04f92@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: b727994f-7daf-4ebe-2f34-08de4f69f598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sjd0NHdTY0lYdHFkRy81UzRrWWN5WHgxeHkwM2NQUk9IRHFlYVhMTkFHVnVQ?=
 =?utf-8?B?ZGNwQzd0dzN0RTFHUHdodGhyYkVVNFVJK09BYitGTzk1a1B0NUpMS1REV1hp?=
 =?utf-8?B?RTBmR291VWpScEpUMmNDQmluWTVNdmQyM1kvbVE4cGQ0Z09zTlI3Y2ZWczNK?=
 =?utf-8?B?ZVUzWk43UVA3YVlxVDRWdTY4MkQ3TC9GOTdWditZWXNsc0ZpaEwwYVQzd3pO?=
 =?utf-8?B?R2pMYTRmM2RQcUF6MENnQWlxZmVYKzRtOEtVY3JLQ2MwbDl4YXBwSkNHNXBW?=
 =?utf-8?B?VTdRVHlBeTNldUM0bE9jVHQ5TER4SHNBZndHOHR3dTBIVFJrWlZaYysyQ0ZJ?=
 =?utf-8?B?ZUdOU050dTJWUFFBV21WNjE3dnYzR2tJMDNmTlgvdXczb0FpV21ra09ZUUY3?=
 =?utf-8?B?VUJDbnFlYmptKzV4SG9kSVQvSnBEY3ZrN2thVFltUjZ1NmhPNnZQZ2ZPUHVC?=
 =?utf-8?B?dHhnRzR1L0VjS0o2b0ZlSEdyZFA2L0QvcForNmRJeEM3YVRvNE1TbTI4eis2?=
 =?utf-8?B?UU5oRU1aUTc2MUpteDhGWVEwbGZZS2FUcTBBRDdwKy9IbjhraXhORkMydXB4?=
 =?utf-8?B?cVRnZ0RhMEtwL0p5WVBveERZV1pOWUY3NU1BKzdIckhtU3VEaU02L1dROHF1?=
 =?utf-8?B?cVh1czBXYUtwQUlKY3dqcyswMTRSNStrUHE0T1RrdGNpVmJnWTJucGNUUndM?=
 =?utf-8?B?QldFSzNmTWZpeDd2SnhVakJMZkxhaUZwWDFORHJINXg5Skk1T2hkY0RYWGV1?=
 =?utf-8?B?Wnp1Y1hMTW5WVlBHaTl5UlhIV0dtcEd4MXRMN1BFb1ZtOFg1cEhWUFRlS0x3?=
 =?utf-8?B?c1pES1JTcmphVE42Z1BrbFFjOVVjeUVQRUVxeVlzVTFISm9xRU1WbTlKaUJa?=
 =?utf-8?B?TnhQdGlRaGNYV282RUh5ekw0QzJBR3NPaGlmd3MzeEVKQ3dSenF3Mjk3OU5V?=
 =?utf-8?B?UGVWMC95ekF1V1crVUEzVFkySEhZVWwydlJNaUhQcVIzWFJkUDVIbnQ1bmg3?=
 =?utf-8?B?MGtraktZeHN0OHBabEg5WjlTSkFaRTZxclJXc1lGb1ZZYmczZVBEWmV5dWJo?=
 =?utf-8?B?Nzh5NGNna1NKViticU1kbHhUcE5KcUZkTUtYSW1WUVcrZmQ2OUQvNm1YbWZq?=
 =?utf-8?B?Rk1IUmdDNnY5ak1rK3dXbVJzWmZwZzVJMCs5S3lFN3dFc2RBcU5jWUtTdmo3?=
 =?utf-8?B?MGFjc2xwcjJXRTlCSDZEeDhXZmxmbmtGWFlxbTNyNFV4YWRXSUtES2dvUUtS?=
 =?utf-8?B?RGNnUHNJczlIODRhaE1YSkk1VTRrNThTYlBsVG92eDBYZjd0NzRKL2xKYzBU?=
 =?utf-8?B?R3VFVllMNkNENm5USzIrYTFoVFRHNE1MSCt6Mk5ZYzBZd3hMOUphZHF4SmVD?=
 =?utf-8?B?YmRmeXprUmZxaitva1JaSzgzMmRFMS85RFRvWG1jbzFUSXg3VzdEU3hROWlR?=
 =?utf-8?B?eHV3RjNvZjd0S1diR1BqMlN0RnZMdHlxZFVrVXFHWEdWS2FMZ0ZZbHAwSHBP?=
 =?utf-8?B?KzZpZTU1WU9aT1ZHTWZnSm10SUZqSHpyeks3M1ZBbldUY0tmNWRkbEg3bllx?=
 =?utf-8?B?Qm81bUx3MmVKUUhrME9yUk5OeDRmQ3ZKSTZPRmRGdmtTeUhrZlNPcE9LM0JQ?=
 =?utf-8?B?SGF6bkl3ZXcxTWFhaHViQkNIR3pZd01zM3dlOVJuMUkrRDdmZXl4S3IvYVg0?=
 =?utf-8?B?SWFEOXZTZmg2SmVEMGNxYjVZY1lSK3NtbWJVclAzTEdNVmdEaWtPYUdtdVhL?=
 =?utf-8?B?UFgzcUZCSVNqM0ZrUVlML2l3dExlZEZoOVBXZTMySGc2QWtPTG5SNW9yT01X?=
 =?utf-8?B?MEF1SUJkbUFwSjZYWWJNckRJOW9Lb2VxNDRObHYyZjQ0SnRCWE9XMVptV2wy?=
 =?utf-8?B?bXB1dHN1V0VMUnEzUDBFWkdPK2c3TzBDVlN4b3pyRVF1blVseUIxTGlNZGFK?=
 =?utf-8?Q?kY7uefgdFouji1rMHjq3To+HAEyu0piG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVlSUUFUMXVKa2wyQkg0RVlLRkJiSzNGbi80dVpwM2FFOFV3d0E4UDNsNGJt?=
 =?utf-8?B?VGRBdkZmNVd0bitmN01GV0lScW5kTUI0YWJ2TkNibGI0bjQ3UWw1NEFVZUE1?=
 =?utf-8?B?clFCQnY3aFBvOEFTc2NXb1RIUGljcityUW1jTWt3YlVrbVFkMllCdkd3cFYx?=
 =?utf-8?B?YVlrT0hqcHpRVHNmODRpaXM1RkpoOFc5L2YyK1M1QXcvRUtIK2EzaGxsRlJZ?=
 =?utf-8?B?K29kTjJjc3JZeVZxMjc0MXZpQU4wbXRhL1VQcG4rV1lGTitXOFROU2Vtak0x?=
 =?utf-8?B?U09UZXdaTGhjaG45WDBNeGxNcENuZ1oxejNuTUd5TUc3Wm1Wb2FTSzZtMmpL?=
 =?utf-8?B?Y2ZpQm1HVmVYSGdtQUVIcVBUNlFnVW1UZlNrRUFRRWoyaUlwZmkrbVdCTVMr?=
 =?utf-8?B?b2thUXBNQWxYbXQ0WUdsYnRJeDE2ZFVoM29xTnRmQ3A4V0F0a01qQlZVT3pn?=
 =?utf-8?B?bVY4UlRwZ2dTQitJWjZTZnR4SThqTjF6bEMrd09qazJqblE2TDhjNzhoZlp4?=
 =?utf-8?B?d3FtVDkzZmtqTGNTWWNaVkF0Mzc3QzJBOFhCWjFRSkVFZTJKZEFSZFVyUHAw?=
 =?utf-8?B?QlFZT002aExIR29XNmJVQVI3aVgyb2h1OEs3NERiRlVBd3ozNSs4YU9HbytY?=
 =?utf-8?B?K3VibVJYeGhDZHZ3MGx0Q09zMHZKM1J6aHA4V3RnMjRueUxtL1B0QUVPNHJy?=
 =?utf-8?B?cUZwM2RvdG5rcFIyOXhLWTd4S3VPeHRqYTFZME85UXpLRXFRdk5jTHdWem5z?=
 =?utf-8?B?SlBGWlRVOXZNWXltYWVqdnFkeDVPRk1vd2EycVJNU2o4Q0R5MldobEY5Yk5V?=
 =?utf-8?B?WjVpeFhvUmNIbCt1Wmh6QUYvN0R5bjE5dzVJNExDVWJHQ1BCWWhkTXRUZlZm?=
 =?utf-8?B?UkJqRUoyZkZMeXZLZjZOa1ZVTmdZeUYvMDJuMG91aXoyYWtDVkdkWUovWkZI?=
 =?utf-8?B?OVFtSnJqZDNPaHFZYlZyWkJLbjJWT01sWDRpeEZqemthT0lUVDNVTnBsL2ZL?=
 =?utf-8?B?K21RQUtUMG9PL2N5K2lFRXBmbE80a0RXR2FDYUc5SEZsKzhyYWt0dEZnSWNi?=
 =?utf-8?B?aUZ1NzV3WkhYRU0wTjVsSGN1dS9sZTNUY1pKcjZLZDVVVjdTTThsWmdpTDdP?=
 =?utf-8?B?UGhNakJDc05yMUF4dEZsa1NkYlkwd0JPeThmbGQ1MzZ3UEFJV2FxL0dWUHVN?=
 =?utf-8?B?SC9pTURhV3kxMTBQem1rSFI3Z0dKNklaWFlKUy83NGxnTnUva2FEcUw2cURl?=
 =?utf-8?B?RW15QlkycFdXZWxoVGw2Tm01cFZMRGRIdVI1NVZFVEw0WFpEK1Rjb2k5Q2Qw?=
 =?utf-8?B?LzFQaWpqTDlwS1NTdS9qQnNCb1NEVWRITDFadUhSbnY2L2JOdk95TVhyMmd3?=
 =?utf-8?B?b2ZDblNxdmkzakxIbkZwK29wSUppeXBvbGtWckpFYTBSTGhsVjdsNjRBbGxy?=
 =?utf-8?B?RlV6Nk95cWVrT1F0V0RtYis2Sy9Xd0pLYjA4YytPcmUzMWdJZGZ3MlRjU29O?=
 =?utf-8?B?OUhha0hTdkhZNTZXMnBJOVEza2oyLzNwMWxLMmh5Rm5jSGR6b2hHaWQyM0FK?=
 =?utf-8?B?bEpQbkZuQmZBNXZXSzJaSm5mbU5HOEZmNjhUbFUrOWsvdUNORUxweUs0SnNw?=
 =?utf-8?B?UTlkbGgyQnhEbXBMZ2dVNG1YVXFrTFpSVG9IMlErRG5rK0ErZHVWK1d0TEFL?=
 =?utf-8?B?SHV2eFZ2ZWlMMDYxcWxmY0h4cHprd01zVlNTM3E5Njh0ekJKeER3OWxHRjRF?=
 =?utf-8?B?Mm8xMm1ycURTL3R1K0RLNGg5WXJQN2c5YVZBZnRyc012OGdjQXBUcENDdDI5?=
 =?utf-8?B?T3RIdUl3bDFnOExhVlhtM0VPWEJGWHJFNW9GQXVza0UrMWxQdWQrT1duRFVS?=
 =?utf-8?B?dWlUNjRvTWxhTzJuNjNDWStXSlVHVGQyVkFjQjlNZWNhdW1haU9BNGRvTWh5?=
 =?utf-8?B?RDljRldDcUZaOFcxKzRKcThtMG5nODY5dm9McWVIMVFBVWc5c0FENURjOCs5?=
 =?utf-8?B?YlUyV3BmTC9SdE9MVlpPdTBKMmNPdUs3RzJmakx1NTRUenM4MWNMV2xxMlVX?=
 =?utf-8?B?QjZnbFFSMWFCNHVNQmhyMXA5eGV5SkNvR1ZrMys5ZlZTbDRmRzNmUGlIQUJY?=
 =?utf-8?B?SCsvNzBCeHdzRXBHbDFGSHIzOTBOdjVFQWZTMFVoZWFVbEpqMkhPSGtSRHdW?=
 =?utf-8?B?REloNGdaRGtoSDhETXYwdlp5TWw4L1phTGVrTmFrS3NHeHV0d3J5aFFHOEU2?=
 =?utf-8?B?bU41NHUrRjdTYUdpa2NVRGZCWTZKcGwyZlhxNDYrSE1NMzhrS2taczRXYmFU?=
 =?utf-8?B?bEtwUkxZVnErdG1Gb2YzcXNrQ2NaU0JGSisvQlovM2RmSldkWXNhZXduSG9r?=
 =?utf-8?Q?pQ+vMbY1Va6BPsVI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b727994f-7daf-4ebe-2f34-08de4f69f598
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:29:24.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Saa3W3k1+iOF++kIEEFI65PIc3ua6uyi+9lgtKMT+taLu0BEseMFWeU2gXqGVPfmuZSO95+uFv4rL1AcVsW1BWu0crvEy2t9MvfSkAvhww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065

On 09/01/2026 10:15 am, Jan Beulich wrote:
> On 08.01.2026 18:55, Roger Pau Monne wrote:
>> In XenServer we have seen the watchdog occasionally triggering during
>> domain creation if 1GB pages are scrubbed in-place during physmap
>> population.
> That's pretty extreme - writing to 1Gb of memory can't really take over 5s,
> can it?

Sure it can.

> Is there lock contention involved?

Almost certainly, and it's probably the more relevant aspect in this case.

> Or is this when very many CPUs
> try to do the same in parallel?

The scenario is reboot of a VM when Xapi is doing NUMA placement using
per-node claims.

In this case, even with sufficient scrubbed RAM on other nodes, you need
to take from the node you claimed on which might need scrubbing.

The underlying problem is the need to do a long running operation in a
context where you cannot continue, and cannot (reasonably) fail.

~Andrew

