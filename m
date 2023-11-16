Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B894C7EE18A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:30:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634208.989543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cRL-0004AF-G1; Thu, 16 Nov 2023 13:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634208.989543; Thu, 16 Nov 2023 13:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3cRL-00047K-Cv; Thu, 16 Nov 2023 13:29:51 +0000
Received: by outflank-mailman (input) for mailman id 634208;
 Thu, 16 Nov 2023 13:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3cRJ-00045j-Hv
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:29:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 357b1eb7-8484-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:29:46 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7217.eurprd04.prod.outlook.com (2603:10a6:20b:1db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Thu, 16 Nov
 2023 13:29:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:29:44 +0000
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
X-Inumbo-ID: 357b1eb7-8484-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=at39znPI8NwVp4oqOYYf7DHPcqGyzknSTQ3FjuLFpWh9XheRWJOTO6xrN3zSmx8ZEDZ37xhJB6XBNrhbvof99FpQGCVEVT8Rdv4CAZrfdrVfa475xlf7ZVVpv8nnk/+GFCd6Im4IGTojW2d0+pFUADQWdvxj77DQEjDBm0hPHw8ZI8/r1EH1+it7JJS5VmB2JVb7IwvA1g0mz4HJMvhYdZJUPWdjSaep8CNi8Bu4R9fL7ukDGttMUXnx9NuxbEfzU98CZFzxEWH9/mQcrE2HlMiT4an4GqnVa4armr5U4de5UVPybBIl/tJrAmp+QNs9yB5wKc2TQl9jRqoJPpc8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkydDszxUuAFPDA8uC0UdXYBYfdZlCcf2w7odYVCt90=;
 b=UhKsfBKyow/BvW6wxFivYHFyEW4uWFFpGHGxPnD4wlwZeqMVkDEi37ASFySxPk5YW5yT9oHO95SlUxXQ+Urr/rHGvmhQv5jsRQdcnoc8I61a7ze+lfd/aEQCtTTKVcP4FAHjeP6g677B7xzME6gI1NHWPFjDpxbvJiv/FSH92Hen5S9NhYzHHm2a7WdeAyrvwykZ6zXQ6o806xz/uWcGzYkbXcGarWj2AGdPG56toJwZqdT5axJikmDArWFVTsXpK8ghtQWkCavY++xp8fWX/agD2FW58RPt4LhCgmSIt+JVQ6XHAZOciNA2Qfu6l95a/VbRYKmpS5ff7X7klB2X8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkydDszxUuAFPDA8uC0UdXYBYfdZlCcf2w7odYVCt90=;
 b=jgSJ8Y34VjdNZFHg912lv2EWwfJlPOYe7YkGdUa2tpDHqIdPPdi+sLY96e8MTYIjVbX6J+QaBabqlbTV9jZGSp6+Up1kyYK7z3vsQ+doN52UHvdlUdr6jv7IRAI9uUzKOUpIumceVHC8WaE7mm1Ki94fMjtniyxoj/2NK/hn4RufMFvcMLdRXuyjmdH6v7sjKcLzX9WqIRB2H6nvUw/0axD3dyfUzkDiCq3JD4lGzDlFQQKgyHnynvTl4KzCxVbugwLjaTEn+/We//ERsR/1rAhLw6K5RPaUH8HM9kYNSHl7wqWjqXR8KPNGjlfcq6Zl0oYlGeRTB4lUx8WZFxH3GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
Date: Thu, 16 Nov 2023 14:29:42 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86/HVM: misc tidying
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6b7c08-dfb9-484a-3fa4-08dbe6a81854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hFVTy10Aevjl0KhHOLN8BQa/3OfPQHsStBv8IvpaVvKW2YqyOZ0rgWyM0yW9p1lsPGOv1bv7luJreKe7mbQym7aJ6C8qwcOIGO0C2WxP/3V2CvALe0D1xlGAX3WJ3Vt83uuqCj5c6JgISGhUSnr1/2JWcXkVNFkxwcD4xsTaGHRFbGUxyf4a2et2igjj7nCPf/wUXhCE3BnMe2LSTplNtl/6vXBR/r6nz8wAK6pi+Uz1PIQlpoWK9fX3mAQS+5DPFN94oERovrlUA33EW4HSTdZi4Zv5SIkgV6g5yGa43XT/5l+4st5LW7+RfPtbHWBtY2X8kHwDx1zo08A4it7tqcALDvUXnaOV4SYtzRXoeevBG25TD0KukAUEC0b94DNYybR5EyfQg+u8r5Os2xi+wuYir/6J+edRQGobp6bQdrZXrhWAVW+t1KUXPpHSNYHh+/zkDcbNHYVrI7gav137IACZkBxvGARO/MkEYReXCQCrA7zPJGaSEdQLtZ35KHYKJ5Q+WZK7PiRST7M8GNweq5LrnN2zPc8m4pkEL2BqCBZJTawQCR84lWdnC+AEWuQqczYbfiBhbloI7cRjnEbpZcIKL/fWWSol8yL64aDJtnno1ODzyFiyF5QPPnIah7NCJQAa+2hmaOmedd52a+eQzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(41300700001)(31686004)(2906002)(5660300002)(54906003)(6486002)(478600001)(38100700002)(86362001)(558084003)(4326008)(8676002)(316002)(6916009)(8936002)(36756003)(2616005)(66946007)(66476007)(31696002)(66556008)(6512007)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2RMVkZjOXZISW1SSk1hWGFwRFB6VGJRRyt5a3F1VFlHcTBYSkxJSkRuSXlH?=
 =?utf-8?B?ODh2NDYzbzNhdEN1MkFWbGxTUUdGbXpNQzBBSVN0WVc4VU1zMXVMZktQeks3?=
 =?utf-8?B?Rmg0OE10NmZQNmcwYjk2aWNlcW8rUVlBMCswMityWGNkdkVsRjZqRHdaVXpy?=
 =?utf-8?B?T2M3dzVyQmxzbEZjbXcwZnU3SjZTa2o2Qmtnb3JmT25YWXhCUXRzZWpsZDh2?=
 =?utf-8?B?bWpHR2R2WUd6d0ZVb2JsaXlrYktVUE90cHlWblVUZjh5dENsVmRoZGNiUFNJ?=
 =?utf-8?B?dTZGQjkvbDQ1VVpGVkY4L25XWjBQWFNSd2IwdW85UlJ6Y0t4dWUrOC8zWjhP?=
 =?utf-8?B?TWk4ZlB6djZnNFMxSzBuSFZGbVpnQmxyQ3hjQUI4blFidkFIQ1JBMm02ajds?=
 =?utf-8?B?SUl6eGREcnJnYXlteEc5aE0zcXh6ZGpzeWtOSGlXb2xPeXJhY3pqUnpZV0Ey?=
 =?utf-8?B?SDVUQzlST2gzUW1manpsVi9uK21PN3ZnaDZVWUNRQ3hSRjMvZXFNcnhXSXlW?=
 =?utf-8?B?ZHUxSUlGdWFEL2RFNUo0R01EWTg3S3Z6cUo2Y1FKNFdqU2NuNlFXMW9qZTM2?=
 =?utf-8?B?S3RaK1RzU01VNjcrMmJOMjM1QktLL1NSQWVBbEU4Y3ZPWWFtUzBNTmJjbUhr?=
 =?utf-8?B?ZWsyTExvbFRLSjRHZS9LTkpxQXBEenltUGhmWGJTS2pLK1pTcmZ6OGxET1VT?=
 =?utf-8?B?ZSt1cCtOcUxIWXBuaS9NcnBzeW9ZTGxSYjBzWWFkZGl4cHJlYzhNTURIaTF5?=
 =?utf-8?B?MG5KOExNaWNCeFZweThxUTJaRnllait2Mi9sSVhlMHppV1psanFQSUlCVTZ4?=
 =?utf-8?B?UERkeU4rSGpaNmF3VTBObjNUR0k4d0ppNUh5bk5vOXJwOGQ4RkZlYngxNGth?=
 =?utf-8?B?R09QRVBZU0JZSGU2VHR4S2xFb1BVcVRBR1RXY2JsSXA2QTVxaU9LdmNIWkx2?=
 =?utf-8?B?NVJ1a2RKYWhKVzZ6Z2VJczRhS3hVQWc4WUgrZkhienVpNHc4cko2bWV2Z0JE?=
 =?utf-8?B?R2VYYXhteWxQKzVZeERlYkF0VHNzR1htRnVQZTVQeGxOZFdNaEZzN3Q5TjNa?=
 =?utf-8?B?N0JtVTY3QVdISjVSMlpBb3FOV2hQbGpOams0TnAvTTJ1eFMzTVBnN0FHcjdZ?=
 =?utf-8?B?cm0wLzlKRDhvOUF3Q1k0Rmc0ejhSS3EvWnVKRlJ6NmZJZE9vRkRDR0ZCcVpT?=
 =?utf-8?B?b2IyeFRLZDNsbVY5RzlGcDlGK2FFUkc5Ty85NkdpRFUrejFySGkwL1c2ZGRV?=
 =?utf-8?B?SWZRbjE2RmxTK2k4RlRja2x4ZlFpb09GNDBrbSsraEZLdUt3M2xGMkhKbzA2?=
 =?utf-8?B?NG1lY0x2aVZZQWJmVGNuQll5eEhIb3JHNmQ2MVhEWGlxM3Z0S0l6UGNQRGJ6?=
 =?utf-8?B?cm96L05oS2VRYUxteXN3eVV3V0NFYmV3SjQwQWQxTFdjMTdVZmRLTEZoQVVv?=
 =?utf-8?B?ZWs2UmFINDVnQlBiTUVxVUlOMlY2dXRLa1BXRXNIMXBnd2pGalBXcGdwVlA4?=
 =?utf-8?B?TXkyNFpQMTl5OXFnUEM1SkllZC9kMWxVY0VTbzh3MDF0cVZ3cDBBV2lla2FH?=
 =?utf-8?B?WFQ4MkxFajAzbWtYdlFwSDRjbFA4TzJINFBtaWwrL0ZEWllocU1HNEFKSzBl?=
 =?utf-8?B?VGlkdmFnNXF1UHFvMUpHVk9nODNUK2FCQnN0TDdiZjZTazZyRTJHQzdoclJL?=
 =?utf-8?B?VVErbTk4SlJ5NER6ZEs5bEVSZXpocUVDdGFSU09Sc2ZCVjh0Rkw0NGREUjZv?=
 =?utf-8?B?WGhLbU5UZ3V6bnhkcmFsUzVIZHV2ZXRNclpMK3VYUG1PU2FEaFRVd3MzU1ha?=
 =?utf-8?B?WHpsV3VrV0NnNWYxRGxlaVJEUVp3YTBPbEprVzMveExHbWE3MlNHcFNVTEtO?=
 =?utf-8?B?ZjlndDgycjcvcXVLanVrVmRXNWQyb3JaUGo3M1MvNFBDS0lnamprUEQxZjla?=
 =?utf-8?B?TkZYeFZzMGZadG1LdStQejEwRWF5UFZZMlo3RHFleTY5SVBTUEFKT3VmSjUw?=
 =?utf-8?B?VEc1R3hGaUc0cjF6dGpkNU1LV1Q2UC92ZnNvbHd6RXhLWEdka2VUcFE1RktP?=
 =?utf-8?B?VXdsV1dhTDZPREdJeDUxWmVRdGxTTGZ5V3JqUFpBcDh5TzFXYmY0TXNCVHha?=
 =?utf-8?Q?5jzw5SxZTQxbPzU3fytSCZa6K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6b7c08-dfb9-484a-3fa4-08dbe6a81854
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:29:44.2750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJa0g7RNpAxDmcX/pe7NOZ5KgVKXPWyw1hXuq2zdsbwk6yOlcgNz1tfjUw8JGAT0DShvZZg/4mUwHPMouPKfuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7217

1: VMX: drop vmx_virt_exception and make vmx_vmfunc static
2: x86/HVM: hide SVM/VMX when their enabling is prohibited by firmware
3: VMX: don't run with CR4.VMXE set when VMX could not be enabled
4: x86/HVM: drop tsc_scaling.setup() hook
5: x86/HVM: improve CET-IBT pruning of ENDBR

Jan

