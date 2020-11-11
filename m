Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1F2AF3CE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24921.52418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrHd-0002LT-Ku; Wed, 11 Nov 2020 14:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24921.52418; Wed, 11 Nov 2020 14:39:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrHd-0002L1-HB; Wed, 11 Nov 2020 14:39:37 +0000
Received: by outflank-mailman (input) for mailman id 24921;
 Wed, 11 Nov 2020 14:39:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcrHb-0002Kf-Hb
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:39:35 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13297285-51e0-4aa6-9880-40b15e9b741c;
 Wed, 11 Nov 2020 14:39:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcrHb-0002Kf-Hb
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:39:35 +0000
X-Inumbo-ID: 13297285-51e0-4aa6-9880-40b15e9b741c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 13297285-51e0-4aa6-9880-40b15e9b741c;
	Wed, 11 Nov 2020 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605105573;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sxEWwR0pkrK3UjjVPCFVZMXh4ZKwOjVQmcSyHDFMzCY=;
  b=Hqyms0UkCQLFoRRcJUR04nhMMZ0l2u4r0WIlcNRWSG0H8Ab7ZmFRXm8M
   mh6L20xmgld8QQrYORkxRY4q9Kn7HiyF5S+J5KWdsUGQ6ZNx1Qxqen+Bv
   Iug27Bo/9vQ6SbazfMWyY2DLAVw1aKxA1JFuwY+9AyxHRvDjjT4sATPD3
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KKogBYjuG5u/BkfdO+U4huYaSDyclunV2tfJ1ZnVlLU7v2YxJFuM9bM06lH2wyBgfKjynfzej4
 nXmBuMfVWwv93hw5ODSR9VOC7pOhh0mDfxUoP4T9paSmjz9Mq0BnpKoO3EzGgte/uYt7taNoqB
 pLGokVEW8CFSEAb3PV1S8xAYXb3ydmJ+GS2H0l5NL2wfCKDYKj07iAXFN24o+PFTZ75FV23okG
 y+ycNF69k2uiYhGoJmOzanvrcZQeywXgi38cKLIf1joYf9wf1SqJyhSmX9pusSoiTDL7rD73X5
 TbA=
X-SBRS: None
X-MesageID: 32072412
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="32072412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2MKtt8WpHn2LRCqCIZQAi9sdRoz4hmKdQ9awo1zhcDo1aErovbb0WMzzgFNRLJXriZMz867fUzNIONsfqlNGNyshVs+3PsZZbvsxsoLW8OMv03OPbL0bvnZPUU0cjze+aEOtPbon93vbZuqaTSwqX+VV/lCOs/5L14kbMqRIlU8HnA0U2d43j3XIDUn9hVOiiB1hDCKAPWSVBvAKgDL5dzYspl3D7ZZi8SMDuqRMePPZXfHrV6Knbjizgjs8dK/480T8kN0b1EMW/DxOpIgoN84OM396nXOgyLXezyExXDWzUoZulc4vhLHkQW4QwzU9KLkOkkUVHQ8AurMFwbNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO7TGZgN90SZW5hMpbC3lULCYSmiKnhPVqr/y3SukLA=;
 b=DNRvG7LJgBfkXgV5/ajlOByrRKjMIeySGBe1IUDxtirjsQ+r80e+V1xm7d8epa9ZVOjjsAFhuPnVOp5eLXCfQ2IQJ9zMn9+4/ZYmJpd9kHk3bp/YDAPnCweyFX5zkkGxTfpz6J91pjL3K7oBha1APfvJZEqZTuAIlmLJyH64dvquDm7LSc9bE7t/eCRF9Mm0mpj8D4ctcK1RYSTMWxXHzPr73Fek1P3IBH5yqZdM/JxzmOCqGjwLFVFbEXgj/Noa3pfQ0gIUqBShDRYS0pVkOegZ/9kgQrOojux1hax0kfKvCSFcjKY5enw3kO/I98WHsFhyOaSglZwPQoXaBkyV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO7TGZgN90SZW5hMpbC3lULCYSmiKnhPVqr/y3SukLA=;
 b=J2BO8NLGshPdwl/FgMMkfFE1SRGlg3PPR5SRiwBa5Z6gMoPOjOdOIzXGKfXz7WXycAhIpBwNGVdDQudLsF7AGPYAQtD2Le05qXEO7X8CIZRzppzEzf+/0kR2yOApr9JS6LE8siNxDUwoBbn1p3pmcZxTJIFdEAVKiZype9WSj/M=
Date: Wed, 11 Nov 2020 15:39:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <Rahul.Singh@arm.com>, <Bertrand.Marquis@arm.com>, <julien.grall@arm.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 03/10] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Message-ID: <20201111143924.gxbi5oopfeammgti@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-4-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201109125031.26409-4-andr2000@gmail.com>
X-ClientProxiedBy: LO2P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1def7c-4bb0-48c3-2131-08d8864f987b
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-Microsoft-Antispam-PRVS: <DS7PR03MB554245EACEE1CB7355F6142D8FE80@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1BI6+KEr/MU6bzWh/38buImRZpiVcsIX9e4Q3QMQKzaYaItg3f6MyzbH6MH+C2wwuilTX8KOAJ/3Lajj1U+KKA/j+xUwnN0rbVQ+1xJzuRFI6zFTwreUnUYnsr2oa5otHIFIDURWz3B9NLnEKY6g7aJynWVC+ungfvPO29ksECdy/Coo+YqL638YamqpwvOj4JYRGAFDBGlJ3H1dwon59hPYR6n2mN34ZaRDfjwSa5Vsre9DQoLV9g4cLmZHLyuUuqG+FcyzOkGPBqnyZR2fFaTtgxsP+zbTm5eU84JYaLN7XjviRaGq5y+eRJ6XQn8Y5prTyXn6TfJKxJmGPos0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(136003)(376002)(366004)(39860400002)(33716001)(26005)(9686003)(186003)(66946007)(66476007)(956004)(8676002)(316002)(16526019)(6916009)(8936002)(4326008)(2906002)(86362001)(83380400001)(7416002)(66556008)(6496006)(6486002)(6666004)(478600001)(85182001)(1076003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: EsN2YkxJ0jcrO9EtMVNNVD4n15PRx6EveQxB7sNWDGLwy0BLH9Ep2tuUJnTe7CHKO9RpS1ed8sK1pxAR8zOrv4L41lPpA45+rb3jBFSZ0qttJVsTwzZC5A0+IzX7bp0Y3Ea9/Lr7K/LNK2GNsTu6vfs/sCHOcu6bmKHnSLUQ+vGnfN1bSqbEcVLKDXfYxQL0cKHG0+m55hxAtKynPLUq1TuW16xbO2BbwMRi+ZSAQ1TdAWbA0KxyglrDSo+xqD9Scz6oGOMYg8w62/+VWjuUKSdg7hJnT1p6omDqM4l7uNgj1crAouah1oCe+xBviaWEEMnPQCMmw0QH7nwZRyfRMV1MeKLiJsYCeph3ecYuNTRuGoIbzlKsEYk+Hcpeb9uV2fQJw3+fQh0JPgaGlNAgspR5hmR+n7Kfs0efoTdqUza3iUGNKsbJqmh0BrE4BO48CMnXuGJNh4fC+MDzuzaRFqU3fAg9e5Pc1D1v49QsDzoGT9ExdLeUbW54NjuuPsh2BgufDR1iFjSL4hM8YoBqcny63Adao3aPlot58vtXC+zR/Vzs0Ntr5LX3+IWv0SZsBfEOhTrFuIESHfL9/qap1sVZoliGmc4lm4R733ceZwXJ9Kj/QsDXRicb1uLx3K45PSPBZ4Rp1UXX53Zp6e+VXhzFQ1CYKMWM/LZYSUFyTbQMmdj4DvWJHUfqeP4+OpNwx4OjLoFHhwoHdoQWd3Ikex7g9d6tt8Q2sGFySrlTP0sdHF4YnFjq/TYUs5MWIC6MPAAKu44JO0Kkb2RCLk6D2vIbHA8glOZESVXOXNaiknre4PmUSFDL5p8hO+7qxbvVAUJWn7a16POSK+cKA331RL7x3OEAJoGmfY3u6gVvmGPnl/gT2H2DdS2z7p/dR2tdw116EVxO8GXgiFjzW3EGyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1def7c-4bb0-48c3-2131-08d8864f987b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 14:39:29.3461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqRTw7SptQVVHDLzUpXS2amCfHkcCVJnoLitnsFfexnJLNSEFRY8SCaKII6GqJMGES1njxkQMCdjxYofH4ylRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

On Mon, Nov 09, 2020 at 02:50:24PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> In order vPCI to work it needs all access to PCI configuration space
> access to be synchronized among all entities, e.g. hardware domain and
> guests. For that implement PCI host bridge specific callbacks to
> propelry setup those ranges depending on host bridge implementation.
> 
> This callback is optional and may not be used by non-ECAM host bridges.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/arch/arm/pci/pci-host-common.c  | 16 ++++++++++++++++
>  xen/arch/arm/pci/pci-host-generic.c | 15 +++++++++++++--
>  xen/arch/arm/vpci.c                 | 16 +++++++++++++++-

So this is based on top of another series, maybe it would make sense
to post those together, or else it's hard to get the right context.

>  xen/include/asm-arm/pci.h           |  7 +++++++
>  4 files changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index b011c7eff3c8..b81184d34980 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -219,6 +219,22 @@ struct device *pci_find_host_bridge_device(struct device *dev)
>      }
>      return dt_to_dev(bridge->dt_node);
>  }
> +
> +int pci_host_iterate_bridges(struct domain *d,
> +                             int (*clb)(struct domain *d,
> +                                        struct pci_host_bridge *bridge))
> +{
> +    struct pci_host_bridge *bridge;
> +    int err;
> +
> +    list_for_each_entry( bridge, &pci_host_bridges, node )
> +    {
> +        err = clb(d, bridge);
> +        if ( err )
> +            return err;
> +    }
> +    return 0;
> +}
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
> index 54dd123e95c7..469df3da0116 100644
> --- a/xen/arch/arm/pci/pci-host-generic.c
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -85,12 +85,23 @@ int pci_ecam_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
>      return 0;
>  }
>  
> +static int pci_ecam_register_mmio_handler(struct domain *d,
> +                                          struct pci_host_bridge *bridge,

I think you can also constify bridge here.

Thanks, Roger.

