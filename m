Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857B974F18
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796344.1205886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK2K-0008K6-C5; Wed, 11 Sep 2024 09:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796344.1205886; Wed, 11 Sep 2024 09:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK2K-0008I1-95; Wed, 11 Sep 2024 09:53:20 +0000
Received: by outflank-mailman (input) for mailman id 796344;
 Wed, 11 Sep 2024 09:53:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6AyE=QJ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1soK2I-0008Hv-QF
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:53:18 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2009::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa3ec35b-7023-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 11:53:15 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.32; Wed, 11 Sep
 2024 09:53:12 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7939.017; Wed, 11 Sep 2024
 09:53:11 +0000
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
X-Inumbo-ID: aa3ec35b-7023-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkwa1ts6xL9FblDDTIgAIB0tu/Yl41EDB1ggvDYW3jd2Sz6wbUMQJ4cx9eMdKaXviZjIffldiUl6fVJc+UE+wdPmZZjQ8nDHhCkQSa4yg5e7QE6/nREIRwEZoHuETZ3oyvcAWXaI3+Y8zTLqKK5LSgPMT6fHj1gBHKY1l20WQoRRfjx8PVXQ3lf7mmbgNwJozhgmxFjVzQZBycZNHp69bzS60794ZL7jNL0iNi3PdQ1T8YHTHODkdZSe4nJpDUrk4CoLtRIpq5bZZr27OhOo8ZrkFm84qEmKI5rPFKYLeOfTZUbNNkUImRYkZ3AzSx2Uvin8P2cvJ4r54QKA6hS/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sbAdLm5I9TAiqKH3H7qugYMF6vD1K3l539vBiKZTfk=;
 b=vysT0nSHXsJIWhawdMKJcA+YZwp04QTMkL9t9gAIVHSowxiCqC9TZg4QgznH86+BD/+pZgCYsb5BzozEEoebHIHKPI4TATNM0Py9j9ulRDjFsTBUoBG+299wyExS+rlA/IxmgjKOld0s/cCH3ocpgPoTi4ad8MJOAmqpUPGQ07yjt3NCVXXf1AJA20/6GO22A3TSsfc19mO71nBQSCcLHILIztiiSQ9bpmU6UltK4Gpw3OmAAl6GxU+V5P1cyNHS0HzEUI1cP/hVVju2ge1hz/jfJARzlqje4deXW9isaee6+LlCsKfDqftxOivLPhl/eQGW9Dix2ea/4xSlLPyL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sbAdLm5I9TAiqKH3H7qugYMF6vD1K3l539vBiKZTfk=;
 b=j703jG4thg97dnIvV60qjzLPnhCs0To053lVa7W/98aM5WtkOFmQh6MeW58c+pGa5NPMi839fiwIL4VTujOtnN7b/zzp8BSBRB4NW55iJq2AoOCy9xx0foBAwBtIe020WD1ijD2RxyBkjf6uHsHoHku0QedtIq5yRJFA5ItLT60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <16d96aa5-9e9b-40fa-aa87-54b4e1b3fce0@amd.com>
Date: Wed, 11 Sep 2024 10:53:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
 <efc024ad-1e1c-45d0-9511-cc0c082dfef7@xen.org>
 <c0de7e6c-43d0-46ec-8cf7-ba1855caac82@amd.com>
 <c375468f-fc1d-42d2-91bb-7878f0300c55@xen.org>
 <7021af49-a409-46c1-993b-4ddd7975564d@amd.com>
 <0533aee4-1b08-4714-b497-a4df70703895@xen.org>
 <5583411c-aad5-45d0-97be-f0d630afbca1@amd.com>
 <65b9d244-8659-4cd5-828e-a2290b746519@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <65b9d244-8659-4cd5-828e-a2290b746519@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0261.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 669889a0-022e-4309-1235-08dcd2478c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REVNSTV0UjhHY2I2RU5tK0dRK2VSZGVhZUFjQTZ3c2RLRnFZQlBpWGdsUHB2?=
 =?utf-8?B?OHhLUWo1Ly91YUR1bEFuMmRtS2F4NWU1T3E2Ym5vc0JHZzczRG5rSGNBVUtv?=
 =?utf-8?B?K2RGUWdFWlFDVStUd1hpZ2p5MWt2YnFTeUw5M2JudmNIRWtFdHc1dUNKZ2tw?=
 =?utf-8?B?ZUpyWmFYUHYzOW1xR1daR3o3RkMyaHcxZkVBS3BXRFAvenhTUWszVXlnZU9N?=
 =?utf-8?B?MjdEelJpa093SEI4V0c1aExEMnArRmxiZmx3aEJ1MjlRQUJzR2R4RnF2K253?=
 =?utf-8?B?OTBUcXBuU0VUN0RCT2FBcllENmlDWXZOenNIMnZkUEdXU0VOOGNQalRHRENY?=
 =?utf-8?B?aCtwMGNlVmJNdytzZHk2NDFSdTR6NEFHQ0pqczhQSmw0MU9UUTJWaFRFc0tW?=
 =?utf-8?B?Sjg0TFFMSTU1WjV0bjlTQ21YYUhTcW5haVphZk9MNHBCY0psNlRwUVNZTkpU?=
 =?utf-8?B?bWlqb2YzY3kzVTRNdUp3MG00NUhHWGhNTERXMEZBcVdUVDY3N1hpa0ttL2k5?=
 =?utf-8?B?dVU1Sk5iZzlwV0VMUklrd3hiZ2tLZW9OcE02aUxFQlR5ZVlYUVJtYnFJdEsz?=
 =?utf-8?B?bGVoYW1IN2NabUZyWE9uNDZoczg1UTFua09hUklNSHZvVnRndnc0UlJlZURj?=
 =?utf-8?B?T05tajdSSmw0UEFNOVdhV0dRWnhTK3VxQ1FxenN2L1o0dzNsNHN4c0hpdE9G?=
 =?utf-8?B?bGdlZE43bmowK0EzSlBFMFdSem5Udml1VGhwbDRuR3JLaGkwUTIrd25xTDNZ?=
 =?utf-8?B?bU1GQXpoVDA4Y1ZkTkVrdDhPRG1zcHh4TmkwTklmY1ZpWEtmY0x5ajJreWZa?=
 =?utf-8?B?NXIxaDRGbEZremczb0EwSE9tTUt0VlZ3MkJyV2ZxQWQ3ek5UNmxVTXZCWUZ4?=
 =?utf-8?B?cC9iQWZqamdSaW51cXdVQmdHRStuRWIxLzVyRWs5NnBRcHg2aVl6b0pLZUJx?=
 =?utf-8?B?NTkzdFJQNGoxanJwSzkxRGo1ZGg3UzFoZVArN2FYRVVCTGVtSXNTRERNblU5?=
 =?utf-8?B?RGN2YVBEQlROZzZkaTVSR1pMQ1NXdk5EelhOTE5EZEdiUXMwTXNtTzcwVjVi?=
 =?utf-8?B?bi94aFZ3MUI0WjVtV3FoRVBLSW55V2t5dTNiZC9ucW16RzM5Qzg0aXlVbzd5?=
 =?utf-8?B?Y2V3bEZwZVcva1h2bm5RcDFGUVRNSXRLMGJxMU9RM2d3UFJSMkwwWXJHU2U3?=
 =?utf-8?B?TXY5UGQ0ZkRLZk9BUlI5akk1WGhjenVnQ1dERzI5LzlxblZmSEJNdDZSWFJl?=
 =?utf-8?B?MlFWV0VYNmwvc1JhM2pXWjhTTzhRRnJWR2pDZVFmanZnUkQzM25MSTBUSEk3?=
 =?utf-8?B?L1o0MFpPbTZIdEs4Mm5pOGsxNDBmYlpVWnV3TnZPdXJiZVVSbmdkcXlyek1F?=
 =?utf-8?B?QXp3ZnNyWnoreFJGN0lubUJ0b1JLWndlS21BU1pDRGViWG1zNFRtVmVRTERL?=
 =?utf-8?B?ei8vd3FmcFRFU0ZsS3RhTnhOQnM5WUxkaDlCSGN2R3RuQi9meFRZckdZMGdX?=
 =?utf-8?B?UkN1RWR1b0FNaDJvUDRiVVhONDQrZS9wSG9VV0tzNXB2UEdWaU5rUzZjL0tC?=
 =?utf-8?B?aENGNmxLQ3NKbXBHVUFIMXo1TTBscnRZMUpLdjd0bmljYUJyUFowcDdJTEJ3?=
 =?utf-8?B?QkdFbGFVcEpsRk9GM0NWc0NpMVdnUjlRVFp5ME5OakJuejhIUHNKYmh3eS92?=
 =?utf-8?B?Y0ovYVlSczFUajRRaVZWSmdvWEU3NGg5aVhmdW05MVdmb0Jubm1SVTdESDRS?=
 =?utf-8?B?U084ckhEQzVPdStDOWtobTFsUHF0aFBEL1hBTVhCbzlraUNEalczRmYxcW0w?=
 =?utf-8?B?bkNLL2ZvVnBZQU0xOE1HUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEduOGRKRUVJYkkrb2VKSzZSdjRNekQ2WnhKRzFzWTJiTnRDV2NNVGRJZWlO?=
 =?utf-8?B?R2V2QVFyVzZFWklteEFQSk8zekNXWVRCQnduOTA0d01JbVJ2bjNoM0NMM2Ji?=
 =?utf-8?B?bEJOWS9nU243Ulora1htVWx1dXdpRlBuaS9nRWNjaDhuY1lkdnRkOWpzUkRT?=
 =?utf-8?B?dzA0MjBFOVlVSE5qR1hQN1NUaEFuN29ZVm5NWi9uSzhWZEFsSnh6OTYxL2Y4?=
 =?utf-8?B?UHRmamFSQzFrd2lESVNrQ1liUlpmOTFxMEt5K1JPK3Z5Y3RzMzBXR2hvZDVS?=
 =?utf-8?B?VGtjR2NieE9RdHlBNjl0c2IzeCtoMlRHNysva09DNzYzV1RYWU5XMHQvOVRI?=
 =?utf-8?B?TDZCQ2J3RmNkZ3pmbEFPYjllZEdhZzZudVNocDYyVS9PSWdTMzFkYkFySmwr?=
 =?utf-8?B?VmZxdEw3Y3hacUVweGZBU1IrUWp5Myt5bVlQcHA0amRuQVNHRnJFQ2lPZHhT?=
 =?utf-8?B?ZnF6aFluM1g1ZDV2enN5MklCS3FZN1ZiVXE4dUlESlp1dnM4WGtIQU5xOXk0?=
 =?utf-8?B?YWZseGJaZTlCRkNHeERBSk9nY1pEbXFjaDN0N1hjSitSdThYbEhxMUcyc1gx?=
 =?utf-8?B?ODdkZ053NVFtbU1pN2gwU3E5YTVqc0hybGxrWnMxRVRJd0lvTXpvakhGL0tM?=
 =?utf-8?B?SmpFZG1GUExSNk84S0lQcDVhZWhxTEpZQUFYczR0Mk1JcExvZVlSOUdUK0c0?=
 =?utf-8?B?UmZ6Y0huZThJVXZkMThMYVZLUjBXbmRlVUp3SWVFcExuWHBTR05WZ1ZLdkJh?=
 =?utf-8?B?ejZoVktSVlVxcDdNYnJuUHlYdEEwRHcxMnRsYm1uYkN1Y29BNE55dHZUV056?=
 =?utf-8?B?ZDZKZFc1WTJsa2JFRTdEaFk5ZEpWYjlWV2E0ZWVITTNpM3MxWHM2OTVQZ0JC?=
 =?utf-8?B?RmtRaGs2Qys2ems5T2lLaGdxanJGOHRNK2VBR3JwdkpsQWE5ZlpqV1RtRUpB?=
 =?utf-8?B?TU9KYjR1bXE0K0RtUkJzSnRSaVR2UlVTRGFQZkdtN2JVTk1QbjRveHdZMm9O?=
 =?utf-8?B?MkUyeXlFVHJjYjZjU05XSGtEYlkrQmhzdzJEanVjQkJRQ3dIbnZPZkRDSk5Y?=
 =?utf-8?B?MzAvV2thZWxYTUFORFN5N1FaZ2FwUDd6L0JndEVLSWd6UG4xcUlIU0pRZzRm?=
 =?utf-8?B?V2pmamZxYUR6VysvQ0JqSmtuV0dlZWlRbktJbDhJeFFsQjUwaHBZbVdzVUsy?=
 =?utf-8?B?MjFYK0YzNktBdkpnbVFtcTN3RElUeFhNb2ZaUzY4OUxPY3BtVElyQklvdVBS?=
 =?utf-8?B?cmVyUWk3MnZETDhsaml4VkRiRERSQVdFQ3BzNWRDUEZVbnZnaVhqT1hJL3pD?=
 =?utf-8?B?TE1oS3FNUWRsSkV5aWVPZlFCOFFNUGlmUExYbXZpcmxsNEpLTzJnMnpUYTl6?=
 =?utf-8?B?YmcwcnFXTE1iY1BKVEJleTdxZ2ppWVhxSW8yanlOZzZEbmxhWDFnUlBtV2VT?=
 =?utf-8?B?Vk9zVzhDdU9nMFNXQ29ETG03T0RuRW5BQ3RRTjA2djhlMGc1UjhMMXdFdGcr?=
 =?utf-8?B?MFdzT3Nxd3hOS2YrUFMzTTZvVnZoVWxFVVQ3UnJjRnBZenFSM090blBpdUpn?=
 =?utf-8?B?LzVqVnk4SFZ2RkFWYUVEQ2ZzVnFseUZtN21rQ0t0ZTRjaDE5M0djb1E2cFhF?=
 =?utf-8?B?NGQva1JXSzZTNmQ0RUpweS9FdzhRemV1VjZEbDc5ZVdzUkJqT0RZemVGeG5Y?=
 =?utf-8?B?TnJYcithL2pvQVlaaXlIbVFWRy9ic3NxY0JkWlpJMWUyRC9jYnFMK0JtU1BL?=
 =?utf-8?B?RnVWalZGM21qeEtWY3ZHbDJYNGdYTkJLZ25lNHFHV0thSVdUZ2xlUWNUZmRN?=
 =?utf-8?B?QXAxM2FKcFFGMVlRMTBYc2RqOXMrVkZCeDErUHd4T3BlUVUwWTkxbkR1dlll?=
 =?utf-8?B?cFZRSCtNMkVwOUFvV1gxM05WSHhLcVB4Vy9pVFpnS3VCYWs5c0xBT3k0SUZ4?=
 =?utf-8?B?T0FoRVVLSGE4Yitoa05NRE4zR2svRzhMNUo3V1ZaVnF3RXh1Wlc1RHBkZFF4?=
 =?utf-8?B?K3NtVnNGb21oVTRYQVJCUm1YbkpNYkhobTR4THU3UlNIZ1RyRURpb0pRaW1Y?=
 =?utf-8?B?UktpbzMxS3dLUHN3aE9pWVZmcXVOdDhTbVhDTiszeTR1Y1pXem54dGtSdUVu?=
 =?utf-8?Q?ZC68qOyurg7dO4DimqBFiLA4q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669889a0-022e-4309-1235-08dcd2478c30
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 09:53:11.8626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eaCLPYwulVIS66WwfieJcMJ6q4+JSTmsUNFSbBDP3mDo4nAVgHf9X9X84k5fyXyxiR/kyrePUbtZYr3nGJBdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110


On 10/09/2024 22:34, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 10/09/2024 14:42, Ayan Kumar Halder wrote:
>>
>> On 09/09/2024 15:45, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 09/09/2024 11:29, Ayan Kumar Halder wrote:
>>>>
>>>> On 08/09/2024 22:13, Julien Grall wrote:
>>>>> Hi,
>>>> Hi Julien,
>>>>>
>>>>> On 02/09/2024 15:48, Ayan Kumar Halder wrote:
>>>>
>>>>>> I will rephrase this as ...
>>>>>>
>>>>>> "Used to set customized address at which which Xen will be linked
>>>>>>
>>>>>> on MPU systems. This address must be aligned to a page size.
>>>>>> 0xFFFFFFFF is used as the default value to indicate that user hasn't
>>>>>> customized this address."
>>>>>
>>>>> Reading this comment, I would like to ask some clarification. In 
>>>>> the context of the MPU how do you define a page size? The 
>>>>> definition is pretty clear when using the MMU because the 
>>>>> granularity if defined by the HW. But for the MPU, it is a bit 
>>>>> blur. Is it still 4KB? If so, is it actually realistic (we don't 
>>>>> have that many MPU regions)?
>>>>
>>>>  From ARM DDI 0600A.d ID120821, C1.1.1 Protection regions
>>>>
>>>> "Protection regions have a minimum size of 64 bytes."
>>>>
>>>> Thus, I would infer that the minimum page size (in context of MPU) 
>>>> is 64 bytes.
>>> > > Also, if you see the register fields of PRBAR and PRLAR, the 
>>> lower 6
>> yes.
>>>> bits are 0 extended to provide the address.
>>>>
>>>> So, may be I should say
>>>>
>>>> ".... address must be aligned to the minimum region size (ie 64 
>>>> bytes). 0xFFFFFFFF is used ...."
>>>>
>>>>
>>>> Let me know if this sounds ok.
>>>
>>> So what you provided is a minimum size/alignment of a region from 
>>> the HW point of view. How about Xen? Will it be able to cope if Xen 
>>> is booted at a 64-byte alignment?
>>>
>>> Asking because it is unclear how the allocator will work with the 
>>> MPU. Are we going to continue to allocate 4KB chunk at the time? 
>>> Will it be smaller/larger?
>>
>> MPU will work with static memory allocation only. It can allocate a 
>> fixed number of regions using PRBAR and PRLAR. We can make the 
>> addresses to be page aligned (ie 4KB) so that it is in parity with 
>> MMU. And we will keep the page size as 4 KB.  It makes sense to use 
>> the same page size to do the allocation irrespective of MPU or MMU. 
>> Also, it helps to keep a large part of the code as common.
>
> TL;DR: I think we can use different chunk size (I find "page" 
> confusing in the context of the MPU) and still sharing a large part of 
> Xen. For now, I would be ok to use the same size. In the future, it 
> would be beneficial to change it.
>
> Now the longer answer. Looking at the specification, the architecture 
> allows up to 128 regions. So the chance we will want to share a 4KB 
> RAM region at the time is close to zero.
>
> Yet we would still have one struct page_info per 4KB chunk to carry 
> the metadata. This is not only going to be a waste of memory but also 
> requires extra work. So to me it would make more sense to track larger 
> chunk (maybe 2MB).
>
> Now regarding the change necessary in Xen. I think we can divide it in 
> two parts:
>   * Allocation within region
>   * Frame in the public interface
>
> For the first part, Xen on Arm is now mainly page agnostic. So you 
> could bump the PAGE_SIZE (barring the public interface see below) 
> without any trouble. You may have to deal with extra memory wasted 
> when using alloc_*heap_page*(). But that could be easily solved by 
> using xmalloc() and/or introduce new wrappers.
>
> For the frame definition in the public interface. So far, a frame 
> covers 4KB (same as Xen page granularity) and this is bake into OSes 
> (Xen doesn't have a way to return the page granularity used). So for 
> the MMU, you sadly can't easily increase the page granularity used by 
> Xen...
>
> However for the MPU I think this is a different story. The bulk of the 
> interface using frame number (such as increase/decrease memory) are 
> not applicable for the MPU or would be unusable/severely limited (e.g 
> grant table) given the number of MPU regions available.
Thanks for the detailed explaination. :) Yes, the initial MPU support 
will be limited to booting of domains in dom0less mode. IOW, support for 
grant tables will not be a part of the initial set of patches.
>
> Anyway, I am probably thinking quite far ahead :). For now, I am fine 
> if you want to use 4KB chunk. So in the Kconfig you could write "Xen 
> start address should be 4KB aligned" (let's not mention page).

Yes, I will use these words. When we get Xen up and running on R52 and 
R82 (with the basic features), then we can revisit this.

- Ayan


