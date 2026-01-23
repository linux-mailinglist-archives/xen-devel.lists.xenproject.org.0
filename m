Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C30HqW/c2mjyQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:36:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E264C79B2E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212484.1523587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjM0m-0008Sc-3s; Fri, 23 Jan 2026 18:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212484.1523587; Fri, 23 Jan 2026 18:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjM0m-0008Qv-0q; Fri, 23 Jan 2026 18:36:00 +0000
Received: by outflank-mailman (input) for mailman id 1212484;
 Fri, 23 Jan 2026 18:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Sxq=74=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vjM0k-0008Qe-Ve
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 18:35:58 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b763102-f88a-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 19:35:58 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5274.namprd03.prod.outlook.com (2603:10b6:5:24b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:35:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Fri, 23 Jan 2026
 18:35:55 +0000
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
X-Inumbo-ID: 5b763102-f88a-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wyt3Q5snIfwoEd5RzsXePb4/PrVsUkrfjobKfBpw/nwLyYB7fthO/MUji41f5ZgU78NzxZx1NgDqjED8xMZCX7Rfj5gfjNmLm9tSAQb9vhHmijA516zGgKRLJ8MIX6Em1QS+ueW4WuNBOpEgOWzNhz1IH/txQMkUOVcAK857+W1t9ExakeYNN0DukA/OtxuC/lb3SJwuUa7d0xo5qQ3SkRlAONTHtXSkFDniQqkOSZLGFobgo56gvN33fmXPkqyIz50ziwRFIasJyYODn+m9nrbTVQ2qjTP/Z+qXMQg3n9qEau5+IGhFyFWwf+TcQSPhmAsfio2urv59ed070fTK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDYKtXRIwGDvhRwvbrWZX7feYB597Gsg6ZTvn4WzwH0=;
 b=yVm0u9eswUOo2LYYZBu06pA4sUNOelnwfKSoMA66kRJDwa/QYhxvRTaBIBHssVEt6uh33/YIIJaB1fCCREmqFhc9bqwMYNEykwS5h72BcDJUvgl/WGJ3qUvf4JbkxCaYAwni9rb9t7FkVfClJQ4hK1OvqJo/OXFBoXgkOEcAZCfibYHvesS87jBKnSChlfpendWe0mb5ExFsfDOH5bZRoBLQEOYPgxfTUzUYtYD73MPnilwUTBxLPsuGIwGb24Br7b+jaDXc9rNny+nci/eUJTjkvhZ9g9x1hfGO85O7ZenSwlfFLrCQSjMR+aI7vUI5MdkTeYRgwx5cO0nvVeq7Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDYKtXRIwGDvhRwvbrWZX7feYB597Gsg6ZTvn4WzwH0=;
 b=ohjsW8MWSZkb3uQWI9SYeslPyjDW7zFWPHLnn7hU7TGLBH1f6o54GO0/iLVEgfo1SFWKBXSylj+KLCBBx/8OCKhWmUK2DEpoG8CWlzXmlqAcAN3spCnpGkScA1GahsiMAHmKm/WyY6ZR697ezK18HNmeL3j8hHs3VP6LfwnXAPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c78bae14-f6ce-4450-bf8f-5a19f8f7b975@citrix.com>
Date: Fri, 23 Jan 2026 18:35:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/4] x86/hvm: Remove cross-vendor checks from MSR
 handlers.
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <20260122164943.20691-4-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260122164943.20691-4-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0217.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5274:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e36dbf1-1223-4534-9522-08de5aae3e50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bytSdFdha2lEL21VMFlsYnJNZ3V0NmN0RmkxaUlyYytCVTVuaHJ0WU1tM3Bs?=
 =?utf-8?B?dStjWU56NDlwVlZLSG0rVVdnNEpoRnZ5UUVsU2cxbE9kRmJnclBmODErbUV2?=
 =?utf-8?B?UVN5Um5EZ1ZCcWZwZkZrdVpnNmtUU1dUYXlCUEo3bHBlVlQ4MUk5bkRXUms1?=
 =?utf-8?B?MlliY1hqRWVid0lUczVKZ3UwTElKOFJpMXpjc2gyMkNqQjd5RVB3cWFLQUZX?=
 =?utf-8?B?ODQwZEEzNG41NjU0Q2hQcHZZc2kydEd0V2NzT0NUbUxKeTRqMTR2aEF1Z2hW?=
 =?utf-8?B?aEpwcXRtTnBod3JxUHRmUE9KYUV3NVhBN3phOWZKYXhkSnU5UmU2TCsvcEta?=
 =?utf-8?B?cHMxc1lQOFlET09wWko4cUkxUXZFRWJabWx4MkVqSy9SZ1ozS3BkRURXbW5p?=
 =?utf-8?B?SElHRE8xUDlUMEh4VjJNK1loc3crZXgyUzhucGw4MWZTVy9WanRFdGlpV0l4?=
 =?utf-8?B?alIyNnpLRXhHamEwbUh6WnhSOXB5Q3ZuclpxQ2VwV2gxRlRNTWI5bjFLd2xG?=
 =?utf-8?B?L0p2YlBjU2RSY09ETGttb0duNU1jUTNleUFlM2VycGNuUjNuSEMrWWd6VkpW?=
 =?utf-8?B?cm82bjdOK3N1b1d4SFR2T3F4TUlQMmx4UlVrdElVbFdya1RZWEtlK3pOQW1P?=
 =?utf-8?B?SFpTMjA2RnYzSEZlOTVmanBtVTRDMml6U3YvN25lQjgyMVEwamsyNXZ2bWZN?=
 =?utf-8?B?anUyN0IycEwxcjBGVkZwRmFRVlRyZE1mSGZYL1NDNE56TVd5MndhN2lwR2tV?=
 =?utf-8?B?Q1U5UzlDTjFmRnc5Z0UvQkx2UTBkVkRETGpiY3pOWTdXN0c4T1ZmQVBJOS82?=
 =?utf-8?B?K2NMNkFPS2Jxb2d1V3lwbzhISTFzTGVTSGZLYkhrVFY4R2F3MkVYMkFXa3Iy?=
 =?utf-8?B?c0trRDlaaTJtMFNTT3ZLcENpTmQySkRHd0cra0J4Y0xac0VIaUlQU2FEdGF0?=
 =?utf-8?B?WDFYWlE4YVprV1VqN2J3cDlxWEhPcXNWaktSNnVEU3M0dldYQVNsYmtabEZx?=
 =?utf-8?B?azF1T0FaM2hsNFlNVTAxTlZnL0IzbUIzVDBLQWtORk4wV0FjZTgrSTR0UEll?=
 =?utf-8?B?OTZPMG1kN0EzbVJOUlllUzdERFY4cGRGZkk1NVc3Zk4zN0NlWitaa0NxMERB?=
 =?utf-8?B?akdtazJXcjBRemdWdjh2ZmVRUlBmNnpsNGhLWE5nM0tWdW5UaGh5UVRFbm8v?=
 =?utf-8?B?OHZWS01XTmFiRU43eFZoQlI0a2wwWG9PSkVsbWZ6REoreTkxcFdiR21VZWRx?=
 =?utf-8?B?YnFXRXFWaDR3c0pKMU9IcmE2RDJXczhYSW4rWURQcUVKRWdUL044cTBVVlBZ?=
 =?utf-8?B?UWVwaXFPai9OQmlRdzNhSTNUODAyak9JWFlmdllwdW55TDEzQjlsZWhyWEZU?=
 =?utf-8?B?U0d6a21wZjRtUXQ5ZkRVMUtxYnc0WnJBb0pNKzkrRVpzMjRiRG1SdWIyWEc1?=
 =?utf-8?B?OXJ0QUR3VVZoaEl3RWYyL0RndkgrQjdvWkZybTU4eERtZnh5a202TW9idjAz?=
 =?utf-8?B?dFByS0d1ZWZ1OVFwSlFjZU4zZlJBbUtSUFN5ZEw3YXN1R3E1V21FLzBiVWtL?=
 =?utf-8?B?bjF2RlJHZ09wY3V6c2MxSWJ1b0ZoT0huaTlub2FPODZ3b3NGVE9iNXZoZE45?=
 =?utf-8?B?SmJiTDgweWNyMlk5OERLcCtyTzZreGxLaEc3a05yMnJLNUNKZDJZbzVQempr?=
 =?utf-8?B?QzRzcFZIbjBOZjhpVkdPc3g1MHVjbTNFMGc0NWhDaDdhN1dUd25kdUQ5ZHRM?=
 =?utf-8?B?VVFFZ3JKUHdMWGo0cHNnTkF4S0NNdFl6UG42aXNIQWhlVklDb1ExbUFHMGNN?=
 =?utf-8?B?RTFPU0FtSTFHdEpQVHgxWHhEK1NBZnRtNkVCZlQrTnFQVXdOY01qalIrSHNH?=
 =?utf-8?B?b1lra2V6YzVBUWk5cXlKUzNvamhNNkxSWnpILzNOdkNPWG81T2Z3ajAza1F2?=
 =?utf-8?B?cU1YYmo1MWdVTi9oWDA0ZzJrZW1VR3VNOVRZVGlxdnRTckx4ajhhRi9yWkF6?=
 =?utf-8?B?dWg0czR6c0xGaHFGaGJ0R1dhVytZTEoweExDOUJHV1liYzZOYmRjTlM0NnNv?=
 =?utf-8?B?QUlnUTNBSjVKV3B1V3hDTzdWT0QwaHJLQ2FtYWx3S2oyU2dZelBCSkM2aUlZ?=
 =?utf-8?Q?NNcA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXpTc2duQ3EyY3lpV2JCcHdHZmNyT0szSFBPUFJtbDluV3UrZ1ZnSTZ6ckZs?=
 =?utf-8?B?Qks1WExqTHNqNGNaWlNJVGk1VWlvOGExV2ZHbzV1ZUF2WVZGd3lnZUlJY2NH?=
 =?utf-8?B?My9RaGk2OTFDRnJucXQxRnEvRDJxYk9EZ1UyK3hoSHoyK0hVbzBXU1p3T3Yw?=
 =?utf-8?B?d3JGaHVlbCsybGRlbWdQVGt5eWtrWWVHRFUwcjlaRFk3czAvTDlEaUNTL3Rp?=
 =?utf-8?B?Si9QdFB1cUZCRHdyMmp2VnA4YnFpL1ZBbmtzZnNGOXpJenJidGRXbTlJVHgy?=
 =?utf-8?B?YXhQR3RwUk1UY3VRUDNiZXZ2ekRkOEVRenRtc2M4eTh5WjJGblFvZHF6ZGY0?=
 =?utf-8?B?cyt2QjVqOGpJblRNMTdZUFpsUUFINktwaWRVS2VvT1l2V1lDM3dtSDY1cmdM?=
 =?utf-8?B?OHhNYmg4blBJT1NWYWR3VU5yMXBVdVNJWDFRSjBUT3k0Y0IvMlB1NE9mL2pM?=
 =?utf-8?B?d0FLZ09EbFBrQ0R2MUtyN21mM3JsbDNEOVFLK3oxdUtZT3I4V2dJODNBdllZ?=
 =?utf-8?B?R1crZmRZQ21KdTNRdmNCa0I1Tm1WRFpHdUN6S1AwbldLZVhBVUlGVEdiNldK?=
 =?utf-8?B?SEdBK05WQ2toOFNzMGVYNnVGRHFHOEJ5bG5nOE1sT3NQcDJhY3RwYzVvY09X?=
 =?utf-8?B?VXRzSVpaSlFydW9aRjRyVHJMcFA3WnVXejFLQ1YrZW5tMXViaCtZSDBlRnQw?=
 =?utf-8?B?RUJDZ2tLUFJzN1ZrUkdEcUI2WlMvTi9lc2NWd2dHbElPeGlQbmIzVTNSbDFF?=
 =?utf-8?B?YkI3dHdjdkdjVUswY2ErbEhEZ0d2YUduNVlMZGNtN3JzbVpqOXJDMjRoUnlr?=
 =?utf-8?B?ckx3R2llL1NaMnF0cEFZVm5LcGNSTkd0WUVFQnhEUTJZZjNZZlAveDBoaWND?=
 =?utf-8?B?VG14a3Z1QnRtTTZabTFLZzMxcE5YbjlXTnhWRVdGYnBOYTJkSXlsN0NHUDJE?=
 =?utf-8?B?UC9sOVhjWllOaWo5aHFYUUFrQ3RjZ1FjTWRwd2lPMFA0eWV3cTdBbk90V05o?=
 =?utf-8?B?RzZpemh5Ny90UFJPNkdNRzY5UTJYSUlHaktPYW9WcjMzUTdJbE9lUkJGbXlN?=
 =?utf-8?B?TXoxc2RuZU1STkJ5UHZiWmFWbXZvazlvbWFrYi9pVlpIMHd6UUE2UzYveGxo?=
 =?utf-8?B?RGsvcXovaU5LN3lrd1hNMXpmNG5tYUp0YmJBTUdIalFzRVd3Lyt1WHNOWE94?=
 =?utf-8?B?a3I2WEFYM0dOdlh0VCtZejBSQzdRT3RaVFVObGJhUkx3eUxEbDl6dTFkbnkz?=
 =?utf-8?B?bGZaZXY2cUZoQWhzVTRsREwxK0J5R2JTY2xvdnREbjNrMUtJaTFrU3hVZm5z?=
 =?utf-8?B?L1NQYTU0TUMxSTJvUi9GYTlYcWxZVmhqanl4bzArd2p1QUpXV1BNZ0NqYnRa?=
 =?utf-8?B?NFF2VCtwc3p1WlhKV1o5aEppakJxNEJnanJJRk5IZzJCV2FsTWJ4TmRVd1Nr?=
 =?utf-8?B?OFptaEVoMWxoMmN5bitGRjN6S3hRUHphdWg3NWdqQXhOOFo4WEM0dHJNWGU4?=
 =?utf-8?B?aFIwTnFWanZvVW5VNjNHcHE1UEcvcjdwOXNiWEFDeVd6VXFPamg2ODhtZnFD?=
 =?utf-8?B?eGJaS2I5T0VVVU1ab2VtVURlbkJsT0s0YkU4M2hMZnYzcGEzbzg4RWdhK2t5?=
 =?utf-8?B?RG4wb1FYbWZkWGZZL24vejJVWHRSbVVaV3BhUnc0cG1ycDdCQ255OC9qcDdX?=
 =?utf-8?B?K0JZcEdWQ0pJU3BwU0tEWVVXRDBVQmRSVDhON09jSk5CMDFlUG5zWWRNelQ2?=
 =?utf-8?B?NUdWMVo2Qmpnc0FNa2o0Y0xKUmo5TTlYZ3podTBJanNUYUt6bXdJSm1vVm9M?=
 =?utf-8?B?amJNbTk5R2dSTG5HVkRSL0pTWVQ0Ymc5TjdoMUp3UHpINFd4YWN2NHppRjVv?=
 =?utf-8?B?QzJMbXE4NlNSU2ZlOEhGS0FzakF1TGdodVgwdldFUGJyVWViMWJTSXBXbTJS?=
 =?utf-8?B?UjlXSXBRWFowWU0yalJrbG1OeTNiRjdOMXM5K01FUlE3WU56cnJLMmpPRnhU?=
 =?utf-8?B?QWlFWUZ2TmpqOTNXRzc3Nk11U29UbDFyWi9lNHZhY1pHM2V0ZUx1WVBPN3di?=
 =?utf-8?B?Y0x1Slp1VTl0aDE1S3hVTzVraFNUeTZVSGE5MEIrKzFHcEtKTkZqNDUxZmxY?=
 =?utf-8?B?dE9QLzlFZDZkY2V6ek1oTGU3dFBab3RWZFJySFhZR1BKUkNDMHZlTmJSMWkz?=
 =?utf-8?B?VWZsd3orQ0pORFJnK0hwbHNYdGFWRG8xeDZYN0EwQUxHc1ZBT3c4V2wrbDUx?=
 =?utf-8?B?SGxSRjM4M2hQeDl2b21BblpPYTVTS0tpSTVsMFcxTUI3am4vYlNUSWRpNkRK?=
 =?utf-8?B?aWdsSHE2YVBBd1ZVNWh5eEZKZTcrRWtUc2YzRXFVZE0ydVNJeE1Mdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e36dbf1-1223-4534-9522-08de5aae3e50
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:35:55.1106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObpTuTnk3Wuo8Ki34e/x0tZGY/Ws9BCAvVSjKfiWd2bOjEEnzaH6rSbUr1HKHKYG71SAbRrkaVvZ5uPoMAZY1Cqi8P+97GMyzAq5teWo3PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5274
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,amd.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.938];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E264C79B2E
X-Rspamd-Action: no action

On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
> Not a functional change now that cross-vendor guests are not launchable.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/msr.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index ad75a2e108..c9cc4f0692 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -169,9 +169,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>          break;
>  
>      case MSR_IA32_PLATFORM_ID:
> -        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
> -             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
> +        if ( cp->x86_vendor != X86_VENDOR_INTEL )
>              goto gp_fault;
> +
>          rdmsrl(MSR_IA32_PLATFORM_ID, *val);
>          break;
>  
> @@ -190,8 +190,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>           * the guest.
>           */
>          if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
> -             !(boot_cpu_data.x86_vendor &
> -               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
>               rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
>              goto gp_fault;
>          break;

Hmm.  Thinking about it, this would probably be cleaner to get rid of
the cp->x86_vendor field entirely, and retain the boot_cpu_data side.

Additionally, this would fix a minor problem I'm having cleaning up the
CPUID code for XSAVE fixes, and provide better cache locality.

~Andrew

