Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF487F5CE4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639579.997092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67IH-0004hv-S4; Thu, 23 Nov 2023 10:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639579.997092; Thu, 23 Nov 2023 10:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67IH-0004fd-PJ; Thu, 23 Nov 2023 10:50:49 +0000
Received: by outflank-mailman (input) for mailman id 639579;
 Thu, 23 Nov 2023 10:50:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r67IF-0004fT-JE
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:50:47 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe12::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 277b78cd-89ee-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 11:50:45 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6998.eurprd04.prod.outlook.com (2603:10a6:20b:10a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 10:50:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 10:50:43 +0000
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
X-Inumbo-ID: 277b78cd-89ee-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCuSs7gxXarWIhg9giZATtHdNRWXktOkcoLBLgvi9sWYMVMd8E3QdE+GLcL2+py4/eS8h22XUqfOn5uwPNK8d0wFvN3hAQ+CqShL9m9Cc3zFlchYGvN2+YegQmPB9jUU89xAhQe1N6uNB4D/Cl/6dUsYxLWenjrDZvLAtT8YPBpo6dNNgHZlvVnla2FvCyQguLYvS2LdaP7ph3s7j2uHnz7u5rgH9iIQQkVFAscCk1sxaOkiNhVDi1Hv94kWkPmWOZdUWTcbpzzh0v+qwjvL8362IPAhaIJZf8WkAG36vR6xV7IWRAnDq7jQ8rCBnQ7JWX+hY7hgVOE/x8R2h3l5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNVZdE8iHM8PekIaTbwXaseXvxphJSnpTETlNXLs9po=;
 b=CtqzWRZf8XngJF7migHLiKPrL6V7QYrszB9I7xtOlcWcX5WGkzU1BMQ5Mk4d3v4LL0AiOlD5MfcmscV/Pu9zHhSjVEJhzeAhWdaKf9YamkIK7b+NBsSxozDE2gzyJZ9IjdV36qvVJY68wsCcip8Z/bqzo51P4JHEiSn/FU9aLMkIanWLJ1cDkQEExaisgSyGNY/KqDEuKNwpvL5h6JbV/ClkOhNdGGAVzuw6/dhANJN0psEkmg5iynpAimFIJz23TZi9Ep74x0ztofTyVMiMFC+HpE4KVrMUCKII2npVnrHZ5KVfoV5Se34bwVK1gV0PIPHgDpjdmaHQRBiNqdVarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNVZdE8iHM8PekIaTbwXaseXvxphJSnpTETlNXLs9po=;
 b=MkcpsKHDKqRSq2poB68KCANlFqJX88Ye+9F8TkdHuHxD9Ia/Y6SFTn+9efp7ufb3nytQnuw/PT0mbB+uUOqihGrvEX+DBZ+yZ8UbZuodxSmgPQvETOdCZDUBAF1mDRr24USz8bfwKtv0sJb8wn+Q7n0TsnsHjhL+eW7bUjZzhcbvzBVXKvfJCJLW/DSZ6ZFB9p8oDWHMrJEr9l2WwS/Yosnc820DbT4j1AfWjdOQtwBII+PcqP7xvOjo6p3Ss4m6sbFpomOSYRAyaT8dQAgtvo09P3AHJm1hm1fP8l0W1lS0nLAYhvr7UrFyytFX/grkjO9xdgJtMZ9ynvO55tPM1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f52395ef-5995-46fa-8dc2-6b49b3d79ccc@suse.com>
Date: Thu, 23 Nov 2023 11:50:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: limit upcall vector related verbosity
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <8efe0fed-8533-474c-9893-e6fcb38b93ca@suse.com>
 <ZV8tueH53FROk86e@macbook>
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
In-Reply-To: <ZV8tueH53FROk86e@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0358.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 314cb406-54f5-4ae4-be08-08dbec120ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	azfnp10nxr4m4KfIU/DxuZsg8YtvAgCrCcSDBGwR/41KPsrDs+jDlj3E5TES2Pb4QTq005Qo/z4RDL1mOlXUYdP+fv7o5aU8/BIROklR9A+vL1lyFAtUqvf+oQXjU71sB4K+WduwLnNP5+wkZUlH0wpDRS1fnr430BeevWd5qZoVrRvUdRMXkeis/EvKg0Zqi9A0e70b7UT1j7t5mog4sWT0OiCWSFMIsb9v1ofYOSRZtuwKf6WB+Mt6J5zgwU8RsKvxmbycjVHiHy751x1trrtZVSd9dsPDU6JYHe1Cg5+/JvL6uiV8zJNArib+35RwuOVeSEaSXjE/mQ2Hbij1PLn8v0lpcM5h2WFLeMAkduH0TSBaSd4KWdi7N7iMgIAq1AqFmxC47BNPRrv03wLQfYEyZn9LABgTGJRjOoaUKPNT+6jxJoQ+lzUEaxU33+xKKUABw5acgZSkF9S3r+rNZzI5Y8856HFVI4L9mZpv9aUcRhqkJYp/Qw30caQHb5NjzjJ/C4qIu/pLbvEY0NrfPF8/1uFam0WAzx62OHTb7SYjra0ms517Wri/oHoeZKUOgjmKH7oFdJNBkfO7iuyxZdiuwp1BZ3+JQ+CZrJ+yZ8AF1WV+Yc/zX1ukNTRkuT4K/R3BPFjsiMicqvm9JfwxXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6512007)(2616005)(26005)(478600001)(6506007)(83380400001)(2906002)(4744005)(5660300002)(66946007)(66556008)(41300700001)(6486002)(66476007)(8936002)(316002)(4326008)(6916009)(8676002)(54906003)(53546011)(38100700002)(86362001)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE8va2oyWGxUdFFtenZpUG15ajBEdzhTcXBzcTV0L0RCSFZ2WUk5MFgzY3dQ?=
 =?utf-8?B?R3hwc3NzZkE2QTc3MG9OcXNhU0s5VDAxWk5nd0MxcFJiajJVNlEyVWZxaHZO?=
 =?utf-8?B?S3B2eWV3Q215WWw0WFNZd254Y3NLVTFHaEpUTUh6OXI2ZnBpcEIyc1A3TUh6?=
 =?utf-8?B?M2ZPSkhFcm1NTkVaVGN5bHlyWC92YzFpaW5uK1Z5dUtPOU5HbkFMOWJNcG5K?=
 =?utf-8?B?WWRzaVhMc2REeHhlVFFlVndPMlIzVWZKVksxM0Znd3czdm03cThxYkx1S3Jt?=
 =?utf-8?B?TElza01GeG82UzhoVE5peGtJSHpsUTRLN084L0JySWhYdWxOZFF4UXN0dyt2?=
 =?utf-8?B?QzQ0TXhZZk9CTUFDRlRVaE1UaFJnbTNzYU1oV0hWT0JXVFE2dVY0QlA2dUpo?=
 =?utf-8?B?ckJBai9jUElwdzhzZXprMXNSOWJFc0hqV2RGWERPcGNobGQ2UUt4b0l0eTRm?=
 =?utf-8?B?dVdVOWI5YnhYVThvaDJOUmZiVXN1cmtQc2RibmpoQlpXUHA3MjNHWDdnTlpN?=
 =?utf-8?B?VXF3TkkxaVJiUXFzN0NqVllCUno4UmRTWnVzT1dFck9jNHB2ZDNySkVxbGhj?=
 =?utf-8?B?ZG9rN0pRSWozUG5QWFExSlNUeHdPRHgyR2YzcFBFeW9BQkI0SUI4MlJJRlVt?=
 =?utf-8?B?YjhicHVnRTdEdlpBM003RHdpTWRTNkZZQTNqRUM3ZlBMVkgwMUxNdmFJOW1a?=
 =?utf-8?B?Y2c1UU1RM0Z1Y3d1ODl6bndxSFk1bEEzeEVQUEFZdW4zaFlJSEtvbkU0Nkcw?=
 =?utf-8?B?TXpSMEJMVmNXbklRb2NrOXh1M0hXRmFkRDRPUHVmNlR6a1NUVkU5VkJ0WWVB?=
 =?utf-8?B?Sm5rU3haSXpheXBZcWk3Tjl1SHExWnE3ekVQZFZaV0dWR1pSMXBKSldmSnda?=
 =?utf-8?B?V2IxOWRXNkpMTXcwMm0rMDE5SlY5SUNKWFQ0eVVkZG1OSjA4WmNaNmE0b3Fm?=
 =?utf-8?B?RnJMUWFOa21hNDQxWFA5SkpRZktpL0psbzRWV0xsSUVOVWQ1NHVRZkVZbWVj?=
 =?utf-8?B?d05MY0g4TVNIeGJuUm9iTitsdVdlTC96M2MyTFFPK2ZuYlRjTXBpb0IwU21V?=
 =?utf-8?B?blVVdE9MZlErNTVZd2RIeVJ5dDZONHBxVHA4elBRWS8rNkIzcHlUa0tpVzhn?=
 =?utf-8?B?UTF6S0pYbDZqZnBFSkxkbWtiT05XbnZ0RXdvblczRHBxNUxjL0hUbzhJcjEy?=
 =?utf-8?B?T1pxSlNEeG16V045U1pkbXdKYjhtdDdnZDRLSTM0Mm5OaFI1S0pmRmVNWkdY?=
 =?utf-8?B?OHB3YXpnbE1lN3lwZW1tWlhZTS9QZTZ5MDh2YVk4YkFNeHAvbU9uZ0hZYmE1?=
 =?utf-8?B?eGZ1ajRBcUpBRmwzYTEram0xNTB0SGpLMzNwVmlJR1ZxaFRaU3prOUIycU13?=
 =?utf-8?B?NU5NSGJMVFFtVnAweWZxNC9yQ3dCMU9hQVNDR1MxM1paK3hJaElKQ2RxRC9v?=
 =?utf-8?B?ZXczelpCRkdXMytXL1JyL3RZTUFnaGtOZ0F3SThDdUdVNEROYnp1SkZxU09Q?=
 =?utf-8?B?SGJFVFhObUdLellvUUY0V09ERXlIdHh0cjJxT2dtcHpSTGVsRmxoSndJdkpW?=
 =?utf-8?B?a015bTE5c1NUMkVqM0NTeWdXVDJJTzA3Z0R0TElvMEZGemJGR0RzVHlyc3NK?=
 =?utf-8?B?MnVRTGkvMU9CU2Q3MHlycTBNZ1RGQUVCaXNxV2pQYTVEN09TYk53dE51NEwz?=
 =?utf-8?B?RkpKUmRyMm9OdEV4MjkwMmZGMjd2UEZka080YUVCcGw5c0d3VUU0YlZHMFV6?=
 =?utf-8?B?dklzallPM1dabEk5V1ZYYmQ2SlFmcHhBSGNFMGsrQUIrZjk1MzFmaWlJazF6?=
 =?utf-8?B?V3o3QVMvSG1JZVBxZFA0WTZPeEJnUWQzZjNua2pTU1d3OXBteTBaYzN5bGJE?=
 =?utf-8?B?aTNVR0JSYnpzTStNMkh3NGdXRDBtOVNGamM4Sk9qNkw4RkkxVEN1TWpVTnlN?=
 =?utf-8?B?eGZ0YithcUxmaksrbVQwTklzb1JFL0xXMGVXTUh6Ri9jK1VnMmRjRTNpQTI1?=
 =?utf-8?B?eHZXTjRuRjdqVWZCcDQwRHd0SlIreUVsdzFnRDFONURLNjJhckQ1Q3d0TXdB?=
 =?utf-8?B?bGtqdGZhYjhjdjZRVmtkK3JpakNoeFRQdDR2TzRiNUdlQmR4WUNCbFA0bEZC?=
 =?utf-8?Q?YYhWnTBDk2mKqiLAgw9ZomwAV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314cb406-54f5-4ae4-be08-08dbec120ab0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 10:50:43.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGHL3+XtJMC7cnPaM59ASlbFsNhvHsxffZpD+CmztN24M0CT2eiFVEO4Ms4VtyOXodsFHIAdb4OMWOefBR/Q3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6998

On 23.11.2023 11:47, Roger Pau Monné wrote:
> On Thu, Nov 23, 2023 at 11:25:34AM +0100, Jan Beulich wrote:
>> Avoid logging all-identical messages for every vCPU, but make sure to
>> log unusual events like the vector differing from vCPU 0's (note that
>> the respective condition also makes sure vCPU 0 itself will have the
>> vector setting logged), or it changing after it was once set. (Arguably
>> a downside is that some vCPU not having its vector set would no longer
>> be recognizable from the logs. But I think that's tolerable as
>> sufficiently unlikely outside of people actively fiddling with related
>> code.)
> 
> Maybe we could consider printing unconditionally for debug builds?

Indeed I was considering that, but it's primarily debug builds where the
unnecessary redundancy is annoying me. (After all I work with debug builds
much more than with release ones.)

Jan

