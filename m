Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C93B5A0ADF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 10:00:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393122.631877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7mU-0007ON-As; Thu, 25 Aug 2022 08:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393122.631877; Thu, 25 Aug 2022 08:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7mU-0007KD-6R; Thu, 25 Aug 2022 08:00:02 +0000
Received: by outflank-mailman (input) for mailman id 393122;
 Thu, 25 Aug 2022 08:00:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR7mS-0007Ic-Qc
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 08:00:00 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2082.outbound.protection.outlook.com [40.107.104.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaa8f59f-244b-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 10:00:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3856.eurprd04.prod.outlook.com (2603:10a6:803:21::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 07:59:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 07:59:57 +0000
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
X-Inumbo-ID: eaa8f59f-244b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlcEWzvxHL3TDxRPsnd4ChBdM/XDq+QDIrevurVokNZlYVWyjb2gYXfm+PA04fKrGOQ8t5vhbnKN/nr/M3PI/cvXBqKM0fv2GMNLCIM1DWxEzGVMNRBkYssXktP2XEK9/07Fi4OyhN9eCqnm/rvetV9hPha/pIoQO5gj+g6uADQ15h05G9qfQJ1iAVmgGHXuO5HUlgTZ4Al1WKGOz7FhimAwBOOhOF+572/rGH+P9+SGG8Mpt2dXUWNDgOBt78CD8miROu2n6pXvEOQ2DGFWbwCL4alRPsf8znbKGvn/oyDqyibsg89iy3G8/cSRkLMdzE1RlTeMxdzR6o+cQNAX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1GnXrSlW4jdUJvT7zuXPcyu4grolSnLUsThau2VI3E=;
 b=bnZZNwMz7wpmNKVAx5WcDUWNolGDwF5p6FLs2c7jiraCO15KJc2pLlBnFpg8UiGL4k3JDTRmgQIswfcig0tCUeWD/H9+tqI/sR6uhMGuIexNh6EFJ+7cygI6nRvZE5gVKPhg9ZGGsbBsBRsWDs7koHgkbzQ2RmIjjW0XGA8w3v+LBhGEb8MRc2uHQo+3UBL+rh8czclINSzWWgZ4wgAyxUgEcwGVwsXLm8RfbW2JyNPk8c99FodUgTtqnAl/WzeA3T5oOXh9yjTQwNVcec/yQIPh3wybwUNz5mbdNJoZJyQbRFR5n4/wnIjceFEnuQG0IFGOWrwlh5j1gXLGWt8UOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1GnXrSlW4jdUJvT7zuXPcyu4grolSnLUsThau2VI3E=;
 b=JkwX1pkG9mCgH7PjoJuY4NLhAHJHHRdNvAaP81w7nNAJjKOP0SAtgEGdRpMed8yN9e82giFAOcrX0zB0/Oigt+jceDJ4j6T7OX0Sh75mMEom6Mtb/+M6XMvZlvoe9lGh965X6wRxrn/jEI5xQGvmWT2Q+jzqhF5u/eBCKpvB+vctgDYBgSzKy6qvDWXbDuYtYRL19lT2YsJETQ9fg6qX8E5KCp47cfetWB8Bh9iy3u2ZlF22WD06JJThBh0BzKCM/lzEVtTs7U4+6QoVSVVGdmNqTcnn6hG7hVMcPUkd66uTzYaH4mUb3SVg6g/lwS0kAoirmP2rYB7LBEy/2qsbag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df443aab-a2eb-75c2-3a4d-df6d093b5788@suse.com>
Date: Thu, 25 Aug 2022 09:59:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Make XEN_FW_EFI_MEM_INFO easier to use
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <20220824210452.3089-1-demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220824210452.3089-1-demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae1a309f-2184-497a-2eef-08da866fcdba
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3856:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R3wzdTIgAX/6NQaEILlCT3GLiHb5rJiFXiQ/7AdxuS1Th+WsJZZwCMlwCB1CgRaYbtY30kBxxXqOUbg084imSa5fL6rKhMELopNW9160jsW9AzB9Ncc7IxmeZL1IvzeLBcBHaELq6tZcdmFA8lMg9/3ah9ck+RTzBk8q3q0ZJptyjUQSa2zimvyXUoRkigFeTIL+e5HwXmcvUK6Hlysd0Y4S3S0cpRyGQCZOX753Anbqg7/m47cmQfpIFwa9LSOpcdv701KIx613rz4XdN8FlMhtNEEFBSVaepY0SCFNAU8f1VT3eKXmrk/xBjskh/Vi4iw2LiH1X74OwugM1jCHXCjOtBXUHn7z0zhGva0xFR9JITnT6drNeWJlKMG19+4BnL+GgaJOwafKgzgXMIvZyESNf4JVgveYSya8Yg6hxOOIHVxmGTm2F+SViEDcx9+8AA0BbWyV5IQhuBNbDk6olm+fhS5dU4NgMYA7NdpiFcGGYLDaBknD+fhST3P63vy2FmkYA0WkQzWy8ldpPsQUnNUYaWY/Lf02juc7ZUtkkNLNXN7xQvfT6x9RSsxgdtiMYBvN/U+Gu2aPXSML8qPrvcz1E+kx5SF2ava/DLhLjLxOngwCqMEbrLDnb48ezcJMAI7fHeIEG58LDkCOzOsabqeappo1W6cVV7tfpHOWxyC7Xv2dpt6KasWUk+JHyeSQXTFq3u6KaTQJI+YZY7VxnG3gl2EDrExgSUxGp4LhHEPagYd1+I7t/UY618ToA5Hrzfvz6ijEW32WSYjsJCRr6BjalKczMwbAdIxfGVCAD9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(396003)(136003)(346002)(38100700002)(316002)(2616005)(186003)(6916009)(2906002)(66946007)(31696002)(66556008)(66476007)(41300700001)(8676002)(4326008)(36756003)(54906003)(86362001)(83380400001)(6486002)(31686004)(53546011)(6506007)(5660300002)(6512007)(478600001)(8936002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlZWcHN3ektzMDhyT2hwQnBORXJLeUFwVWFzTFFHZWpDcGIzYzFKMWRKRjdR?=
 =?utf-8?B?WGtzY2JVLzhWKzBuYW5La1d2dnNkL1ZPeEtIRXlVMEJNNENvQ2o5ZCtGQmNS?=
 =?utf-8?B?NWpDSDUzaDlWS1hjTjRZZnRsNC9oNytSVC9BWVhESXVvVVRNcjgwWXFMNEU2?=
 =?utf-8?B?amp4bnNGcFpjbW5pTHJEL1B5MmVQeWlLSCsydWZoZkZBMkdPeEFRclNUVTNZ?=
 =?utf-8?B?ZG5QVVFnZHV2VWhOSWRYc29XbGhWQXg2dFFOOGZDS2VZaDlka2owOGZzN2t0?=
 =?utf-8?B?cmx3TURSaHBPV0FyUlZuQUl4VnJaTi9OQjVpM1VSczJsN0FMOGpDVmVJbXIx?=
 =?utf-8?B?OUtPNUtsekVRa1pxd1F1Z3MrSXhnSzNTaUpNaVF5SkdRbnhHRHBGcnZCT3gw?=
 =?utf-8?B?L20waE1WYlNCTy9rS3hpdlZBbkl6d2U5SDdJWE5LdmVObTNNTHBHekozTTdQ?=
 =?utf-8?B?UGQ5czQwamxoUDVqZU9Mell6N0dVc3VZVVd4VlhXRjE0S1UvQXpleVdwVXY2?=
 =?utf-8?B?SnZYcDFvdGQ1VEZYVTBvT3ZkTUpQcTRxTDErNlFQRnRKcThnYXVrOExhTDlr?=
 =?utf-8?B?ekVsbWtVd1JLZFE3WGxJZmtuM3pyZ1h2N0dhYllZWHIySkZKRUgwbGVKampa?=
 =?utf-8?B?ckFlNGE3L3Z0eDhLWnJQN0dmZEpSZHhZM3pVNTVYK2ZaWUlnSTRjdkg1d21H?=
 =?utf-8?B?WVRNNVhMaVpvcDg0a0FNdkZQOVlLUGtCejRtSkprQ0tJNjFWc3E1ejN4WUlG?=
 =?utf-8?B?NU1Pc2pjUmlNZHg5cHhXM2hpYWZNWTZYKzNaV1dpWXhSMjJFTjRySElCUDI5?=
 =?utf-8?B?eDRKMUU2TlpMQjVaTWo2OXVucmRYeDk0TkkvRGNZU0l2WEhEd3U1QTZ2M2o2?=
 =?utf-8?B?TVVuQy9nRmVtMDJkaW1OQWMya05KeE05SGswMXBidWpzZGQ4MHM2Vmp2MVhG?=
 =?utf-8?B?OC9pRldWZUh4QzF2ZHA1V3lrSkxoNFk0VUZHZVVuSVpocDZjc1VmeCtwSEkv?=
 =?utf-8?B?K2JPblg0Z05aRWVNWE1BM1dHMGEwTllNLzFVMTE4TGZHcEIvSURwbGZxS2ZW?=
 =?utf-8?B?VHBleEJlZFBjcnBTNUFFVVptMm1nN0ZWSUxpY0NOQnNzUkw4b1ZGTTJZTDM2?=
 =?utf-8?B?OHQ4Nmc3Qi9HR0trNm8reW1DTTlsSGp1Y2toTkpucnFQSmJrbGNpVVJQQTZO?=
 =?utf-8?B?bkpEV2N3T29QUHZQY2NHZFEwWlUzRllOUkc3M3hQVi9URDUyeVpTRUNDbXY5?=
 =?utf-8?B?bkdrMHdFVUdxSWtMTlRyMEZTUG1wcXR5aEdmcFlCWHVIdUxha3lGWjJuSjFK?=
 =?utf-8?B?TU5sSlpQbzkvRnNneUQzREQwaXRqT3NjaVd0aXdyMExTTFhxdXVZYlBISlpC?=
 =?utf-8?B?VEt6c2YzeFRncENlZlQyM291TStBVEVvNGFBNGhuTlpEQUR6UGVUcERTZXNu?=
 =?utf-8?B?TmlML1pDdWJZR1ViMzYrQU0zUkVraXFDYXpWYzVBZDhMRVk3bDlyWGd5UzZ4?=
 =?utf-8?B?QzZiK1d0ZS9mZUZ0T3ZTY2FudFZOOFFqU00vWXZDczZPVU9CSkE4Z29wczhW?=
 =?utf-8?B?ZitkWnVtVTJCNVBNelVXODVMaWdvM3hmamx6K1RXb2dQOVFLeENURFNuQzNy?=
 =?utf-8?B?aDAvc3BCMVdTWjEwdXhmZUxOUzJqUXh4N1FQR016OXRWd2NhNVpGRURIek42?=
 =?utf-8?B?S3A0dXA5YUcxM3hsMi90N0x4QzY1U2tJemJBUnpWaXhmQnFzN1FqTlY0TE1i?=
 =?utf-8?B?YlFvR3dIa2pQMHI0blJQdjJlREZMYS9rR1FGZUdyY0pnSUZZSmwrYk1JTktn?=
 =?utf-8?B?S1BHMWFKRElwclRmZ0VCVzNSU3VtSFRpOGxIMVVTRkxKTmxmN01zWFBPQmRp?=
 =?utf-8?B?TUVENVVYbFZqMWtuR1ZBaThCSmNFeTBrWHdycHBZT09wT2FrTEFmelc5R3I4?=
 =?utf-8?B?WEhSSThjS05SZnFaUzB2YUpJUEFkOVBWZlV0Z05tWGFQcDNkNVVWaFh6blZ3?=
 =?utf-8?B?Zy9jSjI5OXlXaDludytCbTJPL0RFYm1EOTM2alJ3QjJscnVtTTFXZlAzczVk?=
 =?utf-8?B?TXBpYjNlQmR6SzZITHAwd2s0WmVaM05kTk9aaXJYSjFlM3ZvOGdMMHhnVlAw?=
 =?utf-8?Q?4qT4nMNpaIpxr8P2nxgb1vrqb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1a309f-2184-497a-2eef-08da866fcdba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 07:59:57.8775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5p5zM5WXtVzYUV3+V39mBXx/2X2dHV6vlnuZrHsGqeGySiTdKLUsmWX6i0qMqeMzHWOno9cjNg+SMzibUod2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3856

On 24.08.2022 23:04, Demi Marie Obenour wrote:
> The XEN_FW_EFI_MEM_INFO platform op has very surprising behavior: it
> only sets info->mem.size if the initial value was *larger* than the size
> of the memory region.

And intentionally so - the caller didn't ask for any bigger region,
after all.

>  This is not particularly useful and cost me most
> of a day of debugging.  It also has some integer overflow problems,
> though as the data comes from dom0 or the firmware (both of which are
> trusted) these are not security issues.

I'm afraid we're trusting the firmware in this regard elsewhere as
well. So if there was a need to change that, I guess it would need
changing everywhere, not just here. But we trust the E820 map as
well, when on non-EFI platforms, so I don't see why we would need
to change that. In any event such would want to be a separate
change imo.

> Fix both of these problems by unconditionally setting the memory region
> size

If you were to report a larger ending address, why would you not also
report a smaller starting address?

But before you go that route - I don't think we can change the API
now that it has been in use this way for many years. If a "give me
the full enclosing range" variant is wanted, it will need to be
fully separate.

Jan

> and by computing it in a way that is immune to integer overflow.
> The new code is slightly longer, but it is much easier to understand and
> use.

