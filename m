Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE17803153
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 12:13:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646835.1009425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6tF-0005vj-5y; Mon, 04 Dec 2023 11:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646835.1009425; Mon, 04 Dec 2023 11:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6tF-0005sX-2c; Mon, 04 Dec 2023 11:13:29 +0000
Received: by outflank-mailman (input) for mailman id 646835;
 Mon, 04 Dec 2023 11:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA6tD-0005Zx-FB
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 11:13:27 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2073.outbound.protection.outlook.com [40.107.13.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 259103d8-9296-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 12:13:27 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7895.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Mon, 4 Dec
 2023 11:12:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 11:12:57 +0000
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
X-Inumbo-ID: 259103d8-9296-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFKV101nvv+cN/+eIquqcCA/S5kJ6bCunrdYEZLLGMHtMFbXiYF8ccQ01PJpcFmLZQDaQH1w+1bHKsAxsrpRqJd8q+NAhn5zNJhDDAfLXF8JFrfU9AKhj9w4o4wVlITW6fxbEgGV4NbVq9n+OPfuyk0HD11ImhLxXydh+ndlK5J0xWfGHjagqF1IulJcHpQQfqG+N6o9fIDacVznfEL+avTcV5FsEP9KSaSTHgzVtj76dxTs0zKEWogxDxVDskZxCJ0ePwn8FvgqdupoJ3OAE9A5U+7GLenw4wPGsydbIqMgN2cvaZFu90lMoC5a51FKq4DsPqmYeEJvaMWGNHzlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrRvNkjR82XmaQ/0KMbRLr6huECLCNYccX4Bw0YbwN8=;
 b=B8CquYXURSQyVv3+VZGHaEuETrzKwAFs2Mq/HlCMR4C8mi6Xkh7E09O87XHMlsnvAMqCQotRhlPPLzlDVMJRP042eunuPSH1Qq3XEIo+r3hB4ilFHLDGb6T1V1ohuUrSENAoZRcFBs/M3PPc7ticysn/hsUI+BXS9pJih+KK1CDSHpUknD6jG0PcxJkP6q5XLzbFGpw78QBatPMQFrL6kEvJRug0CiMRJkeUQc+Q1006MnZUhzsZQVwH/J3zl/IGCYZmN9SvIJFEbRB2syxDmDTz3z+uoE6rk+i4SvRz33seA80gpWwnXsCffqEvFpLVYXCXBT0f5BwJUQ77qzDLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrRvNkjR82XmaQ/0KMbRLr6huECLCNYccX4Bw0YbwN8=;
 b=T3w1sjlj/pjnTQkrTFQ4ItE1rJl4nDtGhuEOmeYp/DJWrYgNJrQJUeb9+NehpxxFJI4C544skrAI9JdV74dNahEhbTsZq3UWl13dONX2GzN5Xagiq4QwJLwWW7GINPUxgVcOKAwX8O29k1AQmGlp0/DtMbPbq9i+3c21kcHfPeh8EBX9yRBXhW0gkoQ5Uwi2qp1Fj7UX3rX1lv/H+hQhVcprVbMbXqKKjgcewukKOvrdVv9oRz7OMG6fg5w2Z8akpY5ye5foMjhpVEj/rsCMEMmclyLmUR9HMwLv3hE11RqGdrw05PmOqqK65G8DYKgUfLeeOql7OkDidVIvqbH0tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03a33b69-b028-4f30-bd26-4e347c2c5c87@suse.com>
Date: Mon, 4 Dec 2023 12:12:58 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] bump default SeaBIOS version to 1.16.3
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
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfe7090-dd29-48b6-f18b-08dbf4b9f817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OH04o4UGQbquIewFQHPugG7UQ/mJU6MCAWobAC/5MOWRddnd06dWg2gfkuBvX6Q7A/Atwv5Vuih/ztiTpFvAeaiwobW0TBbn0vVjkSbvLeQvGOXFphZQRu7bY0/a53wSQuGnRsqz/l5mq0RrFT1p8jpASt1/dcff7ItwKfYbjH+owDkpHu53ZmTTnmlkw1jo02OtCHveE6lWoCBFVXjX8bqmuguDlqvyauPf+WoYaAi/C7BP4XxA8SYcfnCpy6viUE2avPU6VSZ1PM1OKuu9fvyn9n+/7vbfb6+Ho6W5wRyV06sbTeU4S0RIOoFQXmT6UfLSHDODhdgn03Tki8x9ewyUmLqOcER2RV5VFUxeUPCMbgyOIQb7e095SEfq+kYr1LYkUw8m9OSqEEfdiBI/Rhnp1M1s+7ayWaiId3aG9hV9I6iTJR5K4IrAFqe2iw6WACx0C4+I7rAFVU4ZPixoOkxxQmnbwEpUd2IRH2+/itkKWn4ZFzxfhJW/30yVAl6w87+yf4+seHYJrGBRu7KgyBD2yWTeuHeJQAZ9n8KnGi90FlLxkwGUnJmUEAgBTKdJfdBku+owVVzQhSES5xfVny4hYfJxI+YhTgO/ETgTjEu9yyP7T0ROjaHEqaDz1fa9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(36756003)(6506007)(8676002)(2906002)(66476007)(4744005)(2616005)(966005)(6512007)(54906003)(316002)(66556008)(6916009)(66946007)(478600001)(8936002)(41300700001)(26005)(6486002)(4326008)(86362001)(5660300002)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWdia2t2Y2JZZzR4UXp2eFNia2VqRjQ5aGwzbDdCT3IzVnU4NmluZGdHNVRR?=
 =?utf-8?B?TDJvRGhyZFlNY1NDcUhwakpsNFRYMDRlbng2VHNRRkdzelB0Q1hjdzRlYkZt?=
 =?utf-8?B?YnRVenh6ekZaYXkxMXNseU90NTFaMFBwTjcvSGhkS1dXSWhDM05kd3FRNklY?=
 =?utf-8?B?WDdGQ3VETTdSYXMxdUx5cmZSL0p1bTFMQU9ndFp6eGxGN2lxVWsrR0pxaHBp?=
 =?utf-8?B?bW1rdDhYOXFsWjVCcTZCMUtlaFJROHljaDRxSWd0eXkvOWVXQnJUYXFJai9o?=
 =?utf-8?B?V0JFeUJOM2xRbnZDZm9kVkg0ZWxOZS93S1NqQ3ZPS3IxLzY5N1duNmFSWWRw?=
 =?utf-8?B?SFpHZlFnNG03M0VsWUVIMlRWanFJamxhL3l3Z1VPeXBGUTVqY1VtbWFNeThv?=
 =?utf-8?B?eDNGRWcwSGpWWWdCTTNoM2pFV0ZCZk1HWS82eDFGbThzbzlNMzQ2QlNEQzFZ?=
 =?utf-8?B?SUdLK2g2S05rdFNBcTlrNUxqMEZobkJBdGpBZU1yME5XT3M3MWlya0plTWNo?=
 =?utf-8?B?QXZ6ZXBCemdJNUNaVlVPckZnKzB5S21HazlvZ3BaWVlVeFpwdGUySWtVRG9C?=
 =?utf-8?B?enN0ejFxaHJWRUkydEc3SmM2dGM3c29IVzI3MUxNNFdkS2NtN3pEREx0N1RJ?=
 =?utf-8?B?dlBlbHNnbStDZzgwc2IwV0tVRGdselBWNFJIaHZrTDBWMUk5b3VHQXVZajJ0?=
 =?utf-8?B?UUhvanE5am9IK2xqcGloWVMxWjlMWGpJS2pwRTBPWHJoa2Z1c25lclIrVFVh?=
 =?utf-8?B?SVRJQzVCNFAySWp3b1crb09UNWVPTmg1SW9zRklPM29KRGZNQUNJWmtHWFU0?=
 =?utf-8?B?NnNvRUZyakhtZXpEaVdOTEI2SUxhY0I0bTlMUFl1N3NjdStGcVlvZCt5ZXp0?=
 =?utf-8?B?WEg2UDhhQzFoR28rUlBVWCthZGxlSDB6V3RHUGVHSlZQaUVqWE82cDRWU1pR?=
 =?utf-8?B?d3B0dTBOTUJhbk5DL0ltNG00VWZDM0wxa0crRUVrZTVvUXVyZ0tzSXBOaytu?=
 =?utf-8?B?Y04ranFUVXlyOTk2UFpDcnpXWVRTVTZJUW1yNkpnM2pWYkdzK1N1dmM0a1lj?=
 =?utf-8?B?blVOTGczeVR3VFN1SHBtRnFxV1h6WTJ2Sk5xTGhFK2JMM1Q4ZVJaL2U2YkZZ?=
 =?utf-8?B?WERFNjhJaGx1ZkxiOWg3eWFDTUFXbVRwMVZSM29URmdtcnFIU3NFbUoyelRL?=
 =?utf-8?B?Nm1JTC9vTmJOWDRrblYvbWwzMElwaWVsOG43c2lkUEw5dUljbU5oT0x4TDRV?=
 =?utf-8?B?aDJXQ2ZBeU1BaWZhTXdsZk9HUFFHZnNha0dYalRhSXNNVWFXSlcvYS9qMXIw?=
 =?utf-8?B?M1JCcGNOYnZWcGVibU5ENHBjclNVWm1ITFFTY0tHTFMrVmNXUVlycGdPeWov?=
 =?utf-8?B?WjJoV1p6cEtDdTdBQ1A3aUg2aHpOd1I5YWx5ZE1oWjNYUGJoVk51dDlFUUwx?=
 =?utf-8?B?M2NGcXlubGtHZEJ0UTF6ZytydmNjNmxWOEY2QktMUUozRkhJMHlnb29KRFU0?=
 =?utf-8?B?Q0FBR2JJTkFIMGxJbjNtYkRUUFpkK0NDYldtZkgrSFo4UzlRWHNDVEU5TGp0?=
 =?utf-8?B?YkZLTUgyeklTdmNuSkZMMDZOSTBLMzRiU0RxSWZrWFA4TzhOTHcxTW16K1VJ?=
 =?utf-8?B?NXpGZWZFektmM01IZFBGa1lZTTNBM0k2SUg3SEwzVXdUdFpicmdSTVl2T20v?=
 =?utf-8?B?dXQ2RDlFNWwwWTRkVW9DSm5jWkpNdTNvZ1FIWnh2YURFeGhidjBDN3ZTcVdW?=
 =?utf-8?B?c2ZhM0ZqNnFLWHNaaVhSbVlKUWdBRGxtTXM3NzZrcllxblFRcE51aytnRDZ1?=
 =?utf-8?B?d2JmYWZLOTEvY3pNendQaGw1UTN3SGpOYXN0N1RoV0h4cGlUcFhxWjd3ZTBi?=
 =?utf-8?B?bWM1K0F1elJGS1RQRkZKTEVYQ1djdlA4ZlNkZ29GT2FkbVF2ZGtsUHpOVXdk?=
 =?utf-8?B?clBWUTFETVNseURkb0xGa1lGUjVFY3BXUFlqOXZYTEtuYnp1TGFTODVmVGpY?=
 =?utf-8?B?Z05tU1A3eXJPMEhuejhmWUovYTlPd2RCQjJ1alpnQjUyemVMcGdPVnNERDVR?=
 =?utf-8?B?WnNjZVEwSHg0M21hQUlSUE1ZRUN5WTVIMWFzZVIyb2lZbUt1aUYyQTUvQytI?=
 =?utf-8?Q?Ule2NZbOimE7m3RH0OOtoNxrp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfe7090-dd29-48b6-f18b-08dbf4b9f817
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 11:12:57.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkJVzAM31v/y/5PoNPRhVkNizgdeeUGRJaCmFS5rAuXceTaMqfgAGD4Dw4MNaUBejB0oXkiuVxHK0a14fjwxmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7895

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/Config.mk
+++ b/Config.mk
@@ -229,7 +229,7 @@ MINIOS_UPSTREAM_URL ?= https://xenbits.x
 MINIOS_UPSTREAM_REVISION ?= b08019f0b2fbc30c75169a160acb9fd9af5d68f4
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
-SEABIOS_UPSTREAM_REVISION ?= rel-1.16.2
+SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3
 
 ETHERBOOT_NICS ?= rtl8139 8086100e
 

