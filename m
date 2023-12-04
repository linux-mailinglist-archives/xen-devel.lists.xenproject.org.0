Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADA5802CDF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646570.1008945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA45J-0006yV-In; Mon, 04 Dec 2023 08:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646570.1008945; Mon, 04 Dec 2023 08:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA45J-0006wp-FG; Mon, 04 Dec 2023 08:13:45 +0000
Received: by outflank-mailman (input) for mailman id 646570;
 Mon, 04 Dec 2023 08:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA45H-0006wj-VV
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:13:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c0ab35-927d-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 09:13:43 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8590.eurprd04.prod.outlook.com (2603:10a6:102:219::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 08:13:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 08:13:39 +0000
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
X-Inumbo-ID: 09c0ab35-927d-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epVo+LjkyZn9ZAczuOsrjNLZwC43KLLoNWOmmHISgByyNiq673mN9Z714wmFMDj3BBQ81R3DLplM5lyygdj0NW0HaY41MkElTVJbi2Z2xEItSEggTWVGe0CsYSwPUi7as04Oul3kxZIDKMjSWPPMOAtWHc0NooDCDzbKApFI9YUOxuu9vLHUgaS/tgpJFoHPciux98vi1b6rC1EbO9ZS3b+c9gqlb+23Ncej2ErDvvoOw524lP1uzLUNrPdMQ8Q5pTiukrh/7kz2Xc2nlwau8eXQN4YuqE5p0XlWE1+AYfRE7Nt/hzvQ2tJu1EzLyJEJTrMtPSNGmG5unLp21TLrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v79NfEU30e4St70R6K2iTSVGiCrr7q8MfBmXllCerYg=;
 b=R/0ZyCmIQ2MDRmcL8Aa32nPY4uTgmio4PD6To8SDWLs75AiZL0W34c5/9qVcJaVz4QQqVw4g3Qro05qqF2UjBCDq213u7VuBzdGsg79DCcEbNAiRtjyUKXQqXrCiWYQVAZ6Tdp0xneIkZYzaor4fTU1b16BBo0dMmpaaGIMg0IOAVELfqNaxFXTYCgx5eCZ+D3hy20ZNR6fwwN74Gxc0I/YF2Vi/Hu3S5md8kZ45xAJ4hpkrSHbWd86Db0cRuRUG/3njvsRbO8nAxtBxpC8nDAHt8OYivFnx3eYlOhabok+Vdl0kowJeQNtgjdvu7uvsBV1l5zVcg+qWYvARkb5hkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v79NfEU30e4St70R6K2iTSVGiCrr7q8MfBmXllCerYg=;
 b=ohBqy5eFZ3ABp7KXtBmyeLSpDL1LrIFwcudOkc7g1LVAFGERS2jvKUJGI0dC7R21cnlwOsHbzW2aKFCR0X9YPA0zMMNEitaCjkJUVTqPxQcYEmEGfUHeUw8g8jWz7s8C2YC5fJUO1kLJlCbSt7EWgsmitmdMO1+ARis2rvrGxmbZSo3cZlatKs16j7y5XMxYPpBQE2bu/6qYlxn54m/sI90fS1QFdCXcnixyoqtwTeUPUZJG/qzfzqhVz7Uiiu0ipj3s0TcVNKUekpI8BBuS9CvikUlFMFopxyl9VjzjiLH/oMyZkvET5p2WW0rWCJklufFD1kQSRrZhhtIi9Fm+nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7de015ba-4245-482c-8679-45ef041df9f9@suse.com>
Date: Mon, 4 Dec 2023 09:13:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
Content-Language: en-US
To: Kelly Choi <kelly.choi@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, committers@xenproject.org,
 George Dunlap <george.dunlap@cloud.com>
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
 <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop>
 <CA+zSX=aZf1UQt2eE0byMgwL+3EfW3B6CJkUHuFBVGA7Na=9gqA@mail.gmail.com>
 <CAO-mL=ybm=AGyeerpngwQBTn6995z937bR5Gf8Qd5vP8MmR2TQ@mail.gmail.com>
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
In-Reply-To: <CAO-mL=ybm=AGyeerpngwQBTn6995z937bR5Gf8Qd5vP8MmR2TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 230082a9-1cb5-4e74-114b-08dbf4a0ec10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yr5bw+5pLwBP3aQkSLn0Z0nvVNObysfZkXBoHufIvVtXX58JCWbcdnGvNSFia6ceyziDXTQ0A7pYbPz8z2rdiWM8wwlmQooLoJsgMp+fsCQOKe1HAidPzHPNUT8wq1uGsJUbIHSGTzrgvehWbpBg0UTsoBHMZUXh2FASlJ91r5ELd4k7AbXyAyr03cn1gljn1t8KtzlYi1n/5+WlNj/tpPHE4MACeA08JIRsN+TVWMJU7An+ov+g/zNC5qf84KhMyXzTvZ4kh2T6lIQOq6bm50n3IEJG8Wfm4AkbhsCieLASHomusvi4ha65Yk6Z17B3whj6SuffoArumZLi6ZfEE1/i5PWOf00oH/s86riraw1b0iegFqVFrEiNqJZI5ipbJbgyqGNcED7vNG9ia7MsYCJ4vfBANdtkf2UH+GXOFj+HJtMCLsIEo/9/hyt6cvNT5YgVNnKNqRyPxXAAzn+dAv9tw/nTqlAwBBaMM8yePH+0cvKlL1YA/AaF0tMyUvVbgW5B3RfzTFRBY9GLzfnaYFu4KUn61AqVndL7nRTrqrJRCABR9O8zIhwj1LWgb1XjoZOZXPpKj4RPsQR7EIkU0onQAtD2fZSc/kVhDHsy7yHqJO77Hn1GgJh48KPzP7ogOd8JPT0NPN8URGr8+esfTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6916009)(66476007)(66556008)(66946007)(316002)(54906003)(4326008)(66899024)(8936002)(8676002)(31696002)(86362001)(36756003)(6512007)(53546011)(6506007)(478600001)(6486002)(6666004)(2906002)(2616005)(26005)(38100700002)(41300700001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXYzck1TUzZBZ2RqaWdQZHViRzZNVCs5VERXQlpTNjUyVXh0T0FFTzZTNE1r?=
 =?utf-8?B?R2hsaXRZS1lvUTdTV2o2V0JCM3pud0Q2b1dkaW5Ya3RnVUJvR243QTJ0ZWhO?=
 =?utf-8?B?aVZTYWhncTl4NC9EdkE3R1UxeU00K0lXVTZqTC9tdkM3dlAzUUVHYzBIdU9O?=
 =?utf-8?B?NWtmR3lxQm9icXZKcDdRS3MxZXNDOXdVUm9xVmw1Tm5lTTQ3QnRFRUFFdGE2?=
 =?utf-8?B?SXlpRzRHYXREVVNtMkxlM0hlYWlGNzZpemRWNTYxOGM4NytxNmc4enUxclZQ?=
 =?utf-8?B?UXgvbnRjNWhmTHlRZDFrTEkva21GZldNYWxnd3ZtN3dSZHlSM2txL1phVXY0?=
 =?utf-8?B?RXJDekZKRFBCaG54VUY4WSt6Wk5oTlF0bVpmYXI5R29WQ1ZRbWovekNIaEdu?=
 =?utf-8?B?cmdJVnB3MHBhTjcwcmU2b3A5bElZdVU1NzNTQXlFd3VJM0l3cGdUVm8yd0Jv?=
 =?utf-8?B?MGNNT3U0NHhVMWFDUWFZTnZud2hBTkVPSWJtNEtVS0VtMiswNE5pSHI3d0xM?=
 =?utf-8?B?d3dxM3N6dnd2bFhWakx6Mm1aQXlQOGU0bFJvTzNVVEZ6RjB3WVJMQXVVb1g5?=
 =?utf-8?B?U2pYVnZycnEzSy9lWjNHK1hHNEpqanREOEovcElYT0pCdTdLYTNJanRXaTVo?=
 =?utf-8?B?OHpmbHhnWjBsTnNIOWhOYXpLajZabDErMzFlU1ZqanppZjFWZTk1aHRERXpR?=
 =?utf-8?B?RnBvWUE0andLSGJvclB3SnZiWjI0bG9helB6RHd6SWRFdGdqZk9kR3NmVmI3?=
 =?utf-8?B?dHdZSGszZkRXWXhkK0F3cklCUlZBUU5WZkpLbEVKNmx4SHBSeW4veXllcFNt?=
 =?utf-8?B?NFdiRUNadzBVRWpNUCtqaEd2VkdtZHVYcFNiS0tPcXJJRyt5WUxMcjYySmpF?=
 =?utf-8?B?Y3FIaDFOTWM5Zkl3cEFiYkxldUk0RHNGSUtmZzN3R3JuWm54Kzg0d0ZwNGN1?=
 =?utf-8?B?OUlYMlZ2c1hsY3d3MzBra01vbjJRWDJITkdCM1NTN2pNcmZYcmZJKzZPdGxu?=
 =?utf-8?B?OWVpUVYwN2dXbXZqVWV1Z3hCRUxDYTZvQVQreC9HMFJiczlFOWZvQU1wS04y?=
 =?utf-8?B?eDlmNE05RDQ4UTFieHFWM3hxMTh3QlB3T2xLRnc4YmNKRlNoaXhtZVRoZENS?=
 =?utf-8?B?QWFKZE80d0tNNVI0aGdJVEhrL1FSUUlRT0Z6TlVtQ0pac0lQeGlmd0N2S2Jv?=
 =?utf-8?B?bWJZeUNIdWY3bENEbU85OWlxaDlnekV6eE1sSEh2WU5qekRjRmFIVEtJVFlP?=
 =?utf-8?B?YVNoTExVRDREUkVnSFI5ZXVteHZWNmErMnZ3RjdsdG01Wlorcm5qK0F4Tm9j?=
 =?utf-8?B?KzU3bllHQkFGbksvRFNRVFcvY25ZNTlOTVUwV1dHZEtsZXFxcm1pemZQSXVH?=
 =?utf-8?B?bHluUnpaK3Bhbko3TGsyT0ZEdzJHZmgrOXE2eTB3TVJDTGdQRG1HQlVaUFVJ?=
 =?utf-8?B?anBGK2d0Wkl6NlEvaXZ3MmthRlJuNkZSUlBpUUxiVjFLQkRvK2VORkFLendV?=
 =?utf-8?B?TGJ0aDFxSEtYT1dlSitKL0NUUCtoOGFqZ2tscHBUWlhUdjZJTHliZk9Rc3hv?=
 =?utf-8?B?Y0lJeFNsTjJycVlIUnZ1dW4yVGtJWTdoaXlzUll4a1ZBaWVFQTIwdmFhZEZ3?=
 =?utf-8?B?ZFJuR1ZzRjJieWI3aHp1dGFTM0M1Y0hqZlN6U2wzNHVMcnZMUWdzbis0cUox?=
 =?utf-8?B?b05jY1F3QmxWUk5IUmlaZzIzclRkYXRhRlh0V2FId3k3T3JBQktjdlVGNVgv?=
 =?utf-8?B?YUJaTWlMVEpteHFGa0NZRC81dGF6ZEhQNnZFZkdlV0Ezc3dGZ1lPVEZYS2RR?=
 =?utf-8?B?RVExRkt3WktOS1E3MEJwQ3Mxd1d6N0x1aGZ4ZGowOVVVa1JtcEhtZDdraXhk?=
 =?utf-8?B?Um1tQVR3RTlvRTZqMWFpS05ycHlPdGNSelpnV3ZsMkF1ZTJqekg2b1NIcWkw?=
 =?utf-8?B?L3RJUlNCdGxhZ3NJeitSVFlYT0V0NUE4M1k0QUhyZVI0TGhwNGFqR0l2aDQx?=
 =?utf-8?B?ZzZ3VUdDV1BSc2RJQkhoV3IzRXgrSy9vaFZKWlRKUWVEU2lTK1ZkZUFGZ29T?=
 =?utf-8?B?ZW5BZ3RMZGtHaldqbG5mQVJFUzg1bFErNnlqTk1CRWxINGRPQis5clg4ZlRX?=
 =?utf-8?Q?68jtfxXMtxok3aqYuqf8fpKij?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230082a9-1cb5-4e74-114b-08dbf4a0ec10
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 08:13:39.6598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pT52RU9eRlOdhgCN6S9uECJO7kY09gE8HZObwNJtQUNy/75/Dj6+CiCnNdXxPEXMW9e2r3DhyJm4lmtdylEb5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8590

On 04.12.2023 06:02, Kelly Choi wrote:
> In the specific example above, it's difficult in the sense that informal
> voting wasn't officially in the governance yet when the feedback was
> raised. What I would recommend in this instance is that if George and
> others feel very strongly about removing that term and have given a proper
> explanation, then I'd advise calling an informal vote within the thread and
> following the decision. Alternatively if after this conversation, members
> understand Andy's point of view and the term doesn't have serious
> consequences - let's agree with what Andy inputted in the first place and
> move this project ahead.  In an ideal world, we wouldn't require voting,
> but rather a discussion. However, if there are strong opinions for/against
> a specific decision that is causing us to be at a standstill, this is where
> informal voting helps.

I have some trouble with what the above expresses (and what was an issue
already before): First, the subject of this thread says "informal", yet it
invokes more what I'd call a formal vote. Then above you again say "calling
an informal vote", which isn't my understanding from what an informal vote
is. That's primarily based on my experience with the earlier informal vote
that was taken on another subject: It was simply assumed that supplied tags
had already cast a vote. Similarly here I'd expect that the opinions already
expressed simply constitute the "informal" in the entire process. The
difference merely is that in the other case a majority was in favor (which
can be expressed by A-b tags), while here a majority is against (which
cannot sensibly be expressed by tags, as a NAK would imo be pretty
inappropriate).

Jan

