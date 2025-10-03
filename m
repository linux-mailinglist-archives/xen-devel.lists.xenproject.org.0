Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D9BB65C3
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 11:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136464.1473025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4c3j-0000Z6-O6; Fri, 03 Oct 2025 09:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136464.1473025; Fri, 03 Oct 2025 09:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4c3j-0000W7-Kn; Fri, 03 Oct 2025 09:26:39 +0000
Received: by outflank-mailman (input) for mailman id 1136464;
 Fri, 03 Oct 2025 09:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTCo=4M=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1v4c3i-0000VE-MW
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 09:26:38 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f246061-a03b-11f0-9809-7dc792cee155;
 Fri, 03 Oct 2025 11:26:37 +0200 (CEST)
Received: from GV2PR03MB10998.eurprd03.prod.outlook.com (2603:10a6:150:27b::9)
 by DB9PR03MB7385.eurprd03.prod.outlook.com (2603:10a6:10:222::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 09:26:33 +0000
Received: from GV2PR03MB10998.eurprd03.prod.outlook.com
 ([fe80::3358:d080:db3f:c4a]) by GV2PR03MB10998.eurprd03.prod.outlook.com
 ([fe80::3358:d080:db3f:c4a%7]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 09:26:33 +0000
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
X-Inumbo-ID: 0f246061-a03b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLJocTXzdPgWv/vGMoqMeHtp7WWE9vP0p50TK6dDjWefjPper4RTu81cq0008mPdFiXN3oPIvsZKVXh400iZ9XwUTUPZhbKDaLba9Lnh/8VwrdF8msM/IcaGs9om315ynpaaCj5ZdGz9kY+Ky0lTn+5R+XDV6QjPlhjXsdH4gWD/pCLT+y/EEAXn2RZdS56uAzcRC04LCwDinA1KAPqgc36oCFFyD/BbdXHbWnBT87iO2l6AVtWz+ML4ZXoem+llwo162KLmyEC7g42UxHANz4FBDjKpuSBUbY8bWwkqt9dyFeP3I7JGXHG6J1UwUZ99mkJQ1HfhOhHu3PFhxeMwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtbMAuPz3GcAFIw6q1rggmwJAupY8zBY/m4g4Vm6C1o=;
 b=k4X50IXNGKjOa5qrQbuVDoQxO0IGFuVNfqS8Dhk959dJLegJ3xD2LD01AbKR7mSswBLW/Gj4AHNQY0dqSWQWQFstTRqZ51q74STRohtcf2I86hU0H6b0oLeajwjP9io5sVQlP6Z7HgXEIRbM0BUHGBaZnb1oqXVr1eNE0JIvFT1gc4NE88VE21OOUwe3q9TyXsLh8mWeEMqmXMJHMJi4qDHwdwZN9mmc31KI9mjVyM5ttwa3YaFml8UNRqjBm6uFeLb1W0taZSapsvGAjVLIaXM8esyM/auP3x6THQiVcLGHhPT+oQTWg0y1DhC0kuzfcDfv8/RHKKP74QKpVA92eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtbMAuPz3GcAFIw6q1rggmwJAupY8zBY/m4g4Vm6C1o=;
 b=mjcmuqQvYaX2YUtVdovFdq7funL5xI6GJQmTCXPumcPmmz8EJSIESxMQ0Nz4Y0mSRJ5oBRMV0ICLkEqT7Ok2fpSlAQM5m1mfwWhhrxCrav519oCHRIEcnfw9PSiiKrwRmj/tjF2Pn5vEeUADs5ts+38RMICNexzqRGrPw4AW4Q9OC7x+7+XFFFks0PeQ7EjycaoFyrZ8f7gw0e0Bt7Fr6GiGEPp5+Z+4wsVnvO8jtLm4qi9LFXFGTsdxvbLE6FlHGta3xNgk9zvUSermspFSGef6ZweWXd5iR6pl7+ICnc9vGHkOX2cr8CIH/K0Dm/PrAR93lanSg9AUeF1CpCwKEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <425203a1-cf8e-436d-9c24-2fa76b2a87c0@epam.com>
Date: Fri, 3 Oct 2025 11:26:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: XEN_DOMCTL_get_address_size hypercall support
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com>
 <bf042eea-ed2d-431e-b1f0-7be0c09194ef@citrix.com>
 <f3e662d1-7626-49f3-a673-e3cfd8d7944d@epam.com>
 <e091f7d3-14f3-40d1-a943-4758a52db71b@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <e091f7d3-14f3-40d1-a943-4758a52db71b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To GV2PR03MB10998.eurprd03.prod.outlook.com
 (2603:10a6:150:27b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR03MB10998:EE_|DB9PR03MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: b9df7062-0f82-471f-3ae4-08de025ef102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHJEdDdQMkRBUDZVUS9XWC9RMDU1Q3NaWkhLcDFOZVp2N201bFBEcGlOY3Fx?=
 =?utf-8?B?WC9waWRXVGRnTEoraHRsZi9sMmdHU2t5SUhLT205Q0RQOFJlQWJERWZXbEkr?=
 =?utf-8?B?VG5yVC95SWtYbHh3c1dTTmgzdFpYeFFhcFhPZ3B4bWk1ZnlVdXljNGw4dFpk?=
 =?utf-8?B?QkdTbnRMN3ZqaE9YeFd1TnczODlHNEJrTGQ2R0VWN0N3YkZrblpUSjROSzFx?=
 =?utf-8?B?T3pnbXU5Nm1mVU5lR1BONjVjNEloby9KdlZwSUNvbU5ydlRLaDIrVmlYZk9J?=
 =?utf-8?B?TUdaNlFtSjlQVnZDNXgxMlpzOWZ5MjZxaHdmSnBFQXR5Sk1NV1hnS3Z6SkNR?=
 =?utf-8?B?bTM5QWdGSkhRbjdzNG0xenlsLzJoYnhSWmI0RVd0MENQZHFaVVVjNDVLYzF6?=
 =?utf-8?B?ZmxUalU0QkZnR2ZBRXdnNytxeTRwbEhmbUVMSzduU2RKKzJFL2FzYTlxbTYx?=
 =?utf-8?B?MkZDNlBkRFJjdGRZelp0ZnJyTzRaZWNhUTcrOHVpckRHc0IvTnpPRGdpZHhC?=
 =?utf-8?B?ZllvUFZFTElFUEdsU0NWa20rR3A2VFRRdkN0QXkvUFVYVmlSUG5YRTQxcGYx?=
 =?utf-8?B?VFFhalV0SmdaTVZwUnU4aFdxc1BPSmw2OVlWb3laaGlEOWQ4MWF4aG5MVkIv?=
 =?utf-8?B?Yy9oWDZEVVA1ZS9mcVJnTThhRXVTZk5aVUd3NElBT0NHTTM0ZFlqbEpOdWJh?=
 =?utf-8?B?THJDbzBIQ1puYmp3TzlOTE5Cby9ZYUhaNE52d0hiRzJKaUtqSkhIZW1tc2VX?=
 =?utf-8?B?MW5rNEN5RGdTbnM5bnFMNjhBNmk0V3d1Wlg2T0NObDBnaTJvbk5FR0ZoTmg4?=
 =?utf-8?B?N2pRRHN3NjhIc1hWU1pkUi9VbjZqUFNvL0prWkFaNXdmTHZEZ3p0TG94em5m?=
 =?utf-8?B?MWVVcHA5ZGFhV2JBZkVnYzNsWnFmNnY2VWtLMkJwV2RSbXZUZVptL014K0FL?=
 =?utf-8?B?NDNhTngwVCtFZ2tpR0w2bG1KL29jaDdHSTdwWFhubzJqWWE5V0FudXRNclR0?=
 =?utf-8?B?WHdUS1B5cG9MN1NmTmRHUG82Rng2c2g5SVZhTVhDUkZRMGdvU3BGSStjakcx?=
 =?utf-8?B?N0dPcE0vYUZncDhFdlZJenVpa2JaVUwzREZ4K3FHeEMzWDNOYVhQUkJ3ZmMr?=
 =?utf-8?B?V0FmeWdzVVFEWSt0VnJySW9XRjR5ZFYwRHQwMFBqd3hFdnlZT2hMaFRsSFhm?=
 =?utf-8?B?VjFiSGE5R0FZeEs5b0J2aFZHdXU4WU9VUE1ScGc1VVRPbGFUTjRTY002aGZT?=
 =?utf-8?B?eUNQWnJvMkpCVktGMXNwZWh5Smk1WHpPNDdaMFJsclZObm8xMEtDWkt6cTh4?=
 =?utf-8?B?MnZmbkJGUXVjVHpkNUY2VnRqN2JISUNoVjJsa3E4SC9SK0pzdlh6NnA3K09z?=
 =?utf-8?B?OTZ0K0d5YUlsNnkxazJvVWVnOENPYXZIMEVpQ3NwKzhrOXFJSUdkOTZkUGlD?=
 =?utf-8?B?VjVnYUprWUh3bTI5WUVTNDBOejl5cmZNV0JMV3l0YzRHQjQ5TWVPNTRWR0Z0?=
 =?utf-8?B?NUZLOEFtTFFZS1diVWdoSyswbWVTcG5qTnJXc0pRL1o5UHZEdW5uODUyN21W?=
 =?utf-8?B?ZGYxK2c2NmlvNTZVY2dzTTRyMytveWIxMDJHMHNFUXZrb2dWZjA2VldNS0Iy?=
 =?utf-8?B?UU9WendhZEVYbytab2NRUU1iRkhtS1JRNUVubjgra0JHL1I2ckVMUk1saUxw?=
 =?utf-8?B?a3Bab3RJNjBLSVhyR3Q4MTI1VzRBNGt5dzcxWUw1OXcyK2JrRlVHUjdRQkpI?=
 =?utf-8?B?blhIYVZoRWJJT29ZUnduTHQ4UUFrMjVoeEh4UDN0MFNuTzBobzVKZEVnOWxm?=
 =?utf-8?B?dTgxaC9EeEs3SmxlbXRkd3FXVWhsd2o4TFNYNjRiR3hnY2MyT3p1Y2lSUVc3?=
 =?utf-8?B?bjFxSjE2NWJLTlo4ci8yNTR5bU5iZGhTUys5UHlydklZYXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB10998.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1lwbW9oZGQ3L0pTWlFxL1NFNFJPRHpPZm5XTi9lQjYwTWdJbkJuUmxBK2dj?=
 =?utf-8?B?eFJTdnZMdnFWQ1hrTFAxM01UdGxheDNYbjk2d1BnVS9aR0xFQlFkdUxMcHZY?=
 =?utf-8?B?cStHa3pOR1F6aGRRV050WHBaWDM0ZWxnY0hnbGcyNktqVndQdllyRFNFUFlo?=
 =?utf-8?B?U1FhZzFxMHhRYmFmcnVPVElpV0NmU3ErMm5JOVRQY2FqcU5waU00MmtrdHFz?=
 =?utf-8?B?OEVYTUtGa3puR2wyRXhZaTBoR1hTcjRZMDJnUGkwd1JnemdIMEVwQS9MSFE5?=
 =?utf-8?B?NURSaTlaeHZkQlVNTUFNMzJzdlVMVVhtWlJNSG55dk9LWkF6UUVRNmVBZ0d6?=
 =?utf-8?B?VTZYSjkzZEwxNkM5ZFRUNXFJN2VyTjdRZWZXa2UyNmxtRGh1SEw1R3c5Um5S?=
 =?utf-8?B?RHNkZWJpZHl3cWhhY2I3ODB4eHdBb0hUNmRlYWVsUit4dERsMys1bXcza1hU?=
 =?utf-8?B?THB5QjFEVHZXWXNUdEd4blBGUXY4NUJOMTF6TXRDK2d3aFB0OGRxQ2RHSmt1?=
 =?utf-8?B?am5LRFJhQkNPRTc5WUJVV1FSOVNpTDlMNGdoTElYaktNeU1CdUtrRzJvNm5U?=
 =?utf-8?B?Q2Nva0tFVThzWEEweEgxbHR3UmlUaWhUSm1Kb2UwSk9UMlJNdElMQ3lSaG1k?=
 =?utf-8?B?Ukh5djBIWUIvQ0dhcTZpTHMrbmVjT1RyY3VKY0x0VnBpYWpJNUZaTTBOQjVZ?=
 =?utf-8?B?cTczSk02V0UvME9FOVNKelRZeWk0NUpRckx0TEpCV3YvMHBQKzFKT1R5Mkds?=
 =?utf-8?B?NnA3YUhwVkRHcGl1clJmc2JKeEpsanJLaG0zaytsdVNiODE0OXloOVJGWlhl?=
 =?utf-8?B?dEprVU80emVMVElYWUdMSkkxZnY2Mk9tYVNSTnkwQmk2TkdxOE05cFlBZStn?=
 =?utf-8?B?eWJkNWVyUUZpM1dWbDJGaSt0N25STllBN05vajZ4cGZEc096MWNjY0ZYTGR6?=
 =?utf-8?B?UDRIWFprUjBuNTY0dDB4UVFBcXA0RUxRSG5DZ1dHMlVlZHZTaXlnV3UzVzE1?=
 =?utf-8?B?cEhDMCt6SmFYcDBWeHhxeWZsZENnekVESEZFRHJ2OUl0QWprSEdtU1RqUlpX?=
 =?utf-8?B?TjBPbWxmYysxbnhaN3YxREJ0NkEwRFpWdFQ0dUNWT1FpbVJ1SWptaEJwZmtD?=
 =?utf-8?B?YlVxMlFVV0NqWFNyT1QvMGRDMnJRaEtIdnBZWEZvQlZQV2VSTCsrbFRwTXdh?=
 =?utf-8?B?OEk3T05ZR3ZFczZzR21sOTVvWi91aVB6S2txRVk2NmlDdXBSTW1VQ0hhNDM5?=
 =?utf-8?B?cERaTnJ4cFg5Rk14TnZTYTFhQjZ0elgyWkZPczhPLzFBdUZROXlNZWZTU2VR?=
 =?utf-8?B?TU9sRkFyMW5UWTRHSEZSWXJsdGdKZnE5US8zbk9TRHlnQjd4aEJjeFlPTlp5?=
 =?utf-8?B?a2VrN3hmYzJVcGxQZ3pLc0s2U3BZNm5tZmErQ2dwVVJXV3kwNnRwL2MydGQ4?=
 =?utf-8?B?c3RUc3lqS284anE4S0RaaDRsQUJxQ2ZDS1BLaHBRSzcyK0N4KzYvalpMdk15?=
 =?utf-8?B?UHRKZm5YUlZETTVTMkRUOUJaOGJBK3A4T0R5STNCRmJjdGhCenAxanBkZktH?=
 =?utf-8?B?MGx6M1p6a0k4V2cxNjRRRGZyTmdIbzJxcVpqa2VMUlNmUGFqTGRURTFRM1Uv?=
 =?utf-8?B?SXFxYWw3UGxHc3RRWnRrYWNGYW5hVVk3eFFJQ2VJeTNleWlyUWYwb3BsRXpu?=
 =?utf-8?B?Z0lzaHdaekZLSXFFVUVTK0RwZEdra3BNVm5HWFUyWGJZQncyQkNyaUw5S2VW?=
 =?utf-8?B?UkNlVktDTFRuWC9uem5RYzMzRE9BWERVS3NIVHR3NG9OUitDZUpYc01Pd2Y1?=
 =?utf-8?B?S1RWR1RmUnBmY1F0MVJ4MU16azJXWVFuYWt3ZzFPbG52MHAwQTFwdTl6ZlYr?=
 =?utf-8?B?d3lNWnNSSjlRQkJNU1BvSDlQSkk1bG44a045azFLaEpIdWpJTDVtTUxYblQz?=
 =?utf-8?B?bVFBZ3ZYOTdZZnB2T0Z3SytiM29NZjEzYjJVbGlGeURuM1oybFF4ZEk3WEk3?=
 =?utf-8?B?aU1mRlFPdHkrcU9KQm1ZL2gxQkVnMlpTcUEyRGJ1VWFKOXlrMGhEblFSN1pV?=
 =?utf-8?B?S3o3aWtIbzdFQXF0YWxBWlpsbWVreXhXWGVFeStUSmRkMytGNzI2ZUxQbGlW?=
 =?utf-8?Q?PGrdgGm1kcp6DfBSrdsiejouW?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9df7062-0f82-471f-3ae4-08de025ef102
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB10998.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 09:26:32.9187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0HF1ui/56fnDTea3cn6Ra4YgibOkoQx0s1yPR8XdHi7MCfC9x5N6FhTVM1//zNw3LvRWP/Pp/x4fJ0ySNrRaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7385

Hi Julien,

On 10/2/25 14:43, Julien Grall wrote:
> Hi,
> 
> On 02/10/2025 12:10, Milan Djokic wrote:
>> Hello Andrew,
>>
>> On 10/2/25 12:10, Andrew Cooper wrote:
>>> On 01/10/2025 9:01 pm, Milan Djokic wrote:
>>>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>>>>
>>>> ---
>>>> XEN_DOMCTL_get_address_size hypercall is not implemented for arm
>>>> (only for x86)
>>>> It would be useful to have this hypercall supported for arm64, in
>>>> order to get
>>>> current guest addressing mode and also to verify that
>>>> XEN_DOMCTL_set_address_size
>>>> performs switch to target addressing mode (instead of relying on its
>>>> returned error code only).
>>>
>>> Please don't copy this misfeature of x86 PV guests into ARM.
>>>
>>> Letting domains be of variable bitness after domain create leads to a
>>> whole lot of bugs, many security relevant.
>>>
>>> 32bit vs 64bit should be an input to domain_create(), not something that
>>> is edited after the domain has been constructed.
>>>
>>
>> Yes, the idea behind this patch is not to introduce variable bitness,
>> just to have the ability to get current addressing mode through
>> hypercall. In our case, we have used it only in domain creation path
>> (after domain_create(), to verify that target addressing mode is set).
>> Of course, whether this hypercall support would be useful in mainline is
>> open for discussion.
> 
> We already have a series under review [1] that follow what Andrew is
> suggesting. I would rather focus on getting it committed rather than
> trying to workaround it.
> 
Thank you for clarification. In that case, I will abandon this patch.
You are referring to path series from Grygorii [1]? This means that 
XEN_DOMCTL_set_address_size hypercall will be removed and its function 
integrated as part of domain_create() and XEN_DOMCTL_createdomain (for 
toolstack) hypercall?

>>
>>>> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
>>>> index 8720d126c9..f227309e06 100644
>>>> --- a/xen/arch/arm/arm64/domctl.c
>>>> +++ b/xen/arch/arm/arm64/domctl.c
>>>> @@ -33,6 +34,37 @@ static long switch_mode(struct domain *d, enum
>>>> domain_type type)
>>>>        return 0;
>>>>    }
>>>> +static long get_address_size(struct domain *d, uint32_t *address_size)
>>>> +{
>>>> +    long rc = 0;
>>>> +    struct vcpu *v;
>>>> +    /* Check invalid arguments */
>>>> +    if ( d == NULL || address_size == NULL) {
>>>> +        rc = -EINVAL;
>>>> +    }
>>>> +    /* Domain structure type field and actual vcpu mode must be
>>>> aligned */
>>>> +    if(rc == 0) {
>>>> +        for_each_vcpu(d, v) {
>>>> +            if(vcpu_get_mode(v) != d->arch.type) {
>>>> +                rc = -EFAULT;
>>>> +            }
>>>> +        }
>>>
>>> This is deeply suspicious.
>>>
>>> Under what circumstances can the vCPU setting be different from the
>>> domain setting?
>>>
>>
>> It should never happen, this is more of a sanity check. Alternative
>> would be to use only one of vCPU or domain settings, checking against
>> both seemed more complete to me.
> 
> This would be a logical error in Xen rather than something that could be
> triggered by the toolstack. I feel it could mislead people using release
> build because the fault is not due to the input provided.
> 
> Cheers,
>
[1] 
https://patchwork.kernel.org/project/xen-devel/cover/20250911082034.1326377-1-grygorii_strashko@epam.com/

BR,
Milan


