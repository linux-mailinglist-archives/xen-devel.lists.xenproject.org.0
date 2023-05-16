Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B83704697
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534966.832487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypFK-000417-CN; Tue, 16 May 2023 07:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534966.832487; Tue, 16 May 2023 07:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypFK-0003zQ-98; Tue, 16 May 2023 07:37:22 +0000
Received: by outflank-mailman (input) for mailman id 534966;
 Tue, 16 May 2023 07:37:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypFI-0003zK-Oh
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:37:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c0b2d2a-f3bc-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 09:37:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:37:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:37:16 +0000
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
X-Inumbo-ID: 7c0b2d2a-f3bc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUyYfIa2f2IgT3eB2ai8vhsGEltZEFG1/Oo6ohSLdgb84Ag9aTIH+7uHn/UZ72u8nURvc9TrjIIiEWUl98AEyNbtuZjivHuARI6CXlU+NqKsjfgLl7Y4O7lF64LrewVXdrSj7YqTBhVMzetaicw1o4kR0qtloErMAESx5Ol2Y224qgzAEQCI7UEC5dhSRTU36jDrp6+XnsmYceMq6sgsk/srli9SKhFGDPor+CklQF7suwVSmWom9O/4ewqCJZCJFqpVHisWFCp3wQijW6Ir1tGbIf6/rzJTrCGlZ/2lDpKD13Hw7l8bJ2DWQYBstGjqheaQjG8RGgNl4MVrBeGDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1ju+VcVywBnn0CpgBCckTNP5pe/u7oCdDxvqK7nfKw=;
 b=WI+KZ9UfZP+7T7GuK9hX2uUaF4k3eTJE7PDMwrI6k0cMirYThynBAxa61lHdE0GfHk/ZpvSqKDOaMJeQoj/3/4U0fFLq44LXnF8yjT6AF3j0noS6esupXzy1dLs2xxOJoaR+N5lWJyeHmcurivMi2uU5VuC/uZbfhIzAS0Zz7o7QY5e2kDDluLSktJ2HyQtwTMGiFT7LFvA+UfLHJ2JOTFlSm7eF5olps+OlQu5IP7R3+8IfSEwDAYBlRAxXBIQeWZd6kSZb5cUKIJZV+T/37x6475S5hq+eLZUvJvjXWXs5ia1SLxitt3IHlZpw+pvGFnBewWKsySovwF3xUg2oXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1ju+VcVywBnn0CpgBCckTNP5pe/u7oCdDxvqK7nfKw=;
 b=jw3lc1xsKEpJEmde03etNNYqR87/wLYp6HdWIMB69POSCfF4creWLKHU/OHnpwylFgBzfb8ZF4x2cByPUgVz3yUC5WxggUSOO9ShsSHXbk4+8r8DnSpKhSnNf8joCbvMYTzvKqwMAq0vKlCXAjwp4UWn3sVDDk7nDhyn2YahLzs3noGD7Rv19XVunahXqbhd6Zp0LW/msWD5I3v+suuD6xdH/ng/D64ekrKsJ6xqZD5/DiWHt7du+bEVCyRXm986wlQqMWx6mKjMEcGGKdha0DsuipJ2+kjrwf/cFeZtQKhIbs6F2I3gAT72y5SoNAXVnaeRglMHH2PVYGN6gMOO+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Date: Tue, 16 May 2023 09:37:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 00/12] x86: assorted shadow mode adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d240e6-16a6-4d4d-4493-08db55e05f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n0Es4YCYcRwaLrDlx7w95w4kx4YRw7jxYKerzZ+OM+tvJIY0XRlcSZOYCqvO3XEFF7o5IqC8uc4C4W+9bh8uf5xNZaXg9SMo0/CmOctLf4+KlkiMk+GwXhVyh5xv6B/pmXPSQ6F8xl2P0SIMO7a3+uDBX8GSyX+f01QsokUFLL5oYiZZTQHvgXNBJMQYCkFJi99l/js47nkJyUXRRpgtZUOE20+ep4Von0nuh2q1CuTIDVJyBY5NPsCcngSRzT4HFJLT2LuCF1aVv+NL/imbhoY+QK+VIDv++ogUT6X/gaB0tBJdRCbfewzSybJaOM7pwTJdSioEVsWPgT3bog/t6dcY8f3Sb2Qz4eNZITZ79h7vmqnnkLfDdPIN2ULFw8sYBTN2all8DIGdV0HbqxGch/4KJ4g9HA+fKRrgzJOsy0icpV5KKRKhPt/w8wZHzBqBqhLeLT/q1q6Ruz572sq2KS5j+YgFat4RptJAYbcS7AG6fNQxycGfiRV6FZj80ik5ur/kdngdVGnsKVZ2M3Ds5CKI5+NwRFcarCfnL3rQjJ1YBrN5QKP3ySG0vF7a94K4WdNeie9PtSmCN5xMEtNafIpJrGkf2lyLxgpGErBqComK6jz0rAChZUU0+t65F8uFVCr2iPU/h+Fy/VE9se0q9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(31686004)(83380400001)(4326008)(316002)(6916009)(36756003)(41300700001)(38100700002)(6506007)(6512007)(26005)(6486002)(8936002)(66556008)(478600001)(66476007)(66946007)(2616005)(86362001)(31696002)(5660300002)(4744005)(8676002)(2906002)(54906003)(186003)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG5RaURvZldaOWI0M1JQb2FodDM3OE1aaHg0UCsyVDBEa0RqNzI2R0FDYmRW?=
 =?utf-8?B?VkNoWVl6THl4LzRadGd3cmJPQUxORHUreFRVSmxjZTloV0dXVndVMDl4dWdC?=
 =?utf-8?B?bDlFanJYdVgvVWRjSGQ0WkExSExlQXU0OVRYRGViSHJhUUxKWnNtSzU5V0or?=
 =?utf-8?B?SGtkVTdYMzJQR3VQYjBtWHJTdFVHYU5sTlVKT200c1JzVjNSNkZ4MGovUnBw?=
 =?utf-8?B?Y0RXZmJWMk5McEhVWEp4OU9LZjlZclRnbkpUdEwwbGVnMUxwdGtGZFVqT0lk?=
 =?utf-8?B?R0JVRUNxL29DY2pZRGFuek5WV3JFdFEvU1RoTUxycHpXZVFCNDc0ZjBxbS9T?=
 =?utf-8?B?MHdjNThDMGVBRUZSeWdaaGhEMi93ckVvSTJvS3FSUW5oWVdoMDZFZlNGakVu?=
 =?utf-8?B?czJ0cjNDZVg1NWFGY3N3Z214Z3J4MitMYUx5bndZOXJQamwrcDZ5RHFxMi8w?=
 =?utf-8?B?cG9mUU5JaHYvalFMNjUxVDBDVVNkZzFLZ3c3NS95bnVLZ1RsalAzeGwwb2xr?=
 =?utf-8?B?S2JNYkE2ZFVNMG9vZEN5TjlmSE5Yd0w5WUVsT0RXSkJuZTgwUTdtZSs3Qms2?=
 =?utf-8?B?OWhLWlZIN2MrbEdtbS9ydGpWaHNGQWFJSjVvdXJLd1BOWmcxMjhXQ2RzZFJu?=
 =?utf-8?B?ZGlPNVc5S01vSXZyNnY0Qys3Vmc3MGo3UkZ2QUVwMURyVnJkVDhNblhpU0I3?=
 =?utf-8?B?MFk5OW81WkVxN1Bod2NESTI3ODdMMHFFSVFWQlpLSG9ZMkpyRll2V0VaSjNX?=
 =?utf-8?B?d0JpcmF2SnNJT3JpYXpaaUtNV0tZeXpmNXc2TmtvaDRQMjlzMmNuRTc3UUUx?=
 =?utf-8?B?RTYyMzBENndzSlpIa010QXhmdVJEdkZXc2FDWE5rdnlJa1VyVTN4UGd5QUpG?=
 =?utf-8?B?eEVOUlNkSUxNUmVwYnZucmNUT00zRWUwZFBPVWVRV3hOalNyQ0VJUFNiQnZY?=
 =?utf-8?B?SE5Zc1NkSnpGVzVkK2dCUkpUMG4yakdyL0UzemNIZHkzcXBvb1RFZjJZekxU?=
 =?utf-8?B?L01UendRSGo0S0pFMC9sOFFqcWNqT0h3dmQxSnZOcUh5STBKTjdtSTZ2K2wy?=
 =?utf-8?B?YTdaeUZJWGprbnlNSUN4V1ZsWnp1SkM5cE9sSTFIeUtmVlJnY2RueWhUMmxY?=
 =?utf-8?B?c3h5N2xUK3RIQVRWQ3B0Qmp0UkN0N3J0M0tmMU5xdXlQRE5HdmVCSkdiRUhx?=
 =?utf-8?B?MXZzekxIejlsajVKdEx4UFA4akNtUElWZEpzbnE5dHJDUkh6SEg4TU9ndUxI?=
 =?utf-8?B?RnhwZ3hCZzhQamtUVUdnTERYWEtQVDlFeWJ5WDB1VzJzcnhBQ0NvZWtzSkxz?=
 =?utf-8?B?djdiNzd5dStMbWtQYnNMd0lISFd5Qi9PNlNQMTRaWnFtaXdnbGxEWm9LaWVw?=
 =?utf-8?B?a1hkR3pLUEI0SXhjQzc2OHBxMTN5bkd0dlFxQ1VvbUFWODNwbS8rcEtKcFBm?=
 =?utf-8?B?SnBpZkZlWGdjOWRHRmpQazdrRUt5NHUzNlNydlVldEVIR09jT2VmSHJyTHI3?=
 =?utf-8?B?aGdxZ2tKN01ZVC9WVEY0azhwRk9lT1VSU2Jzb2VFbjA3Y1BYaklOdGllYk9h?=
 =?utf-8?B?RzZZZXEzcHBMQ2hCTmhGdi9JQXpMMTg0YUxBV2E4aTFXY2d5eS9nUnMzTW9z?=
 =?utf-8?B?SjNuU1Z0RmlhU0p0T3VuNGdkWEhJai9UaUhxd21oSUM4ZHVxZVRmQzcwSDQ4?=
 =?utf-8?B?dVhkZStjMGs5RFVxVTRkTWtaSXNrRzRYSTkwaDRzN0NsSElCY1NKM085V3Yz?=
 =?utf-8?B?ZU1GNDVISlhWczFZOTV5U0JMZ1JnWHhYelV0R3B6UGFTMTl1ZDNKTVJ2Z2Vx?=
 =?utf-8?B?KzFNZm9xdVdtUUVtd2FQU1VmWlpSKzdFK21KK0ZVUVZZZWY2RjNiNERWdmtH?=
 =?utf-8?B?N0FOTzlNL2ZkWGl6NFovZmkzYUFPY043eFptYzNRaXhHQ3hwbDRRSlUreFZz?=
 =?utf-8?B?aU5kNEVybEVGaFMzNWpBNEdqdlA5WUkzVW45Wk4vTy9SaXk3ZUhIWS9ZcTdh?=
 =?utf-8?B?Z1pBWHduQTRRcUxaNkZERDN0RDg4TG4zYWhMbm9DNFZGc0hFcWFXbEIwMlJF?=
 =?utf-8?B?cGpZbFJKdUR0blhZc20wODJFOUpPdS9COGxZT3hJWGVlM2dwWk5scGVHeFFo?=
 =?utf-8?Q?NUhFuhIld0o/gGNrHXrWgM7m9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d240e6-16a6-4d4d-4493-08db55e05f05
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:37:15.9986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5QSVseeJgbz9omusT+/NSI1JkCL+WqMOHKHvfGfbPJYeWlhP8r8zDV06RC5d8BTDAr7wB5GlpMP2h8tiqtiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909

This is kind of fallout from XSA-427 investigations, partly related to
there having been a more intrusive first approach.

Most patches aren't really dependent upon one another, so can probably
go in independently (as they get acked).

A few patches from v2 went in, but there are also two new OOS patches in
v3. See individual patches for what has changed (in response to review
comments).

01: reduce explicit log-dirty recording for HVM
02: call sh_update_cr3() directly from sh_page_fault()
03: don't generate bogus "domain dying" trace entry from sh_page_fault()
04: use lighter weight mode checks
05: move OOS functions to their own file
06: restrict OOS allocation to when it's really needed
07: OOS doesn't track VAs anymore
08: sh_rm_write_access_from_sl1p() is HVM-only
09: drop is_hvm_...() where easily possible
10: make monitor table create/destroy more consistent
11: vCPU-s never have "no mode"
12: adjust monitor table prealloc amount

Jan

