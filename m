Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE74FF916
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 16:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304192.518785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nee8o-0007mg-8J; Wed, 13 Apr 2022 14:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304192.518785; Wed, 13 Apr 2022 14:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nee8o-0007jx-42; Wed, 13 Apr 2022 14:38:42 +0000
Received: by outflank-mailman (input) for mailman id 304192;
 Wed, 13 Apr 2022 14:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nee8m-0007jp-Mv
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 14:38:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68525647-bb37-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 16:38:39 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-jwi7R8wOMWa-dvOawoAiEg-1; Wed, 13 Apr 2022 16:38:38 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DBBPR04MB7513.eurprd04.prod.outlook.com (2603:10a6:10:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 13 Apr
 2022 14:38:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Wed, 13 Apr 2022
 14:38:36 +0000
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
X-Inumbo-ID: 68525647-bb37-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649860719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eSVIiK33FVoBMHHZevdik4y2mlGqmiAwgIYEYpixucA=;
	b=Ybj2GT/GTGJRX/BAE8CiavauchhZd7mzmPkSzgRliEiCKtzarXTjPNalJ5GJHV/PFepWVY
	Mni9DMzl0pb37htsZQNb2anjpO8UQ0uW/ODb7rEAPBLP/ojMFoAL/ziVYd/8LdhfL0Qe1j
	OzTdGAN/FU0iFL+o56b0c2/+Dot/cUc=
X-MC-Unique: jwi7R8wOMWa-dvOawoAiEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNaPrV99O7JNY+hqAKwXJ6d6MWL9mcqHakmcRh8LUVySHl70FcwTOcCq7VETixrOqz6nwCr8g73G8QchR/Lw775TopqCxQuzLWQRPP4XEi/YrO01n6IaaoxDN9n1z79OmMauGT1FbnQg6kSrcL2jFuEesVRZWy4TsQ/o+KTPmhhjuPn0MGwxDF6dStxVlsOwAZfMbOa4uP371VVTIbJ1Sst7n9YV6AyBUS2LC0WLR4erYqE5ewS+KA+C4Y3aEeOUU3u+WqGwK9Fe9YcW96a1+8BQaddHDf1G4s+R+yuNttaoG5vJJQ0XOCt6Q7G49ac8lKP6DfcyI9EOWDhClFkUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNqWMVK/EfeWBO9+j68KQ/QnC6HF84wcYB2Emgq32gI=;
 b=eEjFbbiGS24Op3Gw0L3Dihgp6TZrxusZEJWVa7IdvoOsFcFXJh2wNO8+Ur82SE7RMA0NCjWg7mCwGMdtSpNSgT3PBiJe51LYlYOAT9j5wdNDqg2uhVMcfFFqAL1S8E9IsbTB2a4wfp9Qqab8or32QBfFWF8i+YRQ54xGhNc0GE8q4V6ngq2EPUTeykGmji4n4deV5nqz3K4vUuCWmijq2MyMgXT4V0Gyg3FXZbuAeJVGqsIEffPOBtD6TgEhMJKRajc1N3vsGP/j+VPx+ctmiaxAd65jI+RLtdGuQtVEQbDy3bNMjn9TUjy2QGnWOVWp6UKy+HFOfFK9vNtoHvbxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c750104-c947-7eb2-15a2-b67dd760f7c9@suse.com>
Date: Wed, 13 Apr 2022 16:38:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
 <6F9FAAD4-59FF-4D52-B08D-13E3920B3925@arm.com>
 <YlbW9dKU8MEeHlfz@Air-de-Roger>
 <578D3D3C-AF6F-467E-9A9E-269220B5CCDB@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <578D3D3C-AF6F-467E-9A9E-269220B5CCDB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0192.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::8) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21b23fef-8ad2-46e6-a924-08da1d5b4ace
X-MS-TrafficTypeDiagnostic: DBBPR04MB7513:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7513DA2BDBEAF7A5077314AAB3EC9@DBBPR04MB7513.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hm9E+2Poc6VdisE7Qi/t9jkE7dtKpkDKcL5n2PwYRYi1UoFwSuKLf+Nb8qqP+ErgRDKNgi4YcYh5adlkNVjUiU1ngOhScANhPitnSON9dU7A+mr5gipqvLzVbO9VzqsMTm7kaaDVZm7NVSV2p+8g1qe0bNd2g3SlV6SRRjAsNy0msfptSnfUXnjQEiDKrZYStyua1qzI4DeOq/qp/NoHdE0J+g8m5zBi8XFHCmtw0PINTlUKlRes4+N0b1X3y0UwXqal4YT0b93TRROYRNqVnWe50MlQv9eDNHIRC/B76c0o8G5kdBIJ/tEUOCC5O1hZz9BrUyQv7tZ1LzSYiKkKXx5DtIn8Oa2pazotUVI5dMP6mfHCdTF7qnSx+I4oEN/SSW96edO6KoorSy8hX+44DLZxYC8jHu76NrinugfFFWqoJFWx5LGDAhBpSonEU7ajZQy44sSk8auO1OWq1B3SY/I19MSUJvUUsLfdHuFgIflqivDXJsp/78XeGJmyj8FOEmNWyPBm4aZZdCEbUQxUFEkumHvMy1ADOV/ANkvN6c5NPuZ6IkVPXk0L2t4afL9RYTHGoPSF5XhY+ewAgrDOjVmGIgMgUwmHb7iwSWfVvzU2moKPXvjvx043UWghDYb3Jp6wKy4+s2aBJInjl5HAYpG+U0cihNbHvAErOsRjDy7MlI2iKM5yrXTRQ2c2q53gl69F0RYiZGBSK/Y5L3+1VPwOBBYZlD3WBauwezx5RQevYBvq8z/RJKBOXOhffnxU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(5660300002)(508600001)(8676002)(2616005)(4326008)(6506007)(6666004)(53546011)(2906002)(86362001)(6512007)(36756003)(316002)(31696002)(38100700002)(83380400001)(66556008)(31686004)(186003)(26005)(66946007)(6916009)(66476007)(54906003)(7416002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i/GxVvrumSggEItcA62ZHXz6mUIKDq0y6mtCOZiWCFb+Ue6BlVjBl/rm21va?=
 =?us-ascii?Q?/SzNnNrhO219iFNS+pjj7tRyuK4fbtU0ZY/yMwC5dvwz22Sxwr/fRqhGQjYV?=
 =?us-ascii?Q?f0rQ8vcz0I/cy6UM/CebczUjsjUmyyok3Wy5GM2mj4juOzLmraZcvPmpv1ed?=
 =?us-ascii?Q?An+SRLu5o4cdwrKi6UABMgC0g5ENy4nJBy0qnR5cyGkqLSq6y0C9gFpJAMiy?=
 =?us-ascii?Q?aWxww6FluBOG002qwxLam41A5+so+u1EjM7BerytF/gm3Y45zeV5EZUUT0Xr?=
 =?us-ascii?Q?/bvQgmYYYemo8uMQVr4F7VEmm43VPswRXYE8H6cRvtvV6IIsYIftBaWTiTK0?=
 =?us-ascii?Q?qGaD3zDMWgqSiFQ9LCwdaAewGXshpFNJJe+CyKstxuI4eAyLYe+PlFymoIvh?=
 =?us-ascii?Q?BkuVk/vB0OXw/9QYQ98v8sHbKvOeNhqv0sn1LuwwiZ9Svd6wsAnbbvd6TnXN?=
 =?us-ascii?Q?lei5+i9Newupk4CQ8onarweNcJJ0pOfc+9wMkee1IMDS4wr7XT1amiFkXBGD?=
 =?us-ascii?Q?qUUt+Ik51p2ARpAjlEM6/+8FeR0poVwmqKJFtpvcFsT+RQfYlN0B4dqyzru2?=
 =?us-ascii?Q?aLZ3TLRf4JFxPV4clXhXXngyU+hsqQMakb6njV3niQaFmU+T9qFJ9qp/TPAY?=
 =?us-ascii?Q?25fqxR56q80i0QUKX7nGWyPe7akjRue4qWA24drjfkSJHjZDm0/GZyzKzKAu?=
 =?us-ascii?Q?FLpht9EJSlsoQQ+qz/xQXhDcRsr/SimZ1xQNzVCTZISjRrvVmzZ64T47Ue3b?=
 =?us-ascii?Q?ohQq9kiyyvSTx4x2VP4MqbP7iDyQpRrjBM8KFXxBy/NtA//HqFICcNs7fmHZ?=
 =?us-ascii?Q?mscJid0pqU255f+kUdRK9lbQaVxpjKjsS8qDIVe2FY3fDN2vKA3q7lInkKqn?=
 =?us-ascii?Q?BUkmitlTvwpYi9GVbC6H+H/ih8EsMwkRgCK9uj77Yc+gZl+gzhNYgwFpksym?=
 =?us-ascii?Q?vJcb/jPGuz8S0tiwQfG012/McYs6IdgqeZ22jJfL4ajpHUuEM+25Xd5bbnJR?=
 =?us-ascii?Q?Yw7ntSbptuQT9JYN0k8DrmVD1JhSHvQ2mHr6DCCv5UFwdc0V+NAzsnJksA61?=
 =?us-ascii?Q?NsUNe+1gx5FuNne3UAGelXGERium4RnTfh4lNwaZomMwLFI8LXmIokMWjPNC?=
 =?us-ascii?Q?xtJ7ErEhwclIUP6Lg4wK8RTGkrLClBPDOQJga30pK4gZ6XVt+7VJEDxxzjjS?=
 =?us-ascii?Q?VcKbyjsCMP3fXZahG3cZW9+YUrCD8sO6IApXxvoQ0YsvlVGGgDznqRVxoNG0?=
 =?us-ascii?Q?7W4MfjGd3p7TYg/620g7CJTveSEUtE7tv5EjKF0eUq10axnZ7PzU7xSeDGAP?=
 =?us-ascii?Q?FyiV7ok9MZWS8/8NCuid9s2Xp/F3pd8EwkkRWDHt+SrJzk+vj7Ou76EnuQaO?=
 =?us-ascii?Q?PPtiTlRQnBbhdyQ/N6Uhs7qPzRuhR8xpBPCy9BOJXYE2plDU9k+YTboO2KaP?=
 =?us-ascii?Q?79a+3yf7LU4PQ9rwGmbRFl559HeOxBZSU2cIA8YjL5xn5WEol4k2QmhqKC0l?=
 =?us-ascii?Q?LlmNnF8UII07Gq/DlqiKwHTeFb6yjeQ/2LFjg0aiDThM543ldU9LT+rL3XR6?=
 =?us-ascii?Q?SjZgixzfLpDVOGfIx0bVGz65O7+KvtBkSetCnQJ6BsaNPUJzOgmUA773g0WW?=
 =?us-ascii?Q?8xl8EE5D4bi7Pzw3/4l6KYSkrUcdLXd4ZMwWX7Q0yQatbw7Xwen0ftMHgTnX?=
 =?us-ascii?Q?dWDhPYR4czlawWr5JCJPUvoDgrWldE/auXwrjHqKOudXXNmkhx+lxo7MCRWV?=
 =?us-ascii?Q?V8lKNWgyCw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b23fef-8ad2-46e6-a924-08da1d5b4ace
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 14:38:36.2039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukjA/yDe1rLNKyFOU4BLqFltMxKV+ipQoK9yUvaS1X/4/g8emezPz4EiMPpgclKvP4JfN2w8baCiwwo/E+7j6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7513

On 13.04.2022 16:13, Bertrand Marquis wrote:
>> On 13 Apr 2022, at 14:58, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>> On Wed, Apr 13, 2022 at 01:48:14PM +0000, Bertrand Marquis wrote:
>>>> On 11 Apr 2022, at 10:40, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> There's no good reason to use these when we already have a pci_sbdf_t
>>>> type object available. This extends to the use of PCI_BUS() in
>>>> pci_ecam_map_bus() as well.
>>>>
>>>> No change to generated code (with gcc11 at least, and I have to admit
>>>> that I didn't expect compilers to necessarily be able to spot the
>>>> optimization potential on the original code).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Note that the Arm changes are "blind": I haven't been able to spot a w=
ay
>>>> to at least compile test the changes there; the code looks to be
>>>> entirely dead.

Note this remark.

>>>> --- a/xen/arch/arm/pci/ecam.c
>>>> +++ b/xen/arch/arm/pci/ecam.c
>>>> @@ -28,8 +28,7 @@ void __iomem *pci_ecam_map_bus(struct pc
>>>>        container_of(bridge->ops, const struct pci_ecam_ops, pci_ops);
>>>>    unsigned int devfn_shift =3D ops->bus_shift - 8;
>>>>    void __iomem *base;
>>>> -
>>>> -    unsigned int busn =3D PCI_BUS(sbdf.bdf);
>>>> +    unsigned int busn =3D sbdf.bus;
>>>>
>>>>    if ( busn < cfg->busn_start || busn > cfg->busn_end )
>>>>        return NULL;
>>>> @@ -37,7 +36,7 @@ void __iomem *pci_ecam_map_bus(struct pc
>>>>    busn -=3D cfg->busn_start;
>>>>    base =3D cfg->win + (busn << ops->bus_shift);
>>>>
>>>> -    return base + (PCI_DEVFN2(sbdf.bdf) << devfn_shift) + where;
>>>> +    return base + (sbdf.df << devfn_shift) + where;
>>>
>>> I think this should be sbdf.bdf instead (typo you removed the b).
>>
>> I don't think so, notice PCI_DEVFN2(sbdf.bdf) which is extracting the
>> devfn from sbdf.bdf. That's not needed, as you can just get the devfn
>> directly from sbdf.df.
>>
>> Or else the original code is wrong, and the PCI_DEVFN2 shouldn't be
>> there.
>=20
> There is not df field in the sbdf structure so it should be devfn instead=
.

Yes indeed, thanks for noticing. But really (see the remark further up)
this is what happens if code in the tree can't even be built-tested.

Jan


