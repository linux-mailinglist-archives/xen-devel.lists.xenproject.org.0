Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408E042687B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 13:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204648.359817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYnkn-0005cd-J3; Fri, 08 Oct 2021 11:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204648.359817; Fri, 08 Oct 2021 11:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYnkn-0005aq-Fs; Fri, 08 Oct 2021 11:09:29 +0000
Received: by outflank-mailman (input) for mailman id 204648;
 Fri, 08 Oct 2021 11:09:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mH1P=O4=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mYnkl-0005af-GN
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 11:09:27 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2be48f66-4f30-4d0d-9a86-d9865452f646;
 Fri, 08 Oct 2021 11:09:25 +0000 (UTC)
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
X-Inumbo-ID: 2be48f66-4f30-4d0d-9a86-d9865452f646
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633691365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YxY0sOwpETLYOWHp0bcqce/rwco8K0eGG+glITyZYFY=;
  b=KlCwO4PfAXZdTcpqDbRF0Zi7KINwmjZkjUgS3evYWHyEynKKdS2Ae9+w
   NemlAOPT5x0C6JLkRcC4PvYAIUc0uueF1Y3beQfcIsWGuSjoQeOFTEu+m
   iBNp7lJ9rZf+G+DmEHdyTul4cFOwpMCn0VtM+58B09nqjniBKgUUUSZ80
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: b/f97Aaf5KdqUGi86QjyvAo4ziU8Bm2NDERMri8xD50iAzl37v+lKFsunxwUBAaqr4HC3lQkry
 Ys3jrMJ0HzkdM0KMpZhCjGyLW2Eco4Z5tTz5EcWiJy8LaWdiKxPINs+6i86BDOeu2CwZzSIAXa
 UZdBRoa0PUGFz+jtA37pcX/2QvutTE/HeRNT0q0gw0KZTYXppxHLwo/sqN2DdjGfE5HDGmYb9p
 MMAk6DIeslc1oDlYSfFLw6k7Bxp92nl56GPdt2dE7yrEEx5FVMDNSl7iapAyXbf8HSwNdDODCW
 Af15SUW9xan6mqxYsFYcH723
X-SBRS: 5.1
X-MesageID: 54689815
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LggiqKMo7wf7SDjvrR1rkMFynXyQoLVcMsEvi/4bfWQNrUoi1DMBz
 2YdC2GDMviDajf0e9wlbo/g9kkGvJHWmtNiHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Uozw7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYowyPksAt2
 fNsjt+9Rx4kb4OTmfY4TjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgWtu1pEeRKu2i
 8wxQztsZQjYPkd1MGwuLKhvpsqxhnDWWmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvla9uBMMB8t2MtZ55Q+Ux/v6vAeLI3UtG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvoZ3FKfDZqiTssCFtduoa/8OnfmzqVFr5e/LiJYsoZ8N0a6
 x6NtjR2o7wOgcMR26y/8DgraBr3/cORH2bZCujNN19JDz+Vhqb5OeRECnCBtJ6sybp1qHHa5
 xDofODEvIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmolehwzaZ5UIGezC
 KM2he+3zMQIVJdNRfUnC79d9uxwlfSwfTgbfqq8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLSmOHeIqtRPcQliwLpSLcmelvG7v9WremJOcFzNwdeKqV/4U4A6zalTiMnS+
 XSxBh1RxFbl3CWVIgSWcHFzLrjoWM8n/348OCUtO3eu2mQiPtnzvPtOKcNvcOl17vFnwN51U
 +IBJ5eKDMNQR2mV4D8ad5T88tBvLUz5mQKUMiO5SzEjZJo8FRfR89rpc1K3pikDBya6r+Ukp
 Lik2l+JSJYPXV06Xs3XdOiu3xW6un1EwLB+WE7BI99yfkTw8dc1d3yt36Fve8xVcEfN3DqX0
 QqSECw0n+iVrt9n6sTNiICFs5ytT7l0EH1FEjSJ9r2xLyTboDaumNcSTOaScDnBf2ro46H+N
 /5NxvTxPfBbzlZHt41wT+Riwa4kvoa9orZbykJvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDSh/gblw7b4ekxPEintjR8+6CKUBkKMhSB4MCHwGCZ7G/xL
 T8dhfMr
IronPort-HdrOrdr: A9a23:I52lGKvqreJ49r1yY+wLPSDL7skDSdV00zEX/kB9WHVpm5Sj5q
 WTdYcgpHvJYVcqKQgdcL+7WZVoLUm3yXcx2/hyAV7AZnifhILLFuFfBOLZqlWKJ8S9zJ8/6U
 4KScRD4ajLY2SS+vyU3ODXKbsdKZK8gceVbK/lvhFQcT0=
X-IronPort-AV: E=Sophos;i="5.85,357,1624334400"; 
   d="scan'208";a="54689815"
Date: Fri, 8 Oct 2021 12:09:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/build: suppress EFI-related tool chain checks upon
 local $(MAKE) recursion
Message-ID: <YWAmz5+5cufR1lKi@perard>
References: <8457d422-4db9-59b9-d0c9-663430dad955@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8457d422-4db9-59b9-d0c9-663430dad955@suse.com>

On Tue, Sep 21, 2021 at 05:43:38PM +0200, Jan Beulich wrote:
> The xen-syms and xen.efi linking steps are serialized only when the
> intermediate note.o file is necessary. Otherwise both may run in
> parallel. This in turn means that the compiler / linker invocations to
> create efi/check.o / efi/check.efi may also happen twice in parallel.
> Obviously it's a bad idea to have multiple producers of the same output
> race with one another - every once in a while one may e.g. observe
> 
> objdump: efi/check.efi: file format not recognized
> 
> We don't need this EFI related checking to occur when producing the
> intermediate symbol and relocation table objects, and we have an easy
> way of suppressing it: Simply pass in "efi-y=", overriding the
> assignments done in the Makefile and thus forcing the tool chain checks
> to be bypassed.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

> ---
> Obviously the real (but more involved) solution would be to do away with
> the recursive $(MAKE) invocations, by breaking up the long linking
> rules. Representing them instead through multiple smaller rules with
> suitable dependencies is certainly possible (and might even reduce
> redundancy).

There is an alternative to that. Linux have a script which does the kind
of step we do. So maybe doing the same and move the recipe into a script
would work too? This would allow to share the recipe between x86 and Arm
as the link phase of xen-syms is nearly identical. But to avoid calling
make from the script we would have to duplicate the recipe of %.o:%.S.
The xen.efi rules is still x86 only and I don't know whether we could
use the same script as for xen-syms.

I don't know which option would be better those two and the current
state.

Cheers,

-- 
Anthony PERARD

