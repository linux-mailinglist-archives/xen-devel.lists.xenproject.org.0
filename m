Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42180A80D2F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 16:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942241.1341482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29Wo-0001m1-Uo; Tue, 08 Apr 2025 14:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942241.1341482; Tue, 08 Apr 2025 14:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29Wo-0001kY-RW; Tue, 08 Apr 2025 14:02:14 +0000
Received: by outflank-mailman (input) for mailman id 942241;
 Tue, 08 Apr 2025 14:02:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23Rw=W2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u29Wn-0001kS-9i
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 14:02:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2417::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 109259f9-1482-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 16:02:11 +0200 (CEST)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by DS7PR12MB5934.namprd12.prod.outlook.com (2603:10b6:8:7d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 14:02:06 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%3]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 14:02:06 +0000
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
X-Inumbo-ID: 109259f9-1482-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d22ICyGbmwObLsB4SFQwSxrPI2Lmg+diCbxsRspbtvupsh44RJ3wNZtV3r2LXZYckXGuwnUHi4hs0ua1dQrPT74P9sDxmoIWs2XKUeecoPt9Z8IQvcPa2LFTk8bX3DCVtI9uCzufayu3rDGZUibryMbusBqf6xAAuSkAE4xSuLky4+Vc2zWpadShxFH96cA6eLaw9eA9D5LMeZzPiNPADM6TCVGGzNpBLDQA0cuDHGcvXzNzahvuSO3+S9hdWSQxn4Yg//Vcc/NJVU3jWuCmZ75ll3LDsvKg44TMSy96/mMXAOGBTWuj3ledIicxSMjklppk0f4bDt0sR3oEIxIgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsGpqAUdE+qVRS3vgIY0oo92pll/4k2La8QfbSwDGV0=;
 b=Jce7oWuyXRRg5zYqmP6RoMXK7XdovpU05lwbS6oRdi6fSBepsJ9v8PVC6YXN+VMlDCJL6+O39G0ROP6+dpsZQynEWC8zuJFQ9WygNOyNYyalirwjQXo4STU3jlHBQmSpOUh9n+CX7jgVG9c8aD9jTcdBHfJ5WlhCzN7uWmJLNNqXGSiIk8fn6eSmZpwkA2LWlgynScUl8tKoYMOklqEdJ3wT06DBC3uniziGSpTr+x0Sdve9n9wuZaoz8C/HjMg6iFf4ZFFzoxtTFp8I9Ad2PsUOD1yJchoYz8RaQeRm4iSjDqmV8v1zKmreyNHzKAjU8hVkmMftsKPFqPZ+TenKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsGpqAUdE+qVRS3vgIY0oo92pll/4k2La8QfbSwDGV0=;
 b=VX85Vf74etoxPWWcDQFCkwiL+2C9o4NumnD7OAK3oOd8EnvZ+icgy9mAC+AdN7AuA9/fIoKkN+JPnfOU6axFzPf4RSBOf0hw1d6GTxYwZ1y/5QLAQAE20C2YflD/Fif62J+Uv0z34BBpPSmp+hZBKiRgBZ7V+8b2LQZdU6fAiho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
Date: Tue, 8 Apr 2025 15:02:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250407091430.2342709-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR02CA0005.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::10) To MW4PR12MB7334.namprd12.prod.outlook.com
 (2603:10b6:303:219::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|DS7PR12MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee73c0a-0f36-41df-7584-08dd76a5f237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ams1L3Fod2pSVmZiM3FVbEtHaGR5NE9Uc1E2T0NodTA5MEhseFp0WC9KcU5k?=
 =?utf-8?B?SzIzSFp2SFQ3L0VCV2lRU3ltZllsM0x6RS84aHpFL21GSllpZXg3dkxlTlVv?=
 =?utf-8?B?YU5YaWtjWjFZMWxaaFVQZ21pL2hiQ08wMjhYamhvNHB3NGdTVFNlRGRJUEt4?=
 =?utf-8?B?elNPRENBT1FVMVdJSGo5ZUJNbU54cWdFNXNKNVlXaE9HV0Ercml1UWpGbWdy?=
 =?utf-8?B?c3M0T0ROSVYzOFRCUjF2YzFmUnF1UnNaanRJcmtVa3gxYTFqak9wdTJNaFVm?=
 =?utf-8?B?ZlI1UXY1M1dsc0QwT0RCSUxwZjlwb0xmR2M5YkZiemczcDBPR29JaitXN1JQ?=
 =?utf-8?B?QVhYbURmQURiZG0wNEdCei90TlFoREgyTHNKc3ROWE1rSU9neFVnNzQreThv?=
 =?utf-8?B?ZnRKSVhnVGVIWldVbmRxdmhDK200NDdnOVoxcit6UXBlZ0taQjRFeEtzUFhj?=
 =?utf-8?B?T3BnSEQ1dnNrdTIwWE15b3R2aFBOYVZHamVoYTJ3Q0JNTVo3OEZsWmhJelM4?=
 =?utf-8?B?aWtNZW1IUUhFK3lMMFdHSTRJSkJjb1huVU9ENGMyU0FzL0ZReUtvRTdwWEcv?=
 =?utf-8?B?cWs2aGEyYUtTMTlkR0xmOEV2T3hwd0lBNTBGNGtpK2FsMEUwRDd5N0V5WmZm?=
 =?utf-8?B?Uk1QeW9lcDdZS3Y0amFmeGpBSzMzTlRvVmRSeGYxWk1Yd0JJMU1vRTVHYlQr?=
 =?utf-8?B?QlQ4Ym13dk5ERURzdXRVcWtSd2RzZDZ3V3JmN2FDQTRlOFF1NnluZXRCa21p?=
 =?utf-8?B?UzA4eCtIT3J6L3JUdEZuYWh1b3N5ZUtManFSYjdlMnV0S2JyZUF6bEhkVExY?=
 =?utf-8?B?VVdXUGhaNWo2S09sSXZRSmExbUJEcnZXSHVSR2V6MnA5cmUzMzVpMmVHS2xO?=
 =?utf-8?B?cHREbTQrd1NINmVqODE1STgzZGdMeXZCZU1uc3dpTG1Oa2ZoS2wrWEg0OGRN?=
 =?utf-8?B?Y3JZcUVZc3RVNWJxWnQyZE5wYTdqdHBLVkNCcjFsVm5DMFZXQWJTYTlLdkZT?=
 =?utf-8?B?M0lSVDV6ZWFqTDdvRW5rZXJXdjJ4OFdkM0s2dHowcFdnc1dNZFZjenVFWTVx?=
 =?utf-8?B?T2lzZEhSTllWN1ZkdU9TZk9OejBYU2ZxWVQyUXRrQTlLQzNsWjBLdHNrK0Qx?=
 =?utf-8?B?VzFjUGJ1Rkp5NWZnSHZRRitpeC9tQTJLUjY3TGRxNmpuNmpyL1d2dWM4eHNU?=
 =?utf-8?B?RVBGK05zS3JFYkFsTXVYOWdoMkVuMVBmS3FickFnRGlzUGR3TjVNRnltcWtm?=
 =?utf-8?B?SC82SWNRZkpVQjBRdjlCNEhwdUltQ0h0QmtTYlJ0ckUydy9EQTUvSVFHQ2Fs?=
 =?utf-8?B?cDVXQy9ZLzNFMnAzbFVxaU1TaTExTWtNQ1FvbldnMC9RWjJmRTVpZW1qNndG?=
 =?utf-8?B?Z3ZWWTdYZjJJbWhJWENZd3JFQUFodlIwZ3Y2SVk5a0xEa0txSitTWUMwaE8w?=
 =?utf-8?B?WkRZaUNtNDZJUklnR1NNRzJpUDMvVWwxdTIyNSt1VHRJZCtLelI3QzZUWGdB?=
 =?utf-8?B?cmk1QXBDS2Y0NWFmdlErS1BxcDV0OENTamQvRmNQK2RWVnhVUnV5NFhQaFMr?=
 =?utf-8?B?L2tSNDV2bGVNeXU3dWJoTGhDZ1NwcnRmb2s1NFpSMDB2eTFoZHczUk1UMEMr?=
 =?utf-8?B?akorSGNGNjNjd2ZjbUFJUHRDWFZpNFZhODNqT3kvMXB4TW44V3dibW5kUGNO?=
 =?utf-8?B?M1pKTEZYM1RuUmVQNjduL3NvclRpU00rS1dWQkN1S1ljZXQ1R3BmWEJnUG5U?=
 =?utf-8?B?U3ZyQlY2cFNwR3BmWDZmaGloNmRoVlhGWWRjRmlCZU1mdVo4UGZoaFpRT3pk?=
 =?utf-8?B?ZlQ0Q1FVWm5ZcDdGbmczdWJKTVVoNFI2VHdsSDZVcTlBZDk0Vjg5UVRHcFBD?=
 =?utf-8?B?ZElxSUZPOGVZR1J2SlJxRi9HU2xaa2Z4VEZCLzJpSzh3dG9FbzdCemVPZTVh?=
 =?utf-8?Q?ndC15Qy9C0k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OURUc0RuTnB1Mm0rRmt5WXZacG5XMDRrTkpkaVFidzU1MHZ1YmlDb1dvMm5o?=
 =?utf-8?B?V0JhVFVLZGlzeWMycEZCQ0p6QlkyZ1RYOVBMMFBGZGo4azg1ajVKRk1wNUND?=
 =?utf-8?B?SlRtdXl6d3d1eWxCNzJtdG5mdzZOZ1lmNStPS09aNS9kQk83YklWbkdvNGdE?=
 =?utf-8?B?OXp2bjFSckZJVy9wL1AzV3ZxVmhpNElMWElTNi9tYXlPSWNLZ0xxM3BQTTJB?=
 =?utf-8?B?WlBiVDU3SkJmbGhtOVRwNUhKb3FiWlFVTm5YbVRNSXdhZXlPV2p6b3E2YTJV?=
 =?utf-8?B?OFpEM1plL1lZcmw1ZlBDMzRwM2xlOTdyV2o3YmliN1JKZkk4N21JNWNtZTRB?=
 =?utf-8?B?cnZXVUhvREdrRll2b3NRMTBjRkkwZGEwUzY4akpwbWUxTHIwNytSalg1ZXpa?=
 =?utf-8?B?U2FKUnhicnkrSFJzeEl0am0yWnFQaVU5VjVaNzhDSHRDS2Q0ZVVXT1hwOXlx?=
 =?utf-8?B?M2VlaUJ1QXh0YWFlaGJmd1hpcU9laEppV2VoRmhiMFZ3dTZIQlp3M2JJOG1a?=
 =?utf-8?B?SktHa0Y0bm00a3FaVUdwcXA3UlhXS2x5NDQzUWcwaWg4TS9jVlR2TVBPOHYz?=
 =?utf-8?B?MTlGeGl0VGtlTVNYVzNqbWp2ZFovUEhTdVhwWDRFc0xtc0ZRQktDVkpmdWcy?=
 =?utf-8?B?SEdCVTZTQThabVhkd1dEYmJXdXF1RzJ2M0NZTGV0R2ZLMUg2SjlzUWhFQ1RE?=
 =?utf-8?B?YUI2MXkvdU1MWVpkNUFTWWRIdWh3M2duaFF3UlEvMktJK1RuQ1duZDMrN2tE?=
 =?utf-8?B?MEVqSzZ0SkVMUGZna0RnRkRNalo3dFNCVFRkZTR3eit0bm9heUZoTWQyUmc0?=
 =?utf-8?B?M0ZTL3ZXNW9wdVM0TkF1Z3I4aTUyVytwN0hjeWZIZmRxaFlBVU51UkcrU2tF?=
 =?utf-8?B?am5raGtscFhHZ0p1V1hEaUg4eDBqdy9ZeWtzMUczaUw1ZXgwQWxxUjVKRHdE?=
 =?utf-8?B?ZjYyNnQrcldaVThTTVlpZDNaTkFOYTdZU0paRXlsOTNFNzhNSHhDdSs2aUts?=
 =?utf-8?B?T3k3OGI0NVRpbjdWRlBhaFhMU3VVVEl1eVhpdk53dVh2NGgyWWZ2aGFjbnly?=
 =?utf-8?B?eFYyYnc0QkNsOHBMWkFLZ2s4YTZVcTdQdEMxQWVWWXUxbWxDMktwRW1ZNzdm?=
 =?utf-8?B?TW1ZK2pnemlxekdORGs2WFBlNk43ZFdiVEM0NDJGS3pnRUo4Q1NibXJBLzZP?=
 =?utf-8?B?eWlXZGhPS1Yvdmw4bmVmSXdmcDRXdXkrbVVaelFtSThQdXRIVVNydjRaNTcw?=
 =?utf-8?B?REhIQXp4N3NWSFRCVE8rNmhsVGJ5b3pFNWNxamVoMVlYKzl6QlBoZjBxaHpa?=
 =?utf-8?B?YXdGSVFiR3VaL3JRS043WnNkUzMyMlBiczQ5R3Z0aEx5cTVNaVF2ZGRYQ0pP?=
 =?utf-8?B?VWpSa1NiR1g0TFJjTVJqa1BTMGVqSnM4RUFNb0dpZUwwak5valU0Tlcvb043?=
 =?utf-8?B?anE2eXZsV094eUZSQmYvMWRaNWpwaE9zVUUvRXpwaDhlTDN4cDkzcExkQklo?=
 =?utf-8?B?NEpuV1JZTXpsYkhsVmRjQmZ4QTNjcWx2SUtaYjNFbWlXSDd6RllYeXBPai9G?=
 =?utf-8?B?RVF4TTNqemJKUm5Xam1kdFJ0cjZxUTJDc09CUTlDcHhKb1hibmRadWtySWk5?=
 =?utf-8?B?bVZjb1ZvOGprV1B6OXVwRDBodU1GQmFQeWdLeC9oNzVNRTkvQmdqMzVkSnZ4?=
 =?utf-8?B?c3lVS2x2Z3VIRm9oNUV3MDVmTGVVdkMza3NvUFdnQS9tY29EaEcraVVGZk5Z?=
 =?utf-8?B?S1JtbjVsYzduNTY2empOaUFWUlBmN2RPdU14ZFUreXhYMk11SnQzL25udXFZ?=
 =?utf-8?B?Nm83QWN2TzlRY2llaTlUUmVMWlpSQjRRb3ArRUZtK1BiWGhPdit0bEZRbFdS?=
 =?utf-8?B?K2VnVCt4TlNQZnRmdHpvU2FpVTlFVmdhTEt5NzNWT0NSSVRDYUdnejQ0Qklj?=
 =?utf-8?B?Ums5YXRyU1JDdHE3WjJVZEUzTEtRTHNXMi9jK1dDUkRTYjM4R2tMcGRmdEtL?=
 =?utf-8?B?WERxMzZWdzh4YWt2cWdrR2djVHJ3dGRQNjJNMUVmQnU1dXJvN28rTWdKQzQ5?=
 =?utf-8?B?ZWd3YitQUHUxTzlVKzRGcWovWEFON2xkNHNLQVp4ZjN4RjMvSUFTZ25mWkRH?=
 =?utf-8?Q?mkqgI5ID6ndsct4cpI/XoBCQh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee73c0a-0f36-41df-7584-08dd76a5f237
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7334.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:02:06.5014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHUJeZs4bkH+Hfg0XEiN23xm1FKIhjE1KFQDOrxq6snE0ge+sPl9DBTf4m/0Ikzk6S06ok6NHlZOIIl0mrED2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5934

Hi Luca,

On 07/04/2025 10:14, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Implement some utility function in order to access the MPU regions
> from the C world.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/mpu.h    |   1 +
>   xen/arch/arm/include/asm/mpu/mm.h |  24 ++++++
>   xen/arch/arm/mpu/mm.c             | 127 ++++++++++++++++++++++++++++++
>   3 files changed, 152 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index e148c705b82c..59ff22c804c1 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -13,6 +13,7 @@
>   #define MPU_REGION_SHIFT  6
>   #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>   #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
> +#define MPU_REGION_RES0   (0xFFFULL << 52)
>
>   #define NUM_MPU_REGIONS_SHIFT   8
>   #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 86f33d9836b7..5cabe9d111ce 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -8,6 +8,7 @@
>   #include <xen/page-size.h>
>   #include <xen/types.h>
>   #include <asm/mm.h>
> +#include <asm/mpu.h>
>
>   extern struct page_info *frame_table;
>
> @@ -29,6 +30,29 @@ static inline struct page_info *virt_to_page(const void *v)
>       return mfn_to_page(mfn);
>   }
>
> +/* Utility function to be used whenever MPU regions are modified */
> +static inline void context_sync_mpu(void)
> +{
> +    /*
> +     * ARM DDI 0600B.a, C1.7.1
> +     * Writes to MPU registers are only guaranteed to be visible following a
> +     * Context synchronization event and DSB operation.
> +     */
> +    dsb(sy);
> +    isb();
> +}
> +
> +/*
> + * The following API require context_sync_mpu() after being used to modifiy MPU
> + * regions:
> + *  - write_protection_region
> + */
> +
> +/* Reads the MPU region with index 'sel' from the HW */
> +extern void read_protection_region(pr_t *pr_read, uint8_t sel);
> +/* Writes the MPU region with index 'sel' to the HW */
> +extern void write_protection_region(const pr_t *pr_write, uint8_t sel);
> +
>   #endif /* __ARM_MPU_MM_H__ */
>
>   /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index f83ce04fef8a..bf281f67fb6b 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -8,12 +8,34 @@
>   #include <xen/sizes.h>
>   #include <xen/types.h>
>   #include <asm/mpu.h>
> +#include <asm/mpu/mm.h>
> +#include <asm/sysregs.h>
>
>   struct page_info *frame_table;
>
>   /* EL2 Xen MPU memory region mapping table. */
>   pr_t xen_mpumap[MAX_MPU_REGIONS];
>
> +/* The following are needed for the case generator with num==0 */
> +#define PRBAR0_EL2 PRBAR_EL2
> +#define PRLAR0_EL2 PRLAR_EL2
> +
> +#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
> +    case num:                                                               \
> +    {                                                                       \
> +        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR##num##_EL2);  \
> +        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR##num##_EL2);  \
> +        break;                                                              \
> +    }
> +
> +#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
> +    case num:                                                   \
> +    {                                                           \
> +        pr->prbar.bits = READ_SYSREG(PRBAR##num##_EL2);         \
> +        pr->prlar.bits = READ_SYSREG(PRLAR##num##_EL2);         \
> +        break;                                                  \
> +    }
> +
>   static void __init __maybe_unused build_assertions(void)
>   {
>       /*
> @@ -24,6 +46,111 @@ static void __init __maybe_unused build_assertions(void)
>       BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>   }
>
> +static void prepare_selector(uint8_t sel)
> +{
> +    /*
> +     * {read,write}_protection_region works using the direct access to the 0..15
> +     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
> +     * only when needed, so when the upper 4 bits of the selector will change.
> +     */
> +    sel &= 0xF0U;
> +    if ( READ_SYSREG(PRSELR_EL2) != sel )
> +    {
> +        WRITE_SYSREG(sel, PRSELR_EL2);
> +        isb();
> +    }

This needs to be arm64 specific. Refer ARM DDI 0600A.d ID120821

G1.3.19  PRBAR<n>_EL2, /* I guess this is what you are following */

Provides access to the base address for the MPU region determined by the 
value of 'n' and
PRSELR_EL2.REGION as PRSELR_EL2.REGION<7:4>:n.


Whereas for arm32 . Refer ARM DDI 0568A.c ID110520

E2.2.3 HPRBAR<n>,

Provides access to the base addresses for the first 32 defined EL2 MPU 
regions.

/* Here we do not need to use HPRSELR for region selection */


If you want to make the code similar between arm32 and arm64, then I can 
suggest you can use these registers.

G1.3.17 PRBAR_EL2

Provides access to the base addresses for the EL2 MPU region. 
PRSELR_EL2.REGION determines
which MPU region is selected.

E2.2.2 HPRBAR

Provides indirect access to the base address of the EL2 MPU region 
currently defined by
HPRSELR.

Let me know if it makes sense.

- Ayan

> +}
> +
> +/*
> + * Armv8-R AArch64 at most supports 255 MPU protection regions.
> + * See section G1.3.18 of the reference manual for Armv8-R AArch64,
> + * PRBAR<n>_EL2 and PRLAR<n>_EL2 provide access to the EL2 MPU region
> + * determined by the value of 'n' and PRSELR_EL2.REGION as
> + * PRSELR_EL2.REGION<7:4>:n(n = 0, 1, 2, ... , 15)
> + * For example to access regions from 16 to 31 (0b10000 to 0b11111):
> + * - Set PRSELR_EL2 to 0b1xxxx
> + * - Region 16 configuration is accessible through PRBAR_EL2 and PRLAR_EL2
> + * - Region 17 configuration is accessible through PRBAR1_EL2 and PRLAR1_EL2
> + * - Region 18 configuration is accessible through PRBAR2_EL2 and PRLAR2_EL2
> + * - ...
> + * - Region 31 configuration is accessible through PRBAR15_EL2 and PRLAR15_EL2
> + */
> +/*
> + * Read EL2 MPU Protection Region.
> + *
> + * @pr_read: mpu protection region returned by read op.
> + * @sel: mpu protection region selector
> + */
> +void read_protection_region(pr_t *pr_read, uint8_t sel)
> +{
> +    /*
> +     * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
> +     * make sure PRSELR_EL2 is set, as it determines which MPU region
> +     * is selected.
> +     */
> +    prepare_selector(sel);
> +
> +    switch ( sel & 0xFU )
> +    {
> +        GENERATE_READ_PR_REG_CASE(0, pr_read);
> +        GENERATE_READ_PR_REG_CASE(1, pr_read);
> +        GENERATE_READ_PR_REG_CASE(2, pr_read);
> +        GENERATE_READ_PR_REG_CASE(3, pr_read);
> +        GENERATE_READ_PR_REG_CASE(4, pr_read);
> +        GENERATE_READ_PR_REG_CASE(5, pr_read);
> +        GENERATE_READ_PR_REG_CASE(6, pr_read);
> +        GENERATE_READ_PR_REG_CASE(7, pr_read);
> +        GENERATE_READ_PR_REG_CASE(8, pr_read);
> +        GENERATE_READ_PR_REG_CASE(9, pr_read);
> +        GENERATE_READ_PR_REG_CASE(10, pr_read);
> +        GENERATE_READ_PR_REG_CASE(11, pr_read);
> +        GENERATE_READ_PR_REG_CASE(12, pr_read);
> +        GENERATE_READ_PR_REG_CASE(13, pr_read);
> +        GENERATE_READ_PR_REG_CASE(14, pr_read);
> +        GENERATE_READ_PR_REG_CASE(15, pr_read);
> +    default:
> +        BUG(); /* Can't happen */
> +    }
> +}
> +
> +/*
> + * Write EL2 MPU Protection Region.
> + *
> + * @pr_write: const mpu protection region passed through write op.
> + * @sel: mpu protection region selector
> + */
> +void write_protection_region(const pr_t *pr_write, uint8_t sel)
> +{
> +    /*
> +     * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
> +     * make sure PRSELR_EL2 is set, as it determines which MPU region
> +     * is selected.
> +     */
> +    prepare_selector(sel);
> +
> +    switch ( sel & 0xFU )
> +    {
> +        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
> +    default:
> +        BUG(); /* Can't happen */
> +    }
> +}
> +
>   void __init setup_mm(void)
>   {
>       BUG_ON("unimplemented");
> --
> 2.34.1
>
>

