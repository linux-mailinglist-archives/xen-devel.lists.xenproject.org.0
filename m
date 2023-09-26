Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A690F7AE6A8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 09:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608292.946676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2MU-0004LA-IQ; Tue, 26 Sep 2023 07:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608292.946676; Tue, 26 Sep 2023 07:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2MU-0004Fn-ET; Tue, 26 Sep 2023 07:20:02 +0000
Received: by outflank-mailman (input) for mailman id 608292;
 Tue, 26 Sep 2023 07:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JCSl=FK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ql2MT-00042T-0O
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 07:20:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a2ceae8-5c3d-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 09:19:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9933.eurprd04.prod.outlook.com (2603:10a6:102:385::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 07:19:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 07:19:29 +0000
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
X-Inumbo-ID: 1a2ceae8-5c3d-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y942MxYTN31eY7LdLeM5nklpO8wVysbRI8PCRpGqTGHxwGQT55AfOTTC5fJvL02v42oMRVRz2jqHzW/avS6B7EPckPhWa76O3UNfpih7qEJMs+CPOkURp9L5uJA++pQGjH8Yzxh46L6/96zpmQVcAe5xhmwWeALMSruVQHHXx+ir2Dlk7UUicWSwoWwJf43r5vq4AsRQbmZiFsX2FTCAPZBkD8CaLb7neBkBBNqkmkiH/y4bNbOmk8HP4Joqzu4iAExbATXFobyMVSjX3+TVGiCWPHc3koKlS0LXkvcMralmSyia+p90sf1vNPmmJe9xn/vE7J3Ai3BG7QxBLGwrCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGnjUXdxhokVouZOQo2/BP6HMsqCQCsIj4g15Gdy+zw=;
 b=YVfUXcbQhegHyBppQjBLtQmz0cYNBwG4+32S7x+SyV99lfiwyvr0eRhqW6sStchIBo4pbk0cvDeO28bKVzfo7UYlN5ySw3HATHVQ9MNbBYhnTaFCPqGDbICPfn2T+Dk4jsQnvu050n3TZNuxqLlvdn4j6LTnyb+vh2Dpfd5dDpCx4Axlx2DWI8N/ac2GGlostaI6JERgTWez2tWpuIV9s/ci65CTBCtRkmxXf4/6CgssrIdnZUVM3ZG+YaoUXWzSRoCbQDrN8hHAkNRcrlrqTa1VSe9gOXnleun5M/Zj0K/+znfrWW5whykONbmqhxewddwbo0li+M+n9mT5KVF+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGnjUXdxhokVouZOQo2/BP6HMsqCQCsIj4g15Gdy+zw=;
 b=jSXEfQi2SOUpDEgyYMfIE1I6LamRb22KkfAuk+X9zkSDZo5wyRW8pyM5o1Ifkmbg6jfOYC71PCmgfR8A/LJHWt5Xuoa4qa8CwMaeTh1/ZSmRhyMnUrGurGT8fj16BEE2qE62695WQnmNvMig+lRC6pTBnvf+BwJkzNf6EJcpuFX3oiWyTRYmPGj08NeL1pC0PVtJrxBagumgTFh+Z+RBsqWEyKDzyFRDzZEeyJ70fZnMwhiRHQez809e/QtH+4BF5yPc1iqWnGlRLcU5dV5owAiRi01BDYBRW6z+XmeLjrd4B01Ef/rwtGEHCq8p1r2OCMy2ALxoRxp/t1olnGfa8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59f73c32-bde9-b0a4-00e8-24db1fea2d87@suse.com>
Date: Tue, 26 Sep 2023 09:19:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] automation: Change build script to use arch defconfig
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: xen-devel@lists.xenproject.org,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <beb83dd70b15ee6bd896fb26532f5debf955cd48.1695681330.git.sanastasio@raptorengineering.com>
 <alpine.DEB.2.22.394.2309251609330.1403502@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309251609330.1403502@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9933:EE_
X-MS-Office365-Filtering-Correlation-Id: c5476694-4f1f-4e1c-4904-08dbbe60ec67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gy3R55nFMHR96E6HC4UpAmmjojAKj+wnOCUWzrlpDpr1Dc96RG50v07PF6rjyn0kkxQ+qDw+SUapZIgiB4/S2yyOW42z43lg4wZ1yUdxu/DmxAOTqIVl8uOrauKQe0dWGRLbIOEoBcy8aEiZMspS4SOcZm3iw+1T/CYQ2540QcHivy1zxSg/murw5N3As+wp/bLUdRDCNF95LHx4kR7sFEL+vdTZoR9YeN7nu5QETP6rye2qdo5Fp8aFEu3tCqyDC/Mt35n0KcDk29vlxVx+RQXhE1KHiDPJ9XPupRTKLSrCL3YcB09Seku1/aKV+xKbUb610ahAL6kCIjXnyLcGNXYE+mqrqxag0Jlpk+yepDx/yeAzxwOyWoqCEdWt0ju9wnSd+ZAb1gWnNvoDiwEctmEI4l9u3WM5NE9zDGhfoBMNCEFw34/N6iRYbmUoqLBOIcih5OR3Ux5twcIxOxY6PdedoW7G5Y6SNnkyknpeygMxWOWSJLOXKU5VLLtF0wgUtzvRZuCIXDx1FDTf5vSAEFHoL9NGhlOL4zSXZOUjXbscpOlCaQhAiR2eSnZ/RUydsB44LEjjnH8wXVe+iMO9aaxw29GhdWz6SlAGlipcQHqtvFDcZVuN3Ys8LqmyF1HlYbS2kFQqWCis2ah4s7ei+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(38100700002)(26005)(2906002)(2616005)(110136005)(83380400001)(316002)(54906003)(66476007)(66556008)(66946007)(6512007)(86362001)(6506007)(6486002)(53546011)(36756003)(41300700001)(31696002)(478600001)(5660300002)(31686004)(8676002)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFI5VmtBN0hKbU80NHpRdlMway85NkNWYlRZVG1CSVI1cW5hR0JEeU45eUJ1?=
 =?utf-8?B?eWJnZ3A2SzJteEZwZUlrblFkdUxkL0YrellJc1lqdjJ1ZkFZZmluL2ErVzFV?=
 =?utf-8?B?TWRlVlJQQVNHcjQrQzBHL3VFaUp2dHB2WXl4YkYxRUxNMnhNbWE5bm8xZmx6?=
 =?utf-8?B?WUZqd0xIdFF0dFlERjY3dmdpaEx1Uy9kc0xIS0FqZGxIS1FKWTlZWHQwQnh5?=
 =?utf-8?B?LzJ5bHg3SWJVZnpWSEVrWnVXb2ZlQWdwdUZBand6RTROcTljSDlLcXF6MFZj?=
 =?utf-8?B?bTR0ZGw2b05xK0IvQ3JWTlpqQWVRVGlIY3dCcHBKQ3BNY0paMHhMbDk2UHlN?=
 =?utf-8?B?bEdYZXNicWtXdG1CSXYzbzlPbk5TM3paempzU1NEL05LTWpuNGp0SWpTUFVM?=
 =?utf-8?B?cUMrZmozalJ4L3YzcUV0Y3NZaWN4bWRsc0J5NHQwK3lLcXZ0RC81c3k3V2wx?=
 =?utf-8?B?cWxBSmliSkVIRkpVY3pjUmxqZ2JCbC9HUGErd0FMU1pqbTJBRnVtZENHcVlH?=
 =?utf-8?B?ejBZUStXZCtpYWQ0T0VzQ2pDM1ZTRTVvczdxeFByTWp6NmZqNTJzQllqRy9o?=
 =?utf-8?B?TWRqQzZ2Qmljeld6Nnh0MWNxRE5WNTdqbTNwbXlWSzJ0eEwvYXFaSUlLUkZI?=
 =?utf-8?B?OU4zbk9YcDdwTzl3eFlVUG9KV3VhTE5TbXloUHY2bGRIWkhmL2NobzhvN3U4?=
 =?utf-8?B?Y3N6bTZyOXpzaEZaRzlwTjJiY2dDQ0JxbDNGeGZKbXhaOFdFdTFYeVQ5cldL?=
 =?utf-8?B?cENGUGlmcWZjTnhlNTVabWxGM0UvcmpBdnVRK2FVUEgzdC9mSkdKM2drYS9w?=
 =?utf-8?B?djRYdjd1K01CRzJwVThMWE1uL1hNWlVSb2U5NjVhRjNIQzl3THlNSmMvYU82?=
 =?utf-8?B?U1RpN1RjOUxvRHNyaDg0OWtuVGlBdzBiUmE0RU1pU2FLTitlcVlVdk9janFT?=
 =?utf-8?B?dEhMcDlVNHc2djdHajlzTUFvc2toU3N3NFlibUYwQzVvZnRuQmNEVGhzZzBX?=
 =?utf-8?B?WHc2eTB2WFdjd1NjT3FHRE9lQ2NhWWJYT29iZWRMRHdJNjFpODR4L3U5QUdX?=
 =?utf-8?B?ajMvcnQyZFJJYVFhcjhyeHB1aHlwNVF4eHF6R2MwMDBSMFlkc2RWb09NNUlC?=
 =?utf-8?B?Y204dkRZTVJTWFZnVk1KbzUyZVNFQWVuNUpkSGJ5TENJQXpRcG1UV3JPcThi?=
 =?utf-8?B?YVBuNXllMGxHWTR1TlVGVEZYQW9NemtMWENpNkJ2WVd0V2RJQXYwalZsbzZJ?=
 =?utf-8?B?QUo4bGRFVFJka2lHaFJ3cC84T25MQmE3Q2FEV3pzYVV1MXpPTEt5WWg1ckc4?=
 =?utf-8?B?cklMNzg2bDJxQm5EODlmYjFySUVqMVhBZUZFQXp3dGJUY3FneFpmNkc0WnNk?=
 =?utf-8?B?RTJCVkJyVmJ4NnJCSThZa2lGMVROenArakJkaitnbk9udnlWSG5OQi9BblpN?=
 =?utf-8?B?bncvSlFvODR5b0VBaEhncW51dytpRGU2T3VPaWJRdEd5NytEWWRUMkdER29i?=
 =?utf-8?B?T0FiV3VUaXc5czBTWC9tKzB1MnJlQ1VtUFJKcC9rWDU3dGRJeFZQajFuTXlL?=
 =?utf-8?B?RkZkMjk4T2JMQUN1YzZoZGdWYy8rcVRmblZndnl0QkhTR243dFBQZkFIMEQz?=
 =?utf-8?B?RC9qWktJY2hVaXpxQTZQajFtcXhKWFlMMk1FbExwOTFuNEZPY1NQTm55cjBN?=
 =?utf-8?B?cGpGaWRhaXMwZ0tuK2phWEFkS0Y1YnF3aEVaTWE4MUJxSWJRdlNxOEFqa2ZQ?=
 =?utf-8?B?YTYzMHJ5NjNZTGI1MkJ6MFVMazBuVmc1QUpRcUpYSjZjRGNhbVNRYVJ5Qlcw?=
 =?utf-8?B?cXdZVnpZQ2k2S0R2ZG9aSEp3Q3p1Z1lTd3pycHFLaUlXUDd1L25sbURRaVNB?=
 =?utf-8?B?U0F2YkcvQmVSZjZHWHpCUWdqVUJvaFBCK0hkeHhjbnMrVS9kL2dHYVpsZ3ZD?=
 =?utf-8?B?S3ZkNlNwYzRPUW96dTJLaVBYaUpNZ3JCdEFXcldhUGV1b0V0anpqc1RXY3Vh?=
 =?utf-8?B?VWFFanIweXpobnMvVEZyaE9zNHZUS1Nrb0JBTTlYM3B4ZFluN2p6MCtPdS96?=
 =?utf-8?B?bE90OUJKa0ZJYjk0MVJUajVReCsyR2dOL1FzT29vU3hTemcreHpZRVhqQjBE?=
 =?utf-8?Q?uFWHaddYxyuRPUf8LZK6CQmsN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5476694-4f1f-4e1c-4904-08dbbe60ec67
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 07:19:29.7579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7FFoR/ffahmjJiz2FtD25WxFoIyAEzwPeP3VF5LgGKTfoBYg4kuj5BlYJIarIRiXJnIZcUY41Z91eQVeHgkGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9933

On 26.09.2023 01:12, Stefano Stabellini wrote:
> On Mon, 25 Sep 2023, Shawn Anastasio wrote:
>> Change automation build script to call the make defconfig target before
>> setting CONFIG_DEBUG and extra options. This fixes issues on Power where
>> the build fails without using the ppc64_defconfig.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Reported-by: Jan Beulich <jbeulich@suse.com>

Nit: Tags in chronological order please (also affects patch 1).

> What is the problem specifically? Is the issue that CONFIG_DEBUG enabled
> before make olddefconfig causes certain DEBUG options also to default to
> yes, and these additional options don't work well on Power?

No, the issue is that "make olddefconfig" takes the existing .config
without even considering the arch's default configuration that was
specified (KBUILD_DEFCONFIG).

>> --- a/automation/scripts/build
>> +++ b/automation/scripts/build
>> @@ -22,7 +22,12 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>>      # RANDCONFIG implies HYPERVISOR_ONLY
>>      HYPERVISOR_ONLY="y"
>>  else
>> -    echo "CONFIG_DEBUG=${debug}" > xen/.config
>> +    # Start off with arch's defconfig
>> +    make -C xen defconfig
>> +
>> +    # Drop existing CONFIG_DEBUG and replace with value of ${debug}
>> +    sed -i 's/^CONFIG_DEBUG=[yn]//g' xen/.config
>> +    echo "CONFIG_DEBUG=${debug}" >> xen/.config
>>
>>      if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
>>          echo "${EXTRA_XEN_CONFIG}" >> xen/.config

It never really became clear to me whether kconfig honors the first,
last, or any random setting in a .config that it takes as input, when
a certain option appears there more than once. The change you make
implies it's consistently "last" - can you confirm that's the actual
behavior of kconfig?

Jan

