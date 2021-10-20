Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F175E43459C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 08:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213561.371828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5Yi-0002Jj-Fh; Wed, 20 Oct 2021 06:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213561.371828; Wed, 20 Oct 2021 06:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5Yi-0002Gm-Br; Wed, 20 Oct 2021 06:58:44 +0000
Received: by outflank-mailman (input) for mailman id 213561;
 Wed, 20 Oct 2021 06:58:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1md5Yg-0002Gg-TN
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 06:58:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27bab6b6-3173-11ec-8334-12813bfff9fa;
 Wed, 20 Oct 2021 06:58:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-Dv2qjsjDPeu7eB6GJAXJtg-1; Wed, 20 Oct 2021 08:58:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 06:58:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 06:58:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:20b:312::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 06:58:36 +0000
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
X-Inumbo-ID: 27bab6b6-3173-11ec-8334-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634713119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aCFw5zyQpmKcvpzVhGygOzjE+PVyPhLrNzqayeQeCdo=;
	b=g1loVBC/Pwi2DDG9k6DBcFbkNxX/REwsTBcdREHuLvf+CgjJeZqFceOmJa8G9iyBvljBm1
	crCwr39gm/k0hKi3cgfESQ6UhBwrJSCBQMKNYDFv4/x1t7/KlIo4yF9bh98x//VAZimvuS
	97oFxWlqjjyQOfRUWFjUjsdCkDKs30g=
X-MC-Unique: Dv2qjsjDPeu7eB6GJAXJtg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iriAmSeT1uGEPGj8gyTdNPAsEJ99CUm9oSLhYXjGCS+5Y+ugZ4YO5Ke7YXPbh7xsDORouS9VT+o+LfIu0EHvNLTJpVE6iiB7sdHU4wd/qQp42kOsX2QJGgJdbYj1TbB8sCxRmrqPZWLSbuB8heoMuCOQ65n6+FC3KKX7ca7RDYlXO3mQ+gYJZ8wuoKg2rOoC1tOj94JntP83bDgbEWxWglrFrle7CSeTkOWPp90sktZ2tnCg819xS+8DxHHFgivZytxFa5aIGaM+MpnwNhCL9vmF+hqG1IhYwO8/ZniW2KeDs9M4Ah9JNf3jpZwGx/xtrUmraSO1jMcF4v2dw7b03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TOYEVnXzVkA5cBsykb6n9wGmV8L9yx/o1Y/39iFAG4=;
 b=nXhOReUiQkmcbSBEw39Lw/hN1lbO9CQGhuoM41zso+CFcdyBqcgBkOCwLYjuk/G04VtVoYviRr/+y2cZMsesI8VaDYbPf+nZQQfuFoFV7VD5BoKZRrVcUCQdrAeiB16hIkM5v3cCpyCeffjGvM+ODeOA95n4UL/ik0QPUflbv2K4JsbIB9m7LhnlRtvio8xcwqN/G7IFmwbObApETmkRJ6cdzVrbFQNiCtn2XORxwtf9pUtufLYBjqT6//QryydLm03IKhmX7rnvWDRJhb2ew4wUV9eBNadlmpsegI0HoWLBP9bURBFSPZOpQ3FTro98QxRaBnt6ZYP99XLeqnDCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v8 1/6] AMD/IOMMU: obtain IVHD type to use earlier
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>, Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
 <d5f76461-70d2-fc59-2213-99a093e3b57f@suse.com>
 <932476cb-9667-efaa-65e9-7dc4baa3dc7c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <315e4a37-4f70-03c1-e4c7-b28ffa8bcf12@suse.com>
Date: Wed, 20 Oct 2021 08:58:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <932476cb-9667-efaa-65e9-7dc4baa3dc7c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 788aadfd-5710-4e12-e8fa-08d9939709d5
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335E142D9FF78B0320250C5B3BE9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4jgK8jwDBa1DT9KhIrMibLAojsn/lkCg/xyXpYu7P7XWA7fHtSR58wKO3+/Y7eppVKSWYOvti6HeyYm9X2Ncb18NEOgIPJwbVVz6kT9YyJvOADpajB1L4vm/bsAWlhR/2Fj6bdDtv1zWej2oODo3QVHvmaacLlZI04cFyjRkjlKa+P7lWjs6JCxvOCJxdTkELIxQCRth1j5/2swQoGFaGaofgKDvuALzwZ/RgmhVzdhpZZEFndHhQ/KEq4LETFpdsFBXgNeJFdzdSc/bdmGY7cou3RxGqYWs1QVFxiI61h4Vz7XAWziezXoAaBVdfAymJK2xEjKZuLD3l1ri1gEDzhE2ZdAkc7rNKRfYVxBCBe63XrzD8dyJXanrIwMKpa1d4yvihia0ZpAOjT9Ph0uSi6r+GvNxrsPoITsGkcdknr40toy4uaX6RsInsyTnSyMa1Ru/HFBxaDOZW+OZ5+x8Mya/qq6C7laH0fO8rXD631X1M7D98hVnZ2ETuNwPt53JV7r5IiijzPT0ihJ3nXPBRm7w22cFfmHr87Lb1ToQnY5khO1S4kojYK7VpRBvUzsYxp54+uVKUpr5DIlMTjm/yGWMUv73NT9dPiSfjJkae6SjmqwDjBeOPjeayvtumsx5am3S6ZDwGBjFZp+WCMEmOFJSIHwm/YT2e1aRhAvzKg/vafgY+LYJ7pE/nx+cl4Qb+WAoP02BFcl/vHsNtMnwVt9Vsa0KOIqBP55bnC9gNF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(5660300002)(86362001)(956004)(31696002)(508600001)(2616005)(4326008)(2906002)(6486002)(54906003)(8676002)(186003)(36756003)(8936002)(26005)(31686004)(53546011)(66946007)(66476007)(83380400001)(66556008)(16576012)(38100700002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QWZQcMywP2FJcuM/23G2EPaPh/+7C/Au0KBq7tp6+510ysftwOwMRYP3EoxM?=
 =?us-ascii?Q?KoC9r2KcQ0Pop2IwXJd3e4xhJVd714rkOAHiECQzsQC3VNTk0NWGRDejoVwZ?=
 =?us-ascii?Q?PNuCjX5CjMOuDK/vN2YxJv6GLBmJOj+i20u1pkE8h0Fz3znGotqrsDaFh2D6?=
 =?us-ascii?Q?8fqtZ4aakYSBcUnCfSNS+HEBTUtCJwLELaar6f78anJUBFKqwBVluS+UZnDF?=
 =?us-ascii?Q?DcJGGfXQ+oRQh26hrjsXzHDmbKSPkeVLLphb1rPN03NBRjrMvjHd2jHOKCX4?=
 =?us-ascii?Q?LL2jGuQNfqnGSAwxK53RQPyQE2bcvi6RGR9GHGKRCasep2qB779z2zAdHLoA?=
 =?us-ascii?Q?Nt0oB5mz8GeK+VzJLNqDIU+H1GhqSCn1XY0dMH+cn+Y3Y+FCF5ZH039Gy5tA?=
 =?us-ascii?Q?pWwfV4zWEMJG4XusNr2LE/asOYxmtVIAo1Bmc89st4gLjuzevGGFaOM16wAq?=
 =?us-ascii?Q?TZ8gaEGMTqE1unXe3VJAjpWcttH9v2POb7v9zy/Ij5ZLGVMSEkdIPhFEldW0?=
 =?us-ascii?Q?gm75SM7Nm3LGxO5xI5Y/ahxrflRKbHy7xA7gvNHr0Ji1KvipVKxwvDbWX+kI?=
 =?us-ascii?Q?YamYhfBI7GZufhnaQHSBmumHouyvlwo40z+51DF8Ai4qkjTrZK1uxvbBvBZG?=
 =?us-ascii?Q?xRKf+OpkhCIfqvn5M6sBtbL0Ei3GWW//Kzs3qMyIyy1jwK4l6eNGYQ2EvZ5c?=
 =?us-ascii?Q?HF/tcMQRMdY9KjWz7xUNcknP/yZDM2FZlObd0VnaT9oN5Trx0d3FEW76VY7F?=
 =?us-ascii?Q?iaUbbcvSxsIhoyHi8dikIyFydjLmzfrsZzFf/4xesKkA9lXwDBu0+jwgicK2?=
 =?us-ascii?Q?gyLZ2d0RGAaQcY0epOkCdKmixBiBBlrZ1f7bo5of9cll/P6f4w4B0KPwlrA6?=
 =?us-ascii?Q?2yHxn3/Zx2D1lFqjPsDLFsKPCpTjv+kakV87S4qsbAhKR6uQTJhW52+0+3um?=
 =?us-ascii?Q?nu9kDQS3+DRGimIAqGfovZ0HaBVsQqh+C3irhjaPRhlBADRLYrwmd/11ySXi?=
 =?us-ascii?Q?Z8eywbL6PURhFX6SZsaZmbg8ALV9oUBzH8EhUy9gLFJPnW7gmy7ONssCCVJR?=
 =?us-ascii?Q?WjdTcVWcs6FfuZGhgmcKqhBHpXpl/+cYmixJ4Yc5RY/AkO7NRE3j+TZACF4z?=
 =?us-ascii?Q?6iIjkotXX2NV0jskbnCUYGl7UMXvk2Lu6j+Lb+LsWmgtltocVyq+ubzSRzCT?=
 =?us-ascii?Q?O/YmP8z4DZrUAf67/qnoYvEiNkclSEGQ/Gjum8u/pl+kVpGh4Yhkd5Yi5mgz?=
 =?us-ascii?Q?N6GuYwnTqTMzuWghF8CGZjf+PMZpEdWcUK0mDKdmtVeRU4N1etE6UTQ4HbIg?=
 =?us-ascii?Q?pTjPyaL4Z1kGPZOQnAUmkSi0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788aadfd-5710-4e12-e8fa-08d9939709d5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 06:58:36.5953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 20.10.2021 01:34, Andrew Cooper wrote:
> On 22/09/2021 15:36, Jan Beulich wrote:
>> Doing this in amd_iommu_prepare() is too late for it, in particular, to
>> be used in amd_iommu_detect_one_acpi(), as a subsequent change will want
>> to do. Moving it immediately ahead of amd_iommu_detect_acpi() is
>> (luckily) pretty simple, (pretty importantly) without breaking
>> amd_iommu_prepare()'s logic to prevent multiple processing.
>>
>> This involves moving table checksumming, as
>> amd_iommu_get_supported_ivhd_type() ->  get_supported_ivhd_type() will
>> now be invoked before amd_iommu_detect_acpi()  -> detect_iommu_acpi(). I=
n
>> the course of doing so stop open-coding acpi_tb_checksum(), seeing that
>> we have other uses of this originally ACPI-private function elsewhere in
>> the tree.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I'm afraid this breaks booting on Skylake Server.=C2=A0 Yes, really - I
> didn't believe the bisection at first either.
>=20
> From a bit of debugging, I've found:
>=20
> (XEN) *** acpi_dmar_init() =3D> -19
> (XEN) *** amd_iommu_get_supported_ivhd_type() =3D> -19
>=20
> So VT-d is disabled in firmware.=C2=A0 Oops, but something we should cope=
 with.

I wanted to say that I definitely did test this (for a long, long
time) on Intel systems, but clearly not on one like this. I'm sure
though that I did test on IOMMU-less Intel systems, so I'm still a
bit puzzled.

> Then we fall into acpi_ivrs_init(), and take the new-in-this-patch early
> exit with -ENOENT too.
>=20
> It turns out ...
>=20
>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -179,9 +179,17 @@ static int __must_check amd_iommu_setup_
>> =20
>>  int __init acpi_ivrs_init(void)
>>  {
>> +    int rc;
>> +
>>      if ( !iommu_enable && !iommu_intremap )
>>          return 0;
>> =20
>> +    rc =3D amd_iommu_get_supported_ivhd_type();
>> +    if ( rc < 0 )
>> +        return rc;
>> +    BUG_ON(!rc);
>> +    ivhd_type =3D rc;
>> +
>>      if ( (amd_iommu_detect_acpi() !=3D0) || (iommu_found() =3D=3D 0) )
>>      {
>>          iommu_intremap =3D iommu_intremap_off;
>>
>=20
> ... we're relying on this path (now skipped) to set iommu_intremap away
> from iommu_intremap_full in the "no IOMMU anywhere to be found" case.
>=20
> This explains why I occasionally during failure get spew about:
>=20
> (XEN) CPU0: No irq handler for vector 7a (IRQ -2147483648, LAPIC)
> [=C2=A0=C2=A0 17.117518] xhci_hcd 0000:00:14.0: Error while assigning dev=
ice slot ID
> [=C2=A0=C2=A0 17.121114] xhci_hcd 0000:00:14.0: Max number of devices thi=
s xHCI
> host supports is 64.
> [=C2=A0=C2=A0 17.125198] usb usb1-port2: couldn't allocate usb_device
> [=C2=A0 248.317462] INFO: task kworker/u32:0:7 blocked for more than 120 =
seconds.
>=20
> and eventually (gone 400s) get dumped in a dracut shell.
>=20
> Booting with an explicit iommu=3Dno-intremap, which clobbers
> iommu_intremap during cmdline parsing, recovers the system.
>=20
> This variable controls a whole lot of magic with interrupt handling.=C2=
=A0 It
> should default to 0, not 2, and only become nonzero when an IOMMU is
> properly established.=C2=A0 It also shouldn't be serving double duty as "=
what
> the user wants" ahead of determining the system capabilities.

This would probably be too large a change at this point in time;
I'll see whether I can find something less intrusive. Unless of
course there's a patch already on xen-devel, which I didn't get
to read yet.

> And not to open another can of worms, but our entire way of working
> explodes if there are devices on the system not covered by an IOMMU.

I wouldn't be surprised, but is this something we have to expect
on non-broken systems? (I do know of broken systems giving the
appearance of uncovered devices by lacking suitable include-all
DRHD entries.)

Jan


