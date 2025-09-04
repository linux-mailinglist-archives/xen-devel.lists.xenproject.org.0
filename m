Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6BEB44705
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110779.1459834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGHG-0001cT-Je; Thu, 04 Sep 2025 20:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110779.1459834; Thu, 04 Sep 2025 20:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGHG-0001ZU-G6; Thu, 04 Sep 2025 20:09:50 +0000
Received: by outflank-mailman (input) for mailman id 1110779;
 Thu, 04 Sep 2025 20:09:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqEE=3P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uuGHE-0001Yl-S3
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:09:48 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b000b5b-89cb-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 22:09:47 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA1PR03MB11060.eurprd03.prod.outlook.com (2603:10a6:102:4fc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 20:09:45 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 20:09:45 +0000
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
X-Inumbo-ID: 1b000b5b-89cb-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bK90QBglhrI2pWx5q7wBDanZirtvzVDpIPEHtjeuqQfFXFschXONnCNcsXei/flmja4f8Ff8ys1kZdaR8Yn6GisSk2D1AxqaTU8eFv0vMovkIErO7TsbggIZeym/9ajEmSYol9d5yzvQJrDziJUoiEcy8hXoBUmkXLoQ87xveo3P+tn2ruWzwBdlSCw4jK5nWvwJlyPKeUwloyhWPbe0Ynz0qBKO5Nu5qq9zzmBv9RrYX+vU0qCDVIpccl0AApChM+cJAG83t965Et4YDMcZY3WCXexMvlPYKYh+N9hzQaVO9wZbA37rFveyq2v8CDPUZN3rYEq46J+SrNT7Oh/Kmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCN9x4JRfuUCaCtfz5jfZntfsG24fKF4Hhqu4l4kko0=;
 b=ttNL7zipo4bcXnRdqFVi4S8p2L3/c/3JqfuIvIMgdCnTG5hAttSNHlxKNesV5zI513coQZK3MipkovY7D+EZAOIjIPIsh3j9VE3nsVGZhipRthU+yWwLTXt0PITcH33a5QOXVxrAohptrvYq5ntxzZ7E7U1S6+kanr9oAIbVqTAdNEn1RyMXbJtblBarl9p8Ks33/uDgXuwQc4kXpXSAe0sDbawhbO/qXuscBkiiyGKw/ai9SN0iSjRQ2aT6xJ8PQICg5OoTNkC+eMxHiTFuncL52+V88r+9EuN3mfGyP5oZFR10oC0igtaRDQSbiqH50kLoJKZ280E/2XZiPiY1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCN9x4JRfuUCaCtfz5jfZntfsG24fKF4Hhqu4l4kko0=;
 b=iMlME2k0mTdUpDomSvx6NwXWkeYN+/5DR2G5lME5RHE7hDRHjT2AP25Pessc6vJZT62+a1RoYzloJqBcR8VkOV7UeJyzKBsA2eyNu2sD3rnux/5wCPjplxYoCbCKGXi/KaEr53+sYvhkoSZXs/B0GJJ1U+fhHHJQTzbqp5wp482WriUVNffvgtr5+MFzxzDPe99PHSXTeyMIrdyqUZgbjHld+m/2UemSwYUoPwQ1cAZSltmEZTu/7jnCPAJeJCXVm6QiI2Z1x0qqriDE4H2B69VqzaUR+3KuNJGW2LgVRTA1iuLPVFPWqcjeR3CGnj3TOhmhXnYH4wfogp7eEuAsfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <540abaa2-9946-40b8-bf49-b54e4f7a1393@epam.com>
Date: Thu, 4 Sep 2025 23:09:45 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
 <20250806094929.293658-4-grygorii_strashko@epam.com>
 <87ms7l39gl.fsf@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <87ms7l39gl.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA1PR03MB11060:EE_
X-MS-Office365-Filtering-Correlation-Id: db645ccd-ac78-446b-3a00-08ddebeefe22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akNWZkRXazZySFhxRWNzVXVWMVl1bFAwd3JpaFBrMmJ1QzJabllhclN1Z2Nu?=
 =?utf-8?B?U1lGVUZEQ2tTMFZxbUw1L0dlT0QrWG9GR1FKMlA2eGw2U0NmdFR3eXA2VFRv?=
 =?utf-8?B?anl0cHRtUW1EalU5U0JsR3l5UDVGU1BJakpjNHJJVlNiK01CbjZ0NW5FSDdG?=
 =?utf-8?B?dkxCNXZ6cTBySWFPcW84dTlxSnR0ZmxrQ0RydkkwTm5wY3B2WGNmWGt1RWti?=
 =?utf-8?B?Wkg2WkIwQUFmemlONGVnaWpzdDdFN3poZkNkZ3BBbVB3M3N2Wk5RcVVrZVF2?=
 =?utf-8?B?ZXdrRzRjQ1VoV3NlTXl2NWFUQ2l6S0Y2YmI0d3pUSkphcGNMVnNQc2RCeERj?=
 =?utf-8?B?M2R6UVR5TnZHUjNaNXUwSG1UcHNFYXFka21yOEtnUVFzVEZ4ZG5teTN3QWdX?=
 =?utf-8?B?YytZaSs0RVJaelBKWG0rdk55ZWdiU3gya1dXM1BzcmZ5aEQ4RXd0OS9mUDlX?=
 =?utf-8?B?bExCYU1iQ21UaWlMSU4vYS90SmFFSC8yZ0pTa0lNNU9XcnlDYUxjNmJRRE5a?=
 =?utf-8?B?anBialM3cmQzRlBhUm1sM1UvbjlJdG0vTGxQaU5qTloyRk5LR09rYndOSlZX?=
 =?utf-8?B?SDg0YTNDYWE3dE9UUkZKYXoxRlhZTW54ZW5TaW8yQk0zZnNJN2toN1piUE1G?=
 =?utf-8?B?QjUwY2x2SE5HQ05iYnFHSnh1cWIrRGo5SWtDVUFiUWZOSUJFVnNaWXVBSjR3?=
 =?utf-8?B?Mit3eTVWL2loUysxYTJ5NE8reHAzN2Fvd01jY2U2ZUZKbWQ0L3VVNEJaaHg4?=
 =?utf-8?B?TFJoUTlCU01mdUs2VExPeWhFOFhsSlQzWDRTYzVQVW16UFdsNFhoRUFXNHBY?=
 =?utf-8?B?Z3JGaWdPUnJNSTVJcEVhTThNMHRiRlFOdldnOTcwcjJqblFsNmMwMGJLQ29j?=
 =?utf-8?B?ODIxcUUzVFlYdTJvSzJUMFY0SWQ2dUJ6ZWYxNmhVQzRiTVA1TE1UL1Rqb1U1?=
 =?utf-8?B?d1k5enl2cGZVYUtvOUNDcWFGNUVSdHVmZndGajgxSVlmUUdkWnhBVlV4c1ZD?=
 =?utf-8?B?RThtVSt3T3dqblJzTXpBWHFHODU5U2YxSGdTM05ONWs1cGphNEF2dWcyby9U?=
 =?utf-8?B?QXl2RitZZGVIQ051M1ZseVBWZDFWTlFuQXg5aVo2RDNVVmR3dXBJUDA0NCtL?=
 =?utf-8?B?STRpcFA4eTR6MW9vblFuSVRpUkYxVGRCWXA0ZlhsSjN5UDNIaXVCN2ZNSzlD?=
 =?utf-8?B?anBpQXRqLzcrWUNTZ3FCbXdXMlNhc0gyVEJxYk56dDZidzgyRkR4NGJzOVN1?=
 =?utf-8?B?OTkwY2VkaitaSVp3UWJUZ0NzTVNHeTllNHB6TnZGZFBnMFdGOXVyS3JzVEFn?=
 =?utf-8?B?NTFJZVM2a01iMlZkcVNTQmZkTCs2anUxVFJqazhqdEd1UDlBQ3F2cStiMWlN?=
 =?utf-8?B?US9UZ0hLb0RaejUwa1ZoLzRYbjYzc2RYZHlZU3Zqb1ZXODVGQVpZMTlhU2d4?=
 =?utf-8?B?S1owVkR1Z01oNTVUMHN2Uk5Ya2RDQWpTeC9sOXJUTEZ4bjJhckRwTFJEWVdt?=
 =?utf-8?B?TFNaeE5jME9Wc1V1akhZajJWQmVncWRYd3dLdW9Ea1J3YTNqbjc5QWV3aWt3?=
 =?utf-8?B?VmhWMTVrbXlOWjJHU2NOckRhdDRvTEFHdmhyRGRmbTJ2YXArWVRqME1lb1Vz?=
 =?utf-8?B?WkhtS3RqczVvMm1talNPNkY5My9NL2dlVzFxbUF6WjFnVHVLaVJpRWdLUXRa?=
 =?utf-8?B?ZFp6QWhpYjBzQzZCZ3NUbU8rYXcxU2hNRFNJUlJQdGdZSFRVd1R2ZHFmcmt4?=
 =?utf-8?B?S1kvbGlxZ3BTa2hPWEpiUC9ZYXB1NCtKamYrTVg5NHhMOHEwdUxrN1Uxblg5?=
 =?utf-8?B?VlBORVdvelhOSXVOaFZpUWovL1Q1dFJyK2JDeHVzcHR6YTVBdzA0RWtHS2Mz?=
 =?utf-8?B?cUNGanhaVjJkNVJuYlNXMzh0eE1MSkFRVVBhQ2t2c0RTS2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWY5Z2xSNWNwZWdPcDVzVGdHZm9mb0dRTHQyV3h6a25RY2ZHcjk3N0YvOEpr?=
 =?utf-8?B?NkN3V243V25zOE9RNk9nNE05azBrUjJSUWw4bVZLMFFiWTk0b1Z0NjFzd2kx?=
 =?utf-8?B?RjFxbUFSQjhsWFEvdUliWURMQk9aeE16eEcrTGswalVWZXJuQlhKSmVqMlhr?=
 =?utf-8?B?NVYrKysyYzRWZk9nU0U1cUUzcmp0UzBPRU5qQlNsSFhxRW9rS1lPQW15QXFZ?=
 =?utf-8?B?UWk0UkNuV1d3KzU2bVNhMENkUlBqam1lQnQ5SGtJVVFPenNKK3RvSE9sNFhp?=
 =?utf-8?B?cjBUWG1Tbi8vaGt5Q0d5Q2Voc3VNRVJyVVQvcFJyZjlBWStSUXZCeVdmbHBC?=
 =?utf-8?B?LzJDR1hQVlR1alpuVUVmRWZTVlFkQkZKSmlxOGZqTm90Y1dKRDQySHdPa3d4?=
 =?utf-8?B?bit6cmhvZXRKSUlUQkZ3UnBBSDlVZTFQUCs4TkVIcVV3bE0wTHR0d1RBclV5?=
 =?utf-8?B?TDNLdmpSU1dLUGdDSjJONU9zK1IxSVVnaFpBcUh5eUgyRldYSkFaaUpoUFp1?=
 =?utf-8?B?dEE3TlFxVTVBcG9Md1NoWE9BQkFJd29UNzdqMGRKYjVwc2FvTU5OOFJjWGw2?=
 =?utf-8?B?WFlRbXgyUS85T2pQbFhyNktSWHorMklQYVc5QzNkWUIzcjVDTHJtTk5WN29H?=
 =?utf-8?B?TTdtUVdqYlF1SkhnSHBrQTN5SlpWRmg3R2xKUkRYdWw0OGIyNTFmNXRNU1U0?=
 =?utf-8?B?d0IrREJPeUtza0JBK1hCSS9sTkM4TVFiNVBnblRQNE1ZbDllQWJ0UDRsQWtM?=
 =?utf-8?B?TkdPMnE0ME8xQ3lrL1dUWS92WjNSUU1rbVdFSHJrZVE1dE5hQ2d1anNJUmVt?=
 =?utf-8?B?OTZhU0NLZ2F4SCtsamd4c2FHOFZrbEl5Y1FodE5QT0dyOTFVYVI5OHNweWNX?=
 =?utf-8?B?VG02dzZRK09LNGhhY0tjUENIRGxCd0o1N0FkaUxTRnFzcDFFS1k1dGNwNzk1?=
 =?utf-8?B?MDhhdFRJWVNVSWpzRFp5eXhENzVmSlh6WTdLZ1BxYXpPcVlISkxsdFhRYWRH?=
 =?utf-8?B?ZW5GN2drNGRoRko4UEg0UVRrWDJsRkp4cEVGcW9Qd01JVVNMZ1VkdWhQUEJp?=
 =?utf-8?B?eE1maW4rejh0Q2lvVXhFZWdnL2N3T0FDRCtuT3U4RGdrZXVKSmFid3IxY2Q2?=
 =?utf-8?B?Q28wME5DRnhGSmprZUxyRWRpOXNuTmRWcHNqU3hrTWR2Q2hZU3pnOExTVVRx?=
 =?utf-8?B?NzNYU3hSQ0lHWUdMVW5HNktvVmtGT3lWS20wWWFlZHV2T25SMHl0ZXFsUHRW?=
 =?utf-8?B?aGRoTWtSUmVjOXl2bmxwS3d6ZDFlZ1hIRHJNT0tSL2doOEM3WmwvQ2FjYlZk?=
 =?utf-8?B?c1phelpNWExHdmttMXg5cFJGNDh6eEtZVlRNYjRhbHNzTE1Uanp5S2U2dWZG?=
 =?utf-8?B?V1VUSlJsUTZUMnNmSmwzYklUc0xpU0ZtbDkyMmdhWTY3eU1jKyt1UWU1aVVp?=
 =?utf-8?B?T2hpSWhWczRCdi9lYnhlNzlIVHhTeUNmVG1MT3FPNHlJVFljNFpyTWpiNzNF?=
 =?utf-8?B?RE5pY3JkSHRKRTMzenhDd0R1Vm4xNTJCa1ZRMHJwNnBhaFZTcS91L1R3WkRJ?=
 =?utf-8?B?WUlPL2QyK09YQTc4dDBDYzR3bFdKZm93Q0V3d0JqcXdoQ0UwektLTEc4L0tT?=
 =?utf-8?B?UVgzVG5wOUphK2lucmZ5bTZhZnhwdU0zbWFleVNlejJLaWM0dXFQc3A4cDN3?=
 =?utf-8?B?RUcyZlNxSEl6UjR5THozSHBBT2RUNXBMTzVYelo5MGZublY0R2VQQXZQU3pu?=
 =?utf-8?B?M3QzNFpmaWtmUkt5MlFaVVdBT3JtdVprK0o1dEkzZlAwT1pwemkwTkR1ZHJ2?=
 =?utf-8?B?aUxodG5zbUVkQTROSU85aXRmUVNiOGx1R0xyMkg4dytUN2MvTHB5RXV5czlm?=
 =?utf-8?B?MHIwWUREVCtiSmpBMU9xMW9Sa1pteENNbzl1enoyWlZJZUVrWGZSOW9zOTJM?=
 =?utf-8?B?VlA0NGVKQVJCZG9pSlI1bytRbE5YN21TeTJMaVpoVjk3MmFZeGwxQ1dCTm1l?=
 =?utf-8?B?U1hFc3N5OWFJZUpkWXlyOG9oN21uRWp6d2IvTXhHS1BRUGdNYUV4OTZZR2ho?=
 =?utf-8?B?a2MyRVpjVHFHbWZtcFVvUlhuZlZEbG1jcm9hV1JYUE53ZWkyMWxra1RYSDNM?=
 =?utf-8?B?eDVvdnZobnByVFNsY2VSNEZKeGpMc1BqUmlBV0lzaTRBeUlFb3lSd3BKR2Q5?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db645ccd-ac78-446b-3a00-08ddebeefe22
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 20:09:45.6266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9vOp3PdeJmkAfrdytJ3YYMRCW0FUQMKiq+MhCBI/idFOeNYLtaBbG3EIC3gGNuB4/pq+84V9r1M7FCSKDEWKd2+xdfsVU/GldMaBAHiosE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11060



On 27.08.25 03:16, Volodymyr Babchuk wrote:
> Hi Grygorii,
> 
> Grygorii Strashko <grygorii_strashko@epam.com> writes:
> 
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Now Arm64 AArch32 guest support is always enabled and built-in while not
>> all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
>> support might not be needed (Arm64 AArch32 is used quite rarely in embedded
>> systems). More over, when focusing on safety certification, AArch32 related
>> code in Xen leaves a gap in terms of coverage that cannot really be
>> justified in words. This leaves two options: either support it (lots of
>> additional testing, requirements and documents would be needed) or compile
>> it out.
>>
>> Hence, this patch introduces basic support to allow make Arm64
>> AArch32 guest support optional. The following changes are introduced:
>>
>> - Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable
>>    Arm64 AArch32 guest support (default y)
>>
>> - Introduce is_aarch32_enabled() helper which accounts Arm64 HW capability
>>    and CONFIG_ARM64_AARCH32 setting
>>
>> - Introduce arm64_set_domain_type() to configure Arm64 domain type in
>>    unified way instead of open coding (d)->arch.type, and account
>>    CONFIG_ARM64_AARCH32 configuration.
>>
>> - toolstack: do not advertise "xen-3.0-armv7l " capability if AArch32 is
>>    disabled.
>>
>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>    AArch32 is disabled.
>>
>> - Set Arm64 domain type to DOMAIN_64BIT by default.
>>    - the Arm Xen boot code is handling this case properly already;
>>    - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
>>      updated to forcibly configure domain type regardless of current domain
>>      type configuration, so toolstack behavior is unchanged.
>>
>> With CONFIG_ARM64_AARCH32=n the Xen will reject AArch32 guests (kernels) if
>> configured by user in the following way:
>> - Xen boot will fail with panic during dom0 or dom0less domains creation
>> - toolstack domain creation will be rejected due to xc_dom_compat_check()
>>    failure.
>>
>> Making Arm64 AArch32 guest support open further possibilities for build
>> optimizations of Arm64 AArch32 guest support code.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> changes in v2:
>> - use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 support
>> - rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work with any
>>    initial domain type set (32bit or 64 bit)
>> - fix comments related to macro parameters evaluation issues
>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>    AArch32 is disabled
>>
>>   xen/arch/arm/Kconfig                    |  7 ++++
>>   xen/arch/arm/arm64/domain-build.c       | 46 +++++++++++++++++++++++--
>>   xen/arch/arm/arm64/domctl.c             | 16 +++++----
>>   xen/arch/arm/arm64/vsysreg.c            |  9 +++++
>>   xen/arch/arm/domain.c                   |  9 +++++
>>   xen/arch/arm/domain_build.c             | 21 +++--------
>>   xen/arch/arm/include/asm/arm32/domain.h | 12 +++++++
>>   xen/arch/arm/include/asm/arm64/domain.h | 23 +++++++++++++
>>   xen/arch/arm/setup.c                    |  2 +-
>>   9 files changed, 119 insertions(+), 26 deletions(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index a0c816047427..bf6dd73caf73 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -266,6 +266,13 @@ config PCI_PASSTHROUGH
>>   	help
>>   	  This option enables PCI device passthrough
>>   
>> +config ARM64_AARCH32
>> +	bool "AArch32 Guests support on on ARM64 (UNSUPPORTED)" if UNSUPPORTED
> 
> But aarch32 guests are supported... I understand that you wanted to say
> "Disabling aarch32 support is unsupported". But currently this entry
> reads backwards. I think it should be reworded better. But I have no
> idea - how to do this.

I think "(UNSUPPORTED)" can be just dropped. Is it ok?

> 
>> +	depends on ARM_64
>> +	default y
>> +	help
>> +	  This option enables AArch32 Guests on ARM64.
>> +
>>   endmenu
>>   
>>   menu "ARM errata workaround via the alternative framework"
>> diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domain-build.c
>> index 3a89ee46b8c6..5951f002e3af 100644
>> --- a/xen/arch/arm/arm64/domain-build.c
>> +++ b/xen/arch/arm/arm64/domain-build.c
>> @@ -4,13 +4,55 @@
>>   #include <xen/sched.h>
>>   
>>   #include <asm/domain.h>
>> +#include <asm/arm64/sve.h>
>> +
>> +int __init arm64_set_domain_type(struct kernel_info *kinfo)
>> +{
>> +    struct domain *d = kinfo->bd.d;
>> +    enum domain_type type;
>> +
>> +    ASSERT(d);
>> +    ASSERT(kinfo);
> 
> I don't think there is a sense in asserting that kinfo != NULL after you
> dereferenced it retrieve "d"

right

> 
>> +
>> +    type = kinfo->arch.type;
>> +
>> +    if ( !is_aarch32_enabled() )
>> +    {
>> +        ASSERT(d->arch.type == DOMAIN_64BIT);
>> +
>> +        if ( type == DOMAIN_32BIT )
>> +        {
>> +            const char *str = "not available";
>> +
>> +            if ( !IS_ENABLED(CONFIG_ARM64_AARCH32) )
>> +                str = "disabled";
>> +            printk("aarch32 guests support is %s\n", str);
> 
> XENLOG_ERROR?

ok

> 
>> +            return -EINVAL;
>> +        }
>> +
>> +        return 0;
>> +    }
>> +
>> +    if ( is_sve_domain(d) && type == DOMAIN_32BIT )
>> +    {
>> +        printk("SVE is not available for 32-bit domain\n");
> 
> XENLOG_ERROR?
> 
>> +        return -EINVAL;
>> +    }
>> +
>> +    d->arch.type = type;
>> +
>> +    return 0;
>> +}
>>   
>>   #ifdef CONFIG_DOM0LESS_BOOT
>>   /* TODO: make arch.type generic ? */
>>   void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>>   {
>> -    /* type must be set before allocate memory */
>> -    d->arch.type = kinfo->arch.type;
>> +    int rc;
>> +
>> +    rc = arm64_set_domain_type(kinfo);
>> +    if ( rc < 0 )
>> +        panic("Unsupported guest type\n");
>>   }
>>   #endif
>>   
>> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
>> index 8720d126c97d..4f0f143daef8 100644
>> --- a/xen/arch/arm/arm64/domctl.c
>> +++ b/xen/arch/arm/arm64/domctl.c
>> @@ -13,6 +13,11 @@
>>   #include <asm/arm64/sve.h>
>>   #include <asm/cpufeature.h>
>>   
>> +static void vcpu_switch_to_aarch32_mode(struct vcpu *v)
>> +{
>> +    v->arch.hcr_el2 &= ~HCR_RW;
>> +}
>> +
>>   static long switch_mode(struct domain *d, enum domain_type type)
>>   {
>>       struct vcpu *v;
>> @@ -21,14 +26,14 @@ static long switch_mode(struct domain *d, enum domain_type type)
>>           return -EINVAL;
>>       if ( domain_tot_pages(d) != 0 )
>>           return -EBUSY;
>> -    if ( d->arch.type == type )
>> -        return 0;
>>   
>>       d->arch.type = type;
>>   
>> -    if ( is_64bit_domain(d) )
>> -        for_each_vcpu(d, v)
>> +    for_each_vcpu(d, v)
>> +        if ( is_64bit_domain(d) )
> 
> Do you really need to check domain type for every vCPU? I think that
> original variant was better.
> 
>>               vcpu_switch_to_aarch64_mode(v);
>> +        else
>> +            vcpu_switch_to_aarch32_mode(v);

Do you mean like below?

     if ( is_64bit_domain(d) )
         for_each_vcpu(d, v)
             vcpu_switch_to_aarch64_mode(v);
     else
         for_each_vcpu(d, v)
             vcpu_switch_to_aarch32_mode(v);


>>   
>>       return 0;
>>   }
>> @@ -38,7 +43,7 @@ static long set_address_size(struct domain *d, uint32_t address_size)
>>       switch ( address_size )
>>       {
>>       case 32:
>> -        if ( !cpu_has_el1_32 )
>> +        if ( !is_aarch32_enabled() )
>>               return -EINVAL;
>>           /* SVE is not supported for 32 bit domain */
>>           if ( is_sve_domain(d) )
>> @@ -58,7 +63,6 @@ long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>       {
>>       case XEN_DOMCTL_set_address_size:
>>           return set_address_size(d, domctl->u.address_size.size);
>> -
> 
> Stray change?

ok

> 
>>       default:
>>           return -ENOSYS;
>>       }
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index d14258290ff0..9f7e735c9b74 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -330,6 +330,15 @@ void do_sysreg(struct cpu_user_regs *regs,
>>       {
>>           register_t guest_reg_value = domain_cpuinfo.pfr64.bits[0];
>>   
>> +        if ( !is_aarch32_enabled() )
>> +        {
>> +            /* do not expose EL1 AArch32 support if disabled */
>> +            register_t mask = GENMASK(ID_AA64PFR0_EL1_SHIFT + 4 - 1,
>> +                                      ID_AA64PFR0_EL1_SHIFT);
>> +            guest_reg_value &= ~mask;
>> +            guest_reg_value |= (1 << ID_AA64PFR0_EL1_SHIFT) & mask;
> 
> Why do you need to apply mask here?

will drop

> 
>> +        }
>> +
>>           if ( is_sve_domain(v->domain) )
>>           {
>>               /* 4 is the SVE field width in id_aa64pfr0_el1 */
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 310c5789096d..544d1422a793 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -791,6 +791,15 @@ int arch_domain_create(struct domain *d,
>>       d->arch.sve_vl = config->arch.sve_vl;
>>   #endif
>>   
>> +#ifdef CONFIG_ARM_64
>> +    /*
>> +     * Set default Execution State to AArch64 (64bit)
>> +     * - Xen will reconfigure it properly at boot time
>> +     * - toolstack will reconfigure it properly by XEN_DOMCTL_set_address_size
>> +     */
>> +    d->arch.type = DOMAIN_64BIT;
>> +#endif
>> +
>>       return 0;
>>   
>>   fail:
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 47ba920fc6b0..c616127e8da5 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1873,19 +1873,6 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>       BUG_ON(v->is_initialised);
>>   
>>   #ifdef CONFIG_ARM_64
>> -    /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain */
>> -    if ( !(cpu_has_el1_32) && kinfo->arch.type == DOMAIN_32BIT )
>> -    {
>> -        printk("Platform does not support 32-bit domain\n");
>> -        return -EINVAL;
>> -    }
>> -
>> -    if ( is_sve_domain(d) && (kinfo->arch.type == DOMAIN_32BIT) )
>> -    {
>> -        printk("SVE is not available for 32-bit domain\n");
>> -        return -EINVAL;
>> -    }
>> -
>>       if ( is_64bit_domain(d) )
>>           vcpu_switch_to_aarch64_mode(v);
>>   
>> @@ -1983,6 +1970,10 @@ static int __init construct_dom0(struct domain *d)
>>       if ( rc < 0 )
>>           return rc;
>>   
>> +    rc = arm64_set_domain_type(&kinfo);
>> +    if ( rc < 0 )
>> +        return rc;
>> +
>>       return construct_hwdom(&kinfo, NULL);
>>   }
>>   
>> @@ -1994,10 +1985,6 @@ int __init construct_hwdom(struct kernel_info *kinfo,
>>   
>>       iommu_hwdom_init(d);
>>   
>> -#ifdef CONFIG_ARM_64
>> -    /* type must be set before allocate_memory */
>> -    d->arch.type = kinfo->arch.type;
>> -#endif
>>       find_gnttab_region(d, kinfo);
>>       if ( is_domain_direct_mapped(d) )
>>           allocate_memory_11(d, kinfo);
>> diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include/asm/arm32/domain.h
>> index 1bd0735c9194..30e8818ff2ae 100644
>> --- a/xen/arch/arm/include/asm/arm32/domain.h
>> +++ b/xen/arch/arm/include/asm/arm32/domain.h
>> @@ -3,11 +3,23 @@
>>   #ifndef ARM_ARM32_DOMAIN_H
>>   #define ARM_ARM32_DOMAIN_H
>>   
>> +struct kernel_info;
>> +
>>   /* Arm32 always runs guests in AArch32 mode */
>>   
>>   #define is_32bit_domain(d) ((void)(d), 1)
>>   #define is_64bit_domain(d) ((void)(d), 0)
>>   
>> +static inline bool is_aarch32_enabled(void)
>> +{
>> +    return true;
>> +}
>> +
>> +static inline int arm64_set_domain_type(struct kernel_info *kinfo)
>> +{
>> +    return 0;
>> +}
>> +
>>   #endif /* ARM_ARM32_DOMAIN_H */
>>   
>>   /*
>> diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include/asm/arm64/domain.h
>> index 1a2d73950bf0..bebcbc582f97 100644
>> --- a/xen/arch/arm/include/asm/arm64/domain.h
>> +++ b/xen/arch/arm/include/asm/arm64/domain.h
>> @@ -3,6 +3,10 @@
>>   #ifndef ARM_ARM64_DOMAIN_H
>>   #define ARM_ARM64_DOMAIN_H
>>   
>> +#include <asm/cpufeature.h>
>> +
>> +struct kernel_info;
>> +
>>   /*
>>    * Returns true if guest execution state is AArch32
>>    *
>> @@ -17,6 +21,25 @@
>>    */
>>   #define is_64bit_domain(d) ((d)->arch.type == DOMAIN_64BIT)
>>   
>> +/*
>> + * Arm64 declares AArch32 (32bit) Execution State support in the
>> + * Processor Feature Registers (PFR0), but also can be disabled manually.
>> + */
>> +static inline bool is_aarch32_enabled(void)
>> +{
>> +    return IS_ENABLED(CONFIG_ARM64_AARCH32) && cpu_has_el1_32;
>> +}
>> +
>> +/*
>> + * Set domain type from struct kernel_info which defines guest Execution
>> + * State AArch32/AArch64 during regular dom0 or predefined (dom0less)
>> + * domains creation .
> 
> Extra space before full stop

ok

> 
>> + * Type must be set before allocate_memory or create vcpus.
>> + *
>> + * @kinfo: pointer to the kinfo structure.
>> + */
>> +int arm64_set_domain_type(struct kernel_info *kinfo);
>> +
>>   #endif /* ARM_ARM64_DOMAIN_H */
>>   
>>   /*
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index bb35afe56cec..c29573f0ffec 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -530,7 +530,7 @@ static int __init init_xen_cap_info(void)
>>   #ifdef CONFIG_ARM_64
>>       safe_strcat(xen_cap_info, "xen-3.0-aarch64 ");
>>   #endif
>> -    if ( cpu_has_aarch32 )
>> +    if ( is_aarch32_enabled() )
>>           safe_strcat(xen_cap_info, "xen-3.0-armv7l ");
>>   
>>       return 0;
> 

-- 
Best regards,
-grygorii


