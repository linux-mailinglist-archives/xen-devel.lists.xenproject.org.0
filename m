Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D94F92D2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 12:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301325.514223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncllZ-0005V2-Lz; Fri, 08 Apr 2022 10:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301325.514223; Fri, 08 Apr 2022 10:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncllZ-0005SP-Iz; Fri, 08 Apr 2022 10:22:57 +0000
Received: by outflank-mailman (input) for mailman id 301325;
 Fri, 08 Apr 2022 10:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=co1q=US=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1ncllY-0005SJ-CQ
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 10:22:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id da5c6c9b-b725-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 12:22:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38EE811FB;
 Fri,  8 Apr 2022 03:22:54 -0700 (PDT)
Received: from [10.57.7.146] (unknown [10.57.7.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24E633F73B;
 Fri,  8 Apr 2022 03:22:50 -0700 (PDT)
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
X-Inumbo-ID: da5c6c9b-b725-11ec-a405-831a346695d4
Message-ID: <363333de-0ec9-dff7-09c3-426530657a43@arm.com>
Date: Fri, 8 Apr 2022 12:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 2/2] xen/arm: Add i.MX lpuart early printk support
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 julien@xen.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>
References: <20220407024418.9827-1-peng.fan@oss.nxp.com>
 <20220407024418.9827-3-peng.fan@oss.nxp.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220407024418.9827-3-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peng,

On 07.04.2022 04:44, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  xen/arch/arm/Kconfig.debug              | 14 +++++++
>  xen/arch/arm/arm64/debug-imx-lpuart.inc | 52 +++++++++++++++++++++++++
>  xen/arch/arm/include/asm/imx-lpuart.h   | 22 +++++------
>  3 files changed, 77 insertions(+), 11 deletions(-)
>  create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
> 
> diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/include/asm/imx-lpuart.h
> index 111640edb4..26e2cf0249 100644
> --- a/xen/arch/arm/include/asm/imx-lpuart.h
> +++ b/xen/arch/arm/include/asm/imx-lpuart.h
> @@ -30,10 +30,10 @@
>  #define UARTFIFO          (0x28)
>  #define UARTWATER         (0x2c)
>  
> -#define UARTSTAT_TDRE     BIT(23)
> -#define UARTSTAT_TC       BIT(22)
> -#define UARTSTAT_RDRF     BIT(21)
> -#define UARTSTAT_OR       BIT(19)
> +#define UARTSTAT_TDRE     BIT(23, UL)
> +#define UARTSTAT_TC       BIT(22, UL)
> +#define UARTSTAT_RDRF     BIT(21, UL)
> +#define UARTSTAT_OR       BIT(19, UL)
>  
>  #define UARTBAUD_OSR_SHIFT (24)
>  #define UARTBAUD_OSR_MASK (0x1f)
> @@ -42,13 +42,13 @@
>  #define UARTBAUD_TDMAE    (0x00800000)
>  #define UARTBAUD_RDMAE    (0x00200000)
>  
> -#define UARTCTRL_TIE      BIT(23)
> -#define UARTCTRL_TCIE     BIT(22)
> -#define UARTCTRL_RIE      BIT(21)
> -#define UARTCTRL_ILIE     BIT(20)
> -#define UARTCTRL_TE       BIT(19)
> -#define UARTCTRL_RE       BIT(18)
> -#define UARTCTRL_M        BIT(4)
> +#define UARTCTRL_TIE      BIT(23, UL)
> +#define UARTCTRL_TCIE     BIT(22, UL)
> +#define UARTCTRL_RIE      BIT(21, UL)
> +#define UARTCTRL_ILIE     BIT(20, UL)
> +#define UARTCTRL_TE       BIT(19, UL)
> +#define UARTCTRL_RE       BIT(18, UL)
> +#define UARTCTRL_M        BIT(4, UL)
>  
>  #define UARTWATER_RXCNT_OFF     24
>  

I find it a bit strange that you fix the header file in the patch 2/2 while
patch 1/2 introduces it. Could you do these fixes in the patch where you
create this file?

Cheers,
Michal

