Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9408C9B656
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 12:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176166.1500699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQOzV-0002Pf-0L; Tue, 02 Dec 2025 11:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176166.1500699; Tue, 02 Dec 2025 11:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQOzU-0002Mw-Tb; Tue, 02 Dec 2025 11:56:20 +0000
Received: by outflank-mailman (input) for mailman id 1176166;
 Tue, 02 Dec 2025 11:56:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WL05=6I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vQOzT-0002Mn-5x
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 11:56:19 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e884ac1b-cf75-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 12:56:17 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by GVXPR03MB10705.eurprd03.prod.outlook.com (2603:10a6:150:21f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:56:14 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 11:56:13 +0000
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
X-Inumbo-ID: e884ac1b-cf75-11f0-9d1a-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVVPedy9Gmi11ceOzYoLHTs2wiIxpQthwX1dIaFXKt/h1aahnokgI5qFkfgXzpWuOb8gIusyNTdNqUaBTc41rTdi4g1sduT2+eO78tasHngluyLv/F/EPi9iI9Bgteqkt4mK6ofeUvx+4zpQOYdW0xUZX0akcRhF2eThvCuTbk1IrjfDTsrfyeuOrUCyiW32pWGKcqB7EjUETx/HgS72YfLrOXPoGoEU+Dr6/lb7Ouyp9ij3guRZsYJECTJn8Zy3gfmZacChd0YwhdYPfBb1I2YdMVxeBXb3/IKVdHRRRagrJ+Y1tmLKg9Z6v+vm8WsAXF0GGU1nWytw1lLyZY3MJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDhCvBF771WX8M2TbfL5tSYNdS5sUMCDrzsKav3Su/M=;
 b=Iko+WIiHzjmAhOsN+7b/c4ylYuPZwrVxq/VMoW6m9O/BvIRtMX8U6p4WRUJPR1IqkItWdgIOapgoT2GH6JjQrX/EH7nfg73aSPc7/nvYU/6WeE7oYA+kjA346pj8Cu7Np0BRFRDtEL28UVtKjvZI+JzDaqgI5bFaOcUyeExjRucGEb0SLwzr+eTxfNj8FbL20ymcCT56jhwi+Yve9iguOsSwD4v49jkNET0TrUHy7pjwxH6qiZyHW2w2/SGKPUE3TCmlauFh36XpbpeMo2mvTovy0rTMUAO1rqJL5ujQNw4EelJIvGDXfaCAPn2bQaBfaBOpNKakgcDtUZqezliqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDhCvBF771WX8M2TbfL5tSYNdS5sUMCDrzsKav3Su/M=;
 b=QXImPRCYxeEvyuCzSFSQYiqzAariYa/QFJI3wzO5t6JGQX2vSJm+8Ifn+1Gp4JXgJxZoJYgtrRxUpeMI1Nh0m3e07uRnxnBbAz32FNMqRyso7rw9h5Rn1MWTxdRn+BB+cf8/S3esJBFT7UIAebE0iDm3vP2SjJ1qoTfqPEm1sNtV9yCgryenmjF1cpMcqniRQOCM5zDVMriYmxOWz7Fxzg7pV7qnJdZYiCNYrXL5DuT0FJczv9gqKImKjPNAdD/XbajhLa4hu4cb60mJB8hrCphPzuIpqOLk2lIVnPkPhq2TZKOjxr6g51nU57wJ+zan6Dg5obSMH+XQ3lKSQFIj7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d6e7f493-3765-4b10-8088-838b8d838cc2@epam.com>
Date: Tue, 2 Dec 2025 13:56:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/24] xen: consolidate cpuid library
To: "Penny, Zheng" <penny.zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-3-Penny.Zheng@amd.com>
 <64298088-489c-483c-97fa-62206f1a998c@epam.com>
 <DM4PR12MB845173E05DF89C8D57974AF1E1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <DM4PR12MB845173E05DF89C8D57974AF1E1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|GVXPR03MB10705:EE_
X-MS-Office365-Filtering-Correlation-Id: 259fc0ed-fc48-4604-4309-08de3199cad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXBvSFlqODlvR2kyRUVqOXNxbnFjWkxNR3FVQnJna0JwL0hBaWVWNjdYeFNE?=
 =?utf-8?B?eS95K09XNWluNXFMUWFVT2FKaXluRURPRGp5NFE0RGVKM2Jsd1ZUZ0R3K3pO?=
 =?utf-8?B?V2RIWlVOTXdncjNHaGtUdGFvYTREYUdFL0JETFFSTjNLaE84R2NoVGZsQU9p?=
 =?utf-8?B?TUlxQXdsMURFaWZQSUU4MERRZnV5NkQ5VlhCVUNoaDJYd3JUaEpKdjFDd1p6?=
 =?utf-8?B?Zm13TUZPbmJSNGsvajBtNWxlQnhFWXVxYkJLYlRUNTdHbE52dWR6aDVacEI5?=
 =?utf-8?B?SmZNWlJSWUZmc3dsOFNkeFhBRHRwQ0VFVlhQMlp3eE1IUFdnVEJQdjkya3JG?=
 =?utf-8?B?eEZDYUxOSzQwVDZpSU9GVWY4ZWNFQ1duUmh4STIvWWZRMUVlQlByay8zN1pY?=
 =?utf-8?B?SE9DVStCdHpQNnk0MWk3K2gyOStEUjBJUEF4d0U2WU05aGVaSUtSZUR4RlRE?=
 =?utf-8?B?cGxpSFV2Sjg3elQ5TTh0L1hpK1lLcnltRitzaVRYQmlMWWV4UjZUZWdwU01V?=
 =?utf-8?B?dm1JZG1YMGYzdHBvekRHRSsrT3lUdlV5a0JHenlPUHdrNW9jWFVPcElrQW1a?=
 =?utf-8?B?MFdWWm4wWHBLcUUrT0pWZ0g0VnJUK3JiREZOUVZXZUE5TVAvdzl5bVBxMTBL?=
 =?utf-8?B?Q2FVVkptT0MrRmpaanlKMGI1ZGJ6MVJiNUR6dk9uaEZlMDYrT1pOOE8xOVlG?=
 =?utf-8?B?Q0dVNDRIYTQwYlVOZk55TjVoRUptSEVpNDAxa2J5TVIzV3NKSUo2RGV2ck9x?=
 =?utf-8?B?UzhDTEZ3Q1Q5RUdtTytlSWdua1M1UWZtbVRMK1puL0dTTEtYWVlYNjBQSGd4?=
 =?utf-8?B?TTRWWkFHb1lRaXAxQWJ1S3krOGFjZmhMNDd2dGxRZlloN0YxanR0NFk3R2RB?=
 =?utf-8?B?TTRDUlQvcFJuQkVXdHd5WTJCY3VEaVVHWm03UG5xSVVXVFphbzBEMFFMZjRm?=
 =?utf-8?B?dXVmT3VGUEV5ZWI0bkV0WWg3QTZ1UUpFYWdVVGErNzZsYUVZL21FSU1GMXpM?=
 =?utf-8?B?TDhKV3czN0lHcTlKMkZFVExnRjJFOXZFdEVQSUtZaTc5QVEzTmhLQ1dkbUx0?=
 =?utf-8?B?TkxEblRaczNIZU05M0R0dDNoNFRCaTF5bWtYNkFkK0tGeFlIOUJpV2lkNU9L?=
 =?utf-8?B?dW95clNxanFCdVlvdjgwMlVQUDlZTFQ4elFHRmFQc3hzTm0xVlNGQVhHL21I?=
 =?utf-8?B?TUYvQUllYVlWVGRtaHd2dFR1YmNybGtwY1dhMFlTVjhVQ3YzZitXc0dSR2ta?=
 =?utf-8?B?T1kzMFo3NGprU1V2K3FsZmdFVVdKeGVtWnpna1o1bnNZQk1XVDFtTGxKZU1s?=
 =?utf-8?B?ejJSM0tMcEh6bjhYN0R2RlNKUmJFYWxqczVJSjEyTE9Cc2RZUFVXaWlZOTIr?=
 =?utf-8?B?QytmWXNqVFJzbUhadG5vNll3R3R6ak5PV1c3SCtyR3IwN0VaNnUwUkhoY0ZE?=
 =?utf-8?B?aGxVclRxWk96TXU2K0E2Y3QwNjI5OXU2TEcrS2lUdkNlb3BYSEVJL0JnVElx?=
 =?utf-8?B?ODIyTDZIZmI4QTNSekRWMy9MMEk4cDh3cVdqUWZNdUNqNml0MHhSbnQ2dVZD?=
 =?utf-8?B?cTFianh6K3phRUJkbTdKT1hnYUJROU5namcyUmhVN3dmMHY1YXJqc285QXZz?=
 =?utf-8?B?MjQvV05nNU1heVFWRHgremUzN2lJNU5TMG95S0dSNENwMVZOTUhQUFFKRXFx?=
 =?utf-8?B?R2tuRVJtMG5JZVpxMWR2ZnZXd25ZUUdOUEM3djVDK3lzbW9rTjJST0tGeldB?=
 =?utf-8?B?dWFsa2dFaDNFRDk0cHoxcnNVS3hxODcxMHdXNDl2VWMvOXI3cDNKc0dEQzRa?=
 =?utf-8?B?NHY4NDBTUm9NNHd4U2kxMEF5ejV1V01jTWh4aU5XcUNpL21lb3czRFkrWDVv?=
 =?utf-8?B?NjJxenVUM2R2WUtTV21ENDVxWWJrOGNIVW0yNjIrbHlaT21rdTc1UVRjOGJO?=
 =?utf-8?Q?1ejagr5XLnibwDa8XypUlwklH5jfvvZc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlZkM08rS3p2cWpBbzl2byswZGYrUDYxcWprYUViSi9EcGhhZVNkZ0VDZGdS?=
 =?utf-8?B?akxXVGg4bEhXcXd6OFZLaVMycXJJSXhXS2NoZVVMWTBhS01VdjY5RlNCN2lC?=
 =?utf-8?B?TUllR2ZPNEIyT0U3YjlzVlJIbE85Q3Nzc21CaW1zbVBVb3ludDVsMXYwNHNX?=
 =?utf-8?B?NXMvRXRTRDQ1SWx5L1o5V3JvU0FQTXV4RmdiY1ByR3lXa0tQcmF0NC80Vmtk?=
 =?utf-8?B?OWUzcmNLc3RUVmJyZGxhMm55clVyTGozRE5oODQyMWhXSWpMZm5ua2crVy9D?=
 =?utf-8?B?TEIxZTNxb21QRzdzOTBtTkFuWVBlazlqell5Mk1LWUYxekVKekZYb3RxNi9I?=
 =?utf-8?B?Q2g4NkY0a2ZCL0ttQmNCLzllQ3c4NXJGeHpEdGlaTE03NCtlemF1aisxWjRG?=
 =?utf-8?B?UXMzcm1rUURBbXlzQ29mcVZLOTJXakZRVjJKeGM2dUswUG12YTFPZ3IyWUJh?=
 =?utf-8?B?MncwNVptTzRyNGltUXJpRGFPUDc3eEIweTdBeGpzMW1Hd2xrQzhlRUpISmVK?=
 =?utf-8?B?blg3SisvTyszT09rOGRHM3hpb2I4bjJUc3krMFZyK0M0WVgwTU40R29KSFJY?=
 =?utf-8?B?UGJOeENJY0NaSlZmZW5UbURzVTJLZWlZQTRtdG91YjdOaWdsVWc1NDQzaW5t?=
 =?utf-8?B?cmV0V0ZPVWZ4eFErdTJVY0t2QUtZa3k2VWdrYnJVem04aHpRVzZVclpsRnBD?=
 =?utf-8?B?NElrcHBHejJsTVJUTlJBczF3dElTZVdrOGxBVmZMUXVFdmF6SkZmb0MxOTNx?=
 =?utf-8?B?NzdDNEtsamI2UjVCejhkN2x5STBkc0ZXZEMyMFR1OVFYNzVocFBoOTBGOUVM?=
 =?utf-8?B?TEFMK2pOYndXaU12WXhhYkZLZmZyaWNNOFVBK2Q4OStwcXQ0bVJUN0ZHSDky?=
 =?utf-8?B?aEd1bnRtMFVNMVBlUE1DRGpuMklWczMvNEJlcCtISHc1WUtKbHFTSEN4TEN4?=
 =?utf-8?B?Z1YrMFpBMEU4TzBkZU9WenAwRVdsRnYxeU5VblNabWlUWnV3dWNGbjNOYVJk?=
 =?utf-8?B?eURNZHpGS05MRjVOaTZHU0k1d25lVTh4ME4wN2ZobHlpUHVVdDhkWCtUQWor?=
 =?utf-8?B?WlBMMzJiMUJNR1pvWVVmZnFEZTZCWVQ3SnIzRVJ0clNWaUIvVWZ1ZEwyT2x3?=
 =?utf-8?B?N3RTZThkZTRFZWN5U3VCRVlsbDgybWhISjBybml6TysyUjl5RzhrUy9lSkQw?=
 =?utf-8?B?cGJBSXYyU3Y0c0dxRllRaUNnSFlOS2NZUEJtSzMzenBzZFFJT09LNTcwVURt?=
 =?utf-8?B?ZUhQVi9Udk95VjRsSVBXOVpsd0RDUXF5WjRvcFB5MHpVUWV3TXZPS2dZNGFP?=
 =?utf-8?B?Y2lna0VxQVR6bVRrZmRzNEhEUDBaZXpuWGlnN01BZk1uSm5pdXN6UThPRUZh?=
 =?utf-8?B?dEZySjNYRzVJYTM0MWlRU0ptY2w0Q2gyaG1ZK2pUcjVRdk1kdlB1R2RUT3R3?=
 =?utf-8?B?T1dqTnRwdzRFS3BKU2MrT2lXS3hZUHdXb1ZNTmMzNnRPV29vVmg4dGdlZmF6?=
 =?utf-8?B?a3JkZlJQU3VHQ1dFdHZCYUtHU2oxaGpoZTBYWmoxRjU5bEo1aDA4ZHNVWmM5?=
 =?utf-8?B?eFUvRXhURjF2WFl1Y0V5ODluQlZPOGFrN2J3V1FsWmdlRmwzMmlpNHlEQXlB?=
 =?utf-8?B?dU9PMXo2d1lFMWIzKzhzTGdOVHlpeXpFVEJKV3Nqa2NXU2FiN2c2ckcrand0?=
 =?utf-8?B?Y2tpTndGcUhhN2l2VStjTS9kbWVjRVJMWVpTRGFacXZKS2d4dWUxdEtIRTY1?=
 =?utf-8?B?dkxFYmdaY1paVWVRVGprUjYvNzF0ZENVeGxzdGIvNUEvUmF3eldPNkQ5UTkv?=
 =?utf-8?B?NHJnVUpoQ0VldnNMcDFzQURDMXFkYVoxd01Id0xYaElWdWNjNlV3Qy82OURi?=
 =?utf-8?B?amd3bDU0TisyVVpnanlQNFVDUUNlOHN5RStRY3ZmTFdKTnMrMmZ6Qmh5ZkFL?=
 =?utf-8?B?TlRRNDBZSVcyc0NwZWNzK0tnQlh6RVo0eVBsRWdGZnMvb20xK0lYMTQvSkd6?=
 =?utf-8?B?TmxyTFJ1aEJCMHNwS3FhbWZkOTZBSmVMVkxaUlJwdDFHN3lPU2NISytyV0FG?=
 =?utf-8?B?TFptM3YxS1doWndpbDJBNkUyZWFSRi9Rak5iRXdnOHJtRXFOSlo0RFdhcHdv?=
 =?utf-8?B?UjFDNW1JYUpSN3RXbGJqUnVnS2g5L0R1NDBjZkpXMlljck9EbXJ5Znc4QjFr?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259fc0ed-fc48-4604-4309-08de3199cad3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:56:13.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InDUkJbfD4t1FTQKXGYWgFpS1lgPxU4/vZxxplnZ/SWOjycBWg9+UfDcV7/LhEte5GV5B/Wx2hYHx+X/YOfcwdzV3p2s4joVF8pB0FGM65U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10705



On 01.12.25 08:34, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>> Sent: Thursday, November 27, 2025 5:45 AM
>> To: Penny, Zheng <penny.zheng@amd.com>; xen-devel@lists.xenproject.org
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Jan Beulich <jbeulich@suse.com>;
>> Andrew Cooper <andrew.cooper3@citrix.com>; Roger Pau Monné
>> <roger.pau@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>; Juergen
>> Gross <jgross@suse.com>
>> Subject: Re: [PATCH v4 02/24] xen: consolidate cpuid library
>>
>>
>>
>> On 21.11.25 12:57, Penny Zheng wrote:
>>> There are some cpuid library functions only referenced in
>>> XEN_DOMCTL_get{,set}_cpu_policy-case, and shall be wrapped with
>>> CONFIG_MGMT_HYPERCALLS later, otherwise they will become unreachable
>>> when MGMT_HYPERCALLS=n, and hence violate Misra 2.1
>>> - x86_cpu_policy_clear_out_of_range_leaves
>>>     - zero_leaves
>>> - x86_cpuid_copy_to_buffer
>>>     - copy_leaf_to_buffer
>>> - x86_cpuid_copy_from_buffer
>>> We seperate these functions by moving other functions to a new file
>>> named cpuid-generic.c, and modify related Makefile-s to retain same behavior.
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> ---
>>> v3 -> v4:
>>> - new commit
>>> ---
>>>    tools/fuzz/cpu-policy/Makefile               |   2 +-
>>>    tools/fuzz/x86_instruction_emulator/Makefile |  10 +-
>>>    tools/libs/guest/Makefile.common             |   2 +-
>>>    tools/tests/cpu-policy/Makefile              |   2 +-
>>>    tools/tests/x86_emulator/Makefile            |   2 +-
>>>    xen/lib/x86/Makefile                         |   1 +
>>>    xen/lib/x86/cpuid-generic.c                  | 273 +++++++++++++++++++
>>>    xen/lib/x86/cpuid.c                          | 260 ------------------
>>>    8 files changed, 283 insertions(+), 269 deletions(-)
>>>    create mode 100644 xen/lib/x86/cpuid-generic.c
>>
>> It seems this patch is not required prerequisite, at least definitely not for Patch 3.
>>
> 
> It is the pre-requisite for commit " xen/x86: wrap x86-specific domctl-op with CONFIG_MGMT_HYPERCALLS ", We want to guard new cpuid.o with MGMT_HYPERCALLS there. Without the split, fwis, I could not think a better way to avoid functions like x86_cpuid_copy_to{,from}_buffer becoming unreachable when MGMT_HYPERCALLS=n.

I think, confusion here is that this patch:
- new
- placed before patch 3
which introduces false assumption that all patches after it are dependent  on it.
Effectively blocking possible merge of Patch 3, for example.

Could it be moved up in this series before patch you've mentioned?

> 
>> In general, i think it can be removed from this series and sent as follow up patch.

-- 
Best regards,
-grygorii


