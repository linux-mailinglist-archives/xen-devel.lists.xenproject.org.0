Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E33456DCC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227760.394060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo1TR-0001Xv-Nt; Fri, 19 Nov 2021 10:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227760.394060; Fri, 19 Nov 2021 10:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo1TR-0001W9-Kl; Fri, 19 Nov 2021 10:50:29 +0000
Received: by outflank-mailman (input) for mailman id 227760;
 Fri, 19 Nov 2021 10:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEpL=QG=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mo1TQ-0001W3-ER
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:50:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80120285-4926-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 11:50:26 +0100 (CET)
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
X-Inumbo-ID: 80120285-4926-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637319026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CM6FfYNlxwTTU76xGDZ2LXSZ3vKB60rt2UQqmw754/M=;
  b=R++efPjOpv67KnXWqzNWk+Pv5G6C1DH+w1u0prVtmROVbhO0k1UX+dkm
   P1yU1kUamjPeT4yZqQxQJkYD9/lmOwgprBtg1XqpDHytH/8caR+HWjCBd
   nHVbb6NewvWbx1GNCJr4Knvzpvl+1AUHBTAAIEQohpI4Y7myOKfd84j3w
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vsg1KsVAVgKBEOra1I6k0+qzjN5YXwiLAYI/sNSZn1XkhzaAoRJZurnDxUl2jvElG9suxjZ9Ki
 F/u63SXXiUYivrQhVFebO0ICR4Y8RTyxpH+awbLAR1ksCZg0j6TubIKFvys1iV07Ic7oRIGJtq
 ai4QdutWSi3GU92u5/yg3Dly02IqftEvNLx5ByYb1njh9/ABo7q+McNA1NcJ2gpQrwgE7ihM4L
 AauupRQEIZ/Ke7MkzK562rKDhpSYf4dl0uGb5uTfVRgqMhOHpJfUeCve0nA5KJxgpYjCcBLKYE
 Ga+xsoJdXvPsWa2LwVlRQjJe
X-SBRS: 5.1
X-MesageID: 58595877
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rDPbq6g/oZ+n4io//gjTz0YoX161lxcKZh0ujC45NGQN5FlHY01je
 htvD2CEaKzcZGajfd1zYYjno0gEvpTczIdqGwA/pHs2ES4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cx0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1WsIGyTCEwG5bmiec0dzB9SRlsL45ZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauOO
 ptEOWUwBPjGSzlOGgZNF7UxoPf2tF/bQTt4pFOJn6VitgA/yyQuieOwYbI5YOeiX8JOlFyfo
 WHA1234BB8dL9GUjzGC9xqEmevnjS79HoUIG9WQ9+FoqE2ewHQJDx8bXkf9puO24ma3XtkOd
 WQP4CEg664/6CSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qG86qWqBWrHBM/PGwrQQYhFzMX8fr89dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZRPdb9P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3YzQPHNFBz3ohZPmLy8BhkkeS+F1e5eJ1fUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMMuLlHfrXEzOB7Mt4wIrKTKuftiU
 Xt8WZzyZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rN5CRXhXfCNTLc2n9KRqmhurf1MO9JcJUKSKn9vMuuVNwsxoqws/1
 i3nBxIDlgOg3SavxMfjQikLVY4DlK1X9RoTVRHA937xhhDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:vnc2CaALgxfu0gDlHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.87,247,1631592000"; 
   d="scan'208";a="58595877"
Date: Fri, 19 Nov 2021 10:50:12 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>,
	"George Dunlap" <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.16] golang/xenlight: regen generated code
Message-ID: <YZeBZOEjVLhNReBW@perard>
References: <20211119102948.156887-1-anthony.perard@citrix.com>
 <5c0fcc40-9ab1-daf7-7097-1d4968576497@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5c0fcc40-9ab1-daf7-7097-1d4968576497@srcf.net>

On Fri, Nov 19, 2021 at 10:38:04AM +0000, Andrew Cooper wrote:
> On 19/11/2021 10:29, Anthony PERARD wrote:
> > Fixes: 7379f9e10a3b ("gnttab: allow setting max version per-domain")
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Fixes: 1e6706b0d123 ("xen/arm: Introduce gpaddr_bits field to struct
> xen_domctl_getdomaininfo")
> 
> as well, by the looks of things.

Indeed, I miss that as I didn't look at the diff. But there is one
commit between those two which does update the *.gen.go files...

Thanks,

-- 
Anthony PERARD

