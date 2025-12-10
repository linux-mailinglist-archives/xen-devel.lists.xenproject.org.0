Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB5CB30A8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 14:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182939.1505749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTKOM-0002BU-M8; Wed, 10 Dec 2025 13:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182939.1505749; Wed, 10 Dec 2025 13:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTKOM-00029g-Ii; Wed, 10 Dec 2025 13:38:06 +0000
Received: by outflank-mailman (input) for mailman id 1182939;
 Wed, 10 Dec 2025 13:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyob=6Q=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTKOK-00029a-6o
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 13:38:04 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71f64e04-d5cd-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 14:38:01 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6477.namprd03.prod.outlook.com (2603:10b6:510:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 13:37:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 13:37:57 +0000
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
X-Inumbo-ID: 71f64e04-d5cd-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hds4VoQtTcVRZ/9xDS6ZHab7LCDJ1JwXxmzBcvficxjVM5KFSEerS1VXs2g8Ko6zDlOxQce4HPizY0FSyx8hfWVEjFBuFvFa+6Qwfj2L6PDbEN6Gb98XhTi2O4HInc3hK7rs1u14W/ueXyJDJbZR9gH1cvvxj8++xq6ouIdzkEIIFf23wXZatej3GxwGXHLppiQ2ouJcl24nXfdw2iTQ086ORVtR9tk9qLCpC8TH1MRHsqibUsF5Dc1pFgq1aUaOGRekJ+hi0aJozSikhIKmc1dUrKxfmI5fR8ml7UGX4BxMgUoJc6y7vufB3b5vuOh/vCi5xF95j28BcuPBSvaIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIPqpbdKTsK3FQeIqYMORvxpJqjA3Cbq4RtGZ/o4C5c=;
 b=HMONwWHefrxbLYieCVTk/vd7+kagXySMGo5YwkZ7ccqUPcUypgqICdQIjC3bwIWqKo673NZ8wM+xRBvL4WAKpxi2OvfrNEFGjERYdU+p7nqaJpheegGPPozUDHreBp5OAyRL7BH8icK1NcH5eUIaCmhl4hkagm73K7X20Tvom3V1rvesT0CeeV+xapdTgyQW1c9WZvehxYt4wJUB4JSaL+aitAuuaKTQmemvj5xQCsh8admZTV3V80mhMSjVPBNPfNl3kFGY/Jab0BnRV48bwHciE86QsJf7W2vhW+1dT+/LpcrrfmRefFXYIhRybvN2REDNTGe3l3nRI+gAPTYTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIPqpbdKTsK3FQeIqYMORvxpJqjA3Cbq4RtGZ/o4C5c=;
 b=teqvEAj9cLADQ5AeDgM0GF3leQpnJ30b1RL0TNdsNXz2DElpz+xhIkEazrphLvXNep/TtlpDFuQr9vrED8pUqV2PV/1eTXQXzGaSszR905ZHouOeM95KxAysE8dQUYk88uDjMrKWtASIMkYmFie5KLhWcUGJlC8GczqNcLck7Hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4827eec7-1452-4840-a151-1f5deeff1384@citrix.com>
Date: Wed, 10 Dec 2025 13:37:54 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/6] x86/cpu-policy: define bits of leaf 6
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <8791387c-2799-4e0b-b187-1900b224a101@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <8791387c-2799-4e0b-b187-1900b224a101@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0602.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 828d9240-e36d-473b-bcb8-08de37f1545c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3Z6QWFHZlozT2VxME15NDJKOVd3azhvaEhsRDVUQzdaL2FOM0szNkhMQ3Q5?=
 =?utf-8?B?K0ZwMmQxeHNucjZQd011TE13QlhDRW9zek9JL2c5WnIxYnhaMFJ3enBOQmpU?=
 =?utf-8?B?SkNNVU54U2d5SnR2RkZrL2dOUWpYLzhKOW5WMy9aVWRiSmpPUkhoWEZzYXlI?=
 =?utf-8?B?Y2I3SWpiWXA2cllUeEhIWVVKUkhNM3RSeTZSczJKSGdFNlI3R3FQL3FSZ3dy?=
 =?utf-8?B?Q1FtUzhIUnBPQVpGckdFTlM2VWxKTGRFVDkwdU44YkZ6cTlSWHpCYVFvZmdG?=
 =?utf-8?B?RnVOVnd0dWxXS1VGMkxpcndvVmZldjNaNGdkbmtBZzBDYXVLVXdQYnkvT0tw?=
 =?utf-8?B?ZlIrK3ZLdEc5SE95RFZuWWFXQXZQNlFwR1BvVXpkMXByV3JCUHZUbDN6RWgv?=
 =?utf-8?B?OC9veisyS0Y3ZTZCQ2ZZVnFsSTM4RG84UzZIQUU4VXlvS3VmM2FqVW5EQ2dX?=
 =?utf-8?B?V0Jodm9vVmh5QkNETTI0RXdHeXJaWWt0WllDSVhZRjZpL3NVZ2VaamxSMVIv?=
 =?utf-8?B?QVlGLzdVQUluVHV2SkdQaEw0ZWJ1cm9LS21rKzBydHhvc0NKa1JXRlV0ZFJS?=
 =?utf-8?B?VVFWdUtucXFUZ2Nxa214L0F3RlkzaFdKbi96aUk2T0l6ck5DTTF1MHI3MjB6?=
 =?utf-8?B?eDY4ei9BalZhTlZyRDBNK2lvTGFNcU5RdGd1c01xSHRqWk54QXV4ZHlaRmpL?=
 =?utf-8?B?QWRrT2tDOWpHeEI4aU85Z2dsVTl4WTZiMXlFbjBSaDczUjgyODBBeEJmNnZi?=
 =?utf-8?B?MTdKWkJGOTIyWVFuVDUvd0loU0d3VUNDQ1NmcjVHc0tWa1hVRkxNMzF4allU?=
 =?utf-8?B?WUpsdUlSZmVBdU9wVlpCcTFHQ1ZHT2tPdXlzeTR4NkFwSVlLNzA2d29HcVI3?=
 =?utf-8?B?VkRSOXhZajU1Qi9sZGVSdlFxV3o3RGFuYkRxcm85R3cwVTdMdUlGSC92TWo0?=
 =?utf-8?B?MElUeDZUeDV4TE1EWjFESDRrYTg0TFYxUkJNd2trT2RqbmFjUFQrdE9UTXRu?=
 =?utf-8?B?NS9HbUZBQTVzMDdjb0lDd3pKQUFoQ3JaTDYySjNJWEQvRW04NXJ4VENJaE9T?=
 =?utf-8?B?NFg5TW5TN1pRZlVSWW1aL1NzV2lBSW1RbmRGc0pQd3Vqa1pOTHkwaVhvVkdF?=
 =?utf-8?B?MXZ2NWdEeUswZDVXdmdDeTVkc3ROL29TZ3VLVmY4ck5Sa1J4UlhpMTFNYnph?=
 =?utf-8?B?aWFFdGY2TjlCRWxRYkUvV1dQVUNHSStkTHRKMkswc0YyTnZFUVJaWGFSdWEz?=
 =?utf-8?B?NjBCQmVGNmdkbDNmV2xNN2s5cFBMVGRTbGtvcmlnT0xTYlVxMUhkYVgxMDVn?=
 =?utf-8?B?Y3QvYXduRFNNcU1xWUtiUXpPdkU5bEY3VGN4OHRhWmdza1dDaFdtQnRwZnhY?=
 =?utf-8?B?bmVWVEZzSmpwOUM5dk54T0JHYzF2QVo1TkRDY0JXN0ttK3FWWk4yc0pGK1Ey?=
 =?utf-8?B?bFh0SlUzdk9yTy9kbDNHd0piazRESTVXU1J3QTdxS2U0UzQ5bFo4MzVMUGl6?=
 =?utf-8?B?a1F5c1hXN3V2cjhydXhxWVJ5aHpOamVUdHNQZGI2a0I3T21lSzdZeHU2Njk4?=
 =?utf-8?B?N2JldDU1VGpLWlYveXc4MmdhS1RxbnVJNGViNzRRTDVPY2RvTnBkUUxiL1dQ?=
 =?utf-8?B?VFY3cWphdUpQelZlL2g0N2dyQXdua042M003MDJ1OTNNazlHUXJ4SFRubXY5?=
 =?utf-8?B?Mlo4WjQ3QkQ0N3N2MDZvQ2lETXVNV0gxYkorWTJoRVpBdmVQVFJDT21kR2R2?=
 =?utf-8?B?UXFCcm1NWjdzczZEMXc1YmZSbjFEc1RLL1prbzdOVE5vUUNJZUI1ZmljODEw?=
 =?utf-8?B?R211MFVxTm9HMU83UWNhYVlrd1NvZDRjdEwyRUV4YW5NWWFOdWtRbndjZXBB?=
 =?utf-8?B?ZHd6ekVQMFRnQkRrQTNGZmgzY3hUTlFSMEdhY3VFd2pUY0FObk12eFFXK1J6?=
 =?utf-8?Q?480Wb05NoXOL39t04hZY6kcDi44Yo2Mn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZURpbHNOdDcweUZHUWcvV1I2YkI5M0NBK1JsbGsreCsvNnl3UVpTQ2QyTUxN?=
 =?utf-8?B?NWRDNkpUeUlsWEM0aTY4cFFwa2h4cWdneGpiSHcrU3JGZGsrangwd1hZamEy?=
 =?utf-8?B?TXZYSDJtZWJGVVNqaE12WFc4T2dFMGRKWUNqcTBTaXhsdkpZU1NSYnhQRWdW?=
 =?utf-8?B?YnBVdU5DcGdSSGNjVW5Mb0NIZzNJRmE2RVo0ckQzN21yRExybzFYVUJNREl4?=
 =?utf-8?B?TDRaZGlDVkZzOERWejN2ZmdIc2pqQ3hGYndSMW1EM3N1bVJnWmQ1RUVvOTV6?=
 =?utf-8?B?U3ZmWk9WLzQzMlBPaW1udXhLd2RRckNOYVVHVnBiV293T2pqdE9VcGRpOVhw?=
 =?utf-8?B?QkI1T3E4VTZKanptUWxnNjhXeHdEeHkyQW8rZyszTnY3ZU5GTzQ4NlhhdG9E?=
 =?utf-8?B?U3dWTzFYQlFJNU1mQWp2NHBiQjFqdDdsaHVxWExxYmNDVHNUYkVuekpJVU1N?=
 =?utf-8?B?eFB2Z1BHRGpIa3dsWTRXa0xtZE52UkZ6QTZjZnBpelRMaHBvYldmYzIzbGZI?=
 =?utf-8?B?NzVPbTFMdDdodDN5OGN3SlpQcWJ4VEtpWmUycm5hVmZ5VGlZc0xLOW1pbkZz?=
 =?utf-8?B?d1REeHp5aFFPc3FueUlOaUFrNzJHb0laRHZzN3VIVTN4aUIreFlxOGlHb0k4?=
 =?utf-8?B?dnpEY0hMRDBVdmxsZGFEOE1zeGRrVlVKWWp0eXBFVkRxWm9uZVUwaUJUZU1v?=
 =?utf-8?B?TktwTEg0RCtoUFR4R05HbzQrUFFyZnRuNENVRkU5ZHRlT3doUEJvZGkvenh0?=
 =?utf-8?B?aVREckprcXpEZitjRFovNE5vYXZjQlp4Q0dyazl0NlBBczh2eWE2cXdYZlBI?=
 =?utf-8?B?UEFmeWVFdERob1JpRG9iNit4blpsZ2lqNXhyVlVCVzc3MCtOQnZldnQ2RTg3?=
 =?utf-8?B?Z0FPcUpwVVlLekRXWFEvdmh1d1FRK3dML3ArVnlBbDNyL2thT1Z2RVF1elM3?=
 =?utf-8?B?NmxDREJlQ1FCZFdJUU5sWitrRlJDTTVsWTlhZ2lUMHFOT2VVTDY0S3ZiNHUr?=
 =?utf-8?B?VVVIOXRvTm54akZPUk9SbEpTOXBGWVJlQUo4UDZhRmdycWdNMzlMR0plcG9r?=
 =?utf-8?B?THVzajZiMHh6T1d2ZTZnNTluQ1BSWlZkdXppb21PYytOdUUwSWZJUS8vd3dC?=
 =?utf-8?B?cy8xQ1IxNmw4MCtvd0l3UWhJQitzajkxMWRkYzlmY0kwMUlNSmhvNWNWdlE0?=
 =?utf-8?B?R0JkcUVKRzc5elExRUp1LzFYOVdIanNmempxVVUzQkVHOGFnNmtXWHJrK1Fr?=
 =?utf-8?B?YTVqZ1lSbjNZWkxhbzdIdmQ4UlVEcWxXaDJNMDZPbG93cmc2OUhWeENkYjFO?=
 =?utf-8?B?VXhUMll4RVVsTlZTS011SXVJdGxDdWdlVzJxcVRqRlV6c2lRTWM0eTJlUlBx?=
 =?utf-8?B?dUNMMHQybzM3bXNoblI5TzhFR3FuQVE3OGE0Z3ZRYUdyVEpXaUxWVllEa3FO?=
 =?utf-8?B?TERLaGVPYUZydTJYVXdEMFJPNDdSWEQ4VGNUUDlpbHlsTUFoQ3JjM0tLUXJG?=
 =?utf-8?B?NklSK1VvdEtRZ0RpdHdHZ1IvQUg3WVpDY0F2bFgxWmNtdk1lY2tra2NleGxx?=
 =?utf-8?B?SVJMdDBmVXd5aU5UQ25zajFmQzBubk5GUDZQaUtOaUZSUTRmVUcwZkd1a0J0?=
 =?utf-8?B?cHIwN2RCVXBCRlZaVk9kdGlPbHpZRndYZExlL3ViYjk5VnQraUtxRksvSW5Z?=
 =?utf-8?B?RzJCUDV5OWlUeG5NSTdxL2VOam9ITk5GdHdWZ1pGaHFVdmtaMC9GK0w4aUN6?=
 =?utf-8?B?amdUSzQwcHY0ZTRwU0ZWVTloTmJrYjYweVMyTXBDeG1OZEI3c0hEMHNCdmFY?=
 =?utf-8?B?eU9aZEFXNGR6SEdxS2FKdkg2YXpmMUxNdmZWM3lGY1p4NTg4L2lnMkxaeGxN?=
 =?utf-8?B?YmxoQTVpcmlra3VMTnJFRmRJRS85L0F1ekdlMEZBaFRDU1NENHNqaDFkZWtx?=
 =?utf-8?B?SnBqeGgrM25SaEdBQ21ZMi96cXRabUhZR29lbSs3L0FYWDM1QzVuMnc2bUxr?=
 =?utf-8?B?b251dmY4bUtDZEpCMlRab05oTTVjVitBOHVPUE52NzJoTjdVSlZEVHpFYnhD?=
 =?utf-8?B?OVpDcFZYcXRqendxNENOaTR4cHgzZEQ1SitncU5hZHd5Wms5SjNMcFlVYmd6?=
 =?utf-8?B?eCtkS3IvYzNEOXRrTEd0M25nbEkxaS9jdTFqenpRd1Z2TWt3S3BaeitJMmFx?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828d9240-e36d-473b-bcb8-08de37f1545c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 13:37:57.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVe+u+KgR1Nq0fvxRrM95QQL5oowJhcD+TbrAMsXWWZAUvGYG8ieTSTo1M8VgxYlrpM0aXHMluutTUBWZ2ZgKlJOO2IwIS6L9apqo9Bcufk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6477

On 24/11/2025 12:23 pm, Jan Beulich wrote:
> ... as far as we presently use them in the codebase.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Or should we make both parts proper featureset elements? At least
> APERFMPERF could likely be made visible to guests (in principle).
> ---
> v2: Use bool and unions.
>
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -121,7 +121,46 @@ struct cpu_policy
>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
> +
> +            /* Leaf 0x6 - Therm/Perf. */
> +            union {
> +                uint32_t _6a;
> +                struct {
> +                    bool :1,
> +                        turbo:1,
> +                        arat:1,
> +                        :1,
> +                        :1,
> +                        :1,
> +                        :1,
> +                        hwp:1,
> +                        hwp_notification:1,
> +                        hwp_activity_window:1,
> +                        hwp_epp:1,
> +                        hwp_plr:1,
> +                        :1,
> +                        hdc:1,
> +                        :1,
> +                        :1,
> +                        hwp_peci:1,
> +                        :1,
> +                        :1,
> +                        hw_feedback:1;
> +                };
> +            };
> +            union {
> +                uint32_t _6b;
> +            };
> +            union {
> +                uint32_t _6c;
> +                struct {
> +                    bool aperfmperf:1;
> +                };
> +            };
> +            union {
> +                uint32_t _6d;
> +            };

The _6[a-d] variables are only needed for the featureset <-> policy
conversion which isn't the case here (notice how you don't need it the
series), and we're unlikely to want in the future.

This wants to read:

            /* Leaf 0x6 - Therm/Perf. */
            bool :1,
                turbo:1,
                arat:1,
                :1,
                :1,
                :1,
                :1,
                hwp:1,
                hwp_notification:1,
                hwp_activity_window:1,
                hwp_epp:1,
                hwp_plr:1,
                :1,
                hdc:1,
                :1,
                :1,
                hwp_peci:1,
                :1,
                :1,
                hw_feedback:1;
            uint32_t :32; /* b */
            bool aperfmperf:1;
            uint32_t :32; /* d */

and with that, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

