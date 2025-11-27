Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA584C8FBDB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 18:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174292.1499245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOg17-0005Sp-Me; Thu, 27 Nov 2025 17:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174292.1499245; Thu, 27 Nov 2025 17:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOg17-0005QC-Jl; Thu, 27 Nov 2025 17:42:53 +0000
Received: by outflank-mailman (input) for mailman id 1174292;
 Thu, 27 Nov 2025 17:42:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOg15-0005Q6-DT
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 17:42:51 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ca1fe47-cbb8-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 18:42:49 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB7376.namprd03.prod.outlook.com (2603:10b6:408:18b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 17:42:45 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 17:42:45 +0000
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
X-Inumbo-ID: 7ca1fe47-cbb8-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEzpBak2o87o3DtmX2fQ7+mS3h0qdrro6OU6ky5i+KQDAHbPs8UJgICn7ooLuyb3RXOxi77y4mI8EivXOrA1PgKwm2Y5WuVHP0g/7lLl1xLKXpKS6jOTnpClbZC4U1pBhP2TbX6nigcojc9dKl2IYXf0wBaNATSH4kFhTeSH2Kt1xpo4SR+WpgcLQGFL9wak6GE+IqyYsoHDImz+s4+u2/L8xPeZBZxjgHvRgyvPneWdkm28Pg580RDyRr2opxpln4po9rwkBrvspvyQinabLmQTLfiNGwkCPWiL/67Mp4ALU9skIEqhNqzL+Kw+KC+SI9vf+X8YqwyrGE5gON50Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5Y/rA95DUg0edVrVnp8ZVSBrDPip/Y0RXghmtJA4Ig=;
 b=gT8u6EE0tz7W/JEizcRPO3CP4fYLXu/exxh6fNJDjYLURsiwwVTiHhUCRluuVUTK7XgCPMm+iG25PEBRSRiXY9opwvozhC2EEoqpXVtAxUc8sZbZtfGY09GvXd//xuAKiGHZHeYD/rsdL+tAxZChR8s9vpCrGqMBYbJ3HyZJqJsFjclKfHkTM9ZDYGpTHdSzLhTBO0aRpyrb4UtgVXY2ITq5u95p6eaLUzqFMcPZKxAnaakmTAq8mGW/nN4Q6j8mg60Qk4skUmBceGmVB0oLUIvxfRDydu9eH+XYmu/e5IsNdBVnU+YCxo27ppM1ssA4xW3pEGGgBhrIxw7GrXKDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5Y/rA95DUg0edVrVnp8ZVSBrDPip/Y0RXghmtJA4Ig=;
 b=EHiS0FTkmmrkVCFmbsXjWN9AbyyOhIeCF+CNjzK2JQNyZgApVlPKr0Y/iiexY7zUPPqiaYcVIB7eyP7b2SnGhyxl+unJZ5d0Rz1Ily9E2k+RTkFKd7Zziw+kVrX3zsoAfUK3oSTrxbSI44yec18Fa+whfax66M8P0mz2iU2Nj30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <15264e75-e240-4db0-92f3-c87e31a6c949@citrix.com>
Date: Thu, 27 Nov 2025 17:42:41 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/3] x86/amd: Fix race editing DE_CFG
To: Jan Beulich <jbeulich@suse.com>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-4-andrew.cooper3@citrix.com>
 <52fd793f-5bb1-4e14-a64c-b431b0ae83a6@suse.com>
 <f2101ed6-470c-4d6a-88dc-d2776010c346@citrix.com>
 <d13547b3-15f4-4814-8bd5-1f5dfb96fc39@citrix.com>
 <63ee65cc-1e8b-4f00-a882-7e96fe1e1eac@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <63ee65cc-1e8b-4f00-a882-7e96fe1e1eac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0358.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::34) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ca5904-476b-48d6-dd1c-08de2ddc5f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmw3dno2aGJZSGdBSjlCK0ZkT3hLS3AwNnVKcTZaRXoxUzZzOEpQTFJKR0Fp?=
 =?utf-8?B?WHFhVWNDMHhSZG53cnJ2bHRleFM5VDJWZDlzYWk5YUxxQVA3SHZONFd6Nzda?=
 =?utf-8?B?MVpVRWxXczlTOUhvcFltcmFacEZFbHJMWFB0T3dlRHNtM0FjTzM3ZWhURWdG?=
 =?utf-8?B?MWFReVU1a3U2OGlOOWJkdHczVUZBcVpsSHZEcFBUWjBVWE5DWUpYZ1NraUJF?=
 =?utf-8?B?TEZHVGNBbStNRDRGMTJpdzVvdm9FUVc3MFRpT1JDbFc2ZkUvNjNGOXRTRWtk?=
 =?utf-8?B?Y09LOGlLTEtHN3NXRzdvUkJ1TjdJRVNzempFWWlYMWc2bDQ4a0NJbnJkanU3?=
 =?utf-8?B?LzFXZXdKbHJjT1VyYkhmdjZoVW4xNTVaZ1paL0RLajBiMUtMWi8vc0pFcHNJ?=
 =?utf-8?B?di9NaDFTeTFtUWZpdmNLcU80OHE3cXdwYmRuU2NEWEJ1WTVpNzgrVTBDWE1Q?=
 =?utf-8?B?ZC96SXBOallPNEpqanNZall5MWNKZjhQNkkrTE9vRW5ickNhMVk1MFgrckJr?=
 =?utf-8?B?TldiTWNLSlRjQnE4YW8wNlpheTNGTzJxQXB6RlpwaHBod1crL09GVEVnMS91?=
 =?utf-8?B?L0FQeGNIcFBUb0xZY2JhektmREl6Nnh3US9KMlNWSkZIbFJBSWs2YVdXTzA0?=
 =?utf-8?B?NXNoc293bGtLMnorQm54ZEllS1AreEVMQ0d5V2lDOW5NbXp0c3MwUkJsaHhH?=
 =?utf-8?B?ODZUZ1RTbnJyV3NnajlBVEZjOFFZZlpCQ1h6QURHa0dhV25kbmlzeEc5WDFQ?=
 =?utf-8?B?RUZnTjZneDAyZGwzeFdwYmxkTU1yRTkzRmFBcWgzelhyVUxwcXNLd29Fc1pQ?=
 =?utf-8?B?VVJaY2pnSzJiTi8zWmpsY1IvOXUwQ2Q4SlRUVUR4S3BEbVdEaU4yMUlvUVFt?=
 =?utf-8?B?ODkrZ2w1YXZWVjdaTVpObkVIcUVDWTJwbHRBc2xGU09rOEtnN3dnZlBqZzJC?=
 =?utf-8?B?UERiRkx3cGpmSVVDQWt5ZnU1d2t3RW9DTVFObnpjUkptZWhVeS9pOTBHVytK?=
 =?utf-8?B?RXhTZHU0VWN4OVZWL2t3WTJtUFkzWEcvM08yZ3AvRUNKN3NYNS9UN3BiVGJ0?=
 =?utf-8?B?WkdObi82YTBKeUtkMFNCOGowbTB3RGN6ZHM3eDlKLy9pWDYzb1M0d0d6M0VV?=
 =?utf-8?B?cFZLTXdvL1N6QmxiSG5SdUUya2dWeDZsQUcwRDIyQm1tTTF6Z0ZQVUZSdEs5?=
 =?utf-8?B?N0VjQkJRTG9mbnpUd2JMNEY1aWcwYXptVUp1VzlEdDZyUllLelZCeXhsQWw5?=
 =?utf-8?B?NXJJZnNZK2xvcFJjV2RGdEVXN2d5NWNTb05lZ2N0RjNLZk84a3VGbG5qKzBv?=
 =?utf-8?B?UjZLYUxXQTE4bmJ1TGdPMVhRK0hEeEozRXFlQjRVZHJ2NTQ4K2pJaFpWYzRS?=
 =?utf-8?B?SnFHdEVzNklpRHhNUkFuVGhMbnExdTZJOGNNT2VQdkFtNUp3SmljaW5KSXA1?=
 =?utf-8?B?TUNTNmNCQ1VWUFhLdW1NN1IzOGFUNjFBWkVBUXl2bGt1UUFnd1RDNGQzc2JY?=
 =?utf-8?B?RWtuMDAySTNNb0YzU2NQeklxL29PQVRvbDkvdXlua3EyUjQzOXVrM240ZEps?=
 =?utf-8?B?bHBNWnU4YXo0UXRDQk1FRVFIL3ZEaUwyaDIxNUFhUVk3VG1UWnNVV3RHOFZN?=
 =?utf-8?B?LzZHVlNzNW5zMmlkOE9CN3lEeUJpd3FYc25NRms1M0Y0SWxVMlZMTEhnUTMr?=
 =?utf-8?B?eXhoK25hRkJWb3hob3hTQ3hBbjgyQU96akkrcDdWMXBWR1o5TTd1VE9HaENF?=
 =?utf-8?B?cjlhT0g4RGFHb3A2MjB3SmkyellSd0V5WHl5ZDltSEFvQkM1THF3NTgzM3ZR?=
 =?utf-8?B?SkM0UTJ1a0l2R2hiY1E1UnQramxIbitHU2RWSGRSLzI0QlB6dTk4dkI0NEpQ?=
 =?utf-8?B?NTFZYVppOGtleTdYMnpka0x4K1pvSzdjRHJhenUreTdKMnRFVjhBd1FxVWtz?=
 =?utf-8?Q?hU2XpvUp9E082kKk3ehXcuJUxvZUxAM1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3JsTGRQdlFmNHNxRHpzOWNCNC9wdW9FL2NlWVBvV3BjTG5IS0RxUEhNQlI1?=
 =?utf-8?B?eG90TWl2K1BtZVpQRVZFekg1ckdoRlo5TFlmTXhwanFhNGdXcysxU0cwMWdv?=
 =?utf-8?B?dFVXb0ZqS1pxaDArUWtsbHpJOXF1ZmlqZ2dER0ZpUmFQb2gvTjdpL3BKY2RZ?=
 =?utf-8?B?ZnRySzAvdndNN05iZjNUaHpGVnVQczFVVTgrdS9nVUdtYm15NjgvQ00wS2x5?=
 =?utf-8?B?QmFRK2RUVCszaEdzcFBQZitPaUplYjBNLyt0OWV2a2l4NVRZZ0pIWnRMNHRD?=
 =?utf-8?B?WDBndENaZDhWbU9YR055emVqVWtVLzl1TWtIa2V6VVJpVSsxaVRpSk85TFNW?=
 =?utf-8?B?aHJlaEhpOEJ0YUVPVVlGMnFvRWhmU1lHWW9CMVpJdG5vazNGZkNZZFlxN2dM?=
 =?utf-8?B?b0M5Y3ZYaFRBdmFUaUdseXk3blNIVE4rbHF5eWZpNEszV01MSVYzb3dIUVYz?=
 =?utf-8?B?VmtEZmVDZEZmeS9jMy9nbWovbkNCaXhwcUttbEoyekEzWkMyYTU0S3JGUWU5?=
 =?utf-8?B?NE1tUityaG9oeU1IdlEvK0dsM2JuTDU2K3pqbkdlYXh1Q2E5S1lYQkMwTDNP?=
 =?utf-8?B?b0xKTmc0aXZuYjFkRmFtUHM0Y1A0NHhZR3B3MTNhZm9kYTRrT1BPMUFud1A4?=
 =?utf-8?B?a1VsTWlDeEZIS3E4Qk53d2F6c255SWcrTHhZVEdyWHAvTnJYRXA4QmJzcWFk?=
 =?utf-8?B?T1Q2ak9GUkt5ZHNTZzY4YTJMcFd4Vml1VjZpVXNkUjJKNGNBYTI1eStVa1lF?=
 =?utf-8?B?Y3FqeGFYOWlpWk5WYUlodlRidTl2ZHZvMldIbmNkMDU2Mk1VMHU3NGJ1aVNH?=
 =?utf-8?B?Smx4SjFWUGoveEdRZHpRbzBlS0ZaMFJPRWVqMXBzOEpMOG5lak45NVNIbHYx?=
 =?utf-8?B?c3kxaTdvaW5GTDBHdG1jN3hoSEQybkdIMTQvRDRuRE5uYjFVVDFqK2FSRkVh?=
 =?utf-8?B?dzBVNEFWSWhDdzFvSWFrQTNaZUFDRGpYU2pHdEIyZU9SQ3kyMG8rYkQxQmN0?=
 =?utf-8?B?aE8reHp0L2NjZDVRSHN3N3VSUDZ3UVJyMCtIQmZTVy96ZlFkaU44SElFbUdr?=
 =?utf-8?B?SFNZbHJYVU9xTlhveDV6WUhBbk9nbEloSS9TeGhzcUR2b2tnVWcvenMrYmxv?=
 =?utf-8?B?MmE2ak1zS0x1cUpHSG8wcG1MQXVNU2FSVHBQOTVDUzJWeERleDllZmxxYkxD?=
 =?utf-8?B?bHJpcVAvWnlQSXFrVDdwcUtOc0tkSTR5QVNMd1VoNnZwZ2VwanVtRzA1SjFL?=
 =?utf-8?B?bEZVTnpoZ2RCVE1yNjdIanEzbVMxLzZ5b095a011aEdmUXBTNVpzR1F3bkJz?=
 =?utf-8?B?OThwN1ZBamVUYWZTQUdmUVBOQU9UcXVaejNZRXR0Y3JNWFFhWUN6WXFxb1hQ?=
 =?utf-8?B?WjlpbFh6MnNrSnQwVTA3UkdYeXIzM1pTeWY0T0dub21jajJXa3dNV0EvQUtI?=
 =?utf-8?B?R0JMNGJiZGQ4dCtVSERyTU9vZVhaOHNWYWFqd1NPRFlVdmRINFh5QnBieDZE?=
 =?utf-8?B?WVhzSGsxWU8rUFo0eFhVWE9EUWJrZGtDSFgrYkhRRHZVSTh2OVpYVEx6U3Vh?=
 =?utf-8?B?OCtNN3dZRGN3YlozbXN0Y051VmJLSDNMSU4rRml2TGFoa0FJWVk2NldYbDFQ?=
 =?utf-8?B?blNPQUxPeC9FNFk1TlVWUnRPZmxSeVJVNU5NRm5NdUpicEl3dWhaMEFwSTl3?=
 =?utf-8?B?UFQ1a2M1ZHJBTVN3akhKa1F1SGl3L2Y2WTJCTEVaUHlBS3dtSjRqZXlWR0NW?=
 =?utf-8?B?Y09pMnJIWEFNTmlPUzNuRUVtVGtGZE9OU1oxcCtzbGRRZ1owT1VJOCtybXN4?=
 =?utf-8?B?eXE1eFNBcFBLeVNtVGlUN0wxVmJXNUx5MDhpU3B6RzZNVlQyZmN3cVRIRmRN?=
 =?utf-8?B?VnRJSU5TNVMwMjhIZ3lrcWlxbk10a2hmdU9ydEMrbnFsajFCOUttSnAxQWtk?=
 =?utf-8?B?MGZhVzdrR1hVMXlKaG5zZ2p4MU1aWmFHWElrTzJ5dVJxMVBjaks2eEFKMTNh?=
 =?utf-8?B?ZitkNnhBTkJVSHd6Z25JbmZ4L0lnZWcvRHcydHcyK0NWYWpZVTF6Y1FJWU5v?=
 =?utf-8?B?Nm8vRWN0TEk0S0M5U3RvVTRNdnpCNmhOcmVXWUFEUS9UTEYwcVVZU2N3bko0?=
 =?utf-8?B?djg1NGxvVThxeDllMjh0NlRmMU9icWVrMHh0Q0puT1hHdjFCYmJBYlRIN2Nr?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ca5904-476b-48d6-dd1c-08de2ddc5f5b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 17:42:45.0044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BJIFu2B+S1zNkRPa/Yb7XHSge3E+fSE9a222FkLSgmT0sw5em9zsaZycyyvmRNytnz922UaVsMk4ngpNc7Y3eoxK96swMmuYWmcpTd7Xu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7376

On 27/11/2025 7:58 am, Jan Beulich wrote:
> On 26.11.2025 18:56, Andrew Cooper wrote:
>> On 26/11/2025 4:55 pm, Andrew Cooper wrote:
>>> On 26/11/2025 3:07 pm, Jan Beulich wrote:
>>>> On 26.11.2025 14:22, Andrew Cooper wrote:
>>>>> @@ -1075,6 +966,112 @@ static void cf_check fam17_disable_c6(void *arg)
>>>>>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>>>>>  }
>>>>>  
>>>>> +static bool zenbleed_use_chickenbit(void)
>>>>> +{
>>>>> +    unsigned int curr_rev;
>>>>> +    uint8_t fixed_rev;
>>>>> +
>>>>> +    /*
>>>>> +     * If we're virtualised, we can't do family/model checks safely, and
>>>>> +     * we likely wouldn't have access to DE_CFG even if we could see a
>>>>> +     * microcode revision.
>>>>> +     *
>>>>> +     * A hypervisor may hide AVX as a stopgap mitigation.  We're not in a
>>>>> +     * position to care either way.  An admin doesn't want to be disabling
>>>>> +     * AVX as a mitigation on any build of Xen with this logic present.
>>>>> +     */
>>>>> +    if ( cpu_has_hypervisor || boot_cpu_data.family != 0x17 )
>>>>> +        return false;
>>>>> +
>>>>> +    curr_rev = this_cpu(cpu_sig).rev;
>>>>> +    switch ( curr_rev >> 8 )
>>>>> +    {
>>>>> +    case 0x083010: fixed_rev = 0x7a; break;
>>>>> +    case 0x086001: fixed_rev = 0x0b; break;
>>>>> +    case 0x086081: fixed_rev = 0x05; break;
>>>>> +    case 0x087010: fixed_rev = 0x32; break;
>>>>> +    case 0x08a000: fixed_rev = 0x08; break;
>>>>> +    default:
>>>>> +        /*
>>>>> +         * With the Fam17h check above, most parts getting here are Zen1.
>>>>> +         * They're not affected.  Assume Zen2 ones making it here are affected
>>>>> +         * regardless of microcode version.
>>>>> +         */
>>>>> +        return is_zen2_uarch();
>>>>> +    }
>>>>> +
>>>>> +    return (uint8_t)curr_rev >= fixed_rev;
>>>>> +}
>>>>> +
>>>>> +void amd_init_de_cfg(const struct cpuinfo_x86 *c)
>>>>> +{
>>>>> +    uint64_t val, new = 0;
>>>>> +
>>>>> +    /* The MSR doesn't exist on Fam 0xf/0x11. */
>>>>> +    if ( c->family != 0xf && c->family != 0x11 )
>>>>> +        return;
>>>> Comment and code don't match. Did you mean
>>>>
>>>>     if ( c->family == 0xf || c->family == 0x11 )
>>>>         return;
>>>>
>>>> (along the lines of what you have in amd_init_lfence_dispatch())?
>>> Oh - that was a last minute refactor which I didn't do quite correctly. 
>>> Yes, it should match amd_init_lfence_dispatch().
>>>
>>>>> +    /*
>>>>> +     * On Zen3 (Fam 0x19) and later CPUs, LFENCE is unconditionally dispatch
>>>>> +     * serialising, and is enumerated in CPUID.  Hypervisors may also
>>>>> +     * enumerate it when the setting is in place and MSR_AMD64_DE_CFG isn't
>>>>> +     * available.
>>>>> +     */
>>>>> +    if ( !test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
>>>>> +        new |= AMD64_DE_CFG_LFENCE_SERIALISE;
>>>>> +
>>>>> +    /*
>>>>> +     * If vulnerable to Zenbleed and not mitigated in microcode, use the
>>>>> +     * bigger hammer.
>>>>> +     */
>>>>> +    if ( zenbleed_use_chickenbit() )
>>>>> +        new |= (1 << 9);
>>>>> +
>>>>> +    if ( !new )
>>>>> +        return;
>>>>> +
>>>>> +    if ( rdmsr_safe(MSR_AMD64_DE_CFG, &val) ||
>>>>> +         (val & new) == new )
>>>>> +        return;
>>>>> +
>>>>> +    /*
>>>>> +     * DE_CFG is a Core-scoped MSR, and this write is racy.  However, both
>>>>> +     * threads calculate the new value from state which expected to be
>>>>> +     * consistent across CPUs and unrelated to the old value, so the result
>>>>> +     * should be consistent.
>>>>> +     */
>>>>> +    wrmsr_safe(MSR_AMD64_DE_CFG, val | new);
>>>> Either of the bits may be the cause of #GP. In that case we wouldn't set the
>>>> other bit, even if it may be possible to set it.
>>> This MSR does not #GP on real hardware.
> I consider this unexpected / inconsistent, at least as long as some of the
> bits would be documented as reserved. "Would be" because the particular
> Fam17 and Fam19 PPRs I'm looking at don't even mention DE_CFG (or BP_CFG,
> for that matter).

You need the even-more-NDA manual to find those details.

Reserved doesn't mean #GP. It means "don't rely on the behaviour".

>>> Also, both of these bits come from instructions AMD have provided,
>>> saying "set $X in case $Y", which we have honoured as part of the
>>> conditions for setting up new, which I consider to be a reasonable
>>> guarantee that no #GP will ensue.
> The AMD instructions are for particular models, aren't they? While that
> may mean the bits are fine to blindly (try to) set on other models, pretty
> likely this can't be extended to other families. (While
> zenbleed_use_chickenbit() is family-specific, the LFENCE bit is tried
> without regard to family.)

The Managing Speciation whitepaper says "set bit 1 on Fam 10, 12, 14,
15-17".

It also says that AMD will treat the MSR and bit 1 as architectural
moving forwards.  In reality, on Zen3 (post-dating the whitepaper) and
later, it's write-discard, read-as-1, and this is the behaviour we
provide to all VMs.

The Zenbleed instruction say "set bit 9 on Zen2".

So, the logic in this patch following AMD's written instructions.

~Andrew

