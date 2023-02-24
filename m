Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB46A2143
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:13:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501394.773113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVcZ3-0002qi-NN; Fri, 24 Feb 2023 18:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501394.773113; Fri, 24 Feb 2023 18:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVcZ3-0002om-KD; Fri, 24 Feb 2023 18:13:01 +0000
Received: by outflank-mailman (input) for mailman id 501394;
 Fri, 24 Feb 2023 18:13:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+11/=6U=citrix.com=prvs=4121c3e27=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pVcZ1-0002og-Tb
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:13:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db9a66ce-b46e-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 19:12:55 +0100 (CET)
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
X-Inumbo-ID: db9a66ce-b46e-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677262375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TYBo1ClyDWvRp652kD06s+0oldmXR52xdZiAg+g1s20=;
  b=E9lIqUEuezA5qhcNO3GUqjXDdsJVQIs1OBn8yrPVc0Hvc0v1skcFcIs9
   rCZfzTfCQm1CGkOHhMuhywq52fSuK44mqwot/IltVlhCqPmyZqcjJU5Ec
   tgpFjJMZgRZhmJdsuHx3uKPaYqPpnNcFkvxA5BDKCxNhEcCWLyPDaN+fw
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97836272
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:GI8Ci6M27b3yrM3vrR2Ql8FynXyQoLVcMsEvi/4bfWQNrUp2hjdRy
 DAbXDqDP6yKZDD3L4p0YY++9UpUvZbVmIc3GQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5ABmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sQwBD5Hz
 u4gEi4qXh3YpPmH7Z2FQ8A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3VFZ4LxBnCz
 o7A12WoRSo+LPqB8DeiyGqdiMPggQDqBo1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaPtwQQXNd4GOQg5AaAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHuaWYU3uH+p+IrDm5Pm4eKmpqWMMfZVJbuZ+5+th110+RCI85S8ZZk+EZBxnSh
 DXVpRMsv48Nqv4GjIagzH3ovTuF882hohEO2i3bWWes7wVcbYGjZpC15VWz0cusPLp1XXHa4
 iFaxpH2APQmSMjUyXfTGLll8KSBva7tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JmCN/Ifj2GZUZ5CIU3c+TPNB5jpgiJmOMQZSeN+1HgGibSs927silMwtqo0J
 I2Wd82hZV5DV/s4lWXpHbhAgO96rszb+Y80bcqmpylLLJLEPCLFIVv7GAbmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChQ7AqZKRW3m2UMTXMisw+QOL77rH+aTMD15YxMn6e97KtMNcmU8vrugw
 0xRrWcElwak2CWfdFzih7IKQOqHYKuTZEkTZUQEVWtEEVB+CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:EK+1K6BQGnN4NpnlHemU55DYdb4zR+YMi2TDsHoddfU1SKClfq
 WV9sjzuiWUtN98YgBDpTmrAtjnfZqkz+8T3WBzB9eftWvd1ldARbsKhbcKpQeQeBEWndQtsJ
 uIHZIQNDShNzNHZcGW2njdL+od
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="97836272"
Date: Fri, 24 Feb 2023 18:12:28 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v3 0/4] automation: Update containers to allow HTTPS
 access to xenbits
Message-ID: <Y/j+DHlj0jJF1Npj@perard>
References: <20230224172915.39675-1-anthony.perard@citrix.com>
 <c8c99704-ee97-596e-d964-8071fb2b3f1c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8c99704-ee97-596e-d964-8071fb2b3f1c@citrix.com>

On Fri, Feb 24, 2023 at 05:37:44PM +0000, Andrew Cooper wrote:
> On 24/02/2023 5:29 pm, Anthony PERARD wrote:
> > Patch series available in this git branch:
> > https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-containers-update-v3
> >
> > v3:
> > - new patch which remove non-debug x86_32 builds
> > - don't fix root certificates in jessie containers as those won't be used
> >   anymore on the main branch.
> >
> > v2:
> > - Remove CentOS 7.2
> > - Remove Debian Jessie test, but update container recipe for the benefit of
> >   older branches.
> > - Fix CentOS 7 containner recipe to update all packages. (Fix missing update of
> >   HTTPS root certificates)
> >
> > There is work in progress [1] to update urls in our repo to use https, but
> > those https urls to xenbits don't work in our containers, due to an expired
> > root certificate. So we need to update those containers.
> >
> > This series update the dockerfile where just rebuilding the container isn't enough.
> 
> LGTM.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> I'll add this to my commit sweep, and rebuild the remaining containers.
> 
> But on that note, I noticed that the debian unstable container was 2.3G
> when I last rebuilt it.  Which I think is obscenely large for what we're
> doing.
> 
> Can we see about switching to slim/tiny container bases?

I don't think that would help much, the non-slim container is only 116MB
vs 74.6MB for the slim (amd64 containers). But maybe we could try to use
"--no-install-recommends", that might save a few bytes in our containers.

Cheers,

-- 
Anthony PERARD

