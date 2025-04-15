Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D27EEA89C2D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953679.1348130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eQF-00015I-Fo; Tue, 15 Apr 2025 11:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953679.1348130; Tue, 15 Apr 2025 11:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eQF-00013S-DB; Tue, 15 Apr 2025 11:25:47 +0000
Received: by outflank-mailman (input) for mailman id 953679;
 Tue, 15 Apr 2025 11:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mbqe=XB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4eQD-00013M-Eq
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:25:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2415::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b512903-19ec-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 13:25:39 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB9398.namprd12.prod.outlook.com (2603:10b6:8:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Tue, 15 Apr
 2025 11:25:36 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 11:25:36 +0000
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
X-Inumbo-ID: 5b512903-19ec-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byfxC0yYTNv4oW9FmBGU9AVZE8dhZorAC6iMC0n1iekkrFqzZfnJeN+i7tMqpVJf9MgIBneKOb2SZwkEaCYYKmwX+pTrz1ZEWusGjtqEcrbrscmQo3+cDTP5S7cw08drWZpbrrTh/Tc4quVEMEIckr65Peg2qJI/XJZUWHC8V5zoDb9wOMP188WwgbWChJr3YtVhhyfl6KTEIffEWWC+oubvuDLsrAVKpdglMyD/q6sOYGICs5eAa4GGHDJtgw4JhLxYLNOYV2DTKrr6N9Xoay68oUvBeKu5KQjsLcI8e/wBAeMqcdDjJVdBJ/ZYaQ4TVhpm8A++EAiER6m9MS42/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aF0X0EOR7KbMeuIcbzNNJTOzpB6njaxE1Lpwg1TlxSs=;
 b=l73jRp5aC1mHlssdl9Yfl/1PjAX/EVSgajAsJwfeQ1OdbzFIlsRCIZpJt9B53BUwSCOnbgB4nNz5Y1eTftLgR59WLNazII0JiJksozkkg2BKyxP2p0Rlec2u90m5kBUJ5+28f2kOKsWtJLvmA6dhT+hC27Tjlz6aKVvjAIiIEpyCpfddma+9ia2tK3JM4SWS2+YgmLCPXd07ivdIfd/GjuLhOjf6IkolVAXH5OEk9Wjjz6tNRNRijPK7UemmUG9x5YFaMvUKzPIxvKIKWTuq9iTGRzl290jMblgTbMin/hJ2acKMevAA896HZdqDyK3fEz9u1vS/hnzXe+3HJ0vZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF0X0EOR7KbMeuIcbzNNJTOzpB6njaxE1Lpwg1TlxSs=;
 b=CPt2ZoCMfseGx2r8KgiVwK91zfy9tjUid/qRNH5CS7sP4aUUd2vVTVZqWV5rqiI2REC7Xhl1I5n3oZih/Jf3GyrFNG8uS0dXQAK+WCXmN84uanVOPyCcGP3KNDz2rSn0QC1O0ahBhJ5pWWTd7H6G/zqCx+8z2nza7sknu7tOb2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <105b0e9c-6991-445f-af36-6e76a916a15a@amd.com>
Date: Tue, 15 Apr 2025 13:25:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm/mpu: Implement setup_mpu for MPU system
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-8-luca.fancellu@arm.com>
 <923a2fc0-4eeb-4e09-a56d-7471a56fe3bf@xen.org>
 <4771188E-B307-4452-A900-2ACACC1CE333@arm.com>
 <fcacc6b6-ea4b-4917-ac46-5264ac3e4039@xen.org>
 <A053DC71-B301-4D64-8EDB-C225E2ED3FA7@arm.com>
 <9eec0359-e9e9-4d38-abc0-3cde6eb94e3b@xen.org>
 <0CED25FD-5706-420A-BDB7-EB36BB7FEE71@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0CED25FD-5706-420A-BDB7-EB36BB7FEE71@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 517b0357-3cc4-4f3a-2ae9-08dd7c103e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MExnTHMyYUhMVXVpVXovNDhadEZCYXM4MURZeGJRZzZBRnBuV1ZCTXYvcWE1?=
 =?utf-8?B?T05ZL0xRQjdKa1l5M3QyNTBMVC91ZHFISXdrQitWSUlaWmtuWEcxNGZDUHg5?=
 =?utf-8?B?d0NadENPd2N2TDRoclZ1amQ1SjBKM2cxS0dKOVdoVW1yNCtZc05ITFNhNzhk?=
 =?utf-8?B?VkYwTkNDT2RxbU15K0FxbkNSV0hheXVrTG9pVkVLS04rWG85WnFDNXlBbEJ5?=
 =?utf-8?B?ODFVWk1HdXA4R05xeUFqQzlKZytUMVY0YWlYM3pWcFhKWXdSWkhvd1dkV01j?=
 =?utf-8?B?bjc0c2pteVdvUUZQTUFNSCthWG5FSlo2MlVUajFMWWJRQ21tQm9DWUVvbDZh?=
 =?utf-8?B?cmVYWG94L01oQUc1MUl0QldGakVmaDNkRDlHZmlPVHRxclRUdDV4amg5aklX?=
 =?utf-8?B?QW1wQXRzRVFiOTR4Rk5tNkN2U00xc21nTE55YXdQTUdpRW5ZYmxWQ0IwZi9C?=
 =?utf-8?B?SGU5UzVRQWY4NVZ3KytjcU9QRWFMZDVSdFRpTXE0ME8xNjdxdHY1WmFMYnFi?=
 =?utf-8?B?SmM1WlZTSEw3dXdreW83ZXNZU2g5L2J4TTZTbm1Gc3N2aUZBbUM4eEFUNFNM?=
 =?utf-8?B?a3owUnVGQ2RnY2RmWlJ5SkZiTVRZdW8vaHdHbE5hOFo0SGRtY3dHUm1UMllP?=
 =?utf-8?B?K2JEMnVmR2UxVGRuU2VvNHN2U2VYZHZvRDFnY1NHd1JpRlNTUThJSGtTZDhs?=
 =?utf-8?B?L3EwbWlvWE8rcnhKcVhxcDVIQzNhY3R4dkx1QTc3TERPMVJxT2NKOTYrWmdk?=
 =?utf-8?B?RjJUb1dpbVgwRW41SnBkMzBrUklkRkgrV3RZZnZOUExrbVEvUkkxbFNTRXZl?=
 =?utf-8?B?ay9abkF0VTdReVRldnBEVzNyZDdtUk52RjJpd3BDcUhjeFhIWlJ5ODNxaTdZ?=
 =?utf-8?B?Y3ViWTU1QmtJaUpQWWpuTEs0WXFQb2N3cnRvMkpLaTFUWjQrOGdLRWloOURQ?=
 =?utf-8?B?VmhLTzJHNjJmdHkySXhoS2NQaFY4dEsxYTVETGZPWGJYOVFHSHBpUlIrY043?=
 =?utf-8?B?RDNGL0xVZE5FY0pWSURsZmpLdmFtVHNWUEhEalE4ak01RTQzQjBBZ3lQblpp?=
 =?utf-8?B?QndEWGxPNUhZQ3FKMWt0TlIrOWxoT1ZMZGxIRURnakNVamwzMjI3QlNFSldX?=
 =?utf-8?B?amZOelRLS1BoLys1L2xnaGxQVDN0djkzbk9jQkdtVzhEbzNGVENuNHY4azNp?=
 =?utf-8?B?WlRDN3Z1UDYzQTdYQkdGOUQvdUpEUTE4ajNaa2hLYUp0d3BGVDJGSGd3bG5J?=
 =?utf-8?B?QjZrNnJHZFN3Rk44ckpVRDM3azEwQzRzdjc4dzV5RGxPeDVyU0t6RTg3QVB0?=
 =?utf-8?B?UzcrTFhvRlp0YnRvZTgyR0hWSSttTWVjazhQZFRKRWdVbnEwbnlHUFNONHpD?=
 =?utf-8?B?V2gydk5jbFFhemlTREJnYVkvNjcvaVp0SFNncnJ2RnBEdzJFRkRCbVF0Z1l5?=
 =?utf-8?B?RGh1K3JNcjJvQmtBU1RyVkM2Mmttek1TTzd1akx4ZEZ0R3NSWDEwTjl4a3B6?=
 =?utf-8?B?UUppdE00SjZkcjg1c0lPQTRZK2Z6NitacmYzeE8wenBOdzc3Q3RjZjNxS3Ra?=
 =?utf-8?B?MG5Kb2RIWEVZU3Z0dCtadFFrRkw2c2ZURWllcFNtQWppK2UrY1V1RUIzV2Yx?=
 =?utf-8?B?VUR1MXEwRFArSzRJakdmbVJHd3R6ZTVQUHZmODIyUStiVnp2ZDR0M0g2Q3Bi?=
 =?utf-8?B?alN3cG1LdW9XQ3Bjc25UWVVqbXBkanFGWDBTZ2JHa2RDSzBaSXFoZnNXWUpz?=
 =?utf-8?B?L2NuOTdIQ1dHL2F2d1lHSDVDYVN4VEExZlpEOVE0SmJWQWh2M3NvaVZMQXgz?=
 =?utf-8?B?STdEa3BWRWh1S1ZELzd2V1pFL0ZXZ3BkZVA3b1BSVjZJQ2RhbXRKM0dzcUZz?=
 =?utf-8?B?WElpeGpiVDVXeU1rdFF5WWowdGk1dVdvWWcwNks2MHo0SFVjV1lJc0ordFk2?=
 =?utf-8?Q?LJpFMJ1bSAQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em9JNmVoVVY5cWhoU3N1bDZlMFp0WmtFUWdKWW5JRGhqNHY2aFpIUDRTYWhF?=
 =?utf-8?B?VGVVTUpoNyt0aTZnOVpzS1lCd3ZXQXR3aHVkSEN6RVZFU2dNMHduZTJ4dU9m?=
 =?utf-8?B?czNyWlVkcWplZEMrdnFnY3lJVEtzVk56L21KelF4aUhtTVErL3M2V3ZXM05p?=
 =?utf-8?B?dlZ2VkErTlBkeU9NU3c1Y0hoR2o4ZC9ZemxSVWx3TkY4ZXZKeEtxT01GZDRV?=
 =?utf-8?B?TmNIZHJ2ekthSjJmaXJPa0pKRjhsSlByRDJtT2l2dGlTWWRpOHJ0YjhqN0Fn?=
 =?utf-8?B?Y0t5bnZSZWpxc3Q2Y3BPMWU1YnBvbmwyQVVmREdOa3A5eno0RzZSMGdscFp4?=
 =?utf-8?B?M2ZZbkw1K1FOdjdJRlNveElWRnBEYi9HNkxxdFRkd1pLU2RzelpDUzhLWENC?=
 =?utf-8?B?d1lEREk1NitLWkZzY1dDVHZtSlh5alBERURFUmdSWExnUE5iUWlSNGhzMXhj?=
 =?utf-8?B?QVhBMVRRMi9scy9QYi8vbkF6NDM1YlUzT0tDUUtsa0JMVEIwTE05Q1VyVjl0?=
 =?utf-8?B?K0tDRG5VbE81ZFBlaDhod2FSS2hkV1RmN1JJd3FFMTJZc0dsV1dnSEg5dWhX?=
 =?utf-8?B?UjBuOE9UdzdnRDh4bk9XdSt0NGdNM2xHMGF2WkdMVER0dVFKT2lqL3k3ckpC?=
 =?utf-8?B?cTBQTjJDYVpTVm4ycjNuTGl3OTNoeUJVZ0tSRHByNnJqNXFlZm5ESjJJWC8v?=
 =?utf-8?B?VFE3OGQ3MFNvSlNPU1l3dXBOQ2xUK21YVVRTVW9Bd0NET0dKUjd5UWZxVWk4?=
 =?utf-8?B?UjQ2a0czTFhkUkNqVGEwUDUvYlZGeTNWMERzTHpsMGZ0NnFrNTNudDh2Q21u?=
 =?utf-8?B?OGNzeHRtQmM0NWNkOUlXaGZyMWxRNnZ5ck1QUWVzYWhGOHpNMlBERUIvcEdO?=
 =?utf-8?B?WXluYzNvLzVUTjdFODZIS2ZtTzAvR0t1L002TmIwYzhiVzRKZjd5cTZkR1Jh?=
 =?utf-8?B?Rm40KzB4anduTzJSMGdoT3B2TUVRYXJFckZXck9jVXVOSVJNZ1gyOW9NcU1Z?=
 =?utf-8?B?UWk2Qm1vWnVWekVycFhTclNVekdSVHY0aEtISnJqb21ab20za2N0UFQ1eWYr?=
 =?utf-8?B?YVdMM0JHb0lkTTI0cGF1K3NoNTQvbXdiRzVoNnU5cExKZFpJbjJxUGd1YnJB?=
 =?utf-8?B?dWFyMllwemhqbFNubXRMUUxrUlJXSjFHVWp1Z3hBWXNOVGUvQVF3UlcyWmxS?=
 =?utf-8?B?bVZyVThXWG92K1NkdkpVU2ZqcVdhZ1pjc0d4UitxdEdKMFl1WWg2Y2VhNmxa?=
 =?utf-8?B?MWxWYlBPN2h4RXNMTFNlRTM0aHdjTXNldmU4Nnl0TmtwV0k5dDlZN3FyR3lJ?=
 =?utf-8?B?a01POEJONnhkWUMxLyt4emZZYVB1T1ZjeE1kQ29kR2czMmt0akE4bmFsaGZD?=
 =?utf-8?B?eUJra3FTWHEwV1NkdGZRUDBXeEhxYnhyMFRQYnhLTWxRd3hOSzNFdEQxRTE2?=
 =?utf-8?B?Sm4zTzhEaDJXZDJPUHVlL1MyRU1PQ3Z3SmtXTkJVWWlTaExGdUFRcmFUcHZu?=
 =?utf-8?B?NHBwWE9JTi8vU0Q0RCtsTHg3akd6OVVyYzYzOUl6VVJUSFJoY2VNdkxFWWhI?=
 =?utf-8?B?OHNURVJDbXMzOGpzSm4rSWZuM1I2VTZhbmt6YzBLSFNyTGtsZm5xU0tkc1RX?=
 =?utf-8?B?Qlhma2RCYnd3NGNmNzVid1Vmc2N5R2ZCRTU0K3NNemxmQ1RoVzZvZ2ZqNWhp?=
 =?utf-8?B?dU9kaXRGVTh0OWUrN2pnWERDSTQrTFBXYVNkRWJnZ2J3cEl3b3FPTzd0ZThh?=
 =?utf-8?B?SERObStkeFhTSC96dkxJdzhaTG5STncwamw0V25iZWk5Y0FKYWdVbEU2YW5z?=
 =?utf-8?B?WFV6MjQ1MnNOOUVzZzU5OWR3N09SNUU2a1RzOFM1OGFaMktwM3Jkc3RxcG9k?=
 =?utf-8?B?c1VBaVJVblhlMmhkTVJVOWRIQTVTVnR2R2N4UWd6L0V6MnNpT0VYN2ZHNUFB?=
 =?utf-8?B?NTZUUmtzSjNuRWFkbkdVbnNacVdsQkJLSnErT0E0WURQYzJpdzJMZkRBZW9Y?=
 =?utf-8?B?SkFKQXlCNmdBb0xxeEYwaG13MWc3aXZSdmMvbVZpa0hIQjVJR0tMdkNZTlJZ?=
 =?utf-8?B?ZEp2MnJ5WTJKcG13YjI4bVlPa2RNZVE1M3pBME5CSDVuMXphVEt3WG5sM0o0?=
 =?utf-8?Q?I/lM911IjoIEiJ6sNtdyEkF1T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517b0357-3cc4-4f3a-2ae9-08dd7c103e40
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:25:36.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZL4WPKHvUIYrS9WEKf8s5FyVfJyuKjRA3f/C4kbbNoW9n87l9V/UHGRy8IN6OQS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9398



On 15/04/2025 13:10, Luca Fancellu wrote:
> Hi Julien,
> 
>> On 15 Apr 2025, at 11:20, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 15/04/2025 16:55, Luca Fancellu wrote:
>>> Hi Julien,
>>>>>>> +static void __init setup_mpu(void)
>>>>>>> +{
>>>>>>> +    register_t prenr;
>>>>>>> +    unsigned int i = 0;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * MPUIR_EL2.Region[0:7] identifies the number of regions supported by
>>>>>>> +     * the EL2 MPU.
>>>>>>> +     */
>>>>>>> +    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & NUM_MPU_REGIONS_MASK);
>>>>>>> +
>>>>>>> +    /* PRENR_EL2 has the N bit set if the N region is enabled, N < 32 */
>>>>>>> +    prenr = (READ_SYSREG(PRENR_EL2) & PRENR_MASK);
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Set the bitfield for regions enabled in assembly boot-time.
>>>>>>> +     * This code works under the assumption that the code in head.S has
>>>>>>> +     * allocated and enabled regions below 32 (N < 32).
>>>>>>> +
>>>>>> This is a bit fragile. I think it would be better if the bitmap is set by head.S as we add the regions. Same for ...
>>>>> So, I was trying to avoid that because in that case we need to place xen_mpumap out of the BSS and start
>>>>> manipulating the bitmap from asm, instead I was hoping to use the C code, I understand that if someone
>>>>> wants to have more than 31 region as boot region this might break, but it’s also a bit unlikely?
>>>>
>>>> The 31 is only part of the problem. The other problem is there is at least one other places in Xen (i.e. as early_fdt_map()) which will also create an entry in the MPU before setup_mm()/setup_mpu() is called. I am a bit concerned that the assumption is going to spread and yet we have no way to programmatically check if this will be broken.
>>> If we would like to find ways, we could check eventually for clashes on enabled MPU regions;
>>> so the only part where a region is created in the C world without the assistance of xen_mpumap is early_fdt_map(),
>>> asserts etc could be used in one or both setup_mpu and early_fdt_map to prevent breakage.
>>>>>
>>>> Furthermore, right now, you are hardcoding the slot used and updating the MPU. But if you had the bitmap updated, you could just look up for a free slot.
>>> of course, but still the early DTB map is temporary and it will be gone after boot, so it won’t impact much unless I’m
>>> missing something.
>>
>> It doesn't really matter whether the region is temporary or not. My concern is you are making assumption that are difficult to track (they are not documented where a developper would most likely look at).
>>
>> So if we still want to hardcode the value, then this should be documented in head.S and probably in a layout.h (or similar) so there is a single place where the MPU layout is described.
> 
> Sure, I’m fine with documenting everything, let’s see ...
> 
>>
>>>>
>>>>> So I was balancing the pros to manipulate everything from the C world against the cons (boot region > 31).
>>>>> Is it still your preferred way to handle everything from asm?
>>>>
>>>> Yes. I don't think the change in asm will be large and this would allow to remove other assumptions (like in the FDT mapping code).
>>> not large, but still something to be maintained, we will need arm64/arm32 code to set/clear bits on the bitmap
>>> (causing duplication with bitops.c), code to save things on the xen_mpumap, code to clean/invalidate dcache for the entries in xen_mpumap and finally we will need to keep the code aligned to the implementation of the bitmap
>>> (which is fairly stable, but still needs to be taken into account).
>>
>> I understand the changes and risks, but I still think this is the right approach. Let see what the other maintainers think.
> 
> what the other maintainers thinks about this one. 
I read the thread and my opinion is that we should do that in ASM even it if
means more code and possible duplication. From maintainer perspective this is
easier to handle than assumptions which are more error prone and difficult to
change in the future.

> 
>>
>>>>
>>>> As a side note, I noticed that the MPU entries are not cleared before we enable the MPU. Is there anything in the boot protocol that guarantee all the entries will be invalid? If not, then I think we need to clear the entries.
>>>>
>>>> Otherwise, your current logic doesn't work. That said, I think it would still be necessary even if we get rid of your logic because we don't know the content of the MPU entries.
>>> The PRLAR.EN bit resets to zero on a warm reset, so any region will be always disabled unless programmed, I thought it is enough.
>>
>> This is only telling me the state PRLAR.EN when the CPU is initially turn on. This doesn't tell me the value of the bit when jumping in Xen.
>>
>> I am making the difference because there might be another software running at EL2 before jumping into Xen (e.g. bootloader, or even a previous Xen if we were using Kexec) which could use the MPU.
>>
>> So I am looking for some details on how the expected state of the system when jumping to an OS/hypervisor. For a comparison, on the MMU side, we have the Linux arm64 Image protocol that will specific how
>> a bootloader needs to configure the system.
> 
> Ok I now understand the question, so I think we still could use the Linux arm64 Image protocol, but we will need to define what we expect for the MPU, is docs/misc/arm/booting.txt
> the right place for it? Shall we start a different thread?
Please start a new thread for documenting booting protocol for ARMv8-R.

~Michal


