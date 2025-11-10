Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A23C48186
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 17:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158642.1486967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIV4p-0001o6-69; Mon, 10 Nov 2025 16:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158642.1486967; Mon, 10 Nov 2025 16:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIV4p-0001lN-2z; Mon, 10 Nov 2025 16:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1158642;
 Mon, 10 Nov 2025 16:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7fAs=5S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vIV4n-0001Hc-KS
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 16:49:09 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c5361b9-be55-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 17:49:08 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 DS7PR03MB8070.namprd03.prod.outlook.com (2603:10b6:8:251::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Mon, 10 Nov 2025 16:49:05 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 16:49:05 +0000
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
X-Inumbo-ID: 2c5361b9-be55-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auVqcZJHz+lD3v/zYnmX65IOkdvx0Nl876r/+RbA+87FVulQubYQP4R5kD3vG/X3qMw/N7lsJJ/EhwYci6hfLfYC1wjUWShs3RWhXp1OmfRXP/8AcykLKT4Ws2/BCDwKjCEcQpBF/CEcIyDxpyFjYdXW1tJMSfml7aBWj1YpMGYklaIBpKoNDHgvdVWjCq1ts6eXtMqMo2Ua+E0a7bqEHmcSLl8vOgW8gWrWauIU/sHTmT7Xu+P9ZEs4i6WkqX7Xctf4HD2VsenukhxxBv7z/xafUxVJSCucoeUVldvdn8nYvW0qFf5ppE8nu794CqfIhMaPdzsqupj5DSqfiTPHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovrz+Gv7X8NjgGn22TrXQnjpRTpoKBXB7w5Uq+s+8Cg=;
 b=Le4S+HZMUs1Jhn2iGGhwIfx9R6rZkeINO7jfR8m/Zynh7jripZ5T6jUTbRhSdjaLENj6CxeB+CAyxS3xxPxKk1nPJv2f3awBSNz9wdCFEcAnCbOwGv6RyaVrEVoVqSeNy77SQrmiRpcATKQMUQowwD+8VrAwkVIShH2G1jkatWQa1CKF3RnFQH3ITgs1O+QxYF48qMPRb2zJBJSid0FmFhKsWuPn3I0Omnj3kjVMD/3bc82rQwVYA0AP7fdj2jwKqdPXaeRZy1hGKK4Sc5Lsewv3LkOQl939vjfdzJ941hQRUv7MKZl2nxRL3hktgcTASV13B6jFJMTLDK4CQo9Q0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovrz+Gv7X8NjgGn22TrXQnjpRTpoKBXB7w5Uq+s+8Cg=;
 b=uf3fdtxNIlVfdYwr8oIDz6gu3wWdgtQ5nkG+nbD+xMa0YvKEXPKH+GcU5WLFrVwC5/s+7ZTVs/VPb3RYAxp/wz3MWfnGnPvNahgahzXuCR2EjFRSY/OqZJ78VqUdzdGVXJ3O8DMnMA5pr5FRqETmNsudBj3mS7Jv2TbCgh9MPjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <af578377-8c77-496f-a553-3894077c3ade@citrix.com>
Date: Mon, 10 Nov 2025 16:49:01 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] CHANGELOG.md: Update for 4.21 release cycle
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
References: <1930832802df980a6fe610233265bc238fcfaca4.1758901622.git.oleksii.kurochko@gmail.com>
 <60d1d66e-83cd-47b5-9b94-0325f411ca72@citrix.com>
 <0b90e356-6d70-4a50-a426-d3919be019ec@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0b90e356-6d70-4a50-a426-d3919be019ec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|DS7PR03MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7a6f8f-c193-436c-30d5-08de20790f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXI5SXRSZ0ZXa1c4SjF4V1hJemFQTFpuSTNKTXhsY1A1dHNSRVVPNitxdmxn?=
 =?utf-8?B?bHBkR1kxTFRPWTZsMGtWbHNtY1QyTUUzSWljdllsNlJYOVpuZmdwN2RzVXU2?=
 =?utf-8?B?aGdGaEZ5b1JVZlRhdy9SRGJVOTI5QWlyNVBOdXhCb21VWUZsdE9BRFZjRUdR?=
 =?utf-8?B?QmlGZndMWDlyVDJGTEkwRDl3QU9jbjJWbWllbGx1WUtzak0vbDIxZEhJa2hS?=
 =?utf-8?B?OG1QVFI3dEdOMDNtaEF4VDcrRXM3WUhqL05zeDVWak9QTU0xU3Z4WnNQRDVx?=
 =?utf-8?B?RTRzeVJDcDZ0V2RRdjBvRHJaVmRhci9wZ0NrMklnbCtIUE1FOVRRZ1FCdTRj?=
 =?utf-8?B?eTMvVWo2S3VhS0YyREJ6K0hralNZU2FMRkxDVDB6ZzZZeFA5dlVDY0JxUHJo?=
 =?utf-8?B?VVplQmprbGJJdHZ2dGlubXc5Vm01UU5DSmZvSjUvTUtUU1JKajB1eEoxSzJV?=
 =?utf-8?B?L0U2OUdqOWM1WjA4ZzFzaDhRYXJnWno4YXFlTU05ckZybFNqR1lManozUEdM?=
 =?utf-8?B?STNUUzF5aDFyenNhMUlDVll4Q3J4Yy9rUkZxYWpEWnh3RVJ5REJQNW1YTTVS?=
 =?utf-8?B?Qk1sNTFKNXpvU1FPemwzNTlvNDdadlg0S0VoYUs1T3I4QlE5Q3MwbFphYi84?=
 =?utf-8?B?Tk5RVTZRbHlDYkxWSS95OGw2aC9VUnBsMXhHRGlJVmZ0ckZBTS9MODRwY3VX?=
 =?utf-8?B?M21tLzlmMlo1amhwVWZhR3AyMVNmdmtpb3h6RjJRV2tnQUpMWVNGd2lTNEph?=
 =?utf-8?B?dE1CZXFkYytLZmFTeDN4bURlTnZDZXJVWGh6aGgzRFBOQVlTY0R0OGJON0xw?=
 =?utf-8?B?Mitsb1FacjRqZU1keUVKNm5yZGNsZ2tJV1ByM0U5c3ViWDZUT0RraTE1WXgr?=
 =?utf-8?B?Ry9FK2V6UmVvbHVNYUhMbk1oK3pwd0p1OXJFUU5rRjRPOWR1UTExSkFCS1BZ?=
 =?utf-8?B?K0s1cm1PZ3M0VWtTRHJkOG55b2hlUzdwN2hPS0JibndBb2g1clJkdWZZTVpU?=
 =?utf-8?B?NFlFdms5RmZYZldMRWZDMjZVYnhMZFVlay9Ya0R3cGZidjNoTXZJUXN1cnVa?=
 =?utf-8?B?emNHMXNkMFh5dTV6bks1dnUrTk1rVzBlQjAwSDAySk5RQS9DUjNWbTRyc0VQ?=
 =?utf-8?B?T2RZRWVsNlZmekJWMnV5Qnh0RzBPTWhTT3poUERUdC81ajgreEZ2Q1pvSlY4?=
 =?utf-8?B?c2Nkbnk0SW5HVVR0YXVZUlNWWHZvV2crSmtFUUpLY2l2L3ExWU5PTW1VZWZx?=
 =?utf-8?B?Qjk0T0NqNjVPaTk2ODlXL284VHloSURJNXJJaWRGRTVlRFlkL0pza2hNZUFN?=
 =?utf-8?B?ajBvWDBXY1JGd2F6NWQ3UzZHeGVWUjJPb3hqMjFLZHlMUWVxSHBIU1phQW9h?=
 =?utf-8?B?dFdqS0FVR25SR0YrSHZHTUsvNjFZQUNaTUlHQmM5NndrdG9aek1CMTVwOW5v?=
 =?utf-8?B?SGpLOGZLNWdzTExvU2xmUUEyR25JT296c1NBMUwwY0w0YTNNTkcwbHJuakV5?=
 =?utf-8?B?ZmdJenRycm5nZzAzZkZOcStjSStsUnN0MDlySENBbTEwa1pzUEo3L3M2ZUZr?=
 =?utf-8?B?RndWTG5va2prWTIzcVZJSkhtUEJQcTZESmJoQ0NwbWE4STMwcFk4S2RkcnRr?=
 =?utf-8?B?OVZ5YjJWWjVZOXE1czJGOCtVQ2JXMEt2enJkbWxqQ0JVcGdvQnQreUhwRG1a?=
 =?utf-8?B?Wk9pUit0TTVJMGNXL3JxZTZad1pCblB5TGE4WWk0eWw3WW9LVzRTeDZCNzdQ?=
 =?utf-8?B?YlFRQ3NoU3FHYXltbTZXamcxSDhiVDVEMXU2SlVvYUc0VlBNYUQxcnZZdWhk?=
 =?utf-8?B?UnVpbHk3b0pITlNmWjhDZUpQdWRFV1FjOG05ZjhWZy9mZkRvb2c1NGRYVVU5?=
 =?utf-8?B?bXg4MUJtZjdSdUVROWp0ZXN2WCszZTlKZ2UxZFNoeGgyNmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVZXeU9OVVMvNCtNWlk0bXhRcE8wSVhCN0tkdlpjV1hWMFNHNzNmbVdJZGpV?=
 =?utf-8?B?YTNlQW5TdGptekYvUmtLMi8xcTk2bTdBWHkrbGVwN3JpQTE4TTBDL0IyUTNw?=
 =?utf-8?B?a01TSHJxazFMZ3lvNjhRTExxQVNJWUg4MmVBZ1lVSEd1RDBlRGxmL3luZHVZ?=
 =?utf-8?B?cFRFa0tkUHRaTzQ5dFBUVncyeE9XTzFrNG00c3I1VlJKb3FuYXJOa1oxVkRC?=
 =?utf-8?B?cmFrRDRJdXRHQnU1MDd2UUtLM1JEYk1PN2VrTU96RWJKU2d2dzFuMzJtZHgz?=
 =?utf-8?B?ajN3L01Hc2t2dkFWb3hpbUN4c3cxbVJtTjBUR3FmVVVPbG02THBQcEdmSUN2?=
 =?utf-8?B?Um52c3M5MjVYVDMxVXFaOW1mbEh3TVBiZTRHQVRzQWlqWUw2d2tDcE1RWUcr?=
 =?utf-8?B?YUl2MERtcFBCcWtBUFhYdjFOUDFIMmJpWmxjWW90QUFha040VmRwODNhenRp?=
 =?utf-8?B?QnA1WUp5NFRBT3dZWUhhWDRnODlsaCtsT3lVR0VwSTB1RXVKYjNwM3dVWUxv?=
 =?utf-8?B?OVdIWG9xbENlWERoSkMyME5td2Z2Yncvc2ZoWERFQTFsazN2dkVPZE52SjZD?=
 =?utf-8?B?QkN3dllxUzgwdXoxcW9peU1CVmMyM3owM3UwcUxxSWJmbDUvWi9BejR2Q1JZ?=
 =?utf-8?B?ZmswcldpVUsxd2Q5U1duU1JFSEx2RE56RlhFSE93NE5rYkI2L3JHUGhVL0xF?=
 =?utf-8?B?dEEvdjBmS0wwbVgxeWRndk1DZTVkbTBqQ05QTjlNdjRpTnNmUFdCTEtHUVdU?=
 =?utf-8?B?YkFrSlhVRjRNUHlLOUxOaTVjUWxhM2lWQll3K1liOGJYdFZyMGdqbnlxejVE?=
 =?utf-8?B?bk1vUVZQWE1GZXAyYUd6NkpwQ1NvcU8zRUJYTDNQcmd5VENiejF5Ly81b2hU?=
 =?utf-8?B?WkVpcW44WjRYK1Y3SHNxVmRVMkxJUFpaT1E4TTFtY2lYRGExME9CNGNqaFo0?=
 =?utf-8?B?U3dYTk1uaEZjY0FJQUY2a3lJWGpHMEJhM09yTzBpbTVvODNUNjhTMGFZUUNI?=
 =?utf-8?B?U2JYT0VjeHJkTS9aOC95ckVIYzIyT3dCVDRCdkRzUkt1SVBaUWVJNStXOTEz?=
 =?utf-8?B?NlZHRm5SWXM3V0xQOGw4VWFOS2ZINDY0SHBzYjVLVkh1bkYyTDdxd1E1cG9x?=
 =?utf-8?B?MUQvY29Ed1Y2amNQVmVGN21Ta1QrTkNYVnR6VFlGSitPMm5RanhpM0JYWW5X?=
 =?utf-8?B?VzB6cmVxQmtENCszYncyYmtMeUcrNzVKdys5L1F3SjI1K1VISWJpdVVyVUJ6?=
 =?utf-8?B?T1UzcWE1MUJUL1RUR2x0YkZDTFh5a1htK1U0Y3pSd012TTZ5UlBEenlYWmZw?=
 =?utf-8?B?a3hCUzkwZnpNV0o0VTJiS2hNYUdhNUlvZzFSWTZTYUpEMkcxb1JPK3pxRDN0?=
 =?utf-8?B?NkZTZU5YZzlnNTNabjBtTUFJU1VzY2JlZm9nSVpFSDJ5bzl4Z0xTRFdRcVJN?=
 =?utf-8?B?cnoxWG00NlpyVkg3QS9XbWtQUXc5d0FuYVdVVlRYRVlScnBxNnMwbjE4ZW1q?=
 =?utf-8?B?V1JKTVYyU0tRbGh5WFR6emZxbTZzVElzdFlDUWU1TmNNS2FWV2xKUE9UemZT?=
 =?utf-8?B?RytGaXMrektCZjRjRDV0akU2emYyWXN3cXVHOUE3OWRNbzBCY05pYUNDS1M5?=
 =?utf-8?B?bng2YkJxSWNQbWRGSVg1c084QjAzbWJoSk5Cenl2Nzl3cFhGM1BXYTZ2alIw?=
 =?utf-8?B?KzRKWnFvTkc4VDBIN1I4VWhpSWxWS1dDRGNNNTdYQmZ4MnBhNXBVYWJTQTM0?=
 =?utf-8?B?c24zcThvTWdERlB5UWxnNDhlUkNuTzFPNGVwUDUwaEhva0c4VEFacUJJVGNp?=
 =?utf-8?B?WHNMSnErUmRiZWRPK1UwQ0RiWGpOd0lieDUxR29QS203S2R2OFp4TWF2endC?=
 =?utf-8?B?QllFbG4yOGtXRGdiNU5OVDBaRUlEU0RIWjlVTXVBWEx4U1c2TVFua1RtMkhx?=
 =?utf-8?B?YnFYS0FtWmxIMEZFZE5GQmlZVG5tMnNNRUNOaTFjckE0Wm9KS3J4MXZkaGFi?=
 =?utf-8?B?cXcyNVJFZEtXRWRMb2Z1bVgxSGhtS1ZDSm5la0ZJK0g2WU5JNkxhRTE4RlU3?=
 =?utf-8?B?ckh5WnlHRUQyNXkwOFhkR2cwbFBJbFQ1aE5NSGE4L2tZL1lPZTZ3eFNXRVJx?=
 =?utf-8?B?cHF6K1Y2a20xSHl5bEdpb05xUGRSYlJnalpsNnAxQk1ZaWs2THdJU3NuQ3Br?=
 =?utf-8?B?S2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7a6f8f-c193-436c-30d5-08de20790f02
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 16:49:05.0356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3gAydAzL+Qq9qBk3TBg9U3lLD+98cazzmgL/e1c+Sx4J2YSJxokoYK5D1dONxeCiUETlAdotsCeGPLmjFEvRGd3ajIjhr30ofzAC3Jn7IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8070

On 10/11/2025 4:43 pm, Oleksii Kurochko wrote:
>
>
> On 11/10/25 5:29 PM, Andrew Cooper wrote:
>> On 26/09/2025 4:47 pm, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Chnages in v2:
>>> - Drop the following items:
>>>   - Allow to unflatten DTs.
>>>   - Basic kexec support to Mini-OS for running in PVH mode.
>>> ---
>>>  CHANGELOG.md | 11 ++++++++++-
>>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index ca1b43b940..0afd2eeb4b 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
>>>     to the baseline change.
>>>   - Linux based device model stubdomains are now fully supported.
>>> + - Remove libxenctrl usage from xenstored.
>> This is about libxenmange.  I think it wants to say:
>>
>> - Introduce libxenmanage as a stable library, replacing xenstored's
>> dependency on unstable libraries. 
>> Otherwise, LGTM.
> It is much better, I’ll be glad if this update can be done during the commit.

Will do.

Thanks,

~Andrew

