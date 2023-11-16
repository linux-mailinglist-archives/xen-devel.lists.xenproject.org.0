Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69887EE195
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:33:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634219.989592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cUh-0007pS-W4; Thu, 16 Nov 2023 13:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634219.989592; Thu, 16 Nov 2023 13:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cUh-0007mZ-TA; Thu, 16 Nov 2023 13:33:19 +0000
Received: by outflank-mailman (input) for mailman id 634219;
 Thu, 16 Nov 2023 13:33:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3cUg-0007gH-80
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:33:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b36d4a09-8484-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 14:33:17 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9333.eurprd04.prod.outlook.com (2603:10a6:20b:4df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 13:33:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:33:15 +0000
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
X-Inumbo-ID: b36d4a09-8484-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkDe1RIdNRswCTdrjm+GYR/+oxTqJYeNxkhOTLBaQXolbrzvwG9hGkCotCChOuXNIH2iUB1QQgoKJh3mA/wJchnqXCd7ZUM7DDx57B+LwJGXXFs8yi1mfUSyLNP6/eZXLAUULaRJIQQOnbvCQ/wUtL7TBl2IwuSFpBW0/TyPhbtlViaj8p4+F+WHYtGtyF8pRavUxZdD9XwjiAmGa2PqXrxLvrufg9xDVZPcVhhRUgjwkChXwuE3G/Eqcwh378jN7B6BlPzKB9ZlcdKTK/+oWlrUjGEp31V1S24BzNE6nuY7mnKcABYuhlBZMMEgvmVQcKIC9f1XCrB7q9v9seIzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WstOM6kSQiRatyCSXLVmuSOk8VucCyz+eoVm0OagzGo=;
 b=mZCCYcaIwwn1Z8iwQwM95axqSycKoHemK9G1n/qPm2ZpQZdz7eq/WcRWB6dy+h0FBb4TdlXi15BDL8XJzp8Z3lZDKm4OgmdtZKkAq0LDukC26HE/I5cV8jMLoOZoiQghhYxlyFsfYDR5KevM/680161DWl3lnkGGfXtMXHG7801TR4pqjRkBT3J0yWHRvAkVhmjnEaL3b1lDfBd8GqmJvhbNM1PYqbYCjZIUIIi8jimyGrCze3YZP7ZdPKmdMvy/TDMGSPo/TsWMkHfzf17OfwlO6VniH8mvsGJcX8KxWnBNWL72/UH4MRD9be4gsW3Ro5eZN9BZT8ca/nKlm/Fh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WstOM6kSQiRatyCSXLVmuSOk8VucCyz+eoVm0OagzGo=;
 b=NT+pGiZ0cB+MS90Q0W/VOKgPbIAv1LMNovDqECPgp1kpYZliQmKSSUvLpl7ESNyiY00GznYJBEOqDkwhrHx3slq0q9ECRSHzsNKlUe6XVVuG4jf/Z4ueZvakcNJ71/DYo/XvuQnJSs6e+evkM61PzKufYa4Y9NbOQhATRV+o0+lfyB2n2jaLTKHRW/8ivWQjfbKhowjOB9Y6NDYkojYVIojPu9iIEt5oQDJQQ9/+OZNoWzFAwOfmABi7ywHOl79VY4N1SQlY6SdAc67jqeBQzmsUhSPCYrYDc76og7a2FK3rMBMMTDAdPOxvPNbICOv2Vm5mDi3pSxB0rK5n0ne/kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40585213-99ac-43b4-9432-03d739ec452c@suse.com>
Date: Thu, 16 Nov 2023 14:33:14 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/5] x86/HVM: improve CET-IBT pruning of ENDBR
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cd985f-33dc-4429-76d8-08dbe6a89658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eu00glJxmeQi9cLSD35JpcbhvJhDs+580y8xAE88diDNrkYLZRYcrOuRTSWWyhgW3xdwFwEH0k91TkItrnZj2wAxp2Bg1+eQR/QRJy/CVgygRLwF+JaCt5VvHt7l+2LoRkWvxx2/C19JZFQweGqOmPXeDcPaBcaHX01gNA43bK9H/CT5mTAPg0Xdf0fjk9+ik6mSKP1mE78jzRK45ZH1nvO4djBNk+QFfA0JUsJ0AmSZb7t5ERlRva1Zw5OIVticIp+j0sb0emvV6g4DqbPrT1AY1+ChXNr2HZfThV7esjZp3USlPcrRTxNT7qxw09RpibTwv8kVmmkfSzQMbLxg0HKZJ9aquG5ek9pxiUcjulOd4IjDq34yStK10CV15zDmA+wSCTpX1+RHx27IZ0NWkIQ6hWeQLy2hsDLz5YVWD/8pR40wqjRZeQxHixG5wbWqKqYM641W1jacwMyR9byH7BX4NLmFhgj0m2kYqRe1eXd1o/Mr5F6OCmDKeMo4BcNysiC2Do0L1O5Mh0m2EiJvmUWQAmDKQCi/EcWgP/ADgntSzyqG1KQFdMCjlbwm9+nA0I9drUkUEt4uK6+1RF57o3nHo4SGqhiMOlqpJ7O4W7vPUIOwM7mPSEuL7XCnu0RuMgl8I2kv0Z7TI5odlUohH7sGzwJPVwtSVu/Z8r5cbpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8676002)(86362001)(4326008)(8936002)(6506007)(31696002)(26005)(41300700001)(2616005)(2906002)(31686004)(66946007)(66556008)(5660300002)(6512007)(54906003)(6486002)(478600001)(66476007)(316002)(6916009)(83380400001)(38100700002)(36756003)(87944015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTRWbjBQRE93SWNOUlhuaVVmM0IwMERSa0ozYjlpNmhaUW5ZUVM2OG1JWFJD?=
 =?utf-8?B?dnJFSzh1WTJqWkRjbDR5OHpPT2pSM3hOcytuOTZXUW9Da3FyYmI5c3JlWnZB?=
 =?utf-8?B?S3FGdnVzVzcydFpLenRLTWF4ZU92Z09CakFCMzVDeTR1cnBYUXRMMDJPQ1Y1?=
 =?utf-8?B?WFZlL2pHM1hiaW9rVVBHNlBFdFBSSmN1MUtramw4OUR6OVBtSWpqZklXeXFw?=
 =?utf-8?B?OFE1VmtlbVR0YlorTU9PNTQ2d1FGOUMzNFZUOStzUWsyZElyS0hSb1lnYmxO?=
 =?utf-8?B?L0FhcjFCMGh3eTBtZDBCT050dGQ4cTlSa3JoN1BJZVhXZGpLT2RTUHNSRS96?=
 =?utf-8?B?MklNUlA4UUJNWnpzNGpoRklhSjY4akR0VlhEN0hVSXpBTkMvV2xWb0VMcmxJ?=
 =?utf-8?B?UXFKa1JTNndVRXJiWDRMREh4UjVQNzEzTGJsY3BwTzJJTG1MMXhJRDRXOVU4?=
 =?utf-8?B?b2owSzljdG83R3QrYnhvelp6V1c5MGdtUVpISmlDRVB5dmpDc3BMVm5LQ0J6?=
 =?utf-8?B?TFJaSy9ybEJubWlvWHN6dDJPTy95c1BpTjVwVUVoZGh0Y0QxVEtEK2JzeUNz?=
 =?utf-8?B?LzB4bUlDWFloUzkvUjhaN243RE51NkNTdW14aDg5V1Q3a1VRR2hmTTJtdUQ0?=
 =?utf-8?B?Um4yNkVmUEhQV0tYOUNGVVAzVW1PUHVxS0xyZmRkMXF6VGJtT2lreElvRmRp?=
 =?utf-8?B?WVg5M2RvQVY1OFZIc1MrL0lodExNSnhlOHg0ajVsTXcrWnhyekdzRkQrS01T?=
 =?utf-8?B?QkQwRi9URkpaZkU1QmQ2bXo2akhRc1pqUDAwUDNKRzYrUldpTWp0QndQNGdz?=
 =?utf-8?B?cnYwRTEwZG5iYVF6OXpNZk1kQXNCaFE0bFJaQ2lSWTBKSE51Zm1JZVNLYnRI?=
 =?utf-8?B?MEQxQUpld2xuYktDS3cwNWFKNVRqbzJnSVBmWE54OUw5eUtMQjVQamlHOTFs?=
 =?utf-8?B?RGszTHptMDJRNjlEdWhuRlp5VXRvbmYzTmJsVzZiZjBRd1cvdnViT2FZTGlv?=
 =?utf-8?B?NEhldmdzL1kxTThnN0U1dHRpcnZxSU1TaWRSZFVabmNab3VjdEZWY3ZqMWRp?=
 =?utf-8?B?YUJ4K2dZYTlNUWtqWWpiV1YvNUdUTEJDN21RU0tCVzdJeGh3elRDblRBbVZK?=
 =?utf-8?B?THM3eGl2b1U1MnFFUVo4aE80cFJzWnVGemZma2tlV0YxaGhKc3ozejdiVExw?=
 =?utf-8?B?L0dyYkl1UzQxb04yMVpNWkZFTjBGMjdNZStJTm1BK3IwMUxPS0h0RUd5Z0tj?=
 =?utf-8?B?UTdUOWZzb3dOZ1FKMHlaSmhXRURIU01EU0hCamV2YWVTNnkrSXJNQjhJQlRi?=
 =?utf-8?B?ZVFiNEVRbHhWY0pTeVZmTUxXRDRwQUxmUHJPYVFma3RlUzZUbkFyWVRML1Y5?=
 =?utf-8?B?WmZYNUFQMVU3cHFKbU5YR3l1Uzl3YUlWbzBPMUtvdStzZHpKUGJPZWVPdWJD?=
 =?utf-8?B?VHdPVjVnbTJNWjNyQStXamMxUTM1c2RORVpSZ2YxVE0zTlIxRUZnNnRKWXpk?=
 =?utf-8?B?akQ5aTFaZE1vR0tlQms3cXhxK2hEbWlYSFFDU1hRN1JZNU94RFZMeWZKNUhN?=
 =?utf-8?B?WEtqKzFuMGl6RlNMUnIwbE5sY2xYS3ZXcTRYcFRKT3gvWStjTUNYYzlGWWV3?=
 =?utf-8?B?T0EwOWRVVFNNQmQ0aDFqYjlpSERRblRnMnliR2dNdnVCMUFMdnNLMC9ZQ0ZJ?=
 =?utf-8?B?SXdtZjlzNVVXdG9ub3Q4RGZIYmNicG43QUwreFZTQjIzNCtndTNmMHA4MzZp?=
 =?utf-8?B?ekl3K21rcmV6K3RJYWFKeG9jMERuZ3BMUXBVMXk1cGlmVHdIbGFGVVl0ZjRF?=
 =?utf-8?B?TEUrN0tGTXM0RUhYZkhDdW8wYlFBU3NhM05xN2l2V1JFeU9SWDU4Qy8yM1Bt?=
 =?utf-8?B?V0RnYTk0QTZ5Q3FHV2F5WU9ldkFTUHBRc0ZIRkFYcjhnWUFsNmxDVmwrWlB4?=
 =?utf-8?B?TXgrbDhvdGg0VXJvUm1qQ0hCZGQrM3EwSUxXWmx6SVJiUk5KbjV2SE1TUmpk?=
 =?utf-8?B?MldFNCtCZnBySjRtbU9oaU8yOTZPc2pXV1Uxb1p6OFZCTThIL2JwYS9pdjBp?=
 =?utf-8?B?Y2ErUmNIanRTZVpaSXdRMGxqbVFlbW1zT1psVDVJZ2poRW5sNGtUV043UUVT?=
 =?utf-8?Q?erQnjB5WW0/+kq2crS7WDGPQl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cd985f-33dc-4429-76d8-08dbe6a89658
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:33:15.5907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFOGWneO+XVUD2GRqu3Xzq3X2q+wuyF4gKg7e+TmrfJmwX9Pmj9uj/DP+hf7l4kGJrTDywVs89/XArcsi1lNjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9333

__init{const,data}_cf_clobber can have an effect only for pointers
actually populated in the respective tables. While not the case for SVM
right now, VMX installs a number of pointers only under certain
conditions. Hence the respective functions would have their ENDBR purged
only when those conditions are met. Invoke "pruning" functions after
having copied the respective tables, for them to install any "missing"
pointers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is largely cosmetic for present hardware, which when supporting
CET-IBT likely also supports all of the advanced VMX features for which
hook pointers are installed conditionally. The only case this would make
a difference there is when use of respective features was suppressed via
command line option (where available). For future hooks it may end up
relevant even by default, and it also would be if AMD started supporting
CET-IBT; right now it matters only for .pi_update_irte, as iommu_intpost
continues to default to off.

Originally I had meant to put the SVM and VMX functions in presmp-
initcalls, but hvm/{svm,vmx}/built_in.o are linked into hvm/built_in.o
before hvm/hvm.o. And I don't think I want to fiddle with link order
here.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -161,10 +161,15 @@ static int __init cf_check hvm_enable(vo
     else if ( cpu_has_svm )
         fns = start_svm();
 
+    if ( fns )
+        hvm_funcs = *fns;
+
+    prune_vmx();
+    prune_svm();
+
     if ( fns == NULL )
         return 0;
 
-    hvm_funcs = *fns;
     hvm_enabled = 1;
 
     printk("HVM: %s enabled\n", fns->name);
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2587,6 +2587,19 @@ const struct hvm_function_table * __init
     return &svm_function_table;
 }
 
+void __init prune_svm(void)
+{
+    /*
+     * Now that svm_function_table was copied, populate all function pointers
+     * which may have been left at NULL, for __initdata_cf_clobber to have as
+     * much of an effect as possible.
+     */
+    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
+        return;
+
+    /* Nothing at present. */
+}
+
 void svm_vmexit_handler(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3032,6 +3032,30 @@ const struct hvm_function_table * __init
     return &vmx_function_table;
 }
 
+void __init prune_vmx(void)
+{
+    /*
+     * Now that vmx_function_table was copied, populate all function pointers
+     * which may have been left at NULL, for __initdata_cf_clobber to have as
+     * much of an effect as possible.
+     */
+    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
+        return;
+
+    vmx_function_table.set_descriptor_access_exiting =
+        vmx_set_descriptor_access_exiting;
+
+    vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
+    vmx_function_table.process_isr            = vmx_process_isr;
+    vmx_function_table.handle_eoi             = vmx_handle_eoi;
+
+    vmx_function_table.pi_update_irte = vmx_pi_update_irte;
+
+    vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
+    vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
+    vmx_function_table.test_pir            = vmx_test_pir;
+}
+
 /*
  * Not all cases receive valid value in the VM-exit instruction length field.
  * Callers must know what they're doing!
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -250,6 +250,9 @@ extern s8 hvm_port80_allowed;
 extern const struct hvm_function_table *start_svm(void);
 extern const struct hvm_function_table *start_vmx(void);
 
+void prune_svm(void);
+void prune_vmx(void);
+
 int hvm_domain_initialise(struct domain *d,
                           const struct xen_domctl_createdomain *config);
 void hvm_domain_relinquish_resources(struct domain *d);


