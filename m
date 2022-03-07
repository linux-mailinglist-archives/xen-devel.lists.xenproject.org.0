Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C7F4D03B1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286224.485650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFtC-0005vk-FV; Mon, 07 Mar 2022 16:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286224.485650; Mon, 07 Mar 2022 16:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFtC-0005t8-Bd; Mon, 07 Mar 2022 16:07:14 +0000
Received: by outflank-mailman (input) for mailman id 286224;
 Mon, 07 Mar 2022 16:07:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRFtA-0005sw-KU
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:07:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3cb7912-9e30-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 17:07:10 +0100 (CET)
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
X-Inumbo-ID: a3cb7912-9e30-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646669230;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Up7HvUx2iJQByKJw1mjpzmOHF1HPvSznlwsC7lOMEoA=;
  b=ZvUZi6QgMAItkRVcBtVinzBfB29GpcfG+nTgS2q4Vrtt0sLwNCBMnIF0
   j7MAiCXJgqdiLeFx419IClIVXflw4WQzJxkvSeFYUmxatDi7f5L0iCEOf
   UMd2rkcKuPN4zghdxja11qy8Uyeob/58hcl1I7AMX2Ocido1W59P0BUpU
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66028614
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xygFr6iRxDbnjcaagWvOo4nTX161fxAKZh0ujC45NGQN5FlHY01je
 htvCziHPfqJYWD8eNp2Yd+wpEsO65DUnYRnSlFtqCs0QXkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvS4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YUApD/X0tcUhbwkGMDlhIZR45LbJB3fq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiAP
 5BJN2MzBPjGS0QXPg8QGogwp9y12Eb8eWFj82iw5oNitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoOFLyjsP9xxlTLwncUDjUZUFK6pb+yjUvWc9BVJ
 lEQ+yEuhbMv70HtRd74NyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEBDTg8ZUPEHiPMmGx8yy
 UOwoc/gCxpg5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A70JZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVe8yR9xLpXZX1oqMBqaL9RdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 BGO6F0Ju8QDbCfCgUpLj2WZUZhC8EQdPY69CqC8giRmOPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbiilkTP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhRdSlrXc2t8pcPHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:S9r6cqCCK7eotEHlHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="66028614"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUUBCTjewF9WnDiDt2zQqLaD8Sv0lP/6cYJJ+tFPdwto3lGxYUHiAGOMX4RfAM8O9mkt3crEhPtyZGpIHCUZOryBkKch5umHMXVgPddE8WN+k2G9CJPoDECwEDY4+Tk2UqBvcEiwUaXiBbqRiVak6GGuNn3YZHqW5ilfA9KltOnsznTAjZEuPSUhvmdz9OP3yolKI+/QZqmC/zgoyHzrHxTtdRT1xFe0u8jeQRB/SBDUKunz64KEgJULxY4h1yanQ8u9ze5SV0blWDOuNEZvJ93vY7QjZJoBVtDYpzdwGwJXAFxuW55ib1ovmxX/J0kvJ5mK2RVbfIWQSPkSmOCYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sbaen9etnTXnRwjhhj6twHBeqnDJQHKTfmp/QQ6Rkio=;
 b=IQqDGV3eQe7a8AnEjd8Eaz+eTfr3Soc2dsqSX3pmqnZVYaJtOHbQDKjAkFJIVslY7w7tPitV9HLBYyTa0f/ktURJ8KSamrOYhfC1KuDfozVoMlh1HGoCJz0viZRCxghb/x8zOixPW1tzdHX5xqC5RcCnIM0w47T2rcdfw+ACuSxE1kIcHTWUkOHQ+pus51H7BEcOoIJC7gV0n5gIo2Ielk8v3fd01MEJNHIdrdI9mfoNOOhopDb9PGxTczTgluQmQ8MAfRdE2zjzBqLcIYwwZiVWASXoyfbrLLihZPKpMZd/YtQ3tUebfoK6QfETh4yF8uqnQQ1kN+l3pCZbCtmgtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sbaen9etnTXnRwjhhj6twHBeqnDJQHKTfmp/QQ6Rkio=;
 b=sULVL4qhVurUFYYCL5ZWz+0hrh4pTFycJC1LeRlvKLeKJZVW0AHmSqnpfKNrSMQeSHWLRpWa/RZyGDuahUn17cTu34/8QsxndxnLzOeMbbXl4hQQ0hiIUD1zIEqmeXXtzGRRKh4uq8xKTmQ3XszbFDBE3v2mKuMzrelFCPC0/DQ=
Date: Mon, 7 Mar 2022 17:06:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] vpci/msix: fix PBA accesses
Message-ID: <YiYtoxcpi/KalGqg@Air-de-Roger>
References: <20220307125347.71814-1-roger.pau@citrix.com>
 <1480fa5d-bcee-e945-6b2f-9db7931c63af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1480fa5d-bcee-e945-6b2f-9db7931c63af@suse.com>
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33d1b586-01db-434b-3794-08da00548510
X-MS-TrafficTypeDiagnostic: SN6PR03MB3454:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3454BB3878CBB05B3EE735EE8F089@SN6PR03MB3454.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONVqflJvbz8qmZYn10OMipLVp9tGR395cDNZ/TL6SMg30ixmLTRp9M+kWnkt8RmbrWJa6u6RUqORg2RdZJf7ixmTSjczSopW4qV1r0AFmfsmy5uKrL+xDfNCF4x+1zPDPj346CGfvZ6PNQSrE+PVhBcnCZjKQ4KA38KM3kQXospWhagpoce7ObPhgS50QMoGQ7AuvTIF/jbcoAJGfcV4vmF3sRoa92vcBaFI7d+NIuM0BbU7dKz6qhqNT84EcE+IqOxIDIzzyavDHITvE+v0jyHfa6YYWUF0qgyVEb+evM4RTBuxCjlIoM9pXx/K8jKvPG5rPCkE1WC1sLUodmBX7w0R8IuQ5AxQEOGtO++nMKFd+hFgP3CuHmaSyIC0I3K2LKOpcffwGsZBGJ3avDneW3NDKNxajOmVtZ05Ym2XD9xy2wno9Nhf1cv6OgUTh9/c86ZuRU2eRi953dHILs2hG/RwLrO7gzZjC0Sd3ip3LpLBc1tnqvHD12Tknl0MjN4n/Ypc64s2dzQdjRtrIj8eYhpNyzuO1tIrhPPF3nDNREalN+e8KqL9neySiQDRWVY4QYxJIOB3GKL+YpGM09DVMK2jdQ0bZ3FsDMOwHfmOpTd078WaGowjvUlK1MxkVsJTd8eM4VOE2lwsYxVxtDz75Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(86362001)(4326008)(508600001)(26005)(66476007)(66556008)(66946007)(9686003)(6666004)(83380400001)(6486002)(53546011)(2906002)(5660300002)(8676002)(6506007)(8936002)(6916009)(38100700002)(33716001)(85182001)(82960400001)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDhXRDlWSFZwL2xyakdPN2RlWGdOcUFPUkR2cEJUUUN1UG1pQ0hwcHBRbjha?=
 =?utf-8?B?OVh4VVBqRndlTlhlYUZzUkZVNHVtRE9Kelh2SG1GeHU2eGJVanBCSXRPeHh2?=
 =?utf-8?B?WUt6cXhlajdRNHJ3Q0ZwdURlR2twMU9nOXFKNG54WTlZVFFKRTQyMGFYVHVI?=
 =?utf-8?B?ZUxRS291Y08rWmJiRm8rbUVKcmdJeXRubm9WUk1SbysyVlV2Vy9ScnFGQllE?=
 =?utf-8?B?Sm0yT3NkSXRySTVER2lSUTdwd1VJK2hGTURLYWN2QWRsYmxMTGp1VnIxTVRE?=
 =?utf-8?B?bHozZnBlaUxMS3BJTUhaNzNNMG1YVklqVGc4NTE4L040V3ozbmV4M0FwV2R3?=
 =?utf-8?B?TUJTa1YybVk2R0JmN05FcENRU3dwUzVlK1lJcmMwWC9CTFFFWHRqVjl1YmFY?=
 =?utf-8?B?cFZWdFFxbkRPOWpOWDZhQlJ6aDJ6TzVVUWZVZm9VeVlhYWRPVDlQUnJKK1lk?=
 =?utf-8?B?ZUlTZEdaV3c2TnZGOVY1ZGdJR0xWQWtSbWhkWUdlQXRMcjk4Q3hMMmY3N0hp?=
 =?utf-8?B?WkF6UnVBNTFtczBRendCWXJGYS9LNGl5d2FyQTJLR2M5VTlnenMyU2gyckFt?=
 =?utf-8?B?VSs5QmxDMXJsMitGdEIrVW5rZ3lnTUJneUdzVzdjR2hpdFpobnZMK3RNcmpy?=
 =?utf-8?B?SWNvSWVQRU5QYmpObVg2SUt6WkRia05jMy9PTVVSb2o2SjA4SmdBT3JLNy9E?=
 =?utf-8?B?dGRlN2RmYWtMMmsyWDFTR0ZNeFVXYjFGa0VNeFI5QmtDS05uVEErS3NWRU9B?=
 =?utf-8?B?RDJ0Qk5IemtDV2NiY2Q0OXovUEQzL243aXhOQWs4bUFpWElqTFFPbUxlZkkv?=
 =?utf-8?B?K3YxQkczR0doeXdkZWMzQ1RPN1ZKTVpMVExKenZVcUw4UWpPSkF4andjYm9G?=
 =?utf-8?B?REhXYWNwbUdRN1pFdUhkcDZocmlVejlISElScEVXOEVreGxMZEtVSnN1NThr?=
 =?utf-8?B?Um1Rdk51MUdEeHA1b1l1WXoxWjNPak1HeXJGWGhhQndjNWF5YXZSRzFKeUtx?=
 =?utf-8?B?b1ZkR1loMk43eWoyY1pHdGUwUlNuSXcvN0o5Z0hTS25HcU9EM1I2dThHS3U2?=
 =?utf-8?B?QmM1R0FTb3FrNS9ZT0p6aXpLS0tYZUZxRWQ0dE00VmJoejN5a1dsVmtWUTB4?=
 =?utf-8?B?QzFoR3NqQTlndVIzam1SZ2FvWEFPeElJc29OdDI5RnpURVI4SForcXFoY1Vi?=
 =?utf-8?B?Mzd2VXNNUkJKajRqSFIrc0tjY0xUSkdTNnJLVjNOcitRbUZrM2pLazdRZlpp?=
 =?utf-8?B?WHBBRVVzWDhvSFpoSzBYZDYvdzl1RWpmMm10eXAvOFV1YzFoUG9DUjIweWt3?=
 =?utf-8?B?ZGdnZ0Qvb241UUpqcVppVzhjS0tRN3hmdkk4ZXlTZXNXdXVTYzVyS0tRTHRH?=
 =?utf-8?B?SWFnR0JuRjNGQTNycEpkZ1h1b3NXNjdhay8xYkhvbVN6bGg2a1VwWkNhQlE4?=
 =?utf-8?B?bThoRHJ0RzAvanRDZTE2L0Q2RzU1L0VsMXBqSGxLZlJtNWJGeVU2YzZBWDBH?=
 =?utf-8?B?dGpYZTc1QmtCaHA2Mkk5UUh4Yjh1czBVbHlZU1FNUzJyY25lTmt3SU1PME1p?=
 =?utf-8?B?c3BreVJPaFAwRmJnK0pGcUJrNEgrcDNvS0F6SEpUY1djTnZQZFFPU0Q1akRN?=
 =?utf-8?B?QjJOdDhKaUlrNEtUVUR4eGhNWDdXTUN4bEFjM0JIUzZ6Wi9wNmdXUHhsblN6?=
 =?utf-8?B?QXdQbThFYkZiQk9RSWkwZzQ1aU43QVZ0ZFhYQitUSkVrQlZYZXVyOHBDRGVD?=
 =?utf-8?B?TzhqTENVNC8yR3NoYWVJVHlnMXBtNHVKQ3gwaVNvOWZWVXF2THZFZndaWXJ3?=
 =?utf-8?B?eUJoWURFTkpGMFE1ZHJVMHJqRmc5N28ybkJTZmgzdCttQjcxYmQ5dHlBeDht?=
 =?utf-8?B?cGNVQ0IzNmlpOExYeDJKS1dXSnlWeVlZY3dKcDJtY3cyRnlMRFF1RS9IS29j?=
 =?utf-8?B?UjdSNVVQZ2VkQTd0Rm9GWHQrbEIxRFo4WmxOb2xNTm5Ca3BteHNyV0p3OVpG?=
 =?utf-8?B?S1NjRzlERjkycm81WnNWRkcvNUhXb3VzQWM0MjJIbGdwQ09IT0E4YUNlb0pO?=
 =?utf-8?B?cnhBd3JMc05aQnRLbTkveDBmdGhEUys2Q3JqSDYyK3hYZTNQRmlNUkpCMFB3?=
 =?utf-8?B?U1Bic3cwK0tVM3lqeDNMTE5mMWc4YmhwM1NHMDNuL3dwYXE0NUJkTjhieFp3?=
 =?utf-8?Q?aiAFO1o78qkMd+pL1gJN5zs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d1b586-01db-434b-3794-08da00548510
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:07:03.8218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi0e3nHKgnc1DLZT3Z21AVKHcsc71Hj8psNGgoBHEfibvSA5wMaz1it5xQ96q51Jfa+Hy5BKayy7TWS8cdx2lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3454
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 03:12:32PM +0100, Jan Beulich wrote:
> On 07.03.2022 13:53, Roger Pau Monne wrote:
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -182,6 +182,33 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
> >      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> >  }
> >  
> > +static void __iomem *get_pba(struct vpci *vpci)
> > +{
> > +    struct vpci_msix *msix = vpci->msix;
> > +    void __iomem *pba;
> > +
> > +    /*
> > +     * PBA will only be unmapped when the device is deassigned, so access it
> > +     * without holding the vpci lock.
> > +     */
> > +    if ( likely(msix->pba) )
> > +        return msix->pba;
> > +
> > +    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> > +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> > +    if ( !pba )
> > +        return msix->pba;
> 
> For this particular purpose may want to consider using ACCESS_ONCE() for
> all accesses to this field.

Hm, I think I've asked before, but we do assume that ACCESS_ONCE will
generate a single instruction, or else we would have to use
read_atomic.

> > +    spin_lock(&vpci->lock);
> > +    if ( !msix->pba )
> > +        msix->pba = pba;

Here we would then use write_atomic.

> > +    else
> > +        iounmap(pba);
> > +    spin_unlock(&vpci->lock);
> 
> Whenever possible I think we should try to do things, in particular ones
> involving further locks, with as few locks held as possible. IOW I'd like
> to ask that you pull out the iounmap().
> 
> > @@ -200,6 +227,10 @@ static int cf_check msix_read(
> >  
> >      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
> >      {
> > +        struct vpci *vpci = msix->pdev->vpci;
> > +        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> > +        void __iomem *pba = get_pba(vpci);
> 
> const?

Sure.

Thanks, Roger.

