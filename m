Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE84346A5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 10:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213669.371960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6mi-0000Lc-Sw; Wed, 20 Oct 2021 08:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213669.371960; Wed, 20 Oct 2021 08:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md6mi-0000JS-PZ; Wed, 20 Oct 2021 08:17:16 +0000
Received: by outflank-mailman (input) for mailman id 213669;
 Wed, 20 Oct 2021 08:17:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1md6mh-0000JI-4p
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 08:17:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20a0a0ce-317e-11ec-8335-12813bfff9fa;
 Wed, 20 Oct 2021 08:17:13 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-jQczLQhLOeKnuQ4PHE6ygQ-1; Wed, 20 Oct 2021 10:17:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 08:17:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 08:17:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:20b:110::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 08:17:09 +0000
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
X-Inumbo-ID: 20a0a0ce-317e-11ec-8335-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634717832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1A7AAVEkUu3G5VGSzwzXt4dv0FS7fR3pWsAeKGwFrbw=;
	b=KD1BWso656MAQLJum2PgKBJ0gZ9SASzrYbHFie+lda0RGNrVl+QIuzzOmLMyUXhqdfERst
	a1i7BARcx5x8MSKpm3yDouvN1oeM9QbQJEXGd3pAORbezXZ/W7tu87obBTw4ZEldzZlLTo
	qX5Y2+bqbZ1DVCvj1m/e6kmY+zOoOjg=
X-MC-Unique: jQczLQhLOeKnuQ4PHE6ygQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLOHohl66XEz6C38AWdog+3QSlh7/zOqw5c/tAsiB7ZrVZx6mAxcoZ5kQ/6wi+NOC4eu+WSy6upei5xKB7RMDB0MnajiVsKC34tVAiWEw2YrPNpgRLywSTOII6kP2rknGYR7vlQOYHlaCpdFHVA8Oe1EA70qP/GWiljtC2Gbk1Izp2cdPmD0rsqHxjR6ubAKR+wqu8sqIzCumG54KHbtXTlbEL1JINVQd7872e1N+ZILcOOfAUEKuOA5xZo1FOj7ikax4ltEVfnjT7/9z4PboDa0t3ELHQ2r8INJocePRCFW3+xRo5qAAr3dIsQ4GVJYepmLKSZpoyEEGQ7rIxOWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZuykuWKCYt+OY/Hy7gp+VtXnNos7YGottIWuVTw06w=;
 b=U2La5K/xYy4gc2EZEGh691bnbuMbfsI3dXfbevj4db8tg982JpN4KcGodKJgX4tH9y/JrdvVnqImVFxJkZCJtt65oWbFpmF6ZjOs3aoBcTLrRdhGdhI3ZUdWmisKTa0ibwOquOgSSnVvcz1OyqNpr5p7bl8xkBA6JMph+XOwwPcb3Tvh9zyIDlyQbuWfmJ8YTrfUl+l529C2A3aJnn0uzX5G5ODJkkVKXynSLjtO3QD53QzBOvkTbEPPcXdlK4xzCAVSRVaZnNwonBawu2Bz5P/xp3Gjn1s/rgRKlAFVBy2MX0+jIL+vQd+jv0uq9ZwUhxGJE9qBlXX7dbhB/imAVw==
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
Message-ID: <d1dcb878-d78f-0565-4a5d-1ad539a0d531@suse.com>
Date: Wed, 20 Oct 2021 10:17:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <932476cb-9667-efaa-65e9-7dc4baa3dc7c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d67fba85-b829-4123-2b0b-08d993a20365
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934368958E9964BF6F1733CB3BE9@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jVHDM6UgK0g5Bx/eW3DbxFyO9yhPea254hGoA80iRpdxgVQYvvKwiJZOU+LWCqLQpRk2o32r6J7PJ1JHVt4LA2y7vjcXJ1SFA1olWO/iA97+FD4hUuSfZtPFSBqe9QtA9w0b8sFVPE3fht36w6YB4vNLDiIFwa1T2mVYfcTAMI1ScUQy9GbcIofxNs+sxq9ruqAQ2B00QOeChaFLzoAeXnZ7X1JdcJp1Bh7bzXVdcBTeBhLWi1oj5KTivY6NKWoCavLcL9/XkOvPejMZ8oi5xId4bKXGXIzF0Lq9v8jziN8nzEuLFZY7ZK3RfN1XbWG00oqcTjqtfM12IVIjLIJnBOM9DE4HZHtHUpbX8tvUX/398j+zgprtQISdrmaoSMZml7wZ8fLMZKSFJX/wn9KDAMbJEiFaOlbLAooBGZWep/J74l9Ksx784fFv8ctQq5ngsWip3wI8GYxTAZFgSXv+/4x8gdxQg7aL+DYgN8tKoM2KlJW7cbJN3R/lX+QdYoc4dufOoUwReF6oL+N4ZuMXb1qMpnExh8Sd3Q2uEfIsDFxmbQAAAdu1jaWUjRPVzFVO4QCGb09U3OZNsCyrJPdXc/4YxzdIYhCzg/gX0cRbikw/sQB4K9kAdbiGzNATSsGT4FOhkmusInWKKOQ5y7lCXfCbvfyx1lO3dmRXjUjxscdMtiGpbmQ0fH3UclVAIGX7DrnWrZvSX4zhdcEV/MYsftorp79w98t6DZUUti40G1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(66556008)(66476007)(8936002)(316002)(2616005)(26005)(38100700002)(186003)(956004)(16576012)(66946007)(8676002)(2906002)(31696002)(31686004)(6916009)(36756003)(4326008)(5660300002)(508600001)(83380400001)(53546011)(54906003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AaPNM3tycuS01p2jJUmJmcnfG3vUZ+GAqKhV57uXpKGV8U60PfOwD6e1K/jE?=
 =?us-ascii?Q?OEgkaK42WAkNXkz/w/Tm7NTF1xCWhfgRl9uW0Ml6oJvrWInoSh9StHFWOVCr?=
 =?us-ascii?Q?EhPu9duv7gZPJZtpHSkZnAwIA1fsEo5x0tG7o8z2aeRgW8yw2kflmsWgDKkQ?=
 =?us-ascii?Q?Zz1HeAYYqkWh8gCRtGdCKQKSZmI9LJv/1e4SGW5BauuXw1NsDm/6UYoKMiQi?=
 =?us-ascii?Q?jB254mzFK7r4JksJCOEAMJj8kg6GskftwXMpYnJUYsLejUal4zVCNHRkzX6T?=
 =?us-ascii?Q?IEu/oiVYqirFkXT3pUvrYak+5CaDX2iZ1DwZRO0rumRLoHF4g35k0CLlARee?=
 =?us-ascii?Q?E63qdufPYVjjshnmAfy3q8c/I6Tl+fBRi7ucnbVb8Btv1sJlXeaAUxCRff72?=
 =?us-ascii?Q?ux8n4GcW2YMVG6Y6Op8yUmr09rD3Ba2iOCze0I3syPF6pIyHRUNCY+MKmDjE?=
 =?us-ascii?Q?bNPkLIXWTVZEVjL7x8ZUS8/NRaA9g8xl6kj5wob5aBqJTu9XUHCW+dYe8usS?=
 =?us-ascii?Q?UYBYGYzcN4MqBfQe65epmCfJaPbHNiRkXdc6D4/DqNPjL1XWFzW4Qo67IPRK?=
 =?us-ascii?Q?N3RMGua/QqcKpFpZZqX1vIx8OzRfhEWMzsgpzn+u1cmG85idwKkwG1vqV8rK?=
 =?us-ascii?Q?WZAO9CcapfGPcJLjg+lWuy1UpEQ2pK8LsTZSsybLs1u1yyDSnuUm7/WTffec?=
 =?us-ascii?Q?BltvUnXayVBHJYuIEX2VYVtpJUS9kx8O40hpIcl76Nz6b//8rDVPVifwrLdB?=
 =?us-ascii?Q?iGVcGLhruSTJ7HIRQ+AxPHbqNoLhRHRFD8YIjW1PskkEuKzklrVHyb3ZKA3S?=
 =?us-ascii?Q?y5ZNi1F48En59RyBPNS2I2OCkNGUhC6JXpZ1V49OyyLnLuBZ1cxxy7zPAVEW?=
 =?us-ascii?Q?nYqRpe8Dr15GFw0iXYsC5hXp5dFc9gyIpjgMPQNN++iTD988MSZ2v4DwFMIM?=
 =?us-ascii?Q?jVrXjqXEUA4RusICM1LbWrR7br/9yE8IJHNeRE45bZL5uCTOxcpkYPm8CL35?=
 =?us-ascii?Q?B6wDH23gANNfKnzWdxQ3N/JTJxFM1FnvMvz9v8UTHsbcA/uWs5i8fTvW1KWg?=
 =?us-ascii?Q?yC66etWmZ3XmglNYiHmLAprXjEANlcY+kb6PA9mjQ/s+QfV8avDk3zVrOtP1?=
 =?us-ascii?Q?HldQZAhwW1vsiY41BTS1KKkuAszqbd50fXclDxmloPWuvRdh0P3avbRU/tD3?=
 =?us-ascii?Q?i7HkwA6qtDnft/LmgmaRGPm1E13pQC4Qi+Ym9KlDM3RI/m8Thm+lMHfoFFJ1?=
 =?us-ascii?Q?z8wCk3d5rEchaRUjIQkUlTfQoo2WahXHwjQY/7KM0QcvuJC5pYybW2OFabea?=
 =?us-ascii?Q?6I5exezkCVz5HqDDv6/ufbRM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67fba85-b829-4123-2b0b-08d993a20365
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:17:10.1532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

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

I'll be able to debug this, as by disabling VT-d on my Skylake I can
repro. But ...

> From a bit of debugging, I've found:
>=20
> (XEN) *** acpi_dmar_init() =3D> -19
> (XEN) *** amd_iommu_get_supported_ivhd_type() =3D> -19
>=20
> So VT-d is disabled in firmware.=C2=A0 Oops, but something we should cope=
 with.
>=20
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

... this picture here looks incomplete, since in iommu_hardware_setup()
we have

    if ( !iommu_enabled )
        iommu_intremap =3D iommu_intremap_off;

which I don't see how it could be bypassed. Booting here fails because
of the AHCI driver not being able to obtain control of the disk, but
checking in a working setup I see it use MSI, which can't possibly be
affected by an early-boot-only wrong setting of iommu_intremap. (I can
easily believe that we have early IO-APIC setup logic going wrong when
this remains mistakenly set.)

What I'd like to avoid though is to add yet another custom writing of
iommu_intremap_off in acpi_ivrs_init(). I'd prefer to find a better
place for it, so I will want to do some debugging first. If all else
fails, the setting should at least be moved into the caller of the
function - after all switching around the order of the
acpi_{dmar,ivrs}_init() calls in acpi_iommu_init() shouldn't have any
negative effect.

Jan

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
>=20
> And not to open another can of worms, but our entire way of working
> explodes if there are devices on the system not covered by an IOMMU.
>=20
> ~Andrew
>=20


