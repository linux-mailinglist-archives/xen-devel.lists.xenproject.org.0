Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EDBC6E00A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 11:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165734.1492427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfVr-0008Rr-OQ; Wed, 19 Nov 2025 10:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165734.1492427; Wed, 19 Nov 2025 10:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLfVr-0008PO-LX; Wed, 19 Nov 2025 10:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1165734;
 Wed, 19 Nov 2025 10:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRf7=53=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLfVq-0008PH-FL
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 10:34:10 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46b47098-c533-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 11:34:08 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7747.namprd03.prod.outlook.com (2603:10b6:610:23a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 10:34:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 10:34:04 +0000
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
X-Inumbo-ID: 46b47098-c533-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvwXljca2QoGG9/8cYOUJYXZYHX5SxzvDrjXiQSGt5WCmkbjBWyg1LwXB5+WiMIGZVtQdMNd1UaLyMMJcou6EsjXcNorLKXP5fYR0auSOQWiNGE9ihQtSe/6pnY9QHOuOxU3rRwpbv54qa2mhyp4F7BtsOxwlG2CxSD66Oz17SoaX+6wAkYibyLext3Gfvfwvh0FT1jcDwimB1nsSknjpFOOnOnx9Me7QG7JayxIXrjYHYPOZS4JTb1+Wg6qeoSQnIm227FCFKK9rclk4Pn+HpPvLfGup1V6wIizFaCfibkA7t5SqFWRUYbwFCm4tMPiOmR4cA0FSl0bjkjlWa61Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHDCUg4U6jHmHeHbDXIljK9wsreNfvmASatg8X7F9pI=;
 b=kcRkXIYvxD5FtBAHYjltZCtV0306i6us5elGwVk4S7PAnLqGU1poYmhcO54KTDzFLQO/6BAe63oJxuAsoQhxLUNiKCZloy1P9yvv+PvHOgFLJDM7e1/qIS6lUOzmuIztR5RjN4yJ56cuf5JfZAC9YLspjorKBJ0ICdFpBV6VFAQmgtfaZyy4/eWE9SieRpdayquI44Cvn2SujE1vtf/q9ypuNqje/W468ZkHrjEoTz0q4sLS3enPWssnKiZI4ybFCgnI7J6gQoAKs0bGpCCFsFDnKdBPoGmaM0IT0YjArkk+XyUVACl2J+aSS64oA76Be1666vYEe9k0UQWeefDg+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHDCUg4U6jHmHeHbDXIljK9wsreNfvmASatg8X7F9pI=;
 b=CmALeQsvyCZ/OBKefWdHUaDu4z4AFaad3OyNDb77vnUs6unMfIpJszAoqPZIrM8J6rtIVXvTn3tOPLCCA1bf5/HGazugGPMYCo+duirJSLzUtkus8ItP7N1IZ+DSmNyaWsSpG4RcFNGGhFJK429reDjgXCZg5k5QvbVdQ/ZNoGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a4d03eca-d835-4f82-a8a1-c0cd313ebb98@citrix.com>
Date: Wed, 19 Nov 2025 10:34:01 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86/ioapic: Don't open-code 32-bits rte reads
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1761209564.git.teddy.astie@vates.tech>
 <eab88bd79a65887961e0e1563f47360ef08e421a.1761209564.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <eab88bd79a65887961e0e1563f47360ef08e421a.1761209564.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e84c11c-8467-4386-54c5-08de27572980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blBKWjJSa1BrMElBVUpBSmIzQW42eGtuL1MxM3lqaVFUV3gwNFhneTNNYmpp?=
 =?utf-8?B?ZEFWeWt1Z1h6aExFcDlROTFzOFpzcDBSTGZjdmx1TzV6NXBLcmRqWDZJUEZm?=
 =?utf-8?B?YW43UlBnRXVhTktLS0FzQkhPbHpvOVZEcVhSOGJqRDVOTnBZeUkxazlaejhl?=
 =?utf-8?B?eFE5aTdJMG01OVNWVnJNSnd0UmI5ODBaUTdBWXdxemhxMzlkQjNKZ1BKWmJs?=
 =?utf-8?B?clJPVGpYK2pvQ2wwQjkyWjRKbjlINGtCRmdIWGY0VjNGckFYUEt5S2FVQmRD?=
 =?utf-8?B?TjB5K2dpOHh3WkVLdENtNVlwOVFmMWRGSUg4VHp3V2RHRnE0VGFDTzZYaWlm?=
 =?utf-8?B?c0dnMzIzYm43d0lLY1Vzckg5eGUzbkVmK1hxbllaVVh3VFRyNFlENktmMEll?=
 =?utf-8?B?SE9STjJ5TjJaL0cwZzFwUDRNeVlIbTU1bUFlQWlNUjNJelY4SnJGNnBwdGVu?=
 =?utf-8?B?UENBWmU3UUN4S1VNY2dUVUtXU0o0ckdnanVMU2Q2bnBiWnQ5L29IaVFvV3lJ?=
 =?utf-8?B?MnVsK2J0eWNVcFZpcWtNTUJnd2xwN1VVV1NiZGhkNytqM2pvV3pJSEdKUkht?=
 =?utf-8?B?MUNUbmZCK0RneXV4anEzS0lrV2h0WWE1TGx6WDNEa0JsdnRyZE8relBmWkhI?=
 =?utf-8?B?a05JbnlOQUtkT3Z0ZjFvTWNhS2VSR1c2WllrU1lZYnpLMDBCOFpOU2Qvb25L?=
 =?utf-8?B?ZmZjL2xZL1A5dkxUeWk1UmdWNlpCY0dwMDVDUWluOU1pYUtyT3kzSmdkcXg1?=
 =?utf-8?B?OXVtbTVhL0xzcXNNWmZidXYxREtQQitBMCt3T1RzUzdHdG9BQWpwSGdvdlhS?=
 =?utf-8?B?dzJEVTI3OWQweVlnQnA0NEVRMUJGd2tReGpRZ0diSmhIZitEd2pacmVuTlRn?=
 =?utf-8?B?RDBZdU0wNEI4bCtDNnhzRkFlaDQzeE8vY1kwaWo0ejZSRVA0ZXU5K011OW54?=
 =?utf-8?B?M1BJNnl2VU5XRjVjSkVMMFpzcERpMlJlOXk2M3RieVdlclNseDlhSDNuWlc3?=
 =?utf-8?B?ZHM5VDdLa0hscG1PTVI0OXlLNi8wdzhiWWlMbktZbTRjeXdvZS9iVE11SlVF?=
 =?utf-8?B?TWhQNExoSW9Ra2ZOU2NjemhEVDd1NTdQNHd4Q0NIdXRsMTRuckcvU0llRjgx?=
 =?utf-8?B?eTBtY2lwUXZWYUhrV2R0b2pJZjZucUp6MitZOExVOFh0RmdDb3ZhVUpFMnRm?=
 =?utf-8?B?aWVWQUViTWg1dlhXWUJzUGlaVncxVjZPUXNqS2liK2tPbXA0cndJZyt4cEJ4?=
 =?utf-8?B?dmQ0dWhINmpkdjRhWTcwQWRaNE9IcUF6Kzg0aGMvb1VpRG45eXJGOFBwZW1r?=
 =?utf-8?B?Um5kTkFTdzM2d21VZTdEdjZzdHVlcEhVUVJKWC9wbmQ4eVVnanVFaGp0Yndu?=
 =?utf-8?B?Tm1kbWJQQ0MzOU1nckRWWE13MHMrY24xU0w3Vks2QVNFeVdGcDcxNDdJNXNZ?=
 =?utf-8?B?WExMSlV3R1RQZERCZS9lUTNrZHYrZUZBY1ByOTgwWEkwNW84ZDRaaXZqaXJK?=
 =?utf-8?B?aHp1bXBURVpXMUlFVnlqeUQ1N2RIWXBxcWlCRjQ0NkwxUXo0MVhlRm84YW5o?=
 =?utf-8?B?NXQyTlJvaHh5TnMraG9NenNHQU9YTlJpT0NVa0JZNEFpNDE5THIycndtUUJN?=
 =?utf-8?B?QlhoZHZRR2xlc1pPdVR4THhvejczdWtzOWtoUnRUT1VWWTlLMFQyUFpQRXNa?=
 =?utf-8?B?ZTFUMWNpb0JiR3UwQXFUSm5qRHFQY0ZtV254anRYT1NsSUkvT0hMdFhUU0p1?=
 =?utf-8?B?NEFLTFU2a29lV1o5Z2grY29tZDg5YnZEUzBRUFEra0d6UWxQNGNOQ2pRVlpW?=
 =?utf-8?B?NmZob0N0VXJHNnVpa2gxakpIKzVzV3VQaFoxV3NvdDhyMUUxeHAxN2R5Z1lW?=
 =?utf-8?B?NU4zbExiV3hyaTJaRmh1VnFzUUkrMW1iY2VoYXBadzRaL0ZiZ05DR3c0SXBS?=
 =?utf-8?Q?eLXtp26xccVScYPP/EG4FkmNK1oaF+7e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTFxVzJicGhJN3ROZkhjR0NCRWp6OGtGbXVqWFhXbjVIUS9PNy9ydXVsL1A5?=
 =?utf-8?B?czlpTmJRMm5jNjVWbkVuWU5oeDJzZXg1ZHpIOFhsOVpHT283WWV0ZUZiZmFF?=
 =?utf-8?B?STk0dzlDaG1udjlybGw3TzRMc045d3lZQnNtZlJnSXNMSm43N2UybFZwTXdj?=
 =?utf-8?B?WVlTVmVSRStveUh6SVVTMEErMGZma3NCbDRVOUhUUTV6WGFub1VUR1dXcjli?=
 =?utf-8?B?bURjdGJuZ0tjeEJvcFpOandxUWRiQ05JQjczbUlhNG52M2Q3N3hnNnhhakZv?=
 =?utf-8?B?dHY2WkkyMGxlcCt4dzQyVGNlSmErdDVFZEZ6NlVxUE5oU1hVMzJhY2I1MU9t?=
 =?utf-8?B?NVMvUnhFVTZ4NEtYL0tBSFY3bmprdTVva2dUQ2ZmV2RLSTRMQzg5TGl2WmxW?=
 =?utf-8?B?T0tYelV6cEFuZWJSNG5YaTRWa2tCVUhHbysxUW1Gb2xTVDg1SXA5NGxVQTc4?=
 =?utf-8?B?Zk1BdG4xSEdtWTZVUDJCNnNYTHBobDhzSzVGNDY4aDBtNGh2cnN3RFBPeFdS?=
 =?utf-8?B?bVNieUduYVE4V0hoWVk3TDQrcktGNjJ6MFE2UHlXd09nQVZGalRKOWtEMGMz?=
 =?utf-8?B?bXI3b1ByYyt4ZHh2UDEzZzhQNEExYUFRTUxBSFp5VGJXbU1sbEEvbXBRUE9N?=
 =?utf-8?B?WXFvTFhkU2pkYnI3UG0ycUZ5L2RVR1hPUkZhSGpVVjQ1Y1RWelZ1S2FhSkRY?=
 =?utf-8?B?Mk1NbEhiTmRqT1RETDZYaFJVd2QxaUpnK3VvSS9rczZmOHVNYUJpZGJHZlIw?=
 =?utf-8?B?YzQ2TjUxODcvY2ZuOHVaUjRSeDFqU0l2WUs3WFNYb0NwMk5tMmFwUFVKNXoz?=
 =?utf-8?B?eTYvblZlb2ltczgrQ1hpVTRSSmhUcjFoQnpQSHFEeE9wVnNiZCtsTFhtSjdO?=
 =?utf-8?B?NmRtRHhsYVR0d0puV3p3YllRT1piMzRBc3ZZOGdZeUtQYVpUVFprd0paY01O?=
 =?utf-8?B?a3hoRnFvM0t5dkRueXI0NWd4aTNtM25vVFU2Tys3U3l6d1Fqa01FMWJZS29m?=
 =?utf-8?B?VitUNmRFQnJ4TlArdS9iQlNQakRvSUx4Y1phOXQ2L0luQ285Y3JrZ0xqd2V2?=
 =?utf-8?B?emFsT1cyaE1zRlpKTW5tS3F1WDNTbFY1N3gzVFhoN28vNEdQWE83cGFUZHpO?=
 =?utf-8?B?cW8zL2dhQlBYNko1amtQaXpHYWh0UlVLYmcyOUpqczIxVjNONXp0b0dqbWtJ?=
 =?utf-8?B?Z09peWhpdkloUU9mRjk3TkhISUV4bDcyZnk1YWNVM0c4c2VJaGFVT0ZpSWV5?=
 =?utf-8?B?YmN1dE1COExaOWJaUHlPRk5FU2JDR3J4UFdoaG9YMm9Pa2dPbDVoNkJiQ25J?=
 =?utf-8?B?Ty82T2phd1dWbURUU2ZLTUYxSHM0T1VVQ3BLR1N2OW9IR1BoZ3BGbG1sNlNa?=
 =?utf-8?B?Uk9ZU3ZlTlB1bmFJWG9BRkpaR1VDKy82UGEwUExFUHRpdHdMVUJ3cFZyd0l6?=
 =?utf-8?B?WWFLeTNWU21acGFoTllsN0xpbkJtMDR2ZWF1clBuZVFkSEpOOHVkakI4MmVm?=
 =?utf-8?B?YzkxaTFWTTE1N3ZzZjJXNzd1YmZXVVhORjFBWFFjR2VBcmNTS0pwaWczMTVH?=
 =?utf-8?B?VExhdXBlQk9qUHQ0UDQrcmFPNmdmRjBwL2tabWNBN05nQkdMRUZUU1c2RVpo?=
 =?utf-8?B?Q3JZQ2FncW9idWEwa0xmeFVxb1UrZTk4VUtXUUM5TkFVSXFTdFB1aWpWcXJP?=
 =?utf-8?B?cndaRkYxQWdPSS9DU296R1hMcFFKZmR4QXZ4NGlUaTZRcENnVmNHWktVeUc0?=
 =?utf-8?B?cVdXeE5vRHNTQmJZd2VGWm9yMjRLTXdaVUx3Um8wRVJUYzBZc0c0bGxNcnkv?=
 =?utf-8?B?QUROanYvcWM1TzdyWHNpb2N3VHZ0TEZNNHJrZVVPUEp0UTVZeXFnRitLOVNa?=
 =?utf-8?B?eTBJQTA1ZXlnUWFnRzk4MTZGVERFSkp0WFV1cTRNWXZWeGhDRXBNSmE0Vzlv?=
 =?utf-8?B?QmdFdEVUWGN6d0xrODVZK1B1LzZQbFNwUkF6SXpKR1Rib0hBSHBPeElXaUp3?=
 =?utf-8?B?WWp1cmlMajJPZ01lK0pod3AzV0lxYTlvZXJVVWhoMFlrVG9hRjN5dythb3dY?=
 =?utf-8?B?NHVjTUU4aDFRU2VvR0N4bmpzd0l2Q0dIaTVpWDNIS3o5WDF2UUEvaThIN2hW?=
 =?utf-8?B?WFptbzNyWDhWQUdPdTIwR1BwTUhCbDh5R1NEeC90c0VCKy9tVEt3ZnFTaWlJ?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e84c11c-8467-4386-54c5-08de27572980
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:34:04.6617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLAo9O3RJgLVaQzKymKykjmjIrkSxFsbfw/rD3G+hXRYETA5IDj22y4Eu+9i8HBQfTIrHs6RUOA42tO2o67/pcQdae+G3PSIegjeIfxeu/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7747

On 23/10/2025 10:12 am, Teddy Astie wrote:
> diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
> index 612e08bcec..a276518c52 100644
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -411,11 +411,8 @@ unsigned int cf_check io_apic_read_remap_rte(
>  
>      if ( remap_entry_to_ioapic_rte(iommu, index, &old_rte) )
>          return __io_apic_read(apic, reg);
> -
> -    if ( rte_upper )
> -        return (*(((u32 *)&old_rte) + 1));
> -    else
> -        return (*(((u32 *)&old_rte) + 0));
> +    
> +    return rte_upper ? old_rte.high : old_rte.low;
>  }

This hunk introduces trailing whitespace where there was none previously.

~Andrew

