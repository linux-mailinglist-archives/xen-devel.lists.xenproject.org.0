Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C414FC06769
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 15:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150307.1481503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCHjJ-0003v6-7D; Fri, 24 Oct 2025 13:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150307.1481503; Fri, 24 Oct 2025 13:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCHjJ-0003tf-43; Fri, 24 Oct 2025 13:21:17 +0000
Received: by outflank-mailman (input) for mailman id 1150307;
 Fri, 24 Oct 2025 13:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0w6I=5B=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vCHjI-0003tZ-Gp
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 13:21:16 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50a2cb43-b0dc-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 15:21:15 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 MN2PR03MB5101.namprd03.prod.outlook.com (2603:10b6:208:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 13:21:11 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 13:21:11 +0000
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
X-Inumbo-ID: 50a2cb43-b0dc-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZ4glljMiy2Th2S4qMLtIA8IebrIJAB0VTa/FmD1Fqksz3x1PQwtKXfk3xU9OlOjDtup61Mbti97jmBWPneotg+2GhjVkOmoFmKLtWYWmNkaii1KvzuJJzc6mU9tbvDEweuPA3S9da0HKHW4DLC5H5kmeiF+GikVbea/1BSec0GyL4rLvJjPwyxuu6iQ4Z8/toy57ZR+xLXhrPXCd1ssaM5x9K9BaIK5bjw1j35i5Td24K/cRjzwQXzc3ME78ZlQYeFya4O4+zRKL0cEL2YFA8vvu22tdndOJut8LgXUrxzN3yc3gGy7Q5f0JNUFsOshoIc0IYDAmyL9F4VMtuBoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1aorMdbM+F3PNBCtD6E5pOm7asDqKWtNCcTpurGV7w=;
 b=Jklz9XQIEeaQLh+LnA2KMIyxPeVBrKbe8gT/ZOTBesZG0Z6T5GtCm6+Xnd0EopytCMFN8GVTQ1oZ0gXRxHv6AjBXn0RVBpLfOEToK97O87RgVE0wJ7QWSCD+OWY5XPIn7zZ08uhe0IjoEtFDg+501pvXn28NMG1Exm1LAhJUgvDBbm/IbhTgo95em7PYqTfxL/Drn9lJK10gB0LLjT12hUHJMuRnWS/mUk/mvnOpRLcnw9uqgNEpSMLq2Pisy6hgS1hls4Aw0zo9CVh3Q3jvEhp5kPuGG/85ToPE8TzD5roCLgrDhYg9e1ibUilfGc+UWdkZBt+iKwvSv+N3nJPCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1aorMdbM+F3PNBCtD6E5pOm7asDqKWtNCcTpurGV7w=;
 b=MV6ga0AtzmbV6pT0RfGL8qobSFthut41i5lP6sxxn72sz43othGeCLQ1U1OkAyX7Bk9ZBewbGXfljpoaDOzsJls6W6eUJ9rSzTeam2KqmI1H/HkvNd0Id4BOvmxbeVdvFd4wLrK+yXlQ5B91bQCSlfoDSKZTkKvO0Xoiafoa900=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <57175ca3-81fe-4a24-b354-83eed11b413b@citrix.com>
Date: Fri, 24 Oct 2025 14:21:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Security Advisory 476 v1 (CVE-2025-58149) - Incorrect removal
 of permissions on PCI device unplug
To: Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <83f26924-64cf-4825-9a9c-8e212452ff47@vates.tech>
 <df6ca4cb-a764-48e6-b78f-3122ac587048@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <df6ca4cb-a764-48e6-b78f-3122ac587048@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0673.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::8) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|MN2PR03MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: c5fb7de1-c93a-4847-64c7-08de13003306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmNEZzlQUkRZdVpWMDZWdER6SDJ2TGZNM0d1cFlBaDJYTmJIenNEMStYUW1N?=
 =?utf-8?B?SHZBQ3cxWGZqY3V1TG5MbDUrVUJMbml3OFQ4OWMyNXhmeHhWMUIvVi9PcFdB?=
 =?utf-8?B?TDNzM2prNHl4aHUyd245UjlKakZReTQyUGJSVkJUZlhCQ1gzYzRhQlNxVlVK?=
 =?utf-8?B?WTBvaHYyMTVCR3R0ZXZNK2ZtVnYxVk5rdThTaklwV2xhc3VYQzNzeWxGQlRw?=
 =?utf-8?B?bE5ISnBiTTFJSk0wUTdMRmxhdThkc1YreDBzbXdVT3NSNGRCR1c5d3llUld0?=
 =?utf-8?B?Y2FaKzZINEZHNGJXYTBwd01UcVFDWHRBdmJOUHhXdU8zVXdVdnZTYVlsTTU0?=
 =?utf-8?B?UUlhWlY5UUNoVitDcjJ5SSsyVkV6Ris1UDc4ZGtsQktaY1krVWQwdGFDMUho?=
 =?utf-8?B?dHBvMnFmdDFTbzNTRnAyT1NZNWpOKzF2Mnp6VExlZ2wvNEdzZDJuWXhIenV1?=
 =?utf-8?B?QWo2Y3B4aFBpdXIxTzArQ2pIVkNSUkd3Z2FJODZFbG0wa25SRzFRZHZkMXhm?=
 =?utf-8?B?Y2E2UXZhYlMyeFB6c29OWG5McmNrZ0JlL2JpaktGNzF1emJMazhUTUY0VFE3?=
 =?utf-8?B?YzlwRDQ5eEc1QjdTTTcxQndtR1JUSEdQa2lBZHpBQUlLaUsyMVV1d01YRlpO?=
 =?utf-8?B?d2dxVHBIa0FrOVZBV3FmTUFmRWFmVDZjVFpwSGN5eURCYnNCSFJ0amFlWXRS?=
 =?utf-8?B?bGhzeTJXVi94STNlREZEZFBIeW9CbjdTU0laVUc2bHREQkZmenFobmF4azgz?=
 =?utf-8?B?bEZaVmVNRmpDY0hNWS9zUlRpRmFiZXIyWjh3d2ZPRHpHZlZaQUFHd3ZHSEp6?=
 =?utf-8?B?Z2VvblZjT0ZzVElxT29MbUhPNnVWSDdmZzArQ0Z0bEk5R0hLSWVOMzZBTkhS?=
 =?utf-8?B?MWd3TTBISlBTbWYzQ2hTSkJNcXRqNU1ZTFZDYzRXWWZWL2o5V29NREt5cnNN?=
 =?utf-8?B?UHkzVWQ2enFVWWZMZllEK1hLQVNyTlV1aktaY2ZZQVpheGwzQXd6Q3dyVzVX?=
 =?utf-8?B?NGJReVIySjNKSE1TakdFdUZMdk00V3ZIOStYckVMWE03eXIzUXBvOGpNbldl?=
 =?utf-8?B?WXYyb3REVUJEa1RZWmswdXVJWTE5MUNFOXRBQTB2Q01RTlZiVDdQdGdTUDZY?=
 =?utf-8?B?SFJYckdOYUd2ZWRkV09ic29vaDZrMTZ1UU9zSU94amNLTmRTOVVsbmM5aWpX?=
 =?utf-8?B?OFMwYWxGRFp5aDFEZUxWR25iNHJwUnVIdlVBWDNBL0pMTzhtSTU5cHJIL2tx?=
 =?utf-8?B?dXNFc05YTXRid1ZpZWlrS2pFMmo2aXpQcUo1enE1QzhHazdORTVndytOUFRR?=
 =?utf-8?B?Y0NOVnRmVGlTclFWbUFxcHc4ZGp0NFhpKzV4VHNTVUpENlUwcU40aFpqL0pH?=
 =?utf-8?B?SmVmZnRHUkNabEd6NGJBL0h1dTZoYlpidFRzZzFLWHhDNmlXV1BpdU8yNzJK?=
 =?utf-8?B?N3J1RWxUVzY1d09UU1lZYm5ZMGJnTmhzTzIzaDUvUHZRdFNMRnNQa3YxdXdT?=
 =?utf-8?B?WGZHMHVKU0hnUWFBMlh6VVU1dVBGdmdYcTZkL2orK20xaGhOSE9YTDFXYkJJ?=
 =?utf-8?B?S1QyWHBTYWVibjVVVmJTRDVucEJUbUVia0UzSzQrUnhrSnh4L0wyN1l3YVRB?=
 =?utf-8?B?Qy9oUFFhaGpoTWF5Ym5JNDJxTFY3Z3lHL1ZGb3Q4eHAxcFcxclRoajVjL3pJ?=
 =?utf-8?B?SGFBeDgxRXFMYjNjSFlFdHpabzAzWnBuSHB2V25NZ1BtRWpxLzMwVzZoRm55?=
 =?utf-8?B?QktkTGo3ZUc5VzNUTHluTTE1bWw4MEltMVgwdDBhdFJOYUtNOG5rRVhaQjhT?=
 =?utf-8?B?RFRuNjJtdHhZSUtKU3JnaElicFFjSHozWmgzQ0pPZ3pCdHBQcTJEUWhPemxo?=
 =?utf-8?B?anZwc2dvTk1kZURvNjQ5YUs4VllwQ0Z3VTNCb3BiQlhhNXlnT1F5V3JNSEVr?=
 =?utf-8?Q?tq2CNUoQy4GscEMde3jLjoF7BJNp20j1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTlQaTl4L29DczlOblhiMEJ0V1FVUkwrRjRsSGlFL2VVRmR6aXdua0xCTzAx?=
 =?utf-8?B?YVp1Q3ExQXJqdUxLZjRSTmRvQnhyR3hXOGU0TW0xUE5XWkVNNGtlNXE2MVBT?=
 =?utf-8?B?SnhkelJzamZ2N0pNUmlzZEs0cDZGK2RlemZrcWNJOFJpNGIrc3V1cFU5MDlB?=
 =?utf-8?B?YzVCMVlwaSsvUnVXRGRJT2xiRm1wWHhyTnV2dk5ZVVNwalBwTVdrbnh5S3Vu?=
 =?utf-8?B?empFOHFDQmdMaERFcmhyTmduS1NQYTB6dnNzS3BHZmN6MTY5S3dCdDhsOUJV?=
 =?utf-8?B?NWhJZHBmMkNiZGJOR1ZNWnVVMzZta3FoT0VacmxrMy9iM0FWTnpLM0trZUZU?=
 =?utf-8?B?ZmdxSTE4UEdjSXR0di9ZQUxXMGkwR2x3dEFud1kwemdyZ0JjcURiWS82YW1s?=
 =?utf-8?B?WU93d2lTMVVQdTU5UERMYTJHcTJKc2VjbEI0emJhcVR5dXdXK3VwTC9TVy9Y?=
 =?utf-8?B?dFd4a0VnSHpISVlWeHpJdTVCbmZEdGlRcTZHMlU0WkMrMS9XSmZiQkxUQ3Vl?=
 =?utf-8?B?K3ZOdGh1VlJlQUczRUZmTmRWZng2cVJNRVJ6MHBacGJvM0VnYTNMWWJnbVBa?=
 =?utf-8?B?bWpFYVgwamw0UlpBckJOMnZha2N5anVuUFZjNzBhbGRDV0JhZFRWWEhGUjVR?=
 =?utf-8?B?KzJ2VkZOVi9WYnNuSGIwRnI4YlcvemxHdEdmeVU2SytWbzB1MlBwaUhYZzNv?=
 =?utf-8?B?TTM4a1I5S3duZExUa3dtc2dwZ1plY3RxQmliK3ZzQnRpNkxXcDJwNkpXVXBi?=
 =?utf-8?B?SVJJYzhBRmZGQWdoOFpYeDV1M3dZLzJSTkdEZldpSUh2L0xYejFUQUlTSVNi?=
 =?utf-8?B?MkFTbWtiSHpPVnNJWnp6U05OQVNBWjBqTWRaSzdOM1ZKNDdJM0QzZ1RLdnZr?=
 =?utf-8?B?bkVsVjhPcG1YZFAyZm0yQjh1bXRxaWJvS05QQU1Sc043TzdmMDl6QUxxTlJr?=
 =?utf-8?B?Rm02NUN2YkdKTDdHU3Y3N1pITlVqZHZaeHBtRTI4MzVFT2JuQ0EreGhVMWFx?=
 =?utf-8?B?RkRqajB4NFVESlExRGJaVFJYK296Ry96b2cydUFpUHAwZnZ2SGVUSmliVHh6?=
 =?utf-8?B?eUtORUZ6UXRqcFlKb0xhS2E5SnVySW12RWpUMVQ1VUV2UDFzY01QUWx1QUs3?=
 =?utf-8?B?aGowWjNYQ2JlSnVRVlg5akJ4dmF3aHV0c3plMFNHOVFIclpFVDhqZ1Jhd2hw?=
 =?utf-8?B?eDdtb2dIVWRvY1pJZDNRSXdFSDcvSXpsRnVldDRLWnUxWUU1U2RvV3BFZDAz?=
 =?utf-8?B?R1YvMmlJUEtKZ2R3L2NyOU9pall1Nm5PUTFJNUg1Y2w2NTUvZTFkdWZuNFNp?=
 =?utf-8?B?bWZ5TFZOOTRPQ011WERmQ25OQTZDK2tzT2Y1YVVYYXNIVE53WFBmakRKdFhq?=
 =?utf-8?B?S0tVd2FIL0ZNZGp0Y3J1QTVhdXB2YlpENjlMN0kwOU8wbzBPRWJFV0o1emtt?=
 =?utf-8?B?UTZkUVdnM05XbUF2R2JnU3JVSXRiQzFwNTJxUXhwMzdBeHRwcjc1L3YwcDhJ?=
 =?utf-8?B?RnQ4UlZtaXBsRnNXZFIvajZjQnJ2ZnlKbXlaOHVRMDl1eW9xR2YwdDZ5QXE4?=
 =?utf-8?B?MTJaT3BLNXgvVlZjTGJFY2dQMEx5L2dVVGx2R2YxK1hrdzVwRXRPc3hvcTRj?=
 =?utf-8?B?KzZIWGFWSzQ5WDdFek1rcFlXYkU3a2E3UmRJcWh5RitSQUIyNUFtUGYxRHZN?=
 =?utf-8?B?TWl3TVlldWgwTEpCdjhJbG1BdjhzYnord0lRNmZadmhsSEtYZnlBb3pQb0Jr?=
 =?utf-8?B?WkJIVmFUOTVpcVYvZTROeE9kOUV0Q0VTbUM4VnBXaEFQRTRDTzlYZE9FNVlK?=
 =?utf-8?B?NGE5elhvcW1PUmp6L2FDQ0QrOHNTeERjMGxjaVJkek14TVQ5dis1L09yczg1?=
 =?utf-8?B?dnhWeHlCeDZxZlU4QkRuYzBIeHFaUGZJamU1eU9LdVM0eFplTVgra3FnUTI1?=
 =?utf-8?B?NkYxTEdCRUFTSjEwUkY0aVk0Wmh4blpyM2wyK1pBMUNwTUoyMmd3NzFJMzJv?=
 =?utf-8?B?VUtPK3dFT3NTMGgzN0VuVTRHOGVTaWRxRzNZdlBWcDBkZjZ2QWJ6QTBxdVE3?=
 =?utf-8?B?NzI1S0R0elcxUmY2OU1VTlArZUd3bmJzMVMrUW1GdXNvOGtJYWpTM0hzTXpz?=
 =?utf-8?B?YVdwYTE3K0xhYTZoR0pBUFJTa1pIaVdVa2RIam5UenRZa094anFXWmJuSEIv?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fb7de1-c93a-4847-64c7-08de13003306
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 13:21:11.2647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYpLYwv2Iw/6+yP7C39pd6YXdtg5Is97QZAPScoGHHW6Z7AiuIWukb/d1p74DVTrvjL1PkHM1YGHuwt2K4bBK6ZboG0J14+c+7JpSX5Ci8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5101

On 24/10/2025 1:54 pm, Teddy Astie wrote:
> Le 24/10/2025 à 14:14, Xen.org security team a écrit :
>>              Xen Security Advisory CVE-2025-58149 / XSA-476
>>
>>           Incorrect removal of permissions on PCI device unplug
>>
>> ISSUE DESCRIPTION
>> =================
>>
>> When passing through PCI devices, the detach logic in libxl won't remove
>> access permissions to any 64bit memory BARs the device might have.  As a
>> result a domain can still have access any 64bit memory BAR when such
>> device is no longer assigned to the domain.
>>
> It it exclusive to devices where bar is above 32-bits (which requires 
> things like Above 4G Decoding / Resizable BAR) or all devices are affected ?

The scanf() only gets the bottom 32 bits of the BAR address, and drops
the upper bits.

>
>> For PV domains the permission leak allows the domain itself to map the memory
>> in the page-tables.  For HVM it would require a compromised device model or
>> stubdomain to map the leaked memory into the HVM domain p2m.
>>
> Do HVM guests actually needs the device model to perform this ?

It's DOMCTL_memory_mapping which modifies the P2M.  An HVM guest would
need to get the device model to make this hypercall on it's behalf in a
non-standard way.

>
>> IMPACT
>> ======
>>
>> A buggy or malicious PV guest can access memory of PCI devices no longer
>> assigned to it.
>>
>> VULNERABLE SYSTEMS
>> ==================
>>
>> Xen versions 4.0 and newer are vulnerable.
>>
>> Only PV guests with PCI passthrough devices can leverage the vulnerability.
>>
>> Only domains whose PCI devices are managed by the libxl library are affected.
>> This includes the xl toolstack and xapi, which uses the xl toolstack when
>> dealing with PCI devices.
>>
> XAPI doesn't appears to have PCI hotplug facilities, so shouldn't be 
> able to trigger this vulnerability. Unless I missed something.

Xapi execs `xl pci-attach/detach`.

~Andrew

