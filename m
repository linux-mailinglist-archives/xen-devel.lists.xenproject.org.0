Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233414085AD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 09:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185495.334184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgk9-0004w6-62; Mon, 13 Sep 2021 07:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185495.334184; Mon, 13 Sep 2021 07:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPgk9-0004tT-2p; Mon, 13 Sep 2021 07:51:09 +0000
Received: by outflank-mailman (input) for mailman id 185495;
 Mon, 13 Sep 2021 07:51:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPgk8-0004tN-7X
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 07:51:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59fbe4fc-1467-11ec-b3a4-12813bfff9fa;
 Mon, 13 Sep 2021 07:51:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-tUFgrveFND-f5Uh5aIyxrg-2; Mon, 13 Sep 2021 09:51:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 07:51:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 07:51:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Mon, 13 Sep 2021 07:51:02 +0000
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
X-Inumbo-ID: 59fbe4fc-1467-11ec-b3a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631519466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pr9NsquezdntMofNXZDBaoS0vQXjzZVpzsSAdnW8nHY=;
	b=GPS4mIjkpNXl2cG8KJDawjNSxuffZVT7yIp9I5CqV/6onw/+CuTxV0uI/MIh0MJl8Epq+M
	67AKkeCTesiQ3xUyMN1URHtM6e6uM7GB+qEW83GqUXRlnxCaSNx5jzrKZRcmnqnr0g1TaR
	4k5QPNLV5hR+lJ6sMalLVYp7LktJpyo=
X-MC-Unique: tUFgrveFND-f5Uh5aIyxrg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1bb3SPEaSiGZXT90apSKba+yGZHwzQ3H6XtkXaaRYppbCwlOxn+TFQCHjYTgtBNsDYdqEBDluIXP3PjRzNFYhw4gbURqaJi+MKfVD1b5m1pyFrcL04hZxB6dRk9m2r33zQxRbLGQr8W7HFeD0xlV6qO2fjux82If7Urybzm18k0CCIkn2eFYaeApPDY+qv2OLifinUrW/tpxYvuvU8EAFYss7zBTvy6lUmNieoBBgDTC3ifu7gmrBBAgz4BFyqP3Xn0FXXwKW2Wyibmb+DrdqzR1xgK/l2X1adfii6+Rz6f2eboa4Ckc05Gi/whzOUzwXAlfhMuM6UKffawLDSDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pr9NsquezdntMofNXZDBaoS0vQXjzZVpzsSAdnW8nHY=;
 b=VyzSpuFavPXiofaPaQTAm2I0AYATwVHcfIk024mlV44lOH3iOiz5gOAUE2KZCRYF/tljyI7aF7vXmWdzdq+v5z83Bzw+4B75wVKNNaq9bo8dCmQ6swez/UGJeklZFMsorKHHHcIVh6hI1eve1fXhS1b7QScK9XM4p6lWOHT/E4ZiCV70kQQVpp+oAKYb01V6tkwwBmoxdzgs8U4+xzzGVFjtbogiSFL7juDyGUFrJQFG7Qrx+1e2s0tNvwjcD8JUjPnYBgQlCVEqA5AfzRuAEzd3GKzC6GaD0S4uAKFfDnSZ6vJvmQlK70sl2ypIC9pJivu3t0lwpaflIMAy1BuDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 12/12] swiotlb-xen: this is PV-only on x86
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Christoph Hellwig <hch@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <004feaef-f3bb-e4bb-fb10-f205a9f69f28@suse.com>
 <YThiyxG0d2tmCtb+@infradead.org>
 <alpine.DEB.2.21.2109101636470.10523@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea90d3d7-22c7-604f-d0c8-f83c2a58554d@suse.com>
Date: Mon, 13 Sep 2021 09:51:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109101636470.10523@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 762ff284-8c96-4fae-4f5b-08d9768b3be9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715048CF70F9DBDFEEAD9649B3D99@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b+2yabJw7c8ZF+8rLpJfPrxAoSQW7hCpXduq8D3xkfHTG0kS0Vg+W4DxWdjKx8PlAX0CrsQAvk/GJSPwFlik8jJxDsQkfdyEOXZfJuEKEpF2t3ZQyqO05K3T07mxCHDYvUbcvwPjnnUUAOwRXr75mx0tJcw3DLxowPCtAsUJPPFaowoDvv4ORzybh/6jMXCpUcPA9A9pGtANJednsfKm1twYJA4teXDlj0Iaa9XLacmE41e5TUj9b0cy/jiqFUqurZwro71NMBUluRVSgY9weUsgD09YjWQKOAs/T57ioDuQ2zVGnQUGtxDGixWrHn7vSx9mMjN9YtGXDIJXiLLrbF12GJhbgSv3TbIZCnsiMiO1v/RjZm5veFcgT4a4gD4+xAl8zpLMa3MT6n9i3kxzGKyWQBM5jqTT+hhwzA50korrfeRYVABPGplqWUvp0OBLzpOfIAUS2mtzLI8jfpjmhULnPrxB0SKe5C0WZyhO+lRk6Jesc4aPXff5bmKk53fFLr1euJ8i0ooSc1xu0LMkJuBvOT8q+M3jVzTNYyluI4NG10OCuTnO74WjfILuAFCrjO3ZYks1u/Ud5nMXbqXIHIU1kRT90qPSnREWI57/Ty59+xUElq8PB6f6XDA3WKlskce0GvoYpS23II+Ud+YbLGy6RI4FnNWBKASaCaIM3KDmwKA9OXWXE3DgmzEVc/sLmfE/g6XO/eiYusRSUQtePEaoZUw9XIfU619+RB2V1ouNauPm534S5w45rxVoRstE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(39860400002)(376002)(396003)(8676002)(6916009)(66476007)(31696002)(86362001)(66556008)(186003)(38100700002)(478600001)(83380400001)(16576012)(36756003)(2616005)(316002)(26005)(53546011)(31686004)(8936002)(4326008)(54906003)(5660300002)(2906002)(66946007)(956004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rno4YldhTnFxd0RpV2E3TDNqSnlDMWFEMitlb1dYQUdyVHp2elRhVzRSeEZM?=
 =?utf-8?B?ejNMa2E5d085UGNwVDVIVDdrN1VzdStndWlzZ0lBOVc0enRBWlZFcndaQTNJ?=
 =?utf-8?B?NFd4VzFNSHFocmd4YVZlYjg1NWZJbjNRVnZYVE9DbUVIVVBFK0hvZlBQYytr?=
 =?utf-8?B?Vjh0UDV0MDNnNCtHeXBkVFZURUtBVkFSMXROK0lJb2dpTlVhclFMeUxBREw5?=
 =?utf-8?B?QUlVekJ4bnYxMzNJNHZka00vUjVjYzM5QVAvVlJSOFNOUWh0dGFmMWw1ZzZo?=
 =?utf-8?B?ZURiemhleVJFZ24vWDhpTTVmbzNuejhDK3BFdVdaTzkyNDQySzNBallQdTMr?=
 =?utf-8?B?N0dxTFVjS205bnBxYTFSeW1VV3owV01JY1NOTE8xV2dBMkhKeGtEeWdOSUNF?=
 =?utf-8?B?Y3grYVRScXVNcFZYbHhwSFhrOS81MERJODA1alRsVHhVOStoNGhRcGlmdVh3?=
 =?utf-8?B?NDRqWlZLanplS1B4aGRZb2ZIZ0tSS3NzZEp3R2h6aDNDam52OUNlUDlUM0tp?=
 =?utf-8?B?WXAyNTh1Ulpwa0s1RjBHb0ozOUJiLzZVcE1KOXFqc3hSN2dQR3UreU00QWNY?=
 =?utf-8?B?bGpxeGJ4UWU1MzlsK0dIWE45Y3JFc3RROGpLbTI4UGVmb1h1SEFvdUZxd3k4?=
 =?utf-8?B?TEJscTFNNzB4Q05YdjNZNE81OXo4UituWUtON0kzVVd5MHpYSUZJSVUxcXdo?=
 =?utf-8?B?MnQ0anpWSGY4dnYwYk91YlJ2VVNlZmdCQm9nMFJPSThROVF0NmpMalFNejB4?=
 =?utf-8?B?SE50SmhacE9WRENYSFVQMFBPUjVHV1dVQ3NXNkVDNWdRamxWVlRyNVIvVHBX?=
 =?utf-8?B?T0E5TzJLaGZ1NjA3NWg0SElMRHA0Yy9NdWE3TWJqSkpudm8vOUgvbnd5dGEr?=
 =?utf-8?B?emYzb1FHYWc4M3VBZUNkL0JacGtOVm9va1B5QWo2emg2WkgveE1ndTFsQ2l1?=
 =?utf-8?B?M0FSTGJROVd5Y0xydFJQQlQzUFVVQ1hRQll2dGoyckFzYk5NVXkwTnJxakFI?=
 =?utf-8?B?VFJ1and0eWhlK1owNUZ2UEwva1QyMGRnVWRjbzFWdzdBcjlXWHFLWktWaGdV?=
 =?utf-8?B?MTZBcG45S1ZTU0p5SEMza3R6QVhFclBQOXV5NnVpOWl4QXRYV2VxTiswY1lq?=
 =?utf-8?B?RlNRdURHSzdWSjZIYittTTFRUGFpSVV0MWxYOXJQeFZKTnBzQURaRlh1NDNj?=
 =?utf-8?B?MThGeXFCemtBOEMrUjEyVlhNdjR5T0ZiUTBzWnJ1bCszNVFzV0FuT0Zrb2p2?=
 =?utf-8?B?b2kvSjZaS2Q1aFFoRUo1SnRxbi9WTW5ablowWVFzZ3JzeG1JR1pJZFNybUFT?=
 =?utf-8?B?RUdqZnBkM2Nrb3kxTEJTYURETFFUbzQzaGU5bzJoMVQxeDNjWjh6TmkxL3Ur?=
 =?utf-8?B?OG5Yd0JZTTNCM1BpbHNkdm5QZkRtemRCOXE1TytCUllsM3ozMU43S1R1dVJ3?=
 =?utf-8?B?dDJpQ0MzdlFSeFNpNzRVK1hrK1dTTEJFdVYybFc5RjFVRUVOWEpDNjFrbmla?=
 =?utf-8?B?R3RSRzF2MXdhSnBvMFRRUVVTS1BZR0tULzZxSjlvSGp1c1E0L1FVRGZJcUNz?=
 =?utf-8?B?TjJZTkRvcS83ak9xVmo4dmMyTGx4d1hDYXdubjNpdGZCb0orZWFZcEdlZ0VF?=
 =?utf-8?B?RmErYkF6ZGR6V3plS1MwSzNmWCtsWjFrZHIzUXlkZWtQbGFPSE9YUXBTRFB5?=
 =?utf-8?B?MXVhb3V5OEowNXFqaFJkMWtvaXJMMlkwYnpWZE05K0grd1d2dURrUlNxQkQ1?=
 =?utf-8?Q?3IAHzROaXVsaqw1M9hZ7yKSOzskEBd30wJc6e8E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762ff284-8c96-4fae-4f5b-08d9768b3be9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 07:51:02.8362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M95ReYbmDRFLD9uHvKcfF6HUVD4FKx1m0TyUAS1zPv5row9eF3rfID8qrUFRe7yEoNJtUInFFbi64SL76l7Gig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 11.09.2021 01:48, Stefano Stabellini wrote:
> On Wed, 8 Sep 2021, Christoph Hellwig wrote:
>> On Tue, Sep 07, 2021 at 02:13:21PM +0200, Jan Beulich wrote:
>>> The code is unreachable for HVM or PVH, and it also makes little sense
>>> in auto-translated environments. On Arm, with
>>> xen_{create,destroy}_contiguous_region() both being stubs, I have a hard
>>> time seeing what good the Xen specific variant does - the generic one
>>> ought to be fine for all purposes there. Still Arm code explicitly
>>> references symbols here, so the code will continue to be included there.
>>
>> Can the Xen/arm folks look into that?  Getting ARM out of using
>> swiotlb-xen would be a huge step forward cleaning up some DMA APIs.
> 
> On ARM swiotlb-xen is used for a different purpose compared to x86.
> 
> Many ARM SoCs still don't have an IOMMU covering all DMA-mastering
> devices (e.g. Raspberry Pi 4). As a consequence we map Dom0 1:1 (guest
> physical == physical address).
> 
> Now if it was just for Dom0, thanks to the 1:1 mapping, we wouldn't need
> swiotlb-xen. But when we start using PV drivers to share the network or
> disk between Dom0 and DomU we are going to get DomU pages mapped in
> Dom0, we call them "foreign pages".  They are not mapped 1:1. It can
> happen that one of these foreign pages are used for DMA operations
> (e.g. related to the NIC). swiotlb-xen is used to detect these
> situations and translate the guest physical address to physical address
> of foreign pages appropriately.

Thinking about this some more - if Dom0 is 1:1 mapped, why don't you
map foreign pages 1:1 as well then?

>>> Instead of making PCI_XEN's "select" conditional, simply drop it -
>>> SWIOTLB_XEN will be available unconditionally in the PV case anyway, and
>>> is - as explained above - dead code in non-PV environments.
>>>
>>> This in turn allows dropping the stubs for
>>> xen_{create,destroy}_contiguous_region(), the former of which was broken
>>> anyway - it failed to set the DMA handle output.
>>
>> Looks good:
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks for this and the other reviews.

Jan


