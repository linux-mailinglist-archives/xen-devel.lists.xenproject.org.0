Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD7EA81334
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 19:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943149.1342035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2CLW-0001rj-AQ; Tue, 08 Apr 2025 17:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943149.1342035; Tue, 08 Apr 2025 17:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2CLW-0001ov-7Q; Tue, 08 Apr 2025 17:02:46 +0000
Received: by outflank-mailman (input) for mailman id 943149;
 Tue, 08 Apr 2025 17:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23Rw=W2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u2CLV-0001op-BR
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 17:02:45 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20612.outbound.protection.outlook.com
 [2a01:111:f403:2407::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48eac431-149b-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 19:02:43 +0200 (CEST)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 17:02:39 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%3]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 17:02:39 +0000
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
X-Inumbo-ID: 48eac431-149b-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFu1JiI9uK9ljKZ5dZ9dl3p7iu7IKw0zelhT1NfCfUDFmi/vslChW1oZ+VKXrFCrSDWwzC6zSi+XNNpLL9Vaa9gCNNaMXAM+XpoaToP7fltrJsMR5rMHugWw1/3L9mToPjOz0wUUSjcZTQbMcBrTCgoTG244ET3bJnDUHvdy6RbSldGJUiBx5UrrqV36msGAyWUNhLVbWsoDhtqaiwwhh/ge3cXBnxN5VbLjrqfPBOdOb1NpnS3pojZ1dwF1ErQmVCV6whuZw6rs8LGrEHuQfxhTHsF7JiqV2QuXRrfG54KZ5zc3qMK+Ui/Et7L6rVUS9BmNdF2VT1m9Nc+9T+4Skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnS1IJovQYGyEjnnsH9DW6R/xXtZ4IoPKRjgU3AgBUU=;
 b=J1vDCkWdJezGbRWjag9XVT4fmqMmQjZyasnrl3PyFY+X6ZJmdTVegN25sB1idVwl7sw0xV4jdPnNyYat8eQ94kaxMe0tjBhEmjt0rPpKMcQhR7inseODzKRu55MYOITap/BUeDYHgTDuL9/xpMxPHe2NbzEvbQxhfXtX/nbFow+u7eCU6vFzgsQWsVw3hn1Mc9y/d1lTYse7DsEo8F4DeKK+snhNhJGB0XQWO3hKT0YqXokdZRoDEhRmynjJC3+lZ+jWqNQcueIZwO2o2wp5OAtvHem8CM79U750KDl49mO15j+tAW+ngE4C3yWD/jB4TDPnMjCXbtcwtM+1upYWWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnS1IJovQYGyEjnnsH9DW6R/xXtZ4IoPKRjgU3AgBUU=;
 b=Hi8QR2QXeLW7lNB/K9WlikqgcwIVyWImAEUGQOFv2h4tnRsGt3U/K0e2rd4bPwZ8maf3zOfJUiYi2fT+mmdeWsmBIOofZwG2bztKaz5CB9HBbzHATiLdxTTffmQRo5OOLHp0L0HiPVpW2re0aDXD+S7S+rmIcdvRWeuOvcyFeTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9f637d98-c8f8-49e0-9f0a-002cdfefc296@amd.com>
Date: Tue, 8 Apr 2025 18:02:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
 <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
 <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
 <4f860a56-5536-455b-9490-196bfc220556@amd.com>
 <40C7A4DC-0216-4981-A501-AFDA0E8671DD@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <40C7A4DC-0216-4981-A501-AFDA0E8671DD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0647.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::22) To MW4PR12MB7334.namprd12.prod.outlook.com
 (2603:10b6:303:219::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|MN0PR12MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: e22588b7-2e12-4741-8ab1-08dd76bf2af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tnd1SmxhS0IyZ3RBajluc3hZcG5MeE9LemRwTng1aGpaR0VHS21uS04wRTBt?=
 =?utf-8?B?S2wyQjdHZGRZRGwxMDNoMFVFdWJIYW9ZcWM5NERJNGY2cGJFRUpiRm8xZnhk?=
 =?utf-8?B?TmhJb0hJeTc4Ykh4VUtVZWtDemJ1YWM1UUt5b1dLc1hueVp6WnFvdk9GK2Zn?=
 =?utf-8?B?NkJyTkN0Rkh3U3B4ZG83V1JFSVUzTkNrQVNCSFFENk83dGhjNmVxbndNR0Iy?=
 =?utf-8?B?QXUrazJvZDE3OU5WR2lsbTYrZHRDMlhHRDhEejFhS3RUZURRWTAzcmJreEtu?=
 =?utf-8?B?Z21VaTVuNitPS1QzOVJQMXNGeTZ5c1BlQWFzbEMrT3lMQ3hWZHAzUHg2Ky80?=
 =?utf-8?B?WW0yc3dHN1l4YVFmTWYwd05seTE5Zy9BR2FqcU55UDZ5dXZyM08vQjhTL1Y5?=
 =?utf-8?B?TEFlQ3lXUG1OV1dPY2w1SWlNVjR1YjNQZWFUeFdOczR1ZkdENk1BNHZvbUUw?=
 =?utf-8?B?WXVrQ1RkWHFSbHlRMW53RkFvL0FVckVSSWFUZ2gyVllNem9KZ0VORDZxWkp0?=
 =?utf-8?B?c1ZnUjdBcUFHdFMrRW9JbENCcUd3cFJ2bGtuYTB3cUNrdE51Y0FGMFN3UHp4?=
 =?utf-8?B?a3NMWUxISDdHMnZoV1hTSHVTZ1Q0dkFXVlVZU2xMcVpyK1ZRMmtEZURWUzZ3?=
 =?utf-8?B?WU9iQWFGSDRId01reEtPT1k2dDQ4WnRxaHlPTzZJVFVwK2YrR0ZtYjJKUG5u?=
 =?utf-8?B?L0FINUJyNW56Sldyd1VMWHhJbVZVUUF4Z2tyTEFOMUt3MVVFM0srdnFORGE4?=
 =?utf-8?B?THRRVjNLTzBHVFlyV0R4UjRid2JkcVhjdk5vQVlJUnRWa3pLeEE1S3IrZEN0?=
 =?utf-8?B?UjhrcElLUlFSOUhlL1lJUWhaTFdDWHhGZk1ZTm4xSEYzdU1mV0Q0QTdHOW4y?=
 =?utf-8?B?cEhGK2I4cWdyYnZ5QzlqQTJvdWphdG5SNmx6d1RINEdOOHQ4RjNQZFpIRFMy?=
 =?utf-8?B?NCtXRjNYakFoUUdORmFZZXRjUXBxREZGSjhxdThFcS9kQmlQNGFrUzh5MnN0?=
 =?utf-8?B?RVRlUXhzZ3dFR2MwZGxZMnA5SkFTMGpYcUhEanhWekd5VSs4ejc2YTNSQVh1?=
 =?utf-8?B?RnBuQUFNeU84dU84dHM1UHpwdGJaY2RNLzd2VXNlaGsyQXBBVnNlbzB5eUp6?=
 =?utf-8?B?ZXR1QVZvUjRUU2hNa3JhZE1zSUtiYk5yRUd1WkNYemNkcjhiRWpnWU9vaWUw?=
 =?utf-8?B?S1hCMlBQOFZ1OCt6ak5lY2c3ZUpuVDV0QkJNN2xBcjVSWHBSa2V1emlvQTkr?=
 =?utf-8?B?a1dMVHk0ZU50K0xSckVHTXlaenp5bkZJMkVDNks4MWNZSU5GTGEwTWJ1TFpz?=
 =?utf-8?B?MkNjR2JMVE5aVHJ3bm5udzdxMXAwQXNWejg0MGZWUWdWMzltVkNYcVNrQTcz?=
 =?utf-8?B?YnRBRnVpVUpXQTM5aEEzcUlDRDkwWThtN2ZTVUMxM2Y4V3VaQ0dLOExWNWpR?=
 =?utf-8?B?K05HRWlWWXQzVEdMQWc3Yk5yZHE5VlA4cDNrRUlEaWo5bVhoOFdNRUkxZm9C?=
 =?utf-8?B?WFZxczZ5WjVDSU5zS0RlbVhualNOLythM0lOblNVQkJPOGpBTnJ1bFVlYk4w?=
 =?utf-8?B?R29vQitHU2Iwa3c0K1pJWTlrVDFWQkF5QkZ3bEpLYzN3MFBxeGJtdzYvVm9T?=
 =?utf-8?B?Rm9XY0tRSkRnTTFibjFiZ2lxWFBhSkQ1UDRlSElZcGcvZ29SUG9wcTBaQnVn?=
 =?utf-8?B?ZTV0M2d1OTVWRHFIcEFOTGIwK3VhMFk2UHJFN0RpcTJQNEY1N1gzeDFPNDQ4?=
 =?utf-8?B?MEw0bHVHNWpSNU8xYWVIamp6dG5rSlZEUG1Jb1dnMHo1aXBpRUlYcHVRbmc4?=
 =?utf-8?B?QndaQTBWS1NwKzhUVkphb3RiNUpybXpWakpWSVI3aFZ1UTVXMkpEZGlEMEJT?=
 =?utf-8?B?RFRUaWk3a1BwN29YbGNHWGl1RVVrSlBPVFNBZDNBMTJjZ2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVlld1FsNkVDL0c2dGdSY01SYyswaHl0VDJxejJxOUNzblBlaWZLbW5pM3pT?=
 =?utf-8?B?MnovZW5YSnN5UmkxVit5SzFQa08yLzN1K2N4NnNzWHVKNEJzN1JENWJPK0ts?=
 =?utf-8?B?QUdadHZCNHFBK3Q3YVBKVGpaUFlWdGpTc2plZGlVTDhjWjVabG40REJ5S2hT?=
 =?utf-8?B?bGlxTWRlVzJmaElWUUtrbzNOZjg1NjJwUVpFVFZrQ3Z5MzYzMkZ5bWhsM3lB?=
 =?utf-8?B?UmwrMGhKUzlKQnc5RS9sbjA2NndXYUxtWXNqYmpFYUhSSit1T1lIdmNzanFY?=
 =?utf-8?B?ZUpnWEJzTjRsMFZJbVZtc3Bmemk3b3lpeXhHSWpLZ29JRTNjVk5BdnFjbU00?=
 =?utf-8?B?bHBZeUVId1Q5eWxRUS90dTRUOGZpTDB6VDg1bmFkZ0lBQ3BNSkRVT1pOUVJY?=
 =?utf-8?B?TzBRdGNGbjhoMmxhaVQ0K3V4eG81empSMUFrWWRWL085MFFpbVp0YUMwR21i?=
 =?utf-8?B?YytxeVQxTWxvcEJBazIySTVZV2pOaHhDc2RrTEd3eXphYXZwT0tyMFlrYm9S?=
 =?utf-8?B?d1JLVkdTSitLRXBGVVhMbVp3NmNRN05mL25mdldnbzVrUTdPcEhiNDlldFJT?=
 =?utf-8?B?cmRKQVY4VGlxMXpSNTFYanI1VnlaSE1OR2dTTUtvQjN5MGRhcUZlN0x2VlhK?=
 =?utf-8?B?bEIrQ2ZXUUdOVkNQZkluWUZIbndOYldSemlZVVZvS1F6M0VWM3VpR29NNEFl?=
 =?utf-8?B?OW9vWnFobmJYd0ZkOURmTkxEakVDM2NKNGJKRkwrR05Zdm04di9oSlBMK3Fw?=
 =?utf-8?B?TFNBY3BHWjQyekwydk9GL3E1SVY5L2ZmM2MyRTNESDZ0RnRjcDJ6SDFuTHR4?=
 =?utf-8?B?TG9nRFRCTmJ3cnpSckFISW4rOXhGc2l2TjVVei91N3IzZFhqZnovY3M1QkNi?=
 =?utf-8?B?dFh2RDNSWjVsQ21PaldmK3FjVDVSdXVMRUN3Z0FWK1JFeFRsZlBpalREbDdZ?=
 =?utf-8?B?TGVNdWxzdVdtUXlqcmMzalpheER6d0hra1IvWmtMNldRVU1BQVB2NXhNMGEw?=
 =?utf-8?B?NVIxNm91em1iSFdqU0hXcmoxa01mN2J3SXhJUWJoVHNLcmdlZkNITEFhSDFE?=
 =?utf-8?B?RFRGOTVxajN3Z1VLSFdoQUlnb1grQ1laYjJDMEJLRmp2RXRjSXdhWjRIMXV6?=
 =?utf-8?B?MmRvNDZrSEFzVU5sTGNPNUxudUVyTUUxaTV3RUlrdCtlejluT214M2FhMis4?=
 =?utf-8?B?M2NKWWNXVUdjVytyeGRlK3IzVk9IL3hQaE1iUS9zaDVOcFRJYW1yN3VQVFJH?=
 =?utf-8?B?c0V1d2J4WWliaE4wVzgxaytmeEpTTUZPb3R4Y0F3MWkyZDAxb2ZaOWcyMXBs?=
 =?utf-8?B?Q2h4Vy9Ob3p0VHhIdzNSZm9mODlVSEFvYnZvU0lnQ2ZUTFd4NFJOMnNrOUxN?=
 =?utf-8?B?bnJhUnBVSk9vd2h0aUFYek01MHVYRGpTWkFhVW9qT2hKU24zQ3I1RjZEN3dr?=
 =?utf-8?B?RXNwQ29DWVp4UklzS1lUdXdobkxwdDRXb3E4UXBqMkJmWEpmbWo1aHRsQWFL?=
 =?utf-8?B?NXlHc25LcW5MOWc2T3NpdnlwNkU5dllXVStvTStoVGVmZE1aUTBHTWVVdFBP?=
 =?utf-8?B?V2xnQjBRekI1bWxsS0M5ajB2RmVua3RPSVlPVytqdUxyczFHRDFsMVcvWTBJ?=
 =?utf-8?B?eUxtRUhxdFFiUTFBU3cwcmdYMVNhZ0F3RUNQN2N6UWl0SHBOWWg0TGhwQnBr?=
 =?utf-8?B?Mzl3MC9HdWlNSW4va24vN0VxVE1XMmY2L1VtOG0yRWZYek9QalVSRVlyVTBw?=
 =?utf-8?B?c3FjK0xubUsyT09BUGdmUnAyL3FDMXRVc1o5OGxGM2EwNzFtZ2p0MzdSZFNO?=
 =?utf-8?B?MDFZcXlzaThzN0FGdzFUa3NQSGptMWZpbU9QZEtoUVVCNDRkemx6REU4ZG5Z?=
 =?utf-8?B?MnV4cURyWnZVYmsyYzR4dzViK0ZINkZmRkhzY1JUckxKeDlDL0RQZDl6cFpE?=
 =?utf-8?B?T0Yyb1JBV3BFcEM3WXhrMnJiRFRCY2V3NHQ2QmlWZWZmWTk2WEw0ZHEwNC9j?=
 =?utf-8?B?akhpRkQ4RjU4SitJc2xyMWR6OXhGWlR0UVlaSGVkUlNGL3VEZmdJb05rbFB4?=
 =?utf-8?B?WFQ1cFhjWk45NGp2K21HYTNxNytMLzQ5SEp4MmIzalJBWXBWN2xGMThRcTRM?=
 =?utf-8?Q?4YtG5G5bFmpSWcufD/wnq4g5L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22588b7-2e12-4741-8ab1-08dd76bf2af6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7334.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 17:02:39.1397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6YhQwS1bBgGir21hxIdF5dWbF/asRo3oVN90lFiLlwGVBwHJ5ee3f9eTefsXrzcpR3jQgj3iRFGd4hbKX5cFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295

Hi,

On 08/04/2025 17:48, Luca Fancellu wrote:
>
>> On 8 Apr 2025, at 17:33, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>>
>> On 08/04/2025 15:29, Luca Fancellu wrote:
>>> Hi Ayan,
>> Hi Luca,
>>>> On 8 Apr 2025, at 15:02, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>>
>>>> Hi Luca,
>>>>
>>>>> +static void prepare_selector(uint8_t sel)
>>>>> +{
>>>>> +    /*
>>>>> +     * {read,write}_protection_region works using the direct access to the 0..15
>>>>> +     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>>>>> +     * only when needed, so when the upper 4 bits of the selector will change.
>>>>> +     */
>>>>> +    sel &= 0xF0U;
>>>>> +    if ( READ_SYSREG(PRSELR_EL2) != sel )
>>>>> +    {
>>>>> +        WRITE_SYSREG(sel, PRSELR_EL2);
>>>>> +        isb();
>>>>> +    }
>>>> This needs to be arm64 specific. Refer ARM DDI 0600A.d ID120821
>>>>
>>>> G1.3.19  PRBAR<n>_EL2, /* I guess this is what you are following */
>>>>
>>>> Provides access to the base address for the MPU region determined by the value of 'n' and
>>>> PRSELR_EL2.REGION as PRSELR_EL2.REGION<7:4>:n.
>>>>
>>>>
>>>> Whereas for arm32 . Refer ARM DDI 0568A.c ID110520
>>>>
>>>> E2.2.3 HPRBAR<n>,
>>>>
>>>> Provides access to the base addresses for the first 32 defined EL2 MPU regions.
>>>>
>>>> /* Here we do not need to use HPRSELR for region selection */
>>>>
>>>>
>>>> If you want to make the code similar between arm32 and arm64, then I can suggest you can use these registers.
>>>>
>>>> G1.3.17 PRBAR_EL2
>>>>
>>>> Provides access to the base addresses for the EL2 MPU region. PRSELR_EL2.REGION determines
>>>> which MPU region is selected.
>>>>
>>>> E2.2.2 HPRBAR
>>>>
>>>> Provides indirect access to the base address of the EL2 MPU region currently defined by
>>>> HPRSELR.
>>>>
>>>> Let me know if it makes sense.
>>>>
>>>> - Ayan
>>> Ok I didin’t get that before, what do you think if I modify the code as in this diff (not tested):
>>>
>>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>>> index fe05c8097155..1bc6d7a77296 100644
>>> --- a/xen/arch/arm/mpu/mm.c
>>> +++ b/xen/arch/arm/mpu/mm.c
>>> @@ -58,19 +58,21 @@ static void __init __maybe_unused build_assertions(void)
>>>       BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>>>   }
>>>   -static void prepare_selector(uint8_t sel)
>>> +static void prepare_selector(uint8_t *sel)
>>>   {
>>> +    uint8_t cur_sel = *sel;
>>>       /*
>>>        * {read,write}_protection_region works using the direct access to the 0..15
>>>        * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>>>        * only when needed, so when the upper 4 bits of the selector will change.
>>>        */
>>> -    sel &= 0xF0U;
>>> -    if ( READ_SYSREG(PRSELR_EL2) != sel )
>>> +    cur_sel &= 0xF0U;
>>> +    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
>>>       {
>>> -        WRITE_SYSREG(sel, PRSELR_EL2);
>>> +        WRITE_SYSREG(cur_sel, PRSELR_EL2);
>>>           isb();
>>>       }
>>> +    *sel = *sel & 0xFU;
>>>   }
>>>     /*
>>> @@ -102,7 +104,7 @@ void read_protection_region(pr_t *pr_read, uint8_t sel)
>>>        */
>>>       prepare_selector(sel);
>>>   -    switch ( sel & 0xFU )
>>> +    switch ( sel )
>>>       {
>>>           GENERATE_READ_PR_REG_CASE(0, pr_read);
>>>           GENERATE_READ_PR_REG_CASE(1, pr_read);
>>> @@ -140,7 +142,7 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>>>        */
>>>       prepare_selector(sel);
>>>   -    switch ( sel & 0xFU )
>>> +    switch ( sel )
>>>       {
>>>           GENERATE_WRITE_PR_REG_CASE(0, pr_write);
>>>           GENERATE_WRITE_PR_REG_CASE(1, pr_write);
>>>
>>> And later you will use some #ifdef CONFIG_ARM_32 inside prepare_selector() to check
>>> that the code is passing up to the max supported region or panic.
>>> And in {read,write}_protection_region() you could add some #ifdef CONFIG_ARM_32 to add
>>> the case generators for regions from 16 to 23 since R52 can address them directly.
>>>
>>> What do you think?
>> I got this diff working as it is for R82. This looks much lesser code
>>
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index fe05c80971..63627c85dc 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -28,23 +28,19 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGIONS);
>>   /* EL2 Xen MPU memory region mapping table. */
>>   pr_t xen_mpumap[MAX_MPU_REGIONS];
>>
>> -/* The following are needed for the case generator with num==0 */
>> -#define PRBAR0_EL2 PRBAR_EL2
>> -#define PRLAR0_EL2 PRLAR_EL2
>> -
>>   #define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
>>       case num: \
>> { \
>> -        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR##num##_EL2);  \
>> -        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR##num##_EL2);  \
>> +        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2);  \
>> +        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2);  \
>> break; \
>>       }
>>
>>   #define GENERATE_READ_PR_REG_CASE(num, pr)                      \
>>       case num:                                                   \
>>       {                                                           \
>> -        pr->prbar.bits = READ_SYSREG(PRBAR##num##_EL2);         \
>> -        pr->prlar.bits = READ_SYSREG(PRLAR##num##_EL2);         \
>> +        pr->prbar.bits = READ_SYSREG(PRBAR_EL2);         \
>> +        pr->prlar.bits = READ_SYSREG(PRLAR_EL2);         \
>>           break;                                                  \
>>       }
>>
>> @@ -65,7 +61,6 @@ static void prepare_selector(uint8_t sel)
>>        * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>>        * only when needed, so when the upper 4 bits of the selector will change.
>>        */
>> -    sel &= 0xF0U;
>>       if ( READ_SYSREG(PRSELR_EL2) != sel )
>>       {
>>           WRITE_SYSREG(sel, PRSELR_EL2);
>>
>> Please give it a try to see if it works at your end.
>>
>>
>> And then, the code can be reduced further as
>>
>> void read_protection_region(pr_t *pr_read, uint8_t sel)
>> {
>>      /*
>>       * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
>>       * make sure PRSELR_EL2 is set, as it determines which MPU region
>>       * is selected.
>>       */
>>      prepare_selector(sel);
>>
>>      pr_read->prbar.bits = READ_SYSREG(PRBAR_EL2);
>>
>>      pr_read->prlar.bits = READ_SYSREG(PRLAR_EL2);
>>
>> }
>>
>> The same can be done for write_protection_region(...)
>>
>> - Ayan
> The point of the code was to don’t issue an isb() every time we change the selector,
> of course the code would be easier otherwise, but do we want to do that?

Not sure if it is beneficial as you would need to use isb() from 
region16 onwards.

If you are going to keep the code as it is, then the following needs to 
be moved to arm64 specific header as well

#define PRBAR0_EL2 PRBAR_EL2
#define PRLAR0_EL2 PRLAR_EL2

In arm32 , they have different definitions.

I could not follow your earlier snippet, can you test it and send it as 
a patch ?

- Ayan

>
>
>>> Cheers,
>>> Luca
>>>
>>>
>>>
>>>

