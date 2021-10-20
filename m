Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F1434705
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 10:35:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213705.372007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md73u-0004bh-GX; Wed, 20 Oct 2021 08:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213705.372007; Wed, 20 Oct 2021 08:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md73u-0004YI-CO; Wed, 20 Oct 2021 08:35:02 +0000
Received: by outflank-mailman (input) for mailman id 213705;
 Wed, 20 Oct 2021 08:35:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1md73t-0004YC-AU
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 08:35:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7c50e60-d35a-4e8f-b9f6-3956229c2e8a;
 Wed, 20 Oct 2021 08:34:59 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-qSRE3TtHOkiqna0FyxjSzw-1; Wed, 20 Oct 2021 10:34:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3117.eurprd04.prod.outlook.com (2603:10a6:802:6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 08:34:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 08:34:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0104.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Wed, 20 Oct 2021 08:34:53 +0000
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
X-Inumbo-ID: f7c50e60-d35a-4e8f-b9f6-3956229c2e8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634718898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SdQhJHhEdfB43Fooa8M80///foOXf+BWCZlA4Hz6N/Q=;
	b=IP82HdPhdGW2gzRUBXRC224WBOoBNO5mJ5fBiiToCobxcj9b8kmob8yLiaSQCGVaAyIbX1
	7vP6sd+BDn1uP7e6ENz+kud+uZ5W2dJJRQ79IfKJWOydOrbpjRYXPRy4XgUFA+6NRxCCEY
	kwTCPXCiTr4cp3N+D+JXLrkOiy2ZUrc=
X-MC-Unique: qSRE3TtHOkiqna0FyxjSzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eo832QnQna0cWQxF7C3s5CUFbI0rz7z4hFtCRYlIojreEgT4ju03FeXXSmghh0MAd7ioAuRUEgUyNEDfQsQHz9cnijc/6B5nYGhdie7mzDPw3TSkk9TgRyjy6DTQOcTsvg96WRDqncCzm4Ulr+b3iOEV9s9Od22gto6eMoEQGJ5XrHykWNnhcDX7IIELVwI9G2q/EEJEGOJpZmysA3K17zDTjZpaf2pazMBi9MDFDziPHPcOSaHGA8v8Bs2UcCOqhHrJMmKNOq7XgclsYotgWWxL+z8+9yEsozv0IfkpbDKLWiHTFjEK603WNdY/nVOQXvzpgajniXOXL/4a4n2lfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZ8+6Pozb3p16OqmS6EHXaSK9qcum+AzoOeS59642s8=;
 b=mg/Qv4HEEZ9odQYC6WRJkA3YvMooax3riTNlihETq8Cc2lX2Tk1ANDcrlw49RCYlfzOB7VrwQjW+/6o4fc6lhZf/HEgn7nSSlWuYNMDowBflYLnMVMNADSDEBVzrcFTx1erqDm0u0HQoDkOA+ig5yQy9tddOS/vpQOdio9M3GX2MjVCxpQ5IH9BrYq7fQvjr+CbKEkNZdt291oHdBeZIuxWA6t549avRa08m+KYCYvvNqc4K/P47nCq1bl/kIOxPlc++Eyil0+ENBnHyQuXU4v2Tommk3+8I5vIb5l+tIq1bDMNPGv2WRHyoqNhqe8BOfiG3lNNhlBamOsBKU7Zw2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit
 path
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
CC: xen-devel@lists.xenproject.org, iwj@xenproject.org,
 Oleksandr_Andrushchenko@epam.com, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
 <YW/TBnjCuRjm64nB@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8f35e24-8dbe-db2c-02fd-f2290648a25a@suse.com>
Date: Wed, 20 Oct 2021 10:34:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW/TBnjCuRjm64nB@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0104.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44babfc0-398b-4ab3-ed29-08d993a47db6
X-MS-TrafficTypeDiagnostic: VI1PR04MB3117:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3117C87B36669B65A87D0A9CB3BE9@VI1PR04MB3117.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KBHgPf0JfEhD7hlhLeNQQ0888DChupMxvwP8l/XqfODQQlx8trV5j40pmPcCzfr744D47zEE8Zo4Ok1iUwOmc1aC/UYMP1nClABQzzRkKLpj9OMnTyir8NVujs391xZ/pWHT09xwoIQTPEGuUr/3zYde//ShPEzDVPpbXq/Fs6QEpEnvCqP19+t654dMSR6Mm/RoLfUqMIL2c7Ky3fQf3hUqLUfZUdB0oBFRpfjGNUHxYaCtkZfYF298xfbF5Mbzf8Gtft6BtvfMvRw+bvXWSLN9+g1nkGTRUHxUOdhU3s8rJgTTMXBjlMT0KuKizScMfw5NsfSeZ+7a3J8FrFHwkzxgILWQFZtmge0xLe66fItGauOE8XFaM6rlQicd9nxeJB5ks4wwEAsCZJS/hszHOylXbQyfelzOBYklV6kaqXnPiNK6mPyP8BsrbI53Guh9hEuicKtZeKeLZLCl5g0RTb13HL94XM/RkA9B8kYN4ECZh/M80kApyvKSCbwoXHuVvXv9WUyd4HNxswqHVdAptG/pvP3c7q7CujcsNkoXbXmnOO3YB5wbhdj3DbspUQ+QQZVV89lH4oB2tC3Q8OQ6pW1b7yzjtHlOQME26ZDq6BwExVGO5yW1tgDZhNTADbmR8x04oXTBbsIuDssKqZiNiSrYbahzwFbAB/PxGK9GEzWADEIS6BscBVafOjjQu0gaOdW/wTSIFdiGga4LhWH/NhcH1kixQoAjd4d5i9P4ln70GpJtrlWMzn7V5b3zaQKV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(83380400001)(54906003)(508600001)(8936002)(956004)(31696002)(110136005)(8676002)(38100700002)(53546011)(66946007)(316002)(7416002)(16576012)(66476007)(66556008)(2906002)(4326008)(86362001)(186003)(36756003)(6486002)(26005)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yuy85NORnlt519A/ccfblCjSYLBczVOWY2pyZsvTXv3wAXlopXAdnbVcyl60?=
 =?us-ascii?Q?UOmQ8WFfk38mgOXT/Cjxa7vYxXIgpk1oo+MdhHEMI5BFRZx2cnD2FtbLhsmq?=
 =?us-ascii?Q?Ucc7maHndwCSZDAehXAISVZk3BGXc2QprsjhOs7mapVezzo/kyP5zunTSxvg?=
 =?us-ascii?Q?LI7oLOmduuitCJBxmy9JijUIt/wqPEGHRjQ3QedIf2tzPJ8FWJxwjnHAei/W?=
 =?us-ascii?Q?kuO1gjRBz/DpPub0Lia3RW6vCXE1l6iCnWF8do4ww43SkKgk1UcMHgDRG7/S?=
 =?us-ascii?Q?cszIaB07El936BXE0uxNfzFhMb3acuw1azOwiAE8Ks+1isRwXta8s5eBXG5V?=
 =?us-ascii?Q?zf5W/CJCfg8BefINRuMrUZHcmsQlXoAGpjoE5ioOXQggijiplfLMQgYwx/RJ?=
 =?us-ascii?Q?8HWKriIgXnOd/+OYbu9QZJ6IjaFJ5/cCn0qK+otDMsUGKK363t/8RRtniYqi?=
 =?us-ascii?Q?YoMoWw6P70QZAkQIVAu9MGj95pc9nzbA+bkl+IhzSzHcDEoBMJV/g1I27Yeo?=
 =?us-ascii?Q?6QJ1rkOCczqVzIMFP0F3ZXA7ab+DBe/nS/kS5gAHbIJBI1h4DRePj2wYo9Lm?=
 =?us-ascii?Q?45uhDrO6+9G8PYDtjnURKZEJlYCUgMFmj2VB8c6SxvAqboJoFl2MN2SjBBdZ?=
 =?us-ascii?Q?QBcNrUDSlw/AfLOaORKIiH/FZxjPNe0S/5sTKasScobk0PmX6YXaNb8n3l+X?=
 =?us-ascii?Q?8tAc3Ng9IBgTZ13/t/s8tIydNDFxfdTF6d7ig0o3FD6FHcwx8d2WmCrrX5uu?=
 =?us-ascii?Q?SQH47yRZ+sgJBky1jRraG5Onh9Rc7Qymq+xFLybbb9bq3t5SqaB6vuC6bCsJ?=
 =?us-ascii?Q?TG2vQKMTf9kxKk86dqzvhqRBO3OqC31DBcYepLPfSskgfNK2rUGHhO3rHFHH?=
 =?us-ascii?Q?+38YT63vCw2OGb2tpJ2ORaW2Rt7kzEmdLcJavVnjAWd/cQyE5W9d7/QeX2VH?=
 =?us-ascii?Q?MrzPABKbJgbOa2dtrCpnvjHPSC9j46xzF7nA7kPP7roNUBHO7OfnrJc0Pxop?=
 =?us-ascii?Q?sSJTfTReLwxl4Ti9WeQKCuRc06NBvFmeX6mjC1m6d0hJzWKUS//FFPNI7iTj?=
 =?us-ascii?Q?AYiKPpk51EluAuvOYe8bJGbcN+dNbT+VsURBdJJDpBqzvuIfClr/hoaylK5M?=
 =?us-ascii?Q?zHMeKnFrKiy0oJoMAphH/Jx0FwRjGYmU4FNIsESwMFdLImoiOlnE7qwxB0Qe?=
 =?us-ascii?Q?+Jc7axXgnZByMj3sdGBB+ZODmYrYBTqUh2czuWPSGQip+UfhgrYzZJvaS7iM?=
 =?us-ascii?Q?l8vW8bNShlk8UgRElEXF9c6Xz8YmUWdrb9MTrQETEsyg13mmpw+rF67l3/G3?=
 =?us-ascii?Q?hE1im3MhSelaMDT28IwyXW5I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44babfc0-398b-4ab3-ed29-08d993a47db6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:34:54.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3117

On 20.10.2021 10:27, Roger Pau Monn=C3=A9 wrote:
> On Tue, Oct 19, 2021 at 05:08:28PM +0100, Bertrand Marquis wrote:
>> Xen might not be able to discover at boot time all devices or some devic=
es
>> might appear after specific actions from dom0.
>> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
>> PCI devices to Xen.
>> As those devices where not known from Xen before, the vpci handlers must
>> be properly installed during pci_device_add for x86 PVH Dom0, in the
>> same way as what is done currently on arm (where Xen does not detect PCI
>> devices but relies on Dom0 to declare them all the time).
>>
>> So this patch is removing the ifdef protecting the call to
>> vpci_add_handlers and the comment which was arm specific.
>>
>> vpci_add_handlers is called on during pci_device_add which can be called
>> at runtime through hypercall physdev_op.
>> Remove __hwdom_init as the call is not limited anymore to hardware
>> domain init and fix linker script to only keep vpci_array in rodata
>> section.
>>
>> Add missing vpci handlers cleanup during pci_device_remove and in case
>> of error with iommu during pci_device_add.
>>
>> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
>> defined.
>>
>> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
>> for ARM")
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in v2
>> - add comment suggested by Jan on top of vpci_add_handlers call
>> - merge the 3 patches of the serie in one patch and renamed it
>> - fix x86 and arm linker script to only keep vpci_array in rodata and
>> only when CONFIG_VPCI is set.
>> ---
>>  xen/arch/arm/xen.lds.S        | 9 +--------
>>  xen/arch/x86/xen.lds.S        | 9 +--------
>>  xen/drivers/passthrough/pci.c | 8 ++++----
>>  xen/drivers/vpci/vpci.c       | 2 +-
>>  xen/include/xen/vpci.h        | 2 ++
>>  5 files changed, 9 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>> index b773f91f1c..08016948ab 100644
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -60,7 +60,7 @@ SECTIONS
>>         *(.proc.info)
>>         __proc_info_end =3D .;
>> =20
>> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
>> +#ifdef CONFIG_HAS_VPCI
>>         . =3D ALIGN(POINTER_ALIGN);
>>         __start_vpci_array =3D .;
>>         *(SORT(.data.vpci.*))
>> @@ -189,13 +189,6 @@ SECTIONS
>>         *(.init_array)
>>         *(SORT(.init_array.*))
>>         __ctors_end =3D .;
>> -
>> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
>> -       . =3D ALIGN(POINTER_ALIGN);
>> -       __start_vpci_array =3D .;
>> -       *(SORT(.data.vpci.*))
>> -       __end_vpci_array =3D .;
>> -#endif
>>    } :text
>>    __init_end_efi =3D .;
>>    . =3D ALIGN(STACK_SIZE);
>> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
>> index 11b1da2154..87e344d4dd 100644
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -134,7 +134,7 @@ SECTIONS
>>         *(.ex_table.pre)
>>         __stop___pre_ex_table =3D .;
>> =20
>> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
>> +#ifdef CONFIG_HAS_VPCI
>>         . =3D ALIGN(POINTER_ALIGN);
>>         __start_vpci_array =3D .;
>>         *(SORT(.data.vpci.*))
>> @@ -247,13 +247,6 @@ SECTIONS
>>         *(.init_array)
>>         *(SORT(.init_array.*))
>>         __ctors_end =3D .;
>> -
>> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
>> -       . =3D ALIGN(POINTER_ALIGN);
>> -       __start_vpci_array =3D .;
>> -       *(SORT(.data.vpci.*))
>> -       __end_vpci_array =3D .;
>> -#endif
>>    } PHDR(text)
>> =20
>>    . =3D ALIGN(SECTION_ALIGN);
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci=
.c
>> index 35e0190796..8928a1c07d 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -756,10 +756,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>      if ( !pdev->domain )
>>      {
>>          pdev->domain =3D hardware_domain;
>> -#ifdef CONFIG_ARM
>>          /*
>> -         * On ARM PCI devices discovery will be done by Dom0. Add vpci =
handler
>> -         * when Dom0 inform XEN to add the PCI devices in XEN.
>> +         * For devices not discovered by Xen during boot, add vPCI hand=
lers
>> +         * when Dom0 first informs Xen about such devices.
>>           */
>>          ret =3D vpci_add_handlers(pdev);
>>          if ( ret )
>=20
> Sorry to be a pain, but I think this placement of the call to
> vpci_add_handlers is bogus and should instead be done strictly after
> the device has been added to the hardware_domain->pdev_list list.
>=20
> Otherwise the loop over domain->pdev_list (for_each_pdev) in
> modify_bars won't be able to find the device and hit the assert below
> it. That can happen in vpci_add_handlers as it will call init_bars
> which in turn will call into modify_bars if memory decoding is enabled
> for the device.

Oh, good point. And I should have thought of this myself, given that
I did hit that ASSERT() recently with a hidden device. FTAOD I think
this means that the list addition will need to move up (and then
would need undoing on the error path(s)).

Jan


