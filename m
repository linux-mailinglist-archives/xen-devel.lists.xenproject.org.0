Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3179374759C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 17:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558516.872697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiJ4-00070l-GN; Tue, 04 Jul 2023 15:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558516.872697; Tue, 04 Jul 2023 15:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiJ4-0006xt-DG; Tue, 04 Jul 2023 15:51:10 +0000
Received: by outflank-mailman (input) for mailman id 558516;
 Tue, 04 Jul 2023 15:51:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGiJ3-0006xI-9q
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 15:51:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 977e7203-1a82-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 17:51:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7645.eurprd04.prod.outlook.com (2603:10a6:102:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:51:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:51:05 +0000
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
X-Inumbo-ID: 977e7203-1a82-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnR9Qjt05YkLNDrruO+vIe6SoBdh+pEyEqYDe8lw3Dzo/hWXZNO2n3co0vR6VlpjjVqPCl4SYfcDeelhvi4N2K6q0Cvie0HCb0hbso/kAbVMe4rbhZa9Fs6lMw/q0wD56C07yKDeYk089H0kygGYluxPJmUCquoFEWmsRXXAuBazy++0eKIzlNx0XtLxrzkHP5m5+wD0F6vckGj0R7HjGfi+PBR4qQPV442Gz0iSiF+jU/xWcnTZCbjTM5jvM1fw65z8Tq6q5CDlgsmd8vyyHyvKloBnBmv2gzghD11s20S8VWGJJNoX7onos47cT96qETHhYotY+w0w+xUywysIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mT6Xy78g6mlD36cWlfcq31hHskTqrQQajOhob0Lw9pM=;
 b=T4BHFjzOz+vFXImHH6BllNNcS1UInUgl09bkxKf6vAauIxYTr3nj8YY1dShECjp4TeOIgLt+E++FlPQY7Zq4CW9BnaUOkIcSlFoiLaRSdh5yqtnPi8hyOaf4Vum6O5t2FjHmaB2oUvClWeRCe+F1IySqooU6kl0lGDVY/MON+dDO+b3DOwirLzbvZOjjPZHsi9hRrskZs8AHdq53K9jU93XD6vhHovyvdG2UwRW1tCUtOokUvo1BqLURzya7+axcS7LNL+h1ib50UlTNTjOusgbVUxofjQMGUBsjiW3Zj8newy3Gip5QDTjuO9Bt1ajZfrA2yAIKlPqgG7wNLhLSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mT6Xy78g6mlD36cWlfcq31hHskTqrQQajOhob0Lw9pM=;
 b=DrGqBzOl4AN2dkNzoqNTUt3yu5Bx1XUzr9vqOFVD/8hptxdg/PkikuJsiDABvIVLt2cA4aQOtIItSFu+Xy4Ltxlwv5aRN5NarssM7NnqVLaWgjwSxeBi68T8Pr81tcElSO6S2h8Fu5RFDuHACoR8q+a7Hv0nf713eDD2FNJIeF9rBM+Lp5RuVQizfVW7DH1cnfSZMAJmcehXARRWHxyEFK3PLHIQxiU/Klr6PG+ZY1oAyRaGR5bZnd13JAcVv4fkK3Pk/+NzVKqBniHbHVWc4qwqWjGFNxsSiTeSCfkbFCPeZVlO3gHHG3UTyKnJNTf3f+6vCkcNaKUT9PxD+kfyVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a192d6a-4a4d-b798-c205-ebc0a2302c50@suse.com>
Date: Tue, 4 Jul 2023 17:51:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix
 violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, "julien@xen.org"
 <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <8a8d5ed47f24791d3927345fafed07023a8b0b76.1688032865.git.nicola.vetrini@bugseng.com>
 <55390224-89CC-44E9-95B1-BBA491BBFEF3@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <55390224-89CC-44E9-95B1-BBA491BBFEF3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: dea5e043-dee3-44cd-e98c-08db7ca679b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MG0QeqH8FeZZHmoOIp50T3G2xDIeQsV/PaNFIbaT7X0r9K5tEsRpDuBOzmyHJa2OoGGPEuMvcK+yrRzZSaWnni3OIIYshcoS/Rcn/6ybYyJg7aNm2bJb+P3H9qP7Vgh2xS7OTMRZzPzORNSyQMZj4H67bwbVgMwkCD/CeJ4JmgZB/PryZKiOzAraDiLK0686wTEHPUJEh3O0ovs+WNfSn9vrlkVlsme1qUg4B7EzigSdQXTIh4N7a8aq8FLydKP8ZR2jNRYFJk0bzC/GgQ7vT8N/70y3xNDeAgYZXyNyUYuAZVt8PIP9gv6Nd3VbFmlKtV63asIt9CoVVHByn1z9uIOsGeGsTuym3ysLsOHgy1oVcGnAnltnfVTwyf9HedieWTjB6WUV/co16pbyQ1jggKf3fPpyHN+spkNjbZhJDqwBFDj9ojwsqWz3kSeux3HQIwbWUlQHSgzXAoxfKjrb0E5Sqf/Diq1aj+ilCixmBDqM0lJuIyNOrk3fyhJ01MrqBdM7+xbLMV9oxs9XYVFOxDmLGHcWKqyFSfDSWnxj0nCLuzy6p9ztRqbANQeq45/VMrMTMF2I/IxrgAOPl4BM3U3XUXNrx9vPuWVFEnOwPWQ0e+aui1DS6nY3gceOsc5qWrpSLqUqn9lkfuQSbfzigg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(54906003)(26005)(6512007)(53546011)(186003)(86362001)(31696002)(8676002)(36756003)(6666004)(2906002)(7416002)(6486002)(31686004)(5660300002)(8936002)(41300700001)(478600001)(38100700002)(6506007)(66556008)(66946007)(6916009)(4326008)(66476007)(2616005)(83380400001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnIvYW9wY3JrdkMxcmFGZEc2NytyOTJUQ3kzL0l5QlRlZnh2V0FRa3JJWURT?=
 =?utf-8?B?dXRkTk52cmZLcERlYXJjL0pXd3ZvV2VmN2hMck5qWk5OUmdHbkQzREpOR1oy?=
 =?utf-8?B?NWRGRGlCdjRHY2w5YXI4bWJUSmlTRGVTL0RHR1FMYk93OWRad0R2MVA0aHlI?=
 =?utf-8?B?RS9LSWZ6TVVEUFpBSWs5TjNmZGV1TnJqNlNyRG5qK2dOMFh2Uzc4YnMyWTV1?=
 =?utf-8?B?bldHUlUzMG1Qd0hRdEFucjY4SERERlp6VWZhVzNxdHJ3S1JFSk8yNmJ5UGoy?=
 =?utf-8?B?WHlaYWhtNXRyTE5YcytaeklvaEpnSVloM2lFS3M1L3puV2hUQlpLSE96N1A4?=
 =?utf-8?B?YXA5Zm1Sb1NLN3RpWnlhWW4vZUtSanQ3Qkl1Q1Q4aG53OE9Gb2Zia1hRK1o2?=
 =?utf-8?B?cDljczdLM2diODZxUXllbkk2SzIxRFJMTHU5UkJveCtKdHFOOTNhNkVmVVgz?=
 =?utf-8?B?bUtSOE52UEZyZkM5cXR2eTd6d2dyalV4OENTZE9xclJXWUNVSG9GU3o3WFNQ?=
 =?utf-8?B?QlpyOFlrNy81Nkpadzc4SGZrYlFzamtNZmtnSXZMQmQ4ZUo3WHRwNUwxcmhR?=
 =?utf-8?B?ak5qTjNmdmI0TVRvQUFlVUs1bEQxR0NXbDV0NTQ3bVBkeTlOTllYOHRtUWNl?=
 =?utf-8?B?U3dtcHV4THk2V0Uybkh1ZkxFYTlUQkRjZVltYkI1bkhFZlFKcksyYmVlRWo1?=
 =?utf-8?B?QXN5YVdDOWpwSEQ0RkMyNGtuTkpneXNpOUFZajhWLzVVbTBtTkxHV2xDa3Rv?=
 =?utf-8?B?WU1QMlJUUWhoZTFhQlV4bjFjQTVpMTFsWnJxOHFlSGR2dEZqOHRzMVNjL3RK?=
 =?utf-8?B?MHR5UmlVb2c4c3ZQV2pNYzh5d0QxS0gxdHZMUDYvbjljM0RzY3NITG1jcll3?=
 =?utf-8?B?QUwvWHNDeS9yQ3dETmxSNE0rRDZzYktGUkxNRGJjdnJraTlQRFNNQkxoc1ly?=
 =?utf-8?B?RkdjQ3paQjRpZXVON2ovWjZiL2VsL0xjMkRnU2V0b2d0M0grOXZBUWh6dkNR?=
 =?utf-8?B?MExNR0VPdFFKL09NYm5lTzlEN0NzTnBxaTk0S3lkWVphdURpVXpRMHpNcHpM?=
 =?utf-8?B?bkNuaCtydDRFWkRXbGtyTkZmMk1yZThVcU1MZHNkb2h2bE91QXVTODl5VmhK?=
 =?utf-8?B?YzhEK01iMWhkN1ZoRlFnWTlOUE15MlRIMGtXQzljQThVQlBPUFpFMlZGaU5k?=
 =?utf-8?B?dGpqM1BsaWMrN3lPWjZRb1hoRTRMOXVWRTRBOXhLUEZDbDVEeCt3dHlsaVlB?=
 =?utf-8?B?bGRoc1FmQ08zcS91SUZxVzRsekVSVUtYUUoxbWN4ZTdnVmhHMFlicmViY21w?=
 =?utf-8?B?ejRhR05IUit6ZXRFN0I0NXZIYTlseXB0VnJ4aDUvVk9VZjdVUUxZaW44andk?=
 =?utf-8?B?RWdtOUxQZnBxN0FESStLK09RVkFWaFBjeGtjdzc1YURkK1lIWFZIU1FLbExL?=
 =?utf-8?B?L1JGbm1wYVUwYnlkUjFnQ0xOSzlCK0NqZmx5VnJ0Vkt0YkJxMHVVcTJLdU90?=
 =?utf-8?B?TGlZZSs2RG9UMmY3QzdnOE51MkdITkdsdjNRMXQwL2c0MlE1SGlEZ2JUbE8y?=
 =?utf-8?B?QXBQM25yNXVtb0pBeTR0ZUg0SXlxb2FuNWpseFJMdkZaSUxJMHFoUnRsVkd6?=
 =?utf-8?B?YTdndnZic1BHR0ZhdWRqZXc5MC9aazE1RjMvREd6d1IvNXFZa2d2RVNIQnBi?=
 =?utf-8?B?UXhjWW10V21nL2pkSUlDSHVNMkZrcnY5K2Q5cnBnUFcwK2VxOEFwT1dSRUpy?=
 =?utf-8?B?TUYyeGxSaDNGdkFBUjkzTVk3d3lVZnk5TDdUWjlkRTEwQnkyTktrYkpZT2NF?=
 =?utf-8?B?aGJScHBBY3FYUGJIZHZONXdJTVArSU9hK29PM1hkNVlxb1d3cFN6RnpIMkIx?=
 =?utf-8?B?WDlHazY0RDFTRVNFWGJNSk9OOTE3R0dJMmFkSFJUa3dJQnVZbkgrLzVVb1F1?=
 =?utf-8?B?VWUvMlRSY1JKaDQyQ05EY0JIdVBYRTY5bDlmRG9MTk1pdFRuWmliSUJlMGNV?=
 =?utf-8?B?ZWRaRnBXaGxkTy8zaUlRK0Y3ZFpkWUc4S1g2ZWYwc0ZsU0JoSVhyMEdTRDha?=
 =?utf-8?B?RC9ROFNyVTRMSzNkT2ZSc3hxcnhkekFvKys2T3F3YldNL09tUmxaM0s5aisz?=
 =?utf-8?Q?5g8IsBhEI4oJCtmeLI/3lzeUt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea5e043-dee3-44cd-e98c-08db7ca679b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:51:05.3058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcMLlLiDk/x66uc7MArMXuPIsbuLelrrQQhSraNsE1kTRWBwoSL3GNXRrJeyg0YIF1yZqErCx433+Lbzz+CS9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645

On 29.06.2023 16:52, Luca Fancellu wrote:
> 
> 
>> On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>
>> In the file `xen/drivers/passthrough/arm/smmu-v3.c' there are a few occurrences
> 
> here you use a different character to enclose the file path (` vs ‘) may I suggest to
> use only (‘)?
> 
>> of nested '//' character sequences inside C-style comment blocks, which violate
>> Rule 3.1.
>>
>> The patch aims to resolve those by replacing the nested comments with
>> equivalent constructs that do not violate the rule.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> You are missing the “---“ here, meaning that the lines below are part of the
> commit message and I’m sure you don’t want that.
> 
> Also here, may I suggest to use this commit title instead?
> “xen/arm: smmuv3: Fix violations of MISRA C:2012 Rule 3.1”

Just to mention it: Personally I'm averse to such double subject prefixes.
Why would (here) "xen/smmuv3: " not be sufficient (and entirely unambiguous)?

Jan

