Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80043B0574E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 12:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043939.1413986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcRx-0003vG-3Q; Tue, 15 Jul 2025 09:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043939.1413986; Tue, 15 Jul 2025 09:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcRw-0003sb-WC; Tue, 15 Jul 2025 09:59:49 +0000
Received: by outflank-mailman (input) for mailman id 1043939;
 Tue, 15 Jul 2025 09:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Lhd=Z4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubcRw-0003sO-0i
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 09:59:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:200a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dbfbcaa-6162-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 11:59:43 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN7PPF862C85B20.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 15 Jul
 2025 09:59:39 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 09:59:39 +0000
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
X-Inumbo-ID: 6dbfbcaa-6162-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szqSvJOVrTFoKX2cs0h/gnMsTOIaNqs7o6wL+iKo4D70OgCaLtHaXZ25L3ypEVNrkNJU3+9jQBfn5rK3vRX8JSEW7qT5S4OktZ8NLFeW4ehY9d9rHoBDkagAYIcS7AI5BF2g6tK655zrKbm75ebMwfHIir5EaRH8Jjl3lXdZbI4kLZcmksAp6/6qjhNh2o5RGiShvWwW09Ngg2q4S8oSGOyeWt4TqRa2Z2ljTs2rMiR1XRLjh+L9CwYQBOaEWOZS3o4nSkH9FilefT4QvwhwCdpR1glmBcSxSmVP90JtQooY7mh+OU00hyt+rzsKAhhAgPBi5I8nMYqadlxWXmst2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVdPxIvFWjAi1vxxi3/MX5dbad8orM456+oSftU6GVE=;
 b=S5Nlj7n+5mc6VeWK9CguMHFEndFFhakgQ9twJvCvJEwwaDkFBFDlM1xsigul5Z1mpIX06WcLggJYegKYrif54FycKCL6xOTTKF2LRbW/AKw3gdDjRJ8TMkUZ2H9/OWUibE73mm1ROC9J2qJcCpt5Vs+ByEs3jLbCgO4517yG7eBkuPSJvpi2rED5KvnzZ6vPiAlgFQoB+0WezwRX0E8bmi7wMCn8rT/NzX6I+fUnWIVc5UlmRwaUnrVPuD+AorShsoqFv9KdU8H3upbkIG9QtJ54hRt3q6qzfYMIvA4XPSuGTOeBWwv2clG7Juz6mlGL/F26LsBBXJvtfH0/NPjzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVdPxIvFWjAi1vxxi3/MX5dbad8orM456+oSftU6GVE=;
 b=arB81N9QYwwOZBKOiYvaHaU+X+fXoUZX4uZDOiXlKtdqBU6U3I2S7okUWtomqem5JKH8nz/8ivGPbgVeD+mkp9ol7XAttqAFKvpKlXnTMyTdlQBeIbGFqk3o0ilihWkzwik5jT459WuQvEVkE79hy133KDaEXmzs7Jazo0z+4QI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <560ba1b3-2118-44d1-a053-feb4e43b8108@amd.com>
Date: Tue, 15 Jul 2025 11:59:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm/mpu: Find MPU region by range
To: Hari Limaye <Hari.Limaye@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <3da52fda916ad2487ede9b193143d06debdcfc88.1752565274.git.hari.limaye@arm.com>
 <03fc835d-7833-4c1f-b061-da22a4ab9b75@amd.com>
 <515DCD17-B77C-4931-9C67-2D890D5B5E00@arm.com>
 <86068832-1403-4468-88ad-9d66066cb687@amd.com>
 <E4485C65-9A69-4EBA-BC81-04052E6B171E@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <E4485C65-9A69-4EBA-BC81-04052E6B171E@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BN7PPF862C85B20:EE_
X-MS-Office365-Filtering-Correlation-Id: 094ec064-afef-4b01-36be-08ddc3864ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzhUeTdiWnpnSWg2THNHcm4velByaE5nVGhERjV5RlZheTNyMzU0ZkE4Ymdl?=
 =?utf-8?B?K0xnZGN4TEExdzNNdTZRTUhRVFR6WDR1RHdxQXp4MWlwUDVaa3RWaGxPRytC?=
 =?utf-8?B?LzViRWkrMDkweGtEc3crdUdvRTl3Q0lDNVgyUWVINmRpUVQvZGhwRmdxWDVV?=
 =?utf-8?B?QzVtRkNXKzBhUFJ2MkdXb2toTHpaeXNrOXZINi9nNzI0akdreGhhQUdvazkx?=
 =?utf-8?B?TlVUMHZUWDJWaEJwQzl4RTkyLzdlNGJyQlBwbDNIdXEzUmlkS3ZCT3g0aTZS?=
 =?utf-8?B?amN6amFtZHZyU1p6N1F1bGs2bnJvWGpWd3poS2lBU3lLVndVWmVTNUNtV1ow?=
 =?utf-8?B?TVEwK2F5M21WSmgxYm1MN003ZzV6QjlGTDQ0b1FBR09NbzJZYThYb3FhdmU1?=
 =?utf-8?B?NGNSOHFZRm1CWWtzVVZFVnF3R0djcDEydG5WZmlGSy9vZzlNL0JRNlVkQVds?=
 =?utf-8?B?RStZRzVCd0ZUSU9PN0xCakxVRDNBckF3VkNmUGdxRzhBRktBRk4yc1ZRY1Jw?=
 =?utf-8?B?ZGVkN2dXaTBUS0NiU1NGTU1PMnBLOHB2YXJsenpiZURVZVlRRkRjNjhzbS9s?=
 =?utf-8?B?eXBPUXo2bDJFbkdXK1VGRUx3Z1BpSkhUZUYrS3htWXgwSjYvZXFhRFZBcnpm?=
 =?utf-8?B?Rk9XN1lTTWVaOUhXckpnNWJKNFFXeHl1V1pFZktaL0ZoUTJHMDlUZDQyZGp4?=
 =?utf-8?B?TDhEVDI5U0Nxd2lpL0lOOXdRbktJQnRwMnN5dVFPc1UxbmhWODZWc01HR1Fo?=
 =?utf-8?B?N2ZSUG1tNlJxTHhJa1RhL1YxSjJXVGdJSmdzVTBkakRzMkJJRHQrbmY1TTZH?=
 =?utf-8?B?eDM2dWhaeUVKVnNDR1ZpTjhFeS9DY0ZUdW13Ym5GQzNtRFpTeklHdEdhYlp5?=
 =?utf-8?B?VEVwcVk1bE9BNjNieFRGSUJwNmlkcml2WVF5NDJBRzNFT2dIM0Q1Q2xORjZQ?=
 =?utf-8?B?SC9VNWw4Wlg3bUhHR25HZ0ZMZVl6M0ZGUzJ0eHZVSU5UZFlFOTdqOFdxRlZH?=
 =?utf-8?B?MTIwTGc3b01yZHNWK09WdEpDUmF0S2cvMmsrbVoyUGpqa2JEYStHd3VoQ0Ra?=
 =?utf-8?B?dUhVZ3lCOXgrTHcxVlNtdFFEZXhDelBlckFKVzVKMmFtSlJQcHo2bjBncmcy?=
 =?utf-8?B?b3paY09LT21WK1hxQ0YvMk85bCsrRE0yZFBxOFRUWnAyQ2Rpd3dTTjJZbnRv?=
 =?utf-8?B?Vk9KdDFUemZVMlk1a0tab0Y1cHdBeEZyelA0M1BRSElSZzhxQmxVTE02NTVU?=
 =?utf-8?B?bGxCRnVmYWR2dW80U2xkQjhXeW96S1BtSkc4dVZ3WE1qZ2NxRnNUbXdTZjBv?=
 =?utf-8?B?d0M4cDJyRkhDQWc3UHRZd0srbjA5c1FEMU1UQ0I5eWlHTkF1RHBZOG9ubTF4?=
 =?utf-8?B?TXhJYSswVUR1Qkw2RWFIOG1qVkRaSVUrR1JXSkhHeFByN09NQjIwaE5GSWNl?=
 =?utf-8?B?QTEyeGZPeUQveE1sVEZrMmhCRGcwV21qN0ZQanUybmc4MjZBS0xYWWhBRzNl?=
 =?utf-8?B?M1RVQUVpRzJWeWdHYXNsMGtPRk1maDIrdjJGRzFjS3NyOFRlTG4remhOZUc2?=
 =?utf-8?B?Q3JJR3F0YlJXZ1dNWk5ZeE83QUlpVmFtcWFha2x1UXc3RzlYLytmVTZNNDdK?=
 =?utf-8?B?WGM4VTJNajF3UlZzY05OUDN3Qys2OE5IT1FUZUdZUFFsMlhaanh4MEdKekpw?=
 =?utf-8?B?UGpZd01CNVNQWi9PczJJSlovbnBRT3FlMGhZMnVYdytXMkxJSFFEdUZnbVpF?=
 =?utf-8?B?Z1NIdkZBeGE5Y0xVdXdaK0Z5aDFQZldTaGZUQUJQbEliZkVrMXE0b3M0eEZX?=
 =?utf-8?B?cE9qb0FkaG1sSkJ3bGVoalZkTzlaQTMvWWxuTEh6WU85R3h5NzFDTkZ6Mlpn?=
 =?utf-8?B?Q2k3S3RNUzluTG9hWmZPNk1zTVN4ODZzTjdORHh5QVVtS2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDlxb3UrUjdqNjM5Z2tselpyZ1dLanlNTzlycEhGNnlESVNSTXFkOVBEczZO?=
 =?utf-8?B?S0I2RHdsOFFuU3hqWm5PSnpGUlRtbUlub1BoWjA3UzBPOFppQVpzamZ2dGJu?=
 =?utf-8?B?R2h4UnRNVlRQcXBYR0NQajB6S2xCOHdzNDMxMUFSdktmSFFoSzdxcm5hU2Vz?=
 =?utf-8?B?UjRCeU9vV3dXVXlkSFk4Zy9qR0ludE5jVk9LazZpcFVBUzhXdmkxS0t6TSta?=
 =?utf-8?B?SFZNcnNRVW5hYVMzNUhxT2I2cVFYdVpWMXMraml6NWh6aXc2VnJwTzdwYnAy?=
 =?utf-8?B?YThmU3U1SkFyYXpmMXdlR2txdVpoaWxEOTVzeVV3MDl4NUpOd21nNXpQT1hM?=
 =?utf-8?B?NkFDa2Ryc0hlb0hRNmljZ3hNbWNzZUdsbnFyenlFMDNhUzNNZ1RtMEZMTEVE?=
 =?utf-8?B?bTVFa0FGYjFOZy90VytadUpKWUVNdVFTL0VDYkdxeTNpVlljNk9QRWxvOUw4?=
 =?utf-8?B?MzkzcldMWHo5TUViSUhyL0VKbzFWMTExbjkwbjl2Tm8xTDUyWFRWZXZOWW1w?=
 =?utf-8?B?TmNTa1J1dE5rbWpBVjArZk03akVnNXVTUVNTcG1qd0NOTy9KQ0FpOUs1OUp2?=
 =?utf-8?B?bFlhc1BHalJFbXRTZVlkUS9oWlFqQjhuYTZnTjJubXQwcjg5K1lHREZwdGR6?=
 =?utf-8?B?NU1LSG9EVytsRDZ3SkxIUTZCNHVabzNodERKRCs2U0w2SFdiYktIT0lOYXNB?=
 =?utf-8?B?UTZrNGRZTzN3dzlBMm4vVGtmWW1xbytDaUFkVDZnL0VUWU5vQnczcmF5YklE?=
 =?utf-8?B?bFZFQkRkREh2c1hUMWJFWnVrWXZJRWUxWXBmRE8rVEc5bzlwZXNkWjBURmFH?=
 =?utf-8?B?dDdETkJ2ZG0yNXlSSDM0K3BwREVBWmkrQzlOcjIrWnA2V29LbEkzd0lXU3E2?=
 =?utf-8?B?OE9aNVNKb2VzRk9LOTJkenJRdDhjZTZkOW1lRTRObSt4SDdDYXcwUDJaSUUw?=
 =?utf-8?B?V2dSaThxV1pyOGM2RElPTG1JTENvQTBrb3lmR0sxaTVid2RnSHlJRTc3MzBy?=
 =?utf-8?B?OWxXUTZKdjVPMHZ4bEswSVFtT2J0dVgyckhhOFpTL1BTUkRmVWJjbXBzemx6?=
 =?utf-8?B?RjErNlpzdlJveitPSXJPQ0h2bkJiQ3EweFFtTHljMzQvN09MQ0IvRHJIVDJa?=
 =?utf-8?B?cTY1UXFVbUg5MVdBSGZnSEZqc0FJU3ZXL1QwTTJmSlJYZmxoRmQ2Vm1iT0hE?=
 =?utf-8?B?cnozcGhsVGtRd2N4S2ovNzJMblZXbXJrUzgxd0I1SzE0b1RRWDVIVTg1QkZ3?=
 =?utf-8?B?Sk5TZzlmRHpVMG00bDB5VFN2UjhyaTZPd0dXUGlvU1hyaXJGclY4UnRGbXox?=
 =?utf-8?B?ZXZLRDdhS25Rbm1qT3FLanFaM0l4MENzaVhiSzBBVFU1c2NmdXY2N3pRd3c1?=
 =?utf-8?B?RjNuRFlrcjV2NTBjSE5LcXRkczlpbk9UQTZ6WTRwbUdHNEdZK05jMjNCdEdx?=
 =?utf-8?B?eGR0TEhaOTQ1ZUR0V3lvaUZ6cENTTU9xUXR1aVpHNTZyV2FMWkkxcXdpRFUz?=
 =?utf-8?B?NVlKOVB2UnkyV3ZkZ1NkYWNrSnArSUZ2dEtkNDlDL3NIa2p4UHYxaXBCNzNI?=
 =?utf-8?B?YTV5Q21UNXcxcStncDc5UzBNMTBTM3Z4Q2Q1VjJMNjBXNWMrVjZxZHgvMEJv?=
 =?utf-8?B?WVJhbmYzbHhoRDJ2QUIzN3Fxa2VHNjV3MlgrZnhIZTkwRlF2Y0xCUm9COWw2?=
 =?utf-8?B?aVlrK1Y4OXVaV1MzR2xNQVVxbUowWkF5NlpnMUNSalZjWU8xclNUWEozMXVW?=
 =?utf-8?B?Q3YrdHc5MGdoVGhKZjcxOUJYVzdJSTI3RVFCbTlPWGV1VmJ5eDZ6N3Bqd1F0?=
 =?utf-8?B?RDVzVk9jV1pFLzE0UDh1MHdkUVdueng4UmdLM05zVkhwWkkraEFhSVBJb3RU?=
 =?utf-8?B?QWlUb3pUeFRQc3FkTERVeDB6b1NrS1FFMUxoOThrWlI2L0ZkblY3ZWZ5d3Fx?=
 =?utf-8?B?b0lBR0JINmErcjFWdjJuVTk0MDc2d3R3WW1WTDdIUG1jMGhIUHJjcHpKUUpP?=
 =?utf-8?B?STJNc3AvQUlQZ0U0NldrWVhiODdlS1FTY01VS29CSG45VTk0dDR0TWw4eGta?=
 =?utf-8?B?YnJFSWF1b1FYemhLYm5rSVlFMUwxZHJqRTJhUmxydStCeVl5K3BaVFp1Z3hR?=
 =?utf-8?Q?QmBUnsET8P/gzsFXGBpECTLnE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094ec064-afef-4b01-36be-08ddc3864ff9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 09:59:39.3375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlrsNknCdcW2qGGiCQn9XN6n2QWiyI0Honcb8+1Wm0SwFxqUBYMs4/rZhdwKRpgs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF862C85B20



On 15/07/2025 11:48, Hari Limaye wrote:
> Hi Michal,
> 
>> On 15 Jul 2025, at 09:45, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 15/07/2025 10:36, Hari Limaye wrote:
>>> Hi Michal,
>>>
>>>>> +int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
>>>>> +                           paddr_t limit, uint8_t *index)
>>>>> +{
>>>>> +    ASSERT(index);
>>>>> +    *index = INVALID_REGION_IDX;
>>>>> +
>>>>> +    /*
>>>>> +     * The caller supplies a half-open interval [base, limit), i.e. limit is the
>>>>> +     * first byte *after* the region. Require limit strictly greater than base,
>>>>> +     * which is necessarily a non-empty region.
>>>>> +     */
>>>>> +    ASSERT(base < limit);
>>>> Well, that does not guarantee a non-empty region.
>>>> Consider passing [x, x+1). The assert will pass, even though the region is empty.
>>>>
>>>> ~Michal
>>>>
>>>
>>> Apologies, I may well be missing something here! Please could you suggest a code snippet to understand your expectation here / what you would prefer the assert to be?
>>>
>>> As I understand it, with a half-open interval [base, limit) as is passed to this function, the size is  `limit - base` and so the region [x, x+1) will have size 1. The empty region starting at the same address would be [x, x). But perhaps I am making the off-by-one error here.
>> Hmm, I think I made a mistake here. Region of size 1B would have base == limit
>> in registers. All good then.
>>
>> ~Michal
>>
> 
> Thanks for double checking. I notice you did not add your tag here, I wanted to check if you think this patch is reviewed from your perspective?
Yes.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


