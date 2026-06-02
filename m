Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDfkMT9qHmqGjAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:29:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE0E6288DB
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324437.1589975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHg0-0004GO-Rm; Tue, 02 Jun 2026 05:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324437.1589975; Tue, 02 Jun 2026 05:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHg0-0004Er-Ow; Tue, 02 Jun 2026 05:28:32 +0000
Received: by outflank-mailman (input) for mailman id 1324437;
 Tue, 02 Jun 2026 05:28:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wUHfz-0004El-10
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 05:28:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUHfx-001fAI-RQ
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:28:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e69fc-2eae-0a2a0a5409dd-0a2a4505e500-2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:28:29 +0200
Received: from [52.101.201.34]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e69fb-aaa8-0a2a45050019-3465c9223adb-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:28:28 +0200
Received: from DSWPR12MB999151.namprd12.prod.outlook.com (2603:10b6:8:36b::21)
 by SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 05:28:24 +0000
Received: from DSWPR12MB999151.namprd12.prod.outlook.com
 ([fe80::1d57:8e0c:c16d:15e2]) by DSWPR12MB999151.namprd12.prod.outlook.com
 ([fe80::1d57:8e0c:c16d:15e2%5]) with mapi id 15.20.9870.023; Tue, 2 Jun 2026
 05:28:24 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkSVCw4x+c41mXl4mLnKA9EttjHL/exbzZTnfVYWAx6WYtdImrdD8R5cjO68ldqUU/kKHwlAU8Jc5tsSjqBBfyFiyWWSldDsivzr+La3yDmIxmi1bvcsPajKv1HIvAm8QAvyB9BcEtEMguTM6N9w7A5Ot9zSbfgGTWPcQfhqTtS7WIoyk3EV7v2CdGMnXiIN4yln86hrXv0YpzQb36y0NYU0XGE0f8/RSh7gDdcYWSReB5DtzzYom2yiWuVyHrAtd1uF0nXGxio4EdliiGVHrxUQQSjiO2h2KtSggdXlr8MvaNoNg/CJnylcaxrwLF51rSbHo3Z7UUKcliEMB2Zf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Vp6ISeh7dLqs954bIFKWAto44MTLUvOrrPO3AquArQ=;
 b=pFPAi0DVHSBzDCzA60OLQM9WhCAn1VxbiIxgCSYNhjiz8Sa28sGvJTinarMcoMRD1ZAexIDmxHlXsBKaJcAvr2WOmnAgaEuX+5ovuloaU28HCP04GcUdGev++CkoreTYjGv27mFaU5NljAKo4KTf/JOFtaNIIXrm5a78yRREzDa9ep6zEYerN5A/VG3bTmf3mju8vfEiRQS9KfqVPFruj+BRZW0dzRJf5focGF9Phtswz3RqAM19KkEg7Wp8dkrGilQx/PDTMDryglYT1VHJT2Z8enVXHAcdBReQZqSo4+KfOsBDh3jcOWMKknrWs30PCQKoWadeCv6Wkr2IWSmcBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Vp6ISeh7dLqs954bIFKWAto44MTLUvOrrPO3AquArQ=;
 b=jj0f8nboU+wlb20Pk5R7xpEp4bn9d6FkPtLGLqIhC8Xt4dm9xNa4zlIgVALZcZoywegzfiQCfLDr3BNMCZRyHzfYxHdgl3HF1drUbxLhqJEWtR8pqlWfqllFqOJFC0xBaGdkBgtM1hDa6kjhrSmCsG9a9TzkmUA4wuq9t/eYbpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c4ecc349-2f93-40aa-965f-9fe57c3f0f4f@amd.com>
Date: Tue, 2 Jun 2026 13:28:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] x86/amd_node: harden amd_smn_init() against Xen
 dom0 topology
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Penny Zheng <penny.zheng@amd.com>, x86@kernel.org, ray.huang@amd.com,
 Jason.Andryuk@amd.com, stefano.stabellini@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20260506055528.476493-1-penny.zheng@amd.com>
 <3531c9e1-97a8-42ab-aae7-4cfa8976f443@amd.com>
 <20260519141002.GA369920@yaz-khff2.amd.com>
Content-Language: en-US
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
In-Reply-To: <20260519141002.GA369920@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::19) To DSWPR12MB999151.namprd12.prod.outlook.com
 (2603:10b6:8:36b::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSWPR12MB999151:EE_|SA1PR12MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 755b476b-dcbb-4ec9-c9d0-08dec067c41c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dPizbrkEBtTPEkdjyGfmv282e7hnF2vM9gMu7ao54tVmUcSjpQ0fnPmModwZ40MTqV2wgO8q4p4jRoInvRDWXlfJzuxrVONkCNf2bwWAOy3ibgrwzamR//JM3NfRD+JrgSGop0czWixY0+oqoNjV0aBIvPlp18BAhJE7m+2BWxOykMR87gCUENDDrc3116g4FKF8AVi1mc770+j7Tb8UmvK+QfXyu5QeYLNmbBuLkokcHISdG7F5aeSo7tXV9IzRDuY9AUxVymc0aMU7a8NKraCOvcrI0g8Avb/h+E4THpr/CMVvDzjS2ThUqu6QPDci7MqThBXXsN80/+Lv/mKYMfur+7JsJSs/0qFtqJ7xAZdvnECmZcTQ1Z7eUIA06gnCbQiYK97KClffJOU248e6OBXaeXBwwBHS1HTwX4/BREB+b+7mAnFr7merwOfiaqOl/on2w5H33oN9QFQ0AbkpndvXOMRdZhCL+DTohP4Tio0S5f3fE8olfFVk8Z8VHpulLu5FZXr/77rhOgr0Gxv6SXerEu8Zt9ZaaQrM22ZBIW6kaEAg1nX5cvLWGpAt9WgIM40UB0lmN+3xQqD0Kk8IQXCGhiMj7JqRaZWiHxqKoW6G9SATtsaYF3QJ+sAxqze1HwfGhL0EqmsZUIOvZ276e9c0EIGTGbbs/IQ1zE2SqcIVaoQq7rnm7wvdvN31AiG8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSWPR12MB999151.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm4yUDRlTVpRTFl6dURHd290QVZnNnltVm5BNlltN1NUc05RUXVkZ0xwZ3VL?=
 =?utf-8?B?azBKTHUyUjZWQkpvNGhLNVo4cEw5Y2hPbmVvUHZkcTZHNWI4YVZ3VVNJNXdD?=
 =?utf-8?B?TU0zLzlCSys2UWlZMVlrVUJ4WFdOMlJNbmp1MndBVE03ZllHNWxzV3RCNVcx?=
 =?utf-8?B?L21sUjVHeTNZQlMxZnNkekdDbGg2bmszVyswWHJSeEsxUmlBbnpmT0pTME5E?=
 =?utf-8?B?MFZSSGNIZlMyVmV6MlhSdGVPQjZXaS96MEI5NmU4MGNvc1d2c05wd21EVXBM?=
 =?utf-8?B?SHdCTEM3Mko0UGI2UmlKNU5jZGJlY3lmZnlqTUR1dkNyNjhtY0cwNWVaL08v?=
 =?utf-8?B?aEgxalROSXRPdEZscXhlS0lLZEI0WjVDSHp5RFR6NEx0Ykt6cVg3TTR6cHFO?=
 =?utf-8?B?WWFqMHpqd2FoWm5Jd0NITXVJYS8vTXpvb3Uyc24ycUlYVzBHUDlxaG50L1ZQ?=
 =?utf-8?B?aWpRVk1ab1ZtVk1WNGpUR1ZKa1V6NUZ3QkdFUk1JZVJ4emFvbm1BV3Q1Z2xS?=
 =?utf-8?B?K0g2MXRQWEJzRUZ6Q2xOWEE5NzBrRzMrQ1dRUytXRUE0dWpLUGY1R0hYTk9E?=
 =?utf-8?B?RUh2RVhBL01qR1JpcGFOVWlIYjZicXFUSlptdnpibEtRd2RqZVlES3M2bCt6?=
 =?utf-8?B?TTlnby9CRjJIenZyc0x6ek05QzNYMnJ0bFhidW9Ha3VQRm1ub29oYklpcDRV?=
 =?utf-8?B?RFo0K0lOcFRxZ2ZNd2VkYUI4L2h0YUhrR2Q4RDhPcktrYVFCMjkyeUpJWHhN?=
 =?utf-8?B?aHBGb25SMm44TkxhUHF1MkhkOFlDeUdPRlJmeTdMNkdFUDE1ek9NYkdGSWgy?=
 =?utf-8?B?VUladVlTYlh3a0ljeTdKRXQzUlhDK3UrcU9mQlRvQUp2dDM0MXpOWjhXMnh5?=
 =?utf-8?B?M3A0TVREQXlBY0pUUHZpWVFnS0RZQm10Ui9YbmhPbCtvNm0wbUhYaEFBeXpC?=
 =?utf-8?B?N05yZjV5ZEg4UXR4UFBXbU4xNlZhRkQ5Vit6RE1hUVJtRFZxOHBleGhWbFY4?=
 =?utf-8?B?R0g2d2c5YzNxZVo5ejlWbHpJc0dxVldHbDh3UUZQWVJsdnhVS1lEVi81bGx3?=
 =?utf-8?B?QkRwN1Flb3lheU1KRHBLSVZEV0lZazBDcTVqY250M3JVSWhueXR2UEorUnMr?=
 =?utf-8?B?emVueWxGcVFVWUF2SjV2T1pGRGlVSjNNUmtiVVdtSEo2R0hRUU5HaGFhM2lZ?=
 =?utf-8?B?WE96eGZ0U0g5TUxwamF5VVRwT0R2QktTeG9XQTBPT29MRlNnRG1RWnFLd3FO?=
 =?utf-8?B?RGxldWk0R3ovQUw2dmNmR04yVkJNWkR0QTRvN25nT042bnhuTG5McU5yZGR5?=
 =?utf-8?B?YW5qc21EUjVnUmZ1dDVXaS92dEVhbnV6bE1Ock15eVNHVGg0cUgvZ1c5UzZY?=
 =?utf-8?B?bHhsY2hqSzFtcWgyS0pybWN5a29KeU5EK1Fxck5zTzVTSkNGNVEyOVVva0sy?=
 =?utf-8?B?ajNuZ3UrbDZnYVhrZitEcUYvZDJkNXNkanpIcENQUzR4U0JmUVFZaVI5cUls?=
 =?utf-8?B?Uk5mcmpIMXFqVlJhS3o5ZlBQdW5xM1dLcUF4djBEdlM1L041Zmg5V05UUzhI?=
 =?utf-8?B?NUJyc3NjTUIyeE5rMDU5NlJHdlNOMWxjMHAxcTFxRUtNaVFrMzkzaUQ3d3lv?=
 =?utf-8?B?TXlheFBMTFR5dThjY2dEa3RPMWFrQlFldTVJOUtmOHF2T2U2VnBSWHlBOFdv?=
 =?utf-8?B?bDF5b0VNTXlwU2d6bUNsN0xTTHpJOEZWL0Z4ckZzTjQwNSs4YkpDVENjd05P?=
 =?utf-8?B?Q3A0Q3VhL25SSXdtZkt3WXZaYkE0VjNGRCtTaFBRMG84aVZYWXA4N0N6S3RQ?=
 =?utf-8?B?WEFYQXFpUnFDVUlSRDJQVmtXQkY4eUVaeEQ5eWY2eHRmRUYxTjlLTWJxa09u?=
 =?utf-8?B?Zlh5bGtkcmxHTHZhR0hnaVhUQzZYdVJraVlLZ25QbWk1UkVrQXZrYzJDVWJJ?=
 =?utf-8?B?S3R1aDA0alA2dVU3QWd3TDdyRnVwOURCRzJJL3VkbHdxaEtiRG5DVHpReXcx?=
 =?utf-8?B?YkVROWxpOVpTWUUvRFMzaW0zZURDUldSeVl0cVcwdWlpSFRpVC9taDNlTzBh?=
 =?utf-8?B?QmdBSDQxTFFJdWtZODA0Rkx5TkZJRCtiNnlNR1duMDJ0ZXVHNFdRaTZxLzFI?=
 =?utf-8?B?em9SNmI1MlI2UXBOMSt6b2gvcUZTR3ZOajRtZDBRQmFHTlVHS0RVYXo5bDZl?=
 =?utf-8?B?OE16MUxBelhIRzAvNU9lYzFQUkI5ZSs4RkxpRmRTM3BjMWFZcnM0eE5zQjZJ?=
 =?utf-8?B?SEcrd1hHMi85VDQra1dUZUlOL2hTeXFuK2tZZmRUV3BaRExFRk5jTVJlZVJ1?=
 =?utf-8?Q?z2E/uR1GCjeoP6411y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755b476b-dcbb-4ec9-c9d0-08dec067c41c
X-MS-Exchange-CrossTenant-AuthSource: DSWPR12MB999151.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:28:24.0891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J71zvv+Bwgoo8rFxRVzkATZkmdUoi29DvCISgHGRqD6ZsZw7vc0rJD4RnWQSKo3/HjOV1xaWy1BdHkpI2MgHtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318
X-purgate-ID: tlsNG-c201ff/1780378109-E0A66443-EDDE823E/0/0
X-purgate-type: clean
X-purgate-size: 631
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:yazen.ghannam@amd.com,m:penny.zheng@amd.com,m:x86@kernel.org,m:ray.huang@amd.com,m:Jason.Andryuk@amd.com,m:stefano.stabellini@amd.com,m:mario.limonciello@amd.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2EE0E6288DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Yazen

On 2026-05-19 22:10, Yazen Ghannam wrote:
> On Thu, May 07, 2026 at 04:37:43PM +0800, Jiaqing Zhao wrote:
>> This amd_smn_init div0 oops is also observed on 6.19.14+deb14 (Debian testing)
>> and 6.18.27. Given that 6.18 is LTS, suggesting `Cc: stable@vger.kernel.org`
>> to get it backported.
>>
> 
> Hi Jiaqing,
> 
> So is the issue observed with the latest mainline kernel?
> 
> Or only with v6.19 and before?

It is observed with both latest mainline and v6.18/6.19. The issue comes with
commit 0a4b61d9c2e49 ("x86/amd_node: Fix AMD root device caching").

Thanks,
Jiaqing

> Thanks,
> Yazen


