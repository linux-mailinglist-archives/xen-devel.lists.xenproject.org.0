Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACCB7FB4F6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 09:56:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642815.1002536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ttD-0007Gx-3I; Tue, 28 Nov 2023 08:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642815.1002536; Tue, 28 Nov 2023 08:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ttC-0007EK-VV; Tue, 28 Nov 2023 08:56:18 +0000
Received: by outflank-mailman (input) for mailman id 642815;
 Tue, 28 Nov 2023 08:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xcZ5=HJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7ttB-00078k-7N
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 08:56:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc4ea0d5-8dcb-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 09:56:15 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9472.eurprd04.prod.outlook.com (2603:10a6:102:2b1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Tue, 28 Nov
 2023 08:56:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 08:56:13 +0000
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
X-Inumbo-ID: fc4ea0d5-8dcb-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLK7jUbNw+j3FiszIwq3QxU9aYEmf601lkjU25mQO2/YPKGS3FwpRsbQzZcUSIIdhBFuSa50aBpld6Zh5pSMtbGewOWNIn+HTUbt8J5k+Y+zSCqLZ5x0ktshoyekIpvDWzYcmT2hiRlHIinYZ1xRBeaa+2D2CLq7cgl6IAiAXCwy8kldgHfw7YzU+PuNAaaGehShfTKUkXsdeiiM5jQ+TXH8U9R1++JGiZVSWcFkSpkqbww198TMo0j5QWGOKTUu5IzPvVxrV+TsUtNa70iU1i14SBGj2jznD4HQwt2Y7KTYYsG9QBwnitVepSFlVE7Vkw53KokQWZBOdnTNPP5hzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6Dgo/Z5pPVA+860FE7VmjPezpXu9kd5RFN0otc9Y0w=;
 b=FCoLlhrEwXu8r7nSuSNUAfD4NChMHHMf87KzO87d/1p3Q+p6EuwSMnbJJlvqW+l191vCoAluzrUDfidpZ0dOGNJNZmgUB5TgoOC9+ITOggjIJ5P9yej7VkhVh3Xm/PymkDmAKdZ0yHuQdZUpVNgMjLlCiHXBgiY8iib4B+yhnzuQCJgKWsqOxT1yHQgn/aVn70ATOptgvKHFx7DsfNLPkEMDFnJxRmFaMjLXpzxx3DvL+6VQkVoPwdpAxl3PJ6WTm3G1wN1i2p/3zBlFaYH6vBO13rOxmzSsln+rCnwKjlTzm/HVLSjzF68aSso135J41StBm3QS/mOiMB2fQrz4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6Dgo/Z5pPVA+860FE7VmjPezpXu9kd5RFN0otc9Y0w=;
 b=QfiHN3omffTFjHUAktNs2Uo2APZmldM9FPs7iNEHWSfU9kiHOh+P+izTjr9A+gLRfGN5rPknXgkkKk7eWjcFQrx90aU+Tt/IaPae1nxGiFJ6ZhH48G72qm3vm6yxd6YTMN5ekaWWiVIXTnzgG8wKRxnGZ1AFoNCsGRlreyVscc+57VlTQV//1FdxvXrJ0E8fhfkxPPm2SoD6+bsYqn3IQuQZbfP/4Wyv3QU8qtLM+ZNUmz8DpwsJEIE2OsUQS5glehi71RpqR7fWzpictH5RkMoW+lajTOrMs/Yuf3KZb0cF2NdQ5fQtdmFpmA9HgEU8YQ3TddcdOsGImrthQtMrxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <225661f6-fd30-4c28-84af-a6ff16def246@suse.com>
Date: Tue, 28 Nov 2023 09:56:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA: Compatible declarations for sort and bsearch
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper3 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Xen Devel <xen-devel@lists.xenproject.org>
References: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
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
In-Reply-To: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: d2cedcfb-5612-4d32-861e-08dbefefdf9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3z3l//e5iagwW/JWn1uYcVXdgeU+Q1+03y5c+ASvHQ8D7rPV6IFaTQyn6HpLSlcb6DFJCHN9LcN9ICwg9QZ9Y84tueYoh09Rxg1JcIuGmSOxOdolI/FXO7NmpHPhU5JE8UGOOlkmKq6RtqlILuTIxaPr5G2PuNtftaBjhrgddxyIMfdoMJc1QcZ7fWhkcby2zKwiRCWIrgXo+z/Ww72Ym2P9Asey3jZHD4et8WpPAQNtuxlAm3sNxKff3OBCge18q4w+HpaQdSZ922d7z+ztRZm6imQsVtt04HDYwgmnZ4YqgH3BubAQTblT7B8HEAhraW/i8T1rmrKgfAf4ytxySqeynhf8cDAt6UjHoxJH+EET0dIS75dvZo/pFmdcKDPYJyD3e/yALUKJbMYMInwJ+Gd5b9tg76RB4LChtyJ1mzpGfCx1eSRx1d+HX8IEoa4XHTzhDk34Jas4hps/BskhgEp3rNMUuQpgkc4MNhKLd6+d863PUxQd4qnBSQ8nP41parD2yxYNhomKwUPOTeF5mikpI8RElz2FWkvCQ01gyjjKuwN3wVnzfTO0o+849QEZhuG26QTnUP1SP/zPa6vR8afoSmHzOpy6tUYTKysE4Te5PWw0wvhMSTyON/FOE0S5K7ZS/Gb2LBFj7nzAzv+NaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66946007)(66556008)(66476007)(54906003)(316002)(6916009)(8936002)(4326008)(8676002)(2906002)(38100700002)(4744005)(6486002)(36756003)(478600001)(6512007)(53546011)(86362001)(31696002)(6506007)(41300700001)(31686004)(5660300002)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHJRelJIcUpkWnVJR0w0bVBlOGI5bmpFcFgrNUMrUnJjWWVDS0x4NUN6NXdo?=
 =?utf-8?B?eFdZd0Zhejc0eUNGbHlkL0NieVpKY1BIUHNEd0VOSCtqaWI2V0Q0SUlRVWxx?=
 =?utf-8?B?QnNIR2ZvQWlMRGpaS2hFOC94UndYTmtUWVZieVJyTTVLbzBIS0FRWGZlOE4w?=
 =?utf-8?B?elpSZGhXYUUybmxjOExGYUtqZzVRdTNGQjNhK0dYNitsemhaQTNScXBiK3Vv?=
 =?utf-8?B?c0xGZEZrYlJFeFE4cy9rQ1J5NTJIRzhnM1FOWCtFTXl1NC95c25GMElkNnhi?=
 =?utf-8?B?eURQVWlQREVMdHR0ck8vRzZMSzYrZXNRMi9Fc05oOHRrNlkyN0J6UjVqSzZz?=
 =?utf-8?B?Sk9VMnFEc2xoZG0yak9qRkk5dTFmY0o5bGdOUWlDUEpwZUtTUGJqZWdLZHZz?=
 =?utf-8?B?Tnl1WWNFN05XS1RvMGNzaU9LWkFvOGhTa1RjTGw3TXR1TEI3K3V0Q3Z0YjZh?=
 =?utf-8?B?UzVpcWd3clhqbXhjR3lRSnB1Z1RBVG5tOWE2ZWJCSWxrT3VSRS9iZWNiQWF2?=
 =?utf-8?B?Y2hvbjNIcjluZmJKcUdGQ1NhQ25OWmRxQUhXdmdIdHZ1QVE4ZU15TEVGM0h6?=
 =?utf-8?B?ZEZ5blkwazdGYy9ocVlNTU1KdG9KZmVhWGRFM3k4eGgxbklwcHRQZlJDZm9v?=
 =?utf-8?B?NitsNVlHQWlCbkFKQWZreVMrSEN4eUUxSlZCVDNLb0luWnRYcGcxY2lDYm91?=
 =?utf-8?B?MjBmaG5zZUljS2JUbTFUWGl4K0tuYThVQXJncUxYcit0dFg3Rk0yYzM3bUJG?=
 =?utf-8?B?eXBoU2hEWmEwOGhkajF5dkNsMFVzdHBEZWJkOU1aWTFGc2MrbUVzanQ1REZY?=
 =?utf-8?B?cy94WWdoc0lEaWVFUWJnSTErcERkMWZicGh2VWRwOXFwTThoMDVsUWQrSmo1?=
 =?utf-8?B?YTFJZjRScDMvMjZqM04vbE5pdWFYWmxtd0VRR3R0NEx0bWpzVWFBMzdqT3RY?=
 =?utf-8?B?SFh0M3RRbjd5Y0V6OGhpUG1lemVZWFhreXAzYWdmc29abWVEaElzZWlZVlJU?=
 =?utf-8?B?YjhVL1YweE14UDkwYkdCdHlXWk9zS1hHODNVaVR4cTYreTdRcjFkREYzeWRE?=
 =?utf-8?B?a2kzbkFPMFVUTTFuWUFzNGtQcWVVTUpub2c3TkllNlM3QUJFYlZCU2tpNk4z?=
 =?utf-8?B?blBkTmhQaFRXaXlGaVFmMHpvczJDU1lObHI4TC9Gd1VIV2xyejZKcWxUKzVG?=
 =?utf-8?B?VFdWMTdKQk05L3FlUnRaV0o2U3E5U0tWUUtSRkYreFZNU0g1OGFLRGRBZDli?=
 =?utf-8?B?ZEU1SXlPMUFDdWhCWk5Wc0psRUFlR1Z3UEVIN1lqcEdLSlFhaUNqN0FiR0FO?=
 =?utf-8?B?dHJmekVUMzJMTUpabkgzUG5JRGpjYjY5RitoalhKOXBYVTFjOHV5Zm1VUGNx?=
 =?utf-8?B?QTErNnpBU1pNSk94dzZqb2hXU2Z1eWh3blFubk56UzErMmxqdFI5aU9haHo1?=
 =?utf-8?B?OXRKcEhXOHpuTkZFMDhMZDByamJJS1RqTDVIaER0UEdlL1JEemFvMmpuYkhK?=
 =?utf-8?B?ektjUjJFRS8rNk5VTkQvRFZtcWVBN1dMMXFOdXk2K01adVRrVm5aN0JNaDJ6?=
 =?utf-8?B?WVcvT0VCUlpnN01NMDBmaXdkdmkxYnFlSGJZeUtDK2IyZGIwbFpkYWFzbjdx?=
 =?utf-8?B?ZHhsaVc0RFBRd2xnUllTMXZzaWFraXpIVE50SDl1YXlEd1c2N25nMlZBTzBj?=
 =?utf-8?B?U0tzRWIxWklXNXZrZ2xBOUl5RXdVNVZoZlEvQVVuZ01vTjZORWp0WHk5QnRT?=
 =?utf-8?B?RHhndnVUVGNFTnR6YWVVdFhkZkR5cXNxVFFCcEJTZVNsa0pwYUJsOGNuV2Ji?=
 =?utf-8?B?SzNVemJiZXltbjNsUjRNM1Q2RXBWUk9IOVo1SGx0cTFLNU9Dcm5sVFV0N0ZW?=
 =?utf-8?B?c1d6dzdTVGVneUVqcWRDREJKWkpZSjFiQ2ErTGFDUWtycU5SNnRkbGtzR0Z5?=
 =?utf-8?B?WlE3eEFqQyswQ2doeGt5eUpUSXlCcGgvMFdESm5zRElTMlNTMEcvck9NdXVY?=
 =?utf-8?B?QWNxdHJlRUJnMEplaTFBdEFSM0JuSFhUVHcxdG05VTdSWGJmMlc3MkNrUFFq?=
 =?utf-8?B?b0N4aUN1MVFySnZNVVlBWDRhdEswNURrK1QzZ2ZaK2xzbWhYVGt2YkVzaGtt?=
 =?utf-8?Q?+wcWfmH9htH5dSjzf0EnEO5BC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cedcfb-5612-4d32-861e-08dbefefdf9f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 08:56:13.2078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjF/QdjDOA7W9nf4oq2X2ls7ZV7geoFiRQLy3ANEBjRXWI5ClhacZpIs96mWA4qZm7vZZdj7OLZF1f/Ymee7rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9472

On 24.11.2023 10:40, Nicola Vetrini wrote:
> in xen/lib.h and xen/sort.h there are definitions of the functions 
> bsearch and sort that have no prior declarations, and therefore are 
> subject to a violation of MISRA C Rule 8.4.
> 
> I'm wondering whether it would be preferred
> 
> 1. to put a declaration just before the definition, in lib.h and sort.h
> 2. deviate these functions, as their signatures are well-known and 
> somewhat standardized

Seeing that so far no-one else has replied to this: My take is "neither".
It is the very nature of extern gnu_inline functions to work like this.

Jan

