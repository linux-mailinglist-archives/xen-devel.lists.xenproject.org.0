Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE348AA8D71
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 09:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975866.1363165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBqd5-0008PU-Ou; Mon, 05 May 2025 07:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975866.1363165; Mon, 05 May 2025 07:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBqd5-0008MM-LP; Mon, 05 May 2025 07:52:47 +0000
Received: by outflank-mailman (input) for mailman id 975866;
 Mon, 05 May 2025 07:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAKQ=XV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uBqd4-0008MG-79
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 07:52:46 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:200a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed257135-2985-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 09:52:45 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 07:52:40 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 07:52:40 +0000
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
X-Inumbo-ID: ed257135-2985-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Orcl7anhJ6iQERiDkRanvRT4o251YaJjrtbISMJBPAFD1Vuwnjty+DkR6Yv/vNxMLXbW1P/lvMoU+wKCY4lkx8z2bxeicpO4XakkHfgpOhdLA1OXScPQxXCfVx8wIPbJswEjtNJEigvIiXnl0lZguXkdCV9QGw2nfYiJ9mgUC88nzU/biVdqiyMeV33Je6xyLot02FE0NzWWdTmbCJmFRTHPF6ue2j+hrGldxdF/paBBbJXoMc0DA6Svz4ezBIRTcjF0LES1oTaggEhEmjm3jcwTPjWtoqHU7yoKqrTLSTcuqk+FKOJl2ED4MHqN7lefkZa+zhrAqSfAVkEyB8dOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qmRJpmiC86jBahLrJ4W7DAKBIe2WvtZHlOzi0dqJOw=;
 b=Z7MrPl0xapcJFxKLc3huL1fevzN77dqV0RgL3yiTQNKQSLCmAiFa31+v/jIr2+FUkoXtZ9/JtQgPSPuPkoW9mum9bmRkuA/gER+y+r8dwePjpzzkOyM4w8sk49r3QP4hCBdINtMQMCQQsC+R68ybllrOJeS6SaRMme5oJU85WFOaYN+SI1373cNPrVLO8QYXVL39nxLcEW17c06H2n1iyjjBUkkY+Zr+oA5oZIjqoiXotmj1Y1D8jXNXoSmO64HMFwXthKIBmI48Po7LZYkdAeIteFuWeiPi3L3ypvSX8hCfl8iPj46+JzMGPnB/oGIb5ZdvRtOD4F/vOEvZsvVjGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qmRJpmiC86jBahLrJ4W7DAKBIe2WvtZHlOzi0dqJOw=;
 b=T8DcpODyLXzBckuOTJTt8PrxmvDcUwzORtXQk/pLiVmlZV8rJaGNoEQ4bGUAkBVDPl9CqpterjcU+pmtHfAtYwqHOk8SbtM5SKXby5dTP5l3NLPa4P/YX74JVc0ddnQFlhPfuRC/WTmwz0+fB896TPPGJNJA51MTFYpFhUSHX0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f1fd915f-be80-4e89-8f75-aab3f79615ea@amd.com>
Date: Mon, 5 May 2025 09:52:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/arm: fix math in add_ext_regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
 <20250505025631.207529-2-stewart.hildebrand@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250505025631.207529-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e82653-8f5e-4130-014e-08dd8ba9cf44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmVZWEFRMkkwaloxT2J2ZXpqZDVsYzVqSGladFR3WXlibWNzeDV0UHI3Zk9m?=
 =?utf-8?B?V25QcjZ6Z2FlWUJYRnZ2d1RtUG15WWw5VVJFQU94bXcrQTZvRmFaRGw0aHEx?=
 =?utf-8?B?WlRYV2dQS3NEb0Z2dklRZ3BVejdvaGU4MTBtTnlJSldsbE9MSlNkc3FobjU1?=
 =?utf-8?B?TnA0QllUR3E5TlRuOHEyYThMeEcwMW4raHVFc05zTFl1L3FFbzJGbFVubXBw?=
 =?utf-8?B?azJsNjUySXYzcU5tdDJHUUQzT0lxQVRpbTVzUkhQK0l3dENyUWFtSHAzV0Nv?=
 =?utf-8?B?QTI1eStkN3l2Rlg1SFpxM3JxZlBhVmtBdVFMeHdNZ0VFRGk4a21mSUVIRFp1?=
 =?utf-8?B?QWVhVTYrQk1yT21qc040c3YvWmdwMFhnSk1mZHYvT0hTNUprZ0hqQ2l0YmVQ?=
 =?utf-8?B?REtQMVJ4ZWVua2J3RklDcjNhMjJTYmFzNUFUUElTZGIwVm9URG9JVDg4eDAz?=
 =?utf-8?B?YzBhUzlCU20rVlUvejlDaTIrMERWUnpKcDRGR1JUVExYSDlVTzFPQUNQc1d4?=
 =?utf-8?B?aENxSjVzSXNDZW5DaTN6OXdnT203Y1YrQjJvV2RDNytBR2hiekN2SVpuTnVJ?=
 =?utf-8?B?cVhNZkJkK3lrSGRMQm1xZGE3SXZPK2E1Rlo5Vkg4RTNtWnJkQUpLQytYQTZh?=
 =?utf-8?B?ekQzVnVQV0YxN2tpcXM5R3Y1Yy9SVkE2YUxtMVJQaHRmT2t1VmNXRmVLM1FH?=
 =?utf-8?B?T0FJL2JWSUJpN2ZLTWYyQ01STEFtQXhTZ3FUNUJRYkhLcE9DZElaRnpVcTh6?=
 =?utf-8?B?cFlHSEU4V214b21mV3hJVGhmUzZmM0d3Nmh2MlZFUkxIQ3VSdnYyUmE3OWc4?=
 =?utf-8?B?UDNuczY5eTU4bkJsNHhpSXlEUmZ1dHd2akNTRlNCUUlVS3pXWnNXZ2liUW9L?=
 =?utf-8?B?di9KbGl2UkpDd1dMeDVmK2FSMFRUQlJ2dGQvQUJvelBzdkJGSTVVSk1TM2pW?=
 =?utf-8?B?RWRrQVdvVFp6cGVUaEw2OFlhL2k0MDdlL05MZUNHRVRIM2lzRVo1bWUvSVdw?=
 =?utf-8?B?bDVnMnpDckxsbnU1Skcvb1V4VU8wYTBuNmJiWlJWRzB3bDVjZlN0ZVhjcS9F?=
 =?utf-8?B?NlJIR3d4Tzg5REFaZ0p3ekdHdnZheWt4MUREVlRadkY1TEpIaVlVelBxRHdV?=
 =?utf-8?B?endJUldLN2M5a1hEdWZabjVudXZsVWV3cTNINktOY29naW5abWR0RVNlMkEw?=
 =?utf-8?B?eGVVWGtZbjNaeXJZTWM4RmUyVG9nSStna3FCOHNYdTIzLytDOEc2RDJJV0Ry?=
 =?utf-8?B?dko3UHNtWnUrVEMvMVlsdFVFRXdVVTJKZzRmMFBkMHlwNlFleG13YXR6VFgz?=
 =?utf-8?B?bTNwLzNTdjVqejBhSFRiMDRqbjNXb0t0QlVPVERVZWpUVWkvbzlJN2p0dk5D?=
 =?utf-8?B?bjFoT3hOQ1VuSjJpNExkWnhoM1ZTS0UzRzF2QjZmTWR1YjdhMXJNQWp0dFdE?=
 =?utf-8?B?d1N2ci9GeVZZWHFlTEFUSW5VR1dMT3dkOFE5Y3JiaFVRWlc4d3hHRkJUMXA0?=
 =?utf-8?B?SGxLMTlNSlg5ZnRSKzVJZFRhNjM5V0NJQzZnb1BCaC9aUEF2anh2K0FIYWV5?=
 =?utf-8?B?UXovdTFRQlJ4VVFxMTRuSmlXZldFQUhPY1JJQ3NNUWIxbHdXNHRkM29GSmFP?=
 =?utf-8?B?Uk1lTG9VdG5nYkwvTHp1SWhCUE91cm1sTDBXd2tVUHNVTTdlU1gzY2cvK20x?=
 =?utf-8?B?clJvazJPRXB5VlNNR3dWbVhSa3ZrRkxVS1NYNzFtdnF3VmZ2Qk5zRkNkN2pC?=
 =?utf-8?B?L1psVGJVOExNWFEwZVBwZE95L0tGdFRlWjgvSjloK0U0dUtHWDlQNmpQbnB5?=
 =?utf-8?B?OGh2cUllWHZWS2NzZ2lvcWJTbndkNVUxUFAyelZMUkloOXh5Y2dKOS9xaHJa?=
 =?utf-8?B?dnNhRlF1djR3dU43MGl3Zy9mSUZLK1IwOU83MXo2d0Y4ai9Mb2ZaMytpbzdo?=
 =?utf-8?Q?jF0AMKmC0ps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0JEdlFSak52eGFxV0tQWEF0amtLWUlDMUtwMDdNRVdXZ3pwRkNwbDhiM0Yx?=
 =?utf-8?B?d1c2Mi84MWhpNzlXcDV4ellrWTZCMDR2V0dKZnhVTzJGTFhpOXpwRVlCbzVk?=
 =?utf-8?B?Ny9pUkY2RGZaZ05rUkdsdTZjc1V0NDNuVjBoU1ptSFZEZ0dpNGJybDh3Z3Fk?=
 =?utf-8?B?dTJ5Y3NpRFNVZXZmelRPTE5xVWdBOXZWZGJzL2wySVAvajNKTUJKbXF2cDhm?=
 =?utf-8?B?OW9jTmhXMkdzQ3dnR2xCcVIvWDNOR2phbVVvU1lVU2IwSjhldll4bjVSclhH?=
 =?utf-8?B?dEZvRzkwNjdEVThyL2hETXlpSlZvdldqMDZJWm1uU252WTZPVHN5NVRyRlFy?=
 =?utf-8?B?dk5iaS9ZSzVwMko5L0twd3RaT21PN28yQTl4anJ3dUNqYVUwUEF0eHFkblll?=
 =?utf-8?B?VURRdW9zcHIxZ0pacXhqUWYwSHlyalRYcEhZdUpXeUVtbXFLVkVjVHVJWGpR?=
 =?utf-8?B?a3d4RERRcFY2NzZGcUtXNGdaRFk4VDVTZDNhU05RZlZJR04vK1o3b08vcFBH?=
 =?utf-8?B?OTNwdHpPck1iNy9vTzIxRFBiZzhTWnZ1OC9MRndDd2dyNU03cEZyU3k4SDVZ?=
 =?utf-8?B?NEh6Yy9qbnZGbXdCa2NsQVlGbmw3djVIYml3dFZQY3hXUmNOYkxsVFlua2I0?=
 =?utf-8?B?U2I3WmFrSnh1UGN1MWJMdkxTbnJIWTg3UHgxYzh1Q2xsSW5PTFV0UXRxeURz?=
 =?utf-8?B?L0ZtMWxVTDNMMUJnek5mWStuRGo4d3Jla0taUHVzY1lTaGlhZzBQUWNNNDdD?=
 =?utf-8?B?ZVVhYXRrWnJDNDNRS1JNV3h0eVdQaDhNQ0JPRk0rTWxkVFE4a0dPOW8vN1hm?=
 =?utf-8?B?bFQrUFNZL2dvbzh3S0sxVElsUjU5RmQ0YzdaUWQyS3BncDAxK2NjdnZmWjRK?=
 =?utf-8?B?aU9ZMFkyQTJmTVN5RDlocEQybXVvYit5SFR3UVVxdFpBb0tkNUFhVml2R2hG?=
 =?utf-8?B?ZmkyV1JjMEY2ai8yMGI2c3B6RWk5Qmw3bGgrTzJpc3daek5DbWVka2Fwd2p4?=
 =?utf-8?B?bXU2UVZHcVQvbFhiQWt3NWl6S01BZnhoZDB1ME9pd0s0RDF1V2gvMVNYTnJG?=
 =?utf-8?B?MFh1ZTFQU1h5UnA3dXV0U21hNzVhZTYyWkpldWEvYnFwRldUaWNUOGRyb0V6?=
 =?utf-8?B?MGUrV1h2ZDBRQUo0V0E1VUhqdVhEamVsZjU4NGtFQXMrZWRIK1hxcVJBV0pL?=
 =?utf-8?B?emZiRG5LdDVYRU1Pc2pyYU1mb0ZzZ1lweCs1SWJNMzYwb1hWWXlYVEdlUndG?=
 =?utf-8?B?OFJvTmVsOGRvWkM5LzNRMDlXWEhVN0VPdWJ3bzFIWGxCZ3dtVkJPY1NCQXUw?=
 =?utf-8?B?QXVucFZTNjJHeVY4VU1sWlJmR1V0V1FmUmtrNHptYzMyY1B4dW5xcDIwelk0?=
 =?utf-8?B?YlNpSEpDM3BtZ1BlaGVqZ0FrajZJRmoza2EzaCt1ckNCSDRXMng5R0NzZFRh?=
 =?utf-8?B?KzFYTi9WTzduVkVaM0RVT04ydHY3Z3JaR2xDWVVqTHQ4Zk54MS9McjNidEM3?=
 =?utf-8?B?VE9Td2swUThkc1ZDRDFPT0FnUFNJUEVzZDJCbENiNFlBWXhpN1NaN2s4eXdz?=
 =?utf-8?B?d1JySThPQXRrd1BOa2dhT1cwVWJjZ1FNVjZMcU1ubnA5Wm55em9WNnRuanlx?=
 =?utf-8?B?UUlKRWU1YWxDaVVDZ0t5U1JnL3NhSGlkYXRsT1ZqUWo3K0xKeTBXVUpBZ3RX?=
 =?utf-8?B?N003NzZya3NWdU16Zm5DL1lPdS9NWE95MHQrb1BpdHI0Rk1iMEVmRGRSclZT?=
 =?utf-8?B?bVF2a0kyMUVzMndBODNGNXNVSFBFM0QwNklmcVdOOXRkYXlsS1A2L2lYQzdu?=
 =?utf-8?B?N0ZkUGhOUE00L3IxOFQ0emd2MXVXQ0t0RkN4YUEraFNTYS9MdmUvU090ZFpD?=
 =?utf-8?B?RUVBelp0NlpKMUxzVWl6emlVbnBrZU9VT1lORW4wYWpLbHlIcm8wNjl2VmNp?=
 =?utf-8?B?aW54NVkwV2FISDlhK2pUcTdMZXA3V3FTSzNZeFNoU0IrR25LUkM4cmZJL1M3?=
 =?utf-8?B?L0RpNnpTdGRjMlRnNG80ODZWYUZPRDRyOStBamVyb1ZubThGZ3pCTFExN3dO?=
 =?utf-8?B?L3R3SDNuMVB3d1pJc1FSYU1oNy9IMmlrdVkzS0gwMnRhMjZ6RTE1ZVJCMlp0?=
 =?utf-8?Q?czLY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e82653-8f5e-4130-014e-08dd8ba9cf44
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 07:52:40.1180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djkvxHhtda4kDZl4Hgs7rRTKU6aeScDUU4GUYGdPwW3OwwVjIkYHw6NB1jVaFp0q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346



On 05/05/2025 04:56, Stewart Hildebrand wrote:
> In commit f37a59813979, the arguments to add_ext_regions() were switched
> from addresses to frame numbers. add_ext_regions() converts the frame
> numbers back to addresses, but the end address (e) is rounded down to
> page size alignment. The logic to calculate the size assumes e points to
> the last address, not page, effectively leading to the region size being
> erroneously calculated to be 2M smaller than the actual size of the
> region.
> 
> Fix by adding 1 to the frame number before converting back to address.
> 
> Fixes: f37a59813979 ("xen/arm: domain_build: Track unallocated pages using the frame number")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


