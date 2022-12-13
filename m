Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C841464B3F0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460505.718425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53FR-0006Fi-Ff; Tue, 13 Dec 2022 11:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460505.718425; Tue, 13 Dec 2022 11:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53FR-0006Dx-Ck; Tue, 13 Dec 2022 11:14:57 +0000
Received: by outflank-mailman (input) for mailman id 460505;
 Tue, 13 Dec 2022 11:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p53FQ-000678-6C
 for xen-devel@lists.xen.org; Tue, 13 Dec 2022 11:14:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2080.outbound.protection.outlook.com [40.107.6.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6c9cb46-7ad6-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 12:10:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 13 Dec
 2022 11:14:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 11:14:53 +0000
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
X-Inumbo-ID: b6c9cb46-7ad6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6vxxdlhkE27Er1BAB9H4pBRlugYVMQ9fcvWv5SdpEUPPqmPo0iANtFFc6L1DMIvfh1DMjj9/Y0s0GVepwjG/kk+077WiBV2FXphBW7CdrF7zX94xACK8hdLMterIV0PDotQFwaimjMS6lFP68f6W4TDU8IdWHkxCIv4qoc7gkuTc5gzTABSxfANAZzR9fbz9MCOqCb/V0CdxTAgDEsO4jtGGg5oQdFcwggFz6ylbYcW74rFmzlAtp7WGO+rOKI9cH6FOx1guO1KxymvxDb2iyv/ra2aWpxUzutIj3f82XHu4jeo7l/Q3RkmUa0bNcarnEq8FGsbA/HoJeJ17PWbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzlJB/qobAiV2EEHX7ZW3jZAgTsL1ylUJznVow4Zubw=;
 b=j7WNs6HrdiqOd6f7J+vshleDvnpZ0OjicG/g305R1uGVfuHOMboo+zzW24wE4UJE287zm6ZXH6EUVvtZRfzCaNDLaz50PiCiyQkEJqaJyNR8h1GWvwul1MKz6hqx2pkCW/RiVp+BlzTXsYoRkG6C+J4zOT1USpn3elPE8WArRq4qsvyieRLfqgQSiqJ/jOa/c8LP4ZRUv9PYG4ndWuWlKDzg1Tr6WR8fhFvLQ8umiKo9GuEfLBLp8gSao8ClfCYPapTyUNb253dg1hsd5UV8r25g/6Rhxl1QdRX2VmMTXhobpDDnRRRy773AMcZtWxZO+A1C4VNlOREJQtJKPKyfEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzlJB/qobAiV2EEHX7ZW3jZAgTsL1ylUJznVow4Zubw=;
 b=wFPSsYHT95ip6iJvgznMPcGwZSnqEJ36GpDpueIGhrnhAC/wGB4j7rlHJktItQRFoPD8WYjjMn6phALqngRzeokwxnW4W4OzQlsqbyr/dPcOfSxjQt+Qbralr23QgUHWf6VUdaUSPD8mkcrqyO24RfywSSPup0U+TEqBaJGETC5HMGL6dGimnI03BdwecoazT1MlDxTXzmCiTCfyBVVQYhi5AfkK6DPrXmMwf0/+Rdi9c2rzeFmrgMgIe54ocEhKdvYrO/hYI6C4DFlSEMqFKP8SxkU+pFtrp9HUmGESaWr1S+G0Nei3ixlSvugKNPzm3Q3vhVBrl5c5XWgVMnQICg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36e4038a-d394-62c0-3bce-1c81450c6bb9@suse.com>
Date: Tue, 13 Dec 2022 12:14:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V9 1/3] libxl: Add support for generic virtio device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1670925998.git.viresh.kumar@linaro.org>
 <01dfa7692457a7f40255645f5239f74797e6db3a.1670925998.git.viresh.kumar@linaro.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <01dfa7692457a7f40255645f5239f74797e6db3a.1670925998.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac5ac9c-1cd0-43d1-9699-08dadcfb4211
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fho2ItGF3EzxNkb/dL2dnhUY3JhBnuJ0vbvZHZYkxTjXfZkmEf+tZrxpSD3cUcAfdNCqALGfDCV271Unq2hx+131mOxftIklW8d0GV1G1wb8lp2e0Da99IjDZemyPpIMp5Gu0jYvKuXyNL/a9qW85pLB6k9AKzoqjVdAhe/6Hj7qPUSj4mDZpDMmUJfU+4qghXbI4dRI51+fq4aHTVNbiSWSvPmeTlMnnCHM8hfYXfc3AAuBcQYHxCvcSc9wepAzV8kb6nIHGyvQ1ixyqhZZmkW8A6sw/8tbx0v9JawanoGLWQYmbX/dnhIZIf6Rpgxx/ueroTbrEh+JJez1nd9weWJ46CynmGDWZJRwBIRqeWW1bCQw6qF5iT8kXoIY3H83qbga3LsiM3G6OhxLruCrLY39hu3hbxcwTzmyE9fAQb/VYOm6cuZtlncgtLz+4sXjzi+RL4eEhAKSC0FtbIgclz+dez67lHQEPjtspPSfOCcdUppYRrdyO5ff1YyLPBCCmSOM0jePjgjOVgK+3/aWKW3DJoYU0+6hmgNxGASYn1f6uGNay/vAPXrCfduw+EXYIz5BjdxxUeb8eKozIgx8bfGTCCWfJFiW0qaCm6oZqzDIcgMZUwKIBIVY5azvp0WvRXXD3c/znLpYohMt2nWduOYD/oVlryWNWvapn2dWBx7tabNuMXgIu6aAFks3IVY+wc2KEn4wOiARVU0D05kPm+aLWoLisS3phBHgNzeN6EI5G6UrUcKRF1F+x+fhBblx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199015)(31696002)(316002)(86362001)(38100700002)(4326008)(8676002)(66946007)(6916009)(186003)(66556008)(2616005)(7416002)(478600001)(5660300002)(66476007)(41300700001)(8936002)(83380400001)(2906002)(26005)(54906003)(6506007)(6486002)(53546011)(6512007)(31686004)(36756003)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2lEeVBCTmpkV0p6ajJpSWdsVGpzSksxODNoOUZzNjByQVJ3MXR0MEFZUGM1?=
 =?utf-8?B?UWhQYjR1aTB3VFArQU4wbVRHWVBUaHZ3RHVFclNOU0VsaFJZdHA5azgrRFVP?=
 =?utf-8?B?akR1MDNXSlV5UitFbmgzL3RLc2QyRzkvTTBacWpkVDRuUUsyTFEyTmtxdnB6?=
 =?utf-8?B?Qk5jcktnaE51TDl5TytydzdPdzBjSFFoS3VkNjFpQnYrd09yQTNIVm9td3NT?=
 =?utf-8?B?QkVCZUkzemZycHBvOGhDNlFqYUdHOXFXVC8zditWM0E3cjBjZFJUUEtCMzA3?=
 =?utf-8?B?NS92S0x6UjhFaWNpdE5VYU96MFRML2ZweDZob2JLQ0NGaXN6L1BRMXBoejBm?=
 =?utf-8?B?M3llTHRqQTc4KyticmROSkhiK25zbW5lSm9vUUEvZ2FZZVVnRnVkM1hGNDZp?=
 =?utf-8?B?T3hZV1ZzL2E3MUZlQzFBcWJXUFkyN3RpNkVnb2Z1ZEFhWWJacmtPTnl0aU1G?=
 =?utf-8?B?bDRWR2Y3SjhZZmJXbUVZQWtZZUlDekQ3NEgwaHRzbXhzUnlkWklTcU8zNUc1?=
 =?utf-8?B?SlpSQytmRFFMSVFKSnB1NjRzUXliOW41YzRQeW51UkpnS0xCUUNqeWNDUkdm?=
 =?utf-8?B?NEU2NGFOK2hRayt6M3Aya2tjWmR1YzdzbWJlNlR5cHZIS1NjN0dIaGRjb3Qx?=
 =?utf-8?B?NXlEeGp1VDhvZXBtR1d3QlNMTWJBNEtmTzlyT0RVZHBQeWlWeFdIc1Z4MnpU?=
 =?utf-8?B?ZjdqNmZXeGhrWnZPQTYrWS93MktVbTNlWTRZdjNLc0JmOXMxMmJoM1pDSllK?=
 =?utf-8?B?OHE5QVlWTWZOTEZRZ042ek1TL3dDNkQrS2h2YVpXT2pUck9UTUJOZ3BjcEVM?=
 =?utf-8?B?TnMwcC81Q2d4dU9xeTNIeURjMksvQ3dXTTZLTnRRbmRKUVNjTHVuejZid2VQ?=
 =?utf-8?B?ejBhbTNaZlhjMCs1aXhRSkwxREV0Q2UvWXRCTkRDazQrdW5wbk9HUlpPS3cw?=
 =?utf-8?B?WWpCYkZRMWY1Wk5KdlVFdjYzL1l3djNXM3ZpaUw0dEQ2dndSNkFKZHd5K3dV?=
 =?utf-8?B?N0tkODlHR1JicUpoZWJSbDZWUGxoZnJma3lhcWQ0cGxqWGVKU1RDZnhCNHgw?=
 =?utf-8?B?Q0FPVDlyVGprR2RnOXZLZVhxZ3lmdEFSWlZaUXRXdElNdG5EWjZlQ3ZlUU5H?=
 =?utf-8?B?VndLWTJhWGo3VFZNSkxZQXR1USswTE9XSzNrZ2R2ei9pK3cyNkxiVXFaNVV6?=
 =?utf-8?B?UFFvbytubjB3SlpLVUlEN002d1hXay91NGlQRWx4Y3lwTVlJeWVCUVpzb1BO?=
 =?utf-8?B?WnBMSVNoTDB6QTlDNnlMdTd1N0ZVMUVWZ1BUamJLdzhxREp3ODR5OTFWajRv?=
 =?utf-8?B?VHYwaG1lVytYSzVWRjc3bVljQU1sdDVyYkI4cmtRVG80ZVVUTnlzbzdpcXQz?=
 =?utf-8?B?VjhOWE1CbENuT2ZJZnhUbFpnT1FQc2k4czJxbjhKRVA5VGNHM29qZHlvdVFW?=
 =?utf-8?B?NWUxaEc0WEtoeHFNeDZVbnFsSkJ1Y2VDNFRGVW4vV0lIV09abFk5ZTlBWjZ5?=
 =?utf-8?B?U3AyN3A0TkhTc0JyTUpNUUx0OFI5T21vVStwMDFxTTlqcEIvUC96cGtoWXBv?=
 =?utf-8?B?ODQ4RzFxNkNCZ01vaDM3TXhGazdlLzZoVkdmK0g3WlNzRzVyb0J4cDNIRU9N?=
 =?utf-8?B?ZWZqRnA2ZmhDbWRwRytEcHgwNWplRi9hZTZ5dHUxRUR5TlhTdHV2NUVXNXlm?=
 =?utf-8?B?aHZlcjJLSmpHRWFGVzRJbi9vRkkycHU1amh1ckdjMUt2M1MzaWlrKzR3YjRY?=
 =?utf-8?B?MWtoY3o0cHI2S3BuK3N4RC9wSktULytPS1VnUG01SGZxSmpBZ2xrc3NxUjV3?=
 =?utf-8?B?aC85NWd0K2ZJNkRCQVdDOUorK1lSd0U3NHZXZzc4aTJmSUl4SUFWclV3ajBt?=
 =?utf-8?B?NmpjR2hMR1AxK3BsblRvdVVUOE9wTjNrUERTcVJVNCswb0RLd3d6aEIyVlZa?=
 =?utf-8?B?RUNvNDFRcTQ4MWNIQ3VLNWZsaWdCaDd5RjR2S3ZJZWl1ODFtQUpaS0xjMXRP?=
 =?utf-8?B?bGtiL3BoK2phd2dFZXQ3MVRzaFR4MEJpc3FnTEFvYUhBdFlyMTMrMU9kUHFr?=
 =?utf-8?B?MmJlNjZHaUpLNld6QTBhakZSdGdTOUNtKzQrVkw4ZXg5Zit4M29WNCtEZTQv?=
 =?utf-8?Q?XVezNC7oi3MZVYqquiK0ZM95C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac5ac9c-1cd0-43d1-9699-08dadcfb4211
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:14:53.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4F2LkGNw4MgyXNoB8txqz/jYWm5NG9v0G4UfOxkq8ZCoHMGUQy/ivY5pRbH6c2q0kXt6lr46Ul5Zsk3PS+s9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

On 13.12.2022 11:08, Viresh Kumar wrote:
> This patch adds basic support for configuring and assisting generic
> Virtio backends, which could run in any domain.
> 
> An example of domain configuration for mmio based Virtio I2C device is:
> virtio = ["type=virtio,device22,transport=mmio"]
> 
> To make this work on Arm, allocate Virtio MMIO params (IRQ and memory
> region) and pass them to the backend and update guest device-tree to
> create a DT node for the Virtio devices.
> 
> Add special support for I2C and GPIO devices, which require the
> "compatible" DT property to be set, among other device specific
> properties. Support for generic virtio devices is also added, which just
> need a MMIO node but not any special DT properties, for such devices the
> user needs to pass "virtio,device" in the "type" string.
> 
> The parsing of generic virtio device configurations will be done in a
> separate commit.
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Please can you arrange tags in time order, which would mean R-b past any
S-o-b? I'll try to remember to swap them while committing, but in the
future please save committers from needing to do so.

Jan

