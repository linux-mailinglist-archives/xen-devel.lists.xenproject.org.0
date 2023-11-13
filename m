Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474927E9D19
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 14:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631588.985071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WxP-0001yl-8K; Mon, 13 Nov 2023 13:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631588.985071; Mon, 13 Nov 2023 13:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WxP-0001wW-5Y; Mon, 13 Nov 2023 13:26:27 +0000
Received: by outflank-mailman (input) for mailman id 631588;
 Mon, 13 Nov 2023 13:26:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2WxN-0001tn-Pp
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 13:26:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe13::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d215344-8228-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 14:26:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8333.eurprd04.prod.outlook.com (2603:10a6:102:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 13:26:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 13:26:20 +0000
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
X-Inumbo-ID: 3d215344-8228-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGFppOGfBlJDwFHwAMzU3o/+s/0UiAak1UNq2xFQzuVmRvVjCM3btYGWICPgMUFpTZbSxsA3IhDHZ0Q+0OP0Yl0Q5OZbADT9Bw150qrLax0OTeCtxvHGDlOHk4HhAVi41Nt39DnUhOExa405Vh+6LEpN1V6j2BPUvcSFu94sqK9b6PXL1TSUr/OGiBzENZYRIqtTRy0P3i1XMdmbWrHmRDkOq0nfYllgtOz/SB7SO4ybQKOlh9tWCjMu2ie3HqDqZqcDiwHluhbj4W8IUHSxUnGCvz7f6KXRwKPlO3DxsMurV/4RR/RimNjS6JOaCzyD+OxH2M8/d0Em77tcuAJoUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFH8jytYmMqvajP/YxTkVQzhONYAn6vuyGvA85sjerU=;
 b=ZjFGC9Ef9vkWFjAXohS9mbopxAbM09dgtbxmV9IXF5ARrww9eZNi80cJ8b4vLc8ALwQhgvxvQhN/E9I3qaeas7ZNs6eai4+SO6Rx2q9yYlWMGpPltAT1q1MHGOgQsRfQ1yPyfcR2ihLSGhlPqYEslfzyA8K4bJsGAKZhT599ocyC37SaKmIO5s/YLrQ3PWynYAv5Cqu0tp9Sshkw7UeTgx5d94GYaaavwqaKKSk8Bb8vdqyp4UQPD3tzQPPlMcLHeTjpEfQjR0IfDoEQu0QoGnp0E/yrbuG9Ssd1WTKOdrtv47afpG+UgzoiBJ4WSt845uVpTChiHzFSeAeqqMnewA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFH8jytYmMqvajP/YxTkVQzhONYAn6vuyGvA85sjerU=;
 b=yUW6oLn78Yb+F7YV8yvIyyr5M9rbpwCpwASWahMBRao9XL0/SOj+BCVPJ2YXPml9Pp8cPYS0/+LSEfD0GfiaZMR8EKw5U64nDzWcefK+l3d/k/y/8avlNaOHXhP3VHJ6ai3E8jO5hPDqcBqo8pIP8bvxTGrzFl85Sh72+24Dt/Oc8sGPHJZvR/r+UpneH7aUesd1tViGCJ4IkkXSZPLhIqjDevakOJyZTcp4J8QIHFCXJUfNLqlT2sl3z7XbHcxrdUIb81ABrJ5fBIPOdlJsqGpwe+At/VKwqPK2OHRcNR7C3+y0FgWUtpPVzBAdpT3pExTlLXIuguWYAEyTjc+ggg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f949fae-da52-7a8d-ad87-8fe84eeba8a2@suse.com>
Date: Mon, 13 Nov 2023 14:26:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] xen/vpci: move xen_domctl_createdomain vPCI flag
 to common
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Christian Lindig <christian.lindig@cloud.com>, xen-devel@lists.xenproject.org
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
 <20231102195938.1254489-3-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231102195938.1254489-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc3d989-38aa-4adf-ace0-08dbe44c1f9a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dgJ9SgSzBBj29bQtp2xiZqPOD/XmA+Ene03e2M9QfC+U5lGXl0velFfAjc9e94/6oW5GCTOFtpGUSyBIqcLYRBHdUZ8zPf8lj013UogVG8BQR9eJdOtMg1iJIiDV2M4cHv//H9nbDp5j3XT/bT/uoNLOg1OhJotUe9a055QznAd4USDCGHwqt5WI/bMfbDVe6jZ0gGzg/aXqOtxcCVRC1by/ms/FXWtEvRN11lmKj7/AO2/v89M80lC0oqpMr02TLkwGBBaIUfnu9PHV5H8Z6ztCFerlV8YBe7Vn4GyWKNQBWoURu6AyrWGbWL06hiVct16eXjRHOfZ4ofP+3/8dgiFyQboRr4Oh2BUPzroUPV8vcZ1D1Q8o8IdErbvCRNETn3ZyNVUdVJ47wn7yeRvPt7NYX+0CVEwTMuyDgTZhzV29o1eUlWlbCu4x1CeS9naCun6oX8vLwPm1FgBH+lH69ZPHLIj/i0ruW8ynLBhmcVM+eKPMUxnKpfupFMz6v06cPN7k5L8rJkOEamS+6dh53UeCPUKqBlNwrRs2A5WY9UEXNlh8tQibT5vgtCbEx9eFv8lgC9QoGSFpVZyi7BDw+I/Xc9EOplD0dwWvVMjYJ/lhPFCNLPrp18C5RhPdddmAhM5jSPHb+9oya5O/1vxc3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(26005)(2616005)(53546011)(6506007)(6512007)(83380400001)(5660300002)(7416002)(4326008)(8676002)(8936002)(41300700001)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(36756003)(31696002)(86362001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXlrQ0ZhUjJOZkNZdXRuS1l4L213aUQrelIxTW9JamttakZrT3ZlUkNSRzhK?=
 =?utf-8?B?djdTNnV1ckNxREp0RHJvSG5jMVZXeFBUNEZzZXlkRGJDT2ZRNXl3a2tWNDJX?=
 =?utf-8?B?VnNUdnJHa0tZb3JtOGhRRytZTzI3WmhQcnZLSFMrRlBhcXBnVWg4MStlbHdN?=
 =?utf-8?B?Ry9Fem0xMUZudTBWRWU1NlJ3SWMwSGZTZ2t5SnR3c08veU9CVVY3a2h1dmh0?=
 =?utf-8?B?aGJmV1RDUWs2QXc4ZHpLc3ErczV4ZkY4WnBDNWtPSkVzWjBlZ3NrN1I5SkJR?=
 =?utf-8?B?RkxsTmtPZjhncFNPb1o2dDhUOS9KWFh1Unk5UWI5V1VZZGJtKzZyTGhoSmo1?=
 =?utf-8?B?cFZ5Ri8ySkowcFovWHMzOExGeFU3Sy9ZUnZPNnNpVHM2V0VCVk9wczUrNDRL?=
 =?utf-8?B?Z3kxdk9aYmFQamJjeFJuMUNBbmxRZUU1anZXM2lQem9QdzBITWRvQVFyMmw0?=
 =?utf-8?B?eFJkYjlPWHJIMEo4alAwYThSbmFQOHF1OTF1cGNZMnhmQ0lOWUg3aFgwMkc2?=
 =?utf-8?B?TmRZY2FOL1g3aTJhVzhvb0lZM0ZsMUdlaUYyQm9RVVdUNTlqTGRPU1BvZlNO?=
 =?utf-8?B?bHFVS2s0VVFFVWNyNGRaSE84bHd3RUd5UnJrTG9ES1JsVFgybVFCeUtKTU8y?=
 =?utf-8?B?eUhPbGQvUUc3M09HejR1blRTRkUySXJhZVZLR0NYaEp6QWZuQ3FRRHVnT3ZM?=
 =?utf-8?B?eFJBMGZiWjVkUVhNczBBNXhIL0hxNjRkc0MyYmR0NHExVk5MSFpvVjBHNDNZ?=
 =?utf-8?B?eWxDUFBXaXpQZEdDVjFVeDV6a3JwNS9HK3hER1VBbXJvOHlGOFlOckFaOGtR?=
 =?utf-8?B?TDRxY2tIWjZBTk5DNTlBbkxTbUZHT2VzQ3RReDlkaUl4dEZXL3U2RUZETVor?=
 =?utf-8?B?eFN0dlRWcUUrbDJzc2tqWnRUYzVveXRVekRQaWw5d2YrOWx5Wlo3cUxXb3Jp?=
 =?utf-8?B?a2xpdDdMTEMrSEpVZDZOVjh5U2hxeEU2Vi8vbVdUY2FHUFYzZStEcmxFeGtL?=
 =?utf-8?B?TGhuKzU5cVd2dG1SMDBzc3luQUxCVTFubyswc3dpNFlRNTN3Qm90UFUrQkVW?=
 =?utf-8?B?UjhnUTdWOC9nK0pKcTdoZktPY3hnejBNNktZbVlXV1kreTdBTldRakxEUHAw?=
 =?utf-8?B?RWtmTVVCRjA0VEE0QlBQejBzS1dRMzhDRGhCemdrMFlrQmRoSFNUYXJOd3Qv?=
 =?utf-8?B?M3hjM2FKK0lIOFJodXVBbkxqNzBxSk5KM05IbGhGU2NaQ1hTQjZpZC9ZK3Bj?=
 =?utf-8?B?WTM2dDdycnVROXBCWlluYW0xUitKb2pjVUpLbzJkbG90L3VkWmc1SkltTXo0?=
 =?utf-8?B?YUN0cm9jMWxCTXplNVQwUUxFVUJXSE5nanA3L1ExVWdvazU3RXdhMm13cVpI?=
 =?utf-8?B?elU1T0c5TVZhSk9DNGkrMnJVVldjMVB5MlZ6dW1BcjhWL1BvSmZZcldxWXlq?=
 =?utf-8?B?NjRNR2NrbUtIdGRvMUlGSkh0Y0FvSkpjSmVWcXZ6eVFieW90TGVSV0lkRGpm?=
 =?utf-8?B?OVBNelUxRWkxSTdmeVM2ZUVlU3duQWFwTmNQejFmSERzeG80Rm1URk5kcm53?=
 =?utf-8?B?RzBrWWR1NTI2MCtYTFhwTHJyQ25DWktnRU8wbmFQRHZubG9HazhsdkpxQUdy?=
 =?utf-8?B?VkpSNkpuS3JUMTBkRTZCVVNFVlluekp3MTdzRnMxcUVxb2x5M2RSdFFDVUFQ?=
 =?utf-8?B?azZER1dVWmFqdzJMTEVMU2M3ZWVwaFFUWk5Vdll2WnE5eER0Q1dPNDJHVWdt?=
 =?utf-8?B?N0ZvRk95ZVhOV1ZzYS9UNE5MbmU3UU1seEJUOFBaRkhEUGNxOXdpd2RQUitX?=
 =?utf-8?B?T2xXLzBxNVVlejB1L3NJY2FUT3oydGpPbXdiaVhNWE15S1ZpVHVMSXdOSEdX?=
 =?utf-8?B?eFliZklmeUEyM0h0TDdqRzAwNUQxcGp1dFlORlVHbndlQ2NlZHlkcTBYRlBT?=
 =?utf-8?B?b09lOHMybDRBWWp4cFFYaGhscS9rQVdqTWpvblMyYTRyeDZpWnBWL0hRcXRG?=
 =?utf-8?B?VzQ4VlVzSjNSSHpLbXNHcDdqWkdNMEFkMndxVGFUdGJrTzloa2ZTaDVIcXgx?=
 =?utf-8?B?L1NXcnpzVGllc05YaHFFeDhCUy9MS0tuUTZidCswT3RDUnRwWnE5YlExTkl5?=
 =?utf-8?Q?dMu+JUVU2XZJNDOXMrTga5xr7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc3d989-38aa-4adf-ace0-08dbe44c1f9a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:26:20.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGP08Mu6PlqfQu3fyXxQfbJKQYICkyJafHl0glAmFtNy07jbHk5Wght2ymY8nDFyyqMzEEvcUjWMInQi9SrLZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8333

On 02.11.2023 20:59, Stewart Hildebrand wrote:
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -8,13 +8,16 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  {
>      switch(d_config->c_info.type) {
>      case LIBXL_DOMAIN_TYPE_HVM:
> -        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> +        config->arch.emulation_flags = XEN_X86_EMU_ALL;
> +        config->flags &= ~XEN_DOMCTL_CDF_vpci;
>          break;
>      case LIBXL_DOMAIN_TYPE_PVH:
>          config->arch.emulation_flags = XEN_X86_EMU_LAPIC;
> +        config->flags &= ~XEN_DOMCTL_CDF_vpci;
>          break;
>      case LIBXL_DOMAIN_TYPE_PV:
>          config->arch.emulation_flags = 0;
> +        config->flags &= ~XEN_DOMCTL_CDF_vpci;
>          break;

Why all this explicit clearing of XEN_DOMCTL_CDF_vpci? I can't even spot
where the bit would be set.

> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -159,7 +159,10 @@ static PyObject *pyxc_domain_create(XcObject *self,
>  
>  #if defined (__i386) || defined(__x86_64__)
>      if ( config.flags & XEN_DOMCTL_CDF_hvm )
> -        config.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
> +    {
> +        config.arch.emulation_flags = XEN_X86_EMU_ALL;
> +        config.flags &= ~XEN_DOMCTL_CDF_vpci;
> +    }

Same question here then.

> @@ -575,6 +577,18 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( vpci && !hvm )
> +    {
> +        dprintk(XENLOG_INFO, "vPCI requested for non-HVM guest\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( vpci && !IS_ENABLED(CONFIG_HAS_VPCI) )
> +    {
> +        dprintk(XENLOG_INFO, "vPCI requested but not enabled\n");
> +        return -EINVAL;
> +    }

Maybe flip the order of these checks? But I'm uncertain about the first
one anyway: Isn't this something that needs deciding per-arch?

> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -283,15 +283,12 @@ struct xen_arch_domainconfig {
>  #define XEN_X86_EMU_PIT             (1U<<_XEN_X86_EMU_PIT)
>  #define _XEN_X86_EMU_USE_PIRQ       9
>  #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
> -#define _XEN_X86_EMU_VPCI           10
> -#define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)

This, aiui, being the reason for ...

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -21,7 +21,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
>  
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017

... this bump, I wonder whether nevertheless we wouldn't better leave a
comment there to indicate that bit 10 better wouldn't be used again any
time soon.

> @@ -55,9 +55,12 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>  /* Should we expose the vPMU to the guest? */
>  #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
> +/* Should vPCI be enabled for the guest? */
> +#define _XEN_DOMCTL_CDF_vpci          8

What is this needed for besides ...

> +#define XEN_DOMCTL_CDF_vpci           (1U<<_XEN_DOMCTL_CDF_vpci)

... its use here? Imo like was done for vpmu, there should be only one
new identifier. As an aside, there are blanks missing around <<.

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -51,6 +51,9 @@ void arch_get_domain_info(const struct domain *d,
>  
>  #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>  
> +#define has_vpci(d) (((d)->options & XEN_DOMCTL_CDF_vpci) && \
> +                     IS_ENABLED(CONFIG_HAS_VPCI))

Aiui the IS_ENABLED() is wanted so where suitable code conditional upon
this predicate can be eliminated by the compiler. Question is whether
we can't achieve this by, say, overriding XEN_DOMCTL_CDF_vpci to 0 in
such cases (without touching what you add to the public header, i.e.
not as easy as what we do in xen/arch/x86/include/asm/domain.h for
X86_EMU_*).

Jan

