Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A562E9464
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 12:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61159.107353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwOU4-00014V-LF; Mon, 04 Jan 2021 11:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61159.107353; Mon, 04 Jan 2021 11:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwOU4-000146-Hp; Mon, 04 Jan 2021 11:57:12 +0000
Received: by outflank-mailman (input) for mailman id 61159;
 Mon, 04 Jan 2021 11:57:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rg9=GH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwOU2-000141-Pi
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 11:57:10 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f16432-fec2-4d9e-8cd3-c44deddc24c4;
 Mon, 04 Jan 2021 11:57:09 +0000 (UTC)
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
X-Inumbo-ID: e7f16432-fec2-4d9e-8cd3-c44deddc24c4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609761429;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OP8HI9ySVTS9duGoJ+MA0HVPvRwWQlmYQIx4wuiSiMo=;
  b=UnOT7uZfvXfxZ54W7X1BAFakRu4Jh6D0dSFoyt0XcFDeVs1MauVS8PRm
   Dq+3NE1H37VqEgzx4jHnTGkzGngmxiirk5mG69Ow1Lp4/ci9Uh+uFFTRw
   fAtljfhYTWoN6YZuGAVZHYhQLberbKrLNfX9YPLkAHgjHFk4evv4LWVG8
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: V+5tSa8PVBSHIzyVcnju8J5hBQAmb3a4pIfQDHze69n3rlnh0JBsIZz+JvaOK0KNQws/jr2YYC
 LGV4wdYsOcKGq6gxk0BWTJKLiMQfvIVdPC1sMczyjacE9eiov2zW7d6EdagmT99JJElyVwNmbZ
 oBlCEaBHYGVzlZTgZSj8e4hGmOpAjG6mqd6QUCpdjJx/4xmDa0f3P1Wzo4aO99ZXgZiHZ7z17y
 cRGzCrtrCjNgeBHeBvWho0hiC3dQWUz74CQnoO4sl9yG2xALpy2fvnyLUq7X3eMxv3ZUhzewgW
 GSU=
X-SBRS: 5.2
X-MesageID: 34331392
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,473,1599537600"; 
   d="scan'208";a="34331392"
Subject: Re: [PATCH] x86/vm_event: transfer nested p2m base info
To: Tamas K Lengyel <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
CC: Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20210103184117.57692-1-tamas@tklengyel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6a1d7087-5ae2-6a70-bee5-fdf521310d3d@citrix.com>
Date: Mon, 4 Jan 2021 11:57:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210103184117.57692-1-tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 03/01/2021 18:41, Tamas K Lengyel wrote:
> Required to introspect events originating from nested VMs.
>
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/arch/x86/hvm/monitor.c    | 32 ++++++++++++++++++++++++++++++--
>  xen/include/public/vm_event.h |  7 ++++++-
>  2 files changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> index e4a09964a0..eb4afe81b3 100644
> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -26,6 +26,7 @@
>  #include <xen/mem_access.h>
>  #include <xen/monitor.h>
>  #include <asm/hvm/monitor.h>
> +#include <asm/hvm/nestedhvm.h>
>  #include <asm/altp2m.h>
>  #include <asm/monitor.h>
>  #include <asm/p2m.h>
> @@ -33,6 +34,15 @@
>  #include <asm/vm_event.h>
>  #include <public/vm_event.h>
>  
> +static inline void set_npt_base(struct vcpu *curr, vm_event_request_t *req)

No need for inline here.  Can fix on commit.

> diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> index fdd3ad8a30..8415bc7618 100644
> --- a/xen/include/public/vm_event.h
> +++ b/xen/include/public/vm_event.h
> @@ -208,6 +212,7 @@ struct vm_event_regs_x86 {
>      uint64_t msr_star;
>      uint64_t msr_lstar;
>      uint64_t gdtr_base;
> +    uint64_t npt_base;

This needs enough description to actually use it correctly.

/* Guest physical address.  On Intel hardware, this is the EPT_POINTER
field from the L1 hypervisors VMCS, including all architecturally
defined metadata. */

Except, its not.  nvmx_vcpu_eptp_base() masks out the lower metadata, so
the walk length is missing, and the introspection agent can't
distinguish between 4 and 5 level EPT.  Same on the AMD side (except it
could be any paging mode, including 2 and 3 level).

Furthermore, (and more in reference to your pagewalk patch), it might be
necessary to know whether EPT A/D is enabled for the agent to do the
correct thing when getting a gla-not-valid fault.

~Andrew

