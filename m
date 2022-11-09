Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322F062247F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 08:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440665.694770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfIo-0002Wn-E0; Wed, 09 Nov 2022 07:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440665.694770; Wed, 09 Nov 2022 07:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfIo-0002UR-Ag; Wed, 09 Nov 2022 07:15:14 +0000
Received: by outflank-mailman (input) for mailman id 440665;
 Wed, 09 Nov 2022 07:15:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osfIn-0002UL-R3
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 07:15:13 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2066.outbound.protection.outlook.com [40.107.249.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 405ce739-5ffe-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 08:15:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7282.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 9 Nov
 2022 07:15:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 07:15:11 +0000
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
X-Inumbo-ID: 405ce739-5ffe-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJcI0zPs/70UDdAGhOWrPd4NM2GBLrJsn9SWsrJWLUuUxa7sYG0/bXC9Pmls5IxboasUWVgKTer/rb9bOT/jBkMZ3RzbX7LFBFOZxS9FioTCJ070F0FP3w+9OrCm25hyP8RY3fU8WPMK08e2TCr5onhG88ZywOJcPIJVEgfz5aXnjrtiXuhuwMxnEPX9c7KoSPa3kSuT3Q8nHFqmKY3ZGVa3QsblvgELo3iL8j3sKwlRUAW3lyoEshJWvD79L5WqEIRLsithMyjUBNGYMJQ1shOcOZIrPzo2lJk9VP2ujMpM9PhwLOKSQUw/WqxBWlpYrwJ18Hh2hnl/HM96vzW7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaiVJYAu2WMdel7mQhZ8O1dh7wuW2l3yW323stwewvU=;
 b=ZLiqP3797SJh9H0g5lXcmGpYUKeun1zjRCnUJsCC+bjNUZ7CRLbnJalinPK30ELXqQK2T/Zw7Ut+gL3r1ynN4Uk6eDKU2TjeZzaMzMCqFspoxbBFj+a8mgTWOFtl1yXoaOg8zks1DDQpXuQxCV9sC7v/eTeWlXlIuoWQe3gYqQbhmt5Y/80g5J39vTAsIlxC0jltlFjcLj1Xj57xUEtleFXhbMxfWsHTj2clBWkxx4cPWZXTJbd4DSYBsb5KRvY3aj5NPUQmJx2PFGpDy7cbkQ6BQZHL9yUZGcpI3JVH3je1KyVk5TKjJMZdMm73GU3rZxLh7jzMS4KSyISnbCINig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaiVJYAu2WMdel7mQhZ8O1dh7wuW2l3yW323stwewvU=;
 b=GJ8l9mLcn4/ATeNwxIu8NBYdcbzwvah9C7R+dcZYtGdHiJDWMzvFIRz7Ixd1VfLGwBM5eN3/n9ElMw5JRh7Kd64gtkLsbXSt+K8xnxMvtVHSyUh4L52C4COKivr2gVM8WxTK0rmfpBbijVy/ue/TPQ94Vzjazm9Wi0xuH/NacV6SnZlLdpTd0+bIXj+CKxqwYph5bJ8cKpQniQM2SqGTkr6Wt+bhxuYmecwL22B0mUghbUjEUQyBCg9REeaamtO1qY6NNdhPT5XuX6afP8L5vCdM4hBFTeu+REOYCsNezYYZ2D3/T12OPWXdckYPBecnGQVq/OQWb6NSnp9AaxG10g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b1a60f3-ea32-b24e-ed20-9f342a82799b@suse.com>
Date: Wed, 9 Nov 2022 08:15:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [xen-unstable test] 174670: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-174670-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-174670-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0051.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 171490d8-a5aa-48a9-9402-08dac22223ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fgp3qnyXjem82T5REzAyt6xmLMj+I88GXRxqsQ4lhgpBPBaLVO0KqzrIMChlaoYM0STuTxb/GkSkbtH+5X/SDYdn7ULIaOzzsYpNK4Kq+fphBsThWsHDjiwz8VrIK1CJMXV7wLhQFl2/MqjNagd5ldbKK8U7jOsPMD+DyVEcVTrJYjcRW+gPfBgMyu1A6LSLjlr7pjNp9uQCXUyq11zrn4+Moyc/wJ5DLvFidTjLpujjpD2Upp757iEwvTgSNKSpKrmSe1hag96OBEmG9iYrpHRzP+tl4c5oaAlMK73wLx1bAd9ct7J8Hj3Ahs2WhHZ+YtezW8CMJw96BcrqRazlwe7Fhg/gpbmNkj9rwd8W79uSt4En6sk9CIQI/vX+ReRAF6q2e1g2/b+tUpOZ6pWr/s9i62jG7i7aXu/zADhd8jH8rM9/HiLKPrjb1NAJyvQGkTvRXoMGUbKU5zGDGph8GE6UHnXLgzAabL5BqXgEPqiTrpFhse0gTHViwAjB74K3PRhv+qa0DYTKLuPKFLZOFp1rhgyZ2NhvrJiPLyxXh7df4KX4CglMz6+nW9/iSLrvy0N5wwW7J/jev4qGB5tFqTLtqAyNxtW52+Vnwfd0C728fnf+nkX2sf+lRBLH90Ejd3ToAYZnVqXCA9ZDTqa5i/LjNyl0gECYYiYMLO2yaQ1oFKCn9im+v3mfSBVjvrpPLQZUiHe7JiIlZa6N1Yv85JRxmRxWY903N/+ZqpkisFKODlEnGnB6W0In052EQOAzg0ckrO9sB1mdiJOERvr5SyILEm/oTjmZ99wswGPB6LUkAJO1SCB59+ZN62XzdeWIpobjIVw8HLyzRWwKzTQDmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199015)(6506007)(26005)(83380400001)(6512007)(53546011)(186003)(38100700002)(2616005)(5660300002)(4744005)(2906002)(6916009)(478600001)(4326008)(6486002)(8936002)(41300700001)(8676002)(66476007)(66556008)(316002)(66946007)(31686004)(966005)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUhqeWhGVnZNczNTSE5uQWt6YmtKOUp6eVJDOEMzVHMyMmtMVjEweEFabTlV?=
 =?utf-8?B?OXpUbFJCRzdOV3d6VjAyY0tZMHNya0Jha0JESC9lQ2MrN3l3Wkw1Zk9yOWF3?=
 =?utf-8?B?VWs5ZkNnUnh1bkxNaEdTMFI2N3hWRXAxVEhabkREaE9WLzUxbDZCMCttbWgw?=
 =?utf-8?B?aE9nbXdXQW1jNmxFbDV3NnVKTXRWMmVjMjZnWk1LdTlVZkw1TmhyT25HeFJq?=
 =?utf-8?B?enAwUEpFUU5VVGVkeDRWaHY4aXBabmhMQkg0dGdWVWs1ZUZoL0NoOWJSdVVi?=
 =?utf-8?B?L0Y3NFJRcTltUWwyMEJBbndhNThXRkNwWkFGK3dvNGliNEJoVjEvU0todGtC?=
 =?utf-8?B?UlBjanFQRDUxVFdCRXBJYzdSVTQ3SE1PdVlkUHdZRjNuNGd4YmVxZHVaaXE4?=
 =?utf-8?B?dkFSZGY2eStCc0FqYjhFSjBpWWJ3YUZVVHZJY1hUSDVIWHRTTDFPRzZhSnh2?=
 =?utf-8?B?ckhKS09xUzVjNnZnc3ZzSk9kOHF6aW1iNDhXQ3MxLzVaTWpyVXloYzdsOVN0?=
 =?utf-8?B?Q0IwaDlRQUduWnRyYU1YSDEyWW8vL2JNNm8zWDVOSEN3SXBna3B6MjFIVjZO?=
 =?utf-8?B?VGp4bDZmSDB3MDJ4c01JMFdaUHhDcGc4S21lTXlSczIrSjM1d2JiOVJGQm1s?=
 =?utf-8?B?bm5Wd3pLTCtaVUE4UDc1blNTNzBrYVhYcXFLa2pOL1pkR3REZHZVKzhDQ1FQ?=
 =?utf-8?B?ZEUybkhBZHN1QU9MV1dMK2dJK1dWNnhBa1cwNTVBUWwySWZ6Z3VQT0dNTFJj?=
 =?utf-8?B?Qkx1a2M3bVRLaDhWbHFIN0ZialdPTFE4cjc0dHlMOG1tTm9kcG9VSmxPdHRp?=
 =?utf-8?B?Sm1ialZBUE9hKzJYSzZ6dVRKN0JzMnZUYkE3R1I2K2NzZ05tb0dGbDljdHNW?=
 =?utf-8?B?S2VzOWZOSlMrYkw0R3I4ME5LMVVoTCtaYmFwWkZJY2NwanZxWDJQKzdLL1BQ?=
 =?utf-8?B?aVY4b0l0SVZXVTJ0anJ4TS9aYVM3RWNtaUdWNE42V2tyT0ZwZmtNTCs3eDJr?=
 =?utf-8?B?S3FZTGdpbEZaVVlxaUtUZ2pPU3gyLzduNm1jMWpzUlVQMmJjMkMyYWtzQmsw?=
 =?utf-8?B?TnNXWHBhMnNFY0NPL2tyeE1Ob0U3cXdRSGRvVUdZSnBHL2N0R1kxVm1FKzJU?=
 =?utf-8?B?MFBPUjBKb3A4aGhtdngvTWhhdXhjTlMrQ2ZSaFgycUp5WGlyQ1FvaW1MM2ZR?=
 =?utf-8?B?UHUvdWZYOURhY2dqZElIbDk0OTEzVHRkMkVmYVNITFBMOThMTHM0bzJiOEZ4?=
 =?utf-8?B?b0xtZEdLNURqT09Td1d1cFl5bGRkcjZhOHU2YzV3SXF5UzNjdEp2Q0NYRE1M?=
 =?utf-8?B?YmNUSzBmaWRxQy8ra3R5ZGRLNitJclZaaHBkNG9EODFMOWxLS28yeTQxZ1JQ?=
 =?utf-8?B?cWdCSGJIL1dxZnhHa2FWcXBjQUVadUhjYTJkUG00UnNabkRCREVkOU1iQ1R0?=
 =?utf-8?B?Q0Y1bzJnVzNzbFZQMkl0Tmk1VkFNY3NMa3BVcVJtRmwxL1lFcEZVSXByM2xw?=
 =?utf-8?B?UG83Z3VTdElTTU00NHdlbTNmd1dySUQvRkJ0NVpoZjBrajZkeVlRZWorYlND?=
 =?utf-8?B?RmVsQXYyd0lOTEpnYnlmWGs4ZWVFZm55Q3E2QTFDVFJiaS9nWUxKRHEySUlm?=
 =?utf-8?B?K2dIOUpjbkVicUVrQkUzVllIODBrN2RVQUdiYkk2Mkd6dEthWXV5bGlPWXNY?=
 =?utf-8?B?bWtQZU1YK3FrQm8yNTNpZ1F1UTdackZUeFhnMmhYcWJsaFdpN01zeDlGS2ll?=
 =?utf-8?B?NFcycGIzSkk2d3VJcVR0MzlWWTJjV2QwQ2FYQkt5Mk1JRXRkdDNCSHR0N1B1?=
 =?utf-8?B?VVFSc0dLVStkT2JiYnpQbVM5Z2ZkbkQxNUtrODFFSGhvQUg1U0NPeEVQTG9o?=
 =?utf-8?B?UEVWTGJ1Wmx5QWlKaDlBOGQrSEYzemw2Q0dmMVdNUHd4cEJlcGRwUS9DekVD?=
 =?utf-8?B?OW5ac2VlbGNrR0s3UlNOOWJuVEd3cUwrUWVYem1ucG85WUpHS3dzdjFuQ2xJ?=
 =?utf-8?B?anZRZXliTmdxcGZnNHBTemQ0LzNrcmF6YmV1Rm1EbjJMWjRtQ3ZaUW1hbGpj?=
 =?utf-8?B?MEsyS3lIMno4cTdzSDFpYWtDblJJNjFycWRoYS9nL0w2aGU1SnZkNDVNbVZn?=
 =?utf-8?Q?zOKNX/lcgxXtyw5mPRw9/BiJ0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 171490d8-a5aa-48a9-9402-08dac22223ba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 07:15:11.2328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enDZMh+cenHJ3KVtmKyimbk146sHwunuS8gZNqZEC8DstrQUKe7dUh/pLr9goWWyZ6sPuK5yzaXWMLz626Fb7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7282

On 08.11.2022 21:06, osstest service owner wrote:
> flight 174670 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/174670/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-arm64-pvops             6 kernel-build             fail REGR. vs. 174663

This is

gcc: internal compiler error: Segmentation fault signal terminated program cc1

again. Seeing this context:

make[2]: *** [scripts/Makefile.build:266: arch/arm64/kvm/../../../virt/kvm/arm/vgic/vgic-v3.o] Error 4
make[1]: *** [scripts/Makefile.build:509: arch/arm64/kvm] Error 2

I wonder whether KVM really needs building in the kernels we test.
Of course I don't know whether the ICE may happen randomly on
about any other file as well, so another question is whether there
perhaps is a fixed compiler available somewhere.

Jan

