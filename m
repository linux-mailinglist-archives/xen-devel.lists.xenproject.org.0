Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961684773DD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 15:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247977.427675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrJI-0000nV-NN; Thu, 16 Dec 2021 14:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247977.427675; Thu, 16 Dec 2021 14:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxrJI-0000lk-KE; Thu, 16 Dec 2021 14:00:40 +0000
Received: by outflank-mailman (input) for mailman id 247977;
 Thu, 16 Dec 2021 14:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2y9W=RB=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mxrJG-0000Vi-Dm
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 14:00:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89cb69ac-5e78-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 15:00:36 +0100 (CET)
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
X-Inumbo-ID: 89cb69ac-5e78-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639663236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=onc6RKMX6b6QatWjD4qy9333pi45dXCJHzlBh+xanWY=;
  b=VYMROdsXmpefuPPaDWKYRGdqChL/L5EGU1ktoTg2GgUzanZ5izh9aOWH
   fyicxGsucdQRsjBhqnHUxgHSQWL09TIqOz18cV7K3HoTmz800VN9X13Vd
   fxH7cim1bhjtDUSVlEssht7yIPYMH7j50sGm7P2vQczpG6wSYv2dJNhMy
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: W9RAFJwuYRCP6sqYIfE0ttagshVE81tbyoXy/U6J2cm4eBQo2ytEYckeZmHZzftU1hpeMaMD6u
 Ts+AWwLMJYW1ou7gxYGD/wlEWqM3q5m0ovTBaFgw5wTKb5MduIB7v/iUfLch06E6JZTYgpMlDk
 pPHwOHKG6xPLvl9RkbNOV3QjQVa7xTosgVq1lI4trAXul5ul9jC1KAFeqlYcpoNuCBJOczNidq
 yKPVRUo5LDCNO8+R+NNa3jZHictgFIapaT9aRaSzS2rIWJYnAOPURPnp1HTtzXESZvp278IeWX
 jM+wYtC95Wb4PGwW0CfPmu1K
X-SBRS: 5.1
X-MesageID: 60124941
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xSQSc6gk+KYVCdPA29zvO3SgX161vRcKZh0ujC45NGQN5FlHY01je
 htvCGDVOfaJamT1Lo1/b46/oxkFuJLRzoQwS1Blqy9gRH4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rg29Qx34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1qrpvraBkYBJTSp7UsVhdFSR1VIpxZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiGP
 pBFOGY2BPjGSz5CIxRUV58Yp9mPlmHgXzFZl3CHoLVitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoNEJWo+/gsh0ecrkQaDRZHC3Ogu/K3zEizR7p3K
 UYZ5y4vpqga71GwQ5/2WBjQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZhlab4cHqv4MfCIVh
 26Mkc6zORdwgaLAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
 mnX93Zm293/mOZSj/3jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5TOhAztJcvU/MBofAnrNOvzjxpiGGeD6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNZyr3PPQoM9/rU59CIU3c+TLNDKq8gj1mOMcZSeN61Hs2OR74M57FziDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTPrFRxP7V+239r
 ocAX/ZmPj0CCYUSlAGMqtVNRb3LRFBmba3LRzt/KrTef1E4QT55UJc8A9oJIuRYokicrc+Ql
 lnVZ6OS4AeXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:bYeECaqcitZTO5/PHbuLuekaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60124941"
Date: Thu, 16 Dec 2021 14:00:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] revert "hvmloader: PA range 0xfc000000-0xffffffff should
 be UC"
Message-ID: <YbtGeXpAMNSDJ3gi@perard>
References: <036c6899-dbfe-eca8-7974-5a13d20455a7@suse.com>
 <YbsMwIYFULP5sXQP@Air-de-Roger>
 <cb9bea36-9feb-dbc7-ce36-38fd42792f11@srcf.net>
 <YbseXUE0byGJCzsy@Air-de-Roger>
 <e4c8e8e7-b326-c201-24bc-44c25c0aafe0@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4c8e8e7-b326-c201-24bc-44c25c0aafe0@srcf.net>

On Thu, Dec 16, 2021 at 11:17:12AM +0000, Andrew Cooper wrote:
> What should happen is the domain builder place OVMF there directly. 
> OVMF is linked to run there, and there ought to be no hvmloader involved
> for UEFI guests, and there shouldn't be any copying into place
> required.  That was a very short sited move on behalf of the OVMF
> support logic, and I guarantee you that it creates more problems than it
> allegedly solves.

FYI, OVMF been copied there is due to how KVM/QEMU make use of OVMF, so
it was probably the easiest thing to do at the time.

Now, we have OvmfXen with support for PVH (still a few thing to fix),
which doesn't need to be loaded from hvmloader, and doesn't need to run
from that address (~4GB). Most of OVMF is linked to run at 8MB anyway (I
think, if I remember the address).

We aren't far from been able to run UEFI HVM guests without hvmloader,
we need to fix the logic in OVMF to take care of the PCI bars, and maybe
one or two other things, then load OVMF as a PVH kernel and hopefully no
more hvmloader on HVM guests.

Cheers,

-- 
Anthony PERARD

