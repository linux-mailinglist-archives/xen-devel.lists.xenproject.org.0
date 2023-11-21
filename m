Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FDC7F2880
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:16:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637596.993530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Mrd-0005B4-KP; Tue, 21 Nov 2023 09:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637596.993530; Tue, 21 Nov 2023 09:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Mrd-00057u-Go; Tue, 21 Nov 2023 09:16:13 +0000
Received: by outflank-mailman (input) for mailman id 637596;
 Tue, 21 Nov 2023 09:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5Mrb-00057o-OW
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:16:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9beca89f-884e-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 10:16:10 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8919.eurprd04.prod.outlook.com (2603:10a6:10:2e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 09:16:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 09:16:07 +0000
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
X-Inumbo-ID: 9beca89f-884e-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dY4UlhtETJ1S3LnIGN6i24XBJh+8UZIzulqqYdtvX8y8sFBdsIAyXZVe0+K25A2+dyYTRpIuZtcpqYFbH3N3/1mxRyMD3I/PFyheabjT3bq0DCfsPsKlU7bPWwRkFpzTkiWRJHLGJe4BfLqO57cGOeRGJCTCKVDwNpW4bn/JewXPj9mYNCCTAcI+wrkSziWzeHbxnxJz1a91FnNPA/kGwFbAXXRtn5BXOpvjZ3bVIat9wISpH1IAEhGVuMwbb3cXpdwp5K2bPZr7BoHCyeYso/24O5MyRZD9faWr6ymZgAsRoNm9E7iJytmaVkMB6cwNzZescZTIY37rcEE1yguTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E1Rie20joB8kbv7MDueDirxr1Pd6jAGY4z4G6Jd23U=;
 b=fVkafofqpP9XF2F3nHHxjNN7Iqn99rC2FOM5NdQx3vPBUCOzKt9aA7TwNNiPBYCA7LtenYgwC24by/BpwKqUSWS1sa4X3cwpaJJ2qZSHO0Y6haFvzSAodTg2FEYZJoUIOKrBlOXcq6TDoPfO/CB/rqFWtjyRc/UR9aCYUYX7w4MeRZS/j2BEa2AuiLmtx2HFHisfQ0v510MAOFWD7xKzSiGXiNK+vtdQN3r0nlYnG0F2nRahF7klHZyEp0iju7Gt5ZT1YjFX1u/zumfZbZNyY4PM5OCLBrZ1ddIObiOZeuRmPi3OktcZqsz+SE3a51l9wbu/zWGxbgL4rjFtteNUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E1Rie20joB8kbv7MDueDirxr1Pd6jAGY4z4G6Jd23U=;
 b=micmiNY6nhwuTymhkGFdFB/0laei6wpODcnxGQUl58SsMX7MXPbg5s8wiBcKdK+3qkKjUEdwByr55vyw6MOJQNasRxIHFVJvox/JelvmltV74wEVEg55B/EEoBc4iydWSmpP+je127irOJECf2kvXA9ekdhHC1TRb0UOMZo4gExQVcH+po9CPcuwCDRpQbe9Zqu81yE/mk4YnIZ57xv6++dMlpbJWiXrLXoL82NetTBgxBKxHTSlHs7SIfYehTVfgBTjZn/fGNzufYVUIiYVORt5LZ8uCPjzZUKF4CHsgGOE7vTWPY5e1raP6bZn9ORKTHnadDo32CV4CEgUFd4k6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <732f722b-fcdd-4a69-9c32-5c306e81c998@suse.com>
Date: Tue, 21 Nov 2023 10:16:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d780ad-c067-496d-7861-08dbea727e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wck4LrIZWyKOLmNnDetFdy8FJ+R7GA7cQbcPcBnAqM9BoPlYCY7loEIWd5YlKgmrOAwKfgRbRAtsoVEzr2kiiAivq88qULyW3lggjbFg9hzfaN5XiryHnrdmNmx78MGfDcgokVIdWUg9MsB84jm9wykpAzPaptTZSUX6FPQf+WNtjjNnKeEs/CSTi+kqgSSEX09wtKIOakQWBG7cJ+KvAZQHfcp0Ld8DuRutfi+zMaT1C2qrxiQt5yNZkqvWySaCWIzlLjf0kpbzuj7HZZLqnyIU+DfdANxyorwTxBp7t1GykH1JLidJAIB53viDnITo8rxKaYqMzRkQBa29YeB7YiCGCo2vZBIKG1zjrA+YbYjKMHYo5Wm7+tq0ztybQrgcW47kC7ju8FrWBINzjxy8ogS5WZwrFTIn5s8O/yvxBYvJBTXCKv23WQaCJ9CBJ4VFBptqjsOm5yB2bxHBaqvnY4DdqgE37rYZ5pPSUX+2h7sOJRJxD3Wq7YrLIdtKfQeSn6/llnPEY3s7tbop3u/2hVHGp+BdcU4iBwvvUBsLSn/L73PyPJWiQVNp1bV4O18fMyc5W8nUjKphRyNgXt+s9bq6DH/Vt7bmT2b99GLpu/ckc9a4PnTuvp91ZPRZ7TIA9vP8tiQ2Ai/6o/UgJCuL4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(36756003)(86362001)(5660300002)(31696002)(2906002)(4744005)(7416002)(2616005)(6666004)(6512007)(6506007)(53546011)(6486002)(478600001)(26005)(38100700002)(66556008)(66476007)(31686004)(66946007)(6916009)(316002)(54906003)(4326008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWhDUTA2NXVaeFRFanBWN1B1RUpRSUZiSlhVWWY0WFoyV01uSnVia09SY1VT?=
 =?utf-8?B?cC9jUktRSjlxQ0NXemRJeHR3WVZxS2xzbDNKT0JYdHZoZThUbDBLTlcrN1pq?=
 =?utf-8?B?QitVckJ6SDVFNVhONDBFNXdVRERsUGREeUZESTd4Q1laTVZQVFhLL2dUcmhh?=
 =?utf-8?B?TElrZlNVckhrdzVyS2Y4OUVaU2hiSGNLK1pyeVdHeUtnQjVmWHllT1dyVU9L?=
 =?utf-8?B?UDlyRlk1TTVLbi9VdExBQ0lscEFDMTVkcG1TRFhmZWYrcVFCSXlXdG9OQ2JQ?=
 =?utf-8?B?RDVoK0NCTm5zT1p0bDk2SVlZNWJtR2EyQ09paFZrekVjSnluYVNzNkpsVkJt?=
 =?utf-8?B?elJISUVSb0JSQWZUVzl6S29SckY4K3FBek5PNTl3VXl0Mm5Jbks1TkpxL3BO?=
 =?utf-8?B?NCtGNlRzVTJyTEVhLzVSa2FHcFRFdDh1NjVRSzI2U2tOam5QVVBvOHFiaWts?=
 =?utf-8?B?LythdVkrKzYweENzWVZ6SmxRYnBBWUNvTExCMkhkVG04ckJzUEt0dUlkNkYz?=
 =?utf-8?B?VzFvbFpRVGlaNncrSXpqY0FUOWtVemdEalo2WEZNNEtPUXNqdXRaQnJPMUhY?=
 =?utf-8?B?bHNmTjN2c1NTUEprbTFGRUREQUVVV20rS1dETy82bEtOTHNWam1CTG13cVpk?=
 =?utf-8?B?NzZEYm5TTmNBSTFnMXlYeWN5cXZvSVAxY01iYVdxQTAyd0pyRFBFZkdkdTVH?=
 =?utf-8?B?Y29Ic2RIMXJNRC9xalFkU2luSXJEcEw1MHJDc2crYklCUkY1bUp5ck5mUlFx?=
 =?utf-8?B?aStuY0ZSV1VpTzA0ZWl3ZjZxZ2pKNjBzeUpLYVNOMHRCZENuVjY5V1RINWlE?=
 =?utf-8?B?WS9FZHpvaERERmJHR0tIWFRLbUtvQWhSeklOR0lndHBCQkFTZ1hzMCtLSjN3?=
 =?utf-8?B?ODlndWRLeHBlMERxR0JFV2VnU1hMbCtzajBKdSszblFKTXdhMERuNGlBNm5W?=
 =?utf-8?B?a2VNZ1gyMExVL0RQb3dtbnlqb0NoZmxqd1hodGQvS3lKNXhvZzhhK0NZRk9L?=
 =?utf-8?B?eEF0YlV2eEJkSVV4NkovL2g2ZlAxRXBJai9OOG80YVBpVElPVUhnSCtRQlBy?=
 =?utf-8?B?QjR6N2I1ZzRLelJkczU0cmZZTDIxTklJREJmMjYxZWZ4ME53UmJlQ0dkaFMr?=
 =?utf-8?B?YnJPaXIyOGk1cGxTSWdpZ2JMZlFBNlBXRHJkQkdQUWxwS2I5Qkwrc1dNb285?=
 =?utf-8?B?WEhsdk9VZXViTGlEWVoybFZQUUFwUUFiYnYrbnkxMEQ4Z1FNaU1ERGoya1Zh?=
 =?utf-8?B?bkZneHNGd3NnMWJwS3ZIdjN0SExvS0J0cWNYVG9hdTlKVHR5Rnd5aHR0dWoy?=
 =?utf-8?B?UWlZeG4zYmFpck5OWlZxdXUyVDdOZ1FQZHd2ZDVEcXIxNnFUdGtYcGxUVytN?=
 =?utf-8?B?a3VZM1VJVTBrRXNkQm1WTXdxOFZQSjZoanBaOGFGSTdqcFMyeVpxS0R6c01L?=
 =?utf-8?B?bDhCWUlZNjRnMit5emtKN21oN0dLUlBNSGhIQk02NzVrZDY0QzNnV0pONFZQ?=
 =?utf-8?B?VWg4V2hTOEkxV0krMndxakNhai9HRjd4anBmL1ZORkJuTUlGQkpybHVSQTM2?=
 =?utf-8?B?OFNKZWUyM05Kb0VHSUpqS1UreW5QTDJsY1FqWDlGM1ZFS1RQbkIvRWgvZm5V?=
 =?utf-8?B?WmFTUWhnazRkUnJOam1VK25MRWNoSmpGUklHckJlNjkzS2pxYVg2OFY2Smww?=
 =?utf-8?B?L1g1eUE3Wlh2UFJKTDZLUmxUbm9UdmlBWnlocUhxbzQ0VzlqOUxyT2g1Tldn?=
 =?utf-8?B?aGE1NDdTaHZRYU5ZdEZhdzExTFlxWDRuWXZhYjVlR2xueGlGbVZjaDBqRnpx?=
 =?utf-8?B?dlMrc0NhMzFqWldmYlBuL1U3RjNHMXF3R1YvSnFLK25ZR2xkNHNaVWlnejV4?=
 =?utf-8?B?Smh1SzQzNWdublZDSmZXZHoxcjhhYlFNdXFkNzZsTFBLZEhhcW45TmUxWE1o?=
 =?utf-8?B?MTdEVndhd1JtU3VwSERWMElvVnV1OXBrcUE3VjZZemtwSVdROVdTbERzRW9J?=
 =?utf-8?B?K0VWNVZ4SHlFenVRZk9RUzV2UjNBeEYrbHlqKzlxVVNYN0xvZFNRU25Nc3JV?=
 =?utf-8?B?K1ZlNUhZdDJqMEJ3SmZObFl2VjVhMG4xQkRHRVowR0M3dHJnc204TzA2c1BY?=
 =?utf-8?Q?KIlfjpl/QbE4g/58fB0IQIfZK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d780ad-c067-496d-7861-08dbea727e4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:16:07.2281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fos6Ha/dIju3GvGn+unnvQ6Rbfu++iQs/8B75dLmRUvBENywVprk+idEi+n3m9MdqzjStJfWRscCQIoPdaaa/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8919

On 16.11.2023 10:08, Nicola Vetrini wrote:
> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
> by the asmlinkage pseudo-attribute, for the sake of uniformity.
> 
> Add missing 'xen/compiler.h' #include-s where needed.
> 
> The text in docs/misra/deviations.rst and docs/misra/safe.json
> is modified to reflect this change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This patch should be applied after patch 2 of this series.

Code changes look okay to me, but I'm afraid I don't understand the remark
above, and hence I fear I might be missing something.

Jan

