Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D701B0EFA1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 12:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053724.1422518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWZx-0005Lu-G2; Wed, 23 Jul 2025 10:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053724.1422518; Wed, 23 Jul 2025 10:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWZx-0005Iw-D9; Wed, 23 Jul 2025 10:20:05 +0000
Received: by outflank-mailman (input) for mailman id 1053724;
 Wed, 23 Jul 2025 10:20:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueWZv-0004xI-Mb
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 10:20:03 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97c687b6-67ae-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 12:20:02 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU5PR03MB10472.eurprd03.prod.outlook.com (2603:10a6:10:526::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 10:19:59 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 10:19:59 +0000
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
X-Inumbo-ID: 97c687b6-67ae-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFOVCLC9bz8uKBw3Fh1wCk/0slkGsKW6O5Cx6isX9qAf+Wk94Pc1hsQkFmiP7y2pBs2WRGQLaw9pUVsAv8lx263s9m9bDo9pWXcuqqhwZUYa65C1NPLA9rYHzgn2DK8efnjzV2MWa+uoCxZU85EHGAAGjcO4qiSoEsOrLUn+H6mext33hQTorRVx5S+ykVLCuQufA19OZfJYtTrqh0FeJ9EQrE/MZRI85j66Tizomn0RYAYGtC9OYQ8p4MAGZ4Se9kvTvzLrxON87shDreSxIhLLSU32PcfBjLq4vbmasExNzRWMTfRB/1GUonyIjWwKinnrSyLSW9D5zZz2vTDs7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIGStQRv9cDlBF1dYUJXuc4zRpiQW+dkMsKVkvEbGrk=;
 b=ImPSg61hDYl3FgrDidgMdmTOswCmivmXXNuP1CDCYsOAE+BbB6UI6vigJiKlG5zJ+5RdjQuWFdQCn8E+0xKlYJte67ua99FrTLKrG0m9J8W5mmzb/qIrfLpMtWvYr7TvXfhX9ullpAWtCKB8RBx6RROz4yNbD4jx8JHkB4nVtLKypkxz6ZFexqHZ+anlkf0G8U6ylu83oDr9SKiwOMViIsWryn0vwPxdCjXmP9QNvbFdNztGMOQlIofn/4Ezfu2H5vAM8XMpMlf8/qiT81xy7gYWRYm7i8RCKncatwFI8jfHT4HZHcYb5YkrtiNOoGby9jCObfGOGBOHYVzbyBk3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIGStQRv9cDlBF1dYUJXuc4zRpiQW+dkMsKVkvEbGrk=;
 b=sAyf7DMdEVnqKyrA2jqUuDVmG4xch/lWuYfcLucq9ec5hfJkUxw1EBgAvheK2CVceTYrYTlwLyjzx7fcMypGqEdH8yM3GzgjvQD85NrpvaT29g5Yuk0US7Ak9UjiN09FUTGmBcsH+x4SJoTMHQwopzvCRAiGTs/X1uQvI63YcOLW9OqqNeU4Kr+cQYkj0QxSeBxJZ3xLTAXB1/CSMWC2iWM1zUpX0Adr5HPMbOJDqoxqTO4YQZneviz1g7l3Y+RdgRK2pHCjQzjq+iJ5VIlqYN8F2ISAZN4g+/kgxLjtF0bDuUJwFy4rRN9RUQAHyrYkwK7aSelXjOpxPFzc1W63SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <fdf7d2b9-aca9-4392-8e4d-a7fc8ce036f2@epam.com>
Date: Wed, 23 Jul 2025 13:19:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arch_vcpu_create()
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <20250723075835.3993182-3-grygorii_strashko@epam.com>
 <99c88af9-7f89-4d7c-9827-1ba85c803195@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <99c88af9-7f89-4d7c-9827-1ba85c803195@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU5PR03MB10472:EE_
X-MS-Office365-Filtering-Correlation-Id: e15e702f-7527-46e7-6e37-08ddc9d27a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWxSQ3hocnZXOVAxMFNHREp1b08yVERJZFlDYWxtallMSndsSHh5R3dockk0?=
 =?utf-8?B?NmNRcTkzblljUng1S1RJSDhzWFlERjh5RExWbStNVSswZ0lvcVM3b2kyY1g3?=
 =?utf-8?B?eXhqYmwxalp0Q2puOEZYV253TlRGMEhzT2xLc0RBQi9vcGowUE8rUUFvMHVi?=
 =?utf-8?B?Z3ZjblNTMmdSeGtzOFlQQlBVSGVhcEEwMG1KajhBajZJZ2ZCdHFRKzZnc1JB?=
 =?utf-8?B?MFlWOEtDMGVaUzNKcTFPWmtjUkl1dzNtV01rU2J2eFZ1bHBCTnFZTzFLN0xp?=
 =?utf-8?B?U1JGdTN1L05Db3BPMUVHcDd4dCtyQXk3MTBiNjR3a0xiT1ExeGZjZVB5ZFFx?=
 =?utf-8?B?bUxGcnpqODY3VkhyOEJ2VGo1bDBkU1J6bGRUZldxVk52Um5uS2hRbjh4S2V5?=
 =?utf-8?B?STRqc0tyYmF5T3pJbHczUHJFWUVTemVIOFRnbTR6SFZGbUFLaEJYYnNhZUht?=
 =?utf-8?B?enp4WkxRbkdCcDFJeWhkNThmSGlWZHNsNEZLYVV3TjBzdjBJYkp0UmY0UTY0?=
 =?utf-8?B?dHVuQko3WDk0T3d4MDY0aHhjSE1JMmxEaEVZOFpCWXFFZ3l6WkkySjZOd05P?=
 =?utf-8?B?YURJYys3cFBGY2JYOE9Vck0rUVpZR2dsZzA3WDdpalNNZlh3cnJCOTdTQ2NN?=
 =?utf-8?B?TDZraDFDYnpLVnI0T1RpTEhmekRaYkhOVzEzbVZmQm5Zbkkwd25VZ1JveEpB?=
 =?utf-8?B?ZG01ODJsQXB6MW9yOXYrbTdaYWpnakhEdFRZNGgzdkM2eERKV05SQ3RSRXMr?=
 =?utf-8?B?ajFYSFI5Vlk0c2kvWUdjcEtDTUVWRlNYZ3RLaU5PVTZaaEQvYk9BZmM3RmFW?=
 =?utf-8?B?aklvUXpTektzZk9ERmpGMHY0cmtNSjJTbmludEZCN2F3Q202MGg2aUxqWlh1?=
 =?utf-8?B?MGlkbFdYVlZ3S0xmOWZqLzJGMEsrSC9xajVmNHFZNjR4MkVCQzhnN1RyTnA5?=
 =?utf-8?B?dWI2Q2xyY2ZKOWdENXhhKzNCUmp0ODRxdDdFNCtZUDFuL0hlZXkzNkExY255?=
 =?utf-8?B?cTJGOFh3bGJwOXlSZk43WUFiY1RicTEvSE5DUWdXQ2FmSURnM0Y3d1ZSNjQz?=
 =?utf-8?B?QnNwNEE1RDVBL2lRbDF3dFE4dTlNYVdyclIrZDlCam5rbDdmRFNWbENVK0Uw?=
 =?utf-8?B?Y1FnT3ZJWHk2bnZZbnFRdXdmVlFUaXBLay9ob0JvV0MwQlNoNlh2NVZ3WFRV?=
 =?utf-8?B?MCsvQjlRUHdpSXd3YWxIaUlxek8vbDhMOFlVSGZFVWZSWUxNcm43WmFSenRW?=
 =?utf-8?B?MXlacDFqUHpiVGJHUXFlWUJydVY3UUg5VXcreTRtd2RkaGc3SGs3WURGeENE?=
 =?utf-8?B?ckN4WGdCa3B6Vzl3dVNxdklkNkRGK3oyZ1pQcXRTNmkvc1BRWFg5aWpCUnp2?=
 =?utf-8?B?L1pmZGhsVDVPc1JkcHpnaEphenRoV0d4WmFteDZHVFF4WFpFMUZjanAySGRR?=
 =?utf-8?B?TVdtZ0pEWW9kZDg2dlBoV0tENUJkbytUcjdFRkZ0a0ozcDk3U3VHS29CWWNL?=
 =?utf-8?B?MXdLSWV2cnExVWo0by9mT250aFpMRUltL1ArMWNHbXJkTGVKUmNSb2phSmF0?=
 =?utf-8?B?S0tLU0FaWTRoNTN6L29wS3pRQ1RnUTYrbVRtR1ZNNnQ1cTRxQk8vdVRGaHkr?=
 =?utf-8?B?Q25TMEt4Zlh0aUo2OVFWbGFKWnV0NmxjdXhGNVFCSlBmZG1jMy9wNVRFZ2ds?=
 =?utf-8?B?ZlhZY1FqbjVJODBLUGhkNGlFZ1R6Z1JmbmFCQUFmZ2dWVldwVENyb2pQNit2?=
 =?utf-8?B?S1c5SFJBZXRma0JrZTIza0lFY0t2aVBYR055V2N0U2Zia2xFTXM4bkdOd0cz?=
 =?utf-8?B?eW91Z3IyNUVzeVBFTWhERTVwOEx3LzdIL1N2SDdlMHpzc3EweHlRZW1rUmtU?=
 =?utf-8?B?bkl5cDF2b29ERDBBMHRReTFKOFJlWGV5bUR6QlF5MHZ6Z2J6enVYKys2WVBQ?=
 =?utf-8?Q?lX3em4wFpeA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0pQczhoQURTYmtGUHdHYS9DN051QkpkM1EwQkdYT3kwa1c4VjhidER3bC9T?=
 =?utf-8?B?eWJvTGJxek54MUYza3diT1FyNGUzaEdDejhaS01yU1N2UVdBeG5kOUFuNzRO?=
 =?utf-8?B?Y1JCYjljWmtYdC9QaEdab1g1WFB0L1dGVFRwYlNPdk80VzVsdlV5TWJ5QVJF?=
 =?utf-8?B?WDJQMk1KS3RONEVid2o3OGUxRTdHVHFCMFh3TVRCRVFvSWhncnJMMHhRTHl6?=
 =?utf-8?B?c1lQVENSdWhwaXZKazlwdFJzS2RPZTRER09RY3F6czVqTTdhNUtlZ3JaRDds?=
 =?utf-8?B?YnJOMEtjcW5Sd2xvWFpxYzM4ano4TXMzWFh3SlBnRlZmeUhHaXExbmxpbHpJ?=
 =?utf-8?B?a3hZbWtLWnVHNElyWFBXK0d4bThrZnFKbk9mNWZnMmJJOUVSNEFCS2NQZlBF?=
 =?utf-8?B?OHBBKzJ2aEpGNVBRQjVPNVJKUVlteWVnaGlJOHhTYTJIQzFvdzVIQmFjY3Zv?=
 =?utf-8?B?TE1OSEFxU0p4QjhPZkFhZEREajlTM2pZM0FRM0d3cGVqMEpyeGRZVU1aNHo0?=
 =?utf-8?B?RXV6YmxkWDk3ZGplU3dPWFZkY3RmSG5BbHNmQVV0Y3Q0bTRFRnJKZThrNHZq?=
 =?utf-8?B?RGNKWlZ1dHJPWHI1cDhESE9SaC8wQVc3Zm1TU1MxYzRlQnowZXBiUkRDbk00?=
 =?utf-8?B?STdhWUlMaldZYnhhL2lWckJMNGsyL0NMYUs2QWRvS24vdzhuM0VqRDgzakk5?=
 =?utf-8?B?REVxT2MvNVhZcVJFVFdQOE9qT3ZZUVl2U050ZGNKdEFkblQvRm1RdWFEcUU2?=
 =?utf-8?B?ZnYzVmpiVDR4MmM3amdFV1BPb2ZqS2RRUFZzZGVmVTROcnA0S0IyVU5iMEt0?=
 =?utf-8?B?R1RiK1ZqZ08zZUFRejV2RHl4M0p1cWR3M3MvcGNOMzhKS2lYRWQ0MkpkUWdH?=
 =?utf-8?B?QVV1TFoyUkwrNitPcytRZkVUcGhzdmFkYWtpamp4L0Vxalk2L0ZmR3JzUkFQ?=
 =?utf-8?B?Ylh6Sm14S25vVGxIOFhRU2NXeFA1N0M5YlJiVkxWWXI4bDU3dzRyQWNTT2hj?=
 =?utf-8?B?eE55RVMwWDZvZHNSUXNWM3dBc0xVS3NSWEFRSWlOc2paYVRrREd1a2FoN1NS?=
 =?utf-8?B?c2Z6VUdSWFR3Q21rYUFhUkpQbEVtVUwzT2FOdDVtVldBQWJoRmpNQnhCQTk1?=
 =?utf-8?B?SjBOZkl6eDFGc01ucmdqMXI0MnhsZG42WjdyL25ZY2xBY1h5T1BkaldURU9X?=
 =?utf-8?B?QjI1N2VCQnN4b3cvUmVsOStDVEhWMTVnSGtkZ0FNNGhNSU8zaG5XelFpYnJm?=
 =?utf-8?B?VHBEUXB2ZE5GL0ZHL1hoZk84UUFyWmNlbm9md08xdnNxalgwcVFpWHlYa1Ew?=
 =?utf-8?B?bHFaSTN3YTJNMXJ1QWdXYXBqTHBMM2ZZbkpjWmk4LzZudjNuQTlxRDUrMlFw?=
 =?utf-8?B?NjUxc25pdlFKM1lFMVhpUU9ObEdFcHFlWmd0VmZmYW8zb3hTcGgrdlltQ0l1?=
 =?utf-8?B?VWNTNCtzTXhpWlJzeDJmTSt1NEIwc3lNOWVCTnMvZWlNbTlxZnFrbkdXcFpK?=
 =?utf-8?B?dFM0N2E3YkI0SG80K21KMDJkTWRadHBzN3o4RHdFWVB4c0NydlhqWWJ1aEVE?=
 =?utf-8?B?dkNYYlRCZ09WN1ZFWjk4UFliWmdPcUtTdkhVQW5yS1RvWUhBTFpjMWQ1d0NW?=
 =?utf-8?B?eTlNNEIwcElDOVR2VjlVRVRnOUw1WHdDTzNLTUlrbGhNMmVsTGV2U2psTXJT?=
 =?utf-8?B?T3g2ZFhjNGt4KzE0eTZVNm1aM3psQ09vaitkL2RBSEU2elFUeG9STFRWUW5Q?=
 =?utf-8?B?Zm83eGs3REF4cDRCdjVac044NCtNMXY2QzJ2UEx3Sm56QVRKMEhsYk5xKytr?=
 =?utf-8?B?SVJVM3ZZYllONEZRWlp1QUdYRjRUMHFESyt5d3F5Q1ZhamxWU01Dd29qV0ZZ?=
 =?utf-8?B?RmFKa2tYaERkd2pLUG40TlBYcDVlaEFPV2swa2ZzMTN6WFFxMW0wb3lrc1dQ?=
 =?utf-8?B?WGF2eUs2RFNyY1cwRTV6QVBOdzRDajFpZTFNMHdqTVltRUJuLzI3UGQzNUV0?=
 =?utf-8?B?V2ZNVVRua0orc3NEUDNSWG84S0dOa1JOTDNMbUdUelZtK3czbnRRblhobktN?=
 =?utf-8?B?eVZ1dmRKVHNxYmc5WE03c09sVm9RNHNjNnhNSVFFWGlUeEptUjFqempQN1R1?=
 =?utf-8?B?Ly85QmJQSjhVYVp5bkNwb1VFaXhtekIzTjB1TWtZNjJZTnMxNW0zclFnUHdt?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15e702f-7527-46e7-6e37-08ddc9d27a15
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:19:58.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJxD2Q+8XSgsXxSLphgQeMcPdnVTS37fpwmmiCaDnJEgIxwSFinZhRSrEakvaIL6xZB+1ZC5DU7RjRlWDJHA7RIwC/dK272S7pvybDkym5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10472



On 23.07.25 12:16, Julien Grall wrote:
> Hi,
> 
> On 23/07/2025 08:58, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Move vcpu_switch_to_aarch64_mode() in arch_vcpu_create() callback instead
>> of calling it manually from few different places after vcpu_create().
>>
>> Before doing above ensure vcpu0 is created after kernel_probe() is done and
>> domain's guest execution mode (32-bit/64-bit) is set for dom0 and dom0less
>> domains.
> 
> The commit message doesn't mention anything about domains created by the toolstack. In this case, from my understanding, the switch to 64-bit domain happens *after* the vCPUs are created.
> 
> At the moment, I think this is probably ok to call...
> 
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   xen/arch/arm/domain.c                    |  3 +++
>>   xen/arch/arm/domain_build.c              | 13 +++++--------
>>   xen/common/device-tree/dom0less-build.c  |  6 +++---
>>   xen/include/asm-generic/dom0less-build.h |  2 +-
>>   4 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 79a144e61be9..bbd4a764c696 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -586,6 +586,9 @@ int arch_vcpu_create(struct vcpu *v)
>>       if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
>>           v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
>> +    if ( is_64bit_domain(v->domain) )
>> +        vcpu_switch_to_aarch64_mode(v);
> 
> ... this function here because I *think* it would be NOP. But this feels really fragile.

The toolstack configures domain and vcpus through XEN_DOMCTL_set_address_size on Arm64:
- toolstack creates domain and parses kernel binary: domain created with DOMAIN_32BIT mode by default
- toolstack creates vcpus (still 32 bit mode): libxl__build_pre()->xc_domain_max_vcpus()
- toolstack switches domain mode depending on kernel binary type: libxl__build_dom()->xc_dom_boot_mem_init(),
   which triggers XEN_DOMCTL_set_address_size hypercall.
   Xen: arm64: switches domain mode and re-configures vcpus: subarch_do_domctl()->set_address_size()

So, this patch does not affect toolstack path, only optimizes Xen boots a bit.

Also, during Xen boot or by toolstack - the domain is always created before it's type is even known, which, in turn,
is based on guest binary which is parsed later during domain configuration stage.

I can add note in commit message "This patch doesn't affect on the toolstack Arm64 domain creation path as toolstack always
re-configures domain mode and vcpus through XEN_DOMCTL_set_address_size hypercall during domain configuration stage"

> 
> If the desire is to make 32-bit domain optional on Arm64. Then I think it would be better to pass the domain type when the domain
> is created (IOW add an extra flags to XEN_DOMCTL_createdomain). This will require more work, but it will be a lot more robust.



-- 
Best regards,
-grygorii

