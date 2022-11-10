Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BF8624318
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 14:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441813.695876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot7UX-0001oe-3Q; Thu, 10 Nov 2022 13:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441813.695876; Thu, 10 Nov 2022 13:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot7UX-0001mO-0f; Thu, 10 Nov 2022 13:21:13 +0000
Received: by outflank-mailman (input) for mailman id 441813;
 Thu, 10 Nov 2022 13:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=721y=3K=citrix.com=prvs=306dde813=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ot7UV-0001mI-QG
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 13:21:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 855d8796-60fa-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 14:21:03 +0100 (CET)
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
X-Inumbo-ID: 855d8796-60fa-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668086463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QNXQ4RSm2+GuyrGrrLCXNJaHUednLsnWdQjBWbjUdLs=;
  b=G3utI71Lvyk8TD2s0horYzjemLZsF82RcaUKVB3GS2K63Ft3JY1Y6gzV
   1LwEJYDhZ2VZUPKea48MHQw2wNwdYIXgpaeU5LVlyhU1ByYkMFjZqVKR8
   IoBe+QN/KHxP5xPoFmP5H1RjZ7nBeSOG7a4ZJXLbwkGUdUy9/XcgwRiJY
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 83633734
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CXwKhq6k/hHLnpo+qKWSUQxRtAvHchMFZxGqfqrLsTDasY5as4F+v
 jMfXWHQPqyONGf0c9EgPI2woBhS68DUy4BnT1NvrX0xHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkS5AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 +1bcTY8ZxK4tefukZSXSftwt9slM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0FxRjD/
 T2dowwVBDkELuaO0mSh3k7zufDdoy/5WaY4GZu3o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0UNNKH+o3wAqE0KbT7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YXec/bedqXW1IzoYKUcLYCNCRgwAi/HJrZsvlBvJQpBGGbSsk9zuMTjqx
 naBqy1WulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdly0rVp/VYenXL6tsQn9wfVSMLeGSEbU6
 RDohPOixOwJCJiMkgmET+MMAKyl6p65DdHMvbJ8N8J/rmrwohZPaagVuWgjfxkxbq7obBezO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bKgQgBc2B2y8nT3
 Kt3lu79ZUv28Yw9kFKLqx41iNfGBkkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnsvPc+VWEq
 44DbJHiJ/BjvArWO3e/zGLuBQpScShT6W7e96S7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 ijVZ6KZoXKh7UD6xfKiMyA9Oem0Dcog8hrW/0UEZD6V5pTqWq73hI93Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:mLsUZKAPlCTlry3lHems55DYdb4zR+YMi2TC1yhKJyC9Vvbo8/
 xG/c5rsCMc5wx9ZJhNo7y90ey7MBThHP1OkOss1NWZPDUO0VHAROoJ0WKh+UyCJ8SXzJ866U
 4KSclD4bPLYmRHsQ==
X-IronPort-AV: E=Sophos;i="5.96,153,1665460800"; 
   d="scan'208";a="83633734"
Date: Thu, 10 Nov 2022 13:20:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
Message-ID: <Y2z6r9n+A0cX69Yb@perard.uk.xensource.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
 <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
 <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>

On Mon, Nov 07, 2022 at 08:50:09AM +0100, Michal Orzel wrote:
> 3) Try to use CI to build and push the containers to registry
>  - it could be possible but what about local users

FYI, it's already possible to build and push container from the CI, at
least on X86, I've made it work:
    https://lore.kernel.org/all/20220301121133.19271-3-anthony.perard@citrix.com/
This works only when pushing to the "staging" branch on the main "xen"
repo as I've added secret variable there. (Also the branch needs to be
"protected" if I remember correctly.)

I don't know how to use the Arm runner to do container builds like that.

(The change done to one x86 runner:
https://gitlab.com/xen-project/xen-gitlab-ci/-/merge_requests/15)

Cheers,

-- 
Anthony PERARD

