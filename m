Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC05E998E50
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 19:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816391.1230605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sywye-0006JR-Mn; Thu, 10 Oct 2024 17:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816391.1230605; Thu, 10 Oct 2024 17:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sywye-0006H9-K2; Thu, 10 Oct 2024 17:29:28 +0000
Received: by outflank-mailman (input) for mailman id 816391;
 Thu, 10 Oct 2024 17:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwpE=RG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sywyc-0006H3-Vi
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 17:29:26 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20613.outbound.protection.outlook.com
 [2a01:111:f403:2405::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 314ca20a-872d-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 19:29:25 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 17:29:22 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 17:29:21 +0000
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
X-Inumbo-ID: 314ca20a-872d-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouEuaaKEDSVvphgpcIVvO2FLLXFQufCQuha/GGBpViVEO1C7etC8PA+j1yOGh4Cx1Mx061t05E8ZGdZwOtUnfDVDfLXJ/k4xwtL2ODOa5tEMhT7f+xHIBYZesXpn2UUab+bkZx9uI2qlh3+Tpj2IKzQhkvih4+4zSb5AiAm5Lf2+BGDS781IfhsyxGZQKO9cRUhdc8BI1zgz4MAAvjlpxxmjj9gE6IOP7JbDVibke7picKnAkCYwqh1YWSexM14aAUiwPL4Czk6WnzBYcOMopglBw7AJCwpeRfTPGYxcxiXnvpDsWlHQM8Z8cAPcxR6WI2WjuLjX9j3PVbTlIZ8m6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTw36t781ixUbjMP6yGLs7cl7133CZnMldR3pg86t7o=;
 b=pMD3w6WViS1h7oW2EFkEjBQeulNekMsTsU6/fmrdpeWjkUs280h/m0DH2BOiHN7CPsrgi9Aoq6ETu/QfGr/ezbBB6QUMIP04suS7QxRu9AsQAe/Tc1+dWZ26QUGN+5+RFkiUnat//PF33MiPgUv4gDrgOzAkKWjhOokCQJ93b1GDTl12Nd6TGV6+qQBmb/1rE76z1jgH2vTuVd9lS1G2KW4r7xB0MfrfB4Tg29OAl9m00PpyPFulMmdTg6zGld2gktUZycE6+sphpL2CfJ8aAvJuDNe3bm4fOny6VA4KU4Q/02GMX2+wpeLZierXEJTw7YuXlLa45vdaxkHl/mD35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTw36t781ixUbjMP6yGLs7cl7133CZnMldR3pg86t7o=;
 b=PC9jhJXgvVd4G7hHj+y4TpNz7KoXowXPgQKExv+AUzwaslLkNem9+9a5cYjBUsCqhm4vG4D9W1X+c8N1C9AFA3okEzPp2xs/FlGeBRJ2NYLufszMl111FJiGTiFqyq6Z6Td/CaQlshCw2jJRCWRhh1g7SS3CPmjSf2GkVn0CVNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <829c8ae2-dbe7-4ae7-9f4d-1ab996e27df0@amd.com>
Date: Thu, 10 Oct 2024 18:29:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
Content-Language: en-GB
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-2-ayan.kumar.halder@amd.com>
 <CACHz=Zh402HGV-=5Lbm5auZS0qX6KXH7ZPHvT3WUZ=EjJ4JE2A@mail.gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <CACHz=Zh402HGV-=5Lbm5auZS0qX6KXH7ZPHvT3WUZ=EjJ4JE2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::7) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH2PR12MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: 74277f8a-a1ab-4cfc-5dce-08dce95113d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmlRSmhOZEpSaFR1K2FsYXoyd2NpTGhqY1BkMDNCZzZEWTZPa2wyV2VrL3h0?=
 =?utf-8?B?dFRZWmRHMWJuR1VaZm92NVBOM2xKSDZST0ZaR0FjdU5zem9hMnJvK0RjK05Q?=
 =?utf-8?B?U3hnblRHaDRxZnlxZnRvaTVHZXhIRGY2L013VHp1d3IxOUtQSVVESGxmRXlK?=
 =?utf-8?B?bm5iN2tJc3lOak9SYlQ3eTVuWkNQTVpwYi9BSGtJL3dRbmp2TEd0Q3RCWjBw?=
 =?utf-8?B?TkYvbFpVS3hYOVN0Q05ZVlNON3YrTlJpR1lvcy9ZOXpPUW81QU1vWU42TnRG?=
 =?utf-8?B?M3hUYy9FVnhPOW5TUThYd0tpdHM1VmgvTmFrekxNWjJBOTIyK0VRQ2ZOSVo1?=
 =?utf-8?B?S1JRQUllcG5oTGxCRFVRa2w4ZnBhN1FVNHUzYmdTcHdiRXFVTHg2UXV5TXpI?=
 =?utf-8?B?TWFIY0tUSFIxcHRkS1U2SXYwT0hoei9sOXJPMEEyM0tMeVh1aGtRb1hqcDE5?=
 =?utf-8?B?WlE4NG8rVjM2a2c3Y1NPMklQSDdrbHR6QVkwVHp1WEEybWpMVlhQNnJPc3Nt?=
 =?utf-8?B?Q2JScitTU3JSbGUydytKMC9VVUd3d2Z3UjF6aFRQUTVDdWhoL1F2eHd2OVV3?=
 =?utf-8?B?NVFqQStQZkZwdzIzcnJxQ01WVUxHRU41YWhaMDRmK2cxazIyT2RRekliTUFP?=
 =?utf-8?B?QThlV0hxSEhsVThrN3JXY20vWm5mY013eHlKYk5mcmE4OERxbFJJWmI5Q1Uw?=
 =?utf-8?B?Z0g2VmNoZ1oxdHNwRi9KL3N6czh5TldmSFV5UC8xWG9BMHhTNlR4QVg2QWlh?=
 =?utf-8?B?aXROYmdZdWhOaWVVclIzVXJ4MEVlNC90RXN0ekVQZ3hqUnhCQmpQTVJHK3Iy?=
 =?utf-8?B?cUE2dm8zdnBEazRockJMS1Axc0lnQlZPWTRlVlkwL21TQ3VERW8wK3hVOFUy?=
 =?utf-8?B?bnlaeDJRUnp1c2VlcmNNM3FLa290dW1jSjVpd2RuU1l2YThHUjFKOXZiMTVs?=
 =?utf-8?B?dDF6aDJjeG5hQ3NNMk5uNEo2MHBaZjRqQ25vR3ZyeVY1M1UvUWdNeFQ3dEwy?=
 =?utf-8?B?K3k1SWF3QUVVNDB4dzRBVFdBRlYrbStkL1htWDRmQmd6ZGdwNi8zTFduYlJi?=
 =?utf-8?B?V0UyUHFCTWdpMi9QUmZRZXVQLzNZdDJXZW5oMmRIa2habUIrVGtmMmp4d0JO?=
 =?utf-8?B?cUtvZldPVm1SbU1OcHNOUEpCaUx1bkZ5MUdqM0hETGp2ZmtQN3JRclFJWXJU?=
 =?utf-8?B?QnpEM1ZFdzhwd0Y3UWhKVkdyWElCVnNsUzlqREN6NFBBbXpOVUI5Wld6ekwy?=
 =?utf-8?B?Tm9EWGkzS3RTV1hndk40R203dFJua2p5YUIrRG9UMTVaSXhZNU93Z0JGMml2?=
 =?utf-8?B?Y1VHTy81SjdrMjVvRW50VUw0V2VsaHRDOE4zbWFCZzV5VFRualZ1U3ZDN1l5?=
 =?utf-8?B?WURnVDVTM1E1QUtteENudUJtRmhzaEgzMlBFaWhvcUl1dWloNm9mWGhvMmk3?=
 =?utf-8?B?dDhoYlNsQjlldUJ6emFoT3ZxbWNFRGQzWmZVZWNIVno4M1prcVpsOW9PelBP?=
 =?utf-8?B?emNjdGEvYWRyMVh5cXlLclYrRm9sNk1RUyt0eC80RFZBSVdoM2laQzY3dDhI?=
 =?utf-8?B?ZDFYMW45amRLeFBHYmlHaDUrWVlQQ09BbTR2NDlCNDcvZmdhOGV1bUMrRzdv?=
 =?utf-8?B?ZlY0NkVpZ01IV1NTV1VtR2p6WTg4Y1dZRTN4ME5CQjNQWnQrdzZiMXRWWWtC?=
 =?utf-8?B?azFEWUYydXN3akx4TWJuNHI3Z1NZQkxWRUtIQ05HOEorQXdHQVpaRTZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TE04OEhmQzErbzRvMmE3OEs3d3ZkaHVaWC9COHNNSTZkS256K3hGcHlvUUZ2?=
 =?utf-8?B?QmFSUGZBaHgwZ2tPUkcybXovc25semZpWnJxaVpWOTk1dG0vTUZKWmZTeEdW?=
 =?utf-8?B?dmJKZ1ZZdGcxQ01TWHFFc2RMVjlidjI2RFlIcXp6VXI0Q2JBSk5aRHQvY0gv?=
 =?utf-8?B?RmtTMkRPcWJ6RTJtbXVHRzQvYzFVUHVwS2hMVFNQUWhUNWJOaHc0dDZ6MTZq?=
 =?utf-8?B?bnFhdXdIS2piaTM1cnJNL243T2Zzdk5GeVN0U3phR09hRlMySnhnNUgvMW10?=
 =?utf-8?B?RWlvZEU1VlIwMEFxY3dCQVk1d09Ubk1kdlloa0c0dTJIZ0hnWUVkYThIbDlB?=
 =?utf-8?B?REVsM3NWUGlLQVJ1em4rZldndFdPc3BqWUpuMmhCSjNabTBES3JHazgrOWNV?=
 =?utf-8?B?bDZuMXBNTHNiWk8zSzN6NWovbFFOS1crM2pXMWJudTUxa0dPL2J5QUhxU2ox?=
 =?utf-8?B?M2YwWitBRWxKVndlVUdPdjRoR3JBNUpxMFNvWTZ5dUF3OGZkK3NveGUrcXZs?=
 =?utf-8?B?cXQzVlZQa0tlRGZ0cXI0T1hmdktPeHU3NktyVUlKcy9kVWJpUm02czQvY25m?=
 =?utf-8?B?ZGF0QVRNYzljbm5oTndlaDFKQWx5aDFBTklKelNpZ1ZOcjJxNVFIcmQ5T2N4?=
 =?utf-8?B?VlVTTS9wS0RPWFRGcndRbW9JU0EvUEJLSkRwNEt1ZEp6Lzg3SjFUTVhDMWdq?=
 =?utf-8?B?VEF0VmIwTEhwTG5JL3NxbGgyQUZoMmgwSTVzK1dHcXpiRU9iUG11dUcydHgv?=
 =?utf-8?B?WFYyVDQxczlERFJaMy9xdEVpbDIzNTQ4RDBjVm9ZR294NUx4NzQreThwMVhK?=
 =?utf-8?B?UG9KbFBRWFFweVhIZzNGcmhMdi96RXNsRkZTN2tvYzJGbnU0NVRpT3lqWmVE?=
 =?utf-8?B?UCtEUk95YVV5TXduQzl2Z2E5VnYzK1BHQkVuUkVKZ0s4OTBORkpXQkJQd2lz?=
 =?utf-8?B?UmdSU1huazg1cHpTS3RqSGN3UHNZaW1FelJYWTV3VHp5NjFoOXd6aXduM0hW?=
 =?utf-8?B?SlQ2eGtSYXNZSkNQRnYvL1Z1Q2U4Y3V1SzhvTUFYb1RqK1phZkl5eXRmM2FM?=
 =?utf-8?B?VUw1TEdrc3crNHhFRWpoOG4zL3VBamlFLzlLTDg3emxiTC9TRkpGSHEwbkF4?=
 =?utf-8?B?MmdxdFJOWDVHN3gyVzRXaXozSlVYNlVVdzBXRGJjTWQybTRDZkRGZlZFWTIx?=
 =?utf-8?B?d2RxNXk2Q3BGU0dtalVuSG9ZNmNsbHo4dUxwaDVkYmNOWFcwQjVqaVZoa0ZW?=
 =?utf-8?B?dVJCSXBwVklnTStXVkpta0VxbHVRaXJxOE5wVVJtSHN0T01nS25pbmdMNTdh?=
 =?utf-8?B?MkdyMWZ1dXFKK3htckh2NkIvZ29nOHRTT1dyeWZwdkxSYW5FOFJpb3Z6a2di?=
 =?utf-8?B?bVdmUGxJRE9GL09NcTRhQWkzN3FkaHQwNVJxNTdnSDNnSmIyUXN0d0lGeDdC?=
 =?utf-8?B?cDJzeUd5R2gwRXRLeEszcXhWbUNsZkJ3VFVjY3dvQkZ3M1E0ekdmSEhxZVA0?=
 =?utf-8?B?Ums5UGJrbU1RUG9pWlV1M0xiY2czQWh1aWE5MlJybHZLM1hweU5aZkt4N1NW?=
 =?utf-8?B?WUM3dzdzbDR4UXdYcjBJZVB5cUlRWFByNlZReEVJZTVxZ20wa2s0bGYvOVM0?=
 =?utf-8?B?VE5ydTI1REZiNVpURlZmaVZaTmJ2Y1h5WHRnMy80WUUrTDZLM1VaQ2JYdmdI?=
 =?utf-8?B?dDd4Mit4U0p6Nlo3TGprY003NStOWE10eXlKU25oVEhaRVZVZ2Q5VWI4OHht?=
 =?utf-8?B?ZHlJVzRUdEtpMFFsRGJ0UldjL2pOQjV5d213S1RhZ2d2Z0NhWjY4cTVETnJh?=
 =?utf-8?B?aDFUcmRqOE5STllVOEs0eHp2a3RWek04YWpSTUlKbFNaZStMQzZKQjBBeHVa?=
 =?utf-8?B?c294am82V1ZRcW1HdHA3MmMvVmR3RXlsdysyV3pPeTJwV3Ivd3M2eVlZYjg2?=
 =?utf-8?B?WnF6TzNwSitVRkw0QW9ScWd0Unp1OUhXQTFsQUhmNk1mYVBVUzRpUjBlcFZz?=
 =?utf-8?B?eVRJUDZTYjFTcW4vUWRRcXhvYmMwWXdSWnRYaVhhTFczTnJSNzRqWXQ2MWRj?=
 =?utf-8?B?NGloRmFKWmJNTEpKQnBiZ0xqSDNpdG9mNWU0eHJLUlJDMDBGcEM5eE82L3l0?=
 =?utf-8?Q?csAaX3DmAXTvtvbqxxXRoQz7e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74277f8a-a1ab-4cfc-5dce-08dce95113d4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 17:29:21.6504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhoOtwdori9u1o3S9/dxj18cTAq0CEKduklJtIUupyCqzeaR/VAnI87bz6MvWwzbRgqdgBF+PTzb89A5OVsC+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4133

Hi Frediano,

Appreciate your feedback.

On 10/10/2024 15:43, Frediano Ziglio wrote:
> On Thu, Oct 10, 2024 at 3:05 PM Ayan Kumar Halder
> <ayan.kumar.halder@amd.com> wrote:
>> If the BSS section is empty, then the function can just return.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1..v2 - New patch introduced in v3.
>>
>>   xen/arch/arm/arm64/head.S | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 14c3720d80..72c7b24498 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -346,6 +346,8 @@ FUNC_LOCAL(zero_bss)
>>           PRINT("- Zero BSS -\r\n")
>>           ldr   x0, =__bss_start       /* x0 := vaddr(__bss_start) */
>>           ldr   x1, =__bss_end         /* x1 := vaddr(__bss_end)   */
>> +        cmp   x1, x0
>> +        beq   skip_bss
>>
>>   1:      str   xzr, [x0], #8
>>           cmp   x0, x1
> Why not just transforming the "do while" loop into a "while" one and
> just jump to cmp?
>
> Something like (not tested)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 14c3720d80..987f243578 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -346,9 +346,10 @@ FUNC_LOCAL(zero_bss)
>          PRINT("- Zero BSS -\r\n")
>          ldr   x0, =__bss_start       /* x0 := vaddr(__bss_start) */
>          ldr   x1, =__bss_end         /* x1 := vaddr(__bss_end)   */
> +        b     2f
>
> 1:      str   xzr, [x0], #8
> -        cmp   x0, x1
> +2:      cmp   x0, x1
>          b.lo  1b

I am not really sure if this implementation is better than the previous 
one. The drawback of my implementation is that we have an extra 'cmp' 
instruction. The drawback of this implementation is that we need an 
extra label and there is an un-conditional branch after ldr (readability 
is difficult). May be I am biased. :)

How does this look ?

FUNC_LOCAL(zero_bss)
         /* Zero BSS only when requested */
         cbnz  x26, skip_bss

         PRINT("- Zero BSS -\r\n")
         ldr   x0, =__bss_start       /* x0 := vaddr(__bss_start) */
         ldr   x1, =__bss_end         /* x1 := vaddr(__bss_end) */
1:     cmp   x1, x0
         beq   skip_bss

         str   xzr, [x0], #8
         b     1b

skip_bss:
         ret
END(zero_bss)

- Ayan



