Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F047FA326
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:41:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642189.1001505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cnO-0004hQ-9l; Mon, 27 Nov 2023 14:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642189.1001505; Mon, 27 Nov 2023 14:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7cnO-0004fm-72; Mon, 27 Nov 2023 14:41:10 +0000
Received: by outflank-mailman (input) for mailman id 642189;
 Mon, 27 Nov 2023 14:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7cnN-0004fg-2i
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:41:09 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe12::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fff8462a-8d32-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 15:41:08 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7759.eurprd04.prod.outlook.com (2603:10a6:102:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 14:41:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 14:41:05 +0000
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
X-Inumbo-ID: fff8462a-8d32-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCVUR3RCGjhiPStIFqn/bBEmhmmkEMcTJIk5a8PHU8Pvtii/Ep+c/d0NUO/21HV3/4+d+NcgVkyjZ+vEpciryH6YJO7IBWgNMJ7Ugpap2x1M5zD81mzYWu7uE4dbHVPxGHNw8jdO9sEwQRsiG2TF1WtVeSH746Fm566PODjm6ooktk0hQ1plB1QbWP4OUszlJDRTyZD7wu0AS2fVOQlixgGmAhqhNTdieNW0c2jxyLmz1ugeoH6C3CbidmxUdMbdXb4TOYrO5XiHBGRxdW71Owrlx9RAvYg6sonmv2Orgb63DZAntzl8byDX7ZC4e/DX3t8BlPadU5PX/vyyZucUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRslTjqt3S29cfdZp3EamzX2RkCXf3utxBLl8RxArUU=;
 b=mRe1uxhEFtOWDJwczbzzjpCXtoE8SZO6Kf1Zc6R9DWPjfYE6e42ODxmmZHz+1BHMGEoK2+jfXz6E7zjOVWmabtzGUCrxlrGeerNfexQHL/wylIYVDxXny0Iskh3mqzx9Kxui/pGyTwit0a9XTzEOziLaAMyazbJxYRRyIqxEU4uFLhcvXLBW1k1Vj/tNMVeRh70GJ26I6Cntc7fsZPMcZKBUgySA4eKGQ4VqWNTK3ugSpsHN2D1sThKctje3wn1SyKQbe4Dam7EPHaN9p5ERoucHyLaifQoCRGCfa5MC8UibMImVUPRWRJWWgDCSBaQCJ3IAsdr5NHuRf3KszAlnOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRslTjqt3S29cfdZp3EamzX2RkCXf3utxBLl8RxArUU=;
 b=CDsphy6DFhKaAyIy1lUArJxI2o5IrVVHHBQScPzKmR/9SCLQg7QXuwZuVehnFtGd1w5bCpGkWxbSA1WIcc/f9I4MWDfgONN0kc7OQeReyGrBJ4/tCITMHI8UJJNRageVIq1NF9WUCvD82ZNTM/uS8JhFABt9siGLmZIDNHeENzTtUhu/W/we+jIc/d8vFP2vfunGcIhMjwtTLTSll2Ncxx17w927i+rgrLwDAXWHgHnctxnOQaDTN5LP0QH2ZOGsXQ5ye8ZHQNzcpgJklVRySY5DuFwhy3z+4l7GKjXM7bE0Xy7mZfa6pjpQ78HLmLNXX73Gd9TSsWLjd4F3m6v+TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21ca8f55-d720-489f-a2d0-59a1f78d3656@suse.com>
Date: Mon, 27 Nov 2023 15:41:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/14] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <fdff8da7431ac6e8e44f08c3f95c897be23ec745.1701093907.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fdff8da7431ac6e8e44f08c3f95c897be23ec745.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: fe25a9d0-2619-4983-873e-08dbef56e2e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3hJ23Wp2ac26DlLyJla6SWlwr0gy1qjV5KqEUgnPQKGUO3m0g3xrXD99Jy0Ei5+rc6FK7Me1rxYQjFouGYFOP7hhqiWo4eN0OOyB7RzLxKRiwsTaSGhHldk/+8ZypLi8/m4StaFW2/1BlWVlvY/mH23AIfkxgqdas6u9plcvsN5N8yegf5Zq4OFkE+/j7etpgAKKfAYSBJvuSmlWH0yutiawQzSkcEJ0atIQtBiWbBjwEG++RTPTch91wH6RbHR1mPEDmzKvHdiSkRy1xpMEqjyfLMHel97nV77wkW/c8M+LrpTGN9prqBL2DK7GYFLIXZn7aqgmQT9+cOpDWWySLp9IIqHa/uY8F4HldK3qTHl0sjDrl0xNmsHYV2kdT3k6w5z6reyp/n4DMqNDd/5hB1PyMvmxqBDv9JeDQXu2B3w9KvaACvWt5OSGJ17oRqbu8RIhcrtbO7gaALKEClBq7UcpDHsJ6cg2/ty5/BNtwdLT0TGLV1pq6IPZN1awzMjtVf9uPfWGKna/2lstPL+w+sAsORWTD+TZU56fPNiCA6SMR4RXPz6fJsOuSXVNpq2c/D2mU/etVjrjVe5vhWTsvGhOUv/EwIXnuvXzE4T9fYtNk9l8l51Vs31dHt0xLqhH95W89h6AaxDU9rlydHQ2eQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(26005)(6506007)(6512007)(53546011)(4326008)(8936002)(8676002)(7416002)(31696002)(5660300002)(86362001)(478600001)(6486002)(66946007)(66556008)(316002)(6916009)(54906003)(66476007)(38100700002)(83380400001)(31686004)(41300700001)(2906002)(4744005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk9CNUZzLzVHN3pCSWU5VGlERGpSb2c1ZGNsdnBKQXpYRExWOVdRc2lqanFZ?=
 =?utf-8?B?eFFZT0R5Nkk4VEtsOVlaZ3dTQjN0cU1PU1YzVWV4SzFhSTFMMk5mUGtBaGp2?=
 =?utf-8?B?MjZkKzFNMmFTOXN3bXE3K0g1ZDc5T0VtNTZleVIrWElVYUkwRkhUdCtCVU5D?=
 =?utf-8?B?QmFKRWRVVlV6QmxBM1NlSElwTjBqbzBDbFpEeThQQVl0TGpybDJqM3JTVHc3?=
 =?utf-8?B?cUhoNktHakM4djZ6OGkxM2NhU0tNYXdVK3p0M0tSVzZTQ0JNRUN6ZU9tTDB1?=
 =?utf-8?B?MHFwWnlUMHhLUGU1clV6SG16OHFxSVV2Zk12ZlVMU0F6RjgrTzAwb0F2NHFJ?=
 =?utf-8?B?OU4wbjYrMk5ERFhSM1ByQ2lQUVBjZGpZbHJSaWhuL3BydDhIai9iMHJZS1Jz?=
 =?utf-8?B?K0RIVm9KOEZ3MWxzT3Bnc1ZlZndXbFZ0VnowUHJ6cGM3TFp0b295Wm96S0Nx?=
 =?utf-8?B?akgyM3k4eVQ4b3R0UDJJdy9LRDhsaGthVDhacUtuOGlvTE9PTEFSK3ZhUGhR?=
 =?utf-8?B?ZmlrRDRDTTF5M3ZJeXNjR2t6ZEVxS2FQOGh4Q0NlYTE4a0MzbHlvcHF0YzJk?=
 =?utf-8?B?cytpOG0wTGwrejArNFdxU3BNNnk4MHZpYm11cnlYWXBvUFpzK05JdHlnMUJv?=
 =?utf-8?B?NVVSRkdiOVZMZjFsNXhNN1RBQndwNHNpN2h5bkh6SjI1VEJmTkhYbm01eEVY?=
 =?utf-8?B?NkMwaG9tc2ZTZW1aSVN2S2JObXZVSStRSU5ZajVCa3AxYVBaQW5BZjNUaExF?=
 =?utf-8?B?NDRTSXBqMmRTQXN5QmRWeHFaUlFHZVlCYlE3V3V1VGNzQytlcFJDeHhwNHUv?=
 =?utf-8?B?WjVuZUdlQUo3WG90Zi9Dd0ZPQjk2OXRYSWp6YXhJRzZmaTJHZmU0bzN2QThV?=
 =?utf-8?B?czA4WkFPSkFxQmhZQWZFbk1KUkhTUFRsaVduOHpVN1hMVDNPSWJoazZJdUgx?=
 =?utf-8?B?c2REWVgxU1Z5Umd4ckdFNytVbjFjSCtUZzY2OVgzb3F2N3dUT1pBaksxL2x0?=
 =?utf-8?B?dDdJWFV2ZU9vbnZvY0V6SXJnQ3pKZ3F2N3g2VFFsbVJESW9IYmFzeEpWcHR6?=
 =?utf-8?B?UU1HVFBwSnl6TkJxUEdIbWFnWjZmYmNVaXpLdyszekEzQ2YxdHZaMEpMMVd1?=
 =?utf-8?B?Ym1hUDhGeTN2bk1ZSlE5K21CYkpwNU4wdjFGeUtBRkpGNnlmRG9qR2luZnhT?=
 =?utf-8?B?azBUUmVXbTAyUHhCQ2hOZ241enlrUjl2RGhyakt3UlV6L3Z4VW9MdXhvaWlX?=
 =?utf-8?B?Ymh0QlZKK0p6RjhHYVlJaVBjNVRZOWdGVG9VT2FQOWNtSTNqeHBZaWNCYUhx?=
 =?utf-8?B?YmlBQzRaNjE0UkdaOWhhQnhsZ2JpSjRJVWhqYWx4YjNwM2hGVmNMT00ranp5?=
 =?utf-8?B?NXphUUVPQ2YwdStHMUxMa0Ywd1ozdHUzN2pEejdkM0xhcWVJRWlPRlpQKzBU?=
 =?utf-8?B?b0tGN05wejJwZlJDYk41YndOTjE2WDVld0N3d1lteEo2bHlGZ0FWeUo2OFRu?=
 =?utf-8?B?TGNNYlRzY0wxYTJ6dHpUaGxhbVorODROMnFHYURGVjdyajlPLzhRb3ExOGY3?=
 =?utf-8?B?ZXBVZ1N5bU1RdDFBRXFvaFRDMDFyRWNVelZ0NGtzZDJiclk5cmhEL2tlR3hD?=
 =?utf-8?B?T3JUVklyTlE4OCtvVlNWNFphMEVYN3VPR1RHcG53Mi9MdyttTUtVMWsvQldm?=
 =?utf-8?B?ZFBmVHp3U0x2aXRMcW8xSDdYRWVFdlhnQkliWVlQUmF5NExhbWIraWNHR2ls?=
 =?utf-8?B?UzBYTktZWmlaaWRsVm1FOHFlWXBSb2RYaHZrS1pTeXhWV2t5bE9xOG9PdmFu?=
 =?utf-8?B?elBFMTNTSER4UmZvS1VLbVRxTU1Kcmd6bEY3T1pOdktQT20wZ21xeDBJWEhR?=
 =?utf-8?B?V3dKaVNTZDg0dlY2NE43VnJOUnZwdHdhWVdURnhveDZNL0ZTNFFlTjZqRW1H?=
 =?utf-8?B?R2dvSEhhTkh0NDBDVGJuYy9KQng4cmtuekU1YTd1ZUFaL09CSFYyL2xwZkJL?=
 =?utf-8?B?ZW9NMSt4bGpBd0trR0dlUHh6K0R3SCtZbGFDQ0s1ZTdrMkJNdWxqMVh3MEpq?=
 =?utf-8?B?cVJCcUVGaW5TQXBXZ2lXMzlhUTFkODlmVGdycVh1RGVDeHBRdVU3Mm1NSzZn?=
 =?utf-8?Q?s8gCNsjlOFuuhwc+5CErJW+Tc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe25a9d0-2619-4983-873e-08dbef56e2e3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:41:05.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H40p8Rtmpi/cUc7VKQck8mdRMfNUEbnhF+euNPhHykFEYVOokijG/4cTC7ekfyirxaxQf4gM3NUDsdDkhNjFuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7759

On 27.11.2023 15:13, Oleksii Kurochko wrote:
> --- a/xen/arch/ppc/include/asm/grant_table.h
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef __ASM_PPC_GRANT_TABLE_H__
> -#define __ASM_PPC_GRANT_TABLE_H__
> -
> -#endif /* __ASM_PPC_GRANT_TABLE_H__ */

Removing this header would be correct only if GRANT_TABLE had a "depends on
!PPC", I'm afraid. Recall that the earlier randconfig adjustment in CI was
actually requested to be undone, at which point what an arch's defconfig
says isn't necessarily what a randconfig should use.

Jan

