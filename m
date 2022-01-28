Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5849F8DC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 13:04:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261975.453917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPyu-0000rm-0V; Fri, 28 Jan 2022 12:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261975.453917; Fri, 28 Jan 2022 12:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDPyt-0000oJ-Sw; Fri, 28 Jan 2022 12:03:55 +0000
Received: by outflank-mailman (input) for mailman id 261975;
 Fri, 28 Jan 2022 12:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1b2=SM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nDPys-0000oD-Ac
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 12:03:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b2dfb2e-8032-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 13:03:52 +0100 (CET)
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
X-Inumbo-ID: 5b2dfb2e-8032-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643371434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l9D27HB3iS86PR7VXPjkscybmEWCe5w+FcA33s/NxP8=;
  b=hhy0BP771KeRGoIC+0i+YK3wlZNoYeYtN7FyB2tGFzALw3qlGm0E+lhg
   NFadP6WcJFGUP8ihw/TkE9F7FOtuj4KuqFmhDPmEpyeLH4Cca+R7JNy1H
   2a/mCBn8Bdi7d0iDVh1ho9DjAoieQwBNpBXdMkueilukYkzTWjvJn0pM1
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: msM6PLL2W6fMGoHBzACf4Fli1CyUaUWt2X5zqcbqjEEbzq9Yxtjn18Gkb5iMFkA+ijEA81zQBP
 lbXd6b5aLdNrAEotppmw2HgDwG5yQ7j+x9UaYXnyc2X5Gy1TRYBT7zjedRcOrNLbDDFefupGXc
 YSBeAApQdTT3cmp3IgrtsqU3K5HQSHzCdboHAw8NKz2RmDPTEzzhori3NqzistcVU7lQf9nlNS
 AEaEqH6oErWX9nTsMbJ6TuR+x/seFc+QWCCzoxDelDOVMJ3ziAC6TEDCgA9FZLyl7sCYBPusoz
 IEQdSSwuPMCVhacbv33mnYPd
X-SBRS: 5.2
X-MesageID: 62894888
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:G1l4fagOV7v4fSYmeqEBiZ6LX161nBcKZh0ujC45NGQN5FlHY01je
 htvCzqEO/2IMGOjfd4ia9nkoBhXusKAnIAxQABtrC8wFngb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcy0YDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1uibuRWFd5A5TCv85HcBdILQ5QMqdvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiEN
 5tFOWo/BPjGSzhdZQ49Cqggp+2xjGSuaC9zqBXEnpNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQIEwEfX1a/pfi/i2a9VshZJ
 khS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4EfA+6QyL4rrZ5UCeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYVGh0ZaF/WOPACYyBzUhaz86YiUK6fC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+yskPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03AYH83oJrW3FF5ufkWZ4umwWyKBBaZ5sRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QSOcIqLFTZoXkzNCZ8OlwBdmB2z8nT3
 r/AKa6R4YsyU/w7nFJauc9DuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSJreY7cA5bRVBmVcGeg5EGLYarf1s5cFzN/teMm9vNjaQ/wfQM/goJl
 1ngMnJlJK3X3C2edl7SOyk9MdsCn/9X9BoGAMDlBn7ws1BLXGplxP53m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:BA4dXqEmgJTVDGeDpLqE6seALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZUgpHvJYVkqNE3I9eruBEDEewK7yXcX2/h1AV7BZniEhILAFugLhuGO/9SjIVydygc079
 YYT0EUMr3N5DZB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,323,1635220800"; 
   d="scan'208";a="62894888"
Date: Fri, 28 Jan 2022 12:03:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v9 08/30] build: fix enforce unique symbols for
 recent clang version
Message-ID: <YfPbndiBeViN0heB@perard>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-9-anthony.perard@citrix.com>
 <708a1723-7b01-e82b-f2c2-d031a33ae55e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <708a1723-7b01-e82b-f2c2-d031a33ae55e@suse.com>

On Thu, Jan 27, 2022 at 04:57:20PM +0100, Jan Beulich wrote:
> On 25.01.2022 12:00, Anthony PERARD wrote:
> > clang 6.0 and newer behave like gcc in regards for the FILE symbol, so
> > only the filename rather than the full path to the source file.
> > 
> > clang 3.8.1-24 (in our debian:stretch container) and 3.5.0-10
> > (in our debian:jessie container) do store the full path to the source
> > file in the FILE symbol.
> > 
> > Also, based on commit 81ecb38b83 ("build: provide option to
> > disambiguate symbol names"), which were using clang 5, the change of
> > behavior likely happened in clang 6.0.
> > 
> > This means that we also need to check clang version to figure out
> > which command we need to use to redefine symbol.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> The "likely" in the description still worries me some. Roger, would
> you happen to know, or know of a way to find out for sure ("sure"
> not meaning to exclude the usual risk associated with version
> number checks)?

I found f5040b9685a7 ("Make .file directive to have basename only") as
part of LLVM's "release/6.x" branch (and "llvmorg-6.0.0" tag), but not
in "release/5.x".

https://github.com/llvm/llvm-project/commit/f5040b9685a760e584c576e9185295e54635d51e

This patch would seems to be the one changing the behavior. This still
suggest clang 6.0.

Cheers,

-- 
Anthony PERARD

