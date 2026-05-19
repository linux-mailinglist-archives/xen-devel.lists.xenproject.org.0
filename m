Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGmWGq9qDGo8hQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:50:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3707580029
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313074.1583300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKq1-0004fQ-Ed; Tue, 19 May 2026 13:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313074.1583300; Tue, 19 May 2026 13:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKq1-0004cu-BZ; Tue, 19 May 2026 13:50:25 +0000
Received: by outflank-mailman (input) for mailman id 1313074;
 Tue, 19 May 2026 13:50:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPKpz-0004co-SW
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:50:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKpz-009gET-89
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:50:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c6a99-2eae-0a2a0a5409dd-0a2a4505a8e4-28
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:50:23 +0200
Received: from [40.93.195.41]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c6a9b-aaa8-0a2a45050019-285dc3294b4a-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:50:21 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 13:50:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 13:50:12 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOPb45u3OtzK7ezuZ0vSyJfnRicuUXOQMoWUf/x7q0hk6Xyj62BGdcT78nGrulU9F7COfEvGjqV3PN9oxLhBH1fQSZbMW7Cy7/nzXphAIF39WncDEb/lqilR1nPieS/DafVpI5quTjINVhbtUwmgJ31s6IsTvYms1Tbk6P6oEvNF0fL3jhbGNFcOM6RQIs04XnFdCcXDGlKdAO3bxxop4+UPUst5H9n9CvxJdY0Klb39vV25m/XQXHQl3i8Q/byq10WcvjMpiW8BQDLbR7qkM1c22SwqWiHwgsF9Y4Ks16pOGiiWWOExAEB+J8pFAiH/+L+xZM11v8tAbJSCoAFVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBPLpsujZYVqwaibqZEFWnaIUp+JU6Ei3Tj8GKDwHcw=;
 b=FuMkEwdHSNIiGe6mrGdKayay0blHk41MHGIU4tSj1dUh71Hr5SLnOFMnFIIH04QHhOC3NhaAoqK5PijMAiZ/ofXMLpzE2fZ9oLBaSn71XGSsfxTwA9ODZesLx+cKwm8e1ld1tWXXNY6XVzjUuX9WVJH5k5iuC/ncfHLnIYf/iFf3f5XR+EIb9gQ23+gMRpBSxIrDFORDR6GIIWVCUtYcsn+oYPqHyoOUwIy9iqRwLX86gI9N69Oh9NZLwv4dtaQlWtlBECsNV0bua3D4pA7pIGMZV3DRUjHug9M+z+d46trOR2nWZsO2d7e32whyisMl0IV048U6zX2PAGq9qGEuyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBPLpsujZYVqwaibqZEFWnaIUp+JU6Ei3Tj8GKDwHcw=;
 b=qZmOIx0bqMx6TEzIoEFyJG3qMwVq5VfcSJrm+Q7fs/1fnZdLyevi5te/UGvmQTUSiJM5hY7G6UrixHJg/vN8FpD7FL8/tLOtvmt3D5zkQWH03TYQZhQhkk+0ftCyxEk66EzjALpQ+zLutLlnZeh6ocCgDMmJm2c/VNqdb7IjMNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dc8c4f7e-24f6-4430-872e-e4b9f3c02c4e@citrix.com>
Date: Tue, 19 May 2026 14:50:08 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
 <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
 <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
 <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
 <e65d9be5-f788-42d1-9117-eef70303a1a4@citrix.com>
 <ee441369-cc67-4ec1-84f9-4619ce645da1@suse.com>
 <f5cd7d50-e274-4a8c-a535-8c0f47cec137@citrix.com>
 <7aa7e06e-7a86-46ea-a7fe-bbb81c96d743@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7aa7e06e-7a86-46ea-a7fe-bbb81c96d743@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0428.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 1edeb523-b769-463c-1634-08deb5ad8c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OvJca6m/AoeJWgLidJFtNn3RWOxHu9mUGvTpz10vlTFeUJ2CU66iLzS3MvFy+MNPl3Lurk+k8eMuowQ1+GTbdHb+WHSXAnMBZIfKt6jVE+8lAFna0OWmQaw3A1XR3hR5XNrEfYK+S133KCYAevNPpxDsJ5Pdc/0UKHjXM2YMGRcESirX/MfZ1KISxVW+5wqih4867OO92exN66x+spuGFZ1GAw+WiUV+WfAXLgOzvjmsG7C2g0WnpoK00LfIrJuTwLzErg6lM20ZJyoi6w9mpLowc1/71pn3tYkHeEqJGJGa8TrKeYfnk8XgNermmL3fErOMdQMiNXAX9jLnl5sSdZQ7SaJt8TnEBz7tufEz+z1ChnS/X6vAreOHIvwO+KuupJIG2xNpLlUlglOCxTPICbOek7SKy2kw0ovfiS+WDCx6fK27Y7D5xYLE9/+chGVSW2hFfmQspMnixM/EOr+L04cOokmKtTgKfD34Ly03UPbdxwUObALcEA71Nfp13s5pORK6jYkY0+q8+PfYVRmmpFw9OmX+hTV5if5Usq6SAbOa5vpM+ZTMKf8zdwatTCGtc0oHbEjcZKHKpOh5/1F/uTCETefdGcn48i7AEvNrQ7Zbg9iApMGabOAvCHSNNS54VCHinCEOQY3PR4qdvT3ZWXrCj9mRp9jWGF1cznGy0ktZkqx95TpDfYld4ciycOnz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW5lNXhFY3VzK2Q3bVpRMHJrWDVMSjJCTk01TGFYV2R2U2RMZEZqejNnTHdq?=
 =?utf-8?B?RnFMdlV2dmZZSXBXZ3BvR0JFV2UvZWpDeVN0dWRxNGFKZzBnWExicVhuTDBI?=
 =?utf-8?B?bWhwVEZLU2xISUpjTEFtRXQ5SkRPZXd4M081Z2M3ZHJLM0JPaEowdC94NkxS?=
 =?utf-8?B?L0JWNlh2RVJoYUFMWElCcjFrRHdBMjNpcGxFMlVmRG1COGlOV0ZMd21qcUpW?=
 =?utf-8?B?dXYweitZMVF4eVNQTEYvVWFmQlB5RVFwb3JLUHE2Zi9aR0JIKzJQN0k0cUMr?=
 =?utf-8?B?em5CTmkwanNRb3NSajVpQ0IwdzhySDJESWFLZ0czT3BvYndTQ2REWXA2aGJM?=
 =?utf-8?B?V3owNUVSR3NKcmhZdGgzTzVvOXZYM09zbUNYRzE0VjVhbjJsbjdlaGU3R2VJ?=
 =?utf-8?B?NXZQUDMrWHA4VkFxY284c3RuT3grZHY3M2JsUlFGbXJ2TURTREVLbTFyMXV6?=
 =?utf-8?B?M1NxZWVqajM5dXBQZnNMaVE4Rzl3cC9hQ1RDbjVRRm1WbzMyNUp1dEdzUDB1?=
 =?utf-8?B?dmhKTm4yYkR6Y3RhRTZZVGtFbmc1eU0ybE9KdmRmSGVwZXdSMHFKbFk4NFZY?=
 =?utf-8?B?VEpzeGh1RU1hTlJRSFQxeThSaUQxRWVMUFhhaStyRGJIVVBUa25XRWxTem1t?=
 =?utf-8?B?WG03clBCZlhuZEFMOXNpSTVUVGU1UjBaSnplenprR28wb3hZcnhqaVdLRm1B?=
 =?utf-8?B?U290STBlUlROWFFVUGMzcCtXdGxUNGkzbDk3K0x4OHUzYklFWFVJRU1xOS9H?=
 =?utf-8?B?VkgxSUFkTVM5RDdYMm1XWkhRaU0vVUJqRSt4MkF2NXR5MEd5SE9JYStGa3VV?=
 =?utf-8?B?M0ZER1JBOVhwK0haSHBpeTRtN2xEeUxQa3BYUjdHQmNhM2M5aTJJV3BuUnRH?=
 =?utf-8?B?ZGdkaFhuL01ESjRrOGZWS2xTTkY3NnR5R3JUSW96S0xDVGI4OEgyR0Z6QW9t?=
 =?utf-8?B?WjQ2djZIOEZySkRTZE55dm5mWjZYbFVrLzVvTkt0bFpDaGdzS0ZKOXZ4QXFu?=
 =?utf-8?B?cytYdGdvSjRDcFdjeDdSUzZVa2QxY01QT01SbWlWT3hpbk54YTRnOExpT1hv?=
 =?utf-8?B?cDFOaldhY0g5VDVldDVrMkhGbnpSTUZ6Y1VKeW1nRU8rTDNjQmlJM0w0ajMv?=
 =?utf-8?B?aTNMYkVPUVZPYUlrYnJVc0l0WW9UN1lUR3lYMkR0NlFDRXVpazNhblpGMSt6?=
 =?utf-8?B?SEVqTnBQaWJPUHl1eUxCSjhjZGl1VGN4b1hIN2RONlJPdkxXbDd2dUJaWTR4?=
 =?utf-8?B?c0NsZmUrQXdoSytlTTZzN1ZFRFgvcE43aVVBa2cxdkJ2dXVNTERhZitreDJa?=
 =?utf-8?B?MjlSVW03Zkd6OS9YRlI0R3V1VW16YnNsYmhvdk14N280YmVDOHdyQ2tiK3ht?=
 =?utf-8?B?c1RTSEMrRzFlUElUcm1jMEpuWXdHbjhoV3N0QWtTakp0d0hybERpUDhMS1Vy?=
 =?utf-8?B?ODgwMGRUQ0FJazhzWUdqbnE1eUZ3cnJkcGgwSTNxMDY5UnZqaktMdUtlUDRE?=
 =?utf-8?B?eGVEYmtKM1JVN2kyZWJ1dVBQOUVVeGhYUXhvcVRFQUt2Q2gyckVOS085Sm5H?=
 =?utf-8?B?WDBaRDBUclpRKzYvRWVpcGNKVzNOL1BXL0lNd3AvKy9HUDNKSEV0c2xOOVJ0?=
 =?utf-8?B?bVhQUzVIeHRXeWNrOG9wWGRNUmhrMUJvTjh1Z1RRaGlVbG1ySEdHODZydUlw?=
 =?utf-8?B?YnJ6bENRVnhQZkNLQm1BMlJvRUJ6a1duQS9odmV3K05rYXhhbFZGZGtCMndJ?=
 =?utf-8?B?V3BwWVR0bU5LWWhqa2Vxb3lhNTcvWXJFdm51a1VkSjVuS0xiZG5oVzFidTBP?=
 =?utf-8?B?eFJtL2s5Z1BBdlNtVUYzb2I3MGpZKzRGVGZxUEdkUDZCdzJ6TzNrdEIrSHZt?=
 =?utf-8?B?cTY3K0cyQytEaW5jRkRpTWlzK2hTTmc4NG5WbC9FeXZpQ011cHVGTXpyeW1S?=
 =?utf-8?B?RE5BaVFCQXdsVHJaVnBKVFE0TmM0eE5sNk9laDhDbW9tSlRZa1RubGRQTHVV?=
 =?utf-8?B?OTRwR21TbiszUVdsWkhUVFhKd1NsVndJa1Rma1hWcThXQkU1NFZ4M1g1U01X?=
 =?utf-8?B?NTFpWDBWaWNiMFk2Q0FUeXlVUzQ4d0JodWc1d0tsWC85SE1yYSt4disrR3lp?=
 =?utf-8?B?WDRjVTVXVUZKdTYvdW9qSkliU2JGVytiejZKOC8zTkMwVTlPK0YyazhhTWM0?=
 =?utf-8?B?NVNmaGV1dWxVdEZtVmdXeHBCcXozOVV6UnB5Ui9CMXVNNmhNMndnSFU2bE1p?=
 =?utf-8?B?bTFNNnBVTk85aUlEVDM4aGcyb2pEVE5vRHZBYitNaWRqeEpSQW84YlJkTk96?=
 =?utf-8?B?bGFneTdaZy9JaGs2T2c1SjBITU5MQnlQS04xTW9UM3NXdzc4eGoxeEFwN05o?=
 =?utf-8?Q?PzoELhRdE40sWVqM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edeb523-b769-463c-1634-08deb5ad8c6c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:50:12.4140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcNxbF95PEwshwAFHDf5qL/Hjf55/ex27cQGg6m7s3FCulpQ5CybkdIDrDXRRfb8ho3pwAMgLmUt/FHIctVFJUUPiKa77joxFDPEnL5fojo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6343
X-purgate-ID: tlsNG-c201ff/1779198623-E0E64443-568E9F1D/10/73395122804
X-purgate-type: spam
X-purgate-size: 4240
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:baptiste.le-duc@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org,gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B3707580029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 1:06 pm, Jan Beulich wrote:
> On 19.05.2026 13:56, Andrew Cooper wrote:
>> On 19/05/2026 12:51 pm, Jan Beulich wrote:
>>> On 19.05.2026 13:32, Andrew Cooper wrote:
>>>> On 19/05/2026 12:22 pm, Oleksii Kurochko wrote:
>>>>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>>>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot
>>>>>>>> inside
>>>>>>>> the domain's shared_info page for vcpus with id <
>>>>>>>> XEN_LEGACY_MAX_VCPUS,
>>>>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>>>>
>>>>>>>> However, it does not guard against d->shared_info being NULL.  The
>>>>>>>> shared_info() macro expands to a member access through d->shared_info,
>>>>>>>> so when an architecture does not allocate a shared_info page the
>>>>>>>> dereference triggers UBSAN:
>>>>>>>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>>>    member access within null pointer of type 'struct shared_info_t'
>>>>>>>>
>>>>>>>> Extend the existing fallback condition to also cover the case where no
>>>>>>>> shared_info page has been allocated, mapping the vcpu to
>>>>>>>> dummy_vcpu_info
>>>>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>>>>
>>>>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>>>>> I question this, largely (but not only) because I also ...
>>>>>>>
>>>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>>>>> ---
>>>>>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>>>> ... question this mode of operation. Yes, you may (for now) be able
>>>>>>> to get
>>>>>>> away without, but e.g. event channels will want supporting at some
>>>>>>> point.
>>>>>>> Which will require a shared info page. Better put that in place
>>>>>>> right away,
>>>>>>> even if the guests you test with don't use it (yet). Certain other
>>>>>>> common
>>>>>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>>>>>
>>>>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>>>>
>>>>>>      if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>>>>          goto fail;
>>>>>>
>>>>>>      clear_page(d->shared_info);
>>>>>>
>>>>>> ... but without calling share_xen_page_with_guest() after that
>>>>>> allocation as share_xen_page_with_guest() isn't implemented at the
>>>>>> moment?
>>>>> Or could it be an option for all arch-s move allocation of
>>>>> d->shared_info to domain_create() in common just after
>>>>> arch_domain_create()?
>>>>>
>>>>> The only question if share_xen_page_with_guest() could be ifdef-ed
>>>>> somehow so not to block new ports to implement it from the start.
>>>> shared_info is an x86-PV-ism which escaped into HVM and then infected
>>>> ARM too.
>>>>
>>>> Sadly it's ABI there, but this is one of many areas where I really want
>>>> RISC-V not to inherit the mistakes of prior ports.
>>> In which case, how do you propose e.g. event channels to be handled in
>>> whatever is going to be the alternative?
>> Implement proper enumeration of virtual capabilities (to be retrofitted
>> to x86/ARM too), and only offer the FIFO ABI (which is superior in every
>> way to the 2L ABI).
> What about the wc_* fields then?

Well - ARM seems to have the right idea by entirely ignoring them and
leaving it all 0.

At least it's obviously got no data in it, as opposed to what we do on
x86 where we pretend it's possible to use some stale value to determine
the wallclock time without even a tied TSC reference.

This is one of several things contributing to our in-guest timekeeping bugs.

>  And about everything in struct arch_shared_info?

There is nothing else in any arch_shared_info applicable outside of PV
guests.

~Andrew

