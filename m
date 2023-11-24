Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23117F6EBE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 09:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640268.998286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RpG-00057y-26; Fri, 24 Nov 2023 08:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640268.998286; Fri, 24 Nov 2023 08:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6RpF-00056E-VF; Fri, 24 Nov 2023 08:46:13 +0000
Received: by outflank-mailman (input) for mailman id 640268;
 Fri, 24 Nov 2023 08:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r6RmO-0001P4-4r
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 08:43:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80d8be69-8aa5-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 09:43:13 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Fri, 24 Nov
 2023 08:43:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 08:43:11 +0000
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
X-Inumbo-ID: 80d8be69-8aa5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iu51CulISHlDiM2yC/3N3pNnlM6zF1YpR81rTU4ag695U0kaC1Ux+A6vNH7ghBqmxeLkfHJWnGBo+Td2X84IgEUJU1ZEpV4QkfvGyJb1pwT+4nS3Xw/PNhmzkcUrzEgEPFgOM9kUPCTtG2DxjFzMNU6fm2u0sTcybIL4wPajk7fK+WjkEUGfzkr5ES+8AZoVA/DS3teBGqbqUWcebbsFNo6QXrOe+OfuR3BH4stwSwtYDH0Orr43WGLzQ/Rbyc93ihoRU/PhVVOtg97AS37Z6699HELYZoLwj+yGpcQ72/8wReTJULZM7iXqotu8+1Co3boZhynhfc7O+UPu/TkpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii+zo1xobGN3wN/BEdb/rynTYs7jRTblTW/YlpNzeJY=;
 b=bjo3fac8oivXCVCYMLc+hyAuTyUMzAFv5FT1DPiNnD65FEnccZ9De0Kia1e53rThtxWMY1iIfHzkGey4sI786s8TkLRzBhPmikZmfF2xuQq83JGF/CD8sJO43NYGTAJFk7jM2Mf7LI7r5yw2S6u5mh/zOkkShfANJ784yIi6/oqlaYCLuR2ip/9BKVRjJ/fC+1Tjh6fDEHyWqLrCJiXjgTO7xHvzC+SXh9Y6Sz4ayoFjsSEWT2QQDOWzT60b5N4VKH9ftjT3X8aKWPxlr/XhR6INWniEeS+oHCF0umiieaXhVsWB4pUNFmnKvGwn/fr/69+0x+z5JN00zI1q4b5T8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ii+zo1xobGN3wN/BEdb/rynTYs7jRTblTW/YlpNzeJY=;
 b=0dptbUAJtUcfk5luLSqJX5vpriOlselL4lq7wRzGzBFjPjPwaLJi2ZFU9CBZw4cDAxag1WnXoTXhpELD9pywEn/4UfOoVgFDttlBhSX5l5+Ub83FPoHX3ooXOx3opjWoCbWq0KC5fxaKVFo9bvejE7QwIogMGzibXJ1z3it1IYG8Ug9AVaAvAYbDkLMWefiqyMhbFQTvmBER6bC4m1r87zpE0iQLIB0rUYXSvMTm/f9I9FJ17WvC4o32HyeSSxxndv6QwymiSmBS32az91qCp6/nYW5Xrpt8o4RJ/X7b1fZe+EmwkmxTb8oUxxAbQfbMf48nRgcbVQjQXWZ1V3WSRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4745e02e-b9b1-4381-b79b-f9ab63b81daf@suse.com>
Date: Fri, 24 Nov 2023 09:43:10 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 14/15] VMX: convert vmx_ept_vpid_cap
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
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
In-Reply-To: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 231ec47e-4f9f-4aa9-2352-08dbecc963f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MIuZl7woFkd2puIYIRvcWdqBU6AXyGeBdkwCyJ93LCh2xbNTgViP4aQtk3G1HKMEm0cMe/pqC9IdFSII9YBmFSOrJMV7TbJcRgTnhFZ+s3KOj0gcvdWleDKkwLYATpWYXNHukMeLXGvRbBkgDpRmXKWIaX+esTfZbLuHARedmKLERczl+XrpClvPa2c6zMDYHiO3tkzDfME2ob/aXZyKkUf0FLl+DdBH7X0Q/GOqT1cC67/XmS+6e54B9SUzGnKBhmqLb94BX0wfkZKIvI/U4/lM1vKlKXhul3O3Sl8/q710TGFUzwWWorcKSTJsNwlQrfFoUU7FqQtnrlcDiD3embB3bvOu3lGbwf3hzXwNKma34k/Rvgecw74ArC7hwuVj7uytRrxMN2Nyr0wtzVlswXqXyJc2j9JUuf51vPUTGUp2L8NSGGMOTSw2a0h+ONvaGwvWYOdaB7mwYpaASYe2h7oql9Xzp2nu8erO7QaSeBxULuyHLyxOsg4RT6UzeqFsbk6ap5Izx6GqeRDpsikFPB0uP6HhWUOI/VDvP3rWT6nu3bUcD5gFgdA1eXMehxJsHvqRsy1ychyRtdhMoxJloHMwLzGygMeSTn+Xh1eAkpqE+yIn/43GfDSjf+gD9ieH30+GawjO90DI+tdleCrvKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(2616005)(6512007)(8936002)(83380400001)(5660300002)(4326008)(8676002)(26005)(6506007)(66476007)(54906003)(66556008)(66946007)(316002)(6486002)(2906002)(6916009)(478600001)(31686004)(86362001)(31696002)(41300700001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEl0d1hNNUpjQ3hjdE1oSTlMNzFqQ0t2VGp4OFJxVWsrK0VIb3VyRGtDTkZk?=
 =?utf-8?B?SmZ3QjJueFljQitvTFptMktLZklBRDMwNUQ3RS96N1o1UmlvMUtxSXpVdU5o?=
 =?utf-8?B?MzlYc0g2YWFmNU9ZZzY1bXhXRHg1MjZ2YTFzOEJFY2RFL2FHMUNiZkZNd2Fj?=
 =?utf-8?B?cmI1TndZRCs3ZE1WM1ZLNGVHWjQ5NVFFY09KZUlRTlhLUlBxcEtyWDhTK0hD?=
 =?utf-8?B?LzNOeWR6VDJkTXgxK2ZhczJmUnBXeDFrenJnMks0UFhVbkZkYnRIMFlhQ1hk?=
 =?utf-8?B?SlcveFl6SC9iam1lZis0UkhaaGRkMFNkanZwUzlJYnJEZk5ISGY1L0FEZEhn?=
 =?utf-8?B?N29jZjl0WFJ4QTJyckhueWIraDR1Wi9hallQRTRYMUxUU2pyYVZDOHRrTHo3?=
 =?utf-8?B?dnVNSk1BeXlLRUkvNFdiWG9RNlRrWlJqam54bUJEN3FUNW44c240UEYxUlh4?=
 =?utf-8?B?dStwNzh2WVBKNmhoZUJRcXFIdHJVZm1iS0dYZFJVQU8rWmk5dEd3ZXltWlp6?=
 =?utf-8?B?Q05CODdqZlRRWlRiRmNOUHdodEdwejY1NkhvbmltUUZGS1hFOUpGalNCRVdT?=
 =?utf-8?B?eDhhVnJQNnB1eVRrdUZtb1BIaitZVHcyYlplb2ZUTmVFaG1xaklsU0ZURVdn?=
 =?utf-8?B?QWkwVTFhOERuay82NDhQa3BIZTFZSEhtY2tPOWIyUlVZRjFBQk5MZGEvZW01?=
 =?utf-8?B?dTFPY3paQXlvZnVTZmYzNTJQWi9qUnllRHQ2SzBUR0E5eFJVSUdCeVRQWDBn?=
 =?utf-8?B?bUo1azVJNmd5bk9jcDB6SndSbnp0b3FXMEF4enlqazlDVlJVWjkxdXg0ZDhi?=
 =?utf-8?B?V0xUc0YweDNKenpVVWZRdG1vbnN1MERjSTZVSDV0VElKQ2xvN2hEM2xQRU55?=
 =?utf-8?B?OStVRGdEMCtYM2RscXJOem9jdUM5elAxZmZLWHlxSTc1ZU9XWE9UVm1kR0dJ?=
 =?utf-8?B?NlZ5Wm5CaXgrRkpJaXNOdEZKUjVRSzdTK0MvZW42QUZzNUpCMWYrM0dvNVh5?=
 =?utf-8?B?TXptdXprbmF6OExFem1GQmsrVWsvWnMzNW1tbmt0SjN5WVhFZjRDNEM1bUI1?=
 =?utf-8?B?MGNwaGlLVTUrSEREMksvVDk3WnJlTjY1L1ZueHgrbHpYWHNaU1N4YW15MGcv?=
 =?utf-8?B?Z29PTDV4Qnc0UlBmZUlTWHVzUmVNL09KNUNiNUIrQlRlUjFjUzBVOWg5RXpI?=
 =?utf-8?B?QUM4ODRRQ3hsVmtFWVFreWlNRExEMUs5VDBjV1F5bVYvUjhpbTM2SmJndjRJ?=
 =?utf-8?B?cXg3d1VWeXp2S0lNc05YQ2o0UW04MHFtdko4WExHeVhVWVRIRW9GVitRTGJn?=
 =?utf-8?B?Nk1hT0pvb0ViNi9GdTBrVG1iaHhQMFpRdTNDYUsrT09YTUUzdjlVbGJJQWVG?=
 =?utf-8?B?Vk5IYTVCTzdPclNaeFhJY0RtamVlY2FNUlBuL2ZvbHlhTzVzK1h4b2RXeGxn?=
 =?utf-8?B?R25LSHl0a25WaXczcGYzSnVxeEhpcCtwSlFTQlB5T1JxY0lKTmYrdlRubUJ2?=
 =?utf-8?B?SnROWFd6V2ZSMkVMQmplMkQ0WjhjM0N0RWIyeGpaUEpOMndFa2IwUVRvbCtl?=
 =?utf-8?B?eU9SWmdiZVMzM0dkaEcwRGNWSTJjNFdIeUtmeEFwSEJmU1ZHcWdqWWZDZVMx?=
 =?utf-8?B?eWJXNFJyWDlWNG93cWdIMElScDFiek82OFprR0haYlNZeHUrOEJTWDZCeFVV?=
 =?utf-8?B?TGR3L2FaU2JsTWpEdlF5Rk93ekQ4M0hBVDJXT3hUdHBsdEJUdW1yNlU0dVlv?=
 =?utf-8?B?eXc3bkVhb01mME55TllDVW10NGpsUktJL3Q2QVJIc21LaGMyYTNMTGM4ZGdM?=
 =?utf-8?B?aVVWSDNtZEhFOTF1YkJEVlcxdzlRMkptU1ZITThTNnFuQWlNazh4bjNsSnVK?=
 =?utf-8?B?NCtYOHlOdEp3b3U1R2hhaEhMaU1NRy9vSElhcjR2TS9yd0dFMFhITm5MWWpv?=
 =?utf-8?B?d2w0WFIrT0ErbG91STFYYVVNMFBudkdYdWJhVGtJeGlaU3BOdjZCVlhkamY5?=
 =?utf-8?B?Sy8yTWtKM1J1KzNuV3ZkeFpDTkhTZ1hRYXlBalZDS3M1ak53dVNqMEFXZUo5?=
 =?utf-8?B?cFNuOGlkV2NKbW5VNnhqaGhQTFAxQ0kxanRHdWl4YmFPTDdBVE1PbWI4Mk5u?=
 =?utf-8?Q?JgrsRkPZer4Ws6qhWfQnbyusL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231ec47e-4f9f-4aa9-2352-08dbecc963f4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:43:11.3754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/rU9Py4OQNUqRmoruCpxOLtfE1VNkDV597Gmu6fxPURMD3PZ6DDZnfz+6XiU5PWkzPgBwRCitjmVxs41EiILw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438

... to fields in the capability/controls struct: Take the opportunity
and split the two halves into separate EPT and VPID fields.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -162,7 +162,6 @@ static int cf_check parse_ept_param_runt
 
 /* Dynamic (run-time adjusted) execution control flags. */
 struct vmx_caps __ro_after_init vmx_caps;
-u64 vmx_ept_vpid_cap __read_mostly;
 static uint64_t __read_mostly vmx_vmfunc;
 
 static DEFINE_PER_CPU_READ_MOSTLY(paddr_t, vmxon_region);
@@ -234,7 +233,6 @@ static int vmx_init_vmcs_config(bool bsp
 {
     u32 vmx_basic_msr_low, vmx_basic_msr_high, min, opt;
     struct vmx_caps caps;
-    u64 _vmx_ept_vpid_cap = 0;
     u64 _vmx_misc_cap = 0;
     u64 _vmx_vmfunc = 0;
     bool mismatch = false;
@@ -333,10 +331,10 @@ static int vmx_init_vmcs_config(bool bsp
     if ( caps.secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
                                         SECONDARY_EXEC_ENABLE_VPID) )
     {
-        rdmsrl(MSR_IA32_VMX_EPT_VPID_CAP, _vmx_ept_vpid_cap);
+        rdmsr(MSR_IA32_VMX_EPT_VPID_CAP, caps.ept, caps.vpid);
 
         if ( !opt_ept_ad )
-            _vmx_ept_vpid_cap &= ~VMX_EPT_AD_BIT;
+            caps.ept &= ~VMX_EPT_AD_BIT;
 
         /*
          * Additional sanity checking before using EPT:
@@ -349,9 +347,9 @@ static int vmx_init_vmcs_config(bool bsp
          *
          * Or we just don't use EPT.
          */
-        if ( !(_vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_WB) ||
-             !(_vmx_ept_vpid_cap & VMX_EPT_WALK_LENGTH_4_SUPPORTED) ||
-             !(_vmx_ept_vpid_cap & VMX_EPT_INVEPT_ALL_CONTEXT) )
+        if ( !(caps.ept & VMX_EPT_MEMORY_TYPE_WB) ||
+             !(caps.ept & VMX_EPT_WALK_LENGTH_4_SUPPORTED) ||
+             !(caps.ept & VMX_EPT_INVEPT_ALL_CONTEXT) )
             caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_EPT;
 
         /*
@@ -360,11 +358,11 @@ static int vmx_init_vmcs_config(bool bsp
          *
          * Or we just don't use VPID.
          */
-        if ( !(_vmx_ept_vpid_cap & VMX_VPID_INVVPID_ALL_CONTEXT) )
+        if ( !(caps.vpid & VMX_VPID_INVVPID_ALL_CONTEXT) )
             caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_VPID;
 
         /* EPT A/D bits is required for PML */
-        if ( !(_vmx_ept_vpid_cap & VMX_EPT_AD_BIT) )
+        if ( !(caps.ept & VMX_EPT_AD_BIT) )
             caps.secondary_exec_control &= ~SECONDARY_EXEC_ENABLE_PML;
     }
 
@@ -456,7 +454,6 @@ static int vmx_init_vmcs_config(bool bsp
     {
         /* First time through. */
         vmx_caps = caps;
-        vmx_ept_vpid_cap           = _vmx_ept_vpid_cap;
         vmx_caps.basic_msr = ((uint64_t)vmx_basic_msr_high << 32) |
                              vmx_basic_msr_low;
         vmx_vmfunc                 = _vmx_vmfunc;
@@ -494,9 +491,8 @@ static int vmx_init_vmcs_config(bool bsp
         mismatch |= cap_check(
             "VMEntry Control",
             vmx_caps.vmentry_control, caps.vmentry_control);
-        mismatch |= cap_check(
-            "EPT and VPID Capability",
-            vmx_ept_vpid_cap, _vmx_ept_vpid_cap);
+        mismatch |= cap_check("EPT Capability", vmx_caps.ept, caps.ept);
+        mismatch |= cap_check("VPID Capability", vmx_caps.vpid, caps.vpid);
         mismatch |= cap_check(
             "VMFUNC Capability",
             vmx_vmfunc, _vmx_vmfunc);
@@ -2157,7 +2153,6 @@ int __init vmx_vmcs_init(void)
          * Make sure all dependent features are off as well.
          */
         memset(&vmx_caps, 0, sizeof(vmx_caps));
-        vmx_ept_vpid_cap           = 0;
         vmx_vmfunc                 = 0;
     }
 
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -265,12 +265,11 @@ void vmx_vmcs_reload(struct vcpu *v);
 #define VMX_EPT_AD_BIT                                      0x00200000
 #define VMX_EPT_INVEPT_SINGLE_CONTEXT                       0x02000000
 #define VMX_EPT_INVEPT_ALL_CONTEXT                          0x04000000
-#define VMX_VPID_INVVPID_INSTRUCTION                     0x00100000000ULL
-#define VMX_VPID_INVVPID_INDIVIDUAL_ADDR                 0x10000000000ULL
-#define VMX_VPID_INVVPID_SINGLE_CONTEXT                  0x20000000000ULL
-#define VMX_VPID_INVVPID_ALL_CONTEXT                     0x40000000000ULL
-#define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000ULL
-extern u64 vmx_ept_vpid_cap;
+#define VMX_VPID_INVVPID_INSTRUCTION                        0x00000001
+#define VMX_VPID_INVVPID_INDIVIDUAL_ADDR                    0x00000100
+#define VMX_VPID_INVVPID_SINGLE_CONTEXT                     0x00000200
+#define VMX_VPID_INVVPID_ALL_CONTEXT                        0x00000400
+#define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL    0x00000800
 
 #define VMX_MISC_PROC_TRACE                     0x00004000
 #define VMX_MISC_CR3_TARGET                     0x01ff0000
@@ -286,6 +285,8 @@ struct vmx_caps {
     uint32_t secondary_exec_control;
     uint32_t vmexit_control;
     uint32_t vmentry_control;
+    uint32_t ept;
+    uint32_t vpid;
 };
 extern struct vmx_caps vmx_caps;
 
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -278,17 +278,17 @@ typedef union cr_access_qual {
 extern uint8_t posted_intr_vector;
 
 #define cpu_has_vmx_ept_exec_only_supported        \
-    (vmx_ept_vpid_cap & VMX_EPT_EXEC_ONLY_SUPPORTED)
+    (vmx_caps.ept & VMX_EPT_EXEC_ONLY_SUPPORTED)
 
 #define cpu_has_vmx_ept_wl4_supported           \
-    (vmx_ept_vpid_cap & VMX_EPT_WALK_LENGTH_4_SUPPORTED)
-#define cpu_has_vmx_ept_mt_uc (vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_UC)
-#define cpu_has_vmx_ept_mt_wb (vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_WB)
-#define cpu_has_vmx_ept_2mb   (vmx_ept_vpid_cap & VMX_EPT_SUPERPAGE_2MB)
-#define cpu_has_vmx_ept_1gb   (vmx_ept_vpid_cap & VMX_EPT_SUPERPAGE_1GB)
-#define cpu_has_vmx_ept_ad    (vmx_ept_vpid_cap & VMX_EPT_AD_BIT)
+    (vmx_caps.ept & VMX_EPT_WALK_LENGTH_4_SUPPORTED)
+#define cpu_has_vmx_ept_mt_uc (vmx_caps.ept & VMX_EPT_MEMORY_TYPE_UC)
+#define cpu_has_vmx_ept_mt_wb (vmx_caps.ept & VMX_EPT_MEMORY_TYPE_WB)
+#define cpu_has_vmx_ept_2mb   (vmx_caps.ept & VMX_EPT_SUPERPAGE_2MB)
+#define cpu_has_vmx_ept_1gb   (vmx_caps.ept & VMX_EPT_SUPERPAGE_1GB)
+#define cpu_has_vmx_ept_ad    (vmx_caps.ept & VMX_EPT_AD_BIT)
 #define cpu_has_vmx_ept_invept_single_context   \
-    (vmx_ept_vpid_cap & VMX_EPT_INVEPT_SINGLE_CONTEXT)
+    (vmx_caps.ept & VMX_EPT_INVEPT_SINGLE_CONTEXT)
 
 #define EPT_2MB_SHIFT     16
 #define EPT_1GB_SHIFT     17
@@ -299,11 +299,11 @@ extern uint8_t posted_intr_vector;
 #define INVEPT_ALL_CONTEXT      2
 
 #define cpu_has_vmx_vpid_invvpid_individual_addr                    \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
+    (vmx_caps.vpid & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
 #define cpu_has_vmx_vpid_invvpid_single_context                     \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT)
+    (vmx_caps.vpid & VMX_VPID_INVVPID_SINGLE_CONTEXT)
 #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
+    (vmx_caps.vpid & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL)
 
 #define INVVPID_INDIVIDUAL_ADDR                 0
 #define INVVPID_SINGLE_CONTEXT                  1


