Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D91F8030AE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 11:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646801.1009355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6N7-0000CY-2f; Mon, 04 Dec 2023 10:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646801.1009355; Mon, 04 Dec 2023 10:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6N6-0000Ai-VB; Mon, 04 Dec 2023 10:40:16 +0000
Received: by outflank-mailman (input) for mailman id 646801;
 Mon, 04 Dec 2023 10:40:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA6N5-0000Ab-G2
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 10:40:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81ea5665-9291-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 11:40:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.19; Mon, 4 Dec
 2023 10:39:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 10:39:44 +0000
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
X-Inumbo-ID: 81ea5665-9291-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbMRZB7UKQ0IXBqSMdS+fFOCEnSxaG5Pd+LIe9lrxCM8lZRj+clzUkRwvohspeag6jWBLWshbOCWD5EawuxT31peXXFyuD62mdZC20rqkCPhFeRnDHYcf0rCme8Q71jK2Kk0VOTWhlPbrIV/RxgLpnXUeB/X3VjDWTgLmLt/wjAKSK1g9CLNEKhYF9wlX4arhttuQQYxHcQzmh888TUYvO6JRCeIVKFSKrqs0NFgTCN4Ai0DBYIPY4TOQBeoewev51CazbzwkEmaIvoR0w2zHTU6d4R0gA3yQrqnl0XcZokI1u+aR5n9VDtIqfcvaKcME5kefu+YZLPWNfZuhNuINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vL2YuAjFluyJth9uTGT1xD4fzNpamHY+VY9WWWayg0=;
 b=VwTfSsYYK1LCjJFTA+rRFXD/n2n/0+vt420MRZ0Jd8Rr376bd+v7IzkV8zOn0VvcA9hy8tnCs35BdbmexGGICEOyJvs5zPmBuTDnBSM0VcdyW3NV0S/Au9kD4sFdPBOaWgzYMsHubrhqLwpyFrGnrcs+hBJ1rCC/zU7UDD2jgKZZ1A9E2wOSDHkt6KKMXLn3VFrOFnyCcpP0g4yNj6n2rbkWK1lGqM1LaogJItSVjAiEfQgBmnwXDdfIkEUTh1S9U5vuNoPHONtfLW18WvJyQRDHtWxuGHG5YCWjM49lnIl93IMeVu1spxLP7//9CAvndxj+lej++KP1Ktef0URLOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vL2YuAjFluyJth9uTGT1xD4fzNpamHY+VY9WWWayg0=;
 b=2Q6l92sJB9jFbzqsnZhLE+yrJTOALm+y4XT04snqY+klHQLOIEmAUCjuQS3GX9kYExHSdwlAShzWizfsKHAkGySDzNrlS+rZxR9XxiHb7yqYJmJb07f2W8FJ9GXa7ErWtPxL/Loz5WIU/r5JNt4RvMdLDhZJEIJv+2gLGihSd2fKJ0boqSEy+dD4wgiIr3JTsKI8MuJd7Ok0bM9fPi5uDe93sbnmIEavYe1gvXRqUc+IR1yEWRdFo/k+77JL6+QbwhpsWpgqy1+wakMQO3MpdBIae5EV3rP7O61fzwb0fM2MFxkx7R9UXcnIZTIalLdBOvp+TQRHF6nSRKpqdFyYdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <abb8c26b-4c8c-4fcf-a8c8-4a15a5067fa0@suse.com>
Date: Mon, 4 Dec 2023 11:39:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
 <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
 <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
 <5af2573e588f76b8df3423fd13a1b4275cc18f33.camel@gmail.com>
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
In-Reply-To: <5af2573e588f76b8df3423fd13a1b4275cc18f33.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e96005d-84d6-4af3-3c6d-08dbf4b5545c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MAiwD90uUvAs6t4oKakPCVM07Zs0xCUeahSOa4vF2mPyq9KLGVhQqVrvxK/lL6Plssrrvm3NBuURiDmomZZsaGupGmwcbSdVYjfpqH0xzqRe10vOy5wLpyRKGSWtjlY5Hk93wIpqlNghV64UveRGEyO5f17pGrkj2MMjolmOZZeOLik8e0VQDCJD8AiJnsT37tIGrEtHk86rkXlMVKr06YPT1IfEwFSIwnFSGSKC7QyIo/nmIUW7UC7qb43PFUPtXnGVwmHeNFaDRUF9UGDLkgK0Q92Wh1ivLfwABfvzLMSv5F/ZQNrZ5W+83/2IibwHKxSFfgnSL9zdNbkMNf4hXBcACOv4JG/e2ukVvWNyFmW6pc2sUXQRxMVkumoV4agk2mo83fgpAfJpr/kW7DVBH6mTFgHatHsdX+1EIeiJovRFH97CGkpV9bJQQcjd+3dOAcGtlDG8NEDz54X/l5ewm64CZnulrlemBhxCXRZDj1wAGSrcMdUOfYTr+zfGSQ17x4LtvJZZVubsqU7WjWMf06QmU+ghzeo5mBgwjrePPWHXKryRS7d3rz//+GwZH8RtdmRAmhyAtw1QbgQLsym/9ug7W3KZDwLLuXUViym7YSmuUs7YjUEsp0Cs1NQyT6tu+tFc1HH33DSVX+MfUr8chw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66556008)(66476007)(6916009)(54906003)(316002)(66946007)(5660300002)(4326008)(8936002)(8676002)(31686004)(7416002)(6486002)(31696002)(86362001)(38100700002)(83380400001)(2906002)(478600001)(26005)(558084003)(2616005)(6506007)(36756003)(6512007)(53546011)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akJMQ3MvTjk0dy9pUExSN3IwZFVZOEZNbFJsMWQ2bnVjUGtPdEN6clRpa0NE?=
 =?utf-8?B?SGw1NmRYNTBMNFlnNlZLWjZTakhWL0l0TTlVYmRXcittTkNUaWRqOTJxTENB?=
 =?utf-8?B?RjMrOVpSeUdMSXdHbkVWRmpDMHRLcXE5WnlDUmU1cHVHWnZXd3VCRE41bjlL?=
 =?utf-8?B?ak9QZmJ3Zk1RM1I4aTkveE5LNmxzaUQ1cUE0dHV0MFdjQmRvZU9zZ1IwZmZm?=
 =?utf-8?B?c3NQbjRabExhZUVKM3NGT3BWcnRUU0RqbHRsdWt3Tjc1dm95MUwrcHpNclM1?=
 =?utf-8?B?cHlLaytEc2RkNFZObWk5cVdBM0dWblRjekVWK2ZhZFYrc20wUEFNcGZoZjdT?=
 =?utf-8?B?Qyt5WGp0UGVrQ1BEeEh3bnJJR09DbHNSbHlhbDZHT3MxMHZKbGNDVnFnbUto?=
 =?utf-8?B?THJ1ZGpHVGxZanpvTk5haTY3VHBIWHErYlNYM2xnc3RWRkkzZWJ3c3pQWWY3?=
 =?utf-8?B?THUyOURVUkF6dFpCMGN2VWIzTVFBdy9yWGpNYlRQRU41Z0IrZ2JPMGszNThh?=
 =?utf-8?B?bDlQYjdmNkdlczFFWmk4ZlVYUUFIQkswY1NkTVBlY1NINmt0RGtTU0lLSWNM?=
 =?utf-8?B?ZUtoZG9IaXR5aWJ3WGJmVkFXaXUvQWw0V0VnU1hMQ3c2T01zaHRoRTRlZWkr?=
 =?utf-8?B?ckhoN1V6b3EzSmVqT2U1TE9NQnEvVGVrK0dvWU1jckYxRDVDa0dFeDRHOW8v?=
 =?utf-8?B?cHFsU2UxeUFiU05JZUI1T1JzM2dLQ3FsdXF3SVZSd2lzbkw4ZG1kRW90UGtv?=
 =?utf-8?B?MUVXUEJkOHNSbUxTdkRpREUzWEFEWHg5UVJwQXczMXczeHcxcjZwQVhhREg1?=
 =?utf-8?B?elFhVVoybVgzNUl4L281UU8xbHdpKzZ6NWlSWWpBTEN4NlQ1VUZLL05obEVD?=
 =?utf-8?B?MWxnUTB6eFFFbGtITmp3TlZFYmlaSWV3RXZpMnV0anFub3hSWERsbkNGd2Qz?=
 =?utf-8?B?b2RFS1pGMXp0dmN2dGdndmV1aTJ2Z0VHOHo0aVdhUVlXQm9aVEIzV0xFenZC?=
 =?utf-8?B?OEtrUG9CS3dhVnVBZ082MzljKzVUZXE2b2x2VkkyQWhIaWFBWHF2Nnd0c01J?=
 =?utf-8?B?NC9FRHFHVGhMQ2MzK0MxbXUyc01CVjhCeVprWU5TalpIcTFvSWYvTDlBaWlB?=
 =?utf-8?B?SkNaL0g5V1BHb3IrVHA2L2RTcXBTSkltZkxhanhxQ3BqZVc3ZVNaMHk2OWxa?=
 =?utf-8?B?UGhTL2x2dVpUK21aMU5OSXozdUd0YllSRWtXOHI3SHJhSGRjODZDandmNEFZ?=
 =?utf-8?B?b0lNTVhjcUlDMkxWbTZacll1WHB2dlFaZTFzRG9NQU9xRGlFamRWb2JuUDgz?=
 =?utf-8?B?NVh3TWxvK29tQTJlcHpOMEwzU2dhZEtiQ0pOQWZtYWlWQ0xqYWpUMHNZVHQz?=
 =?utf-8?B?RVZ5TG1PZE4rYTAyV3k5MXFaOW10aDZOekFnV3pMM0MrRnRjMTlyYmFhTm1k?=
 =?utf-8?B?VEJ3eHZZUVY1S3F4Z20yZVZieGhzVm5peGRFcUcxcHNpbzl3VVc3UnV4U1U4?=
 =?utf-8?B?TmhjOTRnNk5YMGhwZHJtRFozRTRiak5OVU0ybmRxMTdUNXdqeXl0eUVvZUp0?=
 =?utf-8?B?NXhCdkpGbWpvMWFwR0lXMVNrMkhHOExUaDlrS2hteE5CQkdvMTVTRGo0NDJl?=
 =?utf-8?B?OXo3U2FmejEyRlBFOHFQSFZ4ZWliVzhHTzNNS29kcHZOYXkybThIelk0SUkx?=
 =?utf-8?B?L1cvL3RtdGwrd1VwU3ZpRWNXZGVENnJkRjlhbE5vdEVEcGFkR1hsNUYrdlp5?=
 =?utf-8?B?M2h3WTZtcGZreUlLcU5YUmJ6N0NROFRCR1VJQzhDczRwSUdpM1FQd3JTbnJs?=
 =?utf-8?B?d081d2pJMnI3OVBpZ3BKME45VWhMak1aNm9qZjNCcGQ3V2x3L0RvS0lQUHR3?=
 =?utf-8?B?eHkyRisxTmlQVmMxT0NmeWo2OXJNbW5QeGRvdFlhR05MQ2xMRVBnOFFFbGwr?=
 =?utf-8?B?WlQ2REVHaEdZWU1UYnhpMGovMTRVU3JmcVIyWitlL3dKYVR0c1lvVWxqRmpq?=
 =?utf-8?B?OC93eXVDcDdGQzRYSENWZ2RwdCtyY2ZFUktpOWZXYkp1MjFyVEtOTkFDdjZJ?=
 =?utf-8?B?VmhlWFdZTDJ3bGtlQlE2bVdpTEJsZlhkNEl0ZEdYNWNYdUlxaFVCUUNMallj?=
 =?utf-8?Q?Wn8LNv1LpFqEXNiyLODsk3EMg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e96005d-84d6-4af3-3c6d-08dbf4b5545c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:39:44.6622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRlftKtZMkRM++HIr/ZCdup1TIjqYjZ7FmSDdrwqueCnyY1XNHH7HjOmpxA2YCBb9X37DKZGcpRlMucawF6BsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7308

On 04.12.2023 11:34, Oleksii wrote:
> If you ( or anyone else ) don't mind, I'll update the patch with an
> introduction of HAS_GRANT_TABLE.

I won't NAK such a patch, but unless convincing arguments appear I also
won't ACK it.

Jan

