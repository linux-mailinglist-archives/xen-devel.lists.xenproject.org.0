Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26641CAFE8C
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 13:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181563.1504595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwkO-0006oi-Gl; Tue, 09 Dec 2025 12:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181563.1504595; Tue, 09 Dec 2025 12:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwkO-0006lb-DU; Tue, 09 Dec 2025 12:23:16 +0000
Received: by outflank-mailman (input) for mailman id 1181563;
 Tue, 09 Dec 2025 12:23:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu2q=6P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vSwkM-0006kw-KI
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 12:23:14 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3a92cd1-d4f9-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 13:23:12 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PR03MB8236.namprd03.prod.outlook.com (2603:10b6:408:2e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:23:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 12:23:08 +0000
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
X-Inumbo-ID: d3a92cd1-d4f9-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRmWFb1HZudP8tVciU1cY8emBKnZqm5wJCeIRug6yN21vKdnCg1b7RCTBtjJ+a0kne0fHYS54/7duVmFVcCLTplSSg9EvzeIaVFlWOzTrWH3AVgwJflwf3jfjEHj2pjWLkEMWfqrXyECOIAocLLQEAiYU5OgRiD84A04Q+vVXVU9hqHPMYEyMPb/B+l18X0vfZZbR5DPTON3hGZ4GS94VCRjJx7vC1KaBO/YUFzRQrwM6aNjlzWChQYtS2hHuACEThg8WNBo+QL8+9+QhMyrAbJ0jK86C9QsgOHw4jZdsMtaf/pRdE2vG2ncng13ExG+hmt8189awsOkbAgEfIFKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsQvG89Pwkhu/axJC4ky6i0v0+hDESPbQIay4qC5ybk=;
 b=qlzLVVy2og8TNNjmtTHDPdHjGI8OBJdZwc+J2ANsZSmLo5NXMNYRNNXaJ94X8Ewxu//erxJmGX9gJgJg3bZw8RKPfoO3A9iiEcI6nK+s/JwM/dtFbZmtCan/ywxzWNNKFFt8EWyuGz7MsAV1BaXIg5XX8Q6LfmdDJIs6PuJRYge+bcHEAGUjAThdFH+96VRFpEvRVfSuj3s1kkYtMu4ICsNOVb3G5eofluIkeaS+czjrrxSSwVtr/JGKAkwxa52Ua6f1lfvyOJHVvZup60Te05Di0erI35MNGx+Zum1WitDKk3Q5DnpxGyv/cd36vuOjOYt8bEz82ntJfC7I+ZhE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsQvG89Pwkhu/axJC4ky6i0v0+hDESPbQIay4qC5ybk=;
 b=EB7q7PTY/5MjLRjLsTXIipMzpWxWsC1QzatXUiXPIHg5B4mr3OhcCJPggLwr2/h5O37CbXzvpufuNyry8YFvDaPVKWGDZ5eDnGiB/u2MCWhJNw7VOc+vzrPQCLC0sFynyPwquxb3XviUKP5M1JzsjuoXYaIYQ8T6AYINi8kzFbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <565e8f4b-d0d9-40a9-978d-13a533a86b9d@citrix.com>
Date: Tue, 9 Dec 2025 12:23:05 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] symbol: drop private header again
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <23b11dd1-1d18-4b89-9450-b3c92b09c7c4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <23b11dd1-1d18-4b89-9450-b3c92b09c7c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::35) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PR03MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b60f885-6ef0-4f63-6fb3-08de371db65f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djUvL1pyTDdYZzljd3hvMk5lblhOYVg5and1VG1UdXlyUXNHdnNqV0RVaTho?=
 =?utf-8?B?SHAyNzVXS1g0dVRPdlpvblcxWXl0dTZBK3FBNDVRUjFzL0tWMnYvOGxQUHBy?=
 =?utf-8?B?Sk84cldQOGNjaUd3dUdBcjI1dnZIZElxYkhVblJXU2tKcGhlNitENjZYLzFk?=
 =?utf-8?B?SmxEMGN6QXNOWjgzUktHRnBtSVMwR3gxSTAweThRT001aE9LOXpjd1NCeG5q?=
 =?utf-8?B?eFRwdk1ENHRFbER5SGxOQmtJeDNic1FVRTFwcmRTYUh2Q2gvdGxFMzBiQ0Ex?=
 =?utf-8?B?Q29lR3A2ZmF0Ny9ERGVWcXRsR3dZVGVac0FWbklFem52bVhQYmZyR0tpa3FB?=
 =?utf-8?B?a05xeDVKa3NkNVRnR21PRGlLNmFxejU2dk9JclJzT3RMYi9YNDdKeDFtbnhn?=
 =?utf-8?B?MnMycDlRd3pMRVhOYjE4a1FYWmg2QVRVN2taNWZvMmVzd2J1WWg3QW9rSTdx?=
 =?utf-8?B?ZkMrdVpaUnJ3cHJkUldWbEZRZDZQVmhNRThuODlDOWphaitmc1JYVDl1SFBD?=
 =?utf-8?B?c3IycE5NQUtVcDJac0ZISUZ3SlhBSE1LeDhicGZnSVpvbDdQR2w1Z1Mxbm92?=
 =?utf-8?B?dlpJcVJLVUdBMTJaK3ZHSXRpZ1c4dTJwNVVzUEhEOHRDSnFqMko2UXdiOTAy?=
 =?utf-8?B?K3doVTN4b04xUGliVmhWckUvRGUxSnpkMkZQdTN2Q1pKZjFOYUZGOTQ4eEZy?=
 =?utf-8?B?djdnakhqMEQ4WmhndXBWVE5scVNHazNzOGdPTVpRQWxUMG85c0l6YzMrdWVh?=
 =?utf-8?B?SEI1MWsrbkpjOVArMmE2MUhMNmtlTDRWLzR1UHdUSG5Mam56ZzU1bEwwWjU0?=
 =?utf-8?B?WHg3TUQxdEFiQjQ1UHlKZTZwYzBOTDRDS3dYeUg5dDlXY0VDTkxySVRJTUZ5?=
 =?utf-8?B?ZEtLSTlzVjU2aXpyL2F4K1VQTDVQWUNhMXV3MEdWeEJMeGlybzFRdzNFWW9P?=
 =?utf-8?B?dUhPcDA2bmVBRHB4dlY2aDZqbTEzK1RPM2ZTY0ZCeXRxd21ibkJtRWZ0dlhP?=
 =?utf-8?B?bEdDdFJqNDhOWk9vR21YVVdJd3YvTHhmQ3NJaDY1cENDZG5BZmNzbFJvcWZL?=
 =?utf-8?B?SVpKdjZ5UlphYWY0S2NQblhaM25CTjk4S1R2cWJJWWFESVVwVG5pdU0wR2ln?=
 =?utf-8?B?dytQclNiTkp1T3M5NVVEclJXTWIvMGhvcUxZb1NBMTd0VDNzY3FjTzZoSXo0?=
 =?utf-8?B?QTFvSnJtTFFYTVVCWnBoYjNLWld6TVV1Q0RQcTBJeEFaYkZVei8yd0trWXIw?=
 =?utf-8?B?SmlDZUsxOFJTcXlMZmRvM3UvanFKdG5TbDJoRkYxZkQyZHluK3FZUHg2Skh6?=
 =?utf-8?B?UzdTT1d3aU1qQXhWSGhmUnR2Wk1vRklrMTBHWjg2SEFXWXVpZkMxejEydjZD?=
 =?utf-8?B?MWtUVUdWVXJ0aWtveXFya0NYaTU0bTRFTi9pYk12SXd0dkZnQXF3NFl5bXhW?=
 =?utf-8?B?UkRSNjJnN1B2OGRRbGFCYVVhNkxMY09XMURUcGE0M1VuVVpRczY1a0JBb2F5?=
 =?utf-8?B?eUxwYUJpUVBNNW1GeVpiYnZRMjhrVVhDcFNHQ1BCMEJmekZwMUJjczVkZzVP?=
 =?utf-8?B?cEhtZEV2bVk5RU9PM2lrR1h5Uy9NN3U5VmNpanRnWVNhMDZqUU9QNk1Ib1g2?=
 =?utf-8?B?VmpRNVBpTjlGdjJOWncwVDZlUlo3cE9RZ2dwVDBTaEd3QnhCME1LczJQVVBB?=
 =?utf-8?B?bEV2bWtTSzBHbVFkZHB6UmhzZXYwTjhwbjlBMkpoc3BiTWV5aE1RNEpFU0lp?=
 =?utf-8?B?ZXJ0MWxDWDJ4QXV2aDlDbHdjN0k3enpGVzZjcnhVTDdxWWZzTEs1bnRuUlUz?=
 =?utf-8?B?MzY1dEViVS9mViszajFEQXQ5U0JzYjUveUlGMlFKY3NnMDVpYXA1SUVkWnpl?=
 =?utf-8?B?TFE2aXJFOGxIcXorakpTZXRneGpsQnV0aFhSMkcyV3lBbUN6c3NHUGJ5WXpM?=
 =?utf-8?Q?h9oXUB+aZrK5USmK9wFRVe8hHjV6F18/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE94d3JOK1MxTHUwd2VZdHpjUFhBd1RRZnk4K1JwUkQ1cEo1QTdCREZMSHlM?=
 =?utf-8?B?YlBqcFUzNDkyTTVTQ3hhOE1YSkRpZ1FSaHpLdFJ5TDYzaWlZc05xc3hwTlg3?=
 =?utf-8?B?MzgvMldCTmI0TGZIa2lMMUxnT3FxTHJTRWFrZDlWMkRNYlRxa01uTVVuSHd0?=
 =?utf-8?B?cUgxOFZSVnkzT01YZzZYcllPZ3pLOGJZVzkzTnV3SEJHRW8xRFpVdVl0M3Zj?=
 =?utf-8?B?WVBCeW9jTnpyb1hqRWxRWVVGK2NraTNrS2dFdGlvOWNtdldlS2JyanhHUXpY?=
 =?utf-8?B?SU54cG8vV1gzcDgrbGlqblFaQVl1dVFpOE1PMUNtbGN4L0lsWkpYdFc4RXNS?=
 =?utf-8?B?NnZIdThvYktSa3VORDNHUzJGZ0pSRG1tUkJha0F2RGZIc3hqbW9sWGVxQVh0?=
 =?utf-8?B?UTM4MlZudDdKV1p1VVR5RXR3WUgvRU5DOTQ5TUNQakt4Kzk0czZMWndWOER3?=
 =?utf-8?B?Y25Ybm9XQ3dHTUhGTVArL2ExcFdmR3hXdTBZS1g3S3hYSnFQdlFXRUNiSVhF?=
 =?utf-8?B?MURFSUNEb1N3bVRaSjY4Nk8rcDI1ZHJGUXU0RklZTUdURmF0N25GOG90TE8x?=
 =?utf-8?B?WExvTWlWRzJKRFhzS0FFVDV2dk5FUGxHcTFiNk1aK1gyRy92dXc1d3lrWHlz?=
 =?utf-8?B?bGdtUmpHOTMzc01sTDEwK3JSdXEyNGdNSnJXQ3RnSzhsSUsvOUdQVXJWTlFp?=
 =?utf-8?B?VERMR3U1VVZxT2FqdEdiY3ZDNTZIQzkxSWpVSTFjZGgwNEYvYktUSnd4RzZu?=
 =?utf-8?B?dVJrR3dsdDgycVhMcjM5ZXNJT25GOGRRSUhObHB6VmV3Qk1UU1dNRHdFUFF0?=
 =?utf-8?B?RDZReGVnNzJIOHowSkR5UnVWaXdaazZBNFlVWGoySllOdWoxWGNVSEcrVjdZ?=
 =?utf-8?B?cVNxZzFSdE5KY1BXdHFRVEthTmZRMm5yK0N1cGxKckFWT2RpMGNGdXdTTUw1?=
 =?utf-8?B?QWdyVmZmV0pyOUY4MFZYYVUxWUpiYlc1akRvM09LV3owUW0vMjdBdHlod080?=
 =?utf-8?B?dHkzMjNFQ3o0UDJMd3kzeDZRdm9LNUNnR05CcHNKeUtzRG1YbGJqKzJKMDV2?=
 =?utf-8?B?TmZ4Y05BcGpFOWRGWEp2Yis0WCtKbFBIVkZEbUZ2U3h4cGswaWZ4NXlIakVs?=
 =?utf-8?B?OWhQS0F2OVVBUkF3WG5FQ01QbHhnR1RlMHBHQzBPWjJMc0s0Mm94WWp1djBM?=
 =?utf-8?B?WTNCbnBqU0FrZDZkcDhZQTdyL3NyNFN5cE1OWjRYKzdkckVuOGdKVkdqWkxH?=
 =?utf-8?B?cDhpYjJGSSsxRzlndWVHbzN3dWNlZW1zRnZDQUpyQlN0K0c1dGRwVDZ4azlX?=
 =?utf-8?B?eEZJK2ZUT3FEZ01NRmtOZlJhc011a1ZhL3FMOStUTnhoRUdxblE5QndwZGd5?=
 =?utf-8?B?YUlUT0tvY0xNL081eHVTTnZyT0cyeUZDWkU5YXBqT2lUUG91bWNrNFVBZGNx?=
 =?utf-8?B?aWFUWkN3b21ER3VpN0xsQWRqTzZnZm9oVTlmSG1Pb2FPWUxiMlh6OFlwdWpv?=
 =?utf-8?B?cjZBT054d3F5TUVnOVpEZVZHWDFBTUYxZDV1Rk9ybmswMGZ4WmVqQyttWGRH?=
 =?utf-8?B?WTZBN0UwMHRjRlhNUkE1QTI5TXJlSzVlZzU5SG1PNThuN3VReWVsZW9wYk1U?=
 =?utf-8?B?bXNhcldiSFE0SjRPRjFIeW5rNHZoZCtIUU9IRkpWU0xMcnA4U3F1UjFnYyty?=
 =?utf-8?B?SGQzRVc0blhwckE5b2xLR0p4Q3dHazI3VEpaQW1sb0hjSmp6VEhuOER4NXNE?=
 =?utf-8?B?TW5NNDd1THpscGFCSFVQMnk1cU1iZ0RvTW9nREZLQmpnbGJPMjFPNkV4SUNy?=
 =?utf-8?B?RHp0N1ZLMk5HZVVtaVpLWUxvV2lpa1FuL0tZOEJlZ2NWeVk3cVl5bzBOTlFQ?=
 =?utf-8?B?bFZuNmtwQ1ZLVFh5d0QxaDhETXM3amI1NnV1WTdFSEh6UWtoT3FxWGx3c2VE?=
 =?utf-8?B?MUR3amhreHlDRWErdzRvVlhrKzF0eFJhYkJVWnRMeld3d3dYRTByMXFRaEVN?=
 =?utf-8?B?N040YXdHUmhFWHIwV2h6UEFEYWkyam9vUzAwOVVPejFFb21JNmtEUTdJOG5D?=
 =?utf-8?B?UEIrNXU1L0hJWGxBNWNNMVpLeXkwbjYrelZUaFRINkVicEFhNVFOeDIvcHZ3?=
 =?utf-8?B?VXlFVzBsMEFPYUdmUnh2RWNTM2kraGhqOTA2dDJJZDZBMVRTVGIzR3BDZit1?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b60f885-6ef0-4f63-6fb3-08de371db65f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:23:08.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhEwbo1WgEagxoczTr+Q6R5bhISo6YIEVTr+ijkk3CtHGU3E87iVLs2U1s0HDakjPc+5xmKBQoXZT6EQUoQJk4nUiDsuRP6xISJF8/E6wzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8236

On 09/12/2025 10:13 am, Jan Beulich wrote:
> With symbols-dummy.c gone, there's only on party using this header. Fold
> its contents back into symbols.c.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

