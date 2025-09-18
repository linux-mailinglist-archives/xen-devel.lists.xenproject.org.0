Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD8B857F1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 17:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126280.1467905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGLy-0007g2-HT; Thu, 18 Sep 2025 15:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126280.1467905; Thu, 18 Sep 2025 15:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGLy-0007eO-Ek; Thu, 18 Sep 2025 15:15:22 +0000
Received: by outflank-mailman (input) for mailman id 1126280;
 Thu, 18 Sep 2025 15:15:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R72V=35=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uzGLx-0007eI-39
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 15:15:21 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a48b4f1-94a2-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 17:15:20 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7773.eurprd03.prod.outlook.com (2603:10a6:20b:3dd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 15:15:18 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 15:15:18 +0000
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
X-Inumbo-ID: 4a48b4f1-94a2-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnxeLItOndXax13X+mAN83c9IWa0sjSTKmV37GYCpJjePwsUg8P+Z8j4MTFz8shfksuSxDLLF95UKntm/odtu6jK8EnQjDkp8/0sQiNY8zRO/fDi4QfQaDdGnyBiufDpuZsd++tUPZUiDJsmfNSYVSEw9dX7IUUsLfXmGDECc4GVdP1viI+7S/IvdU+q71ovS99CUlPSM6wKi1grHINN9AYKsy6h9FW4Cy2OIERxz12N9Ypq2GxGkMgwoPtd/O/IaIFnPK8Nwzi4nKaIFTegipXkTSb3F/YbCT05ka89IUdhA1tmN0+eaKfeTfy9hsTvfZL/Fp2BLlnCHGeOkozLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9IKaySqEZNszjYaZA+LnvfR+srgpuX3xSpmqyX04M0=;
 b=MkIbJwZjMMBxCTPddb5uQ+nhiQ1G7XekKfQ17yqqIFew8zI6Gnn83oq95cz+RRbprhiRcz/GrJH1SILnUNd1qpq1NXUJ0QiT+63EdKvcARdsXzTPqutfXt71F4wP4ikmMk7XrT2jCLXgLhN9FTdMIFJooDAWQBOaNiyQDwBM8HfRyePo5fC6VKvJ61Cb39pASTSNQ5Tv5a1+wESjXWlGLGztBp3RnisF1uhg81gL+r5tuQ4yc3BAgcuqpCD6WCfoAucL9sJfQhEzVxXKBr8BE2GqwVxfA+V2ewr6T95Wlv1rZIy82uq3YIuMPmYWBWTv9Hi2bM0YCcJX0gBvQzZsAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9IKaySqEZNszjYaZA+LnvfR+srgpuX3xSpmqyX04M0=;
 b=HQrN3bQVL5E4PsjK6k0I3jNtPSnyJ8XsYRIttaUlkuGeBdYptnayZahX9zh4zZ8wfppqk+O7869ufdfwaL1LN8H7Gf9RDFfy7gZ3etF4EYUsjhzvHR4tUs6GjsRfWYVcvOlWDAwTVnbbeKwwpKGrVNBNAdfJSSKhGPK6ij5m6012h2ZN2jzEhymS/oMVAWhfGDRo/k+bNJA2o2bQoaXnM8vI+XPcgOieJFk0b/gUF++cc9ueyHg40lUrl2Is8dWATyqVLBW7yod9TDhqwG2HQxHLdRcMy1+hKLBzcChTgu188BoNrxVaxZXnY4zPjkCoAcvdfaw8Y4iBsELzibzp+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d6df84f5-862b-48af-8dea-3e15c029c433@epam.com>
Date: Thu, 18 Sep 2025 18:15:16 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] x86: make Viridian support optional
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250916134114.2214104-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20250916134114.2214104-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0446.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM9PR03MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: dc11afcd-73b8-441b-d4c7-08ddf6c62d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnQvRkNYWDY4U3Zxc1QxWjM4dmxoMXNhaFd4cjVmekI5S1hGT3BYcGRlMlUr?=
 =?utf-8?B?K1FadGU0WmNVd01FcjJOV3ZDczlnQ1crMU82ZUk5ajNvODBEeWFzakZ2TlZ0?=
 =?utf-8?B?TGRJVFJRV2UzN2xNVzl2L29kbWxOY3Y2ckd4cE40R2NjUm1JVHRrQTFIMlBG?=
 =?utf-8?B?UHF2UituMzhjUFhrYmxBLy95ZHdmeUc4dTNBZHVwVmZwTTg0U0tqdzg4ZTRB?=
 =?utf-8?B?ODlzcWVsTlkwWmhHTUczQ09vNjhZZUludndJcVN4N3VGMjRNM0tEaU9tOW16?=
 =?utf-8?B?ck11bkE1WEhLV2wzQmJyOTZxVXRQMXpDWjJ6MVlXc25lV3RRZ1hEd2VFUDJt?=
 =?utf-8?B?YnV0a1YyOHh0RGdUdWJxRlVnVHh5Tkp1ZTc1VUFUQjM3QUpWVWxNWHdORmdz?=
 =?utf-8?B?OC9LUXFIZmlrYXpVVEVCYWcxdTRlN0NLTDBORStRTURHV1YycFFnY0hkSnFH?=
 =?utf-8?B?am9RN0tnVGZPZDhyQVJyN1pCc2NEZ1JySWdXRjZrYWNBdmI4dGg4OENqdXpQ?=
 =?utf-8?B?Ukl4a0JQVkZta0ZYQVlGbTJnaWZobmtXQW1pcThSYkpOUzJlMzZhSEczcXl3?=
 =?utf-8?B?SGhldTdDMmw2ZEVaYTNVeEtydGVyTzJBZXpFNkNyNFJJZmlqekJaUXhTT3g0?=
 =?utf-8?B?Uzk5aXphWWlURENXWkUrQ2lFM2RIWnhwU1ZXK1NVSDRHLzh5VklZU2ZlMWdT?=
 =?utf-8?B?dDhDV2lSOVRCWWJnOFJHV0JnaUpCQkNlb1pVN2loNXRaRGNzenFUQXgrVUwv?=
 =?utf-8?B?TEJWK0JJMkY1L2NEVWFlYUptV2NMSVdVVGczYzBRL2szVnVCd2VXM3Q3b09L?=
 =?utf-8?B?algvUVk3V1d3NTlicVNEa1B5ZURiQkFvdHVzVVVKUjNidEt5Z3ZiVVUrem84?=
 =?utf-8?B?MkQ1ZGRPY1VqNUhJOUFkaVhSNlhIUks3VEtRQVZpSnBCTjVrQW56bk5CUW9S?=
 =?utf-8?B?eW95SkU5Y3c5UDUrTnYzKzhsQ3RsSUdwbFFPRkV2bGtvaVVrQ0d2QlNDLzVF?=
 =?utf-8?B?WDhnQVRtZFV6aFh5bE5Wb09LcysyakNPY3ZlZ1RJM2NKaVE4ZkYzWmdwdmdN?=
 =?utf-8?B?VzFwckRNcWNhQ3ZlNG00aGp5TnptZ3pUcjArdVBwTkhoSUwyM0tPWExjYnlS?=
 =?utf-8?B?OWVBKzZYUjdVWXVqWVdRMFJueUk0MnBIUXR2Z3lHOU4yRitaQVpMcHEvd1ZH?=
 =?utf-8?B?Sk1VN1BudVpXU3M4NUNXYUt1eTY2YjFkdlNrczV5anNyVDNyR0JVeTJwU05K?=
 =?utf-8?B?eExucEJndE1uMU8xdHMwLzVUTGYxWG41MUw1UWpsWjJuMTRscEptRU1KdlR2?=
 =?utf-8?B?c2Z1UXJEek0xU0R6OUhwd0p2TUNYejlrTTJBWC9QektnVythWkRnejFlV0E4?=
 =?utf-8?B?VFdhSlB5TDIrUDRCM1JZVklDbmJnQ21PcG1XQVEyWnRobTBBZEx3Vm1iSVVy?=
 =?utf-8?B?OVJ2UWgrNnBQaG9CQXBMN2xZelI5M3dQenhMa09DVDZpdEFyM1pleldMejVo?=
 =?utf-8?B?NGZrUVNQY3FWQUJDcndwWUk5Z0ZscmVkQ2NvalFaQkd5R3BwT29SRnFkR2xx?=
 =?utf-8?B?amZBYXI0VmMwbFhUT3pYYWhTQWh6TllpYWgrNE5qc29oRko3YzRQOXlpN2Za?=
 =?utf-8?B?eFYreDB1MG8vdDRyTWhYRVIvTmZZUkhPRmh1MDFXNEgwUzR4Rm02Z2lHaWc1?=
 =?utf-8?B?d2xPOHBvclUycGlEdk5LS09HYktleCtWanlqWk40STF2d2xKNlVMV1ZuMk4x?=
 =?utf-8?B?ZlRFcERGVzdWOUk1a0hWTTR2MzRrZ1NVUXlGOFIxMjdPVEFBQmh6bWlWR0Y5?=
 =?utf-8?B?bE1SWWpBWC9aM3loald5TjBkQ0pyait4d2ZTRlJCUmlMTFBjbHZFbGJGWlQ3?=
 =?utf-8?B?YjRQSVVTU1JpYXlpQVZRRnRrbzczS0lsZmVsS1FFelBpdlZPK3dwTTRKbkE0?=
 =?utf-8?Q?L5RRVGCOA5s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpnSjRwTFhsYW1OeGM4Y29ML3Q4ajlxQjVkWlVsWkQ0d1NoVUc1MUVseTJ2?=
 =?utf-8?B?R3R0UHN4Z3cremc1dTF6dzlwMTB2RFE3Vi9QSXRYdVM0NHlzSnlxWEY0cExM?=
 =?utf-8?B?SGMreTBHcFRzUFVsb1dkSFlsRURXc3FIVnNnL21mMGFXL3FBL3FhYVJ5bjJM?=
 =?utf-8?B?S1lFeERuczFvVUt0YWRmbUZhVkhVZWMzWlcxU1lXRmM2Y2xmbVZRem8wbE5Z?=
 =?utf-8?B?THhTQWZTQkwwV2pBUlBjeEVYcmFnOUl3YlNmajI2RzJGZGtPSEpZcy9MdFJq?=
 =?utf-8?B?dExJeU5yL29tUUpZQUcyOFIvRWZWcGdCRUhPckI3ZytnVEc2dm0vQVFWUS9U?=
 =?utf-8?B?eTZvY2FvUzZ5NThOZGxBeCtqN253M2t1bDl0RjFiay9hdS9RUTk1aHkrbFlo?=
 =?utf-8?B?LzhLWVFOOXIwUVcxRDErRzlrMzArNXFtcXp4Q3dzN2NBTVlLRStaNk1aNisw?=
 =?utf-8?B?elFJWHBiWjE5R3g5QjhhMHg5SnhHdGxJb09UTG5rUGdITjY1MWR2NmRqenhM?=
 =?utf-8?B?Y294dzJlaC9FV0M4Tm13a0JwSGpVeDc4eUFCTFdaZjJObUJ6OUFpK3IwaWJv?=
 =?utf-8?B?enhpVFp6ckVPOFo2QTVBNm9aemMwM3NtV2xNUVB0WFVGazhQbkwxdWlwRHFX?=
 =?utf-8?B?S1BVQklzZFhMUUpqamRWdTJYR3IrRVpyWlFxUjlPZEpLRkE0NW9ONHRaelJY?=
 =?utf-8?B?YllCTUs3SitxRkdrMFc1UnZQN3l3MlloYlNoN1hYUzMxTUxDdVhHZktraUVs?=
 =?utf-8?B?RnhzRzFHN0NaRE41TXhTSnYvQU5YL1ArL2JBbE95Vjd1ZnpBQ2ZxQWtOOWsx?=
 =?utf-8?B?dEh6Ukxnazk5V1RMTUI5NjlwOEs2UG91N0tRM0QyQmlHTmxkTmVWc2hlV3My?=
 =?utf-8?B?U3BtaE1MOVJxMlVBVldxYVY3MlZoTUVxUCtNSUt6M3dOREo5bWNNMHo1QlFG?=
 =?utf-8?B?aFlpS3M4NHNLVVhHL0ZwQlB3am9na1l1NFVTSm9YNEZQK1plVGNZQS9Eclhi?=
 =?utf-8?B?ekNGZXBXNWpKenhFbytwdDFGK2RYMmdNVk5aeFRYN01aNXZuMVRBL01RdFFS?=
 =?utf-8?B?VVljSU9VbmJyK1FkcGF2UmduUktNMTY0ZktFZmlIUzBGaGdHVXJyL2VsMC83?=
 =?utf-8?B?cHNGYmcrTXFtK2kreW9TbHJ6QVdub1ppOTJzVFBEelZxcXNLdDBmenQ3a2lZ?=
 =?utf-8?B?bDF6NXlrNHM2MUhiY013Z2hWM0wvQmRDekhDaW1xVmdYaXhrMGF4ZGRiZDVP?=
 =?utf-8?B?eHhuaktBMEJkdE9peDd5M2VWTlN5MG1nVWJvVXNORytYQmVPbnR4amNINWFT?=
 =?utf-8?B?UEZRUk16TCtJeXdVcEcvRGxhZHhXY0poU2lTcGVFR1I0M01RckVvdmcyeWFw?=
 =?utf-8?B?c0l2Z2FZMXFXRFRzQWN0TGNpU01nTVNZK3FUUU0yWjlBbVlWcmUwTVJTVE9z?=
 =?utf-8?B?SVUzQUR6ZTRJcDcyV0R6SmRMeU1KZVdkbkxNT3BrTlNPejVyYkYzbWQwbG4v?=
 =?utf-8?B?amQ3QlFlOUpwek02Mk1pSmlRZDBOa1d4aWpmYTFBOHRIMEV4QTdVSzZTK0ho?=
 =?utf-8?B?L0xsOTdVSmtNMFZza2ZZMDBnOFdVdVF5NDQxRFJoQ3FDaExiUjVqcXhQeEJR?=
 =?utf-8?B?cEYyeXZ4aVJod2pWNjl3bzgzRFhuYVN0TFJST0JzY1lBSFBIWWszUVI5Q05j?=
 =?utf-8?B?L3NqSmZhVzJnQVMzeTVzTldXcGtqM0ZZMUZLNWQxdTh5eVJ0ZzNQWk5yaUM4?=
 =?utf-8?B?WGNVRmtHUWllTUVxRXlFQ3FvcGUveWVrbUtzd3FUbk84VzV1bHB1QWlZUXdX?=
 =?utf-8?B?VXZKRU9MR2pLbXZONHF6V2IzdkhDRWNFV0sxaTlrK0krWkZBSGFaWll1UHNu?=
 =?utf-8?B?aEF6QUZmTTB5UkZkR0dLa0VNTEdXTG40NjZUY2FRZE1FWmJHMXU4SzJxVWtv?=
 =?utf-8?B?cWlYSkNiSUxZOFFYY3QwY2ZOYk9NQnJ2RFV5eEVKVUZuK0J2NUU4b1F4MmpD?=
 =?utf-8?B?RGpDeEtSdVdWWjFCbGFxV3NvYjV1ditGUHlxYlRaZ3BGb3RGU3lzdjFwUi9a?=
 =?utf-8?B?bng0UWZ6dHU4MStreFZrdjhGYXNNVytJMndxQTBOS2E3VHIxTGlabndINDZS?=
 =?utf-8?B?M2ZoTzJUK0Z0bW9YQTBwV1dhOTlKbUtpRlFGejh5K3BBd1NRdnNvQ2lISm9D?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc11afcd-73b8-441b-d4c7-08ddf6c62d5d
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 15:15:18.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9w4DZvfYvyaY/Tp1Sb94oeyJtEGZt9TAIyMxJrBLLGi4cljngOIPcOyItEM7UeVbM24uCwYBK3thrRkpMDZOJyyy7eAAQdWocEazmeRP3iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7773

Hi All,

On 16.09.25 16:41, Grygorii Strashko wrote:
> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Add config option HVM_VIRIDIAN that covers viridian code within HVM.
> Calls to viridian functions guarded by is_viridian_domain() and related macros.
> Having this option may be beneficial by reducing code footprint for systems
> that are not using Hyper-V.
> 
> [grygorii_strashko@epam.com: fixed NULL pointer deref in
> viridian_save_domain_ctxt()]
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v3:
> - fixed NULL pointer deref in viridian_save_domain_ctxt() reported for v2,
>    which caused v2 revert by commit 1fffcf10cd71 ("Revert "x86: make Viridian
>    support optional"")
> 
> v2: https://patchwork.kernel.org/project/xen-devel/patch/20250321092633.3982645-1-Sergiy_Kibrik@epam.com/
> 
>   xen/arch/x86/hvm/Kconfig              | 10 ++++++++++
>   xen/arch/x86/hvm/Makefile             |  2 +-
>   xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
>   xen/arch/x86/hvm/viridian/viridian.c  |  8 ++++----
>   xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
>   xen/arch/x86/include/asm/hvm/domain.h |  2 ++
>   xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
>   xen/arch/x86/include/asm/hvm/vcpu.h   |  2 ++
>   8 files changed, 46 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index 5cb9f2904255..cf2726ef6bc3 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -62,6 +62,16 @@ config ALTP2M
>   
>   	  If unsure, stay with defaults.
>   
> +config HVM_VIRIDIAN
> +	bool "Hyper-V enlightenments for guests" if EXPERT
> +	default y
> +	help
> +	  Support optimizations for Hyper-V guests such as faster hypercalls,
> +	  efficient timer and interrupt handling, and enhanced paravirtualized
> +	  I/O. This is to improve performance and compatibility of Windows VMs.
> +
> +	  If unsure, say Y.
> +

Actually there is a question for x86 Experts -
Does it make sense to have HVM_VIRIDIAN enabled without enabled AMD_SVM/INTEL_VMX Virtualization extensions?

-- 
Best regards,
-grygorii


