Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86144BC8F75
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 14:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140555.1475409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pX0-0006di-Cj; Thu, 09 Oct 2025 12:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140555.1475409; Thu, 09 Oct 2025 12:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pX0-0006bs-9w; Thu, 09 Oct 2025 12:14:02 +0000
Received: by outflank-mailman (input) for mailman id 1140555;
 Thu, 09 Oct 2025 12:14:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQ7T=4S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v6pWz-0006bm-7D
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 12:14:01 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f17a33f-a509-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 14:13:59 +0200 (CEST)
Received: from BN0PR03CA0006.namprd03.prod.outlook.com (2603:10b6:408:e6::11)
 by DS5PPFD22966BE3.namprd12.prod.outlook.com (2603:10b6:f:fc00::662)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 9 Oct
 2025 12:13:52 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::2c) by BN0PR03CA0006.outlook.office365.com
 (2603:10b6:408:e6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 12:13:52 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 12:13:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 9 Oct
 2025 05:13:52 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Oct
 2025 07:13:52 -0500
Received: from [172.28.217.164] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Oct 2025 05:13:51 -0700
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
X-Inumbo-ID: 6f17a33f-a509-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWFdJ9gxZliZvkgMrFHOL80O3yFxxvfdlUgm0s7TuC1es8Zf4jPLEGUKp3PKYrLcnPtmYmQT2K13VQ5sDBSB1jwMhGCuFG+0KF84cavm6xPIZToA7FEI/B5YdjOkbFJT52f01ySVI4L6tha9lZqswTmTG+PhNkJSNPWD5ilY19MOhGa0ay5miy5cA5xHbVCwLN5cOIm9Qi7sYR9JVzlVUDWf/S4U703ZdaIH4JkjPuWOFgP1ouJDZRM+rQu/3P785w+xco3g4wUdAJSKhexm4XrPcz2cszCk6wK1S7gqg6ZYN89ixTtvQwAq2ioG8cwXbERNn1tsO1l5Xc72cEN5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJWsT22i94cKOd7BaW2wMPl8H4DTMQ1Dwbe5Kv3NEZ4=;
 b=nFfUetdL8A3w+ItuIQY8AwUBa//n4sJH2HFXmCQ7xLWjfhzm0ZvjpHIMIbNoV22g0e0tniI8+1+VSJC6NTnG5l0RgbjP1a8finLYZa10yg3hgfp+JwOoYw/mnA3rv/OOtFtrxZp4BlShXr2h6f0KX3qffP9zbYfw/sMEEQdoxY8GnqpIP96XruN27esBagNvOznJ1ilcxRAP83tLabjrAHRF/jD2+eF+A+RYN0r/tG08F9ub8eOxsomlXjhPsiUIHQ6QCDirPghrrG0cAgb7vXjck6K2wAADWvZ/i/Jqz5+A0r30UEiIfy55HlU4OkO+9CNYKBsCHXSvy5GAehbYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJWsT22i94cKOd7BaW2wMPl8H4DTMQ1Dwbe5Kv3NEZ4=;
 b=WQcLaMF5LiCnRwgzrcsPw1dUS7hSN8e4/grODp17nJSnAq3EHNsayUbMIFWhLI2oJLrDc9VXrmmtFuWUx/5HMvZbhSdSSG7DhEAu60A7O1zuv9NH0xtn4eKUr1tf/BaZpw7F6YZVPHJ5HxmBwJ8jpc0ru1R5wgVDVOYj5iPmjps=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a7dde876-0faa-451d-8815-9567bf7da466@amd.com>
Date: Thu, 9 Oct 2025 03:39:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/HWP: adjust feature_hdc's section annotation
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <2622f83a-e67b-479c-8027-5578eb066ff3@suse.com>
 <d445b2c2-0278-4ade-a14b-178a0ee0f5c5@citrix.com>
 <6c4c89d5-cb17-4655-9c45-25cda9c4c6bb@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6c4c89d5-cb17-4655-9c45-25cda9c4c6bb@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|DS5PPFD22966BE3:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd5ed2c-c9d2-4890-e8b9-08de072d4fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGk0cHJnQVM5S05MdmZUUEpxcHJGL3RNeU5YNHplQ3VpOUFqaEE4NTkrL2pD?=
 =?utf-8?B?anlWeEpUeFBER1BNWkVCMEpSMWkvM25NSmNkcmpBeUlRTlI2VXlXQTYzQnQ2?=
 =?utf-8?B?UWxHemJPdUE3a1VJS3JwVjNuVVhQQlowaVJaclFUZmxGQ0dGWmNIVXVBRWNG?=
 =?utf-8?B?dTJUSS9MOGNPTDM2M2JQbTF0R2VYMWhza1VlaW1BSGlCYU5xenRwYjNtZ3Jy?=
 =?utf-8?B?RDFrdkVJVkRJUnA3Q3FBZW8ya015cFVvSTRIRWpWcTdBR0xWWWRwYUdBVmh0?=
 =?utf-8?B?Q0tOUWdlWjkxcHFYWmlWNU9Jb1pZS0hnVVE0cFpEQXAzckp5Z2NQL1ZjTnFa?=
 =?utf-8?B?alIvY1EzTWc5dDRaMmlZOXZaWSt2RDdkRmxvTjhjZlliUC9LM2NUOU12eHdV?=
 =?utf-8?B?QUZEeGtyNGZPOWxiNmIxaVNWNjVBQVBGbXh4RUtXTmN3WXY0Qkp0dmVSMUlP?=
 =?utf-8?B?OEppOWxkeHhoUkc0TVN6SUg4Sk41aEQyYnIrTUxQblVBZDZqR0Jhb3lxZ3BR?=
 =?utf-8?B?UElaWWRkOENSRnNEYjlPczBFbUh6elh1VGNjaGg2bmltUW9Xb0dsMWp3d2RB?=
 =?utf-8?B?cC9FcDNNbWpaMXhRemRxdHFuZjZhV0xSREpYK3ZkQmtGMHBPK3hpWk52ZXRC?=
 =?utf-8?B?SEJnVGdvZmVIV2lIWWZ0M3JLZWNiTWQ3WEMzdTA5U1RRNFlJVzlJQ0dydFFP?=
 =?utf-8?B?LzlJSnp1WTBsQjVNL3BqTjN4OWJKbGwvS1JnOVUyU2hvVzhhWnlQMk1KcWw0?=
 =?utf-8?B?ZmhML3FKN1NqNHdwSVFGL1VEZXRhQW9sbEdicExMeVVvdmI0UU81NDRBNDhJ?=
 =?utf-8?B?UUhYMlhWT29pVytFUGpmdjlZbzZsbE9zT00vRjF4MXE4U1BhajRUNm1XSkVK?=
 =?utf-8?B?RFpUWGxWZ1NkYVZVU0x3N3Z4cit6SEVJVG5DZkk5b3NxZG02bnpjQlJRbVlz?=
 =?utf-8?B?Ym1acFNWL1BxSEJyY0oyTjlNSWpkR2ZjQlYyMW1RZkQvekEvemxpdWFseFZj?=
 =?utf-8?B?Um01Y2xKcDVjcTNKenJKajl6Y3UvMXhIR0wvVnJYZENNbTV6ZitGcDU5VG45?=
 =?utf-8?B?TVdnaEg0TGRYM0tpZDJ3WnNRelZvNitIUWdVYmprRk83NjNZMzlyNFhqU1VG?=
 =?utf-8?B?TW81bjZvL1Ezbkh1ZmQ2WUl6dWZoeEtBcnZWRm16RXMwOURRWGtLZGcyYnV5?=
 =?utf-8?B?N2Y5QU84MzVacjN1ZVFTKzJMQTlZaG1kVHVsT3doUS9tQWMyQmFWSllUWWNy?=
 =?utf-8?B?amJaVzVmOGdXcWpmVE9aVDdHc09mTWFkcWE5enA3L2FYU1B0bnFwYWZTaUho?=
 =?utf-8?B?anhQaHlKbUJZdGMzUGk5d2w0azloSi9zcVUrbmphTEs0MEhMUFZsc3RIMHVW?=
 =?utf-8?B?TXZiaGt2cDA4eUtpVyt6bXgzczMrdEZlZmI2bko5eDZ6ekZXTjRwSllJdWM4?=
 =?utf-8?B?QkNXbW9CVHJlYWhtSDc2NWw3Y0h2L1JnNGUwdnVYTkFBNys4Z1FmZm9WcWNv?=
 =?utf-8?B?Tm1pY3IrakhZM292aTMzQXQ4UURzaS9EQUorY256a2F5L3JKZjJENnAyN2gx?=
 =?utf-8?B?ZEZBSjhtVG9NZGNnS2MzV2FLeUlmdWU4dXErRFFlWlRDc3RSK05OdU1LRlFG?=
 =?utf-8?B?T2lvczhGbGtlS2Fnd0FaTzMzckhvQmIwMGhTL1BwL3B3WjgwV2k3NDNyZ282?=
 =?utf-8?B?R0ZsSmFpOE5yY0VuMW03ZVkyaUQ5a2RUaGFhTDU4L2plOG9zVUhsb3JuM1Nn?=
 =?utf-8?B?UElMQ3VqSUJKcVN4U2NteHN2SGNFNWpnRjNEWFdIdEZyWFhwc0pyNDRGTkQr?=
 =?utf-8?B?NTg2MDNEOTRpZmhBUjJLN2Q0aGx1cXpJK25aaGp3VmdVM05zWm9mVCtXUzhl?=
 =?utf-8?B?dVNOOGlUdllDYUFCRWpkTnF1cURicEFtTERPVW9aSDJ0cDFwV1VpNXVaUmRm?=
 =?utf-8?B?RVNmaEFjSDhkb29iUnFFL3kzN0xiWGtUQmc3eDVwVXBRUnZMYXoxVzdMdGpr?=
 =?utf-8?B?WjZWTFlBMng5cVpvZVVmOGxUMllqN2lJWUJpR3VRUTl1KzIzRm5VZDdTelBl?=
 =?utf-8?B?c1phbUFBVmRHT25YY3JrVHdSYXpFUEpwM0p0UG1nRzBJaTNMczViSVBKM2FJ?=
 =?utf-8?Q?xX9c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:13:52.6079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd5ed2c-c9d2-4890-e8b9-08de072d4fc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFD22966BE3

On 2025-10-09 05:09, Jan Beulich wrote:
> On 09.10.2025 11:07, Andrew Cooper wrote:
>> On 09/10/2025 9:50 am, Jan Beulich wrote:
>>> The variable can be cleared (set to false) by a non-init function's error
>>> path (hwp_init_msrs()).
>>>
>>> Fixes: 99c4570f8209 ("cpufreq: Add Hardware P-State (HWP) driver")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> For 4.21, surely?
> 
> Definitely, forgot to tag it accordingly, but Cc-ed Oleksii be this reason.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

