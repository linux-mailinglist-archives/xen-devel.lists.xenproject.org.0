Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DE7302EB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548944.857206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S6v-0006gi-6P; Wed, 14 Jun 2023 15:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548944.857206; Wed, 14 Jun 2023 15:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S6v-0006dH-3M; Wed, 14 Jun 2023 15:08:37 +0000
Received: by outflank-mailman (input) for mailman id 548944;
 Wed, 14 Jun 2023 15:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K3Mb=CC=citrix.com=prvs=52246f0f5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q9S6u-0005o4-AQ
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:08:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53cd0607-0ac5-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 17:08:34 +0200 (CEST)
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
X-Inumbo-ID: 53cd0607-0ac5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686755314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vp9p1qfoM2PN1A0zuZ5CziO8jBlfIegSkWMzayQvLt4=;
  b=GXowiaKMl5K47gBRPdMO2Y2gt1hIcHW1oivKabq9wAIBqcXwXocdy6BI
   eLx++pBTYRt+nHUDtxzoc0K7q35zMGzGXLUS4VF+x6NxIjmLyDGAwxTy2
   JKTOuinB2rat0fa5z5cBG9G7lguZoFN1OGN3UslMRbQRv2aI7fxnmjG3M
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111518432
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7SkRsq1HYFgjQce1r/bD5fVxkn2cJEfYwER7XKvMYLTBsI5bpzEGn
 2scDWuEPKqJY2OhLYp/bYiw/UgCupfdyoNjSQM4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJnOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKEVQ1
 KZGdmAxci+tjtCfwKqrTrJTr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwMwx/I+
 jmcl4j/KhMaG+LY+xO6yX2TqMTymAX/ZY1VJpTto5aGh3XMnzdOWXX6T2CTo/O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsUTppeNEg8sgsSlQC1
 FCTmMjyLSdyq7DTQnWYnp+dtT6oMDIZBXMDbyQDCwAC5rHeTJob10yVCIw5Sejs04OzQGurq
 9yXkMQgr5w3k+9RifvrwUz4rTuej5jRXgpu2SyCCwpJ8ThFiJ6Zi52AsAaLs6gacN7GEjFtr
 1BfxZHAsblm4YWl0XXUHb5TROzBC+OtamW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgUxfOdjZ5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/FhZ
 8fCK5r0UyZHYUiC8NZRb71EuYLHOwhknT+DLXwF50nPPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPToyizpNbWO3GNmaZKdABiEJTOLcyuwyChXrLZc1UO9aBII6O5/I7NjKQ/wv4EybqSr
 y7nMqKaoXKm7UD6xcyxQigLQNvSsVxX9xrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:pKddOa8/9q74c86PRy1uk+Gddb1zdoMgy1knxilNoH1uA7mlfq
 WV95omPHDP6Ar5J0tQ5exoVJPgfZq+z+8H3WBuB8bBYOCOggLBRr2KhrGSoAEIdReOk9K03s
 9bAtdD4LWbNzRHZa2R2maF+xlL+rS62ZHtvMOb60pECThtbaQI1XYKNu5YeHcGOjWvwfACZe
 qhDg8snUvQRZ1tVLXeOlA1G9LbosHNltbPeAduPW9f1CC+yQmw7aL8EVyywhcaXlp0sMof2F
 mAqRX9+qKg99ayzhO07R61071m3OH5z8dFBoirlM8YMVzX+2CVTbUkYaSGoDc25NuOxT8R4a
 HxiiZlBd1393TSOlu4ugTgwC7p1DpG0Q6Y9XaoxUH7pND/RnYEB9FahYRfGyGpkXYdgA==
X-Talos-CUID: 9a23:EV9yjG0t2ASaIx6BUGoEd7xfM+Q7UyeDkifsP3CWAFRASKWFTQSv0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3A1Z3/lAyMmIf0dOy7x8ceBp7tBveaqKauJ35Ko7w?=
 =?us-ascii?q?5gMa7GwdNPhGZsTvwcKZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,242,1681185600"; 
   d="scan'208";a="111518432"
Date: Wed, 14 Jun 2023 16:08:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxg: shrink variable scope in
 xc_core_arch_map_p2m_list_rw()
Message-ID: <dd726f92-4632-4099-9dc0-f550365f53fe@perard>
References: <3c6fc607-630d-c52f-06b8-4c5aae97f21f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3c6fc607-630d-c52f-06b8-4c5aae97f21f@suse.com>

On Wed, Jun 14, 2023 at 09:02:56AM +0200, Jan Beulich wrote:
> This in particular allows to drop a dead assignment to "ptes" from near
> the end of the function.
> 
> Coverity ID: 1532314
> Fixes: bd7a29c3d0b9 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Much bigger change to limit the scope of "ptes" and other variables.

The change of scope of all variables isn't too hard to review with
--word-diff option and they all look fine.

> --- a/tools/libs/guest/xg_core_x86.c
> +++ b/tools/libs/guest/xg_core_x86.c
> @@ -169,18 +169,21 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
>          if ( !mfns )
>          {
>              ERROR("Cannot allocate memory for array of %u mfns", idx);
> +        out_unmap:
> +            munmap(ptes, n_pages * PAGE_SIZE);
>              goto out;
>          }
>  

I guess it's not that great to have the label out_unmap in the middle of
the for loop (at least it's near the beginning), but at least that mean
that the mapping need to be gone once out of the loop. So if someone
edit the for loop and introduce a `goto out` instead of `goto out_unmap`
there's just a potential leak rather than potential use-after-free or
double-free, so I guess that better.

So:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Cheers,

-- 
Anthony PERARD

