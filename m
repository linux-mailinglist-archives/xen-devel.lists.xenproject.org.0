Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B0613586
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 13:15:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432780.685426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opTgO-0006TE-KV; Mon, 31 Oct 2022 12:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432780.685426; Mon, 31 Oct 2022 12:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opTgO-0006R8-Hj; Mon, 31 Oct 2022 12:14:24 +0000
Received: by outflank-mailman (input) for mailman id 432780;
 Mon, 31 Oct 2022 12:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CXQ+=3A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1opTgM-0006QI-T9
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 12:14:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60081.outbound.protection.outlook.com [40.107.6.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cd944d7-5915-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 13:14:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9440.eurprd04.prod.outlook.com (2603:10a6:102:2ac::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 31 Oct
 2022 12:14:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 12:14:18 +0000
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
X-Inumbo-ID: 8cd944d7-5915-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXsne1y/wTX4el87L4tQV13mODKsdNopkjhma3k0n3klHLYEn+QnBlu3DTx7IRb+EflCscfWX6jlCq4pIGHJ26hUk7/EwmiJZ3uBQPZsoNf5YQ1BTHcz2JGRbleo4j4E50Q7ijbZ1uNDx/8NxgDHpXvmN7VoVY3IE1xubKFcwhGpuR3Ve0JfWqJEhN6vZ3my8+uOh8vw2hmqPngElNB04eJ6nnIUd+fHZQcVw9Zjml4pWKv73atvF2kW5tiySMzcJb/lpKVYfzP4d4Z/gK+zrCXrYB3HQ1v/w6iTY9ssYRGUdjAt/32wGF08ixavnP8jWTKV5hUtfZcexm53cO0PYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yC+z+b60CPfkAzm4S3wKlgxdb+EjYvwbbICGuJTmy3E=;
 b=iHkOnuqyQHnkV0GoxA3lDeZf2vOxSHPAZCE2WmZPo5rs93HeBaFVuYU3snY9QkVi84JTu/sf5dXJAyaNXAGF/zoCArVxce/YD23BgUB0/2qTgrqBlWdHAq1IAfTPBa3jyaJsSXf6ysdiZ1WZglEROGQRfdX5sOfB5ZILBRP9GbKg0wbL5HsSVkclV8qoOT9euRRpINS2pTJAxWp06TayiLA2SWojq/40QjC18eyqwK+/1h6jNWhWBp2SmFwG+06BdgbU2b7LEXbfIlfmdohgOlW6Si7+KaR0Y4Faeap9V8gu0pWFnn35oQotWRtd/pXUPWNRsxcLMM3jFuyH4R9zBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yC+z+b60CPfkAzm4S3wKlgxdb+EjYvwbbICGuJTmy3E=;
 b=WhZAlrUYvDUCjOoCXjFe4PKOPNx00Gn3JvsuL43xFub73XVafAYr8fxem9cOsp/b9SrxvtFDBFAMoxaJwrPJFPnUIK6HRvwzDwYVcIAinogLX9hdNkT4HD9V+ahFVgQjsZVLQ4PhbnWJrWwgbNFCh87s96uyEC3+ebLKu1g4k8SN7s5NguZsHNKW4dAT7qwdsKhlJ3UB6gmw6nWV9Yww4nQpR0z/OTo9ACUj0gp5TdWuwSNNqwmy/CyhVjPtQ2JCuJKQNbmQ8YMdivbk9PBH9g+NnE2Q7ZVrFp/z5LYM1eF8qteNnjVF95BFNkZMHOY2z9nWCCK66O4T1hzjYlIj+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d8412661-9c7a-60c5-3adb-029abc87c0af@suse.com>
Date: Mon, 31 Oct 2022 13:14:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v2 1/5] vpci: don't assume that vpci per-device
 data exists unconditionally
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, xen-devel@lists.xenproject.org
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221025144418.66800-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: e8af2448-a35c-4e13-9123-08dabb396f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gIdASHczguQbpC3vLWSsyVAs1ZZimyavk7Gxxg/as0b+nWZZgR39fHxPQWi6AXFIA96jPIDs8WZWKKwNgzc5NpkqEVZ7h/C6xbfnTua55rsgd5ARjj30m4Gr/LhTrkU4y+KmsT1gHzwU2oLXigx3L1KXmqPCjPkgUq3QG5ij95F6KQ0i0vsvV6eOzsw91cnLKEBe5/BuAMG8WOEKdISUlNbHYvLd425I6SgBljEkJ1Qqgh+14RaBAR1qfD+9K6XzDhSNLIz3NIs4/ZGDMaMa/rshbjHx8RrtI82oz4ehNajQxFhEygwnn7QYzErnhJhAzE0X/wIVnKGxASEk4sotCo4IvlzaNYHEUZxTNmxW9pwJxZrGXdupAFtjT2t28zxA1Dwht1WCjZWUSMY7AG2HSwJ4Fm8jVsePRi5hKiJgO+GHAMQDmznx9tPGG2MhEuCBJ4BzURAk7tRep6bop+Ho0mWb3FkyNNls7YXj1hH9RQ+9LdlmdWjTveBAAn0w/8WSXYASfhNs2qqH/zyFHKj0c1lfu13ZuhEyO4FI9Dxv66Y978RS43dHjI7psVDKtbWyiB6h9cuHoQ7mEqQvkxkm8+j9cIwLuX6J0s/JKL2gc7wdBFM6qaeuiX72InrEMGoFIItX5dbNz0F0S877WRHeCqzOILGF11DSVjsYEblq6LATdrpFX9hQjAagnEIS0q/wjJ+GjlSHF968Mu3lKPjzg7EILthWTm+uR2GSZhw3p+X2AFuWPylhYk+0PFSpi83pxVk4JNHfas4e15JolkQ4LB5HNqpkMHDrjkba0ZkUK4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199015)(6916009)(31686004)(36756003)(38100700002)(2906002)(5660300002)(4744005)(31696002)(86362001)(186003)(316002)(41300700001)(6486002)(53546011)(2616005)(6512007)(66946007)(26005)(4326008)(8676002)(66556008)(66476007)(478600001)(6506007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVd2Ujh2ekxkQlVsWjFMNHlUaTh0TXl1RHFQb0NQbUxER3JMNzB2dkVTb2Rk?=
 =?utf-8?B?RHN4RjJteWNiUEhnWW40OGZjWXV4U1h6cFlLZG9mUlg0VU1lVnJMT0NhM3FY?=
 =?utf-8?B?eERWS1NyNmlFZVFWVGhKcUpJbDBGb21pK2lhWGdGL1QwZnBkL0M2ejNDelB1?=
 =?utf-8?B?RHFPbjJmRE9oZm5wOEkwNW01NG5pM3g3OXFjZzk2OUxiYWptS3RvRDFHTjJr?=
 =?utf-8?B?WDB5QzFJeWNPdURKKy92TkErRVlCZS9uYkFPUDNkMVlBT1hwUEpwQ3pqRDQ5?=
 =?utf-8?B?VUVmV3o4bmIxTFlwV3hwZG1BT2R4c0tXWkc5MjlseG8rVmVoMExXd05FRkMx?=
 =?utf-8?B?dSsrbGplL0ZCQUNFbkxETU9nVzVSM2tQb01XdC9hOTE1RUVoaWNJUTAzSFlp?=
 =?utf-8?B?L2JyUVJsbW01anJmSnEwMGJJVURaZ2dCUjhWYjdmL2JFcTUyTXpYYmVOeSs1?=
 =?utf-8?B?a1o0eUs2aEF3VmNZOWhGUmpxUHc3YXk4UkRQeTU3T1hyRkNqbUh1bjZDVFJj?=
 =?utf-8?B?bld3cmNCWXFCQUxJRVdSektSN3NrSGxBYzBNQnhDclM2Ukx5LzBFMkNrczlx?=
 =?utf-8?B?Q0NRRkE1QVB3cnBwNTFKcUg5RXhVNnprN1JITTVLQm5LSnhjZ3Fhb29UQjZq?=
 =?utf-8?B?SUZDZ3BuRTNsNmJ1dVJqT3pIdlI0ODEvcTc1bWxNeVFOQXQwSlZOZ05jc3Jz?=
 =?utf-8?B?ZkN3S2VKR29RaGZPS04vRldjeWh3RjVINFYxV2U1Mk1EK3AzSzBaQVdRT2d4?=
 =?utf-8?B?RnFwbFh5dzVpa2ovd3oxNU83RUZVZWJqTWJoS1RxQmhCVkpSaTNtemxDRXh4?=
 =?utf-8?B?OFFwYU5xWFhvTFFlcVAxZ2FKZytpVDhJaHg5VUJlM1BPZElCdlJqWndaN2pJ?=
 =?utf-8?B?ZXUwTEgyL2wwaFZqS3FST0dYYW15SEJKVFZEQythSTdGMzBCNjJ5bUNPZHRo?=
 =?utf-8?B?Y3pHK1NuOHR6VnlzWSttTC9QN0dKamxRWVRJNHdKYUsvYXB4VjJ2UTNwZEVQ?=
 =?utf-8?B?bjI4Q0ZnNDJYVEd5ZmROdmdYTllUckFvcXJOdzZRbjludXZMMTR5VG9TK1NZ?=
 =?utf-8?B?dk52dFFFempjSWR1OVRubWhMVFEwUkRYdXh1ZWJvWFhoM0M0cmd1bEZPWjNl?=
 =?utf-8?B?R1BmVXh2ZFk0QlVjUGxBQVYwemQzSDNjNk41NjNYQTZ0a2lhQ01Ud1lQb21Y?=
 =?utf-8?B?dGJtQ0R5U1NKQ2VxNTAvTFVwQlQ4aDJvbC85RVpBSXBaZlpLRjJKeUpMVUlx?=
 =?utf-8?B?SFZNNzdmNTArT0Y4Nkh1QXRROFNIcm4xZGU1Tno3aVVBb21WaCtPL3lPTExD?=
 =?utf-8?B?ejA1VHpyNGRvZjJWZ3IxZTZIRForSGZib0JaY3J6YW4vcTlUSEtDdDNoOUxm?=
 =?utf-8?B?MWV6YStIM1NSalFwMU52QU9UNzlJbDc2UGEwNkEvYXd0L3BKb21ZWkEvM1BX?=
 =?utf-8?B?QysxUnN6ME4rVHpFdmVBOWsySjNWS05GRHl5aXdvT0NPL1haeVkvVGNncHk3?=
 =?utf-8?B?SHdUY0lNWU9sOVlqeForQnpyN09Ja1d3S2lOd0I1YmRvVmN0TDZSbjFYd092?=
 =?utf-8?B?OXNuUlJodHNhMFdVcGY1K0R3M3c0ZW1OVk1TMUFvazdDdHhXN0dtWDdZaEpD?=
 =?utf-8?B?MGd1TUlzY0paUlo5d3ZDclpvdy9JVVZ4bDJrK29xRmVOZ1R1Z2xBK0l0U1ZN?=
 =?utf-8?B?MVVEK3BnTThSbGhjZjhkZUNqT0x2cFBrOTdqRW5uNkdHUExpSHQ3OFRvRCts?=
 =?utf-8?B?SXR4Yk90ZnorQk9INTg5YkdjTVBTbkg0QVlJTmdEeVp1YnJWTHhGemN4aGxY?=
 =?utf-8?B?T0tNMy9PeHdzbEZWRDBHcGZWNUE2YUcxeTV2UDloaXA0U3pHaExsUGFKT1Bh?=
 =?utf-8?B?MzlNck5EcVVCNDNrWHJHbHhGTnRvSis3Zjg2VWZwRmxzcThkYnFRWmZQOTh1?=
 =?utf-8?B?MXJhdWx0bnV6YUpKQ2J3WGtxZldoMGplbTlQamNXdE5kV1pEeDFnWjBrL000?=
 =?utf-8?B?RFBQa0VFTlRHZUZQMlpnU1BPdzhpOGR3M3dQUlk4M3dkYW9pZU1aODI3Wk5K?=
 =?utf-8?B?WHBhaDVKZEgwZzZlOWp2YWhZVGhvSkJIMEE3SmMrTHZLZFBkMHdIajl1cnFq?=
 =?utf-8?Q?esIQLtfAqS1T8aKPdwpguHmy2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8af2448-a35c-4e13-9123-08dabb396f6b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 12:14:18.5071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EINKo7OALy2qbWUGQInnZMRglTIFHfuaLuPwwMvmesXcLwOjhpJIPmR0SAwkixo2GBuC/GlJUXAGLqC1hkIhGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9440

On 25.10.2022 16:44, Roger Pau Monne wrote:
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -37,7 +37,7 @@ extern vpci_register_init_t *const __end_vpci_array[];
>  
>  void vpci_remove_device(struct pci_dev *pdev)
>  {
> -    if ( !has_vpci(pdev->domain) )
> +    if ( !has_vpci(pdev->domain) || !pdev->vpci )
>          return;

Btw (noticing while backporting) - is the left side of the || still
needed then?

Jan


