Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7197EDCDC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 09:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634031.989242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3XiM-0008Qu-BV; Thu, 16 Nov 2023 08:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634031.989242; Thu, 16 Nov 2023 08:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3XiM-0008Oz-8p; Thu, 16 Nov 2023 08:27:06 +0000
Received: by outflank-mailman (input) for mailman id 634031;
 Thu, 16 Nov 2023 08:27:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3XiK-0008Os-8P
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 08:27:04 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb03801a-8459-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 09:27:02 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.9; Thu, 16 Nov
 2023 08:27:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 08:27:00 +0000
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
X-Inumbo-ID: eb03801a-8459-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqVx8Xm4Xa9HpMJfiIWz7FJCIc974OIjTJ0qn+rlOgo2EDNNpvvHCR7NP+O1hI45h0DYuWqxRq9PTFm73q3FnhU87J87cYOEV8RytWKLwLhSdmwmgKeVaXTahVShNkzgf0T87CHVOjeHo8PyIwTfsfJgfWY/Pq923zrimV289NP8R6ZgSUjKd+5gXH7gVqx0PFmTnBDfyyEpdWUt3wV2ZREOQWbILcGYE6CI1fAS9DfX6goYKEIBvR6XIs5R4kRb1jgLWaWhbYMDuOmc/2h1dBK4UbAmb7CoGeBJA+YJIpzzQ0AXzYbDcUBD9ZsusAozxHGQ2F7uLONzB5JzBFkHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7+aDNpy+3kjenDQp2JLhWdQV8sQFexEbj6NRznQ3Pg=;
 b=FlFfESWwA3o70LTybwgU3TbUNDa9lofYbs8K09/aQxHsKQ5npiPWqMc8fsaP7N7waFqbon68mx7tbl5QHJbAQuXhw385d4G4V2LSHxLZZltUCP3gTgldeD0oOeJz2ejzslKbK92PbuGhCoGG+8SipJM9sZpEeiMTqq82bF5g8w0N0DUDi/LBOtIX8PKQMC18g6vAiPMvZ/XCF9pv4YsuolIrHbREjmh179yXavBJpL31i/UlXE4WNaSdI8jQ17WT6LSU8ET+1mniJPw/Urgdq1xlvSoY6VBdSHuMnOoDCaczjoA6TSd5kHXPZytaFOCVkKo65v++GbjnsJfsW1Vc2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7+aDNpy+3kjenDQp2JLhWdQV8sQFexEbj6NRznQ3Pg=;
 b=uotqWPc1+F5C2naQOEBKA9IxEmqIDQR9HLsuUMDd982zrxaheMdziNlIrXgI+Ky+uqFscwpkrl6tcrGoaQ2xR8ouX7eN9++O8jJI54WbkxNXJDlpalUDw7h0CWT4ZZUVZIzLJgHx+hMv7zv+fg+wiv/VPqWnkWUVzl1JqvaQmUEbDBLpJH0O1zhuwagzvR9D5JmQlQr3BcrWGhBJ5rGsXPzZlNuhbfJlLqxk1zXssSTnm+03acAZHhdc40dhMuU/nIt4RbWR5cNSx2It6RKmksOsX+ksKvorKVpdGBxuoy2/QH5koKPWtNThkBH6eJJbUMkDSTh55QdvskkAiL0lZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <392566d1-109b-413c-b904-0e4cb4007263@suse.com>
Date: Thu, 16 Nov 2023 09:26:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
 <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
 <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
 <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com>
 <817fab34432c854ce585aba80db77f7c@bugseng.com>
 <8b4e0da82930375b2a95387a9031c73f@bugseng.com>
 <1178b79c-d6a3-a46c-5556-3fb5964dc051@suse.com>
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
In-Reply-To: <1178b79c-d6a3-a46c-5556-3fb5964dc051@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d883d98-ab28-4117-f42e-08dbe67dcdb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oibnyZEpi6mZWA7culuo7EIv19dSdykLQ25uDtPvN4nvmbwZotuyID3TkdrSOQIBDcBFpI3FuhBzmnHF9YL/mI5MzWE4Oovgny+2tt4Ht4Jm2qm+MrK4s8kOASQycwQByqBV02/sHLzxaidsMkdL28T3R8nLo+6giHRn72rO2IHjjdYwHZjijqMzLrq0ovqj77MFabDBcgd8h17ysV3Wd6R/jWPcXOs3NypSfSzzx4S2ZHFjGp7Km8ebNfpUPWTd3KIV0SgYJbBta75n6E8gZp3Lt0ZVsXIn6Acst84gQOZ4wVafGnimE3YwJzA2ID60YL1QFBZOJQdbCbL37reXTIvY36TQTIlVG5Av+MJk2AE0D1mtugw49eZ2UMtTVP/Oq+4/XwmGewH4mU8h4lqdzqnGXVvJ6DCWUznF6XGZDPj1VpFeBWlooH2wSGhjR89KZFJKWZeS8lmq6zB6J7WksDXhhGGb4yjBf3jLBKH/iRcdlKfsOJ3s0Z/QTfcj4lpl8NcE3ZusTzEw1SXurklZ473qRWz+oF0imRemL3pUfR8CNPhZqhXE8W8WPiVDcX9YnajOToZJKNuHrNnXhvy0RhL9ZnAaElspbrwB33jUKBT5NoWDZVfqBdatO/ZI+vL8xHzT+lFOmc0EMpgivi7XmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(26005)(6506007)(53546011)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(7416002)(41300700001)(2906002)(4001150100001)(6486002)(478600001)(316002)(110136005)(54906003)(66476007)(66556008)(66946007)(31696002)(36756003)(86362001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0NLeHBZbjJWZHg5RHVPd1djQ2VZVnZuT2YyZE9vTWZvdnhsUzNld2FYYVVC?=
 =?utf-8?B?WFFpSkRnd1huMjFtd1podkI2L2w4dDhlRy9EdTlwY2lrM0pQbVpXRDVTWVRM?=
 =?utf-8?B?cVlxYUlHQkVpMmlpRmQrendRRzB5RUp2UXRTK3dvRmVFK0FTamZpaVd5SnQv?=
 =?utf-8?B?YVU5S09UNWNIdHhDc01odmUwWHlYQThoYjFKWFNLL21HQ1cvTGVaeVNoSy9m?=
 =?utf-8?B?UGxQUm5rS1VONXA5N1FSaExTYUFKUGh4TjBudUNQQUxiN3ltdHlUYjFWdjgw?=
 =?utf-8?B?Q1FWcU41TS9HRDA2eWJxMCtCcDhmTG9jSjBPczZscGJnL2cyZ3NKMk91YWZB?=
 =?utf-8?B?YW9JNGM1d1hMRVIzTUxxV0M4Y0xjc1BkUkVMSVBvc0dpaHlRV0RyUEpmbG9z?=
 =?utf-8?B?UGlCbEpvZzJEVjMwS053Zk5oUUFsZWwxYXdwNlF3c1JhZHNXZUJOQ2M5bnNC?=
 =?utf-8?B?QWN4aW9Qa2J1akhWTTF2OURGOTdqcXVaSHR3WlA4ZmVWK2p2ZkExa0QrdGlX?=
 =?utf-8?B?Z0VmanpWNmNQNWJ2bzg3Y3lHcThwMXo3ekhtUVVVaFl3WHhRNmZxdzd0M0wz?=
 =?utf-8?B?T0pNaXp1bThxNTdGaGtndjNUZ2FFWVIxYkJyc2IrSzh0YkJBRGhZdEJhRytz?=
 =?utf-8?B?MEt2SkM2cEJ0M1RXSWt5WmswRzd5WU5TeUgrOTFXeHlvbHFpTkZreWRpMkhU?=
 =?utf-8?B?UlE4dTU3U0ZQcFZNQWVTWmRWMGd1dHBRaWUxT2hLMVRNQzlodHUydG9qZHFy?=
 =?utf-8?B?bkw3NTQ1M3RsSUpmRjVoYkphUFZ4a1lnbldCb3dtNFlIOVBHQVR2eTVabEk1?=
 =?utf-8?B?SjRJc2xjK2Z5UWdxSlRhaGdjSW5iQ25obEN4SWpobXRmOEZ4Zll5VERSL2Y1?=
 =?utf-8?B?bnVxNkNySVpHTmlhRU4yWmUveWdNYzVDOVlQRWNEUDZCcFJhQzArVVdvRytM?=
 =?utf-8?B?cExEb3MrcklzREVueUJXS3p6U08zZWNVY1RobDVqV1hYRGp0KzZmY1pyT3VJ?=
 =?utf-8?B?RHI2NWRBZlhSM1lmK1htVUtPejNWdzF6dzdnWnJkMGk1NFhqT0hqQjNmenJv?=
 =?utf-8?B?V1NyZ2ozYU96RjVvUjNrNHFVZGgzZ3l3WXNhTkJkUzBWK2tQek1MV3R5eFNj?=
 =?utf-8?B?dHJhZ3NjQ1NhNW9kUlN4TXNTOW4zQnd4UlA5TURVU1pKeExQc3FnQ1NEbjBj?=
 =?utf-8?B?alBHZ3lJYkdOcjRYRmE0V1Rycm5mVDFJdkFpb0h0SW5HaWoyeDJyZzhyRHJo?=
 =?utf-8?B?cDIzdEc1Qm1kcitCMlY3QjJ2NFJNcjNhRWdWZlVCUVQ0TUEzMUxKbGNoQkt4?=
 =?utf-8?B?UVFtajFIOHBtdlZERFJaVEhxbDI4REdzdmlHaE5vV3NFZmRtczVaZVgvMVhU?=
 =?utf-8?B?c3ltUDcwOXhESjhSeDFQMmxSOWNPd1YweE5BQjg3WkNlOEI2QjhXdWZER1VU?=
 =?utf-8?B?bzlKTXhESDdkemJOUER6VnBFVDBmQ0Q2U051bmtnTUZhdDRyVytTUVJmdjU5?=
 =?utf-8?B?UmI2WCtIZFJBWFNEUDVvRis0b2VKTFN5ZElLSllHQ3BNa0VBK3VrWnFXY1Nx?=
 =?utf-8?B?Wll0MHNhMld5dDdaMURrb1prdU5vWHI0dTNyRXF4Z09lQ0dLVTdPdEl1ZElY?=
 =?utf-8?B?Y1U4czdMamhYU0c1SDk2VlVYQ1pOQjdJSjRXWmVhaXF5L2h3ZVBmV0JJYzh3?=
 =?utf-8?B?eU9OVHNjNDcraTd4a2l4aXhiZndJU0p4bTZoTlBEcDE3MmhoUGJNZWVSUUJy?=
 =?utf-8?B?cWFXOWN6VHlwcGdZTWtWWm95ZDVVazZDdkNtWS9RUGN1T1RzcFRsaUpTYmxR?=
 =?utf-8?B?emdaS3Flc1EvRUlGbkREUUFYdE5JQ2l6WE5xNU10N3loVURRS3dBS0QvQW5C?=
 =?utf-8?B?clJ2UENvUElGeE1yeGtVTXhzOFB2Tk1oVzRpeVdwMUgwb2tydmVtMnRkaXRa?=
 =?utf-8?B?OFh6ajJyeWtWTk9DVnBnWS9yeEE4VnROY1Vpa0F5ZnJLUkUrVS9NL3p2L3hU?=
 =?utf-8?B?V2g4N1BydVJJWGc5a2dmVGhBa3ZocE1QQVdqUk5tTXZnNUJ4MDNWTDlEdUZl?=
 =?utf-8?B?NzFpUWV1cU9CeWluYURVcFJtYmxsdE84cTRROUF0V09FbGROMUdnVllveVND?=
 =?utf-8?Q?WZTZb7U6pB2zUz5TbM3jJVCn0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d883d98-ab28-4117-f42e-08dbe67dcdb6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 08:27:00.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okJ9Ofich8EGmcaT8mxAkcFXHlbrk1wUMCkk1Z0i3tZ+RlSdDVJVqY9UPCth7gJd4BU2rcapwDwm6kGPXOi94A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366

On 31.10.2023 11:20, Jan Beulich wrote:
> On 31.10.2023 11:03, Nicola Vetrini wrote:
>> On 2023-10-31 09:28, Nicola Vetrini wrote:
>>> On 2023-10-31 08:43, Jan Beulich wrote:
>>>> On 30.10.2023 23:44, Stefano Stabellini wrote:
>>>>> On Mon, 30 Oct 2023, Jan Beulich wrote:
>>>>>> On 27.10.2023 15:34, Nicola Vetrini wrote:
>>>>>>> --- a/xen/include/xen/macros.h
>>>>>>> +++ b/xen/include/xen/macros.h
>>>>>>> @@ -8,8 +8,14 @@
>>>>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>>
>>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>>> +/*
>>>>>>> + * Given an unsigned integer argument, expands to a mask where 
>>>>>>> just the least
>>>>>>> + * significant nonzero bit of the argument is set, or 0 if no bits 
>>>>>>> are set.
>>>>>>> + */
>>>>>>> +#define ISOLATE_LOW_BIT(x) ((x) & -(x))
>>>>>>
>>>>>> Not even considering future Misra changes (which aiui may require 
>>>>>> that
>>>>>> anyway), this generalization of the macro imo demands that its 
>>>>>> argument
>>>>>> now be evaluated only once.
>>>>>
>>>>> Fur sure that would be an improvement, but I don't see a trivial way 
>>>>> to
>>>>> do it and this issue is also present today before the patch.
>>>>
>>>> This was an issue here for MASK_EXTR() and MASK_INSR(), yes, but the 
>>>> new
>>>> macro has wider use, and there was no issue elsewhere so far.
>>>>
>>>>> I think it
>>>>> would be better to avoid scope-creeping this patch as we are already 
>>>>> at
>>>>> v4 for something that was expected to be a trivial mechanical change. 
>>>>> I
>>>>> would rather review the fix as a separate patch, maybe sent by you as
>>>>> you probably have a specific implementation in mind?
>>>>
>>>> #define ISOLATE_LOW_BIT(x) ({ \
>>>>     typeof(x) x_ = (x); \
>>>>     x_ & -x_; \
>>>> })
>>>>
>>>> Hard to see the scope creep here. What I would consider scope creep I
>>>> specifically didn't even ask for: I'd like this macro to be 
>>>> overridable
>>>> by an arch. Specifically (see my earlier naming hint) I'd like to use
>>>> x86's BMI insn BLSI in the context of "x86: allow Kconfig control over
>>>> psABI level", when ABI v2 or higher is in use.
>>>
>>> I appreciate you suggesting an implementation; I'll send a v5 
>>> incorporating it.
>>
>> There's an issue with this approach, though: since the macro is used 
>> indirectly
>> in expressions that are e.g. case labels or array sizes, the build fails 
>> (see [1] for instance).
>> Perhaps it's best to leave it as is?
> 
> Hmm. I'm afraid it's not an option to "leave as is", not the least because
> - as said - I'm under the impression that another Misra rule requires
> macro arguments to be evaluated exactly once. Best I can think of right
> away is to have a macro for limited use (to address such build issues)
> plus an inline function (for general use). But yes, maybe that then indeed
> needs to be a 2nd step.

While I've committed this patch (hoping that I got the necessary context
adjustment right for the automation/eclair_analysis/ECLAIR/deviations.ecl
change), I'd like to come back to this before going further with users of
the new macro: I still think we ought to try to get to the single
evaluation wherever possible. The macro would then be used only in cases
where the alternative construct (perhaps an isolate_lsb() macro, living
perhaps in xen/bitops.h) cannot be used. ISOLATE_LSB() would then want to
gain a comment directing people to the "better" sibling. Thoughts?

Jan

