Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NLDHocimGlNBgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 09:59:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E0E165F93
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 09:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236928.1539406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtMMI-0004FH-4K; Fri, 20 Feb 2026 08:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236928.1539406; Fri, 20 Feb 2026 08:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtMMI-0004CD-0q; Fri, 20 Feb 2026 08:59:34 +0000
Received: by outflank-mailman (input) for mailman id 1236928;
 Fri, 20 Feb 2026 08:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNHm=AY=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vtMMG-0004Bp-EQ
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 08:59:32 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 764f5046-0e3a-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 09:59:29 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA3PR03MB8302.namprd03.prod.outlook.com (2603:10b6:806:460::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 08:59:26 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 08:59:26 +0000
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
X-Inumbo-ID: 764f5046-0e3a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ci05wbTo/y5lNBcX3Zf2+nQK3WMUmXzCj2gXzLvKi2RudZCkh0mnjfhjk1iYIkFIWaaVUn4G5bQqTQDrWFEYcxYrejqg71SwA4AKBlCQvva50N6YJ1T51+H/v77oBtKq1SrwLfPmUbPkKotc7UvfpxEsRMHqe7z6wRkuH49OMR7WhkWy1ESbbIxRs0Qay7rqaRNu28XSQ7fXERDEsAmAVuqmEhYwvpYoI4LR9ym8szJJI12hvElUE+H/MeI6XUEx5Zk0XQt8qu8+x0V6P7Frqt7mpLkFL3SWPJWYQeO5d9lyoaPv7fiGbeQzkNi7Q2lNByJd9nlXn4MxIpWfE+KOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdPuoqzz/bFc+YXLeH0czSXjYzWxJYJZwUXyGmPyDpA=;
 b=JrC9q8qyHiceydGqy+A9YLvo5YnGVZSXF6KAp5nDNX2uXNrHkAA/1lCaJzoVYsMGABiGwL4m/VIBj15JfcENf1/XWkV97FbjYxbpVF6ldX7MSMCLfvZ5vYVSg6ZGGz/sh3v8vmyIkfhQ+qJSH8WdJqEUuC8s2tflBgh6YFdKX7xfEPvx3SMKyDiz4MHyDUfXM2IUBka3PaNzk00FkwVzPAZxX138X7GrmKNF43+30zjtqA6/cajaHtQ5wrGXcFFadTj22d1H47kTr2U6LWRMji0fTvy00RLEAjEzkcTKnVF1GkVHm0rv26z0bgqs9suI+BhN0iT7qWLgeu6cbtHO1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdPuoqzz/bFc+YXLeH0czSXjYzWxJYJZwUXyGmPyDpA=;
 b=CA1CJxAObvK/I37Gw2LIM+6aJ+brRpgYGthWSA9bPLjT4DK1N6bpK6IgMK9hzzpiY0ck77iapvvaV3Yc+unylT7P4eQBu7DMhWV6XTPkWajNXP/ppi1Fl6k7NXw5i/fVn3KMOTbvqr/qcLBPH3QbWv3vIQmlyVkYUfxBK3OORjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 Feb 2026 09:59:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v4 4/5] vPCI: move capability-list init
Message-ID: <aZgiarWw3Acr8WFF@macbook.local>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <b5030a1c-bb01-499c-b75d-27651a09490d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5030a1c-bb01-499c-b75d-27651a09490d@suse.com>
X-ClientProxiedBy: MA2P292CA0006.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::7)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA3PR03MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 0470b083-b186-4860-b6ce-08de705e5926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blVrak5JbHNXazV5akVHYURDVXY1RGp1bHhUUXBKcXIyZ2tXd01wakdHRUda?=
 =?utf-8?B?NmNNQ1JBQVZWSU13aGgxZnp2bFM5SThaOXpqdEsvZDgrakN0N0tpQzU1U1F2?=
 =?utf-8?B?MmVXN1l2MjJMV0xieU1JRlZTRXM4c0Z2QUNUNTl1b25YWkxpZXlWNmcxU1Vv?=
 =?utf-8?B?anM4cFRCOCtFZStOblhRekg5YUkraVRJQ2M0blc4UVRUd1hBeEEyUm5USW9u?=
 =?utf-8?B?M0NPUGlQYWMvZzdTLytCcGZqSHdsbS9nKys2V0Mra2QwVWkxMlNFajdjQ3No?=
 =?utf-8?B?RWRKZ1RPV0xmV1dtcGZWbUlHUk9aZXV0OFhrdzk0eTZZYm5MSFk5cHp6Wi8r?=
 =?utf-8?B?dGVWT0M4UERZc0NTWlFzQUdjaFVrYUlIYktyQ0gxZGFiMVZZUURubkVGamI1?=
 =?utf-8?B?M1oralY1U0RCVWt3bGtMdmVHVHMzMU1qeDM5OER6VGFEcSsrQUd3Q0g1ZGk2?=
 =?utf-8?B?ekVhWDRqdkxKUkRqYlBEcE04bXFFTnN2WlIyVDFHZlZReGd0SmI4TFRZLytX?=
 =?utf-8?B?S29ueE1FUi85T2FUbUNuaUozM3RleEFHbFBWMXNBNFplWlo2emdUZ0MxRG9v?=
 =?utf-8?B?NmYxaldEajhvV0FuTG1EdjllOGdXa1YzNnVwb1NVbXRXMkw3cHZ1WVREYS9U?=
 =?utf-8?B?dkp0SXhGNS80U1FESlJlNkllZ0tud0pmdE1ld2NXWitJL1gwOHBZY1AxR2w3?=
 =?utf-8?B?NU1zdlc1Qi91c3RvU3Vlb1poc3YrbjFwd0pza1B5VWlHTnk4dkE0eVhhcm9C?=
 =?utf-8?B?Y3NLUEVxT2QzMUhzdXdNa2dtVzI3RG9lQ2p1REc2UjRBcm5jZzdLS1Y0REhP?=
 =?utf-8?B?UjU0T3Y1K29XT0VtWHBNNVdoUFhiWVNadHdaSW9McjV4WWVYb2tOa0E4eWx5?=
 =?utf-8?B?UXJ3empmaFppNURveGJreTVUenAwTElRSmNwcXpuMVNaZHJ5SXBtaFptR1BQ?=
 =?utf-8?B?N1hqU0pHcGtnNFFCVXFnVXhIZThCMy9Zd3A1dUNtY1MxV0N5VlNjeTU0VThn?=
 =?utf-8?B?OXVJWnRxblpoVVI2WWFvWjZUOEVGZ1dxdXhxS0tleEJVSzJqSis4NVNIQVgw?=
 =?utf-8?B?bklwSE50NEdnOFNXYVlVa2thdlpuSVZZTTNzd0JWcy81ZlJ6WThSRXJPa09Y?=
 =?utf-8?B?L2p3L0RQb3BBRnJIWDZJTVM4cmhkOWNyNXFGdVhYVkRuYnJVaXAxa3hQSWkw?=
 =?utf-8?B?NFZrUkVKMmpNWGxHODZhaDNjUFpKZVpZLzdHOXZqN1g1Z0dZMGZEVkdkV2My?=
 =?utf-8?B?RWFqTXlpSEdRbDZvK1dSUEdhaGhzWHJUSy9rR1I5Y2c5Q2xKTHo2WnE5Zk1q?=
 =?utf-8?B?UllaY0FJcTF1Si9aRFltL0FONlBRLzY4ckloUDdDaWVXQ2gyMDBTSERtdGlP?=
 =?utf-8?B?QXJjMnlUbUxyQzNWZmJ6Qm85YkNEdzNTU1RMR1JoRDJmNVM1cksyWGxSRUF3?=
 =?utf-8?B?dFpJMG9sc1hvcFUxYmpZbldqR29kRyt5L2JXSVgwMGpmam40OFBESm1ybDh0?=
 =?utf-8?B?elppcEVBc2prY212c3JGWlFaQ2wyQ0dHWGc3RU9CZjRIMnFlSDBQV3FCYWs2?=
 =?utf-8?B?aGcwYjUweVFVRFoydTdzcWRYa2dDU0RzZEZyVXpuTWhFTk1nWjFLK3krUTJS?=
 =?utf-8?B?TG8vRnRJc2JoSGw2Q2daemcxcTZsUWFQTE5VRlg0MFpLaTJzSG42TkRzeEFw?=
 =?utf-8?B?Z3lWVmZXeXZZM1pkTVYzOVh6aEx3YlUyNUNKV0d1N0dGVTFvZ0xPaE1jZDRK?=
 =?utf-8?B?SWdXaHBBdXdMT3FFdGFFckVxYk9pc1RQRzNKd3ArOUxvUEpISGE3KzNMU0wy?=
 =?utf-8?B?YW9mNWQvb2dWZkxhQmVOc3hoY0FVc1ZDN3JIckc0THFJQjJhejF0ZURLS1F3?=
 =?utf-8?B?ZE13UjNyLzdDRE9lZGpGTHN4VWN2NVJkajNobXUyRXpFWEgvVmdEU2MwNTB1?=
 =?utf-8?B?YUYydTBSZHRYZ2h2TktsZUpPZTJYOVdZaUpRUDMycUpnOGxxcXhGNWZYaDlB?=
 =?utf-8?B?Sm9ORG5TaXB1eTEyWFBuRkZrNGFlK3YzOVM3NXYwMEpPV2V0NzVHL0dQbVMz?=
 =?utf-8?B?NFJvMkhiWndDdUYvUmdVaTdiOHJzSURSbG9pWllCUS9QK3BxUGgvWjI4RENK?=
 =?utf-8?Q?p/Ds=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkJPS0ZBcXJFUGwveWRSUVhDaGQwMEdwOGhJc2gyUXg5bkJ2elFBWURheldW?=
 =?utf-8?B?U0ZHSzlLdkxkeFh4V2dUTFJMeUR5ODYvd3N2WW42dkRIem0yZXhIekp5VXZs?=
 =?utf-8?B?d3RuSG1sTkFuenVpd0g3NHFrRWlMS0VmL250WnJMLzUvUG1NOGxSNkh2U2x5?=
 =?utf-8?B?OG04bUJCb1labzYxbHJPRkh3WXZYTGVpVStNVFZld1pOaWlWWjlRcmlxZzRT?=
 =?utf-8?B?SFNhbU5PY1g0anczb1ptS3EzMm5XOFE3dmJScm1UbnRDbVUySmNhVjBzNmZl?=
 =?utf-8?B?RmlXM2poTEJURVFGb1VwWDdDQ3pYdFNlMWtRQ2s5U3R3bk1lMENPRHhwNVJL?=
 =?utf-8?B?VFZQZXptSWNPNHh6OEpkeWFzV3V1Z01jWHF4VUc4TVdPRVBONTJ2QVUvU2hO?=
 =?utf-8?B?Tk5RYmEvbmFESnl3UnFRQ2xLQy9rSVAwSW4zUDdKS21uelBuN0JYUkIwZkRZ?=
 =?utf-8?B?M0daTEd4dUJOaHlwakdYYURKVFNCbVhYMzhyeWdJRkhaZ0pxOHp6Sy84MFNB?=
 =?utf-8?B?MjJWM1U2QXJpWU5TOWEwOWhWTWFWdmdOdml3Y3pmZ0NQbENSNlZ0bkVRVzdp?=
 =?utf-8?B?MkwwWkoydGYvL005MFVrS0lrVzRhL2VYbytKWmQrY29qK0I3VWFTQ3dmbmZF?=
 =?utf-8?B?M0g2Z0ZDS2twT0hIZGlzRHIyc01jalJJcUxZaHUwOEE3QzFjRDBKUUo1N0xY?=
 =?utf-8?B?ZVhGWjYrUDhmUTdQNjhOMGNzbmt0TmdwMEhTd2hNMW1PNlpwbndaTzBqNzM3?=
 =?utf-8?B?djUzLzdrVnpZOXhQaENWM28vSjN1dkNMY25qODJ6RTd3ZFlYb25mblI3UjNI?=
 =?utf-8?B?NDdCTnNrTS9OcDlYQ05UZ1UrMGFhcjQwZ1JRWmI4UGtwT0VLUmtXMG15aDhF?=
 =?utf-8?B?VW1wRk9EMWlhV1JVRkFpOEtLRENCeG9Ubng2cXVJbXVReHZZQTZkN0JzZUxG?=
 =?utf-8?B?dGZIc1FlaTBRb2RUWTNoaGtZRWRDZzhLdzVEbkp1d0V6ZUpWVCtoWEpFQlB3?=
 =?utf-8?B?MkFJalkwS0g5ZVU2TmF5Rmx1Mm9xTFJEQldaVDBDNitVZDJleHFCblhSWXNu?=
 =?utf-8?B?bkZXbEVzUFo2aHlyQUFtSEhOVUI0VDZseEI0V1EwaERMcWhFdjlTSEQ2SXhD?=
 =?utf-8?B?aVNyWFhQZVdpeUVHZ1JSbW9Vb1BQY05EZUlqT0pMa0pVWkJMd3p1aVo2Z0hp?=
 =?utf-8?B?WXY0eEhvYlV0L282bGYyUHRLL3hNcDFuLzFUc1IxRm5VVkZkWmRPQkZ1dlJT?=
 =?utf-8?B?OUJNbjJ2OTlLN3MrUHVrcXFZZzBhakYxck9BVHJSczlEMjhhbit2d1FCS0Mw?=
 =?utf-8?B?cVd1NjlNVDlQcmxldWlTTzE0dUd3NnNlR1FIaWVydHpGdUUrdzZtSkN1YmUy?=
 =?utf-8?B?MWZ3NnpjeDc5WmNuVGRoRHYzRzMzblR2TEhHb3RIdmhHUlYyZnpUZTNmY0cy?=
 =?utf-8?B?U24xTzJOL0JQeFg3RlRXRWVHZ0FwUVpMcnB4REdpWSs3aHh0MU1hYWlNdWJG?=
 =?utf-8?B?dFdhVnVsaTA2UElmbVNTT0pGNWRrVlJNdTVnMEVrVjZMd3FDN2daL004aVhI?=
 =?utf-8?B?WUhocWh3YUwxa1JlUUtvTkxITS9qMUtCVmdTTG5oM0JaVDVheUJCRTFlZGhs?=
 =?utf-8?B?MVRyL1I5UlNWYllFdFVBZTEwRTZTaHlsbHlrdU1Fa3YrQXdNL3kzbUsxbjFn?=
 =?utf-8?B?Mlp4cStsVjJ6ZG5uK2ZWUmRFQnRPbUlTanRWRXJ0dFMzMjBobDFRK1JjcFE3?=
 =?utf-8?B?MW9seXZnT2swRjhqZ1haWkM0djBjMDlhVEJ6aWIwSng0SUxkaXN5MHMwMXJH?=
 =?utf-8?B?YUJ2WCtBdUg0SGNUYjMvb1NleWJVbnNWdVg1LzlzUHAwOGl6TkgxNFMweDZK?=
 =?utf-8?B?Uk9OM3hhbnNQQTBBTXk5ZHZnWmZCYWRrbnMrZmhaWEJNNDNlUW4xTm1xcFBR?=
 =?utf-8?B?ampIRzNwVm1MaHV4aVVZRU1LWlIxMnhKdzhpV1k3NEpIZHRHWktvV1J5R3Qv?=
 =?utf-8?B?UEt5bXJsS0ppd2s3bFY0ai9LbFE0ODRHRzA2bUJNZmRSK2NQM2NNRFlFYnpY?=
 =?utf-8?B?NDYxRzc0NEJ6VnEwYVNqNkNiT3RlTHRWcDhrb21rd2RCM0thTlE3RmpIdmZa?=
 =?utf-8?B?cm1jaE5xUkVKS2Zxcm43dmxDbW9vMjQ1Y0dib1hJZ3lVQ2ZBUVlGNXl6MEQr?=
 =?utf-8?B?TFpFbW1EaVRLTE0vaHBxOWV4TzVvLzZrWEpleVhmWFBkV1hoaXJmclp5S0Fs?=
 =?utf-8?B?MVNkVktPWlhWNWlhaGtTdG5nZzNETG8zankvWGNidHoyNTdWaVI0T01FSVc4?=
 =?utf-8?B?ajdvRkRnbk1LRmJEdzY1R2RBSEpqZktKbGwzSU1NcjlMUnZrTDNjUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0470b083-b186-4860-b6ce-08de705e5926
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:59:26.0276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hehVqjE/D1B1GmO16g+oJg4Q5lzKrmWeT7eUdETXU7mNgeTwzUdPm5+OBP8ghbUo5jmoBfmwyqqeygCQzTz1lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8302
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,macbook.local:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D8E0E165F93
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:54:53AM +0100, Jan Beulich wrote:
> ... both for when the functions are invoked and where they live in source.
> Don't invoke them directly in vpci_init_header(), but instead first thing
> in vpci_init_capabilities().
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Thanks for doing the move.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Roger.

