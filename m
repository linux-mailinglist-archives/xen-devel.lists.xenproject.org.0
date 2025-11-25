Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17732C85FB2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 17:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172088.1497190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNvvo-0002Bb-EP; Tue, 25 Nov 2025 16:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172088.1497190; Tue, 25 Nov 2025 16:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNvvo-00029C-B2; Tue, 25 Nov 2025 16:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1172088;
 Tue, 25 Nov 2025 16:30:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUk1=6B=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vNvvm-00027J-MS
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 16:30:18 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05c58f6a-ca1c-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 17:30:15 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PA4PR03MB7279.eurprd03.prod.outlook.com (2603:10a6:102:109::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 16:30:09 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 16:30:09 +0000
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
X-Inumbo-ID: 05c58f6a-ca1c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRgMLTni9sXliXI4y0doPAwKKr/BdWLmyllPAAwgRR0LSjYaQ9QA2cXkSWKJRLddQ/2ysxzvxI8qwND81N2/Lg9GveDg4E5cSEWNAQuezX8HiN2bm6ZvWn/a70M4+D99p2h3J5SnX4Mw4ewTwLD76Au/aZnogBQo5bqEm9OVMU67SHPggLCMY8JnUDVHdMKKZhamXTQ/SrEh+3PX2Pxs7XDotD2F/GyDZ5XcwYO5oiPWKD6V5R7nCU5HFgA7mvke5z1Xz/jMYzmheD0ngs7AYatFEcwpk4vjqRfgYLtGPHsna3WCbS2nk9OOZML5y7dbKLu5xZdKd9muYZzTClsu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fYYWaji9e4TuksCboL6iP1HajnxgH2P8fbiA+Ip9B4=;
 b=NcqTVKkOWFAvYRa0jVg7/+XkVk3tlPR01MEqXy8TVvZluiVpDG4sn1G21izReDXnR/K0i5ZXAAwo21+VAF4Wu5fcoC+Quzm4Vn3Qz4zS05I8T74Ck7LgarX+v5y6tejoOxSN2n7aG3RwZpNycf02e5/DeY0lD+tVQGVgbQytOUNQcmUZXEBLOdr/xMq8bOx0P59IKnhYI/m6e0989rzTEEX1XafNxUSVNuskl0SPdS07ZRAQkGLVWnOB6t/eTIHN6GQaLYssDy9Bjd2ctg7Z1o/u5h4SDBUFGzL6ctXxJPHnahS/bA+ap9y9K2SGqJtrAi7hqEFopwIQEEIJuAWxvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fYYWaji9e4TuksCboL6iP1HajnxgH2P8fbiA+Ip9B4=;
 b=NoW2ATMnpI3XbNp1gVUxAJ+vMBmXlVDAuLdLuYTe2kYbkcKguHF/ntlADz7vmyXM9UkdXhiKsuFd0tHK+GkbabflVIXtvnSqnF6qJQjXjbgEL4FeiUVuJwrggIZW07gLMNu3Uel3D5ZfHZ7X18b1NMBloN2Tp7sSn2vWlWuojTh7TRV78dWQC1QYrFJq+xe3/xFBnXmiUVg9FSQ6lRxDioIbRHg89E+o3/EV/T/AxhaiEOyWPeuf+IoaT+z0F2xa+d5UOsCminT/8F9bO7sURb6+zmd/Q3z9TBmD7p50uYNHQ8CK0YZlucG7xXAXSUnxPSllnSM9YYIxEqu50ppCJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <bdd2555d-4c56-44ab-b942-a4977dd50c48@epam.com>
Date: Tue, 25 Nov 2025 18:30:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/24] xen/domctl: wrap hvm_save{,load} with
 CONFIG_MGMT_HYPERCALLS
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-20-Penny.Zheng@amd.com>
 <13cded84-19b7-432d-a9b1-2b9ad9f83283@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <13cded84-19b7-432d-a9b1-2b9ad9f83283@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::10) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PA4PR03MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 88666fb3-0eee-42b5-5a3e-08de2c3fe666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTJ5SFdUUWhaNis3Wlo0RHFCc3FEV0czTUMxUWdwbnJqMzR1UXlCK3hCZjFa?=
 =?utf-8?B?aGc2YzdMVDl0RGxWbHVhSGJVNXlmdHFNZXpQR1V6K2lSMW1rWkFxalQ1Y0lK?=
 =?utf-8?B?eUtrUUYyZElsTlJJWEJiRDBNUWc0d3RQMnA2ZjRyaDNueHdTNnRCU1VzWk9j?=
 =?utf-8?B?U2tvWkZ4ZUxPWnZ2VjhQOFFoeTV1QlhIMWljRDJ3c204S29XYlFyanphU0kz?=
 =?utf-8?B?bVRoRXZiUTBvdXJxNWVOOWNkZW9GdXg2MERiVUk3RlFrN0FLbXU3a3o0TWMw?=
 =?utf-8?B?QlVjVXZWWUpTOTQ4MCtBUnd3WWpMSEdnTkp3SVNzL1hNNm9kWEhIRlJDc2dS?=
 =?utf-8?B?RUM3RlUxa1hqZFFsMG81bXRubGdjNXR4VTByUC9maml0cDZ6NFV2M3IvK2F0?=
 =?utf-8?B?ZHhNcXJCaFQwQXlHWDlpM3ZJM25XOXkyRGl1SmRudWIxWWIvRFJ0SG9ndXFM?=
 =?utf-8?B?OHE4YlNBU3RDbmI4cVNxU3d5dE9ZT1BnSEFUWjFNTmhWMlcySmFucVBDOVZE?=
 =?utf-8?B?Wm5yRVhsc04xc2t4N25iMjNLU2JPV3cwWStMWldaN0dJMzRkV0pidTd3RkpX?=
 =?utf-8?B?OGJka2krb3JTdU9qVEZqOHk0Y29ZdEZkMGdERkVxeTQyWlhkL1hKc0VHQWYz?=
 =?utf-8?B?OEo5RVRDRVVIZ3RMclFDZlhVZWpVKytNU1BGVktRdXNwZ3RjRU1WSjcwY3Vz?=
 =?utf-8?B?Y0JGd01QS0djbTlPRkgwRDRLMHlmYkJNdFdJQXBTMWtkWVBZKzIyQmttdDJ3?=
 =?utf-8?B?dWg1a0l1Q09IaWJ2WjJLenVPWU5NcDdWei81T0pzQjN2WDJpVDZES2lMQnBN?=
 =?utf-8?B?eG4vL2ZmMDZoNkhPQmNrRU1vUm5QeER6WGx1TjQ1anV4Yy85YkZ5UGRkcFRW?=
 =?utf-8?B?bkU4STUyVjJvNHYwakpJUzFoU2tpUEJzN3JwSmFrZU1rV2MydkpiWGpCeUhS?=
 =?utf-8?B?aDYrWjBvblBnbys2MExJV0pyWlpUTGJEOGRFcytwUVVoSmNaNGw3K00yd0Iz?=
 =?utf-8?B?ZjFBTkRwWVhDMk1PWUJ0L1J3RWxIZlBoVnppd3E0TjV2MkVvS3Q2QjdCQ1FN?=
 =?utf-8?B?ancycTdCbDlRREtBdkZFTDhFeG8xMEw5VnBrT0xjREg4eFI2bmpaM0NuMWlx?=
 =?utf-8?B?c0IyemtBUFdGR25CczdkbHlZWjBQVGxub2pGaHd1eUtHUFphV2JQSjFJVGxU?=
 =?utf-8?B?SXpVMmVmOFpEdDZQSUZvQ3pnQUo3WjR2aVNhcHNTU2JCTDJnRjViZmcxeUhj?=
 =?utf-8?B?MUc3Q3RHaDh1QXRyaVNJaFpRMldVOGEvY2ovMkhkM2U5S1ExSTRHNjJocUVQ?=
 =?utf-8?B?V0FQTGJhbi9NeGdBcGd2T2wvTWNnTVFtWWM2eTY2dDJ4N1VEWVJQZ2JtQWtw?=
 =?utf-8?B?OXl1YkRvWVVmSUEwUm9GY1RONFVmRTRtNzVmUGlyNk8vL1M5dVljUzBQY05u?=
 =?utf-8?B?ejFwYkVDeTdXQlQ0ZlA4VGl2b2lpODhkM0FDQWtsbVA0N2F4R051L3hDV2c5?=
 =?utf-8?B?L3NHbHlWOTF2QmE0dGdIYlhiY2h0ZlFBNnk0bXA4NzR3Vk82ODlDKytpRm5P?=
 =?utf-8?B?ZjJneUNFVWxCSHJJaklPUlZOaXFwTjJHeGhQNjVCVVhlRlF3b1RBWW1UNjdO?=
 =?utf-8?B?Vkd5NkZ4RmlaVEYyR2pQRXFwdzNueExYNERrWW54ek1KZzdsQjA4bllWeVBS?=
 =?utf-8?B?Rmxva1JBKytwdmdzMENWRjNIR1NFWnNWN0VmSXlXWlluVDVJT1RlVTlRNEhH?=
 =?utf-8?B?VTlKME5RQlJSY3pKTkRGVGkxM2dKVks5a2gxY1BTc3FBbHFJckRqY3RIVXls?=
 =?utf-8?B?VFZEdVh6TWxsRmM1SHczNFNsNkNvc1RTblQvbHlCQUt4cG11UmRWemQ0eWFZ?=
 =?utf-8?B?bDRyRGUzV0VDRWVpSWpsLzlibmdNTGt4eUJIWTBsT0tDQXRKcENhWXloUjc3?=
 =?utf-8?Q?0VQ5pmzb8itA5+TUMUN60gJKWLFJs4HF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGlMZXQrdzAwTnE0bVNIcUJUOEp2VnJNeFM5UW5wdG5LcEFLNXpkWXZuTk5X?=
 =?utf-8?B?Smd3NmRWK0dKcnE0cXU2Z2lSdFdSVENUZTNXcWE3dGFYSWZPM1lUcndQTHFT?=
 =?utf-8?B?bFFWNDZ5UDJ0RWNnNmFMU0JqM0hreFFHcTdJbHc2N2RpUnJybUZvTUF2SjN4?=
 =?utf-8?B?MUw4UHFtZzRIUnFObGJUdFpYSlM1K3VwLy9UVGtVTzduVWU0b0gyb1loMzd4?=
 =?utf-8?B?NGtNN3QyUTZrSU12Qnhwdi9CYXh4M3F5YnhzdDlNV20wekNNQmtOZjFtdWZv?=
 =?utf-8?B?TDhrNEVyWDJ1ZG1nQ1I4NTE0SC9JQ2s2QXdYTVJCaU5GTnZLRG44VXhuc1Fi?=
 =?utf-8?B?UnM2S0ZUS1UxbWE0cC9CWG9wUHhBTGNkM251S05KNjA3dmRKOWlXYVA0Vmpq?=
 =?utf-8?B?QlhsVmdOU0t5UDVwcytjQi8yMHRSSHJHRDVENzdqamRKNFlxKzN0eG1GYjFB?=
 =?utf-8?B?cDRKVW11aEoxVFMwV0xuMXMyM1NKMUlQM0I5YUhxSmdzMVQ0STNSSmtIbmlF?=
 =?utf-8?B?S1NRczh3TjZNYVRqZWVDNHFGTllRNHlpOGoyazIwL3Rmd1MyZjFKazZZL0lm?=
 =?utf-8?B?bFJHb1NMb2kzVVNYVWxxTitBUW1sUDNCZDNRZjMyWndaVjhmTGQxbmozRW4v?=
 =?utf-8?B?aWRNa0szTkljYUpwRVlzSlRDSG5LS1NWZXM4SFRsNGRVRGgyc2dnUVE0VmZv?=
 =?utf-8?B?WWY1YURhdnBCVFBCRWxvVUFaMDNNYWllQnEzeURxZmJaSzZxWE9MR0c5b0pS?=
 =?utf-8?B?Z3FVSnJzQlBoRWJGYmpRazlwcHY2NWR3dDdUVno1eHFmajExc2hleVEwZm90?=
 =?utf-8?B?TTNLdzN4bFdmVXBiVkkyRkJPRGNFTlQ5cnNNaHNJWlpQSk5XYTZFcm5rcktH?=
 =?utf-8?B?c0FmNFN5N2xUUW1waW95dVYyZnZBUUhWRW96bDYwSEJFampqUUg2WGl2QVE1?=
 =?utf-8?B?ZHcvbEYwWEtTODdFYVlqNm9EU3N5eUMzdU00SkozRitIWVR3RWUyTXFOZnFz?=
 =?utf-8?B?WGcwZ0xGRWlJVE5pV3ZOdXNkczQ4QkJzcElQZkpwVTlUdWcrTUVuMm5EVmJ2?=
 =?utf-8?B?QXpxdm55NFB0UkpiNHNibWl1d3FBZVkwSXpEMUZtV1NPdXB4Unc3MkRBVko2?=
 =?utf-8?B?b3JqRUVvVHVOR212MVJ4NGRqRm5QZjVuREVtaVRzVDFhWWp3b0VhZUNCVU5j?=
 =?utf-8?B?M09ybEhaTjBwdjBkVDhHL2dUSklURW11Ylp2VklPM1ZTR0dWN0RlenJacEpw?=
 =?utf-8?B?alk1TDNua1hJOXhwbTgvUHg5VCt6K042bUNZSW5YSlZYV0NhT2k2REtTQ3F4?=
 =?utf-8?B?eWFFZmFJbEpza3ZYYjJWaEJTV084b1VVVkVnVlN1VnM5NHcwdXBoeE9vRUgr?=
 =?utf-8?B?WGlGemlKditabmJtQkxHeHJIbjMvSXRGRFVUb1U4eWUvZDJob0pKckt1NHIw?=
 =?utf-8?B?TGdLZlQvTnZmb1c4WThvMk94d0czZlRPTHI2RUNDQ1pRQkE4b2tVRS9QTGIv?=
 =?utf-8?B?UUZ0b0RXVjNpbmtvcDVPdFdQcXVDRWJ6ckx3ell1b3NtbmYwdldXcVYrak44?=
 =?utf-8?B?RkFCNzMrUlUrNXdtcHpTT3R2SDZXVllnRGg1R2xTSWk2TkYxSUJ6S0pZTWk5?=
 =?utf-8?B?U0lySlAyeUgwZnR2YUI3dzhmY1Z3TmVmWitob1V3bjJWZUJ6ODZTbkczaGhK?=
 =?utf-8?B?K04zdm5RQ1NFdk1wVDg4am1wOU9ZRFY1ZTZYbmlsS2hZbVRiKzU0YlQzY0xE?=
 =?utf-8?B?ZWJqZkVJc2FpM21tNHFFWCtxS0hiWmtjZlY4dXNaMUJWaWJ5Q1VTYmMxbWZ1?=
 =?utf-8?B?V3Q2dDhpUVk2TDNpRmVzbVovRlg3UDhObjhLVlZNNVl4STZHM1RNR1A3cGVu?=
 =?utf-8?B?emlYQzZ0cEhtMUFCUUtrSStFYTZ3dGdlNFhJV3F5dndwNDZKcWFKSzRtZCtq?=
 =?utf-8?B?QUN0ZkZPOXNKQ29FbkwzVkFrWFUzQ0NCcm1WWnNwN2dGY3FwbDM0MXhZblpR?=
 =?utf-8?B?VVBzWEgwdXBrNGtaejY1VkNBMkl4bXZCd3RXVnZQd01jRXNPL2VBQ1pZRW5p?=
 =?utf-8?B?NWdjYXg1cGpZSVZReHNuVmNJdllFOWNqT2s1dGJISitvdUtBYVI1MkdsbVB5?=
 =?utf-8?B?bWRIeElxUXJFeHIwQndod1NPamNWZWZoL1dEM2RjaE1GVktGT0FqQ0gzdWgx?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88666fb3-0eee-42b5-5a3e-08de2c3fe666
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:30:09.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Me3NeEXYy9TT3J0BPyRQnqsr22OrUDcqVu9vw5pqC9e/aqKybsrNG1IDKz+XJ9MSnIIGOrFv1OGujA9pTzNUXD3+Codf/zhqghZnqWKTQm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7279

Hi Jan, Penny,

On 25.11.25 17:59, Jan Beulich wrote:
> On 21.11.2025 11:57, Penny Zheng wrote:
>> The following functions have been referenced in places which is either guarded
>> with CONFIG_MGMT_HYPERCALLS or CONFIG_MEM_SHARING:
>> - arch_hvm_save
>> - arch_hvm_check
>> - arch_hvm_load
>> - hvm_save_size
>> - hvm_save
>> - hvm_load
>> While CONFIG_MEM_SHARING is also dependent on CONFIG_MGMT_HYPERCALLS.
>> So they shall be wrapped under MGMT_HYPERCALLS, otherwise they will become
>> unreachable codes when MGMT_HYPERCALLS=n, and hence violating Misra rule 2.1.
>> We move arch_hvm_save(), arch_hvm_check(), arch_hvm_load() and hvm_save_size()
>> nearer to the left functions, to avoid scattered #ifdef-wrapping.
> 
> Why would you move things? What is in this source file that is of any use when
> MGMT_HYPERCALLS=n? The only caller of hvm_save_one() lives in x86/domctl.c. With
> that also removed, hvm_sr_handlers[] is only ever written to afaict, which means
> that's an effectively dead array then too.
> 
> The final few functions ...
> 
>> @@ -390,6 +391,7 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
>>   
>>       /* Not reached */
>>   }
>> +#endif /* CONFIG_MGMT_HYPERCALLS */
>>   
>>   int _hvm_init_entry(struct hvm_domain_context *h, uint16_t tc, uint16_t inst,
>>                       uint32_t len)
> 
> ... here and below are only helpers for the save/restore machinery, i.e. that
> _all_ is also usable only when MGMT_HYPERCALLS=y. Yes, that's a lot of further
> work, but what do you do? You'll then have quite a bit more code removed from
> the set that as per coverage analysis is never reached.

I have a local patch which allows to disable all HVM save/load code at once by using
separated Kconfig option SAVE_RESTORE.

+++ b/xen/arch/x86/hvm/Kconfig
@@ -127,4 +127,8 @@ config VHPET

+config SAVE_RESTORE
+    depends on MGMT_HYPERCALLS
+    def_bool y

SAVE_RESTORE - annotates all HVM save/load code and, in general, could made a feature by
allowing it to be selectable.
Of course, It all can be done by just using MGMT_HYPERCALLS.

So, I'd be appreciated for you opinion - does it make sense to have separate SAVE_RESTORE?

-- 
Best regards,
-grygorii


