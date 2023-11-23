Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ECB7F5AA8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 09:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639446.996823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65We-0003f3-44; Thu, 23 Nov 2023 08:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639446.996823; Thu, 23 Nov 2023 08:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r65We-0003dR-13; Thu, 23 Nov 2023 08:57:32 +0000
Received: by outflank-mailman (input) for mailman id 639446;
 Thu, 23 Nov 2023 08:57:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r65Wc-0003dL-P0
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 08:57:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54088e38-89de-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 09:57:28 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8940.eurprd04.prod.outlook.com (2603:10a6:20b:40b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.12; Thu, 23 Nov
 2023 08:57:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 08:57:24 +0000
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
X-Inumbo-ID: 54088e38-89de-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6F4vRjyfiOSyxRG28GORtT+/pAEbzH8P/g4sZqlfvnJ2M0le+HDsax1346AgIFVWfebagK2m3DayJiS1yWlwQ2wPDFP//rcO9MJv2UtKA0LH5wYnT4VFdfx7tLhvC40EFN04mx71owjT5f/7BoY4zB0wygrgyQrTEWNsS643CQX4JmirdzkAdU34nOgTlETjxu/OAP44LFOcHKN+qw0EQJXvvNgNm8Yjh63R/ZqSf7K2dJV6HQ57C7bDZx9/b8Uext9B3xU6ztzphoUXD/d/J1RB0OoqyqZ5xDgzLJoEajfLGe3adEiAStH0dXwm7tdUYb4KTB6OWbdqhjeDRIAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Skx4qkc5pqyD5L6obXEsehgBpIFy54wqunYCNmBYGo=;
 b=iDi64vt6hoYPvdtMdmVtW0CWj9DfF9C0IJBAWkzhp30CbUkRagm42vM5w3IhkrHhBqtJ5yHt5VzhHsdrDAkkfD+Wrp9cL+Z4Zjq5fwbc1in4dDQjobv6tV0/CUQWoVR5V36YKvndgPvYctX4y3zW+x3jAmX7cNNhAXu0Jz4VIxFajEKlfA9Bv4j8FtexwmVw5vF2x9OhpvQPTf1ae1hP0CjracdvBRLrJoxqVcWg9CIJKSfKMUV3m9fKYv/pARXc1KJAs85IxfdjrXM45lxnj9jLoMU8ja4+lr7DTu0JUzaNBklTsZJAs480wMXmliIFRcOEOYzJQZmq8kFjAjE12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Skx4qkc5pqyD5L6obXEsehgBpIFy54wqunYCNmBYGo=;
 b=x/AyT6uq4Dy8YyvDAVpBLJHBoIjF6UwMSnfsbO5wKKqH+/UCRmOVCPjEXshTAw26pEpB5asN3G8zdfUvzxmpcNzhnJV1d2geDR0Bhv59MmEx8enq5+1ZdmHiFILauO90bTJrDdJl1ViMurCVRM2XeDUdMJrIO3/wcariTXQr8KK3gJ9EN6uCd7t6EkfZtEOZvI5Y+XpyRGN4gvW6u5xhgT1asUxrmJ95oI1tEcPgjgCNFLdYZmeRB2tcyPmz45/aQPWIn+dUoz0JlrfcWduXnknZs2EvwgFF1uIDlW65VIHeIubRbsUInWAzKffWTErSU+X0ItN7PS0pxhQ64KGDGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23575a74-2a8d-41d3-a71a-420f6a6007c8@suse.com>
Date: Thu, 23 Nov 2023 09:57:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc7540f-3358-4c5a-c1c5-08dbec023612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rfkXb7w7yx2cz35Ty8ia6ytDl9Qig0n+UgpwZ4WsYGXAjf1CINMUlpSfOlYyr3m+AIG9m32EpkhM8Ni495ewrey+cDZC87VxncX6cJxsPXp2oQQju8XYEVrE+0Jhk9JBZ+lcdQBGD1NaLaY1FrAKx6dD5b6d5VE3etQn6VOViLqZn6AzzkzkVxUXL636IgpneJGpMlxXong//zCutuRFWu+aYOgaUHIC8pSZbkmwzYePdSyHpCGikBetiVBsxTh0jmUf2XlBNjc/hJGD8lq9Hv+OhRyqtv0Go6WS2hVQPL9hK9Cs56xRXI2PRlTX32wmGvoGaQwQpWjqT7KjQCMePcocSLXHhB5vU0Wh1x/bCxJgeavxXp2Ez5WM7g+bksfpnz4vP0RlbSsKXYi4OZmWYEwaDQ8Idrcy7J9PzIpOnhQ1I9CmwywkEYVwkrjDv9tUa2xvUmmG2DgcKTg70nCT8tMqOekpQylXnhLLNdfPn5/2VeVkquHxUawDEuTz8AZcemOMW5k1ou5yiqH/CpcMFLYU1zoe9+k36yz4pErLTWXMqh3ZoiF6XEIB+UKJsK/cir2SE9uXdox6REDx44PekP4MXUCozH+atLETh0kjoxEXNQjxHw3mNSVEoXfZvjOGvuYaOA9QzMsGiAQeTIOJ7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4326008)(66476007)(66946007)(66556008)(6916009)(8676002)(8936002)(54906003)(316002)(53546011)(6506007)(2616005)(6512007)(478600001)(6486002)(2906002)(36756003)(41300700001)(5660300002)(7416002)(86362001)(31696002)(38100700002)(31686004)(83380400001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk1wd1pxa0l5QTlhNU5TSWlLN0FkWnY0K2lBeWtQQ1RNRWw1Vytma3pMQVpn?=
 =?utf-8?B?T2s1MGZkZGVxbEtDcTNZUWJ0RFNoUXZzVnI0UzFmSzJYN3JPMGtlc003Yktl?=
 =?utf-8?B?QWxzbVFMSTd6NXU4N01YazdKU1lSTThoRk9ZQW5TTjVCNnpCSGZxTndwOXZ6?=
 =?utf-8?B?bzh5aEFENTJsNEl5WWNTb3dzaHljZTgyeURHYkN1cmswSmdHTmlhcUFEa1Vu?=
 =?utf-8?B?VUpNOEM5a09OT2tzNlRaallGeWlvY3NaSUNXTTJKNnpjd2kxd0NlaG5rSWp2?=
 =?utf-8?B?QkF0enNjbmdRbmp1Slo0U3M2R0RGc2QrU2lDZ3NoMlkzNmVXL211eFUrb2FW?=
 =?utf-8?B?cEdNd3M0ZURjUWZtMitOV3c5dzN2UzFGVVlnbzVDZW9pQnRyK3lFMFg0Ym5a?=
 =?utf-8?B?WmVVLytmNmtuWG9jdVZaNmQ2aWhRKzRLOUZxaFFHN3luVHJEZkFhaHZXNGRy?=
 =?utf-8?B?VEJ5MjIwSHlqUjBCWldZR3oxU3B0SG1LTUpzZjFEdmxFdGtWMmhOczdaUHZq?=
 =?utf-8?B?ZEdQZzlMWkN0R0ZVTE91WjZacHZqVTNtVzQ4UFQ2M0VwSUVqcElSM3ZyMUE0?=
 =?utf-8?B?OTFtdFVaSFRibThZMFZVNTFXdU0vN3FIZUN2amNRSXpVd0M2c3dJdG93MGdB?=
 =?utf-8?B?aVFvTE1wNEJYUUg3SFlRZjg2ZGhhRzVOdm9Ta1ZPV3dxaVhxajVSaWR1MGxy?=
 =?utf-8?B?bEhUQUVwNGlLellUdzJ6NUNTSUExeGw4ZlVtN0xQdko5YnNCWmNoUEMzQjJO?=
 =?utf-8?B?ekNMVmNjcmo5U0FiSGZMQSsrcER4M2Nhckp6ekxLQU1mMlAxNEtaMkRucWVk?=
 =?utf-8?B?WUhxS1FPbWtPcEFxeXYxZExtamlRVFhCeG5FbXpwQUs1b2l3enNUSmhxZVZa?=
 =?utf-8?B?NEl1WWFsQjhvMlZoU3pjQ3ZJdHJrb1NXd2Q4Tis1cy84Z3BJTVQvQjlidTd2?=
 =?utf-8?B?R1dQUXU2Y0xuNVFQdi9PcHhXemN0R2FqUTV2WlA0Y3g0VmE0cDZ0QlhBbDRx?=
 =?utf-8?B?NHVzRkViV01EUy9DM3hSTHJ6a1VPV3ExYUtWTlpVcEoxWm0rMzR2a01zWnIy?=
 =?utf-8?B?UERKd1NycFZwdU95ejFJdE0rR0s5KzlIRTh3aTZrdzl1RUgybFNoVFpYM0Nn?=
 =?utf-8?B?blZMVHFZdkRCeHFPZm9CU2xqNDczT0JvVDYwTWVWSXNpYWlFNkc3MGZaOWdz?=
 =?utf-8?B?Unh5QWh3azRYdS9kVVhpdUFsYko2R005WDA4bjZpUFZwMUgydHFDNDdndFZG?=
 =?utf-8?B?bFNxbHpBZmdTcDBuTkF5ekhiRXlTQnZIcjU1KzJWN0RhemZYYzVNQUE4dnFh?=
 =?utf-8?B?RmxPU2dDdmZIRktyVkV4WmNCeklzWE9UdXNRSWhTS0RvL0dleVhTMklscnZW?=
 =?utf-8?B?ZUxuT3Z2dXVKWTZjcUxpenZwZUFYbkdPSEpEV3pvUWN4eTE4ZlZmYjV3aHlm?=
 =?utf-8?B?OHVDN0NZMGdkelF4U1ZlcS9STWxURzByK1dVcXBaNHFCYlVBQXlsV0xnTnhJ?=
 =?utf-8?B?T09jSTBYSXBwdFVVaitoOTQ4L2JTMU1PZG9CRkdINjVhZGd2cFhVelZnMUUv?=
 =?utf-8?B?TUlSN28wbVdOMitsZHBiNGJRZm50d0ppWmdSYlpRb3NVQWZycDh3R0NsamFN?=
 =?utf-8?B?emdzTlROVkw3N05hSTFMRmVnWkU3eGwycGxXNGRxVGVnY3RlbWZ0bysyZ1o4?=
 =?utf-8?B?aE1pQ28ybGVPcVZYS21STVh4MmF6Z1pab0wwUU1LQlNpVm1UR3pKeTBrb3Rv?=
 =?utf-8?B?Tk03TVZMNnFMME5FY1JFRkRZU3NuVWtESi9RZjBqV3RwZ2dJdGNITFhPRWdC?=
 =?utf-8?B?blRraERiUEdXZHlDVFFVd1IxeUhULzJuS0xrdUhqelA3OWlsUWNkc3V0QlMz?=
 =?utf-8?B?a0FJaUc0U1ZhOGNsaEVoQnZsWDEzVDArc0tyY0JydUQ0WkMzS1FVVTlCck4w?=
 =?utf-8?B?UkwrRm9iOVFsaEZOV29kaWtibE8wN2dTRmJPUGh6SFljUE1lZnRiNjRmMnpV?=
 =?utf-8?B?NnM0TFlZWmpCSGY3NTlGTnkrSnIyUVN1bEpJeEdWQk9lMGd3eHdQUXh5bXlR?=
 =?utf-8?B?Mi9TQy9CSm05SGFaVEszWndMRkJoaHJZNUxma3ZPa1dNQ0xTZE9PVXpQZmJS?=
 =?utf-8?Q?Wk7m3lkyHkz1nHVVMeFxnrVIY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc7540f-3358-4c5a-c1c5-08dbec023612
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:57:24.5521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JjDFlKGHSijelIQQ6XQDcrmWf1A9sSsRygielWHpiU+Ctp8vzBVP21vG1oonGw8aV1uFcr+ns2eV3b4BoTAxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8940

On 16.11.2023 10:08, Nicola Vetrini wrote:
> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
> by the asmlinkage pseudo-attribute, for the sake of uniformity.
> 
> Add missing 'xen/compiler.h' #include-s where needed.
> 
> The text in docs/misra/deviations.rst and docs/misra/safe.json
> is modified to reflect this change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This patch should be applied after patch 2 of this series.
> The request made by Julien to update the wording is
> contained in the present patch.

Along with this request he supplied you with an ack. Did you drop that
for a particular reason, or did you simply forget to record it here?

> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -28,6 +28,7 @@ asm (
>  
>  #include "defs.h"
>  
> +#include <xen/compiler.h>
>  #include <xen/kconfig.h>
>  #include <xen/multiboot.h>
>  #include <xen/multiboot2.h>
> @@ -348,9 +349,8 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
>      return mbi_out;
>  }
>  
> -/* SAF-1-safe */
> -void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
> -                      uint32_t video_info)
> +void *asmlinkage __stdcall reloc(uint32_t magic, uint32_t in,
> +                                 uint32_t trampoline, uint32_t video_info)
>  {

One purpose of asmlinkage is to possibly alter the default C calling convention
to some more easy to use in assembly code. At least over a period of time Linux
for example used that on ix86. If we decided to do something like this, there
would be a collision with __stdcall. Hence I'm not convinced we can put
asmlinkage here. At which point the complete removal of SAF-1-safe also would
need dropping.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1254,9 +1254,8 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      efi_fw_vendor = (void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
>  }
>  
> -/* SAF-1-safe */
> -void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
> -                                      EFI_SYSTEM_TABLE *SystemTable)
> +void asmlinkage EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
> +                                                 EFI_SYSTEM_TABLE *SystemTable)

Same here wrt EFIAPI, as that also alters the calling convention.

Jan

