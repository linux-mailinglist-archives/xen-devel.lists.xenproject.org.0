Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112DBAC9883
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 01:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001650.1381774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9Z8-0003sA-2A; Fri, 30 May 2025 23:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001650.1381774; Fri, 30 May 2025 23:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9Z7-0003qm-Ve; Fri, 30 May 2025 23:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1001650;
 Fri, 30 May 2025 23:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Ydo=YO=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uL9Z7-0003qg-2F
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 23:55:09 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20605.outbound.protection.outlook.com
 [2a01:111:f403:2409::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81155297-3db1-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 01:55:03 +0200 (CEST)
Received: from CH0PR03CA0328.namprd03.prod.outlook.com (2603:10b6:610:118::14)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 23:54:58 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::e5) by CH0PR03CA0328.outlook.office365.com
 (2603:10b6:610:118::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Fri,
 30 May 2025 23:54:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 30 May 2025 23:54:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 18:54:56 -0500
Received: from [172.31.32.79] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 30 May 2025 18:54:56 -0500
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
X-Inumbo-ID: 81155297-3db1-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlaO9sTsf3Qn595OA0MG9ZGbRg/3D8IuXDZ0Z5hsQlCyTOEeP2CmzMfpSgKB+E8V+kZiY8W7ULwvAsHVZ0EskMJBhmtsZUzWMRNoHNxsWIyC756Y4r7mIJD17Vx2gAAd6Jh1sTA4FYNWjbWOR1mtxhDnKsUp/ryPVMgayQP5So6SV4637CKDcSCeKtuVmuiWGlTT6Y3OsIV9jCuqJyWU3PEy8GvtWRsDUB318f9ZXDwm0sIbdn56tn2QtbWuPs6fIYudvNY5SJI1PyPs4m82kHvcyyaIG7AchkxtoKcB8RLUagfcqAdFtvYJ8mODl413nUIj5jiktp0cQF7KFx5fCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omHrdZsHmHfJKXsA9dMmnFTx4IsI+IuuaZBByPFTnFE=;
 b=KWmvzsb+Gmc07utLoBpsVk/MVlwihvhEnNP2lFgLdCLXuZmJAXavc0rpP2x5tfKg2/LjPJeDA/A2J+D8sJDU/GK2uZ9q0kOz95Nm0GF5MgrBytM/qcPf27XGpu+nDu2ncD+5+AJGa1iVzo4Whw8MsERKorWAfZ59btjXN++6u2BTl7Xu/rKUyj9Pw2/hCc+F8Cnr526KZM+ANnB1hVtj3q0DtSumZMVTwz1PxdJDd7KPUuFUA864gqcqIG0BWniHu3GI/oUf03h1ECPqE1QtFRr2udBlh/3CwvS5yH6EOIsRvQZZ6N/GIX7ESu1PS+mPljYIxa5F320LNo95Y7yebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omHrdZsHmHfJKXsA9dMmnFTx4IsI+IuuaZBByPFTnFE=;
 b=wCzwK3hJjfsSn2pOlGHvCGbMQ47DGUEITNlSQHh7pXJktfEUBa5FgFAV2qUASxL2VFOoeCvwlohABrdi/K+NW3w19aQ9L+VJc1qr5leqbYWlBtspDPWdm2/ge0BrRRlZuYCDKi8lhNjzmWtVcKC7O4ZDhzuoBy0DWttP5Ha+Juk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9b5a1599-d8dc-423d-b144-90bfe33cdae9@amd.com>
Date: Fri, 30 May 2025 17:04:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] x86: Add missing pci_dev forward declaration in
 asm/pci.h
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-3-agarciav@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250530120242.39398-3-agarciav@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c68f052-75f8-4dac-451a-08dd9fd561e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1F1TTFpR1NtTEVTWVhXaGdjaFJydlcybnBsMVhySUZKQWIrZzBkUEhIajRC?=
 =?utf-8?B?K0RlZmUwSEUzbEUwekpPYW9XMWcvYjhrcWVRVkFReDRNM0JocnF0K1RTSFR4?=
 =?utf-8?B?RE5obkRzRzJDa1BxY1p2MTJiMEJxWGs0S2pWRUxGWUlXeDlnOHhIRzVPanY5?=
 =?utf-8?B?bHJxUGdPTnMwSEZ1SlZNbHdxYWF3bG9nOUcvQTFuendDSVpBZFhmRTJsK0pW?=
 =?utf-8?B?WHpVdzNQUHlsdkZmSnNkeXZuVnB1b0d3QTdSTGY4TVhLcGtnMDdRYzBXZmhU?=
 =?utf-8?B?SEtZSVZ5OEN5SjlRTnE2WGRzQ0tRWnhFZkt0b3BIUFRMY2VISWN1cS9TV212?=
 =?utf-8?B?bzNTWWlhbFA1RzlJamwzYndxL21KL000dWhyOTVsNlIyc3hGU056OHJVaDNs?=
 =?utf-8?B?TnNNUU80aHpmdFRxaEhJbFdwM1Fia3lpUUN4b1UwaHdMaS9IczlmWHRkUGl2?=
 =?utf-8?B?WTlhUVpXN1RZdTJOSTc0cVFnMVJOa2QvUjNqQllVR1g4SEVMUy8rWHJzWjds?=
 =?utf-8?B?aDRMbzlYMzB4YzB0a3J3Z3VjZUxZdTVwMnducmJrdWxQaUpkODhwR2ROVzBY?=
 =?utf-8?B?c2kwNTFWL0s2a0d5VzdPb3hGSE5KUW1qa3NMKzBmYkNFcDJOUy9SNE9VYktn?=
 =?utf-8?B?ckUwZG5VQTV1Wi8rb2hSaFloKzJkcWJQYnJtWjVBUmwvZWhuRnJWank1UWFh?=
 =?utf-8?B?dmdqd3l5UUg4Q3lZamRrdzFMdkJzcEFaR0dNTUNNSlVPOERsUzQ0ejlWZTYr?=
 =?utf-8?B?c1pPd3U3dG5pd0hGcW5QTjZXZWdJaTloUlFEbUJxU2xmRTN0YWRqclhDY3BL?=
 =?utf-8?B?QksvbjZzczJ1VHRmTnlvZVplVjhQTDhIZDZHTXZCSE0yeG10N2RzNE9ldjNs?=
 =?utf-8?B?ZmczOHRzZFIwdVlIMWM5ekJzYmVVMDZUYzk3V29PNjhiV0dDOXFlQWViRDE2?=
 =?utf-8?B?Z3NvUC9NSHJjc1RHejcwWlVPNHIyTXMydFRiSXp3YXA5YVg0NU5MQXlxdXJt?=
 =?utf-8?B?UHNVRndFREFQRnVVM25ua2MzYXZVSFdUdm5qTmkrQlRvclZwVkpyNDRjandF?=
 =?utf-8?B?cGxkVytzLy9yWXl5ajNUNXJLa2Y1WDYwWkxHdW9VekpYTHhwSVU4YWVZN1px?=
 =?utf-8?B?N1FMdURVajE2SGNiS3ZvYTFqVVNrSGIxMi85aTJiQlhPek02aW9KVjFsWVpG?=
 =?utf-8?B?QmZaZE1ZTFdRRkpQUE56YWViMTZZd3FEVGtXMEtleXM0ZTQ3RHlRVDhRaTdX?=
 =?utf-8?B?UlZwaU93UVkzQzdmdHJuSFA1aHRRdDdKclVRemFSeGt0WTJEUG9JdzBUS3V1?=
 =?utf-8?B?anZTNHVaYVNqYVdsNWlkRVpDZHZ3c1AwOXhVTWtkWi9QMmxkaWxGUnVON05H?=
 =?utf-8?B?Z0NKY0g1bHJYOU5aRmxQdGtpTU9BTi8rMVhTUkNNM1RzdHN0eUU2M0dQTG96?=
 =?utf-8?B?cGE5SVNKTEZlcktidlBJa1lIN2hucEpvcCsvQXBWQnROeGNKbldXTVkxWm4x?=
 =?utf-8?B?cE5zamRXeU8yTXJST3R2WEJMSzRHRlFQU0lyb2xpNlc0TmNwOGdaby91SFFZ?=
 =?utf-8?B?VHJxMW5WY3d0dEVhZThPYmxzNGFNN3ZwTXA0L0JXOW1vTVhIWit4S2tPNFRx?=
 =?utf-8?B?ZkVCRkdnL2tHbVpoKzJJZm8waUhaQTgvcW05dG1zS1pSZytOYVVOS2FWSVlZ?=
 =?utf-8?B?eVJHMWRIcys3YVlpTGVDc1ZXaFdQRkxPRjdRd0FiRGlCSzM5ZXRrR3BZdDMr?=
 =?utf-8?B?a2ltaTVITE9JUGU0WmRabndQcm12bWl2cExnOVNQaW00dkNaS2VSWlBBWXNx?=
 =?utf-8?B?dTdlcldZYkRmZW1qYnRYMDcyRWhMdXBDYVluczlOdU9NTnR5VXRERHVoSk9J?=
 =?utf-8?B?c2YwcS9iL2UxUUNhcWRIMFVhcWZydXBDZmo4NWRXNHBxcFJjSjlDcExxbC9S?=
 =?utf-8?B?RHJJOFpsM2FsSXl4OUI1eTZWUUwvRjB3QTUxdlNyWFoxZmh4dmQzNFhGU20r?=
 =?utf-8?B?cGFzeWRGdjVNZ0l2RGtFdWwvMTNUdEJRMU92WGRteEtDenltTEJLSHllVjVn?=
 =?utf-8?Q?UbbamL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 23:54:57.5141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c68f052-75f8-4dac-451a-08dd9fd561e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473

On 2025-05-30 08:02, Alejandro Vallejo wrote:
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Some sort of reason would be good in the commit message.

"struct pci_dev is used in function prototypes within the header.  This 
is in preparation for including (transitively) in device tree"?

... I'm guessing that is why.  Stating  it would be better.

With a suitable reason:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

