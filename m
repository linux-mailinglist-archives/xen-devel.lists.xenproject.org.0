Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B183E7EDC2C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 08:46:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634016.989213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3X4T-0006bp-CO; Thu, 16 Nov 2023 07:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634016.989213; Thu, 16 Nov 2023 07:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3X4T-0006ZB-8h; Thu, 16 Nov 2023 07:45:53 +0000
Received: by outflank-mailman (input) for mailman id 634016;
 Thu, 16 Nov 2023 07:45:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3X4R-0006Z5-3j
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 07:45:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2899eeb1-8454-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 08:45:49 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8123.eurprd04.prod.outlook.com (2603:10a6:10:243::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 07:45:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 07:45:46 +0000
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
X-Inumbo-ID: 2899eeb1-8454-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pko69fV0+hTmkOlQfbWCdGvHhy/jIo+jD+wpoL+bazVFOu4lgysd918rJngtgB15f1FBUDUTKhONcYsza9qFI7OEAzgZb1dQy3LsJMEWY74HbRkYqVy1urIzI5PnGU9Fl3FohaYORuYy3Arc/ySad+ao3qquzGQHQAz98MuLZCj899myEWRvyI8B43nDfHm036C+se15p8Fxnejxxg2C09tR7l8YC31WNjOz9Lfqu1J5e52nabntHzpyt4QntMNmDyozV4Uav1YI9tonwzik3VapDKRY5cGxHSJFSys5YQzp2WqaiqNTKcRHk4MpKjGIkvgK4lRbwrmdrmihvSRRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4O43uNN6k9/L8FZbs5a7YfXCzA1c/W9klq6O23VFfI=;
 b=dKK8Rdym/5glwLCm2FlGcs757DJPrrj22CBo7n8ObPOZ9TuNRs7xygj28XqIbSe9NKfZAcv0jSR9jhwKvyBPEKYuIil+QAnGxx1MPJJacQAvith180TuY/4Xibnin4Ja6004BR9A4c1lv8wuIc0E2tPpIDHE1E9HCre19t2DZfC/8+Ek3oPZVFluk6qs7b4RysLMGGatI/U1F6JGuMFokbSznuhN5c7ErrC8zfwUhbULCJRRce1dpbegZwboUVv2Kj9ieMSxAKdy+cEVqk/zwO0fBd45swGgYW17wTnHnkE+MZqdXLB5UhUeRFCIwlGlTQVfWKlLHwcmin/mCFZ7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4O43uNN6k9/L8FZbs5a7YfXCzA1c/W9klq6O23VFfI=;
 b=ZtWFGcBpugiT7pbeypZoHE7qE83Lb56AuELqjcomOqBbCJ5Kjn27d05vGNozjJn/qT/Ws2cSdMSP9bXyZo1GayKwcdxuCMXj4h4RXOp8MpprCSfT6yKJnRUmQbdjjLk9/W4881Bj7+aOlmBjlvl+TqVt24B2NcJ4o00qp/EeXkSnGjwYUmw2JfZIlQF7tdmjQWSZaxWCaMtyADD3uhZ4JlY1UHYfmtfY31FDlHuXiGlkerPY3YsFpxW3SASC3fEd4s+YaptDTPsZOogVQGB4GMFjQmYiOI99I37oJcV59K0j+pQ0tiqvi9HiK4CEG9+UoAMh9MPW9Kbk0OHO8bCgnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f418916-b76d-425a-96a2-05b56a3dc195@suse.com>
Date: Thu, 16 Nov 2023 08:45:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable through
 'xl.conf'
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, anthony.perard@citrix.com,
 jgross@suse.com, Luca Fancellu <Luca.Fancellu@arm.com>,
 "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>, Divin Raj <divin.raj@arm.com>
References: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
 <20231115182340.505df6c3.olaf@aepfle.de>
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
In-Reply-To: <20231115182340.505df6c3.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: fdfad512-699c-4963-a317-08dbe6780b16
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gugm+yyoz1H2w5VpUxwRzj/PluzJA9mg/zJ4OViZvSxFjf3EHUxKcQ7EikblLpR4EVrfCM5U7AGlcN3RMUa7Ubc0suEPZOV+e2/Uq5O30lPY+DH2X2ivx88Us2MSvzN8XWIJWbmwxVp0wesVEQoTxyPm0jN+oUcXX8XCcGbxuSzIJCo4sKQDdRBLBiwEyTZbp8vq1YoQExjvHrlz/L+ulU2iLKv/2utMhwG0MJ60D2EMJC+GkZKZc7nxF5MIJTZjw7yWmM9bOSmN50cpVGuO1Q2ywhvVvbC2rBcDf4qfVW3/dJYTA4xye513aKTaPH5dViumD1bEhtpciweRo/xd9YEFmeLQjHm9cLii+VDS+Rsm9AeCqJMD7DBUWy0DFv2BmXDSXnntY+KdY6QknU5q0UJEVmzydrEYoakqCO2Sq7RWS+AkcuaBvniLllDqXQCzyEySInAvS+vc5eoVTxwzg2BZJnuzzKDlVziha0rGU/p1M0mRLpIm/yphPNjIo1lgHBWN18SAaoV8PBbUEoOy8OJiwY3xq4Pl6QI79SKBKHZPiiJb68CIO/udWC0vF4O8AYNueybAWqkRH/byZ7mXdA+uvudJ1Ph6NS4/Yi/5s5dnvGdzHn+LUZ+LNv01EIXw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(36756003)(966005)(6486002)(478600001)(83380400001)(6666004)(6506007)(86362001)(53546011)(31696002)(26005)(6512007)(4326008)(8676002)(2906002)(2616005)(41300700001)(4744005)(31686004)(66946007)(66556008)(8936002)(38100700002)(66476007)(6916009)(54906003)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDlFaTZHRHdDUlZobGFhbXU4TDR5bWZjMUprdmlsalBwRlJEcjA4UUxvczRw?=
 =?utf-8?B?NVh2d2duNmZ4MzNTa2crWUNybm42MEZWS01uZkhZOEVhelg1eHJZbjdQRjJY?=
 =?utf-8?B?a3VOcGtpVkZKb3c1RlQzMWh5dXVab2V6eXo4cEQxSVppc0VPZUwwV3pBSEpZ?=
 =?utf-8?B?MXNZZTVDOWhvc21LbkdLTmFrRWRjZURtTXFCalk5L2gycjcxcFdyc1cwS2Vm?=
 =?utf-8?B?UURkUzlCbVdCOHRhbEoyeXpzTnRodVBjUGRWc3dwdm94ZkdQVCtwWVRGZ3ZG?=
 =?utf-8?B?VHpyWktQUitNWWFtZEhMT0JqanUwWEZKd3d4VHpSNjE5emdQcmVnZlpEdUgv?=
 =?utf-8?B?TDlBUVQ1OGpPdnBFRkVYSUZuT1cxVTdVMlk4bUdiQ3BPTFJWTmxjbTRXRkRK?=
 =?utf-8?B?eGk5TldScWRHRFk3aVlPVVZPWTRFSVM4YjRHdHJraktSNURyd0ZLZlQ4M2Rj?=
 =?utf-8?B?WmRLVnZZdnVBZW9mRmdLdjJwZkRGT2VkdE5lSkF5UnVESlROKzdiUlFVMm9t?=
 =?utf-8?B?cHVxeGRpWkREaGR3UG1xSllvVXViRUpwU1pscjlrZ0FPZzBtN2gwM2ZkWjI0?=
 =?utf-8?B?c1c4V3MxZHRSRU9vR0ZwMmxjUkRaT2RKWGRUazVxRWtQRllNbllRbE9TWE81?=
 =?utf-8?B?SmJ5TjB6NEhRTHpXc2FpYjZBTkUxN2VhUXRXME9wQnZKR2puK1V2Z0ZONHE5?=
 =?utf-8?B?ZXoyR2cvbTNjNC9BUzJGaWpxVzNTU3c3OTR6UzBXTHZyVWdkQk5uYjRzaHpF?=
 =?utf-8?B?TFVlYlJWR3VCdG1zNTN6ejR0dE94WTRQYkNqMTA0bUZBYWVmT21VTnlwU0Rk?=
 =?utf-8?B?L2lZR3VlRWlhdVBJeC95Y290dFQyUnNnNUg0cHNpZjRUSDNjRzEydytLT2JV?=
 =?utf-8?B?ajVDalo3T1NRZmFkeWpDNnRhWXVHWGZOVnJRQTRKNTZyMDJXZ1dXL0ZIRjVw?=
 =?utf-8?B?ZU00c09IODdrYU92VGVKUitjSjRtNXBjWSt2amQ2ZFZCTjFxTG5NeGYwVnBV?=
 =?utf-8?B?aGlaK2Y4ekdtZzhHRVJXak5zZzN5WVZxdFUvd2FnN2xhMnlZUWFyT0l3czcv?=
 =?utf-8?B?OVRqWjk3WkJnS29qRHkrOVExeXBRTUdIYXhQMG43S1VzNU1HTmpveExCU1g2?=
 =?utf-8?B?eDBYaDhqUm5Edkc1cm1RUExsQ1dUNXBzZ3FoYW9mV0tqZnJmTHNYUDIzQUhR?=
 =?utf-8?B?dEdQUXNrOTZPWExTUnJKTmFQNnlqTXRpQmRKbE1vVzd5RnVsREFTRXdmWlp3?=
 =?utf-8?B?YzlROERnSlVBQWs0MmIyd1hkTG1Od0IwbUNRK0wvc29vN0c5ck96WXJxTUd5?=
 =?utf-8?B?blVmVG53R3l1eVNLRUNHamt1cUZnZTlkU1lnUW1rZVhBbzNXcGJhWGJlSm5x?=
 =?utf-8?B?Z0Q2ek16RHgyVUNLWVptSG9VUUhJQlpJZ0JVdEl0cUJURjM0Ykw5cmM4cW9i?=
 =?utf-8?B?bW0rRzFFZnV5WXNjQ0tpQ3JPelZWSFFGZ1BjOU9zbDA1ZGxsUmJoS040QWI2?=
 =?utf-8?B?MmpGaUJDRWtCS2FIUzVRaVprN2gyeVdyLzlQUzJZYXQvTVF3Tld1OW1wNCs0?=
 =?utf-8?B?Z0VlRHp0aWRMQm85VnNEWEordlczbGczVC9xZTFNT2ZENno2RUl4UkJuU1dv?=
 =?utf-8?B?SlY1a3k5a1h0T0s4U2g1c1dyT2I5TWRGbFFBRldleGYzc1IxSTlPWjJ3U0VG?=
 =?utf-8?B?dGZUVFlsbmJaN0VSVlNIMVQvVkp0cThjMW96dCtsSmJXbEtrVUx6SUkzbGJ2?=
 =?utf-8?B?T2hyMTIrT3dIWE5Md2hDdDVNT0ZzRkZRQzV5bTFkaEw4N0w2dlVGdGJveHg1?=
 =?utf-8?B?Q2pFS1c5ZVQ4SFpxNkp5M1VmWE4wVEJPV3JweVpzaGJwbVhQTnhKelBqSmF4?=
 =?utf-8?B?bWE4KzVzL1BzdThvNjFyQU04NE9pek0rS0FFMnRWOURFdk56YmpmYXRla1NQ?=
 =?utf-8?B?RFZtS1BxNThnaXQrV0MzOXQwNXY0V0x2NHRhNmd5NUZkNW1zK2Zldmc3MzVa?=
 =?utf-8?B?Qk4vMVFORHRVeG1Xd2F5bmRTNUxhMXFmOHhlVVFyay9nSTdvTTBYUTBKNXJ2?=
 =?utf-8?B?TjZzSDlKb05FenQxODJrRmIzSW40NTA2dVRXWlJFN0hPZUMzL0lEdVJMMk1u?=
 =?utf-8?Q?+KNOhXkQVNCdlVuVlUNVTYjxJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfad512-699c-4963-a317-08dbe6780b16
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 07:45:46.1951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nuGFPjkwzvTJAuj2/Is8pssz6HzzMVRCM4zABDRG89j/41eCvIDjxyDnGGAw5alQVZkHVdws4RHjhzXOlWfZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8123

On 15.11.2023 18:23, Olaf Hering wrote:
> Wed, 15 Nov 2023 15:29:09 +0000 Divin Raj <divin.raj@arm.com>:
> 
>> LIBXL_HOTPLUG_TIMEOUT
> 
> This is already solved by "libxl.LIBXL_HOTPLUG_TIMEOUT.patch" from https://build.opensuse.org/package/show/openSUSE:Factory/xen
> Up to now it was not considered important enough for xen.git#staging.

Did you ever submit it? A quick request to Google suggests you may not have
done so.

Jan

