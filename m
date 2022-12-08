Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DBC646A64
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 09:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456876.714724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CC9-0002HJ-5h; Thu, 08 Dec 2022 08:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456876.714724; Thu, 08 Dec 2022 08:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CC9-0002FU-2O; Thu, 08 Dec 2022 08:23:53 +0000
Received: by outflank-mailman (input) for mailman id 456876;
 Thu, 08 Dec 2022 08:23:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3CC8-0002FM-8f
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 08:23:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3c2b788-76d1-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 09:23:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 08:23:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 08:23:49 +0000
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
X-Inumbo-ID: a3c2b788-76d1-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eO/swmAYDm5V1ctFWfNq+xJQAHD95WpgOa+8DdxnDH4D9Eo3+D3RSB8yTQWTgVzZvWOa4XUePxUv9uRruHpvUBWZPf2+EThLmul+K/Iomxz2utdCUguC2WGdHUUDUw/3XrctUlYmCk9cwkCH5Tfddc756XALQo1KXpBwCUIrDPcufeb0bxBPXdTHmvaIYEqC0pnyE2ej6IXh2z7a3RiLnT6Zlfk0AcUegvLUvTHz0b8gZNfjLHVGvaWJICCNZTaVp+lee6zXW60klduoK6kKrxje8wZpcXuv5rRG16HB5wQ/R4fIGhmQ3K+gv7VZkuJDdozQoWH4UBUI1GBXcPdAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8gLiyJrUaRMz5MHy25cnewH+vNoNhRy3vCY6x5De0Q=;
 b=CfYVJzYlp8cJBSHmhhah081aLjyzkO6SRH7A/WcuJyt2ivxQ/Msn3bDPjUpaf3XCPrJcydK75Lxozj3RjDURwgt1hqyZgWhDXppJj1zI7TErHLDwi8BXl0b6R7p3xiaYfgTBb3oKppVldcWFHVsnSkm6+SVK6x+QVOVj4XLlT3+Owc269z7o2xZG8GpMdZCvaaZ3bbfYDV/v6bPwVw+8AxhZ63X46egk04CosvKxelS9SPqz/sZkgtluzwUiQGolw5FPV4zmX3vv0HaD9sEcvTM/yaG+pb6Rr4EUfaXRiZeZ6hqWi0+C/U2VLuweo+K8zpybW/vV9Tm2EdHAo3VAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8gLiyJrUaRMz5MHy25cnewH+vNoNhRy3vCY6x5De0Q=;
 b=wXXVNh5+wlUbnzfpRxMiJ73DhuD6yaCXJ7Ys4qH5VhXAWY+VyPqpLTNvGZLvIEkQ/vdSRUCNLBEVL3nj+NnFlOtOObfy38eUiWHGeQsScryrXsDzqGkkCDji4qmnV37uyWngQS8pDsl5Mv7HqrtI66Z+mJRt5WZCOV3doGvfYNnSoBjFZeMJ8VLK7+/Djcgq6TalMpCfExy1zI4V17AoWI0IREz0XQRtjmryfxJGNcKGttoVzsLAUffUqpVTf5AGp0/VwMOOpTW7bgipqazN8rvMAVMiIjHV3Bsd7qv319qnK/ANmdjdqJatUVrQHNhpXw+A4E3QTV+XFUcLrqEo1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f4aff5fd-1c08-fd7a-c347-58a700bdba7a@suse.com>
Date: Thu, 8 Dec 2022 09:23:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 3/5] xen/Makefile: remove Cppcheck invocation from the
 Makefile
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221207130704.20573-1-luca.fancellu@arm.com>
 <20221207130704.20573-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221207130704.20573-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bb4db3-4957-4136-3942-08dad8f58812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yhp1JJO5FNZ9d8QrKdWVeXoDIweMI+2xSvMNFZJGP35EeLMtwCLc/IC8P1MrpPlLfEVRwy8p1BWMd8Icjvsid1+GqA8wReh+1i2Vs1AkCBkRgBfr/zC4m7eDYQGG6r1BxB2G7Nk+sIjy7TBydr+jmvYXPCJaxkVcgKVaEv/p/OXRS9dWJbiSRCPNRLJMvi4lzxtKbeA316uy1JYVh/gTok8+fjITI/hUTv1pjfHeOg8oL8GORDwOqUMbH/QaL8SU7Sncwhosv0oN+lxBN3UnB0wlZ2REUHZcoh2+cecG0XEF/G5b62aBcqvELqDMy1B0WUX4RLW7VXDmPOtOZg+OKWgv+j9zL3/8m53HwJhSb8UHkaOZUTjb/vVXCSLV2CrP+FMO6NDXu6X0fXYujr7TH/hwt03iBiySuVxGEfuzZrXi4xF8DkKptRwOZdqL9SKwz/fdDZs01jINm+VQgMzCkudPVg1vhewgpwPZuaZsAdsUQyvDWwdDOou9b4z1cUrtLUO5EUYPGX2ZLekJdAZxWHsh6pkAbyCp2Z5DOwiQA8fognn4QbnM5W45SQNh9luOR1OmJL085MoJMwLp0JVwZwRqSgIrRes3DDGOZFwhIE2C3jDPN5YWpc5YV06E2Tu+yz45rjMZafesna7d2GShpaQ/avU42ExG9zceJpjwGYw1Hi1uRxeLmuAcbDiMTW2Jyh7WMrkFSA3CSZiu114yVJ/kFMxg/XJto+EtRbVXEPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199015)(41300700001)(66556008)(66946007)(2906002)(31686004)(8936002)(316002)(5660300002)(66476007)(36756003)(6506007)(6666004)(6916009)(54906003)(186003)(26005)(6512007)(478600001)(53546011)(6486002)(2616005)(4326008)(8676002)(31696002)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3BjQ1JSMUhXMXdwTGNNV3NSSzlNR2pQSi91SkZQMmdBcXlmT3hGRUVFZFk0?=
 =?utf-8?B?cXQ3QXB0eldpT1BYK1c2OGNoRWFmOGF6ZnlwaVgxak8zVVdObnIwUk0vc3Jk?=
 =?utf-8?B?ZDVuVXhpWEZTWXU5WHFQQ09XQU1CVXF4aDYzSFdFSnRtOGRydWY1Z1h5bndR?=
 =?utf-8?B?RWgrekZPSWJKUnJuY1hVWlVFTXNBeXJVZmpqd25wWDVRMTlRWnppT2MzNlJL?=
 =?utf-8?B?Nit3RWxUSnhTbGtkcDRQSWZYQXZndVBmLzFDWGVZZVZCOU5aRVJPYTZha1cz?=
 =?utf-8?B?U05VSThtaW9RbWY3T0N2cXRDdUtvYmFoSnpPTWlGa1EwWnVRTzRXZzdCWkc1?=
 =?utf-8?B?UU5DbUM2QmdNa2RCQmhkWnhMaDhXenlwZ096SFRQQ2dET0Y4SzZIaUhJTDdJ?=
 =?utf-8?B?NFdJL2tmTkZJbVIzbHdCcSsrVDl3WlA5YmZMeUxQckZuRjBlUjc5QjNYL1hi?=
 =?utf-8?B?ZlJraHZDM05ESmdtMWFLcFFMajBlTklacWhlV0grYjZJQ2dIYXk5T1Z2MUVI?=
 =?utf-8?B?b09FbWswK3V4cisrNCtRNzk4dkNWRzVtQktydHFYRVZKSnk3dFFJN1FhTkZ4?=
 =?utf-8?B?empoM3pNL0pFN1hCMlo5MFFnNS84ekVlNEhRdkM3K1AxQmI4bzY2blNLRHB0?=
 =?utf-8?B?OWZ4TUpMbThSeGVNenprQXhVcjZFSjByKytDR211OGNTZWR2M003djdDeU5m?=
 =?utf-8?B?N0dmRGxXbnljeS9FZHYyUUpiOFIyQWZsekt5bWYxNEpaOUFBOHVvZTMzQmE0?=
 =?utf-8?B?NGlTS2FnTlAweWN6WXpIRXhNVmNUQTNFRytCa3B6VnpLYUpGQUVvMEFSdEtw?=
 =?utf-8?B?VUt6MnBISHBFNkE1RHpiaEdLV2tkM09TTUxDM2g5cm1KSnNTNTZzTXJDY1pt?=
 =?utf-8?B?UEhJOUFuV1JndGFpZkdMRUlVbWNoY28vRmQ0UjVlRlZqZDVYY1IwdThCMnUr?=
 =?utf-8?B?MlUxc04zRTVadzI1M21ncDI5aSt2WGRaS2hhZnp5S1BPVTdLNmtCVWVoSVhV?=
 =?utf-8?B?Rjg1V1RyWFpTQ291alAvUEZBQjUzNXR5WGd4Rnhja2R4U3g3cnBFMUxFeGpM?=
 =?utf-8?B?bjNWODVZc1ZIUHJUL0JkYXN0bThqMWg4UC9mekRqY05YaGFCTkVIMkR3RGg4?=
 =?utf-8?B?T1AxbmZKL2ZKV3dnYzR0REVOcUFRdlExK1ZaNTVTMC9wL1Q4TTJySWpYTWdK?=
 =?utf-8?B?a2xLK3hZc0ErbWV1WVhWbmpQTFJwaWp5VzlRS0lBUVJERHgzMDZnc0dWWjVh?=
 =?utf-8?B?NytFalVpU0NPZHZ4bVJBa0lLblBGUDNJV2lNOFNjTXZqTm55WitWZFI5Tnds?=
 =?utf-8?B?bWhvR3paUGJtK3FrRko2dWQxdTI0NVpJMnFyK0NLNkIraDlNN3oxa0pyd3hP?=
 =?utf-8?B?QlRuZ243WTVOemkzWmpXUlJhLzVXQ2ZZRnR4R01xd3JHY2gyVXl2eDluOUcw?=
 =?utf-8?B?Uk5aUmVlQ1JJYTBBZmkvZVRNZW5NK3ZNTkE1UFpFZ3NDSlcrMk5rR1ZQYWZ6?=
 =?utf-8?B?TXFNcnNGMUhCdHdCV2hOdlI3RzYyM1ZXZlZ5ZDl0ZkJseVpRNnVxMmJ2UDA0?=
 =?utf-8?B?VUxIcGtEQWQxMU0vam1nSWl5NTZFWjdNeHRQcW56Q3k2ckRBQllsSVVvckpz?=
 =?utf-8?B?YXNGbVA1SzJob3pxS0dZR2dWNTRLbVNCQ1FPRlFWMk5OakZuMlhWbU9mUzJn?=
 =?utf-8?B?bk1Ua0E2RDA1cmluTnFmVTV6RGFTSjVjRGgyTGEvL2UwK2kydjBuS3dDT1hR?=
 =?utf-8?B?WlMyVHRLWXRyMVVId0JRdDZ1V0FVVzBXVWxPVmRoMzFNZVRKZmR6enpROVRN?=
 =?utf-8?B?VFkrcWRUbHZ0WEVDZjg2SXhlSWdaODFjaWpuVVBLcnRMNWxlelc2RGFmQ1lj?=
 =?utf-8?B?MEJHejI4cE1RT2VMOEJsRm9ad2xIL2lOTkVsTU9KeHVwN2dqV2M0ZjJoNGI2?=
 =?utf-8?B?NUlnbE4zZEt1dlVoVzVUUjQ5UTJTMWtNeTN3NUpJWGtEc0ZocE0wSmo2bThZ?=
 =?utf-8?B?Ymg1RXo0K2sxcUN6ZksvMjRHQVFSM0VrMWxPSVAvWnhXYkcvTXlhMVhiQ1Iv?=
 =?utf-8?B?MjRHY2MrVmJtR2YwNEYrRXpueFNBbThzRTI5VlFySjVtdkk2bHJpTmZTNjk1?=
 =?utf-8?Q?aXxxPXPiMeI/EN93JNILiZ0Sm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bb4db3-4957-4136-3942-08dad8f58812
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 08:23:49.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFN+fDDhcN58XW4PJR6fkEL7/HN36qh33v7W4g41xaB8G0/k8zfWBUyr1MO60fvO3WEdL/C7gNxaRf5nscEW8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364

On 07.12.2022 14:07, Luca Fancellu wrote:
> The script xen-analysis.py is going to be used for the analysis with
> cppcheck, so remove the rules from the Makefile.
> 
> The python script xen/tools/merge_cppcheck_reports.py was used by the
> makefile rules, but its functionality is integrated in the
> xen-analysis.py script now, so it can be removed.
> 
> Remove some entry from the .gitignore related to Cppcheck invocation
> from Makefile.
> 
> This is a partial revert of commit 43aa3f6e72d34 where the entry
> xen/xen-cppcheck.xml from .gitignore is reverted because its path has
> changed, *.c.cppcheck entry is not needed anymore either,
> merge_cppcheck_reports.py script is reverted for the reason above,
> all makefile changes are reverted.
> Every other change to processor.h, config.h, kconfig.h is kept because
> they are used with the new process.
> 
> This is a partial revert of commit 57caa53753212 where Makefile changes
> are reverted, convert_misra_doc.py script is kept as it is used with the
> new process.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



