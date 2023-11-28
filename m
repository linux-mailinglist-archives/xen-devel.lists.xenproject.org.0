Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581857FB7F1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642941.1002770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vPu-0000tR-1C; Tue, 28 Nov 2023 10:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642941.1002770; Tue, 28 Nov 2023 10:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vPt-0000r2-Ty; Tue, 28 Nov 2023 10:34:09 +0000
Received: by outflank-mailman (input) for mailman id 642941;
 Tue, 28 Nov 2023 10:34:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7vPr-0000oV-Pm
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:34:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8242fa7-8dd9-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 11:34:06 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Tue, 28 Nov
 2023 10:34:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 10:34:05 +0000
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
X-Inumbo-ID: a8242fa7-8dd9-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMjN5Scs99xapyXXAGIeI9utqvVMF0N0q17VVdJuVJOdLQh2bvp8FEiHpFx9p8Hu6n0ervmZC0lxxT3RMpZol+6VYclu9K9zNRu+CBt4i46wE+2h9hbnASnUHp6Qsv4AsTI5uvri5KGtVIwKv7qNTXmveWCO8hsXHOuY3JUtM7MGeCc153EiuB67qZR7XDbXdZ0kvyAQQ2o6DUR75kA2olhL9hSLdi30lp/886iQzaZ2EetlBnipSVEFMQ70fTIEoU4AQevgZXO6UMUNQil+EGzgEYYCyawwwrUNjNbSuhPewGhnA8nCWvaWs3vvxdYtlQoaSoooAieQfaU0OGuiAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HV5NvHCW8qUyTXV7C3qR2W+ZkaZGrmcXrHSxDmLp0YE=;
 b=YgofCn80b0RxRRNS4uOcsbsoNlYCaYa7eNcOCOEtthbHuDRg8wYiL7gdsh8SBxHbedCStO5XKAfh4k9f1rcvmi+cyYYKtUTtUYE85a9uVncu/aEk1V/xAHHHFgGOaYo7WaGr7VAx5PYOpPKOkx9ls5skCEfkCyJiiINt+4P7cOOat8apjnpIYQZCzmhLTD9G4vbov3G/Y9ELfQ4OmR9TDi6i84QtxMezVDW18wBqv1UYXKQp1lOxMV5wMPTHXeSHfNVmyqNBGM17933HL8TtCGG1gb8GlLKUU5nXVufJr6YpT0bYq5V+YjM0REWgfxCGbij37915ChkfIrOPUYGs6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HV5NvHCW8qUyTXV7C3qR2W+ZkaZGrmcXrHSxDmLp0YE=;
 b=B7WL+hpJDrm5sQPKS+PKjKyAAKtGVS3yngbopK+Da61vh+Wuc6hN+ZnGkoKr4tR+RBuhbhroz5R6MSnx5vNb7gPq0G3ysoPqk1ogje4aPKhooSE4AqxSiT4d8EnfrAHheTLfGghFYKPfd6pzt9hNQQqhrsiRQ/y89uqFgM8tq75Cpeb22w1Sg7HSO+XpsG1/DUF+Ay54aKS+HZZ3wwPiatcJHMf4I2DVSDVElFjdyWBeoHVWCHjpAy3dB43bbeb8MUtG7flKnMkcWTMe2TVY8NxnNA8x9l8mOitNxbq0ZH2qySRnESmIjp4g3rCemFxH2C3R6lwCuE+/R0PfoHglNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com>
Date: Tue, 28 Nov 2023 11:34:04 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
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
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: 623c4868-8194-46da-36bc-08dbeffd8b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	knB3XGgztw8Q6IXSzcov6Htl0Fc/g7a8VEoSEqWaO3WqFEq22fyeYXq+1Y+lHNYhHey673U7EqYGglZoZId0c09/CCyS7zE8Kff3tONmuU83TC7p3GtzpXDBCjiAwias3feGuFFerLAyhlmAaHgb7VpNCoGovDtaWgbI7ldWCDmAEh70pvhX3pL6cwa3d4ov0ecaK8SbytHCxGB+QK7ljLdDVsh1L+Qy29STHMH3Dkzhuu4pLkgb8wyGHwSRbbcmw/Cel7g7zlyD0ZY25h0Q+UOyNTnixctnkWk16P8sXn0zXRYphYMNgUlRP6hiUKzjur+UzDbyljCc6/oKxOnQMnS8V9OEiQLM53q7uXq/T/G3yqNQomLw5W2i/tnhoSHPlBCccNtochQW0st9blZpD5qmvJS4/Vq1RqCDNOzfPfIekdTzl9VWAAHoW1xJ7dpB1E+//wNhMhTJnj6aEWOVp/KrKbVEYNuMNPCuIGatUhmdBaelVRkDyfr/ElNYaBHYCifl4YK+McrtJ51MMp+j51S7WjT36xO+6EcY9zRLfDOtegOzsEQr8Q3wbh4/5i44K3Ny2p0z2Di+dAC6cj9NRz8A4GJUDTDzw7l4XGbZxxOVtaL4sJRsOe42JHULoEv/EIdCd2ovLvPz+IXU/xx8hA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31696002)(86362001)(2906002)(5660300002)(6512007)(31686004)(6506007)(8676002)(4326008)(41300700001)(8936002)(83380400001)(316002)(54906003)(38100700002)(36756003)(2616005)(478600001)(6486002)(66476007)(66946007)(6916009)(26005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkZDRzZ2RlFwZUNJZEF1c0FQNmdtQW1YSVVaUXlrZS9WTFIwNlNPSmhWa201?=
 =?utf-8?B?ek03QjQzMkVuWjJMbXlLL1NDZ0NXWDgxNGtMVU1SWjMzaWlTUkw3Vm5ib2Mz?=
 =?utf-8?B?aEVyV2xZbFAyQi9TNnZWS1ZPMHRIV3hRcHprUDI3MmdLMUFWVGpnNTZFS0wx?=
 =?utf-8?B?aFlMMlJuYmxIOVEwdHdYQzNENy9aRkJiQjltSldpVjBFelk1RlNBL2lPMXZL?=
 =?utf-8?B?eVJabjh2MWFoWGV0NTc2eVRhYmpBdjBpM0RZd1JyT1VjT3VtanF6ajhvUWQ4?=
 =?utf-8?B?MnFNSy9waHlSYzIxb3JMUmYyVFhCQ3hUNCtneE9VN21vdjdYSlVENlpLdGNF?=
 =?utf-8?B?Z0QyUXpWc29ITDFJeWVWbXVIRDVSZHJJUnlpZW1JVDZSa1JKYTJnVTBoT3Fv?=
 =?utf-8?B?VHVUSXZUcm5BZndwNHA5WUNYT3lZclFndlBqN0ZQMFhqVm9HY0IxcTRSR1gr?=
 =?utf-8?B?dTlyQjhYeXdyQzhPRW5panJ4L1BQa0hySWllVlZWYWl2OFA5QTlCVTJXWVZD?=
 =?utf-8?B?TmRDOFIzRDVpWk5pdU1JRVJTRW10SDlqOWhCQy84MHNNWmZBNlc2QzBINW9R?=
 =?utf-8?B?S01KTkxtWlFPSWczU1ovTXg5S2MzdnYrbUFVRkVhcUNrS0wvMlJML2thZkoz?=
 =?utf-8?B?UW54dDJsTVJnSXdmOHkvZTg3UEdJbHp3bTVoTnBNZlpuZUt2cXdXdS9JamtZ?=
 =?utf-8?B?OGNHS1lOQkdBRzNqY3VYd21hejR3L0NtNnZFZzBwQUZUaWhEY01weDdiNDZi?=
 =?utf-8?B?TlRLajljeURzTXl0Z1hWak8waXVsd2RwdUlWNzdpMnRtSzV6bTlIL04vMk5x?=
 =?utf-8?B?VTdhS3JzTlk1eEV4dnAzN2lPWlB1YVlLYVlnVUVEalJXbWZVOUxPZHF3ajdF?=
 =?utf-8?B?Mk9FdW9xbnJUbzZGMmhQKzEwSnZaU20zbVdRcW00M2E5MzNxeGV0Ylplbzdv?=
 =?utf-8?B?L1QvVW9ZYjZiYUZlcVZYeWFwWUR0RCtVblZPQ2p6dkJqbXQ1VXZNN0UrZWtm?=
 =?utf-8?B?VTBCbGpwTzhtdE9qc2RpWk5RaDU1dWJ2dHN6OHZNbkk0eXlwTE1Xb0ZFVzd5?=
 =?utf-8?B?cUI4TVliS3A1QmJiU3c0MzJFNHNBaFl0SWw3ZVFPdytPMTY4M0xFb2IzVStW?=
 =?utf-8?B?cThCTld5b1piZHdQSE5rNEdjcUIybVF1TjZ6Z3FvbndmWk5IYmt0dXk2bmNy?=
 =?utf-8?B?RDFKblhWSkEzVVhnRXQ1U0VaSFN4Q3prWCtEOWd0MlhWNnJqOFpSWThpa1Fi?=
 =?utf-8?B?ZmdlZVhSLzNya2wyU3dhQXRBbkF2Vzc0SWdxWW81VVVWRHZQWTFwRTcwU2s1?=
 =?utf-8?B?eHJNaDJGWGZBQ0tEOHJZZ3J5ejhicjg2MUdINmxHL2xwNlZoa0lidVJERncx?=
 =?utf-8?B?ejZLeEZURlJGVU9IMXZ3ZjQwWWpUQkNjZ291VSt5aUVqd2tYaXRLVTRaNzRN?=
 =?utf-8?B?Z2tXOXBLUnpXdGcrZWV6NTJRbVlxWnpVUGJ3YS9FOFpRMmFITlNxRzZXbWNO?=
 =?utf-8?B?cFBWUHRaYU9CZzQybDdyQ1BUcE0xYWl3Sy80SXZqQnB6QlRwMkhFUk5pUnFF?=
 =?utf-8?B?Tm9nNDZ4b3plQjlVTUtSb2dOa3Z6OWhES1Njai9CNDg5RXZ5WTJVWjJxeVl3?=
 =?utf-8?B?K3VWSTFiM3JNdENSRzUyUDFhK2I2cnJ2bUV3VkhYQUFsbW93aGtWVGVRbUQ4?=
 =?utf-8?B?cWNndGlQbUhWSU1EbW1EaFM4ZldqS2h2SENidk9oV09JS2VqUXpNSUJDQ2Ni?=
 =?utf-8?B?UlB4SnEyZWE3dEtBajNwbDgwc2NWaCs1aUM4TUQrRmlIUlpTeDRtTnU0UW9K?=
 =?utf-8?B?eThmdEt2S2pzVFJnbWpHdDFaRnlCZFZTdzhuNzNYZk9qVGh4ak5SSzJMZHp0?=
 =?utf-8?B?ZHllRTV6RmhqOWh1cVlJaUVOd084Z1RMOGR1ckQ4OWw3dlEveGUwcFVGR05X?=
 =?utf-8?B?UWQwOE9wTytnL3FXd2IzSFFYMUNGMmdiLzhvTFROY09sY3B5dVFRM0daZ1Jv?=
 =?utf-8?B?WHhEUkVNYXlGZ2tTRWZVUUlhTWJiejNwUENCUFYrSldLQSsvdVJzMFJ0N1lZ?=
 =?utf-8?B?VERwbWw4YThhTitveVZXdm1IV1A5bDNiMldaQ1VadFdZMGJwZHdzMkdnd1Rj?=
 =?utf-8?Q?kvGbS0x0UvXt/+l7QFdaai9x4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623c4868-8194-46da-36bc-08dbeffd8b8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:34:05.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fla6ULWxSMiMgcLLqikFOQ0bLgTcMhOjYFl4WfxG4WSMSXbu/lsyrZVYwLIC8IWmDKD2zmQbNQNuf0S0lg72mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844

..., at least as reasonably feasible without making a check hook
mandatory (in particular strict vs relaxed/zero-extend length checking
can't be done early this way).

Note that only one of the two uses of hvm_load() is accompanied with
hvm_check(). The other directly consumes hvm_save() output, which ought
to be well-formed. This means that while input data related checks don't
need repeating in the "load" function when already done by the "check"
one (albeit assertions to this effect may be desirable), domain state
related checks (e.g. has_xyz(d)) will be required in both places.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Do we really need all the copying involved in use of _hvm_read_entry()
(backing hvm_load_entry()? Zero-extending loads are likely easier to
handle that way, but for strict loads all we gain is a reduced risk of
unaligned accesses (compared to simply pointing into h->data[]).

Would the hvm_sr_handlers[] better use array_access_nospec()?
---
v2: New.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -379,6 +379,10 @@ long arch_do_domctl(
         if ( copy_from_guest(c.data, domctl->u.hvmcontext.buffer, c.size) != 0 )
             goto sethvmcontext_out;
 
+        ret = hvm_check(d, &c);
+        if ( ret )
+            goto sethvmcontext_out;
+
         domain_pause(d);
         ret = hvm_load(d, &c);
         domain_unpause(d);
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -30,7 +30,8 @@ static void arch_hvm_save(struct domain
     d->arch.hvm.sync_tsc = rdtsc();
 }
 
-static int arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
+static int arch_hvm_check(const struct domain *d,
+                          const struct hvm_save_header *hdr)
 {
     uint32_t eax, ebx, ecx, edx;
 
@@ -55,6 +56,11 @@ static int arch_hvm_load(struct domain *
                "(%#"PRIx32") and restored on another (%#"PRIx32").\n",
                d->domain_id, hdr->cpuid, eax);
 
+    return 0;
+}
+
+static void arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
+{
     /* Restore guest's preferred TSC frequency. */
     if ( hdr->gtsc_khz )
         d->arch.tsc_khz = hdr->gtsc_khz;
@@ -66,13 +72,12 @@ static int arch_hvm_load(struct domain *
 
     /* VGA state is not saved/restored, so we nobble the cache. */
     d->arch.hvm.stdvga.cache = STDVGA_CACHE_DISABLED;
-
-    return 0;
 }
 
 /* List of handlers for various HVM save and restore types */
 static struct {
     hvm_save_handler save;
+    hvm_check_handler check;
     hvm_load_handler load;
     const char *name;
     size_t size;
@@ -88,6 +93,7 @@ void __init hvm_register_savevm(uint16_t
 {
     ASSERT(typecode <= HVM_SAVE_CODE_MAX);
     ASSERT(hvm_sr_handlers[typecode].save == NULL);
+    ASSERT(hvm_sr_handlers[typecode].check == NULL);
     ASSERT(hvm_sr_handlers[typecode].load == NULL);
     hvm_sr_handlers[typecode].save = save_state;
     hvm_sr_handlers[typecode].load = load_state;
@@ -275,6 +281,78 @@ int hvm_save(struct domain *d, hvm_domai
     return 0;
 }
 
+int hvm_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    const struct hvm_save_header *hdr;
+    int rc;
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    /* Get at the save header, which must be first. */
+    hdr = hvm_get_entry(HEADER, h);
+    if ( !hdr )
+        return -ENODATA;
+
+    rc = arch_hvm_check(d, hdr);
+    if ( rc )
+        return rc;
+
+    for ( ; ; )
+    {
+        const struct hvm_save_descriptor *desc;
+        hvm_check_handler handler;
+
+        if ( h->size - h->cur < sizeof(*desc) )
+        {
+            /* Run out of data */
+            printk(XENLOG_G_ERR
+                   "HVM restore %pd: save did not end with a null entry\n",
+                   d);
+            return -ENODATA;
+        }
+
+        /* Read the typecode of the next entry and check for the end-marker. */
+        desc = (const void *)&h->data[h->cur];
+        if ( desc->typecode == HVM_SAVE_CODE(END) )
+        {
+            /* Reset cursor for hvm_load(). */
+            h->cur = 0;
+            return 0;
+        }
+
+        /* Find the handler for this entry. */
+        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
+             !hvm_sr_handlers[desc->typecode].name ||
+             !hvm_sr_handlers[desc->typecode].load )
+        {
+            printk(XENLOG_G_ERR "HVM restore %pd: unknown entry typecode %u\n",
+                   d, desc->typecode);
+            return -EINVAL;
+        }
+
+        /* Check the entry. */
+        handler = hvm_sr_handlers[desc->typecode].check;
+        if ( !handler )
+        {
+            if ( desc->length > h->size - h->cur - sizeof(*desc) )
+                return -ENODATA;
+            h->cur += sizeof(*desc) + desc->length;
+        }
+        else if ( (rc = handler(d, h)) )
+        {
+            printk(XENLOG_G_ERR
+                   "HVM restore %pd: failed to check %s:%u rc %d\n",
+                   d, hvm_sr_handlers[desc->typecode].name, desc->instance, rc);
+            return rc;
+        }
+
+        process_pending_softirqs();
+    }
+
+    /* Not reached */
+}
+
 int hvm_load(struct domain *d, hvm_domain_context_t *h)
 {
     const struct hvm_save_header *hdr;
@@ -291,9 +369,8 @@ int hvm_load(struct domain *d, hvm_domai
     if ( !hdr )
         return -ENODATA;
 
-    rc = arch_hvm_load(d, hdr);
-    if ( rc )
-        return rc;
+    ASSERT(!arch_hvm_check(d, hdr));
+    arch_hvm_load(d, hdr);
 
     /* Down all the vcpus: we only re-enable the ones that had state saved. */
     for_each_vcpu(d, v)
@@ -304,10 +381,7 @@ int hvm_load(struct domain *d, hvm_domai
     {
         if ( h->size - h->cur < sizeof(struct hvm_save_descriptor) )
         {
-            /* Run out of data */
-            printk(XENLOG_G_ERR
-                   "HVM%d restore: save did not end with a null entry\n",
-                   d->domain_id);
+            ASSERT_UNREACHABLE();
             return -ENODATA;
         }
 
@@ -320,8 +394,7 @@ int hvm_load(struct domain *d, hvm_domai
         if ( (desc->typecode > HVM_SAVE_CODE_MAX) ||
              ((handler = hvm_sr_handlers[desc->typecode].load) == NULL) )
         {
-            printk(XENLOG_G_ERR "HVM%d restore: unknown entry typecode %u\n",
-                   d->domain_id, desc->typecode);
+            ASSERT_UNREACHABLE();
             return -EINVAL;
         }
 
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -103,6 +103,8 @@ static inline unsigned int hvm_load_inst
  * restoring.  Both return non-zero on error. */
 typedef int (*hvm_save_handler) (struct vcpu *v,
                                  hvm_domain_context_t *h);
+typedef int (*hvm_check_handler)(const struct domain *d,
+                                 hvm_domain_context_t *h);
 typedef int (*hvm_load_handler) (struct domain *d,
                                  hvm_domain_context_t *h);
 
@@ -140,6 +142,7 @@ size_t hvm_save_size(struct domain *d);
 int hvm_save(struct domain *d, hvm_domain_context_t *h);
 int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
                  XEN_GUEST_HANDLE_64(uint8) handle, uint64_t *bufsz);
+int hvm_check(const struct domain *d, hvm_domain_context_t *h);
 int hvm_load(struct domain *d, hvm_domain_context_t *h);
 
 #endif /* __XEN_HVM_SAVE_H__ */


