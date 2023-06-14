Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F67300AD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548806.856964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Quq-00031c-Ti; Wed, 14 Jun 2023 13:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548806.856964; Wed, 14 Jun 2023 13:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Quq-0002zl-QP; Wed, 14 Jun 2023 13:52:04 +0000
Received: by outflank-mailman (input) for mailman id 548806;
 Wed, 14 Jun 2023 13:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9Qup-0002zG-GF
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:52:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2f4733c-0aba-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 15:52:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8857.eurprd04.prod.outlook.com (2603:10a6:20b:408::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 13:51:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 13:51:57 +0000
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
X-Inumbo-ID: a2f4733c-0aba-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6EexMYMKk+uw9UST8Jqk4jnrqxNnu2maoajxMiuX4DIvgPEUz7wvVexK08fdtNpXyAphQpmOhzxYsVIFMYfoH38SYd60ClWTUeJg9NwzRaC0M4xmUG3opn3PmPO6j5CxybBGfQdI8IEkzj67G9ZXTmnFpYdZeDSm4RspEcCbcGHE88ADk0XtHp7kNP72Xacs8eJL1pkkBcYPEctJ8AHmvedAyV3C8pbhSZZIOM9JyncWy0+Cad722fmhbhSYjfJt8mDP6Lsf18VPuUmpZDbQhmg1eaAen2C5JmOyTFs8ZGiAtKBjDpQXBsKSjBq/Aw0a7vpTFMNr8WVMUNK2T462A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smvQtCsPdiA8ZGiDimrFt5qwpEVDcrd/rk8/Jm6Ir6c=;
 b=IL0iZc15DLJk9YwjjDf0iOZ2Pl2YlK5RcnrsM2uYlHVKMQv+ebwPM9Vm4avXApMwpE+AQPp53k0C6ype8WJCC7rXk02BIk5R7GMrisUXrDZ7U8lhMrlIJ5NBGcwVBj6Yhzq28ka0JDCQArRZ2EE/Mo8qszeZTFgQZuUX80k8+HJWASiODwcl9HTNUeDqXDSXlcBBiKAElfOaQHoJDutXYLSvqv4CVmbBmds4vhzdAHPH+qhsj9tO7Ftx4z/m317ZTE0FSoyJmUTp5Vq0WVQcjk6M37KSo7MhSifTzLdw0e+2X64ANLwYhK8djnZXEfGNAvOljDrwNRuPvWvlc7A3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smvQtCsPdiA8ZGiDimrFt5qwpEVDcrd/rk8/Jm6Ir6c=;
 b=Yd2s4RDAtYGJE/gyNKwHWfqti9Zq9Y/TcjurpB8BAY5D/O4HjVSIbGeosSN5byepet//G4GNTuSCsK8sXFH7jmsRUkN/226JNjcqkoSmkm3Vd6cx2bQ5tSPy63kMjYKucoCTgbxGbX587an+2EgS2axmUm3c7tx3UL/zDbIIPGVt7P0iEb/SjKJXecgDrAZo9tG3hvbCzgwopEI12odHcjpM2Wj+XhJA2k2F8xHuJ+eO1G59rVmTaXrJoFGA+1hDYoAJqhsQOnSSKwMZwj+Ah0AkFVT7vLoOYvSoBfsqAzlrecUOgGy5iSSVcfGWPMgfpw43ZJlKY5v6cFrfgQTwVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <852e58dc-f71a-30ef-09f0-0b39466efe4d@suse.com>
Date: Wed, 14 Jun 2023 15:51:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] iommu/amd-vi: adjust _amd_iommu_flush_pages() to handle
 pseudo-domids
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230614083236.64574-1-roger.pau@citrix.com>
 <5c12e29a-ea85-b216-fedd-a8028a82d3ac@suse.com>
 <ZIm/X4hDpMLIeuHX@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZIm/X4hDpMLIeuHX@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fcd74f-388e-4872-b49e-08db6cde8511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FWtvRkFhJWQ6FKNj98aUI4339RyKUkL+CkDT09iIBeh790c2nuXrAn8LWNso+6WgHusdAcEWN1YEiyYLhKTFNftiAJfiVz0Pi3qX7+hc5XuZJEdCBLCblqXdRmjYLADtsJDd11zvGMqHoKaRvvs/kmf9/kEkXuEjjj1Ty2SxUATUWbiYiiQUbRX4mRmUFJ3ysdrUGOxi/QiZSFUg8/FGtrpeGxMU3IRcMIq1fpewhPnIaJaM9i1uEstXbO078vc4pj+FRZqxAWDvFwMn7a2MzIw/ZCQtiQsK+sOmqgtw0wfmvxibEQVgMUPVeURfR1FZt4FAYurNGO/NBJ+L/H8xCgQkH4o+Ns+QRd6dznN4CZ337MR6IutWRgNn9Fv68X2oVDj/UVx4XTBrjyp5NZN2RxYRTZO8oo4tdlUcZjWviglEO/PEIZwans7PMUtEw0dRtltYARc3eGonJhGp/joG+71s4bM9LeIbDGBDC1vhDDSz4u0gQWzh9kK/u/6DeBPIIA4yRkCggKZDsGgB72Nsip8K1Kc29bCWcKhYVbFLlaW44QZmzzkc6NLCV3usuXhH3MwsOM7ioy7xf8S79IBAZ0wGb5XQTslFDQbas6lEYc+nHmtcDOLmXXTH8eHLE40PyYNnQPlDigQhB7M3oFCtqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(86362001)(6486002)(31696002)(316002)(8676002)(41300700001)(5660300002)(26005)(83380400001)(6512007)(38100700002)(53546011)(6506007)(8936002)(66556008)(36756003)(66946007)(6916009)(4326008)(478600001)(186003)(31686004)(2906002)(66476007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2ZZV1ZCSnl3L2tFSG5kdUpDdDkwQmNyLzR4ZHdpY2wyZ2tucDNXQTVmaE1T?=
 =?utf-8?B?S3pRMFloQ21mK0tJb25yWWZiSEhkOHJJcVdPdHJCK1pDUWtTZ2phY1RYSWRC?=
 =?utf-8?B?VEN3c2t1OXh6WE9mRjVlcHlCMkRYWVhOSTg5UTkrSHBJTXh3ZFlkY2xudUhZ?=
 =?utf-8?B?ZEh5SXdWcjZHRGF3RklCcm0vNkh6cFhuOTBqMDV4ak1XV3lmRzRrTVFNMklt?=
 =?utf-8?B?d1BQR1B1ZkNvLzVGb3BwVlJrRHhhYys3M0ZKR0tFSEV6TnczWXN4VisxMmdw?=
 =?utf-8?B?bk9zc0hLT1dCL2Y5VGhwSUIyR1hveTZpYzVXZTg2eDFtMmN1VmFEUkhOOHFn?=
 =?utf-8?B?L0NTWjVxVDQvZ0hGbFNod0JMYU1GdGN6OXI1MGdkU2JYYTdPVUp5NWJTUHJq?=
 =?utf-8?B?RFlEV0w1MEsweE1UODVmVXZWYUl1THJxb0R4ejFDUFNlVkYyYWxMU3ArUVdl?=
 =?utf-8?B?eHFtdGVIK3kvZVZzenh4aWZ2azM5aUt5cHQzNGhqRTNwUUUxZnJSVlpqSTd2?=
 =?utf-8?B?cGxOZG5kcklYUXdjZXE5aUtjY3JnbktrazFjUFVYamU1cjZBNWhJbmZtV3di?=
 =?utf-8?B?MGRZTk13NXdjSW83Y1U1OE44K1p0TDZVQnNZS3BJRXJBaVdtZllZb1Z0NS9j?=
 =?utf-8?B?RFpQRDZYSisxeXlVZEp0bE9YWjV1OHlZQ0d4SnBHYVh2TzMxWXVxMndNVzBK?=
 =?utf-8?B?emdJbzZMcEl0U3EvNFhKTytnMloyWi9kM2cvSG52U3l2TFU4ZDFGMmVkdXFv?=
 =?utf-8?B?cjZZUDlBcllRaEFGUDlQUkM5VFdBUUxRa0tRcnhSSkF6Wit2OFRFQXIyNnZx?=
 =?utf-8?B?eCtjMG9BcG1lU1F4YktlY0Z5ekR2WjduS3YzSkJ5T2RsdHR2Nll5UTRFaGFn?=
 =?utf-8?B?eTN3c3lnRGlQL2RqWDR1a29uNHR5WjVaT3FuRkd1ejFDZDdqQk1yTk9Sb0V1?=
 =?utf-8?B?ZVU2RkpuS3daQmRGZ3Jha3puQjcwR1lqY1JDRFVVNm1hWHVsUjM2ODB3bTlj?=
 =?utf-8?B?ODhyaXZNUGFwcmgxVTVTVnR2bHJxcXA1djY2Ui9nYlRWb0lEOVY0emlWcVVX?=
 =?utf-8?B?SlZIYXlySGhqRlBPYWxQdXNFSFM1a0svdFZ1dnhYbDBWd3JaTVpkcHNZVU43?=
 =?utf-8?B?V1lqSmRPWFVWOGFtMks1YmxwaE9GZVhpOENRd0k1MjZONllrL3RGb2xXelFs?=
 =?utf-8?B?UXdXOEtVWk1oSUthT3ErN0E5NFU4SjNaVG01N2RxSzBycFdJUWRIbnFKaUhB?=
 =?utf-8?B?WENiTjljRFpTbENWZWRzcVY2Q1VkMU96cEJ4bXJDZjdZNDRBbEJqK3VLNnpi?=
 =?utf-8?B?bmhmWWZEblRpMkRPRDRPLzNLbVU2RkNhcGh5R1QxanVqT1BJejU0LzNpcVFi?=
 =?utf-8?B?RXR4RlMrOXZUK080UDl6L0pndHMwY1FZZ0sxZmlmMVhNOGNwTFBkd3lycUVi?=
 =?utf-8?B?MzFmdUJhOGJza3o3ejZaZlNFVzErY0tiM010VGZuNVpaalRORjQwRmhGemYr?=
 =?utf-8?B?a1Faei9ZSUxNOEpUdHB1djJRdUJ3c1Qrd05sNTJxdGY0Q0J3SXpYcVdGbFZj?=
 =?utf-8?B?TzcwenJrcloyUVVkZzYyNUhKVnRrUFBQTjZENDRIOStMSTNKcHpsdjRseFJU?=
 =?utf-8?B?TEN1ZWMzejJJcllOVGdXMWJ5U0IvZDZlOGp1V1NOVjVEdmV4Vm9WSEIza0xK?=
 =?utf-8?B?UkltV1FLaFFFUVlTWlJRbFBFK0lHS1BqVDNZVGptWjRkZSs3Z2VpL3pYSzlz?=
 =?utf-8?B?WjROOGwrLy9mRnFTcDhOejVnQkVmRG5MTkVEUVBZOXJnREVEeThvT0h0TXV1?=
 =?utf-8?B?dVZncmU2YURuVTl5RFBFalpoeERQUVVtNzFoenVZVkgzdHFKR2F6eGt3MlhN?=
 =?utf-8?B?U0w2RmMrTkRoYkpBcnpGTCs3cXRlbVRvV3EwSCs4c2tlZ3B2RGZxSE55WGxP?=
 =?utf-8?B?ZW9KcUxaVW5Ca2txc0VnOWxIYytaZ1BFRkI4ZDcraGU2TEtocDUwM1FpYkRR?=
 =?utf-8?B?cHpnTjBqYmozRmhnQWJOazhsTG1xSGJYbjZpaEtFZzZqS0JtOW9jTGd2UW90?=
 =?utf-8?B?V2lBL1d5TTZXU3hNZ0FZby9Wa05aL3dldnNOd2hUVzZQaTN3WGlRRDFUS3VO?=
 =?utf-8?Q?xGqHVje0cgxokYUHQdOBybTAq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fcd74f-388e-4872-b49e-08db6cde8511
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 13:51:57.5518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVSjRj4K0q8wMT1hNmKr57MX9k1/8IEcUT/SQQoUyEzoQIi2VflOutaT3YLdrTM52VAu3xGXM7ZA75agwIXAgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8857

On 14.06.2023 15:23, Roger Pau Monné wrote:
> On Wed, Jun 14, 2023 at 02:58:14PM +0200, Jan Beulich wrote:
>> On 14.06.2023 10:32, Roger Pau Monne wrote:
>>> When the passed domain is DomIO iterate over the list of DomIO
>>> assigned devices and flush each pseudo-domid found.
>>>
>>> invalidate_all_domain_pages() does call amd_iommu_flush_all_pages()
>>> with DomIO as a parameter,
>>
>> Does it? Since the full function is visible in the patch (because of
>> the "While there ..." change), it seems pretty clear that it doesn't:
>> for_each_domain() iterates over ordinary domains only.
> 
> Oh, I got confused by domain_create() returning early for system
> domains.
> 
>>> and hence the underlying
>>> _amd_iommu_flush_pages() implementation must be capable of flushing
>>> all pseudo-domids used by the quarantine domain logic.
>>
>> While it didn't occur to me right away when we discussed this, it
>> may well be that I left alone all flushing when introducing the pseudo
>> domain IDs simply because no flushing would ever happen for the
>> quarantine domain.
> 
> But the purpose of the calls to invalidate_all_devices() and
> invalidate_all_domain_pages() in amd_iommu_resume() is to cover up for
> the lack of Invalidate All support in the IOMMU, so flushing
> pseudo-domids is also required in order to flush all possible IOMMU
> state.
> 
> Note that as part of invalidate_all_devices() we do invalidate DTEs
> for devices assigned to pseudo-domids, hence it seems natural that we
> also flush such pseudo-domids.
> 
>>> While there fix invalidate_all_domain_pages() to only attempt to flush
>>> the domains that have IOMMU enabled, otherwise the flush is pointless.
>>
>> For the moment at least it looks to me as if this change alone wants
>> to go in.
> 
> I would rather get the current patch with an added call to flush
> dom_io in invalidate_all_domain_pages().

The question is: Is there anything that needs flushing for the
quarantine domain. Right now I'm thinking that there isn't.

Jan

