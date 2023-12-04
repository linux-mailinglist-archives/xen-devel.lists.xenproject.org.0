Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39E802ED4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646669.1009174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Qe-0000fv-Ki; Mon, 04 Dec 2023 09:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646669.1009174; Mon, 04 Dec 2023 09:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Qe-0000cs-HG; Mon, 04 Dec 2023 09:39:52 +0000
Received: by outflank-mailman (input) for mailman id 646669;
 Mon, 04 Dec 2023 09:39:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA5Qd-0000EL-TF
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:39:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11a72824-9289-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 10:39:50 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9113.eurprd04.prod.outlook.com (2603:10a6:10:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 09:39:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 09:39:20 +0000
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
X-Inumbo-ID: 11a72824-9289-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwQzbuUSoOAHChF977uzNqZQLvfcOVaf2d85DgpnlmvGNqCnKJfzM62D2ZI8aObDLXdkNfqTPborKmUl29/aIWGsmMxHuhtfR9emWjw9dw7zQ0S0zJX5EH7ly0DVDXVTwMeGnwB3y0UeGt+hhdbCfIkLYgLuJT8PyY0AeuHzfry+UfJBqo13+sUkShhIH4etzW1GQjoejxAQIgsmODDvp4exME+N3EUL9d3Bq9RU5MXnR/vkIh0+ZH4M04G+TZSUgfZh1Wt/RiTZn9m2J/rA2FqZeLDYSzJsZ6hbwDHqOjnIkOWs7HfvhMCuctTRkaZLzaMpnosWWy1yVoI8fkLVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1ceTXUtd1PCZIPA0k277xVSSqyMnaXzlgmqMPf62c0=;
 b=khkYhPsUzOyQQzaUWlf3f65SpfhkQ1qjrq1y/u/ByRg995FvFiMgbNAYQcnId8bfo9idtjO6ydLk0QxNTpewtoOLfLVk6uMfSzj5eKPg1qs2h//knETwVSfHseGR6lvtwJM7KLU+6PoXNcV+peapzcgShZOieRU1DX6bEGO83y+nCDB348gtLh8jDbrxmhJ5P6U48n9A881kaoNsAuIZuB+R4q+nLh/U6RgzSi67FmAwg7xM6r8t29ei4ewLcTfHVy8kaK5O5GKI6VsX1m81k3l5dOE57j7+qBKAC9WbiahXtyg0Agwj8vQqXMEB/8Ctx/n6uB/udDqszw3OzAJgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1ceTXUtd1PCZIPA0k277xVSSqyMnaXzlgmqMPf62c0=;
 b=nVd9F3PetE3NPpIVvgU9gS3fgC9oERCbpBb3VYuM91G/m3/fMm3wISsbLh/PGK1M5ICEjk2h6Z2vNIywszqHGX+SkTGp5snbGZ+9y1amHtluIhkQnXwagz3Z/W7pH77EeOf3gZrMwuKhy88pI1gYnFR5iIAZdOVpktVnDEGP6eTwW/zSsee8YPwTiLt49qU1iW0XWoJ2N1e4OyX8dtHyvedHGrKihyvfgNupZB2X2gYkeqGhLMjt8gFtMzePivryCPrXjFACnMrsfGIOmas6fx/2bIgSzlfRyDLlMGGB7VUZNmBSS0wdjpTZwnShtoupFRqBiFJ/OgqsHSRjlg14EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cfaf75cf-f658-4df0-b654-f1c3af279b15@suse.com>
Date: Mon, 4 Dec 2023 10:39:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231201184728.31766-1-julien@xen.org>
 <0e20592b-9800-4b9d-9f2f-a996f9ac00bd@xen.org>
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
In-Reply-To: <0e20592b-9800-4b9d-9f2f-a996f9ac00bd@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: 8514e3dd-ed2a-4589-5763-08dbf4ace457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jP7izfm8euVwQnmx8qIYGQhyTZ4JIrjBipg6skFflteVU1IQGCjdvV7/pxJ45bcHINXnPeF0cPzEJ0xTyoyImj27VRBwY8YMabKX7OEJ6Us07VdBCL639mj8ImsB0RStUqK9z3WYUNsS7NErDFARjhH6Fu8sKaoJLzhKgiBtHFQI++FKgRh8ZRw/YP3oJFiBSrRG0uaFY3XXnyUgiD5hyKMd5VtQHWMtavevfvH10sLU0qxUgetaNWTOimli97IHcY9IFgmYgLk1NaGbgZ70jmq7R9fTi4LBPuPgKxtf8FBFmNtygKaDPXksfYWdKQeCFhWcr/jSSvdXE4H2lPGGdXY/hIfUPoszhwoveaoeXjQ+ZjUZpb/IqPBbMtVgFlDQROjs3LxAjAa+W2TBzT3b+OkBixj3IpTTRwEQAOSlLFgDcOpUwXwvCElIGmgMyPjGRKYvXAvElv80RPCsajxcwWSycjjYkHBCLgx2GgaGDRIh67qnhIiQOpDtdUUjmFqM6e+dknnLXwM5bT5aErI2FFVxjlsr0y0wWqJFXt4fLKDi0zGjewSUJm0m6naCRhuXjiUjdvmjVUJWsdiuoEUSG+45E+8W8ww3Ta5jeXGZq/eJ6FZVBFTAj7B7wkR/UxCKcjEUSBZJrk+JMDG8M37QHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(346002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66556008)(66476007)(6916009)(54906003)(316002)(66946007)(5660300002)(4326008)(8936002)(8676002)(31686004)(6486002)(38100700002)(31696002)(86362001)(478600001)(2906002)(26005)(2616005)(6506007)(4744005)(6512007)(36756003)(53546011)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGJiMFRIUTJ3RVl2WFIwdmtDbnRhaXdKUTVuSFZnNkJrUEhma0QvZkc0UUxY?=
 =?utf-8?B?eUo3RnhsQmdiTmxaak85UlU2bmV4THpvbE5xR3YycVdGTmRiUlZSaHgxcTdo?=
 =?utf-8?B?RUkzS25xZFFNeWtWUWpST1BoeTk5U3Q1Mi9YK1hNL2MwRXcyM2puVGhwQ0tz?=
 =?utf-8?B?Z1dNbGEwbW90UFQrRkR6RmMwMHp0QURYNGhkZC8vcEZpTUFSOXJwOFQ2TWJS?=
 =?utf-8?B?L3BXeEcvNHZqN3FBRGw3aFdTc3BZcWxWSXJQK1lUcGExOW9sL0Yvb3NTaTQ0?=
 =?utf-8?B?ZktzOTNpbzZUZjRrL2xHYklONS9UYXFSd2gvNktlRnhBTEZiblJhME83RXNv?=
 =?utf-8?B?K2xxRFVvWW5QZk0zMGJIZlpzTFpCdHFkYVpmNFUyYlROQ1Nma1YzZUNUcHVX?=
 =?utf-8?B?NWJIR0tYTnp0eGlHWUlZWUJ5Ykt5a0Vhazlaay9wUGhySjRCNUM3bnlBN29w?=
 =?utf-8?B?a0xlWFYrNDcyZVJOMTRnWlE0TEhHRlJybHJRZFpPYURwSjhtRlgwR2tmcjZk?=
 =?utf-8?B?RWxMOUFKQ1hhU0hQQkpnYUpncDlyVTM5czB2OVhVMDlJTUxsZ0J0T0ZuMkNH?=
 =?utf-8?B?QnNSdXFaN3E0STNLSDhHaE9yVDlUSmEvSDhCd05kLzRFdjBnd1JsMVc5UG9L?=
 =?utf-8?B?MmlHaUdpVkhhVTYySEhkcGR4M2hCeGJJVktOMHpPbnNoVVpLa2h2bmF4WUV3?=
 =?utf-8?B?b3lNVEpoMmJZcEJSNFFiVDVDeFJHQTFTV1Nia2NVNkhqZDZycWpaMUp3YzRj?=
 =?utf-8?B?d3ZwZmxvNWZDb216ZFBSdmtYQTI0eU5EU0h5b0hrZitvdTAvZHBlUnJLaStD?=
 =?utf-8?B?REFINVJka3FndndVb0NscW5jVjhUc0I2MjVVNEw4T05KSEFXQUxhMEFhMndn?=
 =?utf-8?B?OEFYQWdLUS96VG9aQU83b2NZNmxkOFJDcHBWdmNENVk5elp1ZUExZFMrWnhG?=
 =?utf-8?B?Vm1ya09rM0RWSWpxMkQ0VWhFbUNSeTBpQk1Fb3g0L0x2dTlMWFVrd2NpVFVB?=
 =?utf-8?B?N3hYbWFaNkpoZTZETWM5c0VDaDNiWEJYUTg3anp3RkpNSmw3NHJ0WXQ2RVNx?=
 =?utf-8?B?UDN3bzFGdzExcko3SEZmd0dpeTJqT0JNN3h0a2lzSHJMVDV2cnRXQ0sxTUpG?=
 =?utf-8?B?YlJBT2RWN1hrVThwYkRsTDV4V0tLd2s0anl5UnkzR1Avc0VlQkxxM3ZwYlRC?=
 =?utf-8?B?OVE1L3kxbGFnZ1ZieEdmYzA4T1VmUXg5QTdlK05VSzFaM0VRaHJOUElwb3ZO?=
 =?utf-8?B?Ykh5NlljTVR4ak1DMjdiakxiZTV5SUh3NUYvaWw3S3F5czJiSVczNnNPZW1k?=
 =?utf-8?B?R1NkcU1ZRnYvOUJSUUtRZVlFYzlDV2JuWWo4Zm4vNkxJanN1VEc0WEt0SWVw?=
 =?utf-8?B?TG1Id1VJQ2MzWWxLOUVzenFkbjhndTlrbmR4MVp0cVVFdXhPUDRwbU54TTlS?=
 =?utf-8?B?SXNxRmZsSTAzUFQzS2VEcUswKzFBc05nOWZqck1FellZVFNuZDh0bHQ4Z0lj?=
 =?utf-8?B?OTRxWktOVWg3dGtJYzdBZStvcldLa1lqajBGZjgwVUw1VWtYc2l6NHZWdVp5?=
 =?utf-8?B?dmUrMy92em10aG5VRTdLd25WOVlxcGZCSVdzM3FaNTd5anhxekFQK0NybCsx?=
 =?utf-8?B?MVBScnJFSmJqMWUrc0RYR084K0RLbllGRXNYaXVoWjVVSGVVeE44SXlGcVJm?=
 =?utf-8?B?ODRpL25tYXpPTWZVZEVwS1lPT0lnYS9NNll6YmdEMnM3Y2V1YlB2Y3NWTElE?=
 =?utf-8?B?S1FTUVh2bmhLeEJtQjZZaXBpVnE2TTB6RkVvSVlHVkZiaW1nZ09BMjVXRXox?=
 =?utf-8?B?cGQ5dFBHc2FRQVZkTzFidnN2ZllRT3pTeVp4eWVhSjVxVkRIVWlINTZId05y?=
 =?utf-8?B?TmxCdTNHU1pHdGxVemEzRXVHamJldVlaUlhMRTlBTHhVbVRIOFJTbEUyT0wy?=
 =?utf-8?B?Ti81YVhWamlSMHZMdXZwZWZnVGlxVGQyOEhZZVBwSjc1U2xHWWtKSE5ZZjRR?=
 =?utf-8?B?ekdNTG9PSzh5Q1hUS3hvQTM0eldweGlweFhUOERjVThGTnVnWWE4bDFieS9C?=
 =?utf-8?B?ait2RzhaanV4dlF4VzBFMTF4a2t5R3VuaHVIdnlEWEExNXBodWF2ZkcvLzJy?=
 =?utf-8?Q?Iz/RB2hSx+oahWLFBjsYbJqGx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8514e3dd-ed2a-4589-5763-08dbf4ace457
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 09:39:20.7287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFMrGe0CloQ0yheaM6hGaNuoSweYRml6rnk1IH7dvGk/FXowhdp7xggxwrev7vG+BICEvN+S88Cig3AZTwpwgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9113

On 01.12.2023 19:49, Julien Grall wrote:
> +Naming convention
> +-----------------
> +
> +'-' should be used to separate words in commandline options and filenames.
> +E.g. timer-works.
> +
> +Note that some of the options and filenames are using '_'. This is now
> +deprecated.

I certainly appreciate and second the intent, yet I'm afraid "Naming convention"
in the doc would (to me at least) first and foremost talk about identifiers used
in the various source files. If this really is to be about only file names and
command line options, then I think the heading would better say so. Alternatively
a clear indication would want adding that text about identifiers is supposed to
be here, but is yet to be written. (The text itself, for the intended purpose,
reads fine to me, fwiw.)

Jan

