Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CECA1F6C20
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 18:25:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjQ0V-0000KL-GL; Thu, 11 Jun 2020 16:24:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSbG=7Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjQ0U-0000KG-Lz
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 16:24:46 +0000
X-Inumbo-ID: 0f700ae2-ac00-11ea-b547-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f700ae2-ac00-11ea-b547-12813bfff9fa;
 Thu, 11 Jun 2020 16:24:45 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tovZV+l39RiBDrBJJGwxu3BCEAirlTXlvnO4jTfDXJ9Qy+ln2QMsm74hjZ6sNd9yR3jlpJMQBO
 pJsMH9jMauN0kxNZp9eQhiWtAeqLxdwnX3uC9NudbPklAtW18ZS3xTr4FYD6Nu5Mc7oWwuIBGK
 jLHnrVN8jcIjt0/pVZR0c1XYAB/VPSG0Eka5E1HttgDvnVTdIXJq+KB1ZyF/GFe7fpSZxpYb+D
 odKapN6xmU9acSKDSXbMGJeUhRLzn2ROjZaZkFl4fPQH0MFYnHAujKvJfhcFETfp2dCB6/Epge
 inU=
X-SBRS: 2.7
X-MesageID: 19824800
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,499,1583211600"; d="scan'208";a="19824800"
Subject: Re: [PATCH] x86/boot: use BASEDIR for include path
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 <xen-devel@lists.xenproject.org>
References: <c945e231995ac708bf7b7e3d6ec82e08d4a42bf6.1591806680.git.bertrand.marquis@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5cf46b52-6a57-3e11-67a0-28f841865c1e@citrix.com>
Date: Thu, 11 Jun 2020 17:24:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c945e231995ac708bf7b7e3d6ec82e08d4a42bf6.1591806680.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: nd@arm.com, Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/06/2020 12:54, Bertrand Marquis wrote:
> Use $(BASEDIR)/include instead of $(XEN_ROOT)/xen/include for the
> include path to be coherent with the rest of the Makefiles.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Does something subtle break before this change?

~Andrew

> ---
>  xen/arch/x86/boot/build32.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot/build32.mk
> index 5851ebff5f..8cd5403926 100644
> --- a/xen/arch/x86/boot/build32.mk
> +++ b/xen/arch/x86/boot/build32.mk
> @@ -5,7 +5,7 @@ include $(XEN_ROOT)/Config.mk
>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
>  CFLAGS += -Werror -fno-builtin -g0 -msoft-float
> -CFLAGS += -I$(XEN_ROOT)/xen/include
> +CFLAGS += -I$(BASEDIR)/include
>  CFLAGS := $(filter-out -flto,$(CFLAGS)) 
>  
>  # NB. awk invocation is a portable alternative to 'head -n -1'


