Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4E6693F9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477116.739681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHDH-0002XX-TR; Fri, 13 Jan 2023 10:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477116.739681; Fri, 13 Jan 2023 10:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHDH-0002Uw-QR; Fri, 13 Jan 2023 10:23:07 +0000
Received: by outflank-mailman (input) for mailman id 477116;
 Fri, 13 Jan 2023 10:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGHDG-0002Uo-An
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:23:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43848e59-932c-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 11:23:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7397.eurprd04.prod.outlook.com (2603:10a6:10:1a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 10:23:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 10:23:02 +0000
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
X-Inumbo-ID: 43848e59-932c-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRjgBZknBCV2P6KPoZVtIYf0jC/E4bxbh0egue04SuwQV/TEJgohWQunxmbWaM8vQlnv607yU+85+ZeHrHcXYZOHmoUe49uOCzN7doS5lvZ6ZJamZvOI4+ZdfvTaenHgMP6J6LP0cvZymczxmqnLVf7RkvTpbqujaQrKUtWJcO0QaWRNx339YpV+Hden3DtiTTFRL44YrsnatXz4WrQL7EOc5Zx3BT+z8IaqVIKCoQpVdvn8TNMhCE4bfw6PwCy1xNZx30w/sSChx24rRszA96EJdYuKwvqqFjLphp+xuOxO2KhfTFvfzHVQ2hnW5hX/sPzyhMV3NZDjbT24WmQ/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+++8ejAGIagRsZaioNDKUcsaghbLXon1K6kkQCfO444=;
 b=Aaxvq3xZggJBYVltAV5lgnYtCLoJXEZhQwTl2lSmgLUFS2C9JhQ1+TOSmaBMshJcDO7t+vRd7m0xiHF/3FHeK3gutl+QLIY/SrCPDldizx1cPhifuT+cOmmXY9nzbzOTFu4mh7hzjVwFRBcnbBYljG+jusuNVd54fR8Ngq6WJv5evF80jOkoxFZNIYoMLdXZ0yK8eldPwgzIUxC6h8wz+oYrZsi7Coijb1Nr2fDAr6yLdHeCuRFE9lyDwAzCq+CnOXPHFOs4QxeJJRNqFQxZ7hfDHcCOUwqRExkuU1EAVHgIzbV4ZR85aGKdbuqcNXn0wR47aPQakfnycOLDE6ScMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+++8ejAGIagRsZaioNDKUcsaghbLXon1K6kkQCfO444=;
 b=M0ANMvBUJ+R0QrTMnPATbpSQgwx5VWoW06aFHSM1E9ISZ3/2DtbNndu3OcLFmobwYgPNLTMix2t/zQXZj/E6yMD5nE40WTlf4sdWuEuhIvzLDVAYyQHaGiaQIKHkfTXqCHGObx4RRC/ba7/Z/y57UAtkKF4pHBgnHfg9+t21rQKH6GArs9aFkuQDvqudwQGNMzuryNNCZvZIen/McdS6TMRk+N1TgmuiHfrN5jUx8mvl0pU/IO8aomKwbjZyWLBwnJmNNni6GS41WYXmjAiEGK2R7+1KBHPaUYahzEixJ4VS6ADG8Jf0ugcI806GXmCRkKi5XzrmWZEr4JCuTbFlMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <acc496fc-ee23-1836-1a15-e549e462773e@suse.com>
Date: Fri, 13 Jan 2023 11:23:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
In-Reply-To: <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c425a3-096a-4400-b889-08daf55026be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+aPkSdS+bNAwk9oKke27zrCFZda+036e6LhpauKd6trX7uKrdG9JvayIqQOsh1GBUHUh/i/RYZWYNTbYcF/ezfWtyby/NXEWpH/Djis+pk7jB9fWsBaHm0y6HuC9FYtnVdtkdatW6KwH2YlCaIJNK+qjNI44b9aJiJeZMh7633DUu/z5Zn1XNf1PVx4QJmaiNvWSY8CtBnpn2yCmdhf5OUL2++oIntku2e9kERh5AY8qDBlIxce7tUh4zQruZ7JWLrjZuITgZaoNOiznt+jEQTAujzFKQ+1BTQbXIKtX15WshOFeIrunIBH3RCbYUbXAWV2O+OGYQ5yJmEiJuOC+SQ1lVngX2wv1oE6gvFuKgdY0emEnjeZ0Eh+1oTBOUk/i4G3gdVfjn0pUJ4xSTMs3rqPMwT4/tMMpfqpaYkWjkkB62ZPR6ECjTkD9DzROXRttaev1/7jm3i5sNl0G9yKLzLfPyXMnUlfD93uWPhBTZchQ/hlVUcV8EFSwrfUZ098GvjHw7tvcyoHt/H4v+tfAYaQYoNftOdf5OgOOvrGaN58SF4YtkOANRE6u6uGDNMNpi5FrG9lojZ+ieuGS9RfpWHwOKoCaDQ5djA7INSAlyrzwlUw0Ts1NDqsQuupEjhhCafmSIcKTc0gZ7y5YANa9x9BwqgIiflyk3ZyNtQdliGlYQveOWJ5nYZFp+oIyjJsJdSVxF4LjYnsFCgJ6xDmyYpoppU2BUgr112BuGfD2szzj2f1vxRpmtnLkfv/r4GHaU7Pw8OExm5tqXUzswjegww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199015)(8936002)(5660300002)(83380400001)(41300700001)(86362001)(38100700002)(36756003)(2906002)(31696002)(31686004)(966005)(478600001)(26005)(186003)(6512007)(6506007)(6486002)(8676002)(6916009)(66476007)(4326008)(66946007)(53546011)(316002)(66556008)(54906003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlBBalRicW4rdnlmOVFiRmdmU1lJOS9iaFRYeFJzRXBzUGQ1aXYrQVptUXhF?=
 =?utf-8?B?eHlGSGkrNnZqNXE5dm1kZFdFN1M4L0R4cEtUN0lnUHMwdmgxWkF3NEVXRWlo?=
 =?utf-8?B?M2gxcVVKVGR3SjJ5M3hYQmZZaUpBTmtNS2ZuamNGbnEwYTNoQXhFYzNwS0JS?=
 =?utf-8?B?d0tXSFYxNkFoTllzNFhJM3F6ckgzTE9jMko0NCsvL2lLa1JobmJJbmdzRzV3?=
 =?utf-8?B?YlZXR2pMaVNuWG44REowc0Q4L0JzV041MzJXTG5yUkFaYng5NnEwd0lDNk1m?=
 =?utf-8?B?bk9qYUVENTBBeDFoNzR2Y3ZlZ3VzdU9TRDZmM21WdWhQZlp3UWNFL0ZQcjI5?=
 =?utf-8?B?MUw1YnlBQnVMTXI1WDVTVHovRlJvRy9CbHlXQWE2RGZSUi9nejFOcW5nR1pl?=
 =?utf-8?B?YXRhVEtlZ21NUW9Kbk1YcVMrUmtQWHUwTDJOeFVSWVRISlVQbjE2b1JpSXF6?=
 =?utf-8?B?V0dGelZ4dVNLQUthQk5OTFNSd1l1by9nWFZKOWdvOG0rUVhKcG9Bei95NitS?=
 =?utf-8?B?UjV0SCtjbExOOUU3T0RxR1VuL1NoNXRMa2Fub3N0TmN5TlArNGNzdW1Eclp3?=
 =?utf-8?B?SUg2NWJqOGdoSy9MU09MNW90Y1RpVFoxbVhsTWlDbGx5YnJIV0RENXhWWGJj?=
 =?utf-8?B?dnFKRVF1YmNJTUtnMkpKZEI2MHl5QkEzV2o0VnBvWlZwUVhRZUNYQWdsUEFw?=
 =?utf-8?B?ckN1UEVTRE5LUjM2bTZYaWFOZ3FWRDl3dW52QUl2TGF4VWZZRGs3YlBFdkNi?=
 =?utf-8?B?b2pBQ3k2RFdwVDRDellQVkdjTWMyRWFQbzZaWHlBS0w0U2hvUEZPTEVNMFJI?=
 =?utf-8?B?Y0hEOXdEUy9hTm9iQ1VOZTU3cVloV1lTWTBvS1dzZjl1bzVzNWNYSXhMTVZ3?=
 =?utf-8?B?d2dNYldDcFpDWTNHSkRodk4zV0E0V25rQmpIN3NBbzU4bmNXVkF2d3NOSlJW?=
 =?utf-8?B?d0pkd3puVENiVi9pVlhtZTVqU0t5ejU3Q0wrOXNVdk1GZ3ZqYzE1aldTb0p1?=
 =?utf-8?B?QXo1WHhHM09oblNnRDV3dnBvZzdFbFZyaDAwMnRkS1lqcjNGOVBPQlEzWEtq?=
 =?utf-8?B?R2Z5WEtsRUp4MG1Ya3NNV3IxaDdsVTZTMlhZYldkYjkrTThZQzZJVjFIbHZ5?=
 =?utf-8?B?a1Ftd0ZNNVI2RUUzL0V6azllWlNqaGdqWS84OUU2ZWxRWWkydEt2QXFvYVBK?=
 =?utf-8?B?cGlUZVFmWjNnWWx1TjRBaEkwVEs1MVorSmRra0xHNFhvRktHTmFZNkhsWE5w?=
 =?utf-8?B?elYxUTdNcVZyU05ZMlNYY1JPTnBsdUxVbGFDYng1K1VGeTJqRDNVVG85dkNJ?=
 =?utf-8?B?d2ErdDNTeGdqSzhOZW5WM0drbEJQZnhKN0dja0h4cGwxamtWSW9KYkZPZ0Rh?=
 =?utf-8?B?eFhIK3lDV29WQ2pBY0xKSGxseGI1SFlsODlkeVNXYXV1ODlYUzBFR3A1TGQ1?=
 =?utf-8?B?MXFRNlZpR2djVnJhSVVEN05RR0dnTG52OER1WGNtdll3Y1Q3REJUalRCMk5n?=
 =?utf-8?B?RkhRbEZRN0VLeklkUmFTSGwrNXI1Q1F0RXNmUTJNWXoyT25IanFmNk1RK3hC?=
 =?utf-8?B?aHp2cDhQRHE0UStXZFJDY2RSbk4rS1Z3UlNMb3VUaGtOWUtBRGRXdnhLY2ph?=
 =?utf-8?B?aDlKVThaZm5EWFlLK0ZuQlRMNVVGU25BR1BKcEV0V2l3bVloRk8xZCtpWmhi?=
 =?utf-8?B?K3M5NVcxYUZmTUlqVlRxbTc3ZCtmeWYyR2hYcjY3SG1WZkFvVXJRSWdRTVhw?=
 =?utf-8?B?aGJHZ3NYby94a01IN3Q3U2NEVWpKb2xqLzBXcEtiZEU2aGlsZHd1Y0xITGU5?=
 =?utf-8?B?NnN5WE9BN000TkRYM2xJbWJwekRYSHcyaUg1TmJQaHByR1Uzem5VWDlDdURJ?=
 =?utf-8?B?bTV4TU04SzdCVDNpTHE5TWpVV09uRzhrOExSTHRZcVJ1eXQ2bk1tZGJYQ3R0?=
 =?utf-8?B?Q1ZsNzhxb1VBb2FNc2xFSE5rV2kwSWJNamxMWkVHZHh3VHAzTVhlNDhYQ3VC?=
 =?utf-8?B?R2NzWXd2MXpScVFlQTlmMi93MzF1UTY1YlU2emJGZHFtZTdhcDB3WlI1MGZG?=
 =?utf-8?B?KzV6VkNUcS9MRHdORU1nMk81aE0xdkE5ejVXWU1CNXJsLzkwR2tjVGxIV3c5?=
 =?utf-8?Q?rIsxPH5VqPzT0JF7LBzEdnwzO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c425a3-096a-4400-b889-08daf55026be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 10:23:02.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aprvQKLrkT8JtflhDDBgm/jWSBoEQ6nGwgFiISD1GA9QpSlnMaRq6+jYJU+3K18fYN7EdZquon02zCRkDaVKOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7397

(missed to CC Paul on the original submission)

On 13.01.2023 09:47, Jan Beulich wrote:
> First of all the variable is meaningful only when an IOMMU is in use for
> a guest. Qualify the check accordingly, like done elsewhere. Furthermore
> the controlling command line option is supposed to take effect on VT-d
> only. Since command line parsing happens before we know whether we're
> going to use VT-d, force the variable back to set when instead running
> with AMD IOMMU(s).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was first considering to add the extra check to the outermost
> enclosing if(), but I guess that would break the (questionable) case of
> assigning MMIO ranges directly by address. The way it's done now also
> better fits the existing checks, in particular the ones in p2m-ept.c.
> 
> Note that the #ifndef is put there in anticipation of iommu_snoop
> becoming a #define when !IOMMU_INTEL (see
> https://lists.xen.org/archives/html/xen-devel/2023-01/msg00103.html
> and replies).
> 
> In _sh_propagate() I'm further puzzled: The iomem_access_permitted()
> certainly suggests very bad things could happen if it returned false
> (i.e. in the implicit "else" case). The assumption looks to be that no
> bad "target_mfn" can make it there. But overall things might end up
> looking more sane (and being cheaper) when simply using "mmio_mfn"
> instead.
> 
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -571,7 +571,7 @@ _sh_propagate(struct vcpu *v,
>                              gfn_to_paddr(target_gfn),
>                              mfn_to_maddr(target_mfn),
>                              X86_MT_UC);
> -                else if ( iommu_snoop )
> +                else if ( is_iommu_enabled(d) && iommu_snoop )
>                      sflags |= pat_type_2_pte_flags(X86_MT_WB);
>                  else
>                      sflags |= get_pat_flags(v,
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>      if ( !acpi_disabled )
>      {
>          ret = acpi_dmar_init();
> +
> +#ifndef iommu_snoop
> +        /* A command line override for snoop control affects VT-d only. */
> +        if ( ret )
> +            iommu_snoop = true;
> +#endif
> +
>          if ( ret == -ENODEV )
>              ret = acpi_ivrs_init();
>      }
> 
> 


