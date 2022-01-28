Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B486F49FD24
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 16:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262091.454169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDTYJ-0004FC-SV; Fri, 28 Jan 2022 15:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262091.454169; Fri, 28 Jan 2022 15:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDTYJ-0004D3-P9; Fri, 28 Jan 2022 15:52:43 +0000
Received: by outflank-mailman (input) for mailman id 262091;
 Fri, 28 Jan 2022 15:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1b2=SM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nDTYI-0004Cx-16
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 15:52:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 514dba04-8052-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 16:52:40 +0100 (CET)
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
X-Inumbo-ID: 514dba04-8052-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643385160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9IDmy1YftEc1l0AJBUbmvWyEiySc7HmGGRSPfMiyklQ=;
  b=P2P+PFOGp5QA1VgwjpQQtFut00EEK/aXq9nVVMYfU/rqE08oHT4Dg51l
   Ak4HcShQKb7dO11Oj4WgthPg4mJKjHmIR9u3CFYCTppg+PJJpjStCHpo6
   Qdo43IhwkLUmXGbLpeDaM7FN2nBj/rO2aM9mne1xmQgguAeWZIUOYu6QT
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Y7ItOAFW3wi+jgV6DfSzMlSrBQ95xg2948njyDRsbImRbV+34+026BPHXg6NSud03RLr8J84EX
 /zcIHnlIrjiUlEAIZZ78Q46YRRs/vXf6LCLB8aaKbxvdt3Pja9U1JJy9yqfcx7fu6Md1zz4RX2
 CosX+leC3vb9GKKA+x4zs7DsstRRftf/JBTLF4UEl8YDtHQmi8BHDtQbl6vKYqpwcXU6pA9QGC
 okePBA76OlQ0o43SnOBFRXFj8nYju971ZDlhdGQR1eBiMShDa7YRzKJq7GNXc6/awavYZfvdBn
 Z2b7HgC+805lOhlfy5fkVAuH
X-SBRS: 5.2
X-MesageID: 62990034
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:p9SPZaMq1ezpLGnvrR1ZkMFynXyQoLVcMsEvi/4bfWQNrUp30GQFz
 mcYWm/UPv7cYWakedsgaY+0pEoCuMfRzN41HQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Egzw7JRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2SJjolsx
 vBqj7y5CkQPGPPLnPUteBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm1h15gWRqq2i
 8wxRQhuUxTCQzh1B3QvMokXrczy2mDtWmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3uVxnFSZy2gXCRsXfVi2u/+0jgi5Qd03A
 04e9zcqrKMy3Fe2VdS7VBq9yFaGoxodVtx4A+A8rgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BVDx+6aCbbFWn1r7X7hWUZy8RPF8panpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0v55p0xWG2DaD+qXNERz3phZPmqgLuFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i+DKuMNYQTOsUgHONiwM2ITRTOt4wKuBN0+ZzTx
 L/BKZr8ZZrkIfoPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilksDOMWjPHi/2dNDfDgicClgbbir+pM/SwJ2Clc8cI3XI6WPkepJlk0Mt/k9q9okC
 VnkBBcAlgKj1CKWQehIA1g6AI7SsV9EhSpTFUQR0ZyAgBDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:PnqltKybTyyS0nqJfB6DKrPxo+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBZpTnyAtj6fZq8z+8/3WB1B9uftWbdyQ+Vxe1ZjLcKhgeQYhEWldQtn5
 uIEZIOb+EYZGIS5amV3OD7KadH/DDtytHKuQ6q9QYJcegcUdAD0+4WMGamO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWLSIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsmFM7rq4m1ucJ+OEzRPBkufJlaQkETTzYJriJbofy/QzdZtvfrWrC3u
 O85yvIdP4DkU85NlvF3CcFnTOQnQrGokWStWOwkD/tp9f0Syk9DNcEjYVFcgHB405lp91k1r
 lXtljpwaa/ICmw6BgV3eK4IC2CV3DE0UYKgKoWlThSQIEeYLheocgW+15UCo4JGGb/5Jo8GO
 djAcnA7LIOGGnqJ0zxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NY2SoVC5e
 7DLqN0/Ys+B/M+fOZ4HqMMUMG3AmvCTVbFN3+TO03uEOUdN3fEu/fMkcAIDSGRCe41JbcJ6e
 r8uWJjxB0PkhjVeLKzNbVwg2HwfFk=
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="62990034"
Date: Fri, 28 Jan 2022 15:52:33 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v9 08/30] build: fix enforce unique symbols for
 recent clang version
Message-ID: <YfQRQSwuJW+XOWYa@perard>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-9-anthony.perard@citrix.com>
 <708a1723-7b01-e82b-f2c2-d031a33ae55e@suse.com>
 <YfPbndiBeViN0heB@perard>
 <b9b4262e-5ca2-b051-7aba-b2ad1a6bdc01@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b9b4262e-5ca2-b051-7aba-b2ad1a6bdc01@suse.com>

On Fri, Jan 28, 2022 at 01:43:38PM +0100, Jan Beulich wrote:
> On 28.01.2022 13:03, Anthony PERARD wrote:
> > On Thu, Jan 27, 2022 at 04:57:20PM +0100, Jan Beulich wrote:
> >> On 25.01.2022 12:00, Anthony PERARD wrote:
> >>> clang 6.0 and newer behave like gcc in regards for the FILE symbol, so
> >>> only the filename rather than the full path to the source file.
> >>>
> >>> clang 3.8.1-24 (in our debian:stretch container) and 3.5.0-10
> >>> (in our debian:jessie container) do store the full path to the source
> >>> file in the FILE symbol.
> >>>
> >>> Also, based on commit 81ecb38b83 ("build: provide option to
> >>> disambiguate symbol names"), which were using clang 5, the change of
> >>> behavior likely happened in clang 6.0.
> >>>
> >>> This means that we also need to check clang version to figure out
> >>> which command we need to use to redefine symbol.
> >>>
> >>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> >>
> >> The "likely" in the description still worries me some. Roger, would
> >> you happen to know, or know of a way to find out for sure ("sure"
> >> not meaning to exclude the usual risk associated with version
> >> number checks)?
> > 
> > I found f5040b9685a7 ("Make .file directive to have basename only") as
> > part of LLVM's "release/6.x" branch (and "llvmorg-6.0.0" tag), but not
> > in "release/5.x".
> > 
> > https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project%2Fcommit%2Ff5040b9685a760e584c576e9185295e54635d51e&amp;data=04%7C01%7Canthony.perard%40citrix.com%7C1ce7898a15bb4024260008d9e25be6f9%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637789706644173026%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=V73NmkJWAHpqlzY9sAysf6%2Fw7q8ik6twT6lMLgglR3s%3D&amp;reserved=0
> > 
> > This patch would seems to be the one changing the behavior. This still
> > suggest clang 6.0.
> 
> Oh, thanks for digging this out. May I suggest to replace (or delete)
> "likely" then in the description?

Maybe something like that? Or just delete the word might be enough.

    Also we have commit 81ecb38b83 ("build: provide option to
    disambiguate symbol names") which were using clang 5, and LLVM's
    commit f5040b9685a7 [1] ("Make .file directive to have basename
    only") which is part of "llvmorg-6.0.0" tag but not "release/5.x"
    branch. Both suggest that clang change of behavior happened with
    clang 6.0.

    [1] https://github.com/llvm/llvm-project/commit/f5040b9685a760e584c576e9185295e54635d51e

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,

-- 
Anthony PERARD

