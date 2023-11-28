Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EDD7FB802
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:37:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642954.1002810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vSR-0003rT-7o; Tue, 28 Nov 2023 10:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642954.1002810; Tue, 28 Nov 2023 10:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vSR-0003p1-4c; Tue, 28 Nov 2023 10:36:47 +0000
Received: by outflank-mailman (input) for mailman id 642954;
 Tue, 28 Nov 2023 10:36:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vSP-0003ol-SY
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:36:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05fdd8b3-8dda-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:36:44 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7892.eurprd04.prod.outlook.com (2603:10a6:20b:235::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 10:36:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 10:36:41 +0000
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
X-Inumbo-ID: 05fdd8b3-8dda-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT615HDANPn3mdWsUtz3g1EaauoOW+DPjRwzVYNhnaWXIHbAImkYdoZjoTsa2XhNfddQd515nc0Q96UH38vuj3SIuyo6zH2a0o21+8X5hgE/v3yrx/EW4QGPUfTt7kOsy/igzr2BOWFRwmhe1J6Qpk+KhawkcPs5n8f7OIwxnPzYueWYuYdNpJn/mhIve5Gy3AhGXDw+TG2i7+17yTCk2tuUwKw4S4BO1u1NrpGLz+ffQP+s1md6MTBDwzH0x5tgw6JiBjKGAoHN1pXxxlo/b23VfAvmaHPc0Qa5QvNVK0jdWsCPH24VYm8W5c25SM0FyhRWQW9zIinZE0D77TIGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxXDsWRhWG5TXSiUXqk5nLYM1a+YTnq7opN/8DGS2lo=;
 b=A0P8peg6bUhEtZykludjwbjmslSWYv0xMyXiQoUvuU4yJRMctDecgKKNxcbW5oupA/rwaWifbTm0PvzpAlpQtuP6NIS9U8/vf6vqBUf75SZSpnFroFelSEGERjGjhTXMFtZlSK2BMG3BVOQdo5HMydpiFncbD+TEarlDAIpFgTjbJ7nmCmLUEHvNJ1varFICmtS1ErjFyNP+RUG1tHsyceOWEo4AwzFE9lrtaQWZIAPMw5hOj780AddWTVGUzPxsqmHlICj7gAbqTFGDs91959td0zPUPRRZz9V8IWndHD0KtlHZ/iT/7oiTTZpgYYsGC2/EAv11B7B+n9TayUF0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxXDsWRhWG5TXSiUXqk5nLYM1a+YTnq7opN/8DGS2lo=;
 b=ALGj4jRuLzq9w3KcVOMqAy3jGMS2xmRKELBXyciDCo31KS/ozS4peQsK/SeSwQIeprhJS+RemJQUjmFM6PnRuTAH5Fi1FOdr1IklQypzxCXibVPvdZach4umMt/dJmPsvQMvEcnkZGn1ArRMMLmAgXn2yAbyAhL4BwBjaviDLHsY8ztHeGQtNW3+3yItr6LZdiQzMhURMmOOviekNXMKd4c0Tb4Nyb53k+19aGCofkbgbH+Tr0mrQOb/FpN4Uk5bt0H6ovW1o9DTSntNVF3HWdLXnhKAIQnv8Y8st/eXBRs0sNHnngoRgRjCY5E7eh8M/0UMEcWqYoOxMJKQ0JyoGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bac47eda-012f-492a-a1a4-c478929ba08e@suse.com>
Date: Tue, 28 Nov 2023 11:36:40 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 6/6] x86/vPIC: check values loaded from state save record
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
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
In-Reply-To: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e40b020-7622-4de2-c072-08dbeffde84f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fs0WfHSwTMpyNTTumCgBL7cXvsG5OSBRWxqeYD9+8cUvBpP7RPRUr7Y7tgykRUNaJaHxyUwNvaTVZTK4zfK2matm3zJCkbe8rudej8j4Jbb2nRyrxbZwQ7Pjsm6brM0KNmjuHRrE/FHhvmltCEf2VXz8Y7Ni1+vJ1eamItPp5OMO0SkEnthTGAEmIdmTC2Su6ccHw0te3WDu/vAs0ZM/wwOnIgIoEH4KW05Av/wdruWgzTAEbDVn4sAhtjbJTYU1oxamIg0xPxtrE7K6OabBYHyz/dYeSe4gowbVUtfhJX0UHqDFBFWLY9RR95+zDNo2KTGIfG0+nYJCoGjHDc0Zi3ifjBZJ0p7/w0w1i8QNz/ZktdUsyBxgw12XsgR+GEU7C5fh1VPJBDuWJ73ub3d1hNKofNxsKJ54TwaH0DooQC2nut7EhiG2fJRcsnIwuW0zzspyfZIrLsPhdAV+z2VNvDFCUWOGGyuOa8M0FBWM1ajOpJ+owHty2Q8Zjj+PjSvhnBUWiGdCWsj9dMlS1MeyryWvmrM3LAfT9SKZbBXDcio2y9lLICz+m5dK1iM0STqaeWa4WGC5P3as6N4A86Jv0K0nvQc0Sxv0hNHICHQOI9rsqN/Bn1mbiPd76yetviBrmhBgUknvN3coGUxwyw5HjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(83380400001)(38100700002)(31686004)(6512007)(6506007)(8936002)(66946007)(4326008)(6916009)(316002)(66556008)(54906003)(66476007)(5660300002)(31696002)(478600001)(8676002)(6486002)(86362001)(2906002)(41300700001)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkRhWDNIN1ZiSVdPck5rcFBqMVFKdjBKTC80bjZkTWwwWDI3dmkycXV6R1RH?=
 =?utf-8?B?b2lIbnlRRUMrd0NaYW8vWkpMUGdTU1V4OXAxcUE1a01mNGZlNFdFbnU5akQ4?=
 =?utf-8?B?NGpNV1Z6K3BIR0h3QUVLcHZGM2tLTDFBYVBnWGNwQ3gxWnJxS0Z3VlVjelRj?=
 =?utf-8?B?WitjMHpZWkQvaUNHb0VOeXpSazJzbnFBREk3NmRlYVRuTHhFRUVhTG12dVZt?=
 =?utf-8?B?WU1lcnNObDR5dkN0U2xUWVF5Y1VDNkRTZmI1YXRncmMzTVRkaWNFM3pVV3pp?=
 =?utf-8?B?Y2gzRWlQUzhjZVdkcGtPL2ozRWhqVVRUYklUQytIRXNNNHkwTk9VOFI3ZGFv?=
 =?utf-8?B?d1dTOXh4OGE5Y1pnZnJpaFlydVlJK0N4ZHhPV2xWTEFpa1lrSlJGSkg3WktB?=
 =?utf-8?B?b0NJaUN6OE05eDhyK0RIeDJPcW5JOFNiV2JjS1BSVy9FREdjVkc4QnVTZ05K?=
 =?utf-8?B?N0VYQUNkb0hJeW95WG1tcEgzRXRKQ052TkhBRWtQT3JlR2JCZzBLNWRJMGRy?=
 =?utf-8?B?eFRtVVMyUDNCQlJSVWViTG90VkR5c3RXemxFMlhBcEp5TzM1NDQzK1hNMHZ3?=
 =?utf-8?B?bFdCWVBSNlVhZkc3UllHelB1SVl0dWxYWkZqb1lXbW9yUlc0UmlBTFJpRFpW?=
 =?utf-8?B?bXNwTTY0TS9CRTlnQ3hIb3UxRGRrSU1UVzN5dStnV2hMZy9XTHFJVUZWSnli?=
 =?utf-8?B?dmFkdWVnaU5pMTFteGNFUExydjNmaXlhQXg0eVB1MzMwb0tOY240dEc5OTBo?=
 =?utf-8?B?ZmxyWnY2bm1OVllUS0dLUjVuL0lHMFhLWm9hQUFNNnhpSk9LRCtBK0g2b3JR?=
 =?utf-8?B?akhvVWxRU2hxVm5CWXQ5dXR0cEgxcmk3RG9ZVks3UmRjM3BRbjJHVGoyZUxJ?=
 =?utf-8?B?U1dzNldZYmdFTXN1aXpRNWxYRmxHb0NLRTR1RjhPczBQdGdXS1EveGw2SS9r?=
 =?utf-8?B?VUV1TlZZbmIxSkRwTGk1ZWQ1ZVE2dURYOXN2Mk9TUXRNNGpDRVhHQXhPYWM3?=
 =?utf-8?B?aTRseE9DZjhNSU91TFBLdmpsR2FKSm1abWhNNDB2ZXVNT3NKUys0ajB3K1U2?=
 =?utf-8?B?M0JrT2pwVjdTbXkrTy81NGlya0R3WmZUMG03K1RrWWExc0huM0VpUmcvc3hw?=
 =?utf-8?B?REZOS2ZhRVc1bnJZVzJva0lzM0R5K3NWNHlzZ016M012UUZWSFhJcDZQdWJS?=
 =?utf-8?B?dk9yVEtPUHZ2MnVMR0J3NlVVMGRwaFlDR3NHT0Z4WUs1ZjlSSTl1a3Y3SzhN?=
 =?utf-8?B?bGIvaE11ZWtidTk3Mk8vaWIrSnRMNjU4bnY4aUU0bzVXTmlCZDFmd1BGL3kw?=
 =?utf-8?B?YjM1VlBLMFIzQzFDWDhIMFhTcmpOZzBkZ092bDgvcU1CYmRUK2krVDYySWpw?=
 =?utf-8?B?N0Z2bWJ1VVVQUkJ4d1ZXZ3hFcGlQVGY5ZFdHcGlFUE9kYWt6bFB5MjBxNUg5?=
 =?utf-8?B?ZndTNkdLMkplbW51MnJTcWl2bGQ3ZmRBNUhJYm1Jc08rVURIM1RXQlBGNFRh?=
 =?utf-8?B?UVFwZDBUbnFJZ0RvbEpSRHNxMXVlWFh6U2VaVDN6RlRzK3U5YkdnOEF5bVQv?=
 =?utf-8?B?VEVzbW1tcDFCOUdPK3NpT3hxaWZiZjI2M3Y3WERtQzRvaVh0NFVwTkg2SFNp?=
 =?utf-8?B?SnVpMVkzaVZqZlNaRFJVNGc1MkFydXdOenRlUXBKQTNrcWVVVi9WS3cwd1Nh?=
 =?utf-8?B?TWoxZmw5SFJBL1F6T2QzS21iUE0yaW41d1JEdWo3aXpxT09wZHhaYzVpZ0Rn?=
 =?utf-8?B?Rm1DL3Z6VFY0Z1hYUkNaN0M3SCtpWEZaWElvS2p1OWllVUx1U3o2Vi9sVkhi?=
 =?utf-8?B?VDF3c2Q0M1VUaituUTJCQkExSDlIeDcvQk9UR0ZVVUZPNkd6NHBJZmM0Uk8y?=
 =?utf-8?B?M2NVa3hnU21vQWFna3ZFK0JxOW9DNC90VGkvTWIycE9UQVovVWJFaFdOWlAz?=
 =?utf-8?B?cm43VCtML24ySXhvRHBsak9raGxveVBDZ0V4ZDk1VDk4SE9RVjd2L0RSSkx6?=
 =?utf-8?B?U2M1MHUvU0FqaWJyTytRWk40a0NIa2lodVFlK1YyRmtLUXFpN2xOK0c1NTlC?=
 =?utf-8?B?bmFOYnM1S08rVFVWaVJhK1N2TU9jTlVCdXRHTWx6ZXJKZEVZdkpXdXBPZmJy?=
 =?utf-8?Q?WjypeHebOLKB4MvdzrTEDUYHi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e40b020-7622-4de2-c072-08dbeffde84f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:36:40.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5EnIh3MsUZSSz/L8/eIWH0EyG147F93wT+I8bqmdoWUcsW99fSjWEl61hU1cz3LOboppz7hy5BW6s7Kb+BdUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7892

Loading is_master from the state save record can lead to out-of-bounds
accesses via at least the two container_of() uses by vpic_domain() and
__vpic_lock(). Make sure the value is consistent with the instance being
loaded.

For ->int_output (which for whatever reason isn't a 1-bit bitfield),
besides bounds checking also take ->init_state into account.

For ELCR follow what vpic_intercept_elcr_io()'s write path and
vpic_reset() do, i.e. don't insist on the internal view of the value to
be saved.

Move the instance range check as well, leaving just an assertion in the
load handler.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: vpic_domain() fix and vpic_elcr_mask() adjustment split out. Re-base
    over rename in earlier patch.
v2: Introduce separate checking function; switch to refusing to load
    bogus values. Re-base.

--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -429,6 +429,38 @@ static int cf_check vpic_save(struct vcp
     return 0;
 }
 
+static int cf_check vpic_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    unsigned int inst = hvm_load_instance(h);
+    const struct hvm_hw_vpic *s;
+
+    if ( !has_vpic(d) )
+        return -ENODEV;
+
+    /* Which PIC is this? */
+    if ( inst >= ARRAY_SIZE(d->arch.hvm.vpic) )
+        return -ENOENT;
+
+    s = hvm_get_entry(PIC, h);
+    if ( !s )
+        return -ENODATA;
+
+    /*
+     * Check to-be-loaded values are within valid range, for them to represent
+     * actually reachable state.  Uses of some of the values elsewhere assume
+     * this is the case.
+     */
+    if ( s->int_output > 1 )
+        return -EDOM;
+
+    if ( s->is_master != !inst ||
+         (s->int_output && s->init_state) ||
+         (s->elcr & ~vpic_elcr_mask(s, 1)) )
+        return -EINVAL;
+
+    return 0;
+}
+
 static int cf_check vpic_load(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_hw_vpic *s;
@@ -438,18 +470,21 @@ static int cf_check vpic_load(struct dom
         return -ENODEV;
 
     /* Which PIC is this? */
-    if ( inst > 1 )
-        return -ENOENT;
+    ASSERT(inst < ARRAY_SIZE(d->arch.hvm.vpic));
     s = &d->arch.hvm.vpic[inst];
 
     /* Load the state */
     if ( hvm_load_entry(PIC, h, s) != 0 )
         return -EINVAL;
 
+    if ( s->is_master )
+        s->elcr |= 1 << 2;
+
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, NULL, vpic_load, 2, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, vpic_check, vpic_load, 2,
+                          HVMSR_PER_DOM);
 
 void vpic_reset(struct domain *d)
 {


