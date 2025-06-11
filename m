Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91830AD5D98
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012073.1390629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPi5-0006Pf-4I; Wed, 11 Jun 2025 17:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012073.1390629; Wed, 11 Jun 2025 17:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPi5-0006Ma-1a; Wed, 11 Jun 2025 17:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1012073;
 Wed, 11 Jun 2025 17:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPPi3-0006MU-JY
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:57:59 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20615.outbound.protection.outlook.com
 [2a01:111:f403:240a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ab32b98-46ed-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:57:58 +0200 (CEST)
Received: from SA9PR13CA0122.namprd13.prod.outlook.com (2603:10b6:806:27::7)
 by CY1PR12MB9557.namprd12.prod.outlook.com (2603:10b6:930:fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 17:57:54 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::be) by SA9PR13CA0122.outlook.office365.com
 (2603:10b6:806:27::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.14 via Frontend Transport; Wed,
 11 Jun 2025 17:57:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 17:57:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:57:53 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 12:57:52 -0500
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
X-Inumbo-ID: 9ab32b98-46ed-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7Pn6sYUFu+pCIiInod76uhnaRa8DSRWvE5Hol2eeFUgS8qzkl7cp3QcPDQOTWxS3fMCOrzjVcT8ju40ki+HqsLLHz/4tws1TFRKnRnil2U3Q6doRyBXRTzu+4f15EWFvIP5StH5NwZsH6QNSLMKCAM/IXuPsI9JbyyFwFWkkwurKf7c+BDN71gFnwocRtZB+JkvSQjEnyZiX0A5ILLD/cyTSDoEtJ+kAU7qq4BAlibBORe9zAWkDELU6Y8IMn/TDZHwN2pj4HD41sS6tvPRcqFmiG2TSHkdMeuZyvyqw0H+eRCp/kcYy/zUymzW4zZb1Kgik7wApmqaqmky4s0TGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDDE3QKO9PxUdocv8Y5SLU29UOji/MivnMZSKCYRwEA=;
 b=H9Ry7MEaidJaNsritpK3wa3Ca9aaPD9PhZ2WH7fYX6lAqi6oFRI5atwtm0aQ2t83zTVkwgdwKqUKtqlUfYRhFYHRQGQQtzdiXPKW1eiff3bezV/yMsOLjUF0gaQdSLRdmfXQq6glUdtpVLf3JYMx/x99yZ7b2PWPpnAcwgYJV9aRUldx5L/Du1cT/qk7WJeRFdIsAJp5luhu6+ExhO98sn/Ds5ixABTOuoPMpa4bTQ2nQsRZSX3Q/53Z8LBP3//1Oe2RoH/ZNHIMnHlJBqFI989GJiJF+k6ogEkZ8MESVtJ/jblFIZTl3Xv3snPPDUXDAmD0BO22UN4wHeODiDev+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDDE3QKO9PxUdocv8Y5SLU29UOji/MivnMZSKCYRwEA=;
 b=lmEZNH0hmMKeaHDYbuUtQk9nzxpP1bCLn5T0PjQMiUhjXCZMJvItiT7z64MXbVdZvw3nePzmg3r7HukAy10D37RzWjsF7CzLCDF4rN6BahxfrKTzEesUCzXoyU0b+2slaDtprMEbqobg41I/I1nbDl6mOaxLcFCPwYYeMhkfun4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <07ef8905-c7c2-4745-9e8d-a8e1e3430195@amd.com>
Date: Wed, 11 Jun 2025 01:18:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86: FLUSH_CACHE -> FLUSH_CACHE_EVICT
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1491ce61-6aff-4542-8bc1-d7db1324cce3@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1491ce61-6aff-4542-8bc1-d7db1324cce3@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|CY1PR12MB9557:EE_
X-MS-Office365-Filtering-Correlation-Id: b5479a85-843c-44e0-7132-08dda9117d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTdIUjZ2ZnNXb3RHWnRwYWU0aFlucFFEQXZBVUZ2SWhtV1drREt4V2U0ek5q?=
 =?utf-8?B?ZlZaTzRVb2RVWjdqOUI4cjlCVzk0RkVmUW90dFg3RCtpOFpIcnpIZGVpaFZ4?=
 =?utf-8?B?RlQySVM5UkxJdFRPU3JYNWhCZ0hNTjZvRGU2YmlDblV6cC9CUlVKRXhQb0xr?=
 =?utf-8?B?RWZDQXlURnpUdFdpYUZEWUp6OHJpSTBpbmhZV0kxbXRYMWwzOVROTEUxQXZh?=
 =?utf-8?B?cE0yZDZUTHpMRmpzbUhpZng4ZmlRM2pKdnMzd1NSejdOdE5MK2laU1d4Mm1M?=
 =?utf-8?B?V2UweE5IMDdqMy8vMGZ0RWdPSkl0cGNKS2FEN1BDa2lHNStHamh0bC9WV2dh?=
 =?utf-8?B?YlZINXZQb1ZKMzNYZUtxQlJacnRZOThYUGQ4WUdiaXVJWkp2cDNHZ1lNd0ov?=
 =?utf-8?B?UEoveUdzdTdJRzZpL09ISFlIckQ2bWhRZHY0L2xXRnVDRnhjNDlodk9tL0xG?=
 =?utf-8?B?RnJyVzBMd3R5eFQvUnhDQWp4UGRQQU5qTUlrNjE5aFNJcDNNamNSc3RqcW02?=
 =?utf-8?B?OUY3OGNMUG9kRHdRU1pyaVRTTklvOGNkZEJiNjlwZ1psZGF3ZktDMTBuWDZQ?=
 =?utf-8?B?R2x2WnFldXhGYjBid3pOQ3VicHZVaDBURkV5UnRkSHJKdTVzdU9PRDFDc3BX?=
 =?utf-8?B?bmY0ZmJJTEdndFNDdC84QUJoMk9vZXYwdDl4YXdQZ3FZZFRhYjY0WW5jWGdh?=
 =?utf-8?B?SHZBRkR0NXYvVkVpUTRJZytJZkxzZDU4anpHdlNVcW9INzEwd3ROdnljanM0?=
 =?utf-8?B?eEZzcXo3b2ZMakNtOXhiWmd1RjhKUnI2cEhXcjRzcTdEQXlsN2hxalZWcE1s?=
 =?utf-8?B?YzVMUm1SQncyUFQvTzJ2cllDelhsSHNZSE5RNlJMRlpsUHZsdmVVUER6b2g0?=
 =?utf-8?B?V1N0ejQ5WnRBbytLUlUvZnV6WUduK3hyL0V5WFJlMThKU2hxQno2dTkzbDF5?=
 =?utf-8?B?QTdtUUN0YytjdVN4ekhqZk14dlBSTEZhbmpvT2dUd2VMWVlyeUYzYnV3Znpu?=
 =?utf-8?B?WWVsdE9rR3FjQXhlbWtlVjF6MCtLeWVQMVR1QUdoK2ZmY0l4THZMMUJLSE9r?=
 =?utf-8?B?cFhnRktkK1lHSUpjL1ZTTWMyWXZxZklsS1Znem9DbWVvM0xKQ0paSzI1bW9v?=
 =?utf-8?B?Z3pWQk16ZW8ySkgwSHpLWXV6ZG5wU1QrSEcza3VaS1FvS09UNWpSRittTjRt?=
 =?utf-8?B?a2RlU1Iva0gramlpeUpBdmJEUlc1VlRXM0ZsQjZReHEyWjJxc29JTjBWUmtD?=
 =?utf-8?B?SzdiUDBtcmVFdUtCeXpzeXN6cWswSENyeUdIVm5xMFdGWG9GbDRValpSeTgr?=
 =?utf-8?B?U0NPTzg0Q1ZyWG5MK1ZORXkxVCt3S0lSK1VTMkVrM1E1MG9yWmpyRllpbVVV?=
 =?utf-8?B?ZVFXcGJ0NTl5L3FlMDhTTXdvZVczVHJVTUFsTTZuQ2JyTFJkZEFhQldpS2JY?=
 =?utf-8?B?djlpZ2psaDNEZWc3UDhGM3FYbHRDWDZCY1A1a0hIRWFKam1aTjE1SnFoR2o1?=
 =?utf-8?B?RWxtRjRCYXFMVys4Uk9rdFRPdThQalpxVDc3aTZxcW1vOFpOQ2w2TTdDcWRE?=
 =?utf-8?B?Y3gybCtqT2toQW5nK0VhcFduMFhnbEJLY1RUb0pod0kySXYzRUs2SlFkL3pa?=
 =?utf-8?B?SHR4SzNSbDF1U3pHNS95S3hRNG5jK3dKWGlRUlVCN1F3Y2FOVGx1OHpXRVhO?=
 =?utf-8?B?QXpRQVl1TVNXdzFRVVZ4TUdZNW1kTDMzeDFSb25OS2UyVHJhbnVRSlJIUDZR?=
 =?utf-8?B?NW90NXBUb21MRnZOd2pxbHpnc2ZXU01FaFNlTm02ZytMV3RrRHBvQ1c4MXR6?=
 =?utf-8?B?Z2gwR1JkbWZ1RExGMlBPUHJZNWI1V2UzNlMxSHRqRC8waXRvRkxGZyt4eG5Q?=
 =?utf-8?B?TkxWcjhqemkrQnBWNHNudXdDdWZacE9PZm1pbmErc3JpcTc1OE9Wa2gxMEZU?=
 =?utf-8?B?Q29QUDJxN1EzQktvNXMxQVNEWjFsczNBbTZWckFxc2dzOTFCd1FBYit4Zmt4?=
 =?utf-8?B?bVVwUUgrYU9KelBnRWZuS3dEVCtlZzRBb010eElqaVNXMG1pazZWK1orZGR2?=
 =?utf-8?Q?XEkg2I?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:57:53.6468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5479a85-843c-44e0-7132-08dda9117d3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9557

On 2025-06-11 06:02, Jan Beulich wrote:
> This is to make the difference to FLUSH_CACHE_WRITEBACK more explicit.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

