Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E316A88053
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 14:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950086.1346503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4It9-0004Mr-SJ; Mon, 14 Apr 2025 12:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950086.1346503; Mon, 14 Apr 2025 12:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4It9-0004KP-Ph; Mon, 14 Apr 2025 12:26:11 +0000
Received: by outflank-mailman (input) for mailman id 950086;
 Mon, 14 Apr 2025 12:26:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQ8q=XA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u4It8-0004KJ-7g
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 12:26:10 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2415::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3eefecd-192b-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 14:26:08 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Mon, 14 Apr
 2025 12:26:05 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 12:26:04 +0000
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
X-Inumbo-ID: a3eefecd-192b-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoB9c9KX2HFikFDkIE++GAzSSLSgadzYtOXmDtfusI9H46JHxj1IjiI+lk4ZgfqcjRbFvqv1MF1I7Fx5WXMIfYlWc+74VDYdwhifnrIH4n+UpwVQlabfgNldxTBL1orh9/X0eHSgXvEJ4k1prfLER+hG6qBloMZjZKLzmfLjJOo0EiEHAoJtJCHbMRWpuGmVK6AMcwDN0+S4NOVMI7U5SmLdAs+IRKkVCQUEqwarTqeC8npoMjiIHy89AInI+m9ZFhw+JZzlcSGLOSm61IsJnwq9sOL9CFGm/4IV1gUks+Rghc1ONf6NaPQRq0uOHosCnJHm29qoIcUuJSsWhab1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHzsGsCORBlb9iwJ4qw91vDhh+7Q/xXW+GRvfi96BTg=;
 b=xNVHyEs9DTzCdxGKd9eKRvhF03BUzaF7mWOmrcLAWR3qHw/TV2SWBwFOtgvNdVe5Ngxf1JXLpp++YYWIkCHT5biGXSBFBbtTXbc3WN/07CacWJlQFUkvLa2zAKMGOh/aqFgwfA8mNbZCqvNw1O76FRf8pRo2zTQvv0+RnMsU1HTeiyQmvPDXdx+lvmi+Yvx3Mbaou6j17NP5c1sx7JZShyPIx4UI9JPYgJ/ta/TPyaJXps/+qz/sJFuEPGBO/w30tCZ/OyZFt8j0uZgIPuNYBjYCv8DZK9Np/KGxn2Ndz+Kk330T5jXxgXgT9PehRJmCIS7e17klerK0u1Yr5bx+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHzsGsCORBlb9iwJ4qw91vDhh+7Q/xXW+GRvfi96BTg=;
 b=QQP5gQH9ggoSuZIJrGDRs3j3ubXGhfC8NcRn6+d25/3+Q/KbpoosoZw0OOsD3H5a+NIzVSIDaIKwhT0DbYsMVCCgC2RCYImuQsGKfu2BqOUJ8xzRev2H+xPj8bA3VKhvXsWcejRPz7aqcKN5EuRUkGNGQ+P+HXbVODUea+P+nfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3541a84e-5279-4139-884b-61d35b3ccfd2@amd.com>
Date: Mon, 14 Apr 2025 13:26:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
 <b401f18a-f32a-46c2-8e2f-343a4eb134b8@xen.org>
 <614002cc-4dfe-44f7-8ab5-ff7d4f1e694f@amd.com>
 <b691741d-85de-4120-8077-07df50948525@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <b691741d-85de-4120-8077-07df50948525@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0588.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2e2a71-d9e5-4d30-42aa-08dd7b4f866c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzdsQndMVDlrS3RZSnJ4eUdQNzJvZ3k1endOMkYweXVncnpxSndza3N4a2ti?=
 =?utf-8?B?SFlqVzlmSmk2TWNybXBpaUZCT29jRk5TNDgyRU51UGxabWtRSTlIbjFqejZv?=
 =?utf-8?B?ZVpkVjY3S0lOUUpwRThYbFV2QlFXWHAxQUhYclVXNkxDZU5YWDJ3aHVqc3lw?=
 =?utf-8?B?Wks2VGJJUTFYWFVWRDhzSUxsNXFqZkJId3hROEhuMGNNNWhXYXlBN3o3Qkcy?=
 =?utf-8?B?aFphU0lDTWdNa29GL2wrclpTNGFkUjNmZ0RBaDZudi85ZWFkdzI3VVJ2Q3dS?=
 =?utf-8?B?RElpdlh1WEVKTllVVjdkaFA1QjZuenhjNXBhVVRub3VYR3RiMjh5czUvOGhr?=
 =?utf-8?B?NEd2WDBYWXFlV1VIcGlneEhpOXdLRkEvUTNuRC8yZUNLeEpZdXZ2d01vY0w1?=
 =?utf-8?B?OFZ6QVVuUnV5QUVYeHVmTm1pVytjMU1CcGphQU0xYUxtZVZieGUwOE9LTktG?=
 =?utf-8?B?RXhSckpXc1Fyd241OTE3QzV3UHgzVjdpZldnVm4xSTVybDQ1ZFp2b013OUVU?=
 =?utf-8?B?L1JJVktCTXF3ZG81NGdqMG4zU0psWU8zZnZlK1N0NXNmcXN0REt1M2VTZUhz?=
 =?utf-8?B?RnhLeFNLYml4L0drYjhmTmdCY3l6QXU3dU44blpZUityVWpNYlppTURQOCtI?=
 =?utf-8?B?OENVRjY4NjhJR3MzUmpiaGw0WmY3bUVQcjIxUmZONzRBOC9MVWNTY0RvTTVR?=
 =?utf-8?B?d3l0QVVMZi8wS0lSbWJ6R29LdU4zT0k4dnZZWGtDeWFpM1MyWExDSHRuRVdC?=
 =?utf-8?B?Q2QvbGdBYjhEMlBzMmQyVzdHdnpxS3E1amZCQkVyaGZ0YlFDSHVndFVkTEJh?=
 =?utf-8?B?eVpMdGxXbXJSeElIQ1FqV2NsbFhYVzVKc0xTcEh5aSt3ZFFtcTVGU2xxOVlE?=
 =?utf-8?B?RjZENnZSZ1VUeWxOcDBCNE9tcUNPN3c2ck1rNzZ2TXkvNEk3NU83YmY1d3Vh?=
 =?utf-8?B?Y3FlUGJtZkc1dmF5eFhBVGYzSjlCQ1IyQWo3V2s0eVFyazFIWDNqSnA2eHZF?=
 =?utf-8?B?UXE2M0JBMWR0QWx6NEwzVTRaa2FKNi9tKzBuVWVwSUZyYzd2ODY1a1hMZUxM?=
 =?utf-8?B?UGhDL3I3bEZWd3EyaE5yOTg5OGRsRDcwdG9qV3ZGc0VrSlpUbGw2bXRZa1Rs?=
 =?utf-8?B?SG1jMzdxUkZDTnp2ZVNON0hYV0FBbXFxdXZ2ZWlMR1pyeUpwL1lRdWFVOXpI?=
 =?utf-8?B?TndhZEpCU3dNb3hUZmdRQU93Y1dhV3FvcTNzeUlObUVTMTI1UjVmSjFheDRy?=
 =?utf-8?B?NFdOL25ydGlJSGJCZ2d0dmtsUGtRTEl5RnB0TkFGbmtZNmlERVZNOXg0RExG?=
 =?utf-8?B?VUppeEZrQ1lPSzhwaUVWcWc3a2orQWhPSjRJLzMxR1d5N3dWUEVqTnF0Nzk4?=
 =?utf-8?B?a1Z3MDhsaE9mRUpSaThFL3NCcVpnSDRFaXRHSEZaano1V1FwT09ZTEJQTHV1?=
 =?utf-8?B?RWsrMkQwdmpzQnFCYzVNUDB6azJIbnhxYTJudC9tVmNWUW16NDNmTDRabm9L?=
 =?utf-8?B?eURzNnJKMzVFWnA5bE5SaWkraGxPamw2UjRla2wwd3J2T052L2ZSaHdybm9W?=
 =?utf-8?B?dHlZSkFrZUppZklXNUF6L1M0UmtBQldlVWYydXVqZkdKR3Q0dE9ibWpyN0ZB?=
 =?utf-8?B?ZVJ5blFuREJyL1U0a2tWdlVZeWlYNit4cXVkSHdMU2lqWnBTOWJFVlBrczgr?=
 =?utf-8?B?dnNHU01qalY5QkxLdWRxUXZzcDIwTjJTWFZzMW0rbVV5MDgzUGR0T1dWbnlB?=
 =?utf-8?B?Qm9oRDZTamF4b0dwWlB0SGpuc3pJVDRhTDVtSFlKaUlJa2UrbkprdXdsaFhQ?=
 =?utf-8?B?VXVvZmkwZzgyVWVKVjlsWVdxQlRWMmg1a2xOWGVoV1MweVJMRmo0MElHTDRL?=
 =?utf-8?B?Vk0vM1RXSFFLRkI5dFJUT0dxZXlmdmM5cUEvVFVHc2ZHYkZ1em1TcDVoSURH?=
 =?utf-8?Q?WDXWAoFyqOM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXl0L3d0SGd1b1lJUTh5SEt3Z3NLdXpNelY4ZlJWdGxNNkZWRFZBSXlnbzJy?=
 =?utf-8?B?a29hb29OSmZiRTZ5ZUpoZU5DTW5UZUlKSEFObWJ4ZTdGRCtmTjgrZjczWUwz?=
 =?utf-8?B?M1ByVlI0UjJ4RDJxTG1mcWJqSmkxN3A5NWpvMy9XRVNZQThwTW1Vd1pKWmdW?=
 =?utf-8?B?dXZmVVVJb1pLSkZyVFpsTGFYaitzcEo4RmQxSnUwVUdIaWhMalgrbTlicGRi?=
 =?utf-8?B?THZ6U0RqY3dxMUFCa2grcTdZbkJNSmRGSlMwWG5rSUUvdWphOHNJU0pSaVJY?=
 =?utf-8?B?R0FrSTJLYjdSZmtSajNzOFZIaEhIQTFINm5sak9RQUI5RnVBQ1hFSWthcWtB?=
 =?utf-8?B?U1hsTUtMTjJVNmt2MmJCZEhEbXF4YlRrL25qYWFYbG5GUmdsR2VOM3dBTmhN?=
 =?utf-8?B?bkdNb1FQallYUDM2SXR3TlYvbGUvdGVxSXZrVkJRQ21yejJXblNYNHNVcUJP?=
 =?utf-8?B?aTJWcThxNmdtRWFzeG1GMFlyak05T3BHdFR1bnVDV1hCLzJUQVB0VzdXK1F3?=
 =?utf-8?B?eWVJZE1WVDcxRzVIM2tFa01Sc2pYUSsvT0pvVHNaVXdmN25ubmtIMlVlMTdK?=
 =?utf-8?B?RlFrUDlHdElwZ3hVdWJ4Q2M1RGhEWE1KVFd2a2svYXdzd25KN3RvUUlkYTJw?=
 =?utf-8?B?aUcxT0RnZEZuc3NNdlVyVzNGaTdZYnpzTjJYTmlucURBT2pPMEU3UDcyRVNF?=
 =?utf-8?B?dUFteGlpeWpqUS9NWGcxa1MzNEpJRWV6OEk4QXZ0TU1od1lDeVB6SklUY0xN?=
 =?utf-8?B?YmZySEJSeU5PWk42OWNJSGRpZStvY0FkdGFaVTNmK2lZamZKVjlTbWZRUWZU?=
 =?utf-8?B?eTEyZUlWQ1RQbFNjVHhBNFJtYXNITU8vaWV1MTkrL3NlNHdKc285bnF0Z1Vx?=
 =?utf-8?B?dHd0L1p0a1J6TnlzT2xNeXFmeUdrVWlRR2RnQUpIQXhkSGNnUGpoNG9JOXox?=
 =?utf-8?B?SmJFRGJOWmxFTFRvb20zV05HODRYVjg1dU1RMUZhdisvUVNCdDJyU2ZrZTVj?=
 =?utf-8?B?MVUrZlh5NVhXb1RuS3R2UGFZMFlWVC9vTnVTNFcrUy82YnZpVXhsUVJqMzdT?=
 =?utf-8?B?R1ExellxdjRUU1kwOWxpSlVjQkFBbDNlSUFQVUJUTElRUG9oKzdheldRYWJx?=
 =?utf-8?B?YWk5OUppSE5mWnlqTWh4REVvL2t5Q29FeHk5MERpVHRpa24vZDBndkRqL0w1?=
 =?utf-8?B?c1dHR0cwUDRHQ0xSTkZIaUYyWlJhMEt1WWgvbVJMUWh0b2x5SllsYlVvRU8z?=
 =?utf-8?B?Wmc2SzhWTGJLN00rc0tTSTFlZkVEVUFMY2dvNzNDaUdIN01zWmhOdUZ3eVBo?=
 =?utf-8?B?eWVGWmJhS2d4VWF4RG8vQndGL0Q4R2lNY2hacFd5c0dqNk43RTkxT3EvMmxj?=
 =?utf-8?B?NFNVUFg4dnprSWF2VmYydUl6SWl3QW91Z1hDcmM1ZS9Bd2JVSGk2TkZ6K25n?=
 =?utf-8?B?Z0dtaFh1RUxOaVhPMUwydGV6YitHSWRRYldWOHdXSmM2M0wwNjdmVjlrYnk3?=
 =?utf-8?B?b0c1WFRVaDNqMkZvdEtjeU5jSkd4SnZTZ0tpVjhqK3g5c0pic3MyZm5zUUtx?=
 =?utf-8?B?dDNpRkg1WjhsZitHRFZoTUp4Y1ZDZWZmM21IZE8wdU5rQU1RSGcySkZqSXNu?=
 =?utf-8?B?UzhXelkvZXkyU0psekhRc3ByZi9XWUVVRlgwYU1EUHd1Rk1scUpDUmptaHRZ?=
 =?utf-8?B?MFZ0NU9vd0lGWWpQOGxiV1dLN2poMTJvcitVMVVFb2ZLNXZKZlBsbVN4WFc5?=
 =?utf-8?B?VVNWUitZeWJJbi8xdmFtVHNnNk9QQjFteWduTG5YQTk4bFNEQUJLN0poYTIw?=
 =?utf-8?B?NkVuekdkYWpweUpucWQvZ2FMblRmNStFN2ZjY3RRdU9mVGV0RG5GODZESXNE?=
 =?utf-8?B?MHBGdEVpMkRIUkpDYjlZaC9TRkVJYVlJaWpxbjRObm5TYWlxUGpPcE4wTDZM?=
 =?utf-8?B?WStMbVpLa2ErbW8xL1UyVFM3cjFjNjJQUVdpaG5rbEo1N1c0QkRXalE3eGNG?=
 =?utf-8?B?TDdBbnE2VjUxNEZ3NDVwYU83amZMSzBnTjVETkcySTMrQ3RFQmx1cHlXVnRL?=
 =?utf-8?B?bFRJSUZmeUtlTUppNnprQ3NMdUdJSWF0dHdUcHJuYzZHOVo4eTFkRmZMUTR1?=
 =?utf-8?Q?t5mWRMAzMs0X/7srtp/UAnuqT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2e2a71-d9e5-4d30-42aa-08dd7b4f866c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 12:26:04.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+Q+Cs2qXc4ysjaEtHswMejwsUbEd5hXIDaEKFX8K/sePFx0CLxI7r5xN5+ZwAHngSJvhC3IvP1R3VMP2PkOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341


On 14/04/2025 13:03, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 14/04/2025 20:54, Ayan Kumar Halder wrote:
>>
>> On 14/04/2025 12:21, Julien Grall wrote:
>>> Hi Ayan,
>>
>> Hi Julien,
>>
>> A few clarifications.
>>
>>>
>>> On 11/04/2025 20:04, Ayan Kumar Halder wrote:
>>>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h 
>>>> b/xen/arch/arm/ include/asm/arm32/sysregs.h
>>>> index 22871999af..8d7b95d982 100644
>>>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>>>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>>>> @@ -20,6 +20,15 @@
>>>>    * uses r0 as a placeholder register. */
>>>>   #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) 
>>>> ";"
>>>>   +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
>>>> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
>>>> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
>>>> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
>>>> +
>>>> +#ifdef __ASSEMBLY__
>>>> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
>>>> +#endif /* __ASSEMBLY__ */
>>>> +
>>>>   #ifndef __ASSEMBLY__
>>>>     /* C wrappers */
>>>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/ 
>>>> include/asm/cpregs.h
>>>> index aec9e8f329..a7503a190f 100644
>>>> --- a/xen/arch/arm/include/asm/cpregs.h
>>>> +++ b/xen/arch/arm/include/asm/cpregs.h
>>>> @@ -1,6 +1,8 @@
>>>>   #ifndef __ASM_ARM_CPREGS_H
>>>>   #define __ASM_ARM_CPREGS_H
>>>>   +#include <asm/mpu/cpregs.h>
>>>
>>> Just to confirm, the CP registers used by the MPU will never be used 
>>> for an other purpose on MMU systems, is that correct?
>> Yes, this is correct. The registers are specific to PMSAv8-32 which 
>> will not be present on MMU systems.
>
> I am not entirely sure this is answering my question. I was asking 
> whether the encoding could be re-used for a non-MPU specific register 
> in the future? IOW, is the encoding reserved for PMSAv8-32 only?
yes, these registers encoding are reserved for PMSAv8-32 only.
>
>>>
>>>> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/ 
>>>> include/asm/mpu/cpregs.h
>>>> new file mode 100644
>>>> index 0000000000..e2f3b2264c
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
>>>> @@ -0,0 +1,27 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#ifndef __ASM_ARM_MPU_CPREGS_H
>>>> +#define __ASM_ARM_MPU_CPREGS_H
>>>> +
>>>> +#ifdef CONFIG_ARM_32
>>>
>>> I am not sure I agree with the placement of this ifdef. Is the 
>>> implication that 32-bit domain will never be supported on arm64? If 
>>> not, then everything but the aliases should be available for 64-bit 
>>> (like we already do in asm/cpregs.h).
>> Yes, I will enclose the alias only.
>>>
>>>> +
>>>> +/* CP15 CR0: MPU Type Register */
>>>> +#define HMPUIR          p15,4,c0,c0,4
>>>> +
>>>> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address 
>>>> Register */
>>>> +#define HPRSELR         p15,4,c6,c2,1
>>>> +#define PRBAR_EL2       p15,4,c6,c3,0
>>>> +#define PRLAR_EL2       p15,4,c6,c8,1
>>>
>>> I am a little bit surprised the registers have _EL2 in their name. 
>>> By any chance are you using the aarch64 naming? 
>> yes.
>>> If so, please provide the 32-bit name and add an alias below.
>>
>> yes, sorry this is a bit mixed up. I did not understand the purpose 
>> for defining alias , so I used the common name.
>>
>> I will use HPRBAR and HPRLAR here and ....
>>
>>>
>>>> +
>>>> +#define MPUIR_EL2       HMPUIR
>>>> +#define PRSELR_EL2      HPRSELR
>>
>> #define PRBAR_EL2 HPRBAR
>>
>> #define PRLAR_EL2 HPRLAR
>>
>>>
>>> Please add a comment on top explaining why we have the aliases (see 
>>> in cpregs.h).
>>
>> Actually, that comment (in asm/cpregs.h) did not make sense to me
>>
>> "/* Aliases of AArch64 names for use in common code when building for 
>> AArch32 */"
>>
>> Do you mean the common code is used for building both AArch64 and 
>> AArch32 ?
>
> The goal of the comment is to explain why we are defining AArch64. So 
> I think...
>
> > > If so, then the comment I should put here
>>
>> /* Aliases of AArch32 names for use in common code */
>>
>> Does this sound correct ?
>
> it wants to be s/AArch32/AArch64/ in your proposed comment.

ok.

Now I understand. We are using AArch64 names in the common code. :)

- Ayan

>
> Cheers,
>

