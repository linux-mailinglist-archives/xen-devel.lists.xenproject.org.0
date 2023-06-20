Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DFF736BB6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551734.861403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaFL-0004hZ-06; Tue, 20 Jun 2023 12:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551734.861403; Tue, 20 Jun 2023 12:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBaFK-0004eF-TV; Tue, 20 Jun 2023 12:14:06 +0000
Received: by outflank-mailman (input) for mailman id 551734;
 Tue, 20 Jun 2023 12:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBaFJ-0004e7-NB
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:14:05 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe12::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f29542d9-0f63-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 14:14:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8397.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 12:14:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:14:00 +0000
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
X-Inumbo-ID: f29542d9-0f63-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fclOfyDEUV4TIFRVgrdOpEoiIhm7fgrjj1GehkynV2976eM9g7QcI2OntOzfFpyi4qMiCUyYhclLMRHyAT01FVDcMzV6PbYaYNMD8WEv1csDY6ghAHzy7wLZhjmtuK9cxI/FwWy3njq77Oqxk9agJpUbodwnSn0oOCUf9CqTMGBV5+dNpXxoadlT1eTGwOcDjL5WRy5OoJLSSjgmZRkhgZUyRoubYJ0PS8n0Pg7f9kFdsbpr8DxASW/ehVHtfLpVDR1Yi6Di8ehCAAuvjVrHj8bg/0lcaCJYWnPPcuX4m//P/cxv6e6vRSB8DPg5qGrMapO8devB30BwsNhLkbEI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDkXQFK7prRBYZMb54ImjyAkD1E0Gz1BgEn4V+c9VhY=;
 b=YZxOi2nqWTcgltg2C2U+MMHOb5gbo7DHld/PHiNrQny0DH7tdnZqdTJw/R65D3YQYlhWTWFy4skTewmipZx8C+Ym6HJj9RSHUBa0LRj3VUGdSjYB7f3WBD8klFR2GhIfXbb0tx1h9XY1PbQbGYtevIpelwlCdZGIaxWUHzxvqvaoQYCnvL6PktvxPGfi1o/M4K4WGjIhzxcjvqhCn4RJsXFo0FBOc69uzu2Z6Jw/Erngm45pqvFidhX0hjQ2pgwpGROQ6ce6TG5LzmHRHVzoB0h+QrqhO7iFauODq85cTySiEjhkEEoe3e7QGKIsdLvOQsEhWrMhjO6KO9XILKTPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDkXQFK7prRBYZMb54ImjyAkD1E0Gz1BgEn4V+c9VhY=;
 b=XlLafMllxCxI1h1Kyjx8JEVGxRd6dziFB/7aM2emkkgGioOzCaiocMKnskpWekfzLliNFOs349WvTWJIBb7+g2JHKNCQZSsuaM+wl+Hzbi/bj35Wosc+tMj0K3TTLs74BMFvV4D+vb39Xxtn3JoqKr4wLbKJYTF1gsLhy3h8ICArXyi0xZn3AY2XJh3urtlu49jhpnLXjM2076dS0F5G90USG2GbT+viQIBJ58a6nXm/EjgEwB9H0SjFheh20d02D3eHDzJNfY0zUXVfrWNj0KThlbgt0fKW74500CNafu5f8wuoAULAhLzcoURDwLQpfGszg7qAkhWXqZ8RhOgBHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82f6642b-357c-a646-0caf-b1397290ca6d@suse.com>
Date: Tue, 20 Jun 2023 14:13:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 00/13] xen: fixed violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>, Michal Orzel
 <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0642c3-7c38-4e3f-a595-08db7187d468
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4qrBLW1UO0Wc1w+pFY3WotZsTIvfh5gcvVHqp0n2H7DNYh/NVUox54bgLjZjhoTpusFw9mSPZFeeF75EWarnZuhAIZ+u4vJQuVurZXaj+tuEpa117FdJocdbuilHmD/jY4xG4jIH3rpo3A8GO+99UBnzVXrBKqcGc2ItNYheazqcO0rCSNWdjBMHWrDwchzFot9qb3QjxkfZA6ww4OrjdMrFMQWiPeNltU0URkQnK7VIfitDSEZH/vSPk5Oja6lRchRo7pFQkWNV/iWEYyliGk2QigHMD0ON46BlejEYOEIrCgdcMWFsFXU91hGSrk+IWLJg/s7j8W1dTMbMKnC7+Cuj98NU/XIkLUDhY3hXHdzRiGksi6SiEKNQp3C+yAqQnnp5jH+/g5txeWM6KqEEQNN3hX/OoKNzpVsiAzmp0xhE7+uuDGxda78Ytp/sFX7TiHhC0sWA3CqGJTOfQPmQUXdZGzD8fS/zbgS7Wkkewq5iAHuixHSqtchVLpqNjGa8VqrVGwXJFpBx2DXewObIWZZqduLQobHmmWePVNcXVMvZPOSdpzAo+oGUsoW/hwwI+r7AUamhoIUKax1sagM1AA43wJJNvnA2cCO8aYpJ8exzXSCzk1pEWgrebjO2sQY50ObFRdgcomqV7ivzkrPE2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199021)(2906002)(316002)(5660300002)(8936002)(4326008)(6916009)(41300700001)(31686004)(8676002)(7416002)(54906003)(66476007)(66556008)(66946007)(478600001)(6486002)(6512007)(6506007)(186003)(2616005)(26005)(53546011)(83380400001)(38100700002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXFMdmdPUE9kRmNaRmtrdWtiVTlGYklTYXFEYWRTZE1uQytvNlhwUWl1QWZS?=
 =?utf-8?B?UjNhVWlNb1d1YVhYR2R3Q0dnRFNrT3Q5NG0wbkxtU3huUExRU1NlMnNSSi9h?=
 =?utf-8?B?L2N2L0lyYm9vMXIyTHk2SnRYMEpiSkk0TjBadTI1Y1hIZlExNE0yU3hPTTlF?=
 =?utf-8?B?SjlIcWJ4Mm1MdEkzUEZ1UXBzRHhsWEx0SzdUaUc2SGZCTE5JeHFTaGVPNWNC?=
 =?utf-8?B?Q2dxUVJQOEFoNUoyMnB3RCtOQmlrSHY3bUIxUVlKemZjVEtRL0pGN3BjdXJF?=
 =?utf-8?B?NE4vdTgvUnNrMXNtMWxLTGkxcU1JVXh6RXkzYWF3Tm1uKzBYUURFNVBRMm10?=
 =?utf-8?B?L2NqeFhhdFRJSitxMDVGSXMwRXRFeXFRWmV2dlhkYmYvWWQxaWlpTjQ2R1M3?=
 =?utf-8?B?K1MyVndRYWRTOGNlVlpLNStnbkFoSHJmWWJPakcxMHdYWVZCWElRMUNabFNH?=
 =?utf-8?B?QlgxYy9ZcTY4c3JmTFlxRHVPekd6L3B4NXNwRFBoQ09MZ3dJWHNwWndscFov?=
 =?utf-8?B?NUxKMXFsTVprUzYvbDM1OEhkNFhrMkdLdE1uL0RLWTNyNUhSTGZkOW9OQmJv?=
 =?utf-8?B?a2s5QnBQM0pFOWhrU0R1bkQ2YzU0WWgrcDlFSTRtUi84Mnp4MDN0SHZmbXBs?=
 =?utf-8?B?QWJMRUdKWWk0MkkzWWpoVGFiQlVxYlZyZHk4SEtDalRHWWY5Q2E0NDREeU9F?=
 =?utf-8?B?eGtLNVA2bm9Mby9WYkdQQURZcXFUTUxiWE1XeS9Ub0prUDNNUXJzcTFXTGdF?=
 =?utf-8?B?UjdsQkRpZENkc3gyak11eHdZQ1IxUjFxMDBmb1Vzc09EOTc5K0RlOFBHY0M4?=
 =?utf-8?B?aGNXamcwS0RxM090QXBLbHJDOWxaYlk3QTcrMWhtaXV1UjJ4dnJ4ODVwUnlR?=
 =?utf-8?B?RUVKOXFCV01NckhCRDJIak9uQWNvZ1pqem5PcjRMd1UyVklsZ2NhNUJwd282?=
 =?utf-8?B?b3I5WG5nS2QyaWdNQzNhWTdzZFB4L05GQjhtcXhZRXJBSDhWUlNuMDFRNWhn?=
 =?utf-8?B?Uk9zeCtyMllOYW5IQjZSem9xd1FDWjFHT2EwS2tabU1MdGVnY1NLWWFEVmEy?=
 =?utf-8?B?eFU0dDE5eE92MVdnekVoSkZBT3kxOXBXcG80WEUvN25JQkVxRWxoL1JtNDc0?=
 =?utf-8?B?RkMwZUN5S0hHZVE2c0ZqSUtTdXN2bm1TNTdueU1VSUJtbmNUbElraVhQeFpD?=
 =?utf-8?B?VkpaMWt5VVExTGdjSU93eVZjbnZOS2dCcEJzdmZFY0VVSnBwZTZqSFdKV3o0?=
 =?utf-8?B?UHp4TlJLZU80ejFMcjRsN2s0V1JSRGtVQUI0SUR5MkJqQlRLdUhaNnFmL0Q1?=
 =?utf-8?B?TzdXYVYwd2tWcGFXRnM4QWF6MW9JQitZYnE2QUprem0rSU15WWF4OC8ybTU3?=
 =?utf-8?B?QXQ2Q0k3NkdtaGI3QkRnSzc2TUc0U1dDMEg2ZHRjY1dmVlpDS3d6QWRpdXNP?=
 =?utf-8?B?dWF5QU02aUFlUDNTS2o2VjJYcElLRWFGOFJzRzNGdkR4c1BRakZPK1czQ0Rh?=
 =?utf-8?B?QmtJZkp0bGkzNU5vM05JRk04OGhaZjJKdzYwZ0tQdm81ZzYrZWREZVlBanp6?=
 =?utf-8?B?VDZiOEt3K3o0MkVWR0cxMkpTZWt5T3QxcVYrSVFCQWVKUk5RRzlydi9PUHRQ?=
 =?utf-8?B?TWxCcjArcUttRkg5WXBDVDZQaVZDODl3SkE2MDhvMHFzUUd3WVFGVTA0QW95?=
 =?utf-8?B?WE5WbXlncFVWSXVtQlNBUGpjNTlvVUV3a25qWGE5QWNUNVVxUmk5WEROYnpY?=
 =?utf-8?B?SEZVSGVMNUpKK2lHNzNFZ1ZNMS9CZG9Xd3NlZEIvZDBoa0NNbVVCRkR1cEJj?=
 =?utf-8?B?bCtYVU9CYTB5VWVvSWI3dWFFdU1adWFZbUJXVnUxMHF0RzdWd3BzQjlNZXFK?=
 =?utf-8?B?cHhkRHVlS1ZiekI2ZGUzeVA1V1pkU092ejhpenJTU01VVE14eVhST245UTk2?=
 =?utf-8?B?aTNMdVRZc2JKQ2E0WjI5SlRGYjRDdFgxWDVsS2plTGhiQnNIQTN6Z1llL1o4?=
 =?utf-8?B?VXJRZE1VeFBSZjhvNmRrNnF3cUJiRmFNV1hmYWZJZXpZa2JtTnJFMU9LQnc1?=
 =?utf-8?B?R05XOFRoM05ZZzVFWnhQbjB5c2U4VGY1cFhpb1VZZGd0KzkxMno0amJVRXFz?=
 =?utf-8?Q?BbJZPHGqqkbsDjhWBVAIlid08?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0642c3-7c38-4e3f-a595-08db7187d468
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:14:00.3481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2az/2fq60dlACoK+AxdQdLprspzm4WwSaGqB3HdPvFKLBmQYkBRxQps/zJfxnG1tNyoMQxl+dkJ0XBB3PT5ErQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8397

On 20.06.2023 12:34, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline 
> states:
> "A "u" or "U" suffix shall be applied to all integer constants that are 
> represented in an unsigned type".
> 
> These violations are caused by the missing "u" or "U" suffix in unsigned 
> integer constants, such as:
> 
> xen/arch/x86/hvm/hypercall.c:132.17-132.26
> if ( (eax & 0x80000000) && is_viridian_domain(currd) )
> 
> The patches in this series achieve compliance for MISRA C:2012 Rule 7.2
> by adding the "U" suffix to explicitly state when an integer constant is
> represented in an unsigned type.
> 
> Some changes are proposed for homogeneity in order to keep the code as
> unambiguous as possible.
> 
> 
> Gianluca Luparini (13):
>   xen/x86: fixed violations of MISRA C:2012 Rule 7.2
>   AMD/IOMMU: fixed violations of MISRA C:2012 Rule 7.2
>   xen/x86: fixed violations of MISRA C:2012 Rule 7.2
>   xen/arm: fixed violations of MISRA C:2012 Rule 7.2
>   xen/common: fixed violations of MISRA C:2012 Rule 7.2
>   xen/efi: fixed violations of MISRA C:2012 Rule 7.2
>   xen/x86: fixed violations of MISRA C:2012 Rule 7.2
>   xen/pci: fixed violations of MISRA C:2012 Rule 7.2
>   xen/public: fixed violations of MISRA C:2012 Rule 7.2
>   xen/x86: fixed violations of MISRA C:2012 Rule 7.2
>   xen/vpci: fixed violations of MISRA C:2012 Rule 7.2
>   xen/x86: fixed violations of MISRA C:2012 Rule 7.2

Please can you avoid having four patches with this exact same title?

Jan

>   xen: fixed violations of MISRA C:2012 Rule 7.2
> 
>  xen/arch/arm/domain_build.c                  |   2 +-
>  xen/arch/arm/efi/efi-boot.h                  |   2 +-
>  xen/arch/arm/gic-v2.c                        |   6 +-
>  xen/arch/arm/include/asm/arm64/brk.h         |   2 +-
>  xen/arch/arm/include/asm/arm64/efibind.h     |  10 +-
>  xen/arch/arm/include/asm/arm64/insn.h        |  16 +-
>  xen/arch/arm/include/asm/vreg.h              |   2 +-
>  xen/arch/arm/kernel.c                        |   2 +-
>  xen/arch/arm/traps.c                         |   4 +-
>  xen/arch/arm/vgic-v2.c                       |   2 +-
>  xen/arch/x86/acpi/cpufreq/powernow.c         |  14 +-
>  xen/arch/x86/apic.c                          |   2 +-
>  xen/arch/x86/cpu-policy.c                    |   8 +-
>  xen/arch/x86/cpu/mcheck/mce-apei.c           |   8 +-
>  xen/arch/x86/cpu/vpmu_intel.c                |   4 +-
>  xen/arch/x86/cpuid.c                         |   8 +-
>  xen/arch/x86/efi/efi-boot.h                  |   6 +-
>  xen/arch/x86/hvm/hypercall.c                 |   2 +-
>  xen/arch/x86/hvm/irq.c                       |   2 +-
>  xen/arch/x86/hvm/pmtimer.c                   |   4 +-
>  xen/arch/x86/hvm/stdvga.c                    |  66 +++---
>  xen/arch/x86/hvm/svm/asid.c                  |   2 +-
>  xen/arch/x86/hvm/svm/svm.c                   |   8 +-
>  xen/arch/x86/hvm/viridian/viridian.c         |   2 +-
>  xen/arch/x86/hvm/vlapic.c                    |   6 +-
>  xen/arch/x86/hvm/vmx/vmcs.c                  |   6 +-
>  xen/arch/x86/hvm/vmx/vvmx.c                  |  12 +-
>  xen/arch/x86/include/asm/apicdef.h           |   2 +-
>  xen/arch/x86/include/asm/config.h            |   2 +-
>  xen/arch/x86/include/asm/guest/hyperv-tlfs.h |  28 +--
>  xen/arch/x86/include/asm/hpet.h              |   2 +-
>  xen/arch/x86/include/asm/hvm/trace.h         |   4 +-
>  xen/arch/x86/include/asm/hvm/vioapic.h       |   2 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |   6 +-
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h       |  32 +--
>  xen/arch/x86/include/asm/msi.h               |   2 +-
>  xen/arch/x86/include/asm/msr-index.h         | 204 +++++++++----------
>  xen/arch/x86/include/asm/pci.h               |   8 +-
>  xen/arch/x86/include/asm/x86-defns.h         |  24 +--
>  xen/arch/x86/include/asm/x86_64/efibind.h    |  10 +-
>  xen/arch/x86/monitor.c                       |   6 +-
>  xen/arch/x86/percpu.c                        |   2 +-
>  xen/arch/x86/psr.c                           |   2 +-
>  xen/arch/x86/spec_ctrl.c                     |   8 +-
>  xen/arch/x86/x86_64/acpi_mmcfg.c             |   2 +-
>  xen/arch/x86/x86_64/pci.c                    |   2 +-
>  xen/arch/x86/x86_emulate/x86_emulate.h       |   2 +-
>  xen/common/device_tree.c                     |   4 +-
>  xen/common/efi/boot.c                        |   8 +-
>  xen/common/efi/runtime.c                     |   2 +-
>  xen/common/gunzip.c                          |   2 +-
>  xen/common/xmalloc_tlsf.c                    |   2 +-
>  xen/drivers/char/ehci-dbgp.c                 |   4 +-
>  xen/drivers/passthrough/amd/iommu-defs.h     | 122 +++++------
>  xen/drivers/passthrough/pci.c                |   4 +-
>  xen/drivers/vpci/msi.c                       |   2 +-
>  xen/drivers/vpci/msix.c                      |   2 +-
>  xen/drivers/vpci/vpci.c                      |   6 +-
>  xen/include/acpi/cpufreq/processor_perf.h    |   2 +-
>  xen/include/efi/efiapi.h                     |  10 +-
>  xen/include/efi/efidef.h                     |   2 +-
>  xen/include/efi/efiprot.h                    |  22 +-
>  xen/include/public/arch-arm/smccc.h          |   8 +-
>  xen/include/public/arch-x86/xen-x86_64.h     |   8 +-
>  xen/include/public/io/ring.h                 |  10 +-
>  xen/include/public/memory.h                  |   2 +-
>  xen/include/public/sysctl.h                  |   4 +-
>  xen/include/xen/bitops.h                     |  10 +-
>  xen/include/xen/cper.h                       |  34 ++--
>  xen/include/xen/libfdt/fdt.h                 |   2 +-
>  xen/include/xen/libfdt/libfdt.h              |   2 +-
>  xen/lib/muldiv64.c                           |   2 +-
>  xen/lib/x86/cpuid.c                          |   8 +-
>  xen/lib/x86/policy.c                         |   2 +-
>  74 files changed, 422 insertions(+), 422 deletions(-)
> 


