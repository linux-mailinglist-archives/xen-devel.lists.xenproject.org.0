Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB70CBC18A
	for <lists+xen-devel@lfdr.de>; Sun, 14 Dec 2025 23:51:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186593.1508046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUuvS-00079j-DT; Sun, 14 Dec 2025 22:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186593.1508046; Sun, 14 Dec 2025 22:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUuvS-00077z-9Y; Sun, 14 Dec 2025 22:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1186593;
 Sun, 14 Dec 2025 22:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h2nc=6U=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vUuvQ-00077s-9t
 for xen-devel@lists.xenproject.org; Sun, 14 Dec 2025 22:50:48 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52e405db-d93f-11f0-9cce-f158ae23cfc8;
 Sun, 14 Dec 2025 23:50:45 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5514.namprd03.prod.outlook.com (2603:10b6:806:b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Sun, 14 Dec
 2025 22:50:41 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9412.011; Sun, 14 Dec 2025
 22:50:41 +0000
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
X-Inumbo-ID: 52e405db-d93f-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POyerOVFp9Z/EorRvkCPkMn+DhvxUPk15ruCf3ccJpzdTIXHEqKELbFhUyt6BHO1nApnpU9/KnULBOVxKq3Wf+Ym9n8lUe3PHQqqc0T9fxRAl5/djx6duG0Dh2AyLPWpcIjzFyl7lfL/VvZhmv9kac6DALsacSgmWtcM97iQ+XLi8EROXMvAXNY27kljr8oXSO6X3ldBxkr63Drv3vSSnO7H9FB/giTop8LFNFgznJy12evP7o4ENLocREoEercYkLwGefSW8DkGU3dfROpbYAWmBE46uXSwDac0dyL92QyXknKOnqHdjFtD2u3mhCFI/tzoUV15aI8LcUabfqpn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0wnGqpTRdLHwdi/rtzktp+W+Cx0CT0bsqk74y8suo0=;
 b=I3BrN1sTkKcBBGh3U3nbKBfUzJW/lxRr1C9BUyRpAUwcvF1v8cD+4ITUx40fidxS8is+8TFM2b/C53qez1khLphnfOcZBD9GjW78wNCPBOtY5j4Rw+0p+TWgyQiJpDInhZl/sQpKBMXL6DfqNkyuSlhmc1GwMNSF/1lGNl2nTNImiNEFl9RrDVzr5zPZEvIE8f1tbLRIu+69BhdDVfOr0YMtwHS8JHpKeIcMyogQfrXHhW4+MLbGslqJAGlWE5QpVSC6/puCLCBJfb1iLONNRCVECp5LG3I9c+AC+4CRoLWbl6+RfJa7LyiK68LN29nXskA7xqHtVTd0lF1tKeK9nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0wnGqpTRdLHwdi/rtzktp+W+Cx0CT0bsqk74y8suo0=;
 b=rKetC6iErSGGJX2l6LBhVVqJAiuh/3ErfxwhsHvpFe8aIRI+noCuYzuabCxmPrVY7eYIb3gmJhkukZrHVbI9oZUjcogiva4U7tstrNEEFHDEJkSEnpn6bWP0kUJcCukuR+1IM4VrGHy3HfROUHchimuhsKQAkiJFzSKZ7/Ccp/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e0c8ffb0-a916-4c78-bd5f-010b9a7a8bc3@citrix.com>
Date: Sun, 14 Dec 2025 22:50:37 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Undefined behavior in libxenvchan
To: Demi Marie Obenour <demiobenour@gmail.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <e06eb432-289b-447a-8c3d-43da4705b4e9@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e06eb432-289b-447a-8c3d-43da4705b4e9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0045.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f5c5f7-db5b-45fa-7951-08de3b6334de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVhmMkFkZUE3ZTJEZUVjbzBDOFhOSE91bzlRZXIxbWhLOG9kYnkxOHBsb3BJ?=
 =?utf-8?B?c1BYaWpkeUR6SGNKQVhiSTNtMXVkT2JBTm9hRm5iTlFYa0wrV1ZSaVVpbTRY?=
 =?utf-8?B?bWlYaEg5R0JsNnlsN2NnbXVZckZSOEdHbHE3ejZNUnVTaTM3N25tL3VuYm5E?=
 =?utf-8?B?KzBpa20ramhleFg4enZibFZZN1U0WUsxS0hqRVNHbWorUDdMVnM0c0U2dktR?=
 =?utf-8?B?YyswSEx2MHFoL2lGeVExc1kxMndRQWcwL3JVRVRrQVVJL1QyMHNYbGc4UU1z?=
 =?utf-8?B?VXBBUFZLVjNOY28wWjlwWnhJUDd1R3EwY2wrNUl0WjVuWVZaK3pmdFdmbUkv?=
 =?utf-8?B?bFJpdFdWMDFFY256QVhsRTdrWGRqS2gvblBYaWlDRFgxdWgyNC9PdUFEVDJ5?=
 =?utf-8?B?azVDb2xITnRxSWhiK3UwaUI0T1RzRjd0RVFHdjVOWi9PelNKN0l6aUUvZkV5?=
 =?utf-8?B?UHg5UUNiRHd1elB2YUR6bkNSK1NFb3krRERoYXRhQ2s2RnVUeDdBeHpqVEMx?=
 =?utf-8?B?SkFhYlYyQm9HeEZydjdVQ2xLMnlhMU5CYTR0eGhFRXJVeXFJL05mMlZzcjJh?=
 =?utf-8?B?TWRmNkJRZVRQSTh6QXl0WnJHNEJ2Z2VCRW0zSFFMM2k1dXpFbGJtLzV1Z1dp?=
 =?utf-8?B?eGgwNVVTVGpNalcrdjB5U05aME9ySy9SU09jT2pYa2JnUGI0QUhPOTE4L2hy?=
 =?utf-8?B?VHdybVNhRDc1UFdzLy9UVjRiZXZkS1RNaXkvQVl4Zkd3Qk5Yd2RqMGg4RnlH?=
 =?utf-8?B?M2tQT3RCY2V3ejJMSVViSFd6Y2pRdG1aaUk1VkpKM3NIc0tLaUlZZWQzQ0Jy?=
 =?utf-8?B?NGpXc3NYVVE1d2t3djFLeStNcjUrZy82OTJtemxaZUxTVUMrbDZPSHgwbHd3?=
 =?utf-8?B?clg2dHlDNHJTeG5kWHd3bmt5TjBKb0dybC84NzloZGVTbFZSZDV0NWJJQVA1?=
 =?utf-8?B?L3BlNTQ3Wjh4Y1JjUzBKa01mYjBRaVc4S0xXT2lDd3FYcEpjdUI5WVpydlNT?=
 =?utf-8?B?WWMvTEMyTEtIbU40MEt1a3R3WXJXOE9EUk5FTllSaEJxOWZmckZJSm5veCtX?=
 =?utf-8?B?RG9udmxUM29oZEpGTGFnMCtuS1I3SjVsdHJQUHdPaUJUVXZrUFNsZjRZM0pm?=
 =?utf-8?B?QWJZSHhlanY5SG01N0dHbHJLNEMyQUsyTWpHMUpPVXVRczh1Zy82clo3ZXB4?=
 =?utf-8?B?RUdKT3k3SENoWGZDS2tjUWk0U0JoWU10Wmw5V01GcmFXa3lGQ2w0bGNUMkdw?=
 =?utf-8?B?QXJMTEZkay9LQTRwN0NLT04zWnA1ZnNIY3JGaFpaMGZ6bHc2VksyUTczL3ph?=
 =?utf-8?B?TUNXejBHU0NZZVVpMUZxK1dGMVdRMUlOK3gzWW9NbkZWUXNkbzBud1V0elow?=
 =?utf-8?B?TGZsMnVPdURzNkNVZzBsOHMzV09kYlhqWE04M3JIS3lKZHl4SFpIbGlMWCtX?=
 =?utf-8?B?VnBzQjVpdEN6T3JjZ0xlZjl3VlFOcDFoQWZLOFU4WWNHR2NmaFlLTFlGRGpD?=
 =?utf-8?B?cFB1eE42YUNZZzBUbDhwaSs4UTZvRms1SXpIYUJHNVc5NjRNZkZ3T0dmYTFm?=
 =?utf-8?B?K0VBblRPMVRscFRHckhsS2s0RWdFVXU0b2NUYmkxWVBaaFl0dVVvejhhUVF1?=
 =?utf-8?B?d2RDWVNBckpCU1pOQzE5enZUUWllRnNDa0p1L3ZQYzViU1NwMnFxbEVMQzk3?=
 =?utf-8?B?WC9OZXpuUlhZdzdiV2dkbUtqdTRTdzFnUXk1WDVrMXgvY1FaNWRqdWIxdVBt?=
 =?utf-8?B?SGl4b2JzOTNLdEVIblJGcUEwbm5nS2t4MEJlWHd0bXVTYmpjNlhQSXBTY3FQ?=
 =?utf-8?B?STkxamd2SXJsUHFIdndXTU1lM21sV25yb0FBUEQ2blV4RkdrcU9lcGJqQ2Zy?=
 =?utf-8?B?cEw5c1ltcWw4ZFhMSmJPK3dVck1vUzNOZm9wQUZyanNLNjN2eXJ2d2Q3S3J6?=
 =?utf-8?Q?BRXWVPB1BewazPX8+KUx38KwI77Gd0XZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkMvRGRjSDljU05zRjRQVm9WQTFmbnRHd2dNUEQyUjg4cVphdmdaRllTeUw3?=
 =?utf-8?B?L2w4WG9NWGUzMG9heWhlMEp3RTVpUkcvVlR2am5EWDg4NCtZVWJmclIzVDc3?=
 =?utf-8?B?UGY5TG9qamNFWUZnSXJFS1M5Q2dCOGhwSUMvM2RBWWpTUGQvZTBGc251TVBz?=
 =?utf-8?B?Zk1tVEN5WElMRUcwTkFaSlF6Q2hYYWtTRHFYVU55QXJRdnRqWDg5Sm8vT0h1?=
 =?utf-8?B?RzRmcW1QVTVjMVpIVEs2aWYvVXFwMGNCbTRLZjY4am5nNitYNFl3aEp6YklU?=
 =?utf-8?B?dHF4R21KVjVSZkh3N00vVTYyaXJBbHBDN292cG5SSXcwdG1DTjBncGFzZURr?=
 =?utf-8?B?OFJMTnRZSk0zUGplL0RNQ3N1YXpSdU8vZ3JmOG1oTVBvTnp5dWhMOS9ibnV4?=
 =?utf-8?B?OXhaSlFjTm85NEMvc1p2dXdvNnFQUk0rZW83Q1NHbXB6cWVDc2NOU3dIWmRE?=
 =?utf-8?B?QzhCNmVHcDZaSkRzeVFjZkhROEhYbVYwTEZqVm1WVmwvVVhpSTQxeXZlT0g2?=
 =?utf-8?B?dUJ3VUpWUkVUSUpFbkpaUG1DWFdKa0U1ek9SUkYzbnh3TXpBNmF5dERmWHha?=
 =?utf-8?B?ZExkeU53OW1hdzlwQ2RFSXZzQTZtVGVIZWFUSnhHZnVqbHVQeXQ0TWxacTlw?=
 =?utf-8?B?TjNWWXJML0RsODFsNndEeWR2cWRKZGI5bGZtdStXYll2SWFMSnVPdGpseWNn?=
 =?utf-8?B?RGF5MC9LcTFxYTlOL3VMMEJwSCtLSTB4TXlaRFhWZ0l5QjBVRmxkQURWMlFQ?=
 =?utf-8?B?TSt6OHdmUHUyUWJneVVLSGg1M1RWVGJ6b2JpV0pQSmJoQVg4VkczNU5BRXVj?=
 =?utf-8?B?aTNRdnhqd2xIaC80VFhZZCtET0duc1NKQklJYXhSREgxWHY0NStHR0F4UWEy?=
 =?utf-8?B?dlQ3Yk8yYXBTMW9BZmcrSUM0Uk8yV3llWDh4TVBrTFFFQ1ZSSVJJQzF6MEh3?=
 =?utf-8?B?K1RsdHpOck4yblBlQkNycC9BcnIrYkMzWXBMR0Y5S2J6eFJPWGVpN1BVQ0hy?=
 =?utf-8?B?MzFxZkFMM2lnTWVUK3ZGZ1ZmM0dMNTFZbXIwWlNOTFo3SUVhWmNKK3JQK1M0?=
 =?utf-8?B?QkZReG9QOVA1Ym8vUEZVK3Bnck5mMTFIbndWeUsvcUZHalBZa0lkc0gvYjVa?=
 =?utf-8?B?TlVSc2JLdCtRb1BmRlhtSnF0MUJMbDNKWmpuKzhjZnZXUTdUL3JidzczTGNy?=
 =?utf-8?B?SGdUb0RLZkZuUDJkeHFtNDQ3ekJnL2RHQUlIMXlxV3dCdzJyVVROQ29zUVVR?=
 =?utf-8?B?ZktDbDUrZWJ1Ni9SSWxmdytPT1NtRmg1TFhKKzh5emc2c0dVczlmREtsY3hk?=
 =?utf-8?B?eTQvOTY1dnd4YkNBUVp3aGtnZC9TdUZQV05JaWVNZWRXdDhoL3VaVG9MckFv?=
 =?utf-8?B?dW1oUm9wQS9FSlBHTWNCcHhxS2RmWWt1dWlRNjQ5ekpRU2FrSkNFNFY4bVF1?=
 =?utf-8?B?VDBick1neWRIOHNkb3NYaGRLUjVjbU12KzRwSTF6c2lFWlhqcEs4NTQ4TVRm?=
 =?utf-8?B?bVIvKzhJeml6WkhTditMREpaTytnM3FmcFR6VzVISG5XWjIxdmx4SHNjSWFY?=
 =?utf-8?B?NTVoWTgyZlo4V1I2VFEyc3JXRG1uRko3OVJaTnorNlRKZ3hpRVlzbmpFTUM3?=
 =?utf-8?B?RXVXY1hGQjdKbU14LzFGVHlyMHpVcVpTQ1hEbFBqQnNsMVdsSHZOaVkxVGw3?=
 =?utf-8?B?clFtY1ZQN1pSVEhJVEJHSUxXQ2d4VDJmQ3ZTRTVXeDYvdzQyWEtsd1ZUNXBV?=
 =?utf-8?B?cmQwY2p0MVJNZEVvMi81dnkrb2JjYVh1UU5CWjFiWTBrZkJUZjc2amZYSXlu?=
 =?utf-8?B?QW9UV2w3SmEzK1BoYWZnZWpBUVJkdDA4UGV1SG9INHFocGNWbFJ1U0VKcGFG?=
 =?utf-8?B?bGNpaWVKdCtUa2V5V3pLTDE1VldQeWZlVDBXVGN6Y0p5OFU5bDZYdEJ0ZnlB?=
 =?utf-8?B?aWl0eHkyYTR5UGR6STFjaU9SK0tmOHRvZEpaRTNTQ3l1SkZGV2pxUStKWHVn?=
 =?utf-8?B?clVFYzVKdVJWNHVYZkhWMFNUN2lvbzRra1RGbEpja1MzMDZVelBaOE9nU1BS?=
 =?utf-8?B?RE5UV0d3bmtoenpydFdKQ04yVktQbW9KVzd3bWZBZnlZR0ZiY1ZNbHZIeEx6?=
 =?utf-8?B?RjNjVjZxMmwydC8rNk5LaU53bG5wbXU0TTJRZytSTDJFbVFxNW5yd1MwTDB3?=
 =?utf-8?B?WGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f5c5f7-db5b-45fa-7951-08de3b6334de
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2025 22:50:40.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhs6f4NLiBOWixLWWxnB1xLL5IzTl9rawsm8GJlJ52RnP5/u/vbz3LTqOxA8v4+3lw865qrxNQBs4bXRUycJk4Ij3bgJ7/1wcH8mxhH25MI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5514

On 14/12/2025 7:09 pm, Demi Marie Obenour wrote:
> I noticed that libxenvchan has undefined behavior: it passes pointers
> to guest memory to memcpy() even though they can be concurrently
> changed.
>
> Would it make sense to reuse some of Xen's copy_from_guest() code
> instead?  There might be a licensing problem (GPL vs LGPL), though.
> I think the only approach that isn't UB and has decent performance
> is to do the whole copy in assembly.

memcpy() is well defined.

The problem is the potential for creating TOCTOU races if suitable
barriers aren't used, due to the compiler being able to optimise through
memcpy().

Xen's copy to/from guest are not appropriate in userspace.  They're
guarding against pagefaults and address ranges not belonging to the
target context.

If more compiler/smp barriers are needed, then that's the appropriate fix.

~Andrew

