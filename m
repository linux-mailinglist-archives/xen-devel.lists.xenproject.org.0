Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2060CADC94E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 13:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018169.1395098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUTq-0001uM-Iy; Tue, 17 Jun 2025 11:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018169.1395098; Tue, 17 Jun 2025 11:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUTq-0001sK-GA; Tue, 17 Jun 2025 11:27:54 +0000
Received: by outflank-mailman (input) for mailman id 1018169;
 Tue, 17 Jun 2025 11:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQMZ=ZA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uRUTp-0001T3-6a
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 11:27:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2418::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aa49400-4b6e-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 13:27:52 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 11:27:48 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 11:27:48 +0000
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
X-Inumbo-ID: 1aa49400-4b6e-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClfxftURnuKe3l6kQXevRkytCcKzyZn4Eo5nRif4AQqtF8nXALaqannUuKe+xKKBUun5ZDPXuupwohibfM4zCBx6g0HRryrFTGaRkMCn5vUYNrn8XQP0Irqf0LifWYdP3F07MtyFp9MxzEgfzBDv/zcPPl4oZWCkD3ZIk5GllP0sHSOM00aBAar7RLxavtJoULUo7RqPlNWhQP7KxkpDEUCC2uBVZq7jKhqJ+ZET4pSOeL4/1M9ZLuz5Z0RWH6qmudj48rwNZaAjYaWtgCooirEMlJiRzOsnStqGuA5abQ6sC5yY3AT9piVJRDbXn0Kr7Zh0Tb/SEJ86fWb9wdLpxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzTRSgf7Noak51by0NfK64ahBcITKG/+48ydLW45mTs=;
 b=xMGRR5SLPs0yRAgtVJiPf4mqzWkh1NO706Wx+dHkvYMhC77sgsugdb4oPB1o2XVebupm56HnvTMVP0+JP1haCXOIptTlklMwmrgtgFZUfUWt3pJvFlfMGIcnNzIedapOWd7xe+pYziZ1Z6HFcctm8sjsYxzO7Em7TUxoUcuOYV5gcQupDVxlFJWw/UTsDddDCwou9fPsBbdHg5iHae899qhbBUJhovQ3GCBaHCenHmpXMKAYguSrbEOc5M3jvfVZ0ba8SETZSak/V7O7n9m24yk97peSZDq5TYp3CcGuYNsook5gqIx8sFrOBmUMQjrot+I1I9d7stcYRjSqPTO8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzTRSgf7Noak51by0NfK64ahBcITKG/+48ydLW45mTs=;
 b=jP78K1QeYDV4YGcQ9cRJCLvYpnJ+yv25N+HCD9pbAS8ijGlENkBk9j7mWiBvJzc20W2dEL4EyGcymAeZRF23FWFi1qRfNj5D424ftTs0z9sDTp1RFUdrBWqQKIR4MBFpaX1Z3reb9VrAKvIwkJCqvt6OVRQIwnFx2LJQPB8e8ME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <dcb331fa-f4e6-4bff-bad0-c3a0e4c771d9@amd.com>
Date: Tue, 17 Jun 2025 13:27:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm/mpu: Define arm32 system registers
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Hari Limaye <hari.limaye@arm.com>
References: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
 <20250617111251.1711553-3-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250617111251.1711553-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d7077c-7431-43a1-f9b4-08ddad91fd1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjBramZ6OFJleEJpQ295eXVkYWVqOUtRMXl3ZlhQbU95TmJyUTYySFRUcGk2?=
 =?utf-8?B?eWxKVFlHQnhwWndDaXBhaE4yWHFZSHNsZlAxYXVDb0lPS01sQWFnTHBNckg1?=
 =?utf-8?B?NUYxZ040TmRqZnZRZzVVaGF0a1F6bFFjTS9sQUVsS3crZzBwQjR2RnRJVFl2?=
 =?utf-8?B?TXYvRkJjUVh5WE8rS0FOcGhtZCtWVUVVbDhmRGJmR2RpWDNBNWtOZlRLbHdP?=
 =?utf-8?B?azdUZVRQNk1iYjNLbnpFYkI4QWJtdUllS0lucjZiQTcwMkpibmRvcXFnUmha?=
 =?utf-8?B?SU9FSHhZVWZna1NaemNBNzdFZlYvelY3cE5lVDBEdlBOaGNDK3BlZUN0L3dI?=
 =?utf-8?B?dWh5OU5vODg1OWhicTFxdndUSE5nLy9wT2N2dVd3WktPM3JnSXVXNVlVYWZW?=
 =?utf-8?B?OGNEcHl4NXZyNUNCQ08ybEtVUEV0bUNIdzNKNmZQaDlrd2dMQ0dpSHJIM05h?=
 =?utf-8?B?OGJrYXJSbE1FYThnVE5WZ0loUGRZaUMyc09zOEF0Zk9oc2RiYzUxMXJUNzZE?=
 =?utf-8?B?Z3Z3ZFRjWVJrZVVzMFgrRDVVWDBZRXdqdm1BTkJHbU55WVU4VHpIY2VMdlRq?=
 =?utf-8?B?eDN3WDdHMXY5SmFmR2lCVGFETGtSTExOekpPeUZUMGJEcnlhN0lIWnptWWhu?=
 =?utf-8?B?VldmZWtsV0JFcm1aMHdMNnl2Vml0TEJKZzNlNWFBT3hsQjZhMUVQazB0Uk1R?=
 =?utf-8?B?cys1VXk2Z05QcVlaZU0vZ3NNVHVxYjRJelFIeGEwRHQ3YTNWa0xUdk82Wkpy?=
 =?utf-8?B?ZmhvNWxzQ0I4Qy83dFI1Y0l3SkZnSStveFh3T2hiVTM2NDlqYUQwZzlCVlBj?=
 =?utf-8?B?UUVIUnRhbjRhMHhxdWlic3lFOS9UVlNGTFc3SnB4MHJhZEFtcmQrWitmMExI?=
 =?utf-8?B?Z2pEbHVocTdUaDd4cFZGRTRPK3g3VjY3K1ozcWVXZ0pVT3YzYThlTDdyL0Rt?=
 =?utf-8?B?TU1nallmL0l2NTFLbXN5dnRZUDdmcEIwTXdxbWlJYmZ1c3hScGRBbk5uWnJq?=
 =?utf-8?B?NytzamRCdVMwaFgwN2xoQVJOa3FJeDhvUUorYWkwaFJ4UlZKWklqTFhuZCtW?=
 =?utf-8?B?V0VZSUw4d1A0UlMzaUxrdGhVZjRhcW45eFdONm1vcVZMbU1EV3ZFd0ZIYmpi?=
 =?utf-8?B?TDVoSndQVUhFOUpZeHBLLzRsRGMwY0I2QkpIMDVyZmtnTFh3L0ZDOG9CcWYx?=
 =?utf-8?B?YkI5ekxXa2ZXeGVTUGtKclFiRU9LYkdkWWFCRDFvWS9IY0RYRnB1TDhVNEJH?=
 =?utf-8?B?TXc0QnpXMjAwSWc5SDFOMTV1RWdHbk5ZS3NPU1NMUWVaOFIrTGNFWEdNNVlm?=
 =?utf-8?B?aWE2ZDU4TWpRZGN3NkRra2FIRjR0M2xvZHNPSEZXb2hIK1B5cE9nRFhNSDJ4?=
 =?utf-8?B?ZVk3aHRqTnBwbHZLdEdRa0k1dzFFcHlINU1CMCsyeVllMEs2c1luOXp6YStH?=
 =?utf-8?B?cWY3MTcxT2xmckJDZS9XejZGZVVHYWJQZnZPNndPSURyQ25qZGpFb0JGWTZI?=
 =?utf-8?B?bW96bEIvcTlQS0gzWnduLzhZdVNUQU1ncWV5ZkFmU1RCYStQSEpzODEyWU5L?=
 =?utf-8?B?NnJqRUNnS1gvZDFyc2orelhkcGtIdkdsY0VTek1YNHpzT2tWcElXMDRBaXpX?=
 =?utf-8?B?a1UyQ1YzVnlRMGJyREhwWDk4L3RMTWNiQ3gvQ2tWaTFVTXlRQjRyWnBTT3JN?=
 =?utf-8?B?VGgrdHZBRDR1cVhqRENScXZ4d2QzeGUvbmRDM1Y4NzFvOFh1aGhKWVorSjJy?=
 =?utf-8?B?cnBJa3BldDd0b29SSnZkVlNzQzVjTzczc1p5SUd4K0hLdW5BazFaU0N3L3BU?=
 =?utf-8?B?U2s1dE1ybjhrcjNPclNmcDZwQzdvd05vdTZUT3BTQ3RNWS96TGhvZXFzbVY3?=
 =?utf-8?B?dHg5L0ZiK0MxSnhnYXlyM1FPQmY2V2VmUlNFOTNESTBwdmVHRGJUSiszWFRs?=
 =?utf-8?Q?pNLtH5iKPsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjBEaTIxMXczNklTYjBFV0dDUW8xbmZySlpISzFuY25OR0Y3eDFNMm14S1N0?=
 =?utf-8?B?TEVsdnZyOUZyQ3dKdVlBUG04RHhZSEVzTnlIWmtZNHQrSnpoQ0ZjL1A1V0ZR?=
 =?utf-8?B?Wmt2Ylc4YVBZWEZ6TVdSU1NyN2tEODVlZlZRUndIQjZzTlpoRVRwM1JUai9w?=
 =?utf-8?B?Uk9JYi8vWGF4djdaTkNvQXQyYjJ6eGcxTFNLak9JdzFONkkxVmJmQTUyb3hW?=
 =?utf-8?B?NEVCR1NDRHlIMGp3NGlKaS9XcHpPZEpjMUtjcUdqZTA2Z2gxV0xRcmxpVVJV?=
 =?utf-8?B?REhzRGxsajh6a3V2ZU1VNDBNeU1jU3YydTMzcnNZYS9EbDJISGswNEpJaVBr?=
 =?utf-8?B?MGlpNG5CWXJOVk5UajJEcnh6MEJLc05sUW5reVJqWWNyaDFRckp0ZDhwMXdW?=
 =?utf-8?B?RzdUSmFsT2VVbzVjTGkrSjhoRFZXWGxPcDFJWE1YQU81eWRDVUhYZytqVlkz?=
 =?utf-8?B?Q0RIZ1loR3NuRmZtVVJJUzBnMFl5N25RUWxpRTNYYUlRcVpjaE5CNk01NnAy?=
 =?utf-8?B?dWtMMnJiM241dEEwL2NSNXNrbTNpWjFDVG5OeDJsOGlod0dSYVh2L29QbTlG?=
 =?utf-8?B?YWR1YXFkY0hzTDV5dnVzWko2OGNPZzJhd3hqZUtrVnRuT2pKMGJDdHVGenYx?=
 =?utf-8?B?LzlrbkxhTlFPNlRwdXQ4YVFsRnJwUFpNaWtiRlNnMzRFdWJyRnNjVi9hb3k3?=
 =?utf-8?B?ajJST0Q5RmFoeWt4dmdLWC9oczNzUGhkbWU3ajl3VUJFSXg3YVJ0dXc3aW8r?=
 =?utf-8?B?bzAremp5ODV6N2h2aUpXVVJxeis5YjBZaWs1MUY2YUZDaEM2QUVVTzQ4Ykkv?=
 =?utf-8?B?am5hVUJMbGNXZVhWZ2VXTDNya2tjS0xWeDFCam5NVlpDajhxa3dLOW9oSHdv?=
 =?utf-8?B?elRlWWdVbDJLZThTbHpDb1hFQ2phOE9JRmU3R2tSa0YraFEwTVg3YUkxMlFO?=
 =?utf-8?B?NFdlVUF3YlpWdVpOL2NLTnNQVzAvY1RSUndmekUyQTVRVGhveGN2V0M2OENG?=
 =?utf-8?B?dk1hY1lxVEw5c0tOQno4NHJheUx1YmVvOU9VUjdhSE5BSFg2ejVsNU9mUWt6?=
 =?utf-8?B?eCtFSGdSbTNKUnU0WnZYWldCR1g0TElaQ3ozWUVxRlNKZzRjT1FkQTJENXB0?=
 =?utf-8?B?WlJwMjZoWGs0QXM5UmZPSFBScWovOXExbXBHdVREUS91cFkvM2hYc20rWlFO?=
 =?utf-8?B?ZEg3aGorUDdJemNUR01oQ2ZyYnREOG9BaUlMT2NQWWNvYjlmaFB6czF1cEhV?=
 =?utf-8?B?cjN2UW5ZR1BXMGtqM1IvQmlyTCtDalVPbXZRbFZLcnE5ZnVVUE82VG5jSi9m?=
 =?utf-8?B?ZlZkZVU0Z3g0d2prWXE4bGI4ZGNFWWtLZExiVlBoR0JrSU9lUTZEWXM3VS9P?=
 =?utf-8?B?b25QTDJUMHVTMWFWeGdvTDdlM1o1NnFLcy9qbS9VZms1ZW5qT1prMUtSS2NC?=
 =?utf-8?B?Z29NMUZ3aVBNL2JuU3E2UTF2TVZKVmRVdFRYa2dBa3hLTy9ucHowVlQvOVQy?=
 =?utf-8?B?eTdUVkY5REtSTSt1UW0zcUpYc3JCb3FzUFVjR0xIS0doMEkxcHBEWUsxVjd3?=
 =?utf-8?B?SXM0ZTdPMi9jeXovejVpVlNJc0w2bnREcGU5YTUvK3VpejRqOFVRYW93amh2?=
 =?utf-8?B?SGRmQVBsWURMai9FMjg0RTBHYmMzaE1zT1Q0N3lLYW9IMjNWKzJCNXlWUEVB?=
 =?utf-8?B?U0plRUwyMWdkVUM1R20vLzRLUmxsaXhISng3eldscXBPdHg3aVYyS2RVd2NH?=
 =?utf-8?B?Q2l3K0N3WE5FRERYdGxTakpObkZZd2Z0K01JWHE2Z3NRdlJJcUZYU3lQSFY5?=
 =?utf-8?B?aFp2cTV5cGcwWVM3RWFlU0MxbGc0YUlyeVI4M0s5VStKdlQ3OHczNkUxMnAv?=
 =?utf-8?B?L3lDdFhrSWtleVR6bDk4bjZyRThKY2tNNE1tRnFoNEdSQk8vazdqTlRWYjRp?=
 =?utf-8?B?NHhtRWgwY1lnR0o3UmorTk5vZTVtbWkrR3FadHFWVTEyTUFzMTI0b2RhNjBJ?=
 =?utf-8?B?bUt3UTJoSnVpUkNvdnI4a1VNZldDRUlKZzNaMHkrUUpRcmN2c2k4NmpYaVMy?=
 =?utf-8?B?YUZOR3hmajludjVWb0E0UU1QR1B3d004a1dDd1Z4SDIyTDdmYUtoQnBkWit3?=
 =?utf-8?Q?cZVoPvrh4vRB4HpjzXw+9jzBz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d7077c-7431-43a1-f9b4-08ddad91fd1a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:27:48.6825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhDuqmtnljJRhZRaTk4/n7iypNG6DPcIvI+Lizmr6DkozOcY2oLv9nABFXv/YFif
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012



On 17/06/2025 13:12, Ayan Kumar Halder wrote:
> Fix the definition for HPRLAR.
> Define the base/limit address registers to access the first 32 protection
> regions.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Hari Limaye <hari.limaye@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


