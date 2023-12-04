Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40566802DCC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646632.1009085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4uA-0001lw-S9; Mon, 04 Dec 2023 09:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646632.1009085; Mon, 04 Dec 2023 09:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4uA-0001kI-PI; Mon, 04 Dec 2023 09:06:18 +0000
Received: by outflank-mailman (input) for mailman id 646632;
 Mon, 04 Dec 2023 09:06:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA4u9-0001kC-Ps
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:06:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61402c72-9284-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 10:06:16 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9236.eurprd04.prod.outlook.com (2603:10a6:10:370::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 09:06:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 09:06:11 +0000
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
X-Inumbo-ID: 61402c72-9284-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyPzSinaoNfPWUr0kY4xSTFYlKdj309y+GQSg9E4E/Qw1tRb78N1hqdcMwS4ROHKjD8DHh9MGk39R7fZ6omQ87+Up1dpXP4yLkhQCHlz1wdYUe+MRq6iRhyJPFGYLyv6Z9tm4Xf/mRFkvwjDco7E+lZYodEFWag29e7MCksMl/8ww2ObaVR5spIQWccPdWpGIsNbcDeLkCW88sLSAnoH1eDaXYARt9iQWcr5c0VsjdZ11qEsdPEjGGZju7Es+FLRbd+V9KWXP7y6ZSelibEJOBdSLaQpfOg7mai1Jh5svN2IgJ/Vdj9IPSEKFS7W876SjVf/pA/sfDacJiT9oHivAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TL2xyluej5IlMzpe6AGxteDzWrBUSR2Ws9tBegKHXyw=;
 b=TK4X/2z1R7t3HhhDEzey/OEQVzCklOrZkgQ3MUmgiulr25QazIv4ASAjpbMHICOOJaFoDgaGsp3xp3VAxaf1SCoRdBJdyUWK5+zewqezB/oZBjk9pWdxzhqbR00AaSNRbutiyAUT3Z3627OD6M4d92lRxDaUWCMqMmBfi4UyEhTzxJO/Xllr6zXhcrcl7Yo3NSFsFE8+DqG6HqqS4eGjEJCs02ft6Q8POuP1Xkr/cmX7Ci9Pwyl4QsBNQnAf8cVruhi4W58C079UJ6iPaa0KyPycCgWQXDfqzLDCisHE9UUcSzZ9D+i5YzZQ0Cyzj3moZLx7b6oLkDNLKn+BZyXvGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL2xyluej5IlMzpe6AGxteDzWrBUSR2Ws9tBegKHXyw=;
 b=YUVJ9C5xYmZln+LftN7VVK54PbDi6nQ0JdTNw6fv+q6fHAxZHs+XIRc3dWIfdGCcsb9c0yYgnG2FEKgIbsr7x7ge6+BQmjJEUjDsKyySWZwqnVihiqvuNYj8nR+Fr1YwqiLiSpCOcb4jKFTHfzUvdaciFX3qykN3qn2Jr1S8lHHyGXAs2nOMN8MDlSvpx41NI7nIHc/sJbZmM70rr7AaagSmRFdmcLq/WIe0t5+iX04qhAqu9hhTtioRf7QEe0u/5MpDEByBoT9SmdQFAjNR1HKyzsAtEOxG5QWap08Rp5llGyKA8xooBEj90u0a3GjIp6wZXLFtp+mXchAjagRZwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com>
Date: Mon, 4 Dec 2023 10:06:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: afe01a9e-949a-4370-498d-08dbf4a8427d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PMMMyKuQex+1XDp4WOEtCWBQ/YVvhepe+kMvRb93wx0QfyTHDaUPvv4Ay9br1FcaUK12DcWk4wYOECGlACsuWf0hEEV3qBiW3PnJ2Pf8YKcFyCcOPFKQT5nraB0AI7zH4Ba3kUVBVBlFMFxHwYNSBkQSqkt2gaEaepW8iCZ7cPSqH2UNhVZFV49MPn/UEllWXXnBzP09XTNZNyVaPwuoyQizcAWCJSyOOSMnqy9pEIjJBpwjFhhMUGBxh6htiPnKkSxkT3WmErreMpaJBXRIBr6rxG6qBTN0p0dIfh38hk5KtwS0S9XL6PSqHWo/W1Mg4bjr6eRolorJ04a9endgp75kcVM4enK307rhxyTvUjxT3rNw2n2U++tOiqynbwKkIk3VoGC1P7TWQcR9UiVWOQm4NFLET6E2+GIlWItEl1+vDZhQB2U1a/+Yq1MmrzgHMipAorQb4MJtvAAvnSWvQaAetKHRAXCxsNjO6jFSpTGSTDa0bwFXDAIvSLrLN9/CGKEMFGPcazTD/jpARtJ8PhwDs0fNL+rLkw4yc13HgkFGg8x49QPZgHBCqbqDMllns3sVEY/A5/RNC1nkEgPdc/lUs6BRflsCIl4UyPWOUAC3qujq8utoe0QRrw0e6/2aTplfbMqCMEMDxI2AicJvWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6486002)(4744005)(36756003)(6512007)(53546011)(6506007)(26005)(2616005)(41300700001)(38100700002)(86362001)(31696002)(83380400001)(478600001)(2906002)(316002)(66946007)(66556008)(6916009)(66476007)(8676002)(4326008)(8936002)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWxjNTRFU1I3ZDY5bTZLVDl5dEU4b1NpYjgwd1V1dDNSWno2TTkya2MyWmFD?=
 =?utf-8?B?akkyREJJaTdPWXk0WXN5cEh6VHFqT3BWb2tHRGpRQ292WWUzYWFhKy9jVTlT?=
 =?utf-8?B?Y3Z0WVhDQ3hiUlpsdmo0TG42K3RaT0c4dnFKdVZ6aysrNTV5dnVNYng2N3Yx?=
 =?utf-8?B?ZEg3RnpHM1JpL1ZoVlp4eUxDd0t1RXpDdmF3cGhSRmNNZklWQkllMjRtZUxi?=
 =?utf-8?B?LzR4elBJMEJlS0hXSGlla2p1VXg4YWZ3RlJLaExVeVlHZCs2SFNoZ0oxS2Rz?=
 =?utf-8?B?emJJNVRnUzFCeTRabk5oUU0wbEFZQzZKUzY3OWtldmxiNm4ydnBvd0tMZ0lI?=
 =?utf-8?B?SkY1NGIrT2FnZ2JWL0dpQ0ZTSm02ejZwbU5TcGF4cFNnWXYvUzdGRXNjaXdz?=
 =?utf-8?B?ZkxZRFhTUmFPZnRxWjY3VkpBU211SlUyeUV5TE50RnpKQnMxY1ExME1PWHRS?=
 =?utf-8?B?ZFpWMXZxNWlxdUlVNmphVWJCZzl5MGZkVE5EMExJL3FJRHhDUk9rSG4xQ01k?=
 =?utf-8?B?alc4NndWQXphTkQwT1BWYnhaWnc3cEd5UEFqdUJ3ZWlnQXdaYjhKTVVwTStO?=
 =?utf-8?B?QzJmc3NQZjBPa2o4d2p4MkJRQksrOUdFODVkbGVualBhM1paOWVPWDZXN0FE?=
 =?utf-8?B?bjFoWS9CNmhYNjRycFYzcGh1enBOTWVqWmRZREp5c3NOUlRNZUZQdmphVXE4?=
 =?utf-8?B?KzM5S0NKMW4xUXNXVnVyTTM5MHp5QzU3UjZPMlVDY1AwSzQvd2hIOXNmUTI3?=
 =?utf-8?B?c3diTmxud05FU1cweUFSeWh2SThla0lwMSs2Z2ZqaGxMUUs1WFhUdjhVRXli?=
 =?utf-8?B?ZlRtclE4bEtsUUJiOCt1NU9YMHRjZmc2K1BESzg0M3g1VEFINStESllNSDVL?=
 =?utf-8?B?ZUptcy9LODR6bHFyVnJDbktnRXlwT0h0K0QxTFdhTjY1R3lZWDhPTXV5VG45?=
 =?utf-8?B?aTJ1TzZsL0JhMVh4T3Y4bEZhbUYrdnc0WEpRak5ZUFAzd3lPZ2wxcy9LQ1BU?=
 =?utf-8?B?ZnRqL1l0TkZTSVQ1WXZqaHpxL0hqc1NEbmVvdE9takVXcGpWTERRM1hJekgv?=
 =?utf-8?B?K3pwaVpJTnA5QkFhUjAxbUZsc2N6OFZYQjA4bmxvNGJTQ0FWanJrelNyRStB?=
 =?utf-8?B?bEVEbXVUK29rZThORlFBY3QxaWZGd283RDZMc2ZDb2JGbWNtZ3piTjRUa282?=
 =?utf-8?B?TEJGUy9YK2gzc2JEQVpFS1JLaXdhZUcreGQxdnZwdWN2Y0FJdEpyK3JDVHZa?=
 =?utf-8?B?NVNEdHl6Z2ZmZ1pJS0lHZmk1MTdzSGlTd0FhajhWRTUybjl0c3ZWNHBkQTlD?=
 =?utf-8?B?Vm5iR2UyMCt2azl6WW93akNrQ0ZkZmdPMHdhbE5JczUvZ0FIY2hnWDFrWjRo?=
 =?utf-8?B?T2srVHZMVlZJR0JEdDVqYW9DbWtaTVcwWlBLR0ROZm9rZ1N6STQrLzVKSXBj?=
 =?utf-8?B?ckpsT1ZoaHZzZWY5ZUQ0c1lzV3R4cTVHRTZIQW8rakVXREh6MnMxSCtIRU9u?=
 =?utf-8?B?UFNqczNqbnRrYkZkcGdyaTZ2VG9UdWU0TUFZVW9RTDZLcHVDUWk1c01oazBJ?=
 =?utf-8?B?YjRJZFFGRnJzcGUrVkNVbzZWWDE2elJic1NLNmorN3M5Y2dlMVNUblkxQXg3?=
 =?utf-8?B?VzhSNVoyQjQzQ0QvaExlSmpyU2dqZHFYWUF1VUN6SWV6cTRhVDRGb1NPdDFW?=
 =?utf-8?B?NVY3MkdwYWdLREJpTkZlRDNyUnVEVmJmZ3BBZFJGVkw5VE5yZnZKR3o1M3R6?=
 =?utf-8?B?L0tCZ2FWQ09UWFRZM2lydGNYbTE0REF6Q3pBWmwvY0o0UnFMWjV2bGFzdlFt?=
 =?utf-8?B?K0l6QUsrelR6KzRwOHFLTncrUXlNaEttNEhQNTB5d2NCMmRyREplSWFDZFBG?=
 =?utf-8?B?a0ZKaDhveEdXWDZVMFFTbTE1UzFaZTlZQWV1UHBGVzh4Z1R0WmxUYzF0bVR6?=
 =?utf-8?B?a3VMejliSms0elpIMERaR05KZnpRM0hxSVJqaWRaVXh4QXVJVk83dXd2dnpi?=
 =?utf-8?B?RDA0NGw1M05EelRKS0NGUklwanN4dXMrelhrWGxtaTkxODB3VkxxcnB1eXhC?=
 =?utf-8?B?LzRKLzVkUFhFcXdhT1owaHR5L3lKVnZTazM4bC9qOTEvZzcyb2F1YS9VY3R1?=
 =?utf-8?Q?mnMUcexr3wpf7pW9ngxpmlKE3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe01a9e-949a-4370-498d-08dbf4a8427d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 09:06:11.1826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT7EWGoErY+2Ek+jiG+y7tz7GW3fqNjlFaqjARub39/g6KBZOzC6BAcOn2+KOR80Hd4Se9250senqmX+cckV7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9236

On 03.12.2023 10:56, Sébastien Chaumat wrote:
> Hello,
> 
>  Trying to get the Framework Laptop 13 AMD to work with QubesOS I hit the
> following Xen issue :
> 
> Xen version : 4.17.2
> Kernel : 6.5.12-300.fc39.x86_64
> CPU  model name : AMD Ryzen 7 7840U w/ Radeon  780M Graphics
> 
> The touchpad is not working (not detected by evtest) because ( see below
> for XXXXXXX values) :
> [   10.215870] i2c_hid_acpi i2c-FRMXXXXXXX: failed to reset device: -61
> 
> which is maybe related to the previous messages :
> 
> [    2.065750] [Firmware Bug]: ACPI MWAIT C-state 0x0 not supported by HW
> (0x0)

Not very likely to be connected to this. Afaict you'll see these on all
systems.

> ...
> [    2.464598] amd_gpio AMDI0030:00: failed to enable wake-up interrupt

Possibly releated to this. You'll want to obtain a full-verbosity hypervisor
log with a debug hypervisor, as there may be hypervisor debug messages
telling us what Xen may not like.

Jan

