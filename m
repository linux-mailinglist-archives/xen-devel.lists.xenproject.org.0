Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FFAD028F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 14:51:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008511.1387792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWXA-0005h5-3X; Fri, 06 Jun 2025 12:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008511.1387792; Fri, 06 Jun 2025 12:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWXA-0005fC-01; Fri, 06 Jun 2025 12:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1008511;
 Fri, 06 Jun 2025 12:50:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=La23=YV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNWX8-0005f6-DR
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 12:50:54 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2417::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e07f615b-42d4-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 14:50:52 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 12:50:49 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Fri, 6 Jun 2025
 12:50:48 +0000
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
X-Inumbo-ID: e07f615b-42d4-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oThYLVF9msLT3G+2ZGnVlvIlbDhd5c2W4f5ua9Z1tDViP/DM344SP0KgAeKy/Y8mj1sv9n/kEFi8HVQAtdYNF95lU9cvXjShi8wIPfp9jvmEn21SwIy9Pr5oqsqVZaoeogFOSsvfaN40uIkldEUVw81M3snCqo9BSPYdBEisE7i4BFV8V67ALOAWd+WJI8E9CI8bmgFOyP3x28iqiQ+ed6J19P2sZvmZFY6FVbpqSki3plGCBVX0t4MRoQf2JpX/RHsU7PcctzkuZKvNVXQmza8RLRTaF1N3SqRIK5cz6Uq++SRnTMoHPlfdEqE3RvwYSqNTra3ZCgiZmAxnMLk4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrekXxE7JMULCUejOBDPfwepwcIwYR0UA/vNmY58Ghk=;
 b=SmBibunbAchAbPpJQaf+oZU2zZEAcGIgofjWCFCF//r9zzMjqjvAB/Dv5OHqtzQvF3eoQcdqfq4oGmVrmW4s2N1sA1nlP/IxXtBgVEQOxEgGokozdn7SJwYJkcef16OWncyAwwSWktab+LSRUhEF/NlraKsgrSFrVKpUhFDIdmZnyIw6H3bPxTCQ0o33loygKAV6dcSxqB0wf5btjBjH1suYgiNSinfOiOuFod8SM/jQY/B64V92Wqbvgja1cE2JdQqMCYcfHIiw3kOFv9TYltQI/0RnH5hE7GchsAHMzAMt1A9BTOZ7gG0YQVvCf1Ujg19iDUP/vENXPdQlfQcbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrekXxE7JMULCUejOBDPfwepwcIwYR0UA/vNmY58Ghk=;
 b=2OToSkrrmzahOtLkRNKAubnWMgaDhn4OPe+OH46YGaS63+8XnHY7YKgezS9gFmkr0FGPeRTZq3bO9ffiAR++h8I3aU99uzTkZ4NNBB05AaC2pV/QyY/fbBgmIAL0ak1mRbytCgfyE1pgRCdl0VMwNNXl16CoamfSGWJ7zdkR+Y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <dc310f57-9263-423d-a26d-839c4b91f0a5@amd.com>
Date: Fri, 6 Jun 2025 13:50:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map structure
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-2-ayan.kumar.halder@amd.com>
 <a2f337f2-1f34-41f1-9728-5f87ef2c7420@amd.com>
 <bb3ce203-de59-41b7-ad7d-3b1f3f1c9833@amd.com>
 <dc8b0afb-aa0a-4ee5-93ef-ca6fa632b616@amd.com>
 <253dc1cc-b6b7-4cdc-a0e1-9fbd6be4efa0@amd.com>
In-Reply-To: <253dc1cc-b6b7-4cdc-a0e1-9fbd6be4efa0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1e347a-2a9a-432e-dc64-08dda4f8c2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUNLVlk2RkpFNmhmM2tGQTM4cGgzb2UybTkxMnI4Y1NsM1NGSUYrdjlaRVVQ?=
 =?utf-8?B?dHBpSGlpMmhjT3RmdVBzYm9oVDRaakNQVisxR0pwTFFTeHZxV1pMQXVFSnpk?=
 =?utf-8?B?RFhJMmlLYTdZOXFNMGxkSzlJRy9iUk5CZDgrMWhNSDR2UnRiWm1jcTRUS1dN?=
 =?utf-8?B?OWgzTi8yN3B0ODhrOGlmcHNlL1VWRHRYK05xSE8vQmlkRjJXbEY2ZnAwYWlD?=
 =?utf-8?B?eVlRemxuN1lJR1lpd0xmSmpZVksza04zRlFMdzJtSVNteUg2ZG54djNROTdw?=
 =?utf-8?B?eWJUaWJYbHJVNVgrbzJ3SFFoRzd4NHIvVEQwY0RmQkt0M3RXc3FLbURub1Rx?=
 =?utf-8?B?dzZ5ayt2Y0plYnVXMEpXME1FK25UNThzUGgzY1FpZ042dXJYUHdsZ256aGxu?=
 =?utf-8?B?Z2N3cXF6bGp4TlE0eW9CWHVIblVuditXeUJVMVpMWjFLQ3FweWF2RXZZZDhU?=
 =?utf-8?B?Z1Y0dEdDWGFDaEw3VGVTcGpwVnhKNE4yMnl6MkhGVUZOZnpKbEFKcWxtdWhJ?=
 =?utf-8?B?UzlLK1A5WE1BTzNNY2RIZHUzS3dQeTl5c3Jrcy9jTm40Y0VGRkdMRXFtVzg2?=
 =?utf-8?B?TXV4cGM0RkxsZUs1RXQ2UVhydEgzeVByWmFmV0VsL1dtVVNOc3VrRkt4Q1hY?=
 =?utf-8?B?N3FYMkprTzJLQkp2dENLa2JxVTVnU2pxN09OYlhVeDB3UnZJa2ZqaDdBeDFE?=
 =?utf-8?B?S2lZU21sUUtadXZyMnZ2bGd5aW50dmhBUzdvOHowMkozN0NVYUJNY3NST1dW?=
 =?utf-8?B?ZDBrQWZTK1NXZVdoR3J4K09SSUdWVzZ6SHUxU0ZCTU5LMmlkYjhDTStVcCt2?=
 =?utf-8?B?dTdLVWMxRkVlNm9lTHVnZlFuMXdmUElTalh4LzBabzlZdG9FQ05Xa1BVSC9h?=
 =?utf-8?B?cEpYNStycnNySlBBMDJnSldoUDZBbTRtZ25nTW5YcWtTMjVpTFJjb1JtY1RK?=
 =?utf-8?B?ZDZrRmVsUG9BZU9IZjRRQ0c0QUMyS2tUcHNEa1hDVWtMKzBQcnBxU3B1SVhm?=
 =?utf-8?B?K2dKVWk5UDBla05oajNwQ0RkR3hyRHpmYlBqbE5qRVdqQ1hNTVhnZjY3Risv?=
 =?utf-8?B?MDA1QWo0ZkFrTlJONVRBVC81RTJrY3BGN0tTaHFEZ292UkFjeEVERzZhZGFG?=
 =?utf-8?B?aDY3MTV5NTJTbHg0REFva0dEc2hsR1prRVhSMWgwTFlFWmR3V0o0bDZ1WnZZ?=
 =?utf-8?B?RmpzemxJdHZydUw2VEd4dk9kZ1I3K0p3bFF6MDY3VEhBQXdBYXlmd2doazk4?=
 =?utf-8?B?MlVOL0tEa1I0TUYveUNWTUdMRDhyV0g5U2VJVFZ0ZmovMWxkZ3FSMGNuTGZI?=
 =?utf-8?B?YTcwNkRQeXQ3SWNkSWJqdlN4NHYzVUZaMnhNUVcvY2o4VFlYYjVBZThNeEoz?=
 =?utf-8?B?Wmx1bTNoVkRwR0tTVVNidGt2RzdwNjcycU1land2Wmg1OXRQdW5QWis0WGtL?=
 =?utf-8?B?dS9oOEJabmhwdXltRG9qT3ZURGsxTmp3aGlkb2M0ZDRFUUZUcHVFbmZnOTR2?=
 =?utf-8?B?aTczTlFzVFNlbVlXRXhRSE01b05QYUZsYWllZllaSUV3YjhqZ0l0YVRWWDJK?=
 =?utf-8?B?d25mSkkyaFd1cUFUb3IxQy96YzUzREJ6WlhST0F2Q0pLVHQ4cTZLSVhOdmpW?=
 =?utf-8?B?NnQwaHNYMys1eUlwK2VNTC9NeXJkbXF4eUxmcW5uNUdaMWN6c2Q5Z3AvRjMr?=
 =?utf-8?B?WjVIbTF6dG5JNFEvMVFNeU0vRHdaZVBwUkRwMTlqVFY0Vk9SQzRHbVFybGlD?=
 =?utf-8?B?N3pqQU9MZnUzOG82RngzbHFrNEhxZ2pUNm03YWRVdmtwbkNCbWJyZGZ2Nm5r?=
 =?utf-8?B?MFo4OVpBUWdTc3Q4WjBzMEM1SlBYUUNmQ2V0MWtxUit3QjZxeS80aDNQTXRx?=
 =?utf-8?B?d3BjaTNPQ2o2VDFsZkwveHlxT25YYjNnTUZJK25xZytqWU5TL0pxNC9nanpy?=
 =?utf-8?Q?+dSxmVS7H5s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anFRMlFwdTErUWYxQU9uY2ZWV09HVUFyaFpIU0xDMnE5Y1AzSjNqdU5ZWUdX?=
 =?utf-8?B?ODFiVVBWZTh3UE80cVEwQVBuVkJ6WXF6UG50NUhoWUdtQUFmWVA3YkwxODBx?=
 =?utf-8?B?TXBWOVNzTGgyMU5FZ1lqWDhNVEFwY2xNUzlIRzRieE9lNCtiL09TVFRLUWU1?=
 =?utf-8?B?aVpudjlmT3NXRnVySEMxemF2TkVwNFBFcFZhWjRvanFMeG1jZW5ld2V1MXU1?=
 =?utf-8?B?TTU3UldoTmVyUnVzb1NVWVpEaFM1OWp2YU85bDAyN3phNWlKbXQ1TG80bldU?=
 =?utf-8?B?Sy95a2ltbGpZNWZ0M2Y0cU5PT3RKNmI0aVV4M1QxSEQxK2lZNktQMEx6a0FM?=
 =?utf-8?B?M1YzT25aMnRVWjV6aVdlcVRGbkJBMEFSdW9tUnl5eHlnOXdlYXhNQ203dWFJ?=
 =?utf-8?B?STZaVmpGN1Erc2RzQzNjN3cvQmRGTHhOcG5lQVlpMGpyMmMwSVhneXhiN1E2?=
 =?utf-8?B?dmE0cnkwekhqWWNKTlNiMFBObG9Wbk1Cc09PenJxUE9jelFSMzM0Q2NxMUJt?=
 =?utf-8?B?WGdYd3JZU29wcDZsMTY2eHN4TFBlM1Zvd3Z4cGFJcmVINkRIOWY2MUpPaVpk?=
 =?utf-8?B?UkZmaVFwSWtER3pTZldNZlRoY1V0bVd3TFJtNm8rMmJvcVVFOWtSaVFWanJN?=
 =?utf-8?B?Vy9nUjQvT2dlTWh1T3FLakJ5WklOZ3VyTHNpZGJxTEFGRnZGamlqSkJqTnhZ?=
 =?utf-8?B?ZzE2THkxbjg0NTA3MlNtOUVweEJwZW41OUhvZzZvejErOFFNMGw0aGlDMFF0?=
 =?utf-8?B?SjFyekJGQUY5ZCt1aU5OS3l1blBVK2FFRnArczkrdkRubisvZVdhR3NnSEJW?=
 =?utf-8?B?dTRmeDBXeGNKcSt0U1JmditXWEdDMERuQ3kraE1SNEs2SGw0YTU1OFFtVnp1?=
 =?utf-8?B?NEVDQ1FpMHRHT0N6dEllU1lncEk2VXhpRUlCakJjak9CMElUcG83eHQwK1BD?=
 =?utf-8?B?TFI2T3htNEFvMG83RmFpcStRM3N4S05UV0szOCtiT09KU2JEcDRKMy9iRzl4?=
 =?utf-8?B?MTQ3dElKUFg0Q0JnU3Axc2NSL1hRZ3ZrL2FWeUlLb29IQmpyb0p0Rm4xaHZm?=
 =?utf-8?B?elo3cndDWWtaVW81RDNDYStvK01NVFBzRFVob1k5dHhTREoxNFBCejBFZWlY?=
 =?utf-8?B?WGc0T0FMUVpLQ1NLcXgxVURTclZYUTVMOStkRDFwWSs0TkxPeW1BbHpuNHEv?=
 =?utf-8?B?RUxPeENLRFNKWVlNQVFoS2RSdmpvTEhlZklHUzRITXpiUFdHQ0czNlVmdFpz?=
 =?utf-8?B?Y08vZlJTSUMzdTFvWEs3V1k4eThHTVQ5dVVocTdLRHpBRTVSYmNYZXljczVW?=
 =?utf-8?B?MEl3aXFXT1FmWmxIcUNBbFhRUy8xVUQ1M2FiVWgzZ0dkK1VqRjJtSXFkcW9I?=
 =?utf-8?B?MmMvMjNqWEIza1UxU0tuMXVmMzdWRHVLRXBRY1ZibWMrV2xYQ0k0TUJGQXly?=
 =?utf-8?B?M2s3ZkRqZkVDaUZoMWJMQzdrYTJQUU8vQ3ppc1U2Qk8vRkFCTzRBaW5yaEdk?=
 =?utf-8?B?cGtLTEs1V0tFRUVYYm51YXYzWHprUHJTUGFkMFY4Q1hWdHIvQWVmQk14MkR6?=
 =?utf-8?B?SFJIb3VVSS9hSm5PbUltSHhCN3pVN25mVTdXWkNOQTVsMHRSUEIrdEppUXRH?=
 =?utf-8?B?dlhJMmc0ZEdYNkdZbWxLQ3VlTWFwc29USTBnaXpQZXQyUEMwd0dWTDhKUUJl?=
 =?utf-8?B?UzRXSVE0bFRZM2lVbUZHVitBRkI5MDhvYnBLNmorZW9tZmlhakNlMHRyU1VJ?=
 =?utf-8?B?Ym9tQ2pQZ1ppZ0tHZTU5cFgrSi8vb1B1QW04OWpLbUpiK080R2pqalZmcERq?=
 =?utf-8?B?cGNMbEZGZkRka2wwdFM4c25RVnFDOFRRejBOVDZoMVpHSkloSDh4TU5JUWoy?=
 =?utf-8?B?M3dLMzZEUDY3UElqL0hkS241aHJvS2N2TVA1dVNFbEhTbER0RExuTHVSR3Fp?=
 =?utf-8?B?VXdkcEVpMDNGanJrcnZWVHA1VmRraG0zTjVYYlNLSzIwSmFoZGZ3QkJmNVVp?=
 =?utf-8?B?MG9rcXhzSVhEQ1pPa2lGQm1ralJsS3ZERjY1MGNISURpeUFoTE1iZnJnRFBx?=
 =?utf-8?B?RUJqd3NxL25mTlhxV0pDZTRacEZlSWlsbWJxa3FPaHZaVnRJTmZpYTkxSWdk?=
 =?utf-8?Q?5KgwG0Tyj/Qb4lF3v3ACZT4+4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1e347a-2a9a-432e-dc64-08dda4f8c2c7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:50:48.5893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHBbl/rRSIOjN+D5NeczxaAGxeKY9dx5szWnu22FBkA3KV7dhPfmIyy8sVkJqSv6HmWIFxfGy2ta7rSA//Zu+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746


On 06/06/2025 13:43, Ayan Kumar Halder wrote:
> Hi Michal,
>
> On 06/06/2025 11:13, Orzel, Michal wrote:
>>
>> On 05/06/2025 15:39, Ayan Kumar Halder wrote:
>>> Hi Michal,
>>>
>>> On 05/06/2025 08:06, Orzel, Michal wrote:
>>>> On 04/06/2025 19:43, Ayan Kumar Halder wrote:
>>>>> Introduce pr_t typedef which is a structure having the prbar and 
>>>>> prlar members,
>>>>> each being structured as the registers of the AArch32 Armv8-R 
>>>>> architecture.
>>>>>
>>>>> Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits 
>>>>> beyond the
>>>>> BASE or LIMIT bitfields in prbar or prlar respectively.
>>>>>
>>>>> Move pr_t definition to common code.
>>>>> Also, enclose xn_0 within ARM64 as it is not present for ARM32.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
>>>>>    xen/arch/arm/include/asm/arm32/mpu.h | 30 
>>>>> +++++++++++++++++++++++-----
>>>>>    xen/arch/arm/include/asm/arm64/mpu.h |  6 ------
>>>>>    xen/arch/arm/include/asm/mpu.h       |  6 ++++++
>>>>>    xen/arch/arm/mpu/mm.c                |  2 ++
>>>>>    4 files changed, 33 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h 
>>>>> b/xen/arch/arm/include/asm/arm32/mpu.h
>>>>> index f0d4d4055c..ae3b661fde 100644
>>>>> --- a/xen/arch/arm/include/asm/arm32/mpu.h
>>>>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>>>>> @@ -5,11 +5,31 @@
>>>>>       #ifndef __ASSEMBLY__
>>>>>    -/* MPU Protection Region */
>>>>> -typedef struct {
>>>>> -    uint32_t prbar;
>>>>> -    uint32_t prlar;
>>>>> -} pr_t;
>>>>> +#define MPU_REGION_RES0       0x0
>>>> The name of the macro does not make a lot of sense in AArch32 context
>>>> and can create a confusion for the reader.
>>> I know, but I want to avoid introducing ifdef or have separate
>>> implementation (for arm32 and arm64) for the following
>>>
>>> Refer xen/arch/arm/include/asm/mpu.h
>>>
>>> static inline void pr_set_base(pr_t *pr, paddr_t base)
>>> {
>>>       pr->prbar.reg.base = ((base & ~MPU_REGION_RES0) >> 
>>> MPU_REGION_SHIFT);
>>> }
>>>
>>> Let me know your preference.
>> I did not mean #ifdef-ing. I was more like suggesting to use a 
>> different macro
>> name that would be more meaningful than this one.
>
> Now I understand you. However, I can't thing of a better name to make 
> it more meaningful.
>
> I have added a comment on top. Is this helpful ?
>
> /* Unlike arm64, there are no reserved 0 bits beyond base in prbar 
> register */
/*
  * Unlike arm64, there are no reserved 0 bits beyond base and limit 
bitfield in
  * prbar and prlar registers respectively.
  */


- Ayan


