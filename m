Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GmQXOl5KNWrcrQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:55:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DEF6A633A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=vh8rbmhE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342369.1602586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZgo-0001tc-74; Fri, 19 Jun 2026 13:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342369.1602586; Fri, 19 Jun 2026 13:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZgo-0001rd-4I; Fri, 19 Jun 2026 13:55:22 +0000
Received: by outflank-mailman (input) for mailman id 1342369;
 Fri, 19 Jun 2026 13:55:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1waZgm-0001rX-K7
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:55:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waZgm-007QHG-0j
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:55:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6a354a37-2eae-0a2a0a5409dd-0a2a4503da2e-42
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:55:19 +0200
Received: from [40.107.159.114]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <milan_djokic@epam.com>)
 id 6a354a47-a3da-0a2a45030019-286b9f725ad9-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:55:19 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB8926.eurprd03.prod.outlook.com (2603:10a6:20b:5c2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 13:55:16 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 13:55:15 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmbWsSwzMZlaveeSss2f/uUvoUxlOzn2QpU7PTWkV3d8fvazfPaS2EgUG1V5aQCZztLHJqY59HKAIVYfznrnvLtzPvYlV1dY6AW77/zUge8wgi9RI5MV1Ux/WPlx74UUH+MZHvVlqs45VL7cfsnymfJUxDFb2q21/I44FYbQvmyoNs0JM8XqQoNKXOg72btNuYpmPWXnKAmbmJliz6458sObwpJalW9ilzFoOr5JZa7nZPdt2dzF/dun//IBE1CabFg8FuqJzavA6D/2V08zOtKqzc/0Q4HS3QgQI/frsqG1MMmlwQvfYjFGiPhr8a5bxlhCoZHN7Gqdx26TZI+H1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBSWRKaLFCzGUeJ9D0+Lmm6mvf3tEba5Qmp2iggzkXc=;
 b=Fzkj6cOcXSNjkT+ziFe2vzl43DkNXzhh9JmykCXUlJD42p5pnphj1DO+22ep34/LwpKsAdc1CllTjFq6T5XM0kViXN3+xlYcxJqHL+pSwI1uMjjsUGkrqGMNUTX6gDfLISrguHo8RFVH1p9anzhC78gw0R4nKpahehkbhl0ubpn0ve1zjDxbmp1wP/K2t/ptPGq69IKVINLGq2toy/eZOURl8v8BgSfptcores77nXsoaz3dWw0TC6FxNtaFbC8pQpVk1wHhL102ixGsxs1xgppODMUNeW2AhPxxJCTdtKxtVhg4MyWXeSFu++0XwQBCeo7S23AJliP3dZdmHcHlaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBSWRKaLFCzGUeJ9D0+Lmm6mvf3tEba5Qmp2iggzkXc=;
 b=vh8rbmhEf+f8e1YHAM3ZIUldnFzBHeiZ3gHMXra13/tHPvTQ5AFbN6VSx+OpM92KLL1L6sn8jCz+ZSpNAfb3/picPurQxImjZvOJZFy6skLccw/vZRvTOzlFlGhgc19VmBNGZxv8vZewcKeaTIdn0ArbEDPFHx/W8coMKNXYWVTy4EZd4yD3yLjG/3mYJQoJWezn6cLaYQ66Mz2CIjS9mixGxdBKn4mGE64fohxDo6w3ij8GLnQVUl/IuptWEwmBolVavcUXfuMBfRwN7bQB+7KSPn7qms4EVHurOX/fN++WqpiaRQVHERKvQ/rGUMejfLly+ehJspWBcxQ9tBrJgw==
Message-ID: <dae9e70e-0ae1-499d-af0a-cea712c2cd50@epam.com>
Date: Fri, 19 Jun 2026 15:55:14 +0200
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
To: Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
 <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
 <cd2c76a2-7a13-4bbf-9c29-5dcf3ae06fc0@xen.org>
 <4c96c478-aeb5-443c-a6ca-f23caf7d5430@epam.com>
 <e489f44e-ef61-425c-bd0e-0a992c32f7cf@xen.org>
 <f258e2e5-f7ba-4183-8b33-c3a169dc1d7c@epam.com>
 <bd0588e3-2824-4c2a-a1cc-6ff62fed7f62@xen.org>
 <21F24A06-115C-4384-89AF-B6A04029F356@arm.com>
 <ce107cd6-3d2d-45eb-bbe5-f700d5a25827@xen.org>
Content-Language: en-US
In-Reply-To: <ce107cd6-3d2d-45eb-bbe5-f700d5a25827@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:802:2::14) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a71de6-aa5c-46ca-0ef3-08dece0a63f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	A48y2bAYQeXs8wRDhR45t1QAG83xsvf4bL48tZ1agqsSjuU2tNKNqcO3S+mzsfVN1zb7VqyYb4yAAm+gwjpqAjkn9MezrGP00OSHXfQrkMoA3fOzqxWz+2W72zy6+DSDINHrMxuhxdNm+vWHmtxhRIr2vvz3OmmEBgNFWkRWzodsTY4xU3j/Yfzy6sfXB5TbDShjGGj6NMgfd0tiXJNhZ4BuhnWSRS2NJdJRH0n6uZm9iyoYeoxpakhnSrTo5zIFhPE9YShzAK7olR/BvMljhoUGcADigv3Yo04s7kwOegcuDxK8f3fHpVq41X0VoMASiAYkoekImzhbQIR0cWYdynkzEreH/nZcFa5UVNqpAIYsErAyrRNn8VRegYb9bkYdyNTxZ3w8sDmNBcpPBiPZZtIi6ifH+RXVyDHXCsYKQHMJabWVefOtrcTXVKJxMCUQyd+Tsq2qyxt5UYN+wIoJ+xylZT6/kirDLYRr7O6l0i6jPqczmCePm5Y/GWmYkG7aXK2OmRciKjdC06tP87s8rDdw3zsw7aMzycV7L+svnHgjN4RRBZbxZULkk13uSPjp/wsUzl6cR0FjpavewaNBHwnUYJBLveQU28Ag86GQtDLY0yLQqZqUaS9eWksMT51ebj3O4v72wvVkaNh0oHLz4qvfAKiufIMtozgdQ4/uQWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1FjbU1MYjJ2aEFpWC9DNTVrMVZpVDhYZmVqeEE2cm9RbmcwWXBhZGlJRTFE?=
 =?utf-8?B?K0Q3SnByL3dmaDVqcHJaaUdnR3V4cGtNQ0pGTnNXNzk2RFlmL3YxODBnb25o?=
 =?utf-8?B?WFBWSHRmWVlmMjZ1dzUxOU50bTlqN0h6TkVBQlpOaktUczIvUXRVOSs1QXA1?=
 =?utf-8?B?bTc3ZGpYM252eTBISm0vbkpUckVuVCt5VXdQc1BDMUhvR0xSMjJpYjNKdWM2?=
 =?utf-8?B?QUQ2Z1hsTHhqNGhVWWkwV0YrY3NWVG53bmNxRkNVN3dYcFM2KzJweU1EcjdT?=
 =?utf-8?B?SEh2RjJLREFOMmZkeHdnUHJmT2pTZ2J5QUg0MlJrM3QyRkRZQ0NJb1JMMllV?=
 =?utf-8?B?WTgzUVQ3bzNnUlQ3VVlvVmY5Y1RYdU56Q0FVR1BJZlRxdVkyRnZCc21jNGZz?=
 =?utf-8?B?MG5jR2pHNSs1ZC83dW93UEVtQ1IycFMwWlZvOVdPakdLYkxVcVZjMGZFUmpT?=
 =?utf-8?B?czhnazh5YWZQcHQyOHZRZzNQakZSbVdpR3BYWnB5THpwQlIrYXhmYXBsdkhO?=
 =?utf-8?B?Uy9DTWdpNUhPRW5uRkRReXZmUFVuMStsV3NVUlJ5TDc0MXVlcllJdUMveGFl?=
 =?utf-8?B?UFpiZDdGTGRhREJiZXBoaGpLaXltc2g2RTk1bVlvYVRqZlI1bGxiWXVmQ1o3?=
 =?utf-8?B?aFV2bHJrcGdSRWRJdEV6QS90c3JVTk5aT251TURVVVRkQkhrMm9QalZ4YlFQ?=
 =?utf-8?B?MUxORVFRWkdPZUlHbEg0N1Zoc2hmYWpwb29IVkVUa0IzaE9FNnZuRjFkUUxW?=
 =?utf-8?B?YUtnRnFlVXB1VGVHSzJZVW1ZckJ0UXVoVmFNSjBJeEJnODhjNUo1UXJSOWh1?=
 =?utf-8?B?YmpPYmFyZ3dLekhRbGFjQUZUMjlyRkFrVHZKNWZ3cFJGR3RIazJXWnpZOUpI?=
 =?utf-8?B?YTRITCtDNUlzd2NST0RZNVBKdVp5bDlrTndlV2hhZHdFT0dmR1E0QWFiUkhT?=
 =?utf-8?B?SFhTWmNnR1NyQmFaZTNLOWRRWHdIZVlBMkZ2a0RyeHVjZk1JRHV0NU9ZZkhL?=
 =?utf-8?B?T2JaZGp2TGVWYnMrTmszRTdlMlhCd2NTeE1iT1hSWlV4WEU1NUliMVpKdURq?=
 =?utf-8?B?UUc3dVZPZ1l3UUI1VURrUnQ5bExOaG42UlBGMlM5ajN3RWVib3psa2VpWkV1?=
 =?utf-8?B?Nis4Y285ai9ibFB1R01NQTFvZFRpbnoyZGNWN1BHUHZpb1FLVStqWXlCYkVz?=
 =?utf-8?B?U3RMYjBwa1RrQURidVFoYnJva3VXT0luTm1UL2pZNTkrYy8wK05ibmVDZDRm?=
 =?utf-8?B?S3NnWmFTUWRrdERhMEE4UXRvOExOYVoxK25qcHNCWVYvQTRWSHY3QnNmaHlP?=
 =?utf-8?B?UDRJc05GanE4RzdLakkwRGYvL0RabGw0cFdRQ3dPZ1BkQzI5ZWRLR3YvWURI?=
 =?utf-8?B?SWh0QmxnRU9wdklUaFl0clBJdDUzeTZPWWRoR1UwNzZqNzRZdGFwTXhYZTZq?=
 =?utf-8?B?OGNqam1qSlFwMjVPdEtNSHIrbFE2dFNBeHVuaXhxb3V0SjhiWFM2a1pRRWhz?=
 =?utf-8?B?aWt3UjBNUXpsdDJValpGMW13disvT2Z6Y0VWdlovNnp5SUhrQ1E5Q25meGU3?=
 =?utf-8?B?Ym5mS3ltSGtFQjk1eFRrc09MTERBT3lBNlc4OEJkUVhYR2ZOejBTeFJvNEZT?=
 =?utf-8?B?OERWSkV2UnBkamlNRGY2TTYwdGgxZlM2TnJPZDBsWVdjRkFhVzc0VlZ3d3di?=
 =?utf-8?B?Nll5cVBVRkZvTWVPYnRsQXZyVVFUcTNuMUorWUNQMmRUVFhFeHhwTzVqU3ll?=
 =?utf-8?B?Vy9YNCtsVWNOZ3BhbXJ2UzdGKzlHeDVSY0ZiNjRGVDR6UUg3WG9pRWNkLzg2?=
 =?utf-8?B?cGNYb0l4WUpqbTU5RktIbVFYTTFmV1RtaTA5dzlQNmk2TUFhZjhGekV4WjFL?=
 =?utf-8?B?eUN6WjE1VjlJVXRwbmxscjZTSzkzcUs2NGl1QllLbzF0Unl4VGEzN21FNXlO?=
 =?utf-8?B?UXhpcXdCb1phcTlPQUpVV1pIOWozaFVoZWZtNW1FY21KVGc1OWd0RnBQdTJx?=
 =?utf-8?B?YnoxTWl5NkJjK2lxMHZLaFlkTTQxc1R4T0FHeGd0ODRDdDVhcm0xZHhRWFF0?=
 =?utf-8?B?TWpiSDhKUmhvb0o0aDJCVjJHYzkwTlB5SG9scW53cHB0UjRnaExGS0ZCa0k1?=
 =?utf-8?B?eGtRUS9KRDJQNGlLeFM5KzJXbDh5NXp6eXlCRXlIKzBxYWxtSlFWMkxTTUly?=
 =?utf-8?B?VGUzQXY2WitNdCtPcElya1YwSjlQV0UrbmI3QVJEdDZzZkJ0VFR1R1hVOTRx?=
 =?utf-8?B?ZjBNdHNiU2hETCtYMlp0N1NwQm9pRUQvRWxKbkwwNjR1ZWd6aEZGMlp3YVpV?=
 =?utf-8?B?dWtYb2dSQUU2dVRQUitPWDRsbWtFSG5DU0lLeUlXRjg1QlpxdnZidz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a71de6-aa5c-46ca-0ef3-08dece0a63f6
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 13:55:15.8495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrLN0F2Frhra2wNK4ykSfo+H5XjpMUPCA2SyMyAJpYpeEZOYJj3E1Gx7NJET9T/eEubFa5ngo9TrnZWaRW+NQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8926
X-purgate-ID: tlsNG-33051d/1781877319-671DDD84-468C1CB4/0/0
X-purgate-type: clean
X-purgate-size: 1911
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47DEF6A633A

Hi Julien, Bertrand,

On 6/16/26 21:45, Julien Grall wrote:
> Hi Bertrand,
> 
> On 11/06/2026 07:12, Bertrand Marquis wrote:
>>>> This primarily targets systems where the SMMU does not support Stage-2 translation.
>>>> If we decide to keep this code, I will address the associated security considerations and document the corresponding AoU in the design. Otherwise, we can fall back to supporting only the "nested" translation case.
>>>
>>> Thanks for the feedback. I think for such setup, I would consider whether we can use the stage-1 in Xen to protect the device. AFAIK, this what Linux will do.
>>>
>>> I would be interested to hear what the other maintainers think.
>>
>> Giving access to the smmu to a guest means giving it a solution to access whatever he wants through a DMA engine.
>> This is not less secure than no SMMU at all but I would definitely think that in such a case SMMU should be reserved for
>> Xen to use it to protect from accessing other guests memory using DMA.
>>
>> Now i know that in some setups there are cases where a specific device cannot be used without an SMMU (mostly GPUs
>> but there might be others). In that case, the device cannot be used easily if the kernel cannot use the SMMU to remap the
>> memory at a convenient place for the device.
>>
>> We should not disallow such cases completely but we should give strong recommandations when such a setup is used.
> 
> Thanks for the feedback! I think before allowing S1 without S2 we need
> to make sure it works and I am not convinced this is the case today.
> 
> Cheers,
> 

Thank you for your feedback.
There are some existing issues previously pointed out by Luca for the 
stage-1-only mode. I will apply fixes and make sure that this works
correctly in the next version of the patch series.
I will also address the associated security considerations in the design.

BR,
Milan


