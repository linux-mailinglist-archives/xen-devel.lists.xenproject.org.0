Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3128E20F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 16:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6758.17783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kShZw-0008Lk-EY; Wed, 14 Oct 2020 14:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6758.17783; Wed, 14 Oct 2020 14:16:32 +0000
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
	id 1kShZw-0008LL-Ay; Wed, 14 Oct 2020 14:16:32 +0000
Received: by outflank-mailman (input) for mailman id 6758;
 Wed, 14 Oct 2020 14:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBOb=DV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kShZv-0008LB-7l
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 14:16:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28e2a1a6-6a1b-44e9-a08f-a95bd06020d8;
 Wed, 14 Oct 2020 14:16:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WBOb=DV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kShZv-0008LB-7l
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 14:16:31 +0000
X-Inumbo-ID: 28e2a1a6-6a1b-44e9-a08f-a95bd06020d8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 28e2a1a6-6a1b-44e9-a08f-a95bd06020d8;
	Wed, 14 Oct 2020 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602684989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tsRwn2NxeEksb8ZPinNdtJW/87jNTYlBuSUNtZOtQF4=;
  b=bf7F4Emfl/9hToljNgP7XRe3IqQ2CxyaUl0Pwkk2M5d/cBNixMz23fjX
   OVOSh3HB6SskFYOzPOpL7CtenOI5156FZdOj0WpMm0zzpl0UZh1c+Q4ml
   oBTz3feAokjES71Htv4Iprgso9PC9MCdLbWuXTPW6Jxk+ioS7sOGCDXs8
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GDvo43c4oBiKaf2X8EXXP3GbDkuNl4h42mw6NBG/5af8P5OPW8+yQ+Re4HYJZ5JqEmnqjduULc
 NQPiN4YkiSY4WyS5ZWYBes6Dd1Dsa7LFtaIJSVLFZGydT26sTl0P2JT5IUlMlCyFeZvguBajmL
 ONcHQ9T5aTQ3DNqBqMvRdLNrnPsi0ZB6Uc5NMyLRTsbP55dTW0TNqZGMXRDeJ9Vs6rIuKxjolP
 JN4gbh75WemT2iaIfrwdyGdWSR53gcV/bzTLvqiH2jAugDGBpe8+C7elxPNPJg840aK/Tnpj3l
 Z3s=
X-SBRS: 2.5
X-MesageID: 29053053
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,374,1596513600"; 
   d="scan'208";a="29053053"
Date: Wed, 14 Oct 2020 16:16:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Andy Lutomirski <luto@kernel.org>,
	Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: [PATCH v2] x86/pv: Inject #UD for missing SYSCALL callbacks
Message-ID: <20201014141620.GS19254@Air-de-Roger>
References: <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <20201009115301.19516-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201009115301.19516-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Fri, Oct 09, 2020 at 12:53:01PM +0100, Andrew Cooper wrote:
> Despite appearing to be a deliberate design choice of early PV64, the
> resulting behaviour for unregistered SYSCALL callbacks creates an untenable
> testability problem for Xen.  Furthermore, the behaviour is undocumented,
> bizarre, and inconsistent with related behaviour in Xen, and very liable
> introduce a security vulnerability into a PV guest if the author hasn't
> studied Xen's assembly code in detail.
> 
> There are two different bugs here.
> 
> 1) The current logic confuses the registered entrypoints, and may deliver a
>    SYSCALL from 32bit userspace to the 64bit entry, when only a 64bit
>    entrypoint is registered.
> 
>    This has been the case ever since 2007 (c/s cd75d47348b) but up until
>    2018 (c/s dba899de14) the wrong selectors would be handed to the guest for
>    a 32bit SYSCALL entry, making it appear as if it a 64bit entry all along.
> 
>    Xen would malfunction under these circumstances, if it were a PV guest.
>    Linux would as well, but PVOps has always registered both entrypoints and
>    discarded the Xen-provided selectors.  NetBSD really does malfunction as a
>    consequence (benignly now, but a VM DoS before the 2018 Xen selector fix).
> 
> 2) In the case that neither SYSCALL callbacks are registered, the guest will
>    be crashed when userspace executes a SYSCALL instruction, which is a
>    userspace => kernel DoS.
> 
>    This has been the case ever since the introduction of 64bit PV support, but
>    behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which yield
>    #GP/#UD in userspace before the callback is registered, and are therefore
>    safe by default.

This seems fairly reasonable, as it turns a guest crash into an #UD
AFAICT.

> This change does constitute a change in the PV ABI, for corner cases of a PV
> guest kernel registering neither callback, or not registering the 32bit
> callback when running on AMD/Hygon hardware.

Is there any place suitable to document this behavior?

> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
> SYSENTER (safe by default, until explicitly enabled), as well as native
> hardware (always delivered to the single applicable callback).
> 
> Most importantly however, and the primary reason for the change, is that it
> lets us sensibly test the fast system call entrypoints under all states a PV
> guest can construct, to prove correct behaviour.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Andy Lutomirski <luto@kernel.org>
> CC: Manuel Bouyer <bouyer@antioche.eu.org>
> 
> v2:
>  * Drop unnecessary instruction suffixes
>  * Don't truncate #UD entrypoint to 32 bits
> 
> Manuel: This will result in a corner case change for NetBSD.
> 
> At the moment on native, 32bit userspace on 64bit NetBSD will get #UD (Intel,
> etc), or an explicit -ENOSYS (AMD, etc) when trying to execute a 32bit SYSCALL
> instruction.
> 
> After this change, a 64bit PV VM will consistently see #UD (like on Intel, etc
> hardware) even when running on AMD/Hygon hardware (as Xsyscall32 isn't
> registered with Xen), rather than following Xsyscall into the proper system
> call path.

Would this result in a regression for NetBSD then? Is it fine to see
#UD regardless of the platform? It's not clear to me from the text
above whether this change will cause issues with NetBSD.

Roger.

