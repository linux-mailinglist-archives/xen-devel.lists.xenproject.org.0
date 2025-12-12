Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05195CB9F5E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 23:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185963.1507895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBmg-0001JD-W4; Fri, 12 Dec 2025 22:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185963.1507895; Fri, 12 Dec 2025 22:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBmg-0001Hi-T5; Fri, 12 Dec 2025 22:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1185963;
 Fri, 12 Dec 2025 22:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRu3=6S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vUBmf-0001Hc-GR
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 22:38:45 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fd7e4ce-d7ab-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 23:38:43 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW5PR03MB6959.namprd03.prod.outlook.com (2603:10b6:303:1aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 22:38:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 22:38:39 +0000
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
X-Inumbo-ID: 4fd7e4ce-d7ab-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ju9yW6IKlmtkTJggnwIaRgD3LAVBiXBcHhG6RDftfL+eSLdzqog66Ov8xFTlbXyCfQjI6taOPYySF8HKmaXqmN5gfpGV78O6l1g8fqsI8L4+wIi2i2xrcxBtU5t8oY8NJhHtciJRvViMBVZM8sMcdrLswfsyaNLc+YwyyRb6IrgnnKWv8W4vmep5aDNAM/X/HF+VYVZ1DfJrobUJIl+NUqbUtDUndBkeWBpBrYlYvmmu15NuQ4+zAIGcpu5AreqcHtXRghEj15GWoGx0urPJM/yWB1I4L5XbdVUAFt7ZG6lfrW9HejAaa1SxuRU+mTUgOd3eVBGoX9bHh/z40t+Wrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKxoDeCLIIv4KuqdgwkOoCM77j3A0fZ5TNsr5D/DBAs=;
 b=jFih39WwRcPgp3FIaaMFGmkneQZan/U1LeGYEQXx4CDHp2XyqydBwb21BcvEjGcbp50V89jaYMVlBCSJ2s3sT6qh4owp1iA/cyeIR6fPQ4tNNon0V/Cc10Nzure6+DrrBL5Y8fy423k1p9XNUJAHkOPzJJHTT8leWRnjQ+37nPiZkTYOaNG6KeN4jBb8t/FpX9hkF7eykgzmGdZMkU/KUi1XVi1e5JBE0P+m9NuSakct/5wWF4QgxSjhj7s4tIDWOslDZLCuiVYW2G3UYhCebjdrJB4YdsNj/VW5ZdK8GmQKkpHcUC2fGsXVjPArGseWboLn2z1ctwIfJRWdJkoDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKxoDeCLIIv4KuqdgwkOoCM77j3A0fZ5TNsr5D/DBAs=;
 b=GInbYEhVJdOFgJqzWN6QQclpqXvC5rAdiMtgTCML0x5+I2vVvU7tEuw5Nx0LWZXFb9CzIcz79OAh1td6dvhbMDc3bgZZgA5MJdES4ouisL5r3pFZI1HwrN7jgz7zxnLwi5l3pWjnbtdUkT7u1ODBqAg1oEmlrBAtR0VHEvRmHJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4c548455-ea55-430d-9fe7-6a6cf21eec38@citrix.com>
Date: Fri, 12 Dec 2025 22:38:36 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 "krystian.hebel@3mdeb.com" <krystian.hebel@3mdeb.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 Ross Philipson <ross.philipson@oracle.com>
Subject: Re: [PATCH] xen/x86: Pass TPM ACPI table to PVH dom0
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20251212222949.626539-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251212222949.626539-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0174.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW5PR03MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d35991-bc18-4043-b0b9-08de39cf3211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFl4N2kwWEV4YnRkYy94dTcxS1hkTkRKdFNsbjdkU05UUUhTVDYwRStJRksw?=
 =?utf-8?B?d3IzaUdXM01sVDdZNnI5SHp0MEtsM1lTZkxBK1RpNjV6MlVlUmJidnNNVlFy?=
 =?utf-8?B?aklCSFYzQi8rUDRkUDFaMzNPeFo2Y2JINWJOWnV1ZjRueEpjemRnNmhLaVFB?=
 =?utf-8?B?Z1l3QTB4djdJWnVjNE5oTGI1Z0xtK1VTUDhISFpHYSs5Z3JseTNma2pLQkJZ?=
 =?utf-8?B?bnovS2dDZ29IMm5Fai9WdzgrVHJCdjgyYmZVZmV3SENxTGhDc0U3ek40WGN1?=
 =?utf-8?B?ajQyd29tZDBmNnVFZ0RydU1PaTJLM1NBYjd5VlhVNkx1Y2E5dzhxNXJyMGE5?=
 =?utf-8?B?U2JkSXRkclp0L0FYbTYrT25EdnV6SjZzZTNLR2NMWUgycVViZHB1b0NRZkl4?=
 =?utf-8?B?dTk2UTBWZUxwZVNsM0kzbTNiaU82b3hzdVZ5V1VuakZTSVhhM2hLSWVkYVp3?=
 =?utf-8?B?TTJPRTIwT0txNGdOVGJhanYvUkw1VFl4V3VJTk4yTlRPVldrV1dwcU5hdVVZ?=
 =?utf-8?B?UHhaZkhrRGQ4emVpMjRUS2JFNTROUlNUNmNDckg5dHVvQ0RnT2JCRmVGQzhR?=
 =?utf-8?B?eC96Nng5Z0hybGJTb2g1Rjd4aUw4ZW4xQzBaY01QK2FITHVDM3ZCcUdJS3FS?=
 =?utf-8?B?QjVkbHVsYUVNcU8ydE5yTEExdmswZ05yeUlCQ2lmRXQraldQRnZKTnJZTlN4?=
 =?utf-8?B?ZDRkeFhyeUIweDhYVVVqT29nUkVlazNBdmgxaTlIWTJadVIrY3duWW0xYlpv?=
 =?utf-8?B?ZDJwY3Q1eDhqTGVGeE5JSDVCUFNOS25Db1FaN0hGcFpKMjd6R3Vxejl0M24r?=
 =?utf-8?B?bXl3QTd3aW9Nb3VRaExONisxZjVwN3ZJOVZISHRxOG1nd201b1JCVjdnOXVs?=
 =?utf-8?B?Zml4L1R2QktYckZ6VThzeWFDMFUzZVl1UFplSU5oQi9jU0tWUEE5R25hZTY1?=
 =?utf-8?B?d2VJaE1kVHIyeDVxRm1FemVxUk9nYU9tbmR0dnYrQlZrNThHbXZrd01lK3I3?=
 =?utf-8?B?ZTFxeWNET2MzaytFQkNadW13bHZQTzNFRlZYYkZWWG90dENudkQ1aHhzZXRF?=
 =?utf-8?B?RFZxSDVZV3VYK2haRFpJNmlGSzhLdE5sNWNzbkRQK1lNWndPLy8vYVo0anZ2?=
 =?utf-8?B?dG9QRzZvb0hjakppT1FPMmFRSkE0NnFrREYrUVdPcmZheGNLUUpCbElleUJM?=
 =?utf-8?B?b052dnhjSk1raWIyVlpwMDNxc3lmcUZFQVBkWVFpU1h5UmN3bk5hc2phMzcz?=
 =?utf-8?B?emRqak9INDRvYTVXMStrTU9CODErMEFNSFZJV0V3NXdWYU5yTXRMUUMxM00x?=
 =?utf-8?B?bHhYMUZmV1ZPWGJBbjFaWEhFaURHQks2eWZWSER3bnJmNWdtWGIzVm0xU1hU?=
 =?utf-8?B?aHRLWnMrSXY0M1BXY29qakxtWURyTllZTkRXZlA0aC8xblM5aGd0eE5mK0Mx?=
 =?utf-8?B?OHNYZFIxNnhQbTRGdEk5ZnEzQ3ZDSnF1cnlBY0x6U1A4OHVvR3FhM0x3cy9G?=
 =?utf-8?B?N1hyUXE5M1FlenhsSXgrUnYrMzBlWGFPVXNZL205SkxVTnAwNytXYnVxNVpo?=
 =?utf-8?B?aFhWUWxqa1lWZnVrUHUzN01PMkFtMStUNGM2TmtzUUN3b3ZpMXA2dTJnUmF3?=
 =?utf-8?B?RkVTQ0pydEF3UElBUEF4bzV2UW9JTGhkM2FGSURSSWVneEZlSVIyanhUY292?=
 =?utf-8?B?NW8zYjhGUkduSDRxVzFmMm5iaitjYndtaXlDa2YvRGVkejdXU2tNQnkyaTdk?=
 =?utf-8?B?aFJhdnpOOHErVmFYUXYxMjhTNkVaNXZFdytSRjl5M0s2MTExYkVKVXNJNHBD?=
 =?utf-8?B?d29UMDNPekk3ay90UFB0ekppUWpuWjA5UDNpeGpzOEduellkUFhjU1VqeXRE?=
 =?utf-8?B?MjM2aE00bUNWMjJ0b1NGYlNMbUxpOFlzMUQ1YzZObUJDUlZ4S3hZVWFGZEk5?=
 =?utf-8?Q?mXpJIaBbLv8gYcAJstJowyYa+LgXK42w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU1KNXVJVFVGVFhlK09sc0hnQ0NSRW1NUHVGQTBPbDM0TnJQUmFsc3FzN0p3?=
 =?utf-8?B?ZVkvMEhNVUZoMHdvdE1HWHhibGtOeU1qbEZLVC9OaEt1eFFmTDZ2WHNvZkVN?=
 =?utf-8?B?TEdiNHMvalk0d0hydkhBeExWTWoxR3QzQjAzK3Bja0ZoQUZDRUlFYlN2OElN?=
 =?utf-8?B?Z0IyQlViRk9hT3VBbUNlMFBqcUIraHVVVXlIN2JzL1RhWTVTbGRZMWRIcm5H?=
 =?utf-8?B?YjFXTlM1bk1VNWZpOGpZZVFmeGpvbjF2Rld4dTVMcU9WUGREYlcrYkFRTURJ?=
 =?utf-8?B?NjQvbXNGbEJHWVMyTTFla2t5YVo4cFdYVU1yeWthandMNTBuYkZDWXBsRmZy?=
 =?utf-8?B?eVZsNlhIclRMaGpWV1QybnVabE5leG1qa201bHVEYXJxcTR1ZElaQXAzenRD?=
 =?utf-8?B?bnNtSlIyR21la3VXdVp3UVZlT1pwNmV3dkV5ZE5kSW56Z2YvVzh2eTFOcWp0?=
 =?utf-8?B?dlNRR0xvS3VyMFZBVmttK2lncEtyMlhuMTBvUXhEQVIwMGc4d3J0MjcweUhr?=
 =?utf-8?B?UW82UlBJSXhDVUpWK0ZLVzRzaW95b2V6RVpPaXFnR0ZPeE9pb1BWN205Wndv?=
 =?utf-8?B?ME1HS3l2cEVaM0I0VmE5M014NHFFUWc3RnVCR3B3L2tZV0xsOW1tMmRQRUpH?=
 =?utf-8?B?b3RldW9LaUovZk4rdnJYNGkrZEI5M1NxY2VuYkpTWUJBcUJUMDA2ZGxGNXJY?=
 =?utf-8?B?Q2p5T0ZTVS9ZTE8rc1VXVm1pTHhaeUtBejUwT2wxWm94b0duWTk4Y2R4Tzgr?=
 =?utf-8?B?NDMxSHNlWFZFWFo1b2F2VG00WTk2Nlhwa2t2NFo5bUhWdGR5MjJsUEh3MkE0?=
 =?utf-8?B?MzJBRTJoZ0JGODk0b3VnVFNSVjhTcEJzQThrOGZ4WlVWRStmMmNIcVBDaHJi?=
 =?utf-8?B?czU3bnFFSkZNRFBrSlp5SWN3TG5UZVB2Vm9zak9ZZGxsTEVLYkJlMzhQcGZq?=
 =?utf-8?B?NTByS3RWcjJmWThsZDNZZXNOd2labE8wenBBd1c5ZlU4VGZGRmpyRTRvQ09W?=
 =?utf-8?B?UHlsNko4WllHRU5PaTRETjhjN0kxa0VuMDhiYmFPYkJWYXA5UXFsUGgrMUpo?=
 =?utf-8?B?aDhKSWdteHV4djYxWmdHQ1lFSngwYXNlZjJFb1VNN0Y2RCs0eUNsc3I5SmpR?=
 =?utf-8?B?YndDdjdKMmZhRk5VUkRKRWY5Y3dBditJdFp1RFBaaitKejdmU0lZN0RnNXQw?=
 =?utf-8?B?UGZCczNnbDBaM2V3YnVSVTRpU2tLS2lGQktRWFVLL3FHL3A2enNFNHplSXhy?=
 =?utf-8?B?NFFSV2Q5WTFGL3FMNlBKSHNNYjVvZDZObG9DRkpRenhNVG1LR2ZMZzVGU2Ju?=
 =?utf-8?B?cFJ1UVVuRFh5VE1hODF6aisxL1lZOXRHODViMkVvQ3VieGRvZzNTUHpSZFd3?=
 =?utf-8?B?TnNlNUFpZlY1ck5YelB0VTZ5RGs4Ty9QS1JOR1dZdURna3BZcXRORVR5a25y?=
 =?utf-8?B?ZVBxS0xsZXhDa1VGSk1KbFM1S3JCRlpQTUVMbWpyMTRpaEhldVFDWjNyMDN6?=
 =?utf-8?B?TFQ5WTgyV0N4a0NMc3QraDQrZk5DMWRHZ09qVzlxanM3TWIyOTJxZXk2b2ZN?=
 =?utf-8?B?Rk84cVVuR2xsN3pmQWNrZnBLSi9Jck8wNCtURkJETFpkVWdOTEJ3eTJDbGZo?=
 =?utf-8?B?K1J0WG1jWUNyUVk3ZWk0cnNnZG5kRzBHM3J2SW9DOTFWc3Jad1pzTWhzUnJR?=
 =?utf-8?B?MGJpQzBSQkxqMVllTnhBV09KMmQvbG9TV0NmQmI4M3lTajcraFdSdCtoSklO?=
 =?utf-8?B?UkkxcXlsUkpKQTBSdmFOTmxUdnEwSVV2UVFtT2NMM0ZMbzVIaTg4ejhxMEVM?=
 =?utf-8?B?aW9iRzZNNEhlb0pLeXp5emw1SjFJZzd1SmNLK1J0UDYxMlNneUx1QUlkRTBv?=
 =?utf-8?B?WnMyZExBd3ZiVnNUOTVGUmdDZ0gyV29KdVBNTnpOS2YrUXRJZ1RjN2pIMlF6?=
 =?utf-8?B?ek9TM3J2TnVaNmVvZFloNzE4SEl6bCtvdHh6SzJkdUVKTjBORUZYVkZRME40?=
 =?utf-8?B?RFp5OWM4TFIzOWFZalpOMEVtZkU3M3ZBMTNiK1hiVmtnUk03d01RZGpSOC9W?=
 =?utf-8?B?M25zdkpXSmZVN0lwZUtUd3VzTklybzRlcGg1VkdqNHFsZXJ2SW1mTlpYdElW?=
 =?utf-8?B?Y0tScE9CYmxkUGdzQ1RRU2lWd1MzQjFmOFFYRmpKc09teWp0bzQrS1pRTy9l?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d35991-bc18-4043-b0b9-08de39cf3211
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 22:38:39.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytXAjoEgOq80ida7IwqYz1037Qs14rNt+rX7oqwYdgmbCwAxr2dyBB4HmTFBOznkA2InOj2P51nGaXJnTR2vgB+DS09rTAYhGxKcEzm+6Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6959

On 12/12/2025 10:29 pm, Jason Andryuk wrote:
> Pass the TPM2 ACPI table so that the device can be found by a PVH dom0.
>
> Otherwise dom0 shows:
> tpm_tis MSFT0101:00: [Firmware Bug]: failed to get TPM2 ACPI table
> tpm_tis MSFT0101:00: probe with driver tpm_tis failed with error -22
>
> TCPA is "Trusted Computing Platform Alliance table", but it is really
> the table for a TPM 1.2.  Use that as the comment as it's more
> identifiable for readers.
>
> While doing this, move ACPI_SIG_WPBT to alpabetize the entries.

It's probably worth stating that this brings PVH dom0 more in line with
PV dom0.

> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Only TPM2 has been tested.
>
> AIUI, a TPM 1.2 is probed without the ACPI entry, so it is usable.
> But since I know the table exists, I added it.

Yeah - I'd have asked you to do this if you hadn't already.

That said, it highlights that the Trenchboot series needs to grow the
ability to hide the TPM from dom0, both the APCI tables and blind probing.

I presume that tboot already does this, because I'm sure it's been
tested, right...?

~Andrew

