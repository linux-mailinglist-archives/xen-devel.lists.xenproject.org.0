Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E3B763673
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 14:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570445.892210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOdkg-0006iZ-K5; Wed, 26 Jul 2023 12:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570445.892210; Wed, 26 Jul 2023 12:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOdkg-0006gW-Gy; Wed, 26 Jul 2023 12:36:26 +0000
Received: by outflank-mailman (input) for mailman id 570445;
 Wed, 26 Jul 2023 12:36:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOdkf-0006gQ-Af
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 12:36:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f1f1f8-2bb1-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 14:36:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 12:36:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 12:36:20 +0000
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
X-Inumbo-ID: 06f1f1f8-2bb1-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0RDJiCHeHwYJwDa0mVciueyIzL4LEYfcOFUgCXt4iwYA4sTVj7RAU9fmAqLxhpAEf1nIpIfdxM3k9Fh63iHgRfLVgbi7MxuL+Mm/s1gimlGOYrZCDq0TLHxHZ5dBJFw7XGA0ofYvO96fc75MaPLLMWUZo6VpfY2I/Y+l/izD8s5XiBODIgUs5gArYg1UF6Z8kDlzkBiQlegWstipwSLubBkRPHBM1G8F0+jS4v+VoekKTbygdxSOWNfow2yPzphgFt8TrCazaV86GSk8q6/woS32ehlOWJ/aUDxbno+bLQHpQwRQQts88OewZY++sTpNYavj9a9a4+nqKBt55Beog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Odh/OGpsVFDuLFtbWW/1+v106jR6zhabbrs75Pm7Xn4=;
 b=OxK5a+wCKhXYRcjiosFo6vt7udX6RrH8x8iBQ69iJ8dmzQoh940SNZb+pfWJmT7jHZZHhnl8sql1OAG6kj8PpNuDUcpBnakpIuKNgUDb4F5vJSlm53U/UE2os/LT4P2y8PoVEElNOiSE7SeBEKnKMEDhy7oAKzfLodMNwT6NJoIO3444Ka7MlMRg8TParNJtAOOeRjOUkg7iP7B2ny6Zks66YksppTJv9BLQkSc7bu8KuQIkthIAKqSdnTw1vRshOi31/AgeHwhj6fT1wsRPkBvFH6fUR4VS1ecfD2LFbwtXUqkPCNa2UHNWJCCIDLpERT5p0EWUfRTew+0wqQwRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Odh/OGpsVFDuLFtbWW/1+v106jR6zhabbrs75Pm7Xn4=;
 b=Lmg1pslkLuXAiyB34O7j5zXzaBhD2CKtZP2FbKpQgZ/H1sTOZUhjHkO1Whamswwt8HjmiIh2YD2rayDyxr+mzY6PuIKWLogxMvRG4cp3E7H4SnXzDZW+ZrxniSit7doG1Eq9vSUZW+XWtzEalUsLLr3xsgQDpal/ZFgLDs741gQ06vEqovlPPlrUHDPqZDzf+TV5zqS8qKY2xGnuKQrHmNiMIJ40f560YZbsozrSIoxeKcAUlF4uarCWH9KflZ5YclFPc7W8ReoHt9vGveLbULfUszhOdYeNl5rIIz4iT5uqruco+ggYMHl+oQCwXWdApkF0meLZLFaqYZ9Yble3HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5292942c-17b4-6b7b-a1a9-fdec87418379@suse.com>
Date: Wed, 26 Jul 2023 14:36:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] vpci: add permission checks to map_range()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20230724153741.42374-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230724153741.42374-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 379631f7-719e-4fe5-3a7b-08db8dd4e9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IsGWj/bJ8Zs5dpOQFU1Ns6P+s46LUqZnMdAqzhi+EU6Pr0zFwQd3ZDZ+aLVOd+Wtw5IZR3wqApyCdFDlLagneT/5TnErGyoKagZq6u8sXp1nxWynKFXf1XlHVt1qcTEOZGgSMUGSKkPUQFHc/sG7ee5gEBmowTlBFgPo7NQTpMC/avOXeex5DDPH/aAl1djgm7OIx64RNZy+e7INrMQKMQLX/ORviYrj5AVa80Ey/y+BOwpUb1igr91XTguT6GfCIOT7GYMBuHibA/A9kLN7VHnfXSJ+LqFNJ2ctwVToOSzX/6ae8xCjPMVEjv8c+eSbh/cso3n0O+EqWJZj/OQRqotdt8/rmJYsS+gCGYLIkFUxOXkyiYO1vXlCoyDAS6VW9m/LuwjATxzZ8xe5xrGA0sPgnBDRrZe3b2ugOrOhEQUU2mo2+vCuDY1jcO6i+RU0o5RS+5eA6va88RjK38tCuZwg2ZpoSPRQdOLHkZCgQgTSvYBD/tadAOtmNZ55vDydOTBM2ueBX9/YTJwB5VAdFF5XURCFLKcSE9WMsM5eOZCrEY5YsG72VJsY0m2UAAh8wsT0d5Srd4gtKYAiPVqgBUVIMRKfkYI4nIheALt6FrJyA6hyiVMxUpQm65DqEoxNJPbVI1tA9FIT/ddlAJZneA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199021)(86362001)(6512007)(6486002)(6666004)(38100700002)(186003)(83380400001)(36756003)(2616005)(31696002)(6506007)(26005)(53546011)(66556008)(6916009)(66476007)(4326008)(66946007)(2906002)(316002)(5660300002)(41300700001)(8676002)(31686004)(8936002)(478600001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmsxUnJ4WXBlbFB3ZisyU3FzTEFoS21GVk9jblFyZDlidzZqUVVKZVNFbTMz?=
 =?utf-8?B?ZElDV3o2MUUzSS9wWU5oM29oMEF5QWZqTWRkaFdHR3VXc2hvZ3hOaDN1L2kz?=
 =?utf-8?B?VzlaclhuSThSYjlKN0tucnYwelM3cTNDajNOTDVNelU0dDhrczV2d2FEeVBG?=
 =?utf-8?B?UW5hWTZoOHFDQTcwY2I2by9Pa2g0Y2dHOFJTL2RzTE5Rdzd6aXo0TTgzdW1I?=
 =?utf-8?B?b3pvRzRDam5ZK3ZHREZ2K2NlbGJCUWZUVjhGVnRsZ1FsQVY2RVBYQXZPNkJq?=
 =?utf-8?B?UXBYZERvZUdNOGdFR2s2RWJiUEFrZURPRElwTGxZODQ5elQxNDBXbkI0VDdK?=
 =?utf-8?B?TXBMWUx2TXBmVXQ3NFRpaFphKzNkT3ovVHpGWXdpaE1qaGtzM0d3WmIvLzg2?=
 =?utf-8?B?clJVTXBlLzFpTzlqOU11RWJoTnY0YzVYYmhuNHE2Yy9MOXVSbHBHeGkrTTBt?=
 =?utf-8?B?TXV1WnRNNEpnWlIzdUdsYm1VTkZNQjRiYk42ZUtScU9vWER1SWFNanI4a20v?=
 =?utf-8?B?T2xpbUxZNU04WWdZdHUrclEwOHZ3NkV3V3RuckRqakxDR1pyNmY2OXYxcHZX?=
 =?utf-8?B?bnBwSTlOY2UvZlBVVW5pWkdjZlcrRmJSMEk0ZW44TElHanFCWDZ1a2ZqRk9n?=
 =?utf-8?B?S1ZJV2JIbHNDYURBY0Q4Z0w4RTdKSU9qUzkwM3hGejB3ZWNnQTlNTTNkRWhG?=
 =?utf-8?B?bS9YZDBuNm5PRlQrTXFhaHZNdGxNaXY1c3RXYzk2SllhTTdZMStLbEo3K29X?=
 =?utf-8?B?VWZlbHhidjZ2WmkyMzhOOWVPZ3I4cFltSm5JVHVFU01mNUkxWXVDY2tvNk5Q?=
 =?utf-8?B?VXA5UjNBTWNmV2ZVdzEyT0plKzFpcE9nc0JRZXQ0Y2pLSWxvREp4VzV2dERo?=
 =?utf-8?B?UnZqZUR0bVZGV2k2T0liMEdsVTgwaFF5M1daMm15OHg1ZzZ5YlR4Yzk5Z2gw?=
 =?utf-8?B?eFY4aVBEZnMxQVRlMk9BQWEyUWZwYjI3K2pSZ2t1MTRXZTljL05scThHbTBY?=
 =?utf-8?B?Z2thaFFQY0JRQy9LU3RneVh5VWhabmg1c1JlYk0vWStCeGlNME9KTFJDdFN5?=
 =?utf-8?B?RkR2NmFsenpqVUxHaXBUcXhDVjZSb1Z0OHdxV2FvMVRQY0FPd1BhOWFWbkMr?=
 =?utf-8?B?bUxVeFc1SktVdmhZdjBldnI4RGN0SEFZdHFtN3pDQnM3YXBmT3Q5VjRjbkty?=
 =?utf-8?B?NHk0a3ZBdkk5OUlhSHV4YnBpVWo4cDBjQWlnblVZajdzb1VIVFJuWXNIUzdR?=
 =?utf-8?B?Rk1zZDVIaGlDZXY5QWF5RDNBVnpGVGNXaFVmSmszeWNycHh0L3NRSDMrSVVp?=
 =?utf-8?B?cmpQQTVjRjBHSjN5ck1vS2VTcnh5NHdsdlUvYzVMZUJYYXQxbWh1ajNHVWR5?=
 =?utf-8?B?SEtkbGFlWTVlMGFkREZxVUFDelJZOXl4OFBINzlVMVZhd2xGQWxFRnlJTFF5?=
 =?utf-8?B?akxta0lEbkoreFdQL2NDbWpLYWlRRDU4Um1ySG00RnBnamdzNGZMOVRhNmxF?=
 =?utf-8?B?ZkVEZXNaeWhYU21obTd5K2NEd2lzZ0s5dEJJeGJIdWU5eDVWMzJIVW1iZGgz?=
 =?utf-8?B?TC8rKzhiZU1xZ21aNk9Ib2pZVnYvVUloOU0wSFNna05mNytRTWI3a0NaNkR1?=
 =?utf-8?B?N1lzdnViRUt5dk5ZVTFHTFZ3ZDg4ZTJ0OU9ucTFncE1LWEZZMzcvMHhLQXRQ?=
 =?utf-8?B?S2xnc0dTenJVZ0hoQXdtWThVWmlMNHhOU0VVL3oxNGxNeDZKUVM5bDlsZVYw?=
 =?utf-8?B?aTVzL05ZYXVmQmlMbTQ4cWNSVFNUMG9SN3paTEdCTXUxVCtqOU1XeEdFRmZB?=
 =?utf-8?B?OUZiY2NpeEdGVHhNSDhoSGYxOHhGekJoR1hIbGJPRDF4QW5XOEdPbjllQzc5?=
 =?utf-8?B?akc3ejQ5TkNUeFRmZmgvSktzb3c1dmlOcnN6dlBLcTBVRWZsb1F0MTk3T3Fr?=
 =?utf-8?B?NzlDZ091S0pWcy9vdzZtMEFDUFNVcm0yS1lxeTBmZ05qODJzQ0JiclhzVjJX?=
 =?utf-8?B?R1JWQldUZUFBSFBYWWw2c041VDk0SHFKN0d6VGVqbzJBSEFuYTFmRE9ybEpU?=
 =?utf-8?B?bFF4Q2Voc2Q4Q3BGYkdaZFhNOExub0Y2RGlWemRFZ1oxKytucE50WU4rc1cw?=
 =?utf-8?Q?hna5tSwMojWjnC+UfmvKIaY1q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379631f7-719e-4fe5-3a7b-08db8dd4e9f7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 12:36:20.2430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NX+71NretOGB5oShJoeoP82h82ocfAs1eJXO+X7Vdh1VfFM78JfqG4EmK1m0Selsbj3PzsfaASV0Ij0t4IODnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855

On 24.07.2023 17:37, Roger Pau Monne wrote:
> @@ -1184,6 +1177,20 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
>  
>      printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
>  
> +    if ( is_hardware_domain(d) )
> +    {
> +        /*
> +         * Setup permissions early so that calls to add MMIO regions to the
> +         * p2m as part of vPCI setup don't fail due to permission checks.
> +         */
> +        rc = dom0_setup_permissions(d);
> +        if ( rc )
> +        {
> +            printk("%pd unable to setup permissions: %d\n", d, rc);

The switch from panic() to printk() may want mentioning in the description
as deliberate. (The usefulness of %pd here is debatable, as it can't be
other than Dom0. But I don't mind.)

> @@ -43,6 +46,21 @@ static int cf_check map_range(
>      {
>          unsigned long size = e - s + 1;
>  
> +        if ( !iomem_access_permitted(map->d, s, e) )
> +        {
> +            gprintk(XENLOG_WARNING,
> +                    "%pd denied access to MMIO range [%#lx, %#lx]\n", s, e);

This doesn't look like it would compile. Also gprintk() logs current,
which I'm not sure is generally applicable here. IOW I think it wants
to be

            printk(XENLOG_G_WARNING,
                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
                   map->d, s, e);

Same for the other log message then.

Another Dom0 related concern can probably be put off until we actually
get a report of this failing (which may be more likely because of the
XSM check below): The function being used as a callback passed to
rangeset_consume_ranges(), failure may affect just a single BAR, while
the incoming range may cover multiple of them in one go. Depending on
what functionality such a BAR covers, the device may remain usable (a
typical example of what I'm thinking of is a multi-function device
having serial and/or parallel port on it, which are fine to be driven
via I/O ports even if driving via MMIO is possible [and would likely
be more efficient]). Of course, to allow some MMIO bars to be used
while prohibiting use of some others, further trickery may be needed.
But not exposing the device to Dom0 at all doesn't seem very nice in
such a case.

Jan

> +            return -EPERM;
> +        }
> +
> +        rc = xsm_iomem_mapping(XSM_HOOK, map->d, s, e, map->map);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_WARNING,
> +                    "%pd XSM denied access to MMIO range [%#lx, %#lx]\n", s, e);
> +            return rc;
> +        }
> +
>          /*
>           * ARM TODOs:
>           * - On ARM whether the memory is prefetchable or not should be passed


