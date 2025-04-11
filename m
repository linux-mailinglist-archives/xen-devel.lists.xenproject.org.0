Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF6A858D9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 12:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946964.1344682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3BGK-00068H-2a; Fri, 11 Apr 2025 10:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946964.1344682; Fri, 11 Apr 2025 10:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3BGJ-00066h-Vd; Fri, 11 Apr 2025 10:05:27 +0000
Received: by outflank-mailman (input) for mailman id 946964;
 Fri, 11 Apr 2025 10:05:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klsp=W5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u3BGI-00066b-Gl
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 10:05:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2412::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a22d0b1-16bc-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 12:04:55 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS7PR12MB8252.namprd12.prod.outlook.com (2603:10b6:8:ee::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.27; Fri, 11 Apr 2025 10:04:50 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8632.017; Fri, 11 Apr 2025
 10:04:50 +0000
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
X-Inumbo-ID: 6a22d0b1-16bc-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNowPxF+X5c4k4TV5grWVuX/OHJB6c17ZWChbB4L1gB31hQmUt1QW4alBOISFkDXzvBOdOuweZLoOn7rnIpTJstiOqkZVf7U9Qub+ovof9gL+pSziKx51jZWgNVQnO7ZVx/GCQI86uHnuQ0rmqkHXx8QxQ4quoajhrdxsx2WIzWzi6mHb47skw7voyTJWtl+pmzG+iJFtJqOQVWcdTIBBnbFObzSJgJJvOYcCLEEu24Prbw/oyDh/F2V9kVKTm/mVp6xAfRvGlM0ugFJID1O0HIi++Oi7xs6slb9y3cKrPD8XDZWn1oM2gP/F7Y7Fz/ZilImsmeTp9tlRo0GG7H1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAqcSLz06MGe2uOrKOD+3yOrwRrJfGjprtp3zqZLXM8=;
 b=uysUvWPXTIgrS55UOt8CorjmpXMQn+Pk6BXyCM9RNSqSDxHI6XzCYC42FAiSw8YCv7C7VPSssAYBCV+2D/DpiOsZkmCLUSRCkj5m7oG/S+MntoHY59P2MIl/hOA8YL3kavSTpifcHPEC9l9QIiwzAYMMnOZzQJ0+DKZ7Okb73auW7HWkL9bHapYjf6cLIEkLD49zV9Q4Bp0oOJbg+HqYWJgtwVpGJpEt6jHk11N3fy0Oq1Tl3K5EoWtM7tMOHa96NMZyAUXdX7/5xmIGTgGb9r96MjgZMLtDWltfy8cUb/+FgaDpqnv/QKEpd+5BTAgnV6YRPyBzzjFMnouk2ViBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAqcSLz06MGe2uOrKOD+3yOrwRrJfGjprtp3zqZLXM8=;
 b=bJTfGat1CNfsbC3WP4FdSEe0is9+LdUOuBDz6/K9TS7r6aw77OVLhW0Iyse8kDwoYxIec5h/E4DpSsrfqjgpwVlaI/oV5+GV2X/MOPsmJJ4dzQbAMOIofkfbnER/XQ2MkgUwt4r3OqGOoKUdURg8a/vsOkX09acsaGDjh5Fcjek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <61761ce8-7894-4f19-a7b6-3ee8c98516e8@amd.com>
Date: Fri, 11 Apr 2025 11:04:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
 <20250407184443.1790995-4-ayan.kumar.halder@amd.com>
 <e574f645-0c8d-440d-9f8f-7193d27a9d00@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e574f645-0c8d-440d-9f8f-7193d27a9d00@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS7PR12MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f38dcfa-0453-488a-bb1f-08dd78e04c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGJuSGtPblp6STJQQ21USW5id1drQ2ZhQVFlN0RqL2JMQjR4OUYwcjNlTjQ5?=
 =?utf-8?B?Y3ZjSzN6bFVjWVNsRnVycFEvQjlIazkxWFpUOWJuTE96NEZHMThKNm1ZbUlu?=
 =?utf-8?B?VXR2SmRPWkZVOGovMVlxYjJZQzExU0Q0ZDl3N0FhUU4yZ1hLQVFUa0N1WnQr?=
 =?utf-8?B?Z0MrMjJTckZWWHM1akp2M205cDYrdjE1TiswNUNLWjJNaUxCMzdnbXJaNVFJ?=
 =?utf-8?B?NGRSUmxvUFhTTHlXMStlNDlIWEk0eDdaeFFTdlFJNTNYMGdXSjJZcFpNTFhv?=
 =?utf-8?B?cDJ3bithN0VMWUtUdFdDcVk1VUp5SWxIRXhPU0VDZmE4dVErMlZFWE12UnNP?=
 =?utf-8?B?cjJSMmYxeTRkSVVUYTNDWEJYV0t0ZzFzWTlORTJUUkx3T2U2WVYzSjZuQzZB?=
 =?utf-8?B?RFVjdXpYN01lK2NxeTh4VmdDSDhLQkxnaGQ0RDBUL0lPNUE1a2pRTFN6VmJR?=
 =?utf-8?B?VDcxSmVwUnU4THJJOURSaU5oOXNHbGd0dzBiQmtjeHBWOW1KeXBKQ0czNEVB?=
 =?utf-8?B?V3JEK1VWc1ZLSjRuc2g2TVZKakVFbzFDeTBmV1hXOVhGQmJNU1FNTTh3dHN5?=
 =?utf-8?B?WWtLTWNRSnJFd1Z5eUlmcEFENEY0Q3VxVWJzL2Nvek9qTnptampnaVlDbkIw?=
 =?utf-8?B?QzFFMG9UOTVpaXZSTzRqRG80TUw1SGdsTHgyZVRiZlh6TkZ1MEVJL3NTTFRN?=
 =?utf-8?B?QXdnK1NpaFFVOUMwdjhGNkNLM1c1OVBkcHJyTmVxeVAyMEUzNVNmMS83aC9S?=
 =?utf-8?B?QXBXNUpQaWJVeWdPdGJaQ0V6ZnRuVE5KTDd0aXJtM0VrUG01Mys2bzBSbEZL?=
 =?utf-8?B?N1RqczM0UDJsL0RXS2QwY0N3UUw2UXRSZldTTWpveUlSS3hFNGFSQ0RPd3o3?=
 =?utf-8?B?WlhvNEJuek93SHpmaTNoS2lpTlJsZTNTaW1OVTE0Wnp4eWQ4M0JjRUxkcmpi?=
 =?utf-8?B?QWt2U1JQR1hCeklaZDlvaHYyZHc5VUFZVnNMdG1EQXpjc1psMDExU25CMWRu?=
 =?utf-8?B?NUNYYjM4Q0JmK2l1T212dTZKTkxZUGJ5bGFVVTJueDJ4cURYYnpHSGNSRDkz?=
 =?utf-8?B?NUlhclI5THRpak5ZV2kyNzBiK2VUbWlQbkFKdkpncmp6Yi8yaGRMaUoyQ2to?=
 =?utf-8?B?MTFpWXltMGZXSm5lWVdxV3E5T2JvS3dZYVdkUTd3cDRGVmxidE01WjRZS0pV?=
 =?utf-8?B?cWlUUnl3ZkZkZHZNZkpSbGNNVldhWmJ6OWpjS2wzbS9mM0gxR3IrN2w4V2ph?=
 =?utf-8?B?WlI3UC8xblFTU3NVNjg5VzgzbHVVckdpdjQySUdsMkNvWFBuZUZnSGJ5cGR0?=
 =?utf-8?B?UkYveFFoOExsV2twNmdwSURyM0RJNnQ5U1A0Vkt6N0xNMmM5TE9ZUHpGL3Jh?=
 =?utf-8?B?a0hpWEhjM0poWWgwMm0wZ011cTdlNXB3a3FlRnN0RlY5U3QvYWhPVGR1RzhI?=
 =?utf-8?B?eURGT0NCUEJXY3ZqbE1iaHhVV2kyMUNubVlqTlJralcrRUMxNjFaNkN4eHp2?=
 =?utf-8?B?M0I0Z3U5R1M2UllpNXFWQm1sdm80OVk1NVRYT2M0YjBxbVVwU2NsamFlQ21E?=
 =?utf-8?B?UlozOEQ5UDRBZWw1bW4rQjJHcDBCdVlyWEM0cSt6dWo5Yjh0VUVtaWJtdlhU?=
 =?utf-8?B?YkE0Yi85eGxiOGt5MDY4SHlSUWhHWTcvZkJoTlhOeG13SDRFeXl1S3kraVdo?=
 =?utf-8?B?Vy9UbGNZYUoxTklGb0dYLzcxUlBJcTFyTzdZSDBGcWRDZVlnNTdFNVFWSlZ5?=
 =?utf-8?B?ZWVvNDc0QkxXNVVqbnN4dGF6ZGhPWEFETkhWRTVjKzF5OEFtNUZiekxRMVNY?=
 =?utf-8?B?M2NjVGIwSlVsejVybFpkNjIxSk5ZcjZQMVpjc2JWSkNTUXp5V3pHLzV1c1N6?=
 =?utf-8?B?Q3RSWnE3QnR0ZHBJcGJ6Tkk2QTAwL2MzYXkyVDE3ZEJHWGR2QVdrYlY5NHhQ?=
 =?utf-8?Q?SQRtdyIuJN8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHd4aDhqdTdXS2J0SVN0aVVMT29MeSt3VnFnWjJqMTdSVHg3NjdMUjVDSmdB?=
 =?utf-8?B?UkdDQmxJc043aFdLdlBFK3VSUXhlWHlKQlpCUlJpR0VGWTdLS1lrdTAxbEli?=
 =?utf-8?B?bWgvemxpWEEzcWR0dnljR0ZXTE1IMkxod1JuVHU4WGlwT0VhWTFwNHM4NGtE?=
 =?utf-8?B?dXdzKzlyM2RkUml0UXRIdG5ndFhIako3a1ZMcVpWUVAvMGowNm9FUDJsVkRU?=
 =?utf-8?B?Smg3U3B4cXZDSmo0TGU3RWZwMWdaeEFvTVVIZXBrQWdhVWhEam9sNk1MREVu?=
 =?utf-8?B?Y2xmbEY2a0s4Wk5RVzNsd1dVUWt1RFBpR1pzTGZyMFBUOWsyTm5LT2k1eU1P?=
 =?utf-8?B?NzdyTGxlVjNwU0RYVkI1NnF4OS9MM3dXdGJibjVOc3RiRTV4YXBDSTlvZVRi?=
 =?utf-8?B?MWNYSzYwUnI3dHFHcDNEc0RBMmprV0lFTHZYWTcwZHpJRjNDTTQwOTdJSlo2?=
 =?utf-8?B?UithOUEzWllDbTdXdDdlUTVuOW40OVpoYllnSVVsdS9FekNOc2FMVDk0TVlM?=
 =?utf-8?B?MWRCdC9aeU0vYUU5ZGhLSkRjcHZIR05kWGlCZkF4V3JQSitDSDRmb3JvWkpT?=
 =?utf-8?B?MXNkVjVFOUZOcVVWUmVZckEwLzBiT0JxSTd1VGtRaFRHME53WFNSTHV3Nm9W?=
 =?utf-8?B?ZS9EamNiZFJnbDdOTnQxTXJLaVRndEYyYVhxZ2RrU0oyOWRKN2NqNkJYR21T?=
 =?utf-8?B?cVptYzAvVFQ0YVd6bDFtYnZGNnRDUGQ3bG1tUFNycS9qQ2EzOFNoaGpOaUVu?=
 =?utf-8?B?VGlUcGNxWm04d1BLMWJLck5Wejg1YlVjUkgxU29vMkUxbURWSk4vTGgwN05m?=
 =?utf-8?B?K3FlcGJXM0NsN0Zha1EwYThmaCt1MEJQbXo4TjA4eHhsTTlBV0lVaWJyeDAx?=
 =?utf-8?B?aXh2c21BSFFGYVBIT3JwTHJhRE4rUWtXL1JQYlJCL3pMWWJ2N3p0WTRSazE4?=
 =?utf-8?B?RnlYTzdubTRLMUQ1bWdQUGt4Y09WN2RTQjZFZW80VENuWURTeS9jdzQ5YUZ4?=
 =?utf-8?B?aTd6MFIrR0RzaS90V1pETlp0WjhjcVRwTTZUVXpJK0ZhVkdWNXYyZFMxTHht?=
 =?utf-8?B?NmxDZ2RNeHVRcTBoTlJkSGdmZEhTODNIbE41L0VRaDlDb2NkelRXQXdxd3Jt?=
 =?utf-8?B?cUtzZ2pwbnFHLzNpQkJpazBUUGxjS0JFTnZJMFdrQ2lwSlZscEdTSGRBYkQ0?=
 =?utf-8?B?dTFsbjFOanRBcEJLQ0E0RHJiQkMrcmZkdUFFWnNGdzd3Qi9RNWJ1ZXlDeDdh?=
 =?utf-8?B?R3huZjB2R1lYQ3J2cnNBWjQ2WnJTRlFzN0tYOGcwSTdPWHVpQm9vUm5nR3VY?=
 =?utf-8?B?ZVhtYnI0OWE0bm56M1FKdnpyL2liNFI2UHF4OEhoMUpINnRZZjBjejU2Skhj?=
 =?utf-8?B?MEVNOFQwS25ZVmZlNzJGMWljWEhwOEJZdkVCbWlndmtOTndFZDNEeG5HSVZs?=
 =?utf-8?B?enZ6UGhrdGxFN1BDZ2tjUWdvR1FjQ0lHZXZ0L1JLR3NOdlkvTDBnU29QSG02?=
 =?utf-8?B?VnJJUUc5UTVrQmxkS3Fmb3pPVkFaaG1aOVJRQTZNdHBNWmZZOEtpZXR5RDVM?=
 =?utf-8?B?eVhBTHo5ZXVKQWc4UFlvRXMvL2tmMkRZSnhHRmY0TmU4SS9GRGltQnIzeTRC?=
 =?utf-8?B?cU9GSmNzci91U3dwM2tXSXY0OVplVUlwQXVTMCthYVZWU1Y3Q3g5VzNlbnE5?=
 =?utf-8?B?eUJ1SUF5cHN4bkNQdWRsNFhDQnRVUjl0WUlEMHVBU0gvUlBoWHBJUjEzMXZi?=
 =?utf-8?B?SFBGUFBXWWJXWXZJMndpenYzZFR0QVZsYXhHT2dNKzhSUDdnSlBnWWpIK0kr?=
 =?utf-8?B?dm1hd0xEZUpabUpHSVE3V0dMdCtxN216QW8wVEFvdmRqNnkvancrelVia0Vm?=
 =?utf-8?B?S2U4YnVQTmJBVlo0V3dFQnRQMVJMRkVXOUsyYUZENDhNb0I3NFRWUDFiOExh?=
 =?utf-8?B?bVY5czdHRWRCWmVJa0tKWjVIVXhlUnVWQk9OQ3ZwV3NHaHVkeEtZMlVrVk1Z?=
 =?utf-8?B?alFqSXRxZTVyVlNHQkgyYXlTMW9YWXR0dSs2dHh2TWdVRCtLVTN2ejRUOFhj?=
 =?utf-8?B?eVNQcDNpaWREZHlDWnpNNUlETm9CcmFlVU9jL0M5UytBKzZtZitJdjA4UW1P?=
 =?utf-8?Q?BMKnInmV3fnjBStPyXY29QIGX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f38dcfa-0453-488a-bb1f-08dd78e04c18
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 10:04:50.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpiDWd6NscOp7qxBSjO66jj/iwjrrhbI4ZJxSq0RGqEgWPK2ejXLm4jFT+3ojYP88Ef7zDmyA1t5nqoOaX7y8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8252

Hi,

On 08/04/2025 10:54, Orzel, Michal wrote:
>
> On 07/04/2025 20:44, Ayan Kumar Halder wrote:
>> Add stubs to enable compilation
> NIT: missing dot at the end of sentence.
>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1, v2 -
>> 1. New patch introduced in v3.
>> 2. Should be applied on top of
>> https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.2376484-1-luca.fancellu@arm.com/
>>
>> v3 -
>> 1. Add stubs for map_domain_page() and similar functions.
>>
>> 2. 'BUG_ON("unimplemented")' is kept in all the stubs.
>>
>> v4 -
>> 1. is_xen_heap_mfn() macros are defined across mpu/mm.h (ARM32 specific)
>> , mmu/mm.h (ARM32 specific) and asm/mm.h (ARM64 specific)
>>
>> 2. s/(void*)0/NULL
>>
>>   xen/arch/arm/arm32/mpu/Makefile   |  2 ++
>>   xen/arch/arm/arm32/mpu/p2m.c      | 18 ++++++++++++++
>>   xen/arch/arm/arm32/mpu/smpboot.c  | 23 +++++++++++++++++
>>   xen/arch/arm/include/asm/mm.h     |  9 +------
>>   xen/arch/arm/include/asm/mmu/mm.h |  9 +++++++
>>   xen/arch/arm/include/asm/mpu/mm.h |  5 ++++
>>   xen/arch/arm/mpu/Makefile         |  1 +
>>   xen/arch/arm/mpu/domain_page.c    | 41 +++++++++++++++++++++++++++++++
>>   8 files changed, 100 insertions(+), 8 deletions(-)
>>   create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
>>   create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
>>   create mode 100644 xen/arch/arm/mpu/domain_page.c
>>
>> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
>> index 3340058c08..38797f28af 100644
>> --- a/xen/arch/arm/arm32/mpu/Makefile
>> +++ b/xen/arch/arm/arm32/mpu/Makefile
>> @@ -1 +1,3 @@
>>   obj-y += head.o
>> +obj-y += smpboot.o
>> +obj-y += p2m.o
> Sort alphabetically. Always.
>
>> diff --git a/xen/arch/arm/arm32/mpu/p2m.c b/xen/arch/arm/arm32/mpu/p2m.c
>> new file mode 100644
>> index 0000000000..df8de5c7d8
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/mpu/p2m.c
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/init.h>
>> +#include <asm/p2m.h>
>> +
>> +void __init setup_virt_paging(void)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/arm32/mpu/smpboot.c b/xen/arch/arm/arm32/mpu/smpboot.c
>> new file mode 100644
>> index 0000000000..3f3e54294e
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/mpu/smpboot.c
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/mm.h>
>> +
>> +int prepare_secondary_mm(int cpu)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return -EINVAL;
>> +}
>> +
>> +void update_boot_mapping(bool enable)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index fbffaccef4..5b67c0f8bb 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -170,14 +170,7 @@ struct page_info
>>   #define _PGC_need_scrub   _PGC_allocated
>>   #define PGC_need_scrub    PGC_allocated
>>   
>> -#ifdef CONFIG_ARM_32
>> -#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
>> -#define is_xen_heap_mfn(mfn) ({                                 \
>> -    unsigned long mfn_ = mfn_x(mfn);                            \
>> -    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
>> -     mfn_ < mfn_x(directmap_mfn_end));                          \
>> -})
>> -#else
> At first sight, it's not clear why we diverge here and move Arm32 but not Arm64.
> At least I'd expect some reasoning for this change in commit msg.
I added an explaination why the code is moved for Arm32 in my latest patch.
>
>> +#ifdef CONFIG_ARM_64
>>   #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
>>   #define is_xen_heap_mfn(mfn) \
>>       (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
>> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
>> index caba987edc..9b98d12b07 100644
>> --- a/xen/arch/arm/include/asm/mmu/mm.h
>> +++ b/xen/arch/arm/include/asm/mmu/mm.h
>> @@ -21,6 +21,15 @@ extern unsigned long directmap_base_pdx;
>>   
>>   #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>>   
>> +#ifdef CONFIG_ARM_32
> Why another #ifdef if there is one a few lines below in this file (below
> virt_to_maddr)?
Ack. I have moved it.
>
>> +#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
>> +#define is_xen_heap_mfn(mfn) ({                                 \
>> +    unsigned long mfn_ = mfn_x(mfn);                            \
>> +    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
>> +     mfn_ < mfn_x(directmap_mfn_end));                          \
>> +})
>> +#endif
>> +
>>   #define virt_to_maddr(va) ({                                                   \
>>       vaddr_t va_ = (vaddr_t)(va);                                               \
>>       (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
>> index 86f33d9836..bfd840fa5d 100644
>> --- a/xen/arch/arm/include/asm/mpu/mm.h
>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>> @@ -13,6 +13,11 @@ extern struct page_info *frame_table;
>>   
>>   #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
>>   
>> +#ifdef CONFIG_ARM_32
>> +#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
>> +#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
>> +#endif
>> +
>>   /* On MPU systems there is no translation, ma == va. */
>>   static inline void *maddr_to_virt(paddr_t ma)
>>   {
>> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
>> index 21bbc517b5..ff221011d5 100644
>> --- a/xen/arch/arm/mpu/Makefile
>> +++ b/xen/arch/arm/mpu/Makefile
>> @@ -2,3 +2,4 @@ obj-y += mm.o
>>   obj-y += p2m.o
>>   obj-y += setup.init.o
>>   obj-y += vmap.o
>> +obj-$(CONFIG_ARM_32) += domain_page.o
> Again, sort alphabetically.
>
>> diff --git a/xen/arch/arm/mpu/domain_page.c b/xen/arch/arm/mpu/domain_page.c
>> new file mode 100644
>> index 0000000000..8859b24e04
>> --- /dev/null
>> +++ b/xen/arch/arm/mpu/domain_page.c
>> @@ -0,0 +1,41 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> empty line here
>
>> +#include <xen/domain_page.h>
>> +
>> +void *map_domain_page_global(mfn_t mfn)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return NULL;
>> +}
>> +
>> +/* Map a page of domheap memory */
>> +void *map_domain_page(mfn_t mfn)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return NULL;
>> +}
>> +
>> +/* Release a mapping taken with map_domain_page() */
>> +void unmap_domain_page(const void *ptr)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +mfn_t domain_page_map_to_mfn(const void *ptr)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return INVALID_MFN;
>> +}
>> +
>> +void unmap_domain_page_global(const void *va)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
> Additionally, take into account Luca remarks regarding headers.

Thanks Luca for spotting them.

I have addressed all the other comments.

- Ayan

>
> ~Michal
>
>

