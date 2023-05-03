Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC95F6F5986
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 16:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529239.823409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puD8P-0005Gc-0Z; Wed, 03 May 2023 14:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529239.823409; Wed, 03 May 2023 14:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puD8O-0005Ew-U3; Wed, 03 May 2023 14:07:08 +0000
Received: by outflank-mailman (input) for mailman id 529239;
 Wed, 03 May 2023 14:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dYIa=AY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1puD8N-0005Eq-8L
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 14:07:07 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c76bb478-e9bb-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 16:07:04 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA1PR12MB8859.namprd12.prod.outlook.com (2603:10b6:806:37c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 14:07:01 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94%7]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 14:07:01 +0000
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
X-Inumbo-ID: c76bb478-e9bb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpFXu2m9Esb3p5mMr35zNmMg7eIHt651b4Maet0sn5/0YHC3LnlplCMZ0kN1APzPKN73YWhDoO01qAaeLVsptpnPbi54dXnP0bysre/K69EMUTSxQypjXLeopXUqTbNlyw8Vid+jUFXGwewqSsnppGHjHsbOq8Gyy0wuEb3v0qD8L5Hy60gpSBlRTHUQbiH9dBdWSLRWshIYs04YPQ/zLb+6a5OJZPm3S98eShsBSDjKlF+qK9iOV3nU8cCPKFCRosHkYVZmtdmCgr0QL+3wQfZjOlr1dtq04pPeqMVsIXHCSGlqHuYCblmrQFjj3JH1LRkfTZMenDduK6FvXki+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htY6wAQlmkfy+g2a0rtOTjM6Ae3lrM6ND5lLPxrqvUQ=;
 b=MIuD2xKDUtbdiaSsfZT2mBE0nJdBuK3UOe9YJiu6wbd/iNVYQxreC8nAQqyOPfJ5xhgsUPSlFsskSNR/w018Ba6PKomcTiDfJm+jSEScP2d3NezSzGmqPOIySKBMqLn4d1uy10JwVVkj6NquoEmAkX3po9ifrJpMwhrnuhb8Tpa6oMokC9MUj+/2qjEwUWeUNG3pdq7pm6SO+gdYX5D8XkNor3dlVKflaWWnqJjzNybmQovTxjpblngF609jESTSwz29yr0ESJGQ4gFof9JOwVIFXdLz3Wbp2FgGloU3h2ZUwHR9s1L404fvpWSTyDO1p8lr2srTuUk12IyQjS9wIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htY6wAQlmkfy+g2a0rtOTjM6Ae3lrM6ND5lLPxrqvUQ=;
 b=XTua8Q2+cBXBkeOYxMPpJx4pbReWhxMFB0mQr3y9XABnwi44mta0eUnO9VpwdxgMGkRdiuFmT54otLqWMklE0qXNs08hSCaH0YMXdvzwBJ4tPj0o4LSoDYFNfz1KU9HM6wXqK7XjtLQYoUGFUg7yP2w73Gukn3JrkTd2HzyTPMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d15ba304-8f79-f80a-b0ac-4dccebded17c@amd.com>
Date: Wed, 3 May 2023 15:06:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v6 03/12] xen/arm: Introduce a wrapper for
 dt_device_get_address() to handle paddr_t
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-4-ayan.kumar.halder@amd.com>
 <37c9a45f-ae07-8d47-093a-6cf7501389d4@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <37c9a45f-ae07-8d47-093a-6cf7501389d4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0202.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA1PR12MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: dcae417e-3d97-44e1-5438-08db4bdfaa1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nUU6F07NEW+ox6KrhiHqcQ8L1Xbq2osPC0MX2z0cpIkR+rl590tKOgLutJuOokCqtA1nzJ2z9NoO+4bJQgTUjSeNZTmm0ui6yXt29onAyH0h6UTxIGMWNAYNhLRwMHL9mWhC0j547UdkRTURKcxjle9lTRDWn5oExHTlY/nxEVbx/3vinGnPEdD9IPyKE/y7vyWDaf4WwJYJXd4uQGlEUH7u+8nudI94w/G9EW+CFzPh55t4vAyOmBmGv36uVif/QPSi9wKXitfx7hyapMl5N7iVcojXCe9JSmDrRL+hLm26Nd1KAq7ejoHhqAea1+tNl7NDHjzQyDXo56IhfXvfeAV4ABuy7B7RTjaYsin3UKwuwqyOq/umfRATjrhCt+w39bVh5eaD/I1flOVFZ5aTTgMK70SlOFVZmwLed0yRSpQSvMXsnP5OUaxoke/rChxX5p9vnsjRixRjP3iBz2lhCSekDQ1p25+1mFejAI2qRztK8qYuiPDTzXIqTwgg0lC4iZ3N1E4dNRT2EvMENoz6eWLvppJFWbojEnk5RIET4Cb6x71ybS35q+xZXAVtrFMDwgdN6XTXBQTKkmuIiqFnXfFHvtIhDzCZs3/KCx/yGGe4Lt0QyagtuKSHSwixSeSKWGK0sAR8yPdnncBraivSDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(31686004)(966005)(8676002)(8936002)(6512007)(26005)(6506007)(2616005)(7416002)(53546011)(36756003)(2906002)(83380400001)(6666004)(5660300002)(4326008)(478600001)(6486002)(41300700001)(316002)(186003)(66946007)(66556008)(66476007)(110136005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFVTb2F2bkRBeGxvaUppcS9kdjJrZWlCWktpRzhkRmhEN2o5cmE1QmsxWGlL?=
 =?utf-8?B?QWY2UVFqcExhYzNTbTZ3a0FobXRYckRhTGFnN2EycnVJK2VxMXgraUxRYXU0?=
 =?utf-8?B?K0hQUlJZOWsrTTZPNDFxR3FoZGpPbFBjZ25KVzdRdVZIOW9ERE5CaXpSQXRx?=
 =?utf-8?B?VGd1U0pKN2s2OVFyWGRDTWRkY2FHNHFEcUt5YW5lNXRpdXA1SUh3VVdmRmdz?=
 =?utf-8?B?YlJhQXd3ZjYydXdQWmZHRmdJaGxuREtDZEc1NFpVbGN0bTdBL0FpTnU4MlVY?=
 =?utf-8?B?SFQvLzl0ZzduaXA3R2lRMWNCWXhQNW5QaTgvTk9RaE4zYlJkbDM5Mm9RZm5j?=
 =?utf-8?B?YkVIOU03WEpZRzhHWWNIUzIxNUQ4cDh5VWhYYmRxWW9mTFVRUzVXR3BHdHUw?=
 =?utf-8?B?SE9UczY4YzI1TGdOREVkRlZjR1BnYUVrZSszU2dZTk5sVFdhcHlBa0g5ZEow?=
 =?utf-8?B?NmpTTzg2aDY0N01ydThYeHZHZ296Qm91eEJZQmphSVhIVnNEa1hVbFJ3RGVY?=
 =?utf-8?B?dVEzTmswL1U5bWNldjBvMEptbmEwb2o5M2E3NTloK1dJMTdKOWpwdnhWcE9v?=
 =?utf-8?B?V3N2K0J1V1FkZGJ0NkNCcXp2MWdpbGVTMnZRYk9mamNUSjBwWUFUZXkxVlFL?=
 =?utf-8?B?WkN2dGFsb3JxaFBEZkRPbFVnRzJ0QWdIRlVGMG1JV0g3Nnd5ZmdVY2RmSU9F?=
 =?utf-8?B?VjhVbG1pZmxRSTlML1pISVMrNThoNGNpV2ZmaDFya0tIa0t6Q1pkL01Fbm9H?=
 =?utf-8?B?TTZUWFZxTnhScHNrK2QxMXhjQkFKR3JCUGtxQUpQQUNaRzE4a0RqMXhTOUdD?=
 =?utf-8?B?YWRPOGNJTmNVRkpweWxjVjBkSmc4bGtSbzlZN3hKaVViMmdmbEJMTWgvR2d5?=
 =?utf-8?B?UkhPVk9uOVZ1YzNxM21TU2RLcmhCNEJhVVBPUVE5eVk3S2pwc1paT0pOQkpz?=
 =?utf-8?B?K0NWMHROZFMyQnkrODdVZDh2L2NZRnR3SGZKQ1dySmFmMTNVSGNySE5GMjMz?=
 =?utf-8?B?ckNQZG5DNjUzQkNCZGpZeGFyRFVtYXc5VHdpZzY2M05PM29JdU9ZRjQ3bzRa?=
 =?utf-8?B?MFNabWJTN2xhNFZBSzI3Y2I2bUtwVVJrYzhFaU8vbkt3emZHL3dzcWxLYmFO?=
 =?utf-8?B?TWJmeWl1bDBPaUhaYkVOeHZ5QkZrNC9aaUU1dWFTeXBBc0ZxMFMvTmxETnJC?=
 =?utf-8?B?d1dlNVc4VDU3cXdvYmhpYjdCRjVidGZvdnlldzZqajlpQXUwa1p0ZHFtaE5p?=
 =?utf-8?B?OExKRkRaUVVtcWhVWEpobDNnbnFPS2VqUzdxT296ODRBelJHQ0t6bDRZanZi?=
 =?utf-8?B?VkNMSUh5RXRJVGwwbVRzUUNnWnBVYlB0RHdORnN4aWcxRnp3cjAyeENkQ2Q0?=
 =?utf-8?B?ZnlKL2kxOEJPQzFJWUJ2UWlrNWpHNVVxT1N3aEwrck5zY3h4RzB0RnI5ZGRM?=
 =?utf-8?B?eStUclZ2OE8wM09oeEVLbGZuUzFqTE5ZdXRYK3hmMnAwQTJTczh3ZVlNeGMx?=
 =?utf-8?B?b2k4S1RpSXlLSEx1a2RRcFdkQXhKcjU4L0NKOW0yU2hOTTk0SHZnSFgvWldy?=
 =?utf-8?B?a3VXN005c1VGcUtrUEw2K2VoUFk4ZTRFOWg4VXpiUUI1SmF3bmZTU1FDWC8r?=
 =?utf-8?B?WE40MUJQUlNrTERmdW4vQW5QRDY4b1RoVm1oaU5Jd2N3OEM1V29OZm4weEVI?=
 =?utf-8?B?L1FjSXdaRFpQRlBvSFJGZktsaEV4ZXZ6UjJPODJGT2FxQkR5eTB3dmhkMHEv?=
 =?utf-8?B?cFo5R3ZPaXJQeG1BOWdhT3BqRzdodDc0QjVzYUFPMWV2RnROZkx6V3lXUElr?=
 =?utf-8?B?RThYZFRhTDdsZnR3YktPNnFEeXJRUDVPWmFLMko1Z1c2VmloTnRCNGFnR0ds?=
 =?utf-8?B?ZHNSL1RzeWMzL2ZLWUQvcXJuVjN4cTJvZndVb01ZbUFnUEs2QjdMTEtOenMz?=
 =?utf-8?B?Z0FkRlllMkZzNDV1RVZuQUNVYUgrQnNCdVpWRE1nZDloYUZmVzMyTU5zeWpv?=
 =?utf-8?B?aE5ndnozVi9uSkh5NkZzRTZiU01oUTBkdDgvZEFiV0Y0WEpweURhbmVTcEhU?=
 =?utf-8?B?bFIrMXgwR3RFTWxKa3orNHlueDVIYVpZSGo1ODM0cUlrbjc5LzNwaHA1SlZs?=
 =?utf-8?Q?1vS7J3ukNsLJZzdErk4qKpqTR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcae417e-3d97-44e1-5438-08db4bdfaa1c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 14:07:00.9647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckkZbgPKlkXzMsEU3TeRb/CQlxR7T1v5ugcE1ekrx0EWbRAyJ11HC2Bpe9VwnDb5+XIhSKL5myynxZoeVvjP+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8859


On 03/05/2023 12:25, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 28/04/2023 18:55, Ayan Kumar Halder wrote:
>> dt_device_get_address() can accept uint64_t only for address and size.
>> However, the address/size denotes physical addresses. Thus, they should
>> be represented by 'paddr_t'.
>> Consequently, we introduce a wrapper for dt_device_get_address() ie
>> dt_device_get_paddr() which accepts address/size as paddr_t and inturn
>> invokes dt_device_get_address() after converting address/size to
>> uint64_t.
>>
>> The reason for introducing this is that in future 'paddr_t' may not
>> always be 64-bit. Thus, we need an explicit wrapper to do the type
>> conversion and return an error in case of truncation.
>>
>> With this, callers can now invoke dt_device_get_paddr().
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1 - 1. New patch.
>>
>> v2 - 1. Extracted part of "[XEN v2 05/11] xen/arm: Use paddr_t 
>> instead of u64 for address/size"
>> into this patch.
>>
>> 2. dt_device_get_address() callers now invoke dt_device_get_paddr() 
>> instead.
>>
>> 3. Logged error in case of truncation.
>>
>> v3 - 1. Modified the truncation checks as "dt_addr != (paddr_t)dt_addr".
>> 2. Some sanity fixes.
>>
>> v4 - 1. Some sanity fixes.
>> 2. Preserved the declaration of dt_device_get_address() in
>> xen/include/xen/device_tree.h. The reason being it is currently used by
>> ns16550.c. This driver requires some more changes as pointed by Jan in
>> https://lore.kernel.org/xen-devel/6196e90f-752e-e61a-45ce-37e46c22b812@suse.com/ 
>>
>> which is to be addressed as a separate series.
>>
>> v5 - 1. Removed initialization of variables.
>> 2. In dt_device_get_paddr(), added the check
>> if ( !addr )
>>      return -EINVAL;
>>
>>   xen/arch/arm/domain_build.c                | 10 +++---
>>   xen/arch/arm/gic-v2.c                      | 10 +++---
>>   xen/arch/arm/gic-v3-its.c                  |  4 +--
>>   xen/arch/arm/gic-v3.c                      | 10 +++---
>>   xen/arch/arm/pci/pci-host-common.c         |  6 ++--
>>   xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
>>   xen/arch/arm/platforms/brcm.c              |  6 ++--
>>   xen/arch/arm/platforms/exynos5.c           | 32 +++++++++---------
>>   xen/arch/arm/platforms/sunxi.c             |  2 +-
>>   xen/arch/arm/platforms/xgene-storm.c       |  2 +-
>>   xen/common/device_tree.c                   | 39 ++++++++++++++++++++++
>>   xen/drivers/char/cadence-uart.c            |  4 +--
>>   xen/drivers/char/exynos4210-uart.c         |  4 +--
>>   xen/drivers/char/imx-lpuart.c              |  4 +--
>>   xen/drivers/char/meson-uart.c              |  4 +--
>>   xen/drivers/char/mvebu-uart.c              |  4 +--
>>   xen/drivers/char/omap-uart.c               |  4 +--
>>   xen/drivers/char/pl011.c                   |  6 ++--
>>   xen/drivers/char/scif-uart.c               |  4 +--
>
> What about the call in xen/drivers/char/ns16550.c?

Refer to 
https://lore.kernel.org/xen-devel/6196e90f-752e-e61a-45ce-37e46c22b812@suse.com/ 
, Jan mentioned that this driver needs some prior cleanup.

So, I decided to take it out and do it after the current series has been 
committed.

See 
https://patchew.org/Xen/20230413173735.48387-1-ayan.kumar.halder@amd.com/ 
, Jan agreed to this.

Is this ok with you ?

- Ayan

>
>> xen/drivers/passthrough/arm/ipmmu-vmsa.c   |  8 ++---
>>   xen/drivers/passthrough/arm/smmu-v3.c      |  2 +-
>>   xen/drivers/passthrough/arm/smmu.c         |  8 ++---
>>   xen/include/xen/device_tree.h              | 13 ++++++++
>>   23 files changed, 120 insertions(+), 68 deletions(-)
> Cheers,
>

