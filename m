Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B241286FDF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 09:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4263.11503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQQgB-00007q-5Y; Thu, 08 Oct 2020 07:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4263.11503; Thu, 08 Oct 2020 07:49:35 +0000
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
	id 1kQQgB-00007P-2E; Thu, 08 Oct 2020 07:49:35 +0000
Received: by outflank-mailman (input) for mailman id 4263;
 Thu, 08 Oct 2020 07:49:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kQQg9-00007K-7g
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 07:49:33 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b65c7d19-1663-43c0-90c1-6041c147e048;
 Thu, 08 Oct 2020 07:49:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kQQg9-00007K-7g
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 07:49:33 +0000
X-Inumbo-ID: b65c7d19-1663-43c0-90c1-6041c147e048
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b65c7d19-1663-43c0-90c1-6041c147e048;
	Thu, 08 Oct 2020 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602143369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8oXHE9yaD0ZDiGDH+pTLdVL5S7SMWQLtXkvi2k8KzIw=;
  b=Dq5kVikpptVB3gBbMfzgHGdqn0Z3iVixVm0h3Xl9LOZQ5ib1L0M/X8ju
   lcoYhQ/aPXgHCuCclUsSFI8MubFDEHH4kL6fIda0nw/lKfF/UnvpeIB0p
   zwEpinqcbxSQjc0DjE1ZXm1RCfrsmbvYFmYtERbChegS5R6KTzs3xy4cH
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZXhjVTZXIdzLastKb3c60KsYO24CBlJcj8xrt1SJH6B2+4y2Z2g24dVydqT7JeuoxgwuJsDCvc
 hSSAWGuc6f8WFfNYEx4id86xfzFs0pNpBzzsnGylSE+LFKGyxnmzx8eO5Iawew3Zg3MofGhu6/
 hxpvhERqywhpYtrWSMojqViyida2vxj0K/SMSBTsiH+K+qwPU0ACTZ3B7KgmPxWY0puRtVmF5E
 nqkiunFJvR4CKtfp0OWbfg4NkXarJVH5oBNLI0zRP4OMrB2825dZNHpTZCrqIEZsr5wNg0Gufk
 P24=
X-SBRS: None
X-MesageID: 29580987
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,350,1596513600"; 
   d="scan'208";a="29580987"
Date: Thu, 8 Oct 2020 09:49:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/ucode: Trivial further cleanup
Message-ID: <20201008074920.GI19254@Air-de-Roger>
References: <20201007180120.27203-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201007180120.27203-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 07, 2020 at 07:01:20PM +0100, Andrew Cooper wrote:
>  * Drop unused include in private.h.
>  * Used explicit width integers for Intel header fields.
>  * Adjust comment to better describe the extended header.
>  * Drop unnecessary __packed attribute for AMD header.
>  * Switch mc_patch_data_id to being uint16_t, which is how it is more commonly
>    referred to.
>  * Fix types and style.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/cpu/microcode/amd.c     | 10 +++++-----
>  xen/arch/x86/cpu/microcode/intel.c   | 34 +++++++++++++++++-----------------
>  xen/arch/x86/cpu/microcode/private.h |  2 --
>  3 files changed, 22 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
> index cd532321e8..e913232067 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -24,7 +24,7 @@
>  
>  #define pr_debug(x...) ((void)0)
>  
> -struct __packed equiv_cpu_entry {
> +struct equiv_cpu_entry {
>      uint32_t installed_cpu;
>      uint32_t fixed_errata_mask;
>      uint32_t fixed_errata_compare;
> @@ -35,7 +35,7 @@ struct __packed equiv_cpu_entry {
>  struct microcode_patch {
>      uint32_t data_code;
>      uint32_t patch_id;
> -    uint8_t  mc_patch_data_id[2];
> +    uint16_t mc_patch_data_id;
>      uint8_t  mc_patch_data_len;

I think you could also drop the mc_patch_ prefixes from a couple of
fields in this structure, since they serve no purpose AFAICT.

Thanks, Roger.

