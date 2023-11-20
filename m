Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC717F1809
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 17:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637065.992763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56ha-0005XQ-Pr; Mon, 20 Nov 2023 16:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637065.992763; Mon, 20 Nov 2023 16:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r56ha-0005U5-Mb; Mon, 20 Nov 2023 16:00:46 +0000
Received: by outflank-mailman (input) for mailman id 637065;
 Mon, 20 Nov 2023 16:00:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r56hY-0005Tz-JE
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 16:00:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4b0380e-87bd-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 17:00:42 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7932.eurprd04.prod.outlook.com (2603:10a6:10:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 16:00:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 16:00:39 +0000
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
X-Inumbo-ID: f4b0380e-87bd-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlYJSj8QRMtfhheLleeBhQ15OqIb3AlrVrSJj/De+gcdw+8ItE59njfH7HmBMNWPMfCbULlPnQi2gZHQu/kkaYK2I+aAuTVMy4ivo7BJToeXZc3GoL7W/G47fTGb6LmnoK3auiF3gRIfbfL1Y7vMDL82uYPLyO764ii5GZcjtvQxNVFUtYExYwvb0oTsQGVRNo5u4sGndxuZ/4BXErr2GEOPWc06BVefIslNKNEgfLc9cDSj3B/X5+rFulPzOyXjtRykzIuWCSSNJBaGuGNuFoH2U5o6VcdPHRSwy5smsyEVEdXOupMJTFmT6SL/KnqyuIJ1IeDNwCgND1Fml4+HYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWVynRCxE0108kaL/b4WuFgrrnpWuzoAnweAuT5eefo=;
 b=OPJ6ZD5mnzVo8u/09nIjKrhcxpr03FJsz3vFZ7PAyEhtqemnUVsx7AbI2H0Dk21T8U3Wd/Ox71FL7R3CzjaKflwUY4TF7XXAwWuUF2/N3pFRIiykVAiVmp9xWakBTLqo60I/q5si1EZgeu+dHQu7DB88UzmD9GCde2bcwQja1Lz8/MfuYo1qJYMeXSu2l4S0Zm6yMKVjw+EX1pLDcRe/sLnycGgsCn1xLHn8lIUXnBYxyOE2cMa5LDLkUmIbut6zIFYGnxt7MNhrgNBlBtAEaJHZOxHU7l6tumH4nKO1p6pFkOuWTuECKtKMZJTagh/WTzYPtqLxvJeITfb2IkUiQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWVynRCxE0108kaL/b4WuFgrrnpWuzoAnweAuT5eefo=;
 b=jpqw+7hb01s10OxNTrN5Q+ushgU+DqcqvVEtzNIUeVtcuSElqu+jQD4+yQyTtHp0pkCHWuRyAnUTFe6D2s4G4mwspFyBCzzYFaihNud1Qxb/sf7DK8c+zz9k1lZThHqNGBhxzonU3VEREOzTss+NfAM3jln7yqBZcsDrYRDcbNHK+xvGKrzSwIBR0o89MMUg6/XNJ3QDQkZdhERMrlx6DHS4HFS53uh0dmtnnCeZAgc46cQKAXGoNezZ5iNUfJ1n1UYEuKe69ASv0jfkPMgQp+5odFNXcAJ6URzuo21t039R12MN7BQ4r+qgYJJ7I6W4TjCW+MGGASLGiWlGTTkhGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <51010cec-596a-4249-82dc-ac711c3962c3@suse.com>
Date: Mon, 20 Nov 2023 17:00:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] xen/sort: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700209834.git.federico.serafini@bugseng.com>
 <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
 <19d887e6-8c07-43f3-a2de-88ce0a0c99ba@suse.com>
 <b481a966-4f29-4b05-8246-d3f1eec19d0c@bugseng.com>
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
In-Reply-To: <b481a966-4f29-4b05-8246-d3f1eec19d0c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: f72eaec8-8991-47d6-66c1-08dbe9e1d6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6vPMtKpN9ctjv6wPWX4JsK25924CXAZPoBfnCCMKp1MGc6T5UmHraSjMdnKiGvFKLFIfcqWvGvQ3tZyTu5L/RSL+J1qB6NOS4jbd7FF2SFBFc6+yCKVa8GMvG1TcBTKtvKubjHlecUQXjuTd+xIY00oYOWGq/dCZKpIcnbrRRSrMLUQKfO6HkGXBx8HYyL6y5uMpWx5L0xLV638XKqR0JWehGWWN5JFoQSkjO5WI4j/8twUv6+qKj3Lgnh15xuQlhiKGpKJylzSccSCZcn01A6Tq4KfJsArgVWMDfNVB9pIolLFbUN9XzGrddLxy9BfF/TJSK+CMKUEFuXK3ATBJR65elJkRFlEeZZpF0B9syzQSOqPqzLgqwMXr0QJ60hN3b2kEFnhc/LQS0V6ukHnZfbeWRWatfLqj6QNHFs6OMMMq/94d1wTVPE/yRnpBmKlIISGHYrNsmQIAlmi/YP8GIQUZc4SAAXkO8Cw0xuY2L76yg6teTjMvebI6L1QoFYUgWRFIs2jVQPdra5b6bn8XyZd9p1sKf67PfbDVuBkDGZkoFHmxVFiSYktiUgMf6jV9Ys1jGAW0aK5Fdd8nucI3Xhp2Gd3FYvYkyeSkN2nnLCOXcj02pYlYttsvEWZ8TKk3uOJUKj0fPsdc9M5KE0ONfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66946007)(66556008)(316002)(6916009)(66476007)(54906003)(26005)(8936002)(4326008)(8676002)(36756003)(38100700002)(41300700001)(31696002)(86362001)(2906002)(5660300002)(6486002)(478600001)(6512007)(31686004)(6666004)(53546011)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkNLZHMrUUNQS1lWTUJ0U3lObERaaG5TU0VEUzVGTHdqenAxcmRWSEIwU3Jq?=
 =?utf-8?B?VThQMjExeXNWb2phbmZUSzNxL0VDeW94aVgzNkpTVXlEVisyci9saGsxOHk4?=
 =?utf-8?B?bHIxcWxHY0ZYSGIrUEJKczJiNGNZSVZVOEl5RitndEtiZHhjRDEwSGxqdy9I?=
 =?utf-8?B?NllESEIraitFa1ZiNlBTdUNxQkxROEdQc1dSRUkyRXV3QWtJeXFBczVEaWpl?=
 =?utf-8?B?TEFlaE1SYUYrME9kRkdwUEpiVmd5dzh0T2hqRnMvQTR1bEM5Z1U2eE9zejdN?=
 =?utf-8?B?QTdMOEpkMlc3ajVXeWwvS3ZWa3h6eXI2Sk14S084MC94SWNXakpndWQzbXNY?=
 =?utf-8?B?WFdUOExud2ZqUUN0RzYzd1Y2NHBCbGlXcURnczlxeGt5QkdZNEk3dmI1VHNv?=
 =?utf-8?B?TDlXYWlYMFZ0UDU3Rlp0SDNFQlpGK3ArSmt6OGdHemNJa0NaZTFiZTRPOXFn?=
 =?utf-8?B?MDdBT21VZnJidmpMaEJHY1psSUl1TjdrZVNHQStUYzIvM3NNMCtEck9seWov?=
 =?utf-8?B?UWwwVW1rQVFhK1dYaWVWdU5MZ01zZW5xaEo2OEh3VUQxMG1BeEVJMUoyU2I2?=
 =?utf-8?B?T204blpoNlJ2SC82TWUvNzRVTm5zNGJ2bmdFTUtBNW93THVVWG51bWJzSUsx?=
 =?utf-8?B?Q3A2QlpyL0g1Q2t3SkVXWTkxY3JMMy9ueVR6S2tCcUhqaEhueVZKQ0s0WDk2?=
 =?utf-8?B?aEVrM3dLTldFaWF0VDlPZHZaUy9NNFpMUTBCcSt1K1U5RHlyWDM3SDAzYXBI?=
 =?utf-8?B?THJ2N2o1MkEzanBLYWpWekRUbWZWK2RDY0pVU3o1VUlMTjJhUXl1V2RUem10?=
 =?utf-8?B?T3lkcXV2UC9ib2Y4OHVsb1VOL0ZSUWxOaDRSZVg1VnRlVTBkamt3cTdNbjZt?=
 =?utf-8?B?cFljRWl3VjBsZmlWTkliaS90eDRBei9jT2h3ZUxkWTNUcCt3bmVOTDFtOTlZ?=
 =?utf-8?B?MXVTVVkwczBkR0JCWlVJVjJYU01hTlZxeWk2Z0Z3VEtyRXBXeWIvNlZPdFBu?=
 =?utf-8?B?R2JkQjlWaVJGYUxITFgyUTMwL0Zqd2ZFbUYrb2ZkL21QZXBldkNLc1kvSis1?=
 =?utf-8?B?L0JVdXJEeWwwZ0hZQ09zWnJHVHlVYUd0YW40QzZKNDlsRXZndWhiUnpZcUpl?=
 =?utf-8?B?QnNWdjJDa29nQllZRXJIa2FsbXcrOXhUWFQ3VVU2TGhxKzZYUGpvTDRHQ1lo?=
 =?utf-8?B?cm0xeENtQTJiNXNyNVc0dXR6ZmRZV1kvRE1aazJ3VGEzVm9RSGRGZWRpK3RC?=
 =?utf-8?B?a01ScHRiQTgveitZM2h3MWlSYkpRSnIwVENFVWxiUFc3Mm9YNWlseGlHZzBy?=
 =?utf-8?B?MkhCTjlFNTArU21Fd2ZycmZqK2NrelkxZnZ5dUhqNm5YdC85Q1ZtaVJkVDkv?=
 =?utf-8?B?dDZqMCtQY2ZPdTQwWnJTODNVRzNxZ3Y5M2FrZHJTN1FyalRzWHV0WnVwUlBU?=
 =?utf-8?B?b2FkbFNISnBrUmcxV0xmZ0lNQm45clNVdnhKTVIyb3IyY3dhbm5UdkRiMTQ0?=
 =?utf-8?B?dURwTGtTZFQxeG0rTzkzamhyK2Z6N2QwWktHcC9wZURqVjlaTVRHVitSYXVr?=
 =?utf-8?B?a1dhZGVFYmpXTXluYi9NZ3JyK2JGRGpZODBYWkpMT3R6SDV5WnQyZFdjenFw?=
 =?utf-8?B?ZHdaSUVCUUUyYlk0Mm9WNis4U0puVTB5cVgxaWQwM3IvQUN5M25kL2dCdmZw?=
 =?utf-8?B?K1czQWV4ZFZyVS9BbkpycUtNSGhZUm9OL2wvS3I1SXQzZTdjVnBOcUYwbVRi?=
 =?utf-8?B?MzdmQ0JJcHZ2a3RSMXFRVEJyTXF4NlhKYk9yMUlWckMyK3d6YWtOMmpLdTVl?=
 =?utf-8?B?M215bklCZ0g5ZjV5emdMTzNiWFFReGJFMlArVWFUMzc4aFlSOHNSV1VSMG43?=
 =?utf-8?B?QlpLekovTktVVGllNmpNY1ZxdG1DWkw5VUlPVGkzOTczdmQ4RVMvaFZTK0xR?=
 =?utf-8?B?d3N0cUtSd0w3QWRvcnF2c09TNXRSdFR3TnU5ZHNwTFZFSFpTMU0yV2VoT0o5?=
 =?utf-8?B?ckI0MjUxL3YvNWlZTVl3bThRSHRIeUdnM1pmTDRMaWJDbnVZZk45cXpYTHFN?=
 =?utf-8?B?MmtxK2pZQzNyZ0NuaGYrL01wVm9RVkVRUG5aVVg0MGZLcmxMRnJURHFBOU92?=
 =?utf-8?Q?5ya4+R80bAUCqawxKsgCdEGsv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72eaec8-8991-47d6-66c1-08dbe9e1d6ff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:00:39.0254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDkpn1BjkV8njtDvTrKenlgji4aXJGNT/odrDnPT8/3+3Mg7QrKqRopCju8p8eFf30g1Yyp8raZSgnW7AnBzUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7932

On 20.11.2023 14:13, Federico Serafini wrote:
> On 20/11/23 10:02, Jan Beulich wrote:
>> On 17.11.2023 09:40, Federico Serafini wrote:
>>> --- a/xen/include/xen/sort.h
>>> +++ b/xen/include/xen/sort.h
>>> @@ -23,8 +23,8 @@
>>>   extern gnu_inline
>>>   #endif
>>>   void sort(void *base, size_t num, size_t size,
>>> -          int (*cmp)(const void *, const void *),
>>> -          void (*swap)(void *, void *, size_t))
>>> +          int (*cmp)(const void *key, const void *elem),
>>
>> Why "key" and "elem" here, but ...
>>
>>> +          void (*swap)(void *a, void *b, size_t size))
>>
>> ... "a" and "b" here? The first example of users of sort() that I'm
>> looking at right now (x86/extable.c) is consistent in its naming.
>>
> 
> On the Arm side there are {cmp,swap}_memory_node() and
> {cmp,swap}_mmio_handler(): "key"/"elem" are used for the comparison
> and "_a"/"_b" for the swap.

So - re-raising a question Stefano did raise - is Misra concerned about
such discrepancies? If yes, _all_ instances need harmonizing. If not, I
see no reason to go with misleading names here.

Jan

