Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D9C588A03
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 11:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379709.613402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJB9O-0003La-MQ; Wed, 03 Aug 2022 09:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379709.613402; Wed, 03 Aug 2022 09:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJB9O-0003Hz-Gh; Wed, 03 Aug 2022 09:58:50 +0000
Received: by outflank-mailman (input) for mailman id 379709;
 Wed, 03 Aug 2022 09:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJB9N-0003FP-Ii
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 09:58:49 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140075.outbound.protection.outlook.com [40.107.14.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de491b0d-1312-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 11:58:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8850.eurprd04.prod.outlook.com (2603:10a6:20b:42d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 09:58:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 09:58:45 +0000
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
X-Inumbo-ID: de491b0d-1312-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZodYrIwX31dSPuYSbjnOxXAtlDd2kKvYe4qZMLEg+INME4OUiRTZFh5qPbXESigUQTqZ4IDhJpq29iUd/Sh+LagOIR4KiPzfulxN9yrIk7Tm4vvNCgXxPfycKtm7nE3vLFZ8eTiVYgn5zIiTRkUpGm4udg24/8hau5CetVfdA4aFfP82LaFwmhh7qwcpmrm7FpQlRF7TkUJgoydvNzKYvnhChlRxk+hwQCqA1ioQm6ONfR0VqaYFRW7SHtveBiYKecABg6ZpGJ1/pS7WcB3k/0TZ3KXCHXuxFNs7frwdyTsztto8/QdGse1mOoZ3TUJ6v/8Eylv086dxerLlHovhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMub7+Az4CM7UyvcTN+0K+AfwRI9YK4Pj9YzeUKB2Os=;
 b=nS96Ii/12ddb9c+tEPN4bdBR8cPnNbpT8uehTlKQUSXF1HbwQYK54/4Hc9GHJImVHyLr5EAXoI2vSXFeWixvhiQYpLUshguEoR879XH8ZIpUrn+7y9KjLY49gm39mEfvlwc3ac0NCqiSHuQROERmb+acW8BqEMQO31SopiQmSJeTOQROKsLRH61WlrtvL/aaqNMECIKnlwt6uloWcmZscBlU/AZHrfrXE1iKzb6IOw0bA2vLQ734pmwTii5wmctqcbwI1uTJWXOcW+CVZ5yWWfyFy2AsBfALttf6AGHovUCHbmfb/udsVoPNIFx+cAvMvUTVzDoJSrXDoLT0wQiF1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMub7+Az4CM7UyvcTN+0K+AfwRI9YK4Pj9YzeUKB2Os=;
 b=1wgJOCQvhd1EnCAX+oLbOv0VlddoTVhJk/vgcCOpVC08JsyG1Ptcd3eVAo3stdvVyGeZaLFOxsztXuk0cfbcNMVNKfJC97gFL45nlVewIqnavQhz02BvTs2teMIddauXQVZ1MoelQKiYvm/dUxmm6a3fMYaqpjT4HNZJDPICRGX9RBfsw2qsRlPPqY+coNd2ivCRw8/muW48PaqmGCkvU+9OWQ4Ak7Yxfbvufh2utQiUxJSQ25W8ABm45BamqOb2PdbRsnei44hsCeVFYAZEzwJdzUi1PE7KHWYJ0pOkw76HqfFAqQQB3n1Tm5pxbMkweA39GntsTz+0GSzanDe2mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b37c1dcc-eb80-c5ac-30e8-626084e689b0@suse.com>
Date: Wed, 3 Aug 2022 11:58:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: preparations for 4.16.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <5622e17f-c424-87a4-d7c4-bbe1dee4743c@suse.com>
 <e52776d1-ed65-cf0d-bbc8-1431c183d73c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e52776d1-ed65-cf0d-bbc8-1431c183d73c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e73db0f8-8067-4cea-0008-08da7536c0c1
X-MS-TrafficTypeDiagnostic: AS8PR04MB8850:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lvu2aNnDNNvjAdE1EcQmQzhBdMIVlIrZUaIey6YQsCoJ3XCICMpxLSQWyeAhNbhoLfvVeIiHQgztaqo8uWjejHLg2+06DWAcf3wlnNBRQCoNHOdZJdKXMRSoq27QaZRMvtsQc0k7t21LDTyUG/e6Du/6MK5FoMl0A5LyVQy6E2IiKujKtDb9dqn7Tt3aQMCEjHgHi1JLRw4QqGRt3kJztTA38W+WW6ZNm7rqFcwKz1PS6XfZ5uwjHenrUNYi+r2jCEC4vNB/T4nreKSsG3ED0YZveF/xaIpRTNqiIe4ELmZ6hecwxS+CaEWPGf+J8IubtGx2kpwxWYaClWBoAvywn3SfU1AhMFqHrbwwyrf58HZb+D3KasDttrQntxz0/SeQ+b8X5JOOl0tR/w0XU6jivwhVFQlpoIFFPe+NqRS9/3O/GVw3IyBlu3G9q5F8dw7zf5/fYio3vxR9/irFXNyqIWkUCzu+KmkLsR4ZuAv4194IDs4w3n0OBzVxJ4vDONxJlrcmWXjVLDFskqpKj+ME3xUj0sKUL1Ejs1VaBuQ7fzbxYaY0J823Q1H5zR1XoWB4jTKohYANMA4ydxhwdP8UCLnnf4D1Rz2cjbdKdj4flf+vuVObBP3LFUL3WaN9RNWnEUh/LJrysop0Ol2aWoF0E5JuJGhfFRqis/yW4Q02zCkwj/LbHGKrLh5iqE16FRPrKXppQMxaZOeobiWO+Z1nBABMhVjftuSdPTcXt9G9c4xoTtqf3UxvzMKSOJzrmagxPtVEZOyieIMldWtPo4iWsp68RZvlEBGd1Z7WxTA4I8tTNkcb9gbxKsOh9g96yrUUVEuxHyXK35/FVcmsJBRu1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(136003)(346002)(366004)(39860400002)(6506007)(53546011)(41300700001)(186003)(26005)(8936002)(2616005)(5660300002)(6512007)(31686004)(36756003)(6486002)(4326008)(478600001)(86362001)(31696002)(6916009)(316002)(2906002)(54906003)(66476007)(8676002)(38100700002)(7116003)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anE5OS9EdVJyeFFBaDhCVVpyeG54ZWwydUZpdU9MNmlMOHdaMUZDbnV6aG1S?=
 =?utf-8?B?OUZ3Qi81eHNpOUJZbnRUdlRsVGd5a2hYbnkySkJvUG9pNVdBdUpudmJIVVR6?=
 =?utf-8?B?Z1ZjLzYzZE16TUR1bkdsK3lvSGpudjJab3NhOG9MY0ZVdmZzU1laQTFETFRh?=
 =?utf-8?B?aDRRckRmV3FsQ1hoS1VyK3Y4SzhPeUVpZ3pSbjF3M2xmbGJCcGdzMXlFV0lJ?=
 =?utf-8?B?UXRrYVJQSmplbjhPT1ROSDJhaWJqdWZTdUxITXZQVlUxRkNjVFY5K0xPYjRI?=
 =?utf-8?B?dmh6VWh3RC9MMHhiODIyUXJpdXQ2WFZjRTVBOENab0pDTkE0QzhUNmlpWUZl?=
 =?utf-8?B?NlQrZm91YUc0RHhib2d3eldVdkF0aXRZd2ZTOC9qYVlwZHNWMEFKQmVOSUpV?=
 =?utf-8?B?M1d5bk1zTkFhR0d4RS82RmV3Njk2b2FYRWwwUUoxbWl0Zk5KRG9IMXlwWlIv?=
 =?utf-8?B?L2pnTHlPWDhDd3hxcm5rUzR1SjUvWWNuK0tsQ1k0ZzZZaTFEMWZUM0hGYld1?=
 =?utf-8?B?T2M1YUwwUUFja0RQaW9HeUtTSUwwU1UvNHJJc2tqRlJ0eWZQenFPRG04VUhT?=
 =?utf-8?B?S3VGV003VWFpbmRvWmgweUxpeXBYL3VJS2NhaUpHMW5pa2R4QUF3SDluejVK?=
 =?utf-8?B?VTNER01WVGZDOVJuRFJlUjNYOWRYUFpMRTFUcUpTa3hjTTY4TXpTZi9sLzBq?=
 =?utf-8?B?NHRUU0tJS2djVG5mUy95Y2I3MFRtOTZ5YmJMMnJSRCtBbFdsc0lxRjZ3dVJq?=
 =?utf-8?B?b3pQTEJndlpQQm8wOFpCWFBtbGtlSG54VGZITFNOQ2FjZkZIYm43SVpSOWdI?=
 =?utf-8?B?UHppQXZzR2FXN3pFU01UQ0pnT0NjazhsZkNFTDVkTUpFME5WS1BNcHBUNUg2?=
 =?utf-8?B?OEhydlpvYmt3UmJuQ2pCWHZqbE1Fc2Z0UjZPWVJjNFFVYkt0aXA2Q1dsYWFv?=
 =?utf-8?B?Yi9Xc2x5WnN6dU1TZ1dBL2VBazQ2ejhidDRJRFhLK3ZkMzRIRGpOdmtZUER1?=
 =?utf-8?B?QWpSQmw5MTR1d3JOaXowbVp1T1ZOaHpIL28reUlCRzB3cmQ1cEl3S211RkZo?=
 =?utf-8?B?TWQxYzNxb1hUdVVvN056ZE9JNFJoWVhHT3kyeVlRNHBNOGFoYTNvK3Q0THhN?=
 =?utf-8?B?VkNzUTg2OHg5MDR1cnRSenlFbHJBd1pBSy92ZFRWOFBqRmtOcVZyYytYNkJY?=
 =?utf-8?B?UmsvemFlc3NPRDB6NXFHT0JVTGx2S3UwRDFGSm9mejllN2xYWkRJcVNpdG1F?=
 =?utf-8?B?eEhnNEFPb0NNejBXTHRMUTZEMDViZ0liL3pidXZWYXc0aFhrY2VmdFpCQU1o?=
 =?utf-8?B?SWxobGdta212bU1lZVdUR2o2T0s5NTdFVWpwVDJROFpsb3lhMDRwREFzaWtB?=
 =?utf-8?B?Q1BJem50WGZwbGtDYzBWdGg3T1VZR0NBY2F3UWhZRkJIL1RDUVdISysycVpC?=
 =?utf-8?B?RkoxVG8zcEd2eWF3WFpHamV1OVl4ZnVuR0R0NTRCRG14KzQyUU0wZUpHbVdZ?=
 =?utf-8?B?TTNhK0NCNUw4WHNXUGpWTElLQWtCekdxdjYyWEwvK29pWjNZUllvOGtVbE1P?=
 =?utf-8?B?bkU0YUxLeTJXc1lvdnNiaytQSktFVFhZUk9DWnVSaUJPV3RNeFp4ZFVBQkVU?=
 =?utf-8?B?b09pY3dWY0twZkVyOVVHM3BWTG1ReFpOeXk3aEc3Z0NDTUs5OHBlVjdhMHUr?=
 =?utf-8?B?SytDL0V2UHFZZEkxMEQ0bWxqcDl3b1FMK3hLZEVjNDhSRzZPZldFVFVNaS80?=
 =?utf-8?B?clQxbmRXVlRHa0lnNGp3NmhYd1VHMGZ3UG9pdythNktKeUI4eUE0QmM1R1Iw?=
 =?utf-8?B?eHY3SG04VTBuM3RnNzRiTkEwNXZERTdPUit3MUdSYkpiQW0yd3Y2RVZyWUpr?=
 =?utf-8?B?MllDcVY1cWd0azlFUUNLZnZqUGFrVnJ0c1ZaRDZjSEdyWUdMUis4M0g3Si9Z?=
 =?utf-8?B?UjRHMzV0aCtvOEptcEQrZ3R1a1NNeXpucjdobi9RMnIrN25BQjJzZ3pRWkFV?=
 =?utf-8?B?dnZEYnJ4RXpETFBhRGFiVW5Cem1lSVNNUkJpQVJrbVBETXNmaXRjQ0hZWGxs?=
 =?utf-8?B?UmNVUlk5eGxFbHkrWC9Qa2lRaGNpOHRCNVBleXB2bVM1VXJ0d3Z1bHBIQmll?=
 =?utf-8?Q?BXdZt8Fg9oZAL/8mPvyoQLGK4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73db0f8-8067-4cea-0008-08da7536c0c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 09:58:45.1247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS9PzuQJ8czHmUv/qWV0wyn4hj6OspqLTgBbWD9uPVREkyL6U6Yk8JmBJVRjwAsTFWI5CMrBYf5J4G00vBT2PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8850

On 03.08.2022 11:29, Julien Grall wrote:
> On 27/07/2022 08:26, Jan Beulich wrote:
>> All,
> 
> Hi Jan,
> 
>> the release is due in about two weeks time.
>>
>> Please point out backports you find missing from the respective staging
>> branch, but which you consider relevant. I'm surprised in particular
>> that no Arm backports have appeared on the branch at all since 4.16.1
>> had gone out.
> 
> Stefano is meant to look after the backports so I have held off doing 
> them (although I don't really want to take that responsability :)). 
> Below a potential list:
> 
> - af570d1c90f1 "xen/arm: Advertise workaround 1 if we apply 3"
> - 95604873ccf5 "arm/its: enable LPIs before mapping the collection table"
> - 407b13a71e32 "xen/arm: p2m don't fall over on FEAT_LPA enabled hw"
> - aa1cba100bff "xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK"
> - ee11f092b515 "xen: arm: Don't use stop_cpu() in halt_this_cpu()"
> - 6655eb81092a "xen/arm: avoid overflow when setting vtimer in context 
> switch"
> - 25424d1a6b7b "xen/arm: head: Add missing isb after writing to 
> SCTLR_EL2/HSCTLR"
> - 800f21499e0e "arm/vgic-v3: fix virq offset in the rank when storing 
> irouter"

Since Julien's mail was directed at me (only), FTAOD: You're going to
take care of these, no action needed on my part?

Thanks, Jan

