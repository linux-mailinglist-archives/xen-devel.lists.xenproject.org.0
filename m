Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE77EC053
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 11:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633547.988443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Cry-00046p-EW; Wed, 15 Nov 2023 10:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633547.988443; Wed, 15 Nov 2023 10:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Cry-00045N-BX; Wed, 15 Nov 2023 10:11:38 +0000
Received: by outflank-mailman (input) for mailman id 633547;
 Wed, 15 Nov 2023 10:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3Crx-00043y-5W
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 10:11:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a97d26e-839f-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 11:11:34 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7502.eurprd04.prod.outlook.com (2603:10a6:102:ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 10:11:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 10:11:32 +0000
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
X-Inumbo-ID: 5a97d26e-839f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7VP8QzbSSbK4W643z7vApokMWUql7C/vxF32KzfBWBNUZa19wfNSTn3ZK0cK67w4aom2PcoDgP91LchhNPRMTaTwGcHjPkHhYwv2bD99wfQt0AFVHsP4c6At8CY/OtR7vxkjJWvnsLC3pYMQecilfpiDdwlUFvFxrbM3Q9erCmHVpKX1k7WhtVauJDC9uRE2WZth1tucoFVLMO9vx0JozhnCaIs3HaTnWp1UjvsXdFkKOJiTMLaIpZyB/Cbp1XfS79TbH3t7Lrhshc6ayRIHc6yVAbaNe1bpEBUz8tP64ev6Ap6NtUwA8xzpae5ikE9ZoCyRILq+g+ZvK+OXLh55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYJXFBKaYOgpxgC5MMaqcL1wX5blawR3Pif0Xyte27M=;
 b=E0H53D24/WANQrpm+XdeKMdQDY2Q3aoq55LIaABb1LaMuQI/aVfda2SQ5n7Q1o6CE1ciHJS5qp7kOyaMjKy9Yj4iEpC0+cRtWsUvA0bpa54s4gEC/THNRtK8UigKBo9/eC3vP6FY0/ZRj0cY5F4RTXBFYQyaTTEeEWoB70d3F0QUEA2ShqPhh3gH4OaPIlZMwzOiUG1SRGy3P/NyoOyrY+Cm2lgi9ks2eyQ3+g9uBso3qx1U5ueepnCsanex9Js1wVJvGD7n4os4A9D+EARi/LqwPb3k5Sba3sfKL3b5Tmrbd3LMEWAIGolpY/IP2N3ILm8XlH7+TSrGi/NEyGKoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYJXFBKaYOgpxgC5MMaqcL1wX5blawR3Pif0Xyte27M=;
 b=wR95hstM7u7BvQJ2PoG0l5fSZmMei3+EsT3RZf4EDcML+UCk9/kUJT81G91FQ0jndH9sj6N9dljztCCW7ZdoWRzkaxkdXBw94OE1TVYgmlbLF1H4DKXLsGL7cv8O+sRxZUFUMRK1MZBvTdL1s3mhUP3k5iws9sHSR+iy+DB7I6pJaxtWftakSmqrARwGE6tamGryp8l8NBX3j7jegfnL2pCiAFAG2sUISBkUILAXOmgdC06lWVhIdT6kP3b0x+B7t8kbuS4uBwaw38UqoUZqbx+5sbJwR34F0zAOYG2A6OEy239LZ5oEN+erxKEjwVUuB+hzanydwVskl+qjmueuTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6efe7a0d-eb87-42e8-aeec-1276e40574ed@suse.com>
Date: Wed, 15 Nov 2023 11:11:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging-4.17 | 28f44b60
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <6553d80525384_2ca04b0436ee@gitlab-sidekiq-catchall-v2-548c659f69-wtllv.mail>
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
In-Reply-To: <6553d80525384_2ca04b0436ee@gitlab-sidekiq-catchall-v2-548c659f69-wtllv.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0311.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: 5209b809-9c80-4b82-149f-08dbe5c33dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zuZonmBCGhq8Z6iWwo8lfQAcXHZmW2hRRIVNH6Z3jFcQC267LseNstz5kX0qe7Ey4ML8nnsse+Fwv5JWAngPY4rXIYwPaVyS4xTUA/dx7FblEPIUYYC41xd6icotkxNf+vrNWgptwmje6NXhBOs5W1GjV6JPoaidUcrsV8YEIdJwMDKMDMzCtEm0hWdnok1Ia5t2/I3Zs1MEU42w8027LQCoGfG34cFukoz64rcVEVYYCdMlcRr1KrGZ3K/J0gN6008F1m/hj0r6Cf4eJQ9mvfQg3Dl8+Sx9I3rE78VOYVlchZM6bHtVmri+CEe0SWoEklWpWRy/g2kB03A95IFVEnvaqh0XTr9pRAEj0vHkcaVPLuJsYKDrefTzXhlCVCtj3uS4BpVeNKXqz84MMtf3PSFV7E3mXo37Py1Or4xxGGed+hK3rYANDofg79xPstZEHdWILNVLIkSbfxwstIJIyqTSA618JAr5ibwNi18gDhleNCwgX/VMzGN35JMz2elbNOd6BuHoiz+cfkEgmZsUSotOhvnas37D3r9cELYBW57Z4qLA6z/vygSjCHT2UgbBeNiK4zTxdAcxI5a7QeWqwCRvnkxe9rfM+lfBXbd9cn2CSD4Xb2AsUQmdSGn50R117tE1udCG8R2AXIcG3bNAMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6506007)(53546011)(26005)(2616005)(6512007)(83380400001)(8936002)(5660300002)(8676002)(2906002)(41300700001)(966005)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(66946007)(31696002)(86362001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkpnTUxmanovOUd3NXlGYXlzNHMyQ2dMbXk3dEFDMkJLMlhWVGdmZmUwRi82?=
 =?utf-8?B?ODBxeld2K0VUM2JVV0lDZ3NDaXpYN3VjZ01TOGVhWXFMYm4yeTM3Vk5jbkcv?=
 =?utf-8?B?MXlaTm1uMHpKREJPSEZWTlljNXJpcmQ4V1AzcllrZ3JIQ2NzMWtLTnMwSUN1?=
 =?utf-8?B?MldiLzdXMTZ2TXZvUkZmVWRpQzI5SmcrR2lhbWJOMWZmTnpxcGxwTW15bVdM?=
 =?utf-8?B?MEZZNGtvOStpSUtXVVkzbFFwem5nbHRtcEp0Tmx3MER3cXhEdzFmbzU1L2w4?=
 =?utf-8?B?NUxHOTRKNVJxbFFGR0xKa3BVbUlHbEJ4STcwZ2lzWEVoUkk1RW5wWTlZTlhu?=
 =?utf-8?B?Q0ZFdGxFZEp3QnQvZ0VtL01CWm8zNUdQV2NENlNEdDNwd1NhUk5NQW9hTWcw?=
 =?utf-8?B?NlJLdWNLd2hkRWJZN3o3MWd1TFlvaGNZb0VwZ1pxbURYMHppVE11c2EwaDg3?=
 =?utf-8?B?cTJucU9YRUlTR25LVzc3VkVZbHNRQWJUaXFaK0tEdlEwZ2REOGdYWTNjS3Nr?=
 =?utf-8?B?dlJOUFNGa1hEZHlnblV6NjZOZ0EzazQyNmlxZ3IvWFVXU1ZacDh1UjU2K0Ur?=
 =?utf-8?B?Qlp5MEdSTEFNcENUOFk1a2hQUG9wbUppWVpKd1hZdWpQdkVBRTBkR2kzWTN0?=
 =?utf-8?B?RisvdTRoUkZIMGl0d283VFRKSGRTMlYreVErNjlWM3laM29LUzNNNVFVUVkz?=
 =?utf-8?B?YXdVN01lTXozK0paL3RtSXpPd2tkMDRoSm0rQ0E1dTY5L2E1RXpwUFlnNS9F?=
 =?utf-8?B?dm5ZbllpdjdTYlVzNWFkUmEzZE1Jby9rZjB0U2JuNjhqeVZEM000bXhlSlI1?=
 =?utf-8?B?amVHQkl4Y3F5SytRMlFJcWFGNUhLNU9YSExsajhXK1RhQzlHYzc5cjk1bHBl?=
 =?utf-8?B?dWNKNlBQU0VZNVRXTGI0a2pPc3pPaTJjWWNGdDg3WHVxMkduTTk4Vnpmc2J0?=
 =?utf-8?B?c0plTVMxR3FERlEzOERESkFia2NUMTZkaGtzQTlxdmVyR2Z2YUdmQThYbkRp?=
 =?utf-8?B?VndiVTU3MFZOVUxRV2NIRm9aaC9uUzBYclk2dlJwU0ZtRXNtTFY4YWRoNWVw?=
 =?utf-8?B?V3NRODcyVjFQMXI5TzQrTkVUbUw0NkkzeDBGVzJ5WTRwQlptNVFFTmN1L0hv?=
 =?utf-8?B?STJHWVRNSkVRZkNGaER0Q2ZHVCtHdWJsU2dnSUZVZVJEM21WRUdySjZCRi9R?=
 =?utf-8?B?RC9aMEd2NVFDRFBDWlhRTU8wNG1UbmlaT1Q4QnBweFZnTzN1K2pBZFlwZUkz?=
 =?utf-8?B?akVONm00QVJORkdPYS9mb3JmT3hTQ3grZTNOZzJrMEhvOHcvekcvdWtkdUlL?=
 =?utf-8?B?elJwUkh0eTRPL3pNWEluQUl1S3RzNmUweGhnaGorMFNWL3RXbnVHemxmcEZQ?=
 =?utf-8?B?dVVxK1k5bVJmOEFKdzhIYy9vZTNhVjZmcGQ0L0VJckErR3pKdm04Z29DNi9L?=
 =?utf-8?B?Y25VOXVuUy9RT2VFWXB3YU92alNuV1Bld2YwMm4rdUM4U2tQMUZoS2hQWFFz?=
 =?utf-8?B?eDUraCtCeUtiend6T0wrQUJxSEp1ZklqYjlNZ0dmRllGSVJ5eDdBT0xsL0w2?=
 =?utf-8?B?ZThHK3VzZ01TZHBMZTNmZlpGWDZQOHFqOVU0N2QwZ3cvaWJTS2JZNTRlWmJx?=
 =?utf-8?B?eERWSFA2aUlQZy8vRmJiVDg4bmJBelo1eUV1WVJaZ1QyWlg1ZjZFYytSemln?=
 =?utf-8?B?TU44QWhmakVEeG9PaG85cjZndlpZUlU5c0lneTM2Y0xRdXcwWm05R0c4dHJp?=
 =?utf-8?B?NTNvblNrNWNUSWxyWmFaUGNmeXo3YTJJTmpaaWhEUlROV1RwTWlKeW4vbUdl?=
 =?utf-8?B?cEJ5Q0hOdm95M0MzREpnL3EraU9jM2l4TXpHaTJWdVJ6SFhBQnh0NkVCTkVC?=
 =?utf-8?B?ZlVzb0NnV1h2bzVuTWVGWkZVbE9kRjBlZEZPWEI2SGNFRmxoTmFvRG1OeW9R?=
 =?utf-8?B?THdXWHlMYitKWnhCbFErdW1hUUNhTUU2aENIbERIQXYzM0xVU3pxa2RnUHdV?=
 =?utf-8?B?RTQ0NmVsai9sZ2IxdnNJcGtoSlFldlBOalQ5RlpBNVlkNEM2QTJKZy9QRHVW?=
 =?utf-8?B?VUYwQ1NZT09UMEZYbTR2aWJDRGNhaUZKeERjdDlnTzQyN3hPaVJlVEovZW83?=
 =?utf-8?Q?wNsVtONVwKue1RHYW0DILqgpo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5209b809-9c80-4b82-149f-08dbe5c33dc8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 10:11:32.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCLqgbDlK6EHQO+aE5MI97fHnNPK4Z1I8dgGNL/Stb/YhtCJQPf/y4UjkMQW3hHX34FSQewavUySCPkLJVCgiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7502

On 14.11.2023 21:26, GitLab wrote:
> 
> 
> Pipeline #1072370735 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging-4.17 ( https://gitlab.com/xen-project/xen/-/commits/staging-4.17 )
> 
> Commit: 28f44b60 ( https://gitlab.com/xen-project/xen/-/commit/28f44b603fd86c233726bdc2a11b6325f102471a )
> Commit Message: xen/grant: Fix build in PV_SHIM
> 
> There was a va...
> Commit Author: Andrew Cooper ( https://gitlab.com/andyhhp )
> 
> 
> Pipeline #1072370735 ( https://gitlab.com/xen-project/xen/-/pipelines/1072370735 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 4 failed jobs.
> 
> Job #5534997591 ( https://gitlab.com/xen-project/xen/-/jobs/5534997591/raw )
> 
> Stage: build
> Name: ubuntu-focal-gcc-debug
> Job #5534997608 ( https://gitlab.com/xen-project/xen/-/jobs/5534997608/raw )
> 
> Stage: build
> Name: alpine-3.12-gcc-debug
> Job #5534997597 ( https://gitlab.com/xen-project/xen/-/jobs/5534997597/raw )
> 
> Stage: build

These three failed due to (once again) too little disk space.

> Name: opensuse-leap-clang-debug
> Job #5534997599 ( https://gitlab.com/xen-project/xen/-/jobs/5534997599/raw )
> 
> Stage: build
> Name: opensuse-leap-gcc-debug

Here it's unclear, as the log referenced ends too early.

Jan

