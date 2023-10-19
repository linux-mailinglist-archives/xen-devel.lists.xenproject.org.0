Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1AD7CF37F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619002.963440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOyK-0004d2-VJ; Thu, 19 Oct 2023 09:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619002.963440; Thu, 19 Oct 2023 09:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOyK-0004bB-Sh; Thu, 19 Oct 2023 09:05:40 +0000
Received: by outflank-mailman (input) for mailman id 619002;
 Thu, 19 Oct 2023 09:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtOyJ-0004b3-Uq
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:05:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac1f73db-6e5e-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 11:05:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8871.eurprd04.prod.outlook.com (2603:10a6:10:2e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 09:05:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:05:36 +0000
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
X-Inumbo-ID: ac1f73db-6e5e-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia2HBhunl4Yxj7J2kIkpANnNjTCd+xb+7dohKGdmzl/CgWud4oxav3XfMkyBMBQogc0ULBjNBV5Z1n5pArZTH/DYmvRpi3VpM5F7l8BZAst79+ssUc1YmIlo7zJJk5j/FVOCqLS+HCJOSYAcuxqy9eaLSm1YiLMlbw+0eceNiaBMc/x23Ey8p0nmVohW9nDNrpsZqRQ8+j04yv8Ll5j4GwV0hBvQhr62D5S8vCYemT+iwDUsEMvNSs4vpw9jMFhc9ZWTCPEdUPNwRYxKaj6FZjEhS8XNryNuVlsVHkL5y+ZMzaIVTPOp/9F3ys1kadqO/YpmkABj0aNHBjTzBxwy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUKz6YViOKcxiPSWSVo90ESDt9sgAVkTjfsUd1/DHfA=;
 b=VTRTGM9JtsmY8CDFHknA43CPunTFiB6+O96vsOXJ7+h8CnoJghnGXQ1jKNnm+eNWZJYZjVbce6bYoLg9nFS95OdGlcOIBQbdkFf0kcsIqVXSUyrLrO8eVBhlOERL8swmHmLjvgAX+Clc6zminOWDTNEgXnk+DkrT6J95PnsxTyKCVugcLgunLf53vYiHxdCvA3cKMs9q0PFbjZSntyq4D6F9x15WXhkgvBR4r46uVkP5InfLGpmNskD2JOGvPunfxeVWeL0FnYEhaEor3FQfxQhbJCFuhw3ji83inR5Ez09B2V7mvxdFzzkdlsiBMmNFaCao8XJEIacYDN7bVu9ShQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUKz6YViOKcxiPSWSVo90ESDt9sgAVkTjfsUd1/DHfA=;
 b=A26INJOE7nDupMKFTrdE8xmoScQrzkWUPy6HdKKYSBNnonycX2WHFFeF+DhleFtqz68odhwS+jOsz5b7LbxQJbKI1JikWcaB8V+V/H5SeMQJC9KmeFmjOqit0GtSbgHBWbGklQ+oDuJOETsPzcp02yR6lnxzmqB8JMLvTJe97A4z52Kwt3w3akaGecW2hx4hy7kD05PVEDUX8sJoVYN/kj3j5NPcqOD+p313KTen9xRjJJZvuAh1sHyntV7o90G+lv6KEsrfBNDRtKHmUzGRkzCvCfMqGO41rnYEDApDvVKJgnvrTdl4zrO5wba0FKvRTAvfjxSibX5fxm906KOGdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0911e74f-73e1-6053-ce1f-ecea98ea5f17@suse.com>
Date: Thu, 19 Oct 2023 11:05:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 02/29] xen/asm-generic: introduce stub header paging.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <5def596788d602b9b34302630c91644952c7115d.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5def596788d602b9b34302630c91644952c7115d.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d54d6b3-066b-46b4-d8d5-08dbd0828ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UPy4M4lV0cl82VR3hGf5/ereUP1pEFWHhRipHxdvJVGCzvDkV5yuPkU3obFb7LQCNZVGefCNjZbQ26Oai72J14adoN2WtiCj/xBY1SUFWmlgtxsgMiWsdHuavLb6/TKTOedp+sch6wYk3NUbhpyn3bEYCvCltPADa6LmPCN2aWvSZ8oByz5YJZyLT16tvsPqMy+sz9eOkdl4JArpgJWZMZU+jgUREBEC6aOXgX0yPbWM0pWg1YbdDdw3vM+3dhRz6cFkMBGLKLq90U0N0hgIzV6q4mzGmjxQST4ZEzJJzjhUfQWmCOaw2BW/M9ZHIFoqNolZEUx1WKiDx6avse5swPv6x9RZpf6ekoSPFgtC+Hn9KFIEDdiV864DpbT9SrlYzu5jC/Lu1Nd1ZpytE5JW0kwez8918Ll4cY2ZGPXgecLvUJ3tcQhPKIunHNvTK3uWdp3fdet3Y0ALemPFGe7mOXLOy1zWpsJdf9+0SsdZRSCFtvg/cbfWpCZZpN2LzgBgr2nj/gJMSeUvBf1UAaSXDkVspkZqyw7DbtxTjBwOBhDIKqjXwf6ndDLsMdgtMfKoGYulicKqBppsbvzJv9B9RHU03IpancElP6xFnfcq4FwmzJtSjbj26ymMyvBqCLvPR54ZlaBw5/LjTSedfwizwXAMW3+9SA5i/qagr8cDsbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39860400002)(366004)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2906002)(4326008)(5660300002)(54906003)(66476007)(66946007)(6916009)(8936002)(66556008)(316002)(478600001)(6486002)(8676002)(41300700001)(36756003)(4744005)(86362001)(31696002)(38100700002)(2616005)(53546011)(6506007)(26005)(6512007)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ty9kSVArMGhyOEJQMCtqZDVtUzFheVpXVUQreDc1SUpQVEVoT01HMnFnZnli?=
 =?utf-8?B?UlQrSDlYeGdSSElnTlBCTVpjRmw1UmtrYlNRM2JBQTdxVkpsU1NhM1ZmQWNC?=
 =?utf-8?B?eS9mS2dzd0pyNUJJTitQYjk1WEFsaWJWOU95a3JPOTBDUnFScGhQTnBXQktR?=
 =?utf-8?B?QlBBS2NaU0ZQTUtDMUpaRVNmZlJCUzJFTHZmZERxUnYwamNtRUVIb0VLeTZo?=
 =?utf-8?B?Z1BkeTQxZHBvakx0bys4MDhXSjJKaERaT3RENWdheWxWWlVDenFJbkpCYktX?=
 =?utf-8?B?OVBKQ2ExSDRaRXU4WUJWODJDVU9wbTRGRU1wY1VUU0VVaDNhUlk3MXdvbS94?=
 =?utf-8?B?S2VSWnd2Z2ZteVgydm9ySmNPb05kSktwaWlUV1B6KytZOHZuLzEvQWgvWSsx?=
 =?utf-8?B?bXQ3R0plYittVVMvZXFTMlhoYlNrb2pNSDFwbGR5dUtEUURpL2Q5bVZWMGRu?=
 =?utf-8?B?eW9wWUlleFR6aWZxMFI5OEJqSXdZTnVudldRSkRtNDVGbzhka1AwZDZYaS9o?=
 =?utf-8?B?Y0ltb2gydUt4Yk9FYW5MTkswMFRSdlh0K0VIK1lUdnVIMUFYYVpDWXJ3S3lq?=
 =?utf-8?B?K04wTVVoRTZDOGx5aFBETHovcDI0V0gvRVl6bWxCenlHaWwydHdPMFVqQ3dv?=
 =?utf-8?B?dmZLMytmNDFTRmQwa01vaklITXZPT1JXcUVIZ1pEQWo0Z0pIQ25oQTNIVXp3?=
 =?utf-8?B?QnBKUW9rRmxLTUZQb0Y0T2RDK1lTY3NLWTFtZTVMcnArNVhjYU12WHFVd08w?=
 =?utf-8?B?YmNSSmU5MjNxTVIzQnRKd29SSkRmbGdwOVU3clkyT09ZMmhUMWJ3dnNQMm8v?=
 =?utf-8?B?dzcxVklBQkY5S28vTVdOM0ZtV3h5N2NZOFRIVElhK2RjUWdJMk5Lbk4vQ1ZI?=
 =?utf-8?B?M3cwTDVnR0swUlZsVWt1bUpncjRQa0gzR1dHQlY0aUdxM1VEWlM2MTBYVDlJ?=
 =?utf-8?B?bnl2SW1rSU5ZWjBTUFZ5WDhaeGJsaC90K1dnRU10OHlENTlpalUxZUx5SUN2?=
 =?utf-8?B?V3VlVHBBWWJnTmNsa2V2dGR5NGM2V1RPeXUzNzcvcG1QaWphR1R6cDJsM1I1?=
 =?utf-8?B?OXJhZjhWeFhFTlQzMzlUdUx4OHJxNFV6ZnRub2d1WkFaWWxWMFBRMXFLaERs?=
 =?utf-8?B?Y056aDhBMSs3SllsUzZRZS9NTXREU0NsL1JWeldqQy9DeHlQN3FFckhZaUpT?=
 =?utf-8?B?LzkzRGZhZnNqamhRNUc1Y3A4SzgvTUlOOFNBT2VMd2RBbUMxekM3ODJYa0dw?=
 =?utf-8?B?bmF4UUZLUkpPeHpKb25pVmRaWmFoUjE5K050WWVlbTBiV2NQTzFGbEVZdmdC?=
 =?utf-8?B?RW1XTHhYQlMwZHM2QVZRRnByMzErQ2w3SnBRK2RSSHBnNDlPSTBGS3NjQjZn?=
 =?utf-8?B?WVI1ZU5HWXE5OHFueFhJY3FCWHptVUJGWTJ1dnlwOG9hcm5sZVRPcjdQSWRy?=
 =?utf-8?B?Vk04VWVydDliUTdNYisxZlBnaWp1ZWFqRFhOVHNHUzFRWnJwMUVNb0wyQXJv?=
 =?utf-8?B?OGljRE9mZUN2b0NHL2lRZDNtd01INzJQd0MwNkxYa0N0R2ZIQzVXc3VGUE0x?=
 =?utf-8?B?NVN6RjRWeDR5akRiNkw3bEtXdmRLUGlpcUZQTU9JbjlyYmRzL3h6dmsyNlBs?=
 =?utf-8?B?SFBzUzcxS241SFRIWFUyaTZ2MkNxcVNCUU1NRTA3WFNNbURuRzVoNS9VVENu?=
 =?utf-8?B?R2VWbTk2KzZ4T3ZBdWZZbzZJVGZoNksxekNncjFycU5JeXRoa3g3UzJrUlkw?=
 =?utf-8?B?M1Y2Zkk1eGYzcHpVNmJpUGtrWFZYMU9nZktKdmNNNXlheXlrM3lFU1Uya1pJ?=
 =?utf-8?B?eHhMM3M5SFg5bmZXcVlEWHJYUUVIbk91WDd1cmUraGcvb3U0NEt0YnV0cCtq?=
 =?utf-8?B?R01zcGdKV0JOV243U0ZPNkJWaGkvL3htQ2ZOaDV1OVdaK2lsTW5YQ2Raak1L?=
 =?utf-8?B?VW5ieXN0STFBUWV2V28zaTc4QnAvSUJMN0dMWmZwV1hiWHdodVJmV21GNTJX?=
 =?utf-8?B?d2lwODFORFUreENSSVhPZzVtMUtlVk5Xd1EvbktVRi9FUWhDTGFuR0NaNTJn?=
 =?utf-8?B?RnI0U3h1c29LVmU4SVBvdkM0RDEvUkI0Z2tMR3pRMVRpbEZZUVpOdVJ2OXUv?=
 =?utf-8?Q?dgViystyB+HIy5tTm22z8PWs7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d54d6b3-066b-46b4-d8d5-08dbd0828ecd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:05:36.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtV7mmUDDRaFAMqmMTCCKVG/AnyyFOjzZJ7WQe4ManwvLZwNPzEQ/9PyKynHnC9PSkiCgu1NW+cQ0C103NFWTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8871

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> The patch introduces stub header needed for full Xen build.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/include/asm-generic/paging.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 xen/include/asm-generic/paging.h
> 
> diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-generic/paging.h
> new file mode 100644
> index 0000000000..2aab63b536
> --- /dev/null
> +++ b/xen/include/asm-generic/paging.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_PAGING_H__
> +#define __ASM_GENERIC_PAGING_H__
> +
> +#define paging_mode_translate(d)	(1)
> +#define paging_mode_external(d)		(1)
> +
> +#endif /* __ASM_GENERIC_PAGING_H__ */

Looks okay, but wants accompanying by dropping (i.e. effectively moving)
Arm's respective header. The description than also wants adjusting (it
wasn't quite suitable anyway, as there's missing context).

Jan

