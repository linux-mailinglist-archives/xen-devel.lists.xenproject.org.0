Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84765ED53
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 14:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471920.731966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDQUM-0006P5-6t; Thu, 05 Jan 2023 13:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471920.731966; Thu, 05 Jan 2023 13:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDQUM-0006MV-43; Thu, 05 Jan 2023 13:40:58 +0000
Received: by outflank-mailman (input) for mailman id 471920;
 Thu, 05 Jan 2023 13:40:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDQUK-0006MP-MH
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 13:40:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 936cee6e-8cfe-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 14:40:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:40:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 13:40:52 +0000
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
X-Inumbo-ID: 936cee6e-8cfe-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m624Ro/TcUAEGaZVcd4acTgTW6U39SATAspbq+q2l/GlxHLMFFs/jMoQYrLHg2HUdB7UdPrff4hxL5uLNKgIkDy649wDM0AL1WCIlJvpLIT7CftEjBWBSQhcM2kxPuU7YezvwZPXcGrvafJvL9Jgg/3WcEoVO/OtxVY/VRNiqs4yPCV9sVuXJebcmjHCVpMGt7F5lCyhhVgrplegt29SOum4uDQG/z578Xq2O38rev0pQXjhH3hBzIvW8o0bAbJ+c+u73xXuN4YqSY3qTSDUrBBA+y8rGhQZglELwLOTYiTihpWtqxNky3OHgfMXBVQDtfOca5JF+HtO4Voswe7Kgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ELXjnIH1l3VfliUzSU5AAkC8qMZTwHQR5Hju6YtaeU=;
 b=IRuIvA7TG5JizJU36HLurET2P9CUDOAhLJRKh8z9g5jwH/uBfHSQmDYJFsoOhVX0O3WTkbhwEWqhgFwBlZ0D8RkK0XBIigjUW3pBxgXk4/fOCkAFTxmH0GSDOwJZ7K1BVb0SGylT9+iQTa/m/DvjQw6rmi5PsIe0Mzuk1BMpj+RuYKHoR0ftUstUNYPPQ1Rwy+YIgUWsndz7FZ1ru19IMpXX4NxYUTJSLUkCwkOJZX1BBRRT6mQBPa2uP5zjxm9ogoAisHSl3A6XtmhkItrrZb6xwNkbIU9exdmkR2MKokycbIfObKO6BaNUCU+UEqU6NwyE+f+DbhdkQ4VqrMUq2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ELXjnIH1l3VfliUzSU5AAkC8qMZTwHQR5Hju6YtaeU=;
 b=ooz5FSMRqfE/Z/YNVWn3rteEnJGUV+RcWByOisrMOe0zPpu6CsRlTE/FjKh+H3I2YkisshArPO4jVx65WFFJogjhFf9SXSgOqWqMZiz51xzK3P8j4dC3+FK6+o/pDZMmKR2P+RuvDx8yYnqYxfLNuP2VWb23XXq6y2GT9zBoQ4ZYN1UBbkY2bkxKQ+H9VKMUTNnM2hIZt6sWQskJcjAfeSlFkLEFYis9J2WAboK3TccZLnx0CJFYqo5iyrGCjs47za61nK3+dF+A6Kf0pakSnHF/RnSsP78xU8niPyWvlQz+EQFsg7d6Zha3UmJehW21Hu+EuZMarb83ymwjJHh+PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <591d6624-2bd2-93f0-f5d6-760043230756@suse.com>
Date: Thu, 5 Jan 2023 14:40:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/2] arch/riscv: initial RISC-V support to build/run
 minimal Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, xen-devel@lists.xenproject.org
References: <cover.1672912316.git.oleksii.kurochko@gmail.com>
 <ef6dbb71b27c75fe0dffb72d65ab457d27430475.1672912316.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ef6dbb71b27c75fe0dffb72d65ab457d27430475.1672912316.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 34acf9eb-9845-479d-3821-08daef227638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pzGs7xX+Ai8f9dpJatylOgWefTQBh6RVFqcG0BMBVkRPmT33fRbfPtuvbZKSvQtTPyS5BCnVyDtK3TK1rdbo/rFuThXSwZNV8vVqfu4fXrxgMAWp98d42eaQU33dngK3CvDI+DzR8Ifili8NB/R0JCbMavSSWjMxNqaq4MogUHDIUXstdsdRB0xZzf0+KP0j5LCnauniC2p/cjlKoPmQI1p1n0bczE1oXJVayyFSf+PAkmoDewgQ2D+DM5SFmWVZP5rdhPst7KN4CHL0h6pNJ4KhdLP0IcyM+/fG4RlRt09iQji1fg8y1PRonfQTs/ecsDcs+JnTQXgEWTlp2ScAtRIbNl7cEmTzOHke2mJuZi0z9VSppacqFbzdidJVu5Vb/ran3PEOU6oBx5cyFZqjXWT8mOLzS+quDQA0p4R02n4ec8oQwOLx9EQEaXzsVLK1XXmDpVNOXjgcORFJCrLNqlQQYpZfwdMHJUwL8UryZKbk07QpWPa8Ds8Qpo7VTPQg0Ti6qoNLB8Ewu9FKdpYRWKuqRJnX7tT2Er7R6J+xHcLp7CPoAW7Sy3ghZ676fLGVLWxn3gSIzY3ih1WtK2bZ5L1qFgDOJsC+UxrSrVn55vr/LdSwV9cKJ3n/7w0lGlOgAIbFNoczFzejZvORkd5K5vz/EO75Io4p5ddVGmDKgvTKApuy/kKmx1AWPa6Mj6crPGdIEN9R0jYCAJAd7sfb6lw8QDsGzDnTuexy8ET47xE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199015)(31686004)(53546011)(6512007)(186003)(66476007)(6666004)(66946007)(26005)(66556008)(478600001)(6486002)(2616005)(8676002)(6916009)(41300700001)(7416002)(8936002)(83380400001)(4326008)(5660300002)(2906002)(38100700002)(31696002)(86362001)(316002)(54906003)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVBlbUlVRWJGM0VXZ1ZFbjZ3bVY4MVVBWFc3R3daVFlORHU2Y0lwYWcycU1P?=
 =?utf-8?B?QWgzbzJIaU5sbndtVUxsQkIrRUd5N0JrMHRBdVkwR0toNWVQMUZmNC9lYXdy?=
 =?utf-8?B?bWMrSmRBak04Tjc5SUcvdGs0em1ja1VaeGtUMHBucE5JeEtzMDhhWTBXVk4x?=
 =?utf-8?B?bXFJLzNCb0FscVpmbDJzRVZEVVpFN2ZTZTFSN2RkS0VUallNKzRCdzFreVV4?=
 =?utf-8?B?THBBWnlNS0RDTE1kVU9sbnRuZys3ZkFHczBtY1RvR2RrM3dtOXFIdmw1VzVw?=
 =?utf-8?B?TGJXZmdDdU9TY0Y4OXZzWHppVk4yUy9icUsrNzBZdnFXdEkvdUxNSlJWbWRN?=
 =?utf-8?B?VjdGdVlsMys5NFU0QTBNb1UwZFBvYkVxS2U1UlhncUkxNDg3S2VhWjdreHRJ?=
 =?utf-8?B?b0FaYndxZzNxM0swNDluRVB5YUxCQVF2bFhleVpoMUVWcEJHM3IvSlpMc2NT?=
 =?utf-8?B?aHBzNm9OTXZrVW5ZTHVTT1d0SzZBZDJNbW5tYkVrMDVEWis1WGRJZmE4YW9Q?=
 =?utf-8?B?Q2FDdlNwbmFwUjN2ZXM4SkxmNXh2STZsWEVUOVpGN2o1YUdxRkM5Qjdaem5s?=
 =?utf-8?B?VDh2OG1lOGFTcExORVZwT2l0TnBtUG9pVktLSkxJamhUSUVycm83aGtQcWYv?=
 =?utf-8?B?amRNeE14S3EwbmFVTUlWN0JzZVZDMGJDaVZOU200L3BNckVob2JJWUVhV3dv?=
 =?utf-8?B?S1hvYXJOWjBqeTZIcFowczcrTW9xY1R3NGdGeE1mNUd3WVB4TEtQd0w5VnE4?=
 =?utf-8?B?SHlXRWNQcFlzVU1KTmhIOXRFYmpJT2c2L0l2Z3A1eFRVcGpCcXg2NWE0SDFK?=
 =?utf-8?B?cWxQYmJRbkJXajA4NEg4WncrL2J5RzZ6RnpjdmlyRlVscUhLL0FiL1J3Wmk5?=
 =?utf-8?B?V1VLR05NMXBsWStOcFd6eWpaeGw1NjJHbFFUbkhTQkN4TVJFdVdBVnJRbmNG?=
 =?utf-8?B?dC9YUmduQnRrbjdtWkE1S285MmY3bWo2WUNRcngveTRzSGlmOXhGTElKbXl2?=
 =?utf-8?B?cWRXaW5GZkQ2KzdMbHcrU2IzT0N4Zjl4YXQxOThQRkw0SkM3S0VBS0RXYjdx?=
 =?utf-8?B?bzhscUdRbDROLzBRNXBNajRoSHY3WFhTbTU2UFZqMmRKZjRZTXlnN3Aya1VS?=
 =?utf-8?B?M1RoeEgvZ3lzaHp3TFdCSnkxQXc0cjVWYVE3L0V6YjMwa3BaOFd3ZHZZay80?=
 =?utf-8?B?RmwyenJDQ09uRTAra0JRNkxhY3dua05jUEU4eXRZSGdSUkVmQW1LN3g0U3kr?=
 =?utf-8?B?eVU2WFdxeEFxMkpaL2Mxc2JMY0tpQ2JUZWswNjNVdTllY3EzQS9TS0I4M1Fh?=
 =?utf-8?B?YlZtZnh2Y3ljN29MNkpwa0ZzZWQrVmdhQzgrQTUwbzhBNTZVOEtCWnhNM1dM?=
 =?utf-8?B?eC9SMnJ1MGFOOVNhaUI4YTJ1VmlheXVlL1lRQzlTMCszNFdBcWVuOXhkeEJZ?=
 =?utf-8?B?U2M1Q2psQmloUkJPdjJzN3k2bXYrY3FtTG1VelV5N0ZSQm9raGZFQmZ6MjYv?=
 =?utf-8?B?RkxoMlZsVnh6M09xYlNEWU9abXBoc21MUUJ4blNKZzIxTEl1bGxqU3dHbEs4?=
 =?utf-8?B?enUwRStLeEt2YXEveWVzTlJYT3pvS2xtaUlrd2pTV2xPQjc5VUVRUUE3aHlq?=
 =?utf-8?B?NnZleGEzVDlkb3ZJemc4M2o2SldLTGpkS1ExRUFXcTZla01zRkxqTngrNC9D?=
 =?utf-8?B?YmkxbEhwTUhENS96RXlhUHlrd3ZDMDZ1aC9VNDRNc1hWNmJUa1VUU1E4bXhU?=
 =?utf-8?B?Y0xacXkxaE1yOUR4WWFDcGZMdWc1T0o5Nnk4UXE2aE1nREhWOUttQVRFdHlR?=
 =?utf-8?B?VGxWalAxbGdmdEVhWW9oSWhtWGZzQlJwNTlCMm03a01pVUo1WW9Jdy9LRzh0?=
 =?utf-8?B?bC93ZDlCMmxZS1Y4NHRDWTNiZkJOZlB3amRUbHE1SWpxdlUvOUpHc0NQZEMz?=
 =?utf-8?B?VEQrbkhOMEV6OUtMZ291TWUyRUNJQWlqNU1pMXJLMHJUOGU4Yk5OdlRSVGNV?=
 =?utf-8?B?cmJUQmF6aXlSSXdCV3M3ZDRZM3V2UWFOZTUvOGlpUGwvNnExL2p4MjFCNXFO?=
 =?utf-8?B?TEhUWWhjNWdzK1VGdUl1UmoxRzZMeVlQRDFpaEh5dTErVk41NGI0SWRBUnU2?=
 =?utf-8?Q?ds23T5EUeu+hFWT0NBqNLNx1o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34acf9eb-9845-479d-3821-08daef227638
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:40:52.0012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6w1sdHbXCPJwQcfaUlFXsm1kpjD/VMJ95ECxDVAcNWV3lxcv2lUGwY2+svSx4fe/r8RkbQ6IsyNfdFMwTRkAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640

On 05.01.2023 13:01, Oleksii Kurochko wrote:
> To run in debug mode should be done the following instructions:
>  $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
>         -kernel xen/xen -s -S
>  # In separate terminal:
>  $ riscv64-buildroot-linux-gnu-gdb
>  $ target remote :1234
>  $ add-symbol-file <xen_src>/xen/xen-syms 0x80200000
>  $ hb *0x80200000
>  $ c # it should stop at instruction j 0x80200000 <start>

This suggests to me that Xen is meant to run at VA 0x80200000, whereas ...

> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -1,6 +1,9 @@
>  #ifndef __RISCV_CONFIG_H__
>  #define __RISCV_CONFIG_H__
>  
> +#include <xen/const.h>
> +#include <xen/page-size.h>
> +
>  #if defined(CONFIG_RISCV_64)
>  # define LONG_BYTEORDER 3
>  # define ELFSIZE 64
> @@ -28,7 +31,7 @@
>  
>  /* Linkage for RISCV */
>  #ifdef __ASSEMBLY__
> -#define ALIGN .align 2
> +#define ALIGN .align 4
>  
>  #define ENTRY(name)                                \
>    .globl name;                                     \
> @@ -36,6 +39,10 @@
>    name:
>  #endif
>  
> +#define XEN_VIRT_START  _AT(UL, 0x00200000)

... here you specify a much lower address (and to be honest even 0x80200000
looks pretty low to me for 64-bit, and perhaps even for 32-bit). Could you
clarify what the plans here are? Maybe this is merely a temporary thing,
but not called out as such?

Jan

