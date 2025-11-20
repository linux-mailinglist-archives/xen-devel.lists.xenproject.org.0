Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813E8C73F48
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167184.1493533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3i1-0002Ke-Nb; Thu, 20 Nov 2025 12:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167184.1493533; Thu, 20 Nov 2025 12:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3i1-0002Ig-Ky; Thu, 20 Nov 2025 12:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1167184;
 Thu, 20 Nov 2025 12:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM3i0-0002Ia-Bo
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:24:20 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d34e4c8d-c60b-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 13:24:15 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5553.namprd03.prod.outlook.com (2603:10b6:208:285::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 12:24:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 12:24:11 +0000
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
X-Inumbo-ID: d34e4c8d-c60b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZDs8G7aK4XcZ7+lDdQ64sciPiPlGOfzA/ga3CVpf1Opo5eMQYklmrBsyaVHvMFdz0gV4SLUMeR0jZoHakVTmVNByD8bjbroKjQGhFfvKdx6uwFT6BS642YFO6AYdljeBGVeC7QcBX5POdhCxPEftEqQeACI3+fzkr33Z4elYqwpTgYlsALJF2oFXQW3ZvvBDLTstoAZdgTU6ummXxgXaz0br/NH3x0peN8egCuiSFhs7nekhHz8+At/FaIfTlLTUXEZYSAXJNvIuViRMFhbhLAks4yCiY+VP20I38xhFYlyff2K0S+nvGr2IZpX+jLfGrs/ngrypQBkbw8iOns2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eo1ykrn7JrEKB40ajUpj9V6VOtMjz+rZn5wHdumEIyU=;
 b=dHESElhj10ajE8rpBLK6n6hvpVeJNFRKSmwpdbccTHiVoT0KPm6Gs2Ct/i5DuL83sGGo5t+ChYxS1BWAiUpygwr0nodOY3JOJoO6z1ZjC7KvQxcYjphCXAEJEUiOt4DQkZwg5QfFAaFrn0BrsVMIe6iiq/vm86FPeJpuACAiNrkI/9x3NK3NcVqwKh3yBSpay72xS5ZukwTvEvH8kT67LAA9GbQuNby8393lRPPDaMBjJfa+U0EhUjN5ptH0ynKA1aVRmSfmaV5fbkg8UU1luZSas2AVDn/xeJp/RrpOKtEmlq9u+ucJL2H8aki5o5IzGYqqdmMg44q+JvCiJA1dMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo1ykrn7JrEKB40ajUpj9V6VOtMjz+rZn5wHdumEIyU=;
 b=vVy3WRopnQuPBDaQh5ZhgtpjrUXdN64RvPWZ3hkXoK+iB+R8WjsJhlAb7S07qAnMU4sPfPXnMCq5eEUcDgzdUUCzN+vsP39s+tVIargbfFkR6A+sZl4fadjsEowPdu7a+vUqKMU8AEeihhBzavZwscyZJjTL/rxc2FAeqo9R7fI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f491eb9c-7822-4637-95a3-bcd994b20dea@citrix.com>
Date: Thu, 20 Nov 2025 12:24:08 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/vPMU: don't statically reserve the interrupt
 vector
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <06f2081b-64e0-47f5-b66a-26363979cfdb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <06f2081b-64e0-47f5-b66a-26363979cfdb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0047.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::35)
 To CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc0084c-d8dd-479b-d2cd-08de282fb5db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHpjL1NycXJlN1czZGFtSkx5cU5nMUUyUE9WL29WR3F6aGZKMytmTXcvOFh0?=
 =?utf-8?B?c3VRMmdGWEtMZDQrWURueVgvVjlyZkNseFpkRzhUQVNKMkJTd2xhZStrUVYw?=
 =?utf-8?B?c01mU2Y0dlpscGxvZjhGaHRBbDd0VjQxRHNGcWlEdFQzSlovUC9Lb1M0TTUy?=
 =?utf-8?B?V1EvT2lDOFU3TkpGR2VCRFFmV2xCK3FNbStyWEZaa2x5UE1GUStLaUl6UzNn?=
 =?utf-8?B?R1NBVXlCVTNkK3YzNTJWRU96a1MyL1lzeDhJeUVHTzdqNHRGT3JzZTBYemUv?=
 =?utf-8?B?anpXRG9Xc1V3cUx1UHYrVEJVcGlnejQ0Z2RySnRsNVNDVTVSNEpudU5RcXQ1?=
 =?utf-8?B?TUVrSUtyUkxUOXkwWDUrZXpEYmxxWWpleXBBb1FhQmxHUjZ6eHI2cmJIMmpm?=
 =?utf-8?B?YmNXNlIxUkdpTmVPV1RvNUQ5YXRVR3ZRSFJXcXIyR2d4aU1DRTJ1cmYvNHdo?=
 =?utf-8?B?OFlpaTJNMDNNd2NYZnJadzRNN05kaHRjdWU3WERkNktVbFgyK2NRYkRZMDYv?=
 =?utf-8?B?dHJoMnRHdlVOQ0Ftc1RCWDRaNUhacXVhS1JOSUFCT056VkY0dHVBL0luYTdt?=
 =?utf-8?B?NEJwVXhoOU42L295V2VXLzdlOXFjMndtK1ZHWk1pbHBvY1NqQ2d3dHJVeHBD?=
 =?utf-8?B?VUpKVEdWM2gxV2Q2QnEwdzY3MGtIMmF3RTdZMS8yTWc5c3BIR0RtclI3bi84?=
 =?utf-8?B?b21DT3NUSWQ5OHFSN3pJMGJicVkzQ0o3LzhpVXBBcVp6V3hzZG9KbEZUemc3?=
 =?utf-8?B?Zm5uSEd5VlJNYjZxSUdzM2hsdkZMOU1PcEwyR0t2VmMreitFRlhtYmVodkhQ?=
 =?utf-8?B?bzhHOVBNeVlra3RyaFBLNE9DL0d6T1A2NGJ1RzNkc2FlcTdnR3Ewb3RGZmNO?=
 =?utf-8?B?ZW8rT3FRNFVvMGpWRTV3M1RTRmZLSXVVRUVLNGQyM3h6Tk1DUGV0SExTaEdC?=
 =?utf-8?B?em5zOEhxMjMwdlhkRDVqWG9uYVgvbXl1K3g4c2owRGs4cXEzc2ZiQkw5cGVk?=
 =?utf-8?B?STVtajhvVmFkbGtxanhxK1VwSWhoczIxZnE3dmYwQTcrcGFXbkd1NldlQSs1?=
 =?utf-8?B?TGJwWWRveDM1UGkvY3E5Mk5ObHZXZHRGR0xtR0dxQUFRcHoyNGp3b0dyaGtW?=
 =?utf-8?B?WGNRVWNITGxRb2JGR0tOSjlIRlVQbHNmZ2o3M2VSSUxuOExZY3M4RzErYXhM?=
 =?utf-8?B?N2s4YzYwMXNVaStBb1RGNk1ZNnZUTW84UDY4Q0hMcEJuQkh2V2xNdUg0bDB6?=
 =?utf-8?B?cTN4VXVMNlRadVBQMVFCb1JoRGVvYndlWTZkdzNzTU94bFkrVmNwRG0xSzJC?=
 =?utf-8?B?VDVPbk5WOVZkRGZpKytCVUJTMGxGMTJ3QXRPMkt0SWhqVjFVT0V1Z3BaZmNF?=
 =?utf-8?B?YmJUNW9DSTVySnNlU2xDZitiRlFXdmJyVUVPVllHWW9EN2ZzTndwQUJwTXk2?=
 =?utf-8?B?TFJteXBwcGI1YVVsR2VYN3BmcG44MDhhSDNEekZCbEdqeTdoVldyYUxKeGRR?=
 =?utf-8?B?NzdaL2dkY1J2RStwcW9uM0dNbXVNOURxRVJqWGVnVWl5NnZmM01XY0JzYW1W?=
 =?utf-8?B?NHFZUlRUcURjcnlCc0E1VkpiajcwdjdXbktMVCt1S1BmWHlXdGIwMWgxbGxp?=
 =?utf-8?B?NnNKR1YzVGNpTFV4c21QaWp1UG80bXpzSEIwYThzWmRiZHVYamdvRUpuOGVP?=
 =?utf-8?B?RE9XUGdqMExIN25HZUs3ODFkSC9Pd1Q2SG5HQThEUElDOFd5eUIrSGJNYmRN?=
 =?utf-8?B?OVZXMURySmZmZGwvbDg0Wk9SNmxQbkFxSC9qcVgzU0JqcEVDeWxPOHUrT1Rq?=
 =?utf-8?B?RUJjL3ZYODdMSEw3czVFQ1VsdnlSWll4eUFmOU4wMm9xVEdJcGYxZ0gzQ1pJ?=
 =?utf-8?B?U1NTOVpzM1BqOWMxd3lFM3BJN2EzcHZzYS8wOFFENW5lZ0FaN0JDc2RLQlBQ?=
 =?utf-8?Q?8gjCfom8KPVR7L1zY7Q2A7rXmXXN4//e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHo3NkdIbTFTdEtxcmF2VEdGNUZBVW5vdWRYT1IvQUxGL0piNFIwUnM5YVZU?=
 =?utf-8?B?S3crQ2hGdTgybU5MSGw1UmNwYUdQZTBOMmJnRFliQW9UTkcveEY5dU8yeE9h?=
 =?utf-8?B?RE5GS1VPd3NmSytLNVVBb3V1Q2Qza254M2Rya3o1ckF3aDNQdVUwYnZBbmla?=
 =?utf-8?B?YTBVT0ZkZHMrdnh5bWpBRjlNTi83Ym44YkM2ajBPbjBHcU9qVEsyNDY1bGpX?=
 =?utf-8?B?U3FwOHQ5dnE4dmwxUzVVNzVWeVpDalhnZFlsR2IzRk9ucTNTNmJZU0o0OENS?=
 =?utf-8?B?THp3SUIwVjJ4bjk0QkExeUtJRTlJSFZsVlZoZEdUWnpKb1F2S3pETmNQbGdi?=
 =?utf-8?B?TTg4Z1NYd1RPS3ZQT0xGcEFiQmZ3UHV6Q3pOVlVlR3pNSFV3MnR1UE5CUHda?=
 =?utf-8?B?ZVB0eEJPYkJnOWtwZ1dOalZPdDdPSVJ5TGtvY3B6MGg3YWdqUGVnUm5XcTB5?=
 =?utf-8?B?aDc5TGpKWEJOV1gzVHpORnV5UWhTNnprNHY0aEVtYWIwVlZ2V2pvQVY2czhU?=
 =?utf-8?B?YnBDLzA2KzEyQWRzVnZjYlZLak1KdmJaUU1xanAxOG9EUTAyWDRyeDlGdXhz?=
 =?utf-8?B?V0VrR0dSWU56VnNxd0FSNnRqMzg1VzFBSzVIL1dXdXRkNHFGZS9BdnRrUUR1?=
 =?utf-8?B?eU5aUXUxQzhHWVA1eU9CU3Q1Y1ZyQ3VyWFZ4UkNsQWRHRi9ka1h4eXlxdWMx?=
 =?utf-8?B?V1l1OFA0VXp3TFVGdFdSR0NWWFhuMTVlSXE2dW9zWXQzZ2U2YVlTR1lhYUZQ?=
 =?utf-8?B?emJ0Q1RMNXRuMm52aTVTYTJFOVlEZnpWTTYzYjlNV0h4R2xIVWZSUDBsYjN2?=
 =?utf-8?B?YktLRkM5czYwT3FUeTFaTW16OWxycC8yYWp2ZjlJa3Q5NFhDbDBQWGRIM1Jm?=
 =?utf-8?B?MC9mV2w1d09qNlJCNFM3N0drUEJsTXdibStMMWovTkl4all1UzRVakFCbDZv?=
 =?utf-8?B?bDExaUhWYUtrRTRmaXFVTGRVWnZsQVJQaXdiY3lEdFlTdWluWUVmODJaWVR3?=
 =?utf-8?B?bXVUdm8xd0JtaUN5WkJCMy9vay8zVVIyekxaQ1RyTVFKVTdMeVZ1V3hrWG9x?=
 =?utf-8?B?RG1EcE1SaDA5MCtpSkVOV0hDYkxXTGd6T2xNOWpEL2JoOTNOUGxuU2tWNzIz?=
 =?utf-8?B?VlpJTTVOdE44aWhzdXRXeFJlZk1weVVPQURnai91R3FYdW1GVE1rYzZmQW56?=
 =?utf-8?B?WUlFWnNCOHFoTHZQRFI4ZlIwWXpYVFdmQWNtbk5WTWtNZWpRQ2loTXEvbmR0?=
 =?utf-8?B?WDBNTkNNbE9MdkVzamZMTlhMejZURjZ3T0htUkxCNkhOVEpEK2FvcFpvdjJj?=
 =?utf-8?B?RWthUW9Da3ZLV1ZTeFNkNkZuUUw4bitZYksyZjY0M1hCWnI2aTNMUHhtVjZN?=
 =?utf-8?B?SUFJeUlCTzc0bmZWRm9qVUZxMHlrNG4wUldUdVg1RXU2TWp2TVFJYjdOT1Z2?=
 =?utf-8?B?ZVFMWC80VHp1RVNDc2trdEdLUWYwU2FiSFFKdEhyNHNnRERFQ0ZydDNDbWVM?=
 =?utf-8?B?bkRvcnM1VU43QXVCRFNVaGF1dlJwTUhyVGE1ZEdGaGtnQ3p5RDRsYkdIVjgw?=
 =?utf-8?B?cGJGV2Y5ZUZrZXNiR0IyZjI2ZkdWLyt1UUk2Nnpxbml1OGhzNUJYSmpFdFQz?=
 =?utf-8?B?QTBCeHY3dzRRQll1TktGYzhRUUd1TmFDMEtUck4wWk1sNWJvMTRTV1NHNi82?=
 =?utf-8?B?bmdoRlh2SXRmREExN1J5OVBPWGNyRzUxTGdDYk9yWHFSZHFJeGtSTlZNNTBp?=
 =?utf-8?B?WUxzZXVBTVNLMk5WeGNNN21jblZBYjdJOVZ4MFJkQ0Z6U0lkaHhDdWEwaDhO?=
 =?utf-8?B?Y0dudGpDUlFaeFV2SjlTdDZNQTdHRDNISXV4YkZ0TkJza0dSeE1iaE5Cc1BG?=
 =?utf-8?B?M0JLZGhDZDE1KzNmMlkvczU2TzhqOGo3ZG96cCtpMk9pUkRkL290NWcwUnpQ?=
 =?utf-8?B?RUVKMSs4dSs5ZUhxWkw3blVjemlIZmc0aXovWjJocW1DbnIvMTl3L1Mxc2xG?=
 =?utf-8?B?REdXeGhGSGtqVWdDYXBJWjkzTnNkYzdXUTB4TXNqUnlERHRCTktaaGt0bWc2?=
 =?utf-8?B?STh6azNaM1g3MWUxYVFIUlRxUVJYeWRIaFRkWXBCYzZIK3dhWVgwTjFXZUds?=
 =?utf-8?B?MmNxYzdZcW9HTzJYZkREakdmdFRzcVFjaTQzOFVXUk05QUk0dVQxVlBROHVN?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc0084c-d8dd-479b-d2cd-08de282fb5db
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:24:11.4404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaKGbYnCrN+GrfQ9MJVzBaXe1wI1enPLFPjRZA8iKJMUOQ79jvFOkgwfedgB1vrNMT99n42xKiVh3XEx+vagQdimpqVtFRB/JPipCiTouws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5553

On 19/11/2025 10:51 am, Jan Beulich wrote:
> Move the setup to vPMU code, doing the allocation of a vector only when
> one is actually going to be needed. With that the handler function also
> doesn't need to be split across two places anymore.
>
> Add the freed up vector to the dynamically allocatable range.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In case down the road we also want to have a build mode with vPMU code
> excluded, this may also simplify things a little there.
>
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1313,16 +1313,6 @@ static void cf_check error_interrupt(voi
>             entries[3], entries[2], entries[1], entries[0]);
>  }
>  
> -/*
> - * This interrupt handles performance counters interrupt
> - */
> -
> -static void cf_check pmu_interrupt(void)
> -{
> -    ack_APIC_irq();
> -    vpmu_do_interrupt();
> -}
> -

I know you're only moving this, but it's likely-buggy before and after. 
ack_APIC_irq() needs to be last, and Xen's habit for acking early is why
we have reentrancy problems.

I think there wants to be a patch ahead of this one swapping the order
so the ack is at the end, so that this patch can retain that property
when merging the functions.

Or, if you're absolutely certain it doesn't need backporting as a
bugfix, then merging into this patch is probably ok as long as it's
called out clearly in the commit message.

> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -369,7 +373,7 @@ void vpmu_save(struct vcpu *v)
>  
>      vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
>  
> -    apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
> +    apic_write(APIC_LVTPC, pmu_apic_vector | APIC_LVT_MASKED);
>  }
>  
>  int vpmu_load(struct vcpu *v, bool from_guest)
> @@ -432,7 +436,7 @@ static int vpmu_arch_initialise(struct v
>          return ret;
>      }
>  
> -    vpmu->hw_lapic_lvtpc = PMU_APIC_VECTOR | APIC_LVT_MASKED;
> +    vpmu->hw_lapic_lvtpc = pmu_apic_vector | APIC_LVT_MASKED;

Taking a step back, I'm confused as to why we have pmu_apic_vector at all.

LVTPC needs programming with NMIs in order to provide coherent information.

I think this might go a long way to explaining some of the complaints
we've had in the past about junk showing up.

~Andrew

