Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF1767B62E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 16:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484452.751031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhye-0005Oa-1H; Wed, 25 Jan 2023 15:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484452.751031; Wed, 25 Jan 2023 15:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhyd-0005MT-Tr; Wed, 25 Jan 2023 15:46:19 +0000
Received: by outflank-mailman (input) for mailman id 484452;
 Wed, 25 Jan 2023 15:46:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Be9=5W=citrix.com=prvs=3821facd5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pKhyc-0005ML-23
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 15:46:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65ef12d4-9cc7-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 16:46:15 +0100 (CET)
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
X-Inumbo-ID: 65ef12d4-9cc7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674661575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LC9PJZe33Ic+OCc6OuGe9WiNV9QYfHLh+F4cOUUQabc=;
  b=OR4ysfNTMisJSn8AGXP0joh3Srh+CTmO5kMoF3dmLjMcjflycS/qpJnX
   7HP/LWvyovOyFKbotNUwTdoanP+uNdbX8qrvN4vqNZyftW7r9HbgZ2F7w
   hrlHyHsWg5qRIxQ+fkq/hcnnKIL3kvchtBH78pI0FzQrcnsHt2Av1R5/a
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93115270
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7w3MQKnDarIF24mM8ie0E1ro5gxLJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXWrVbKyLamv8LY9xboS29hhXvMDdx9JqHAM5rnwxHiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5gKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eUFCmETPzSBvOHsnZexUeszjMkjI/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfD/
 zubpTuhav0cHN+v4gTfz2uMv86RwBrGCa5PSeey9OE/1TV/wURMUUZLBDNXu8KRiEe4V8hON
 k889S8nrKx0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDht9HmHzt0q5WOVGmQsLyTqFuaNS8TImsDIz0ERA0Ky975qYo3g1TESdMLOKetg8f8Az3Y3
 zGApy94jLIW5fPnzI3iowqB2Wj14MGUEEhsvF6/sn+ZAh1RfZOHNpL5zVrg7qwdCYyCTAaLs
 XgLop3LhAwRNq2lmCuISeQLObim4feZLTHR6WJS84kdGyeFoCD6I90JiN1qDAIwa5tfJ2e1C
 KPGkVkJjKK/KkdGekOej2iZL80xhZbtGt3+Phw/RoofO8MhHONrEcwHWKJx44wPuBJ0+U3cE
 c3BGSpJMZr9IfoP8dZOb71BuYLHPwhnrY8pebj1zg68zZ2Vb2OPRLEOPTOmN75msP7U/V+Oq
 o4BZ6NmLimzt8WnMkHqHXM7dwhWfRDX+7iowyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 xmAtrtj4AOn3xXvcFzaAk2PnZuzBf6TW1pnZ31zVbtpslB/CbuSAFA3LMVqLeh8qrcypRO2J
 tFcE/i97j10Ymyv01wggVPV9eSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:OZP6xa9vgj+MaBC/xu9uk+AoI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HIoB1/73XJYVkqN03I9ervBEDEewK+yXcX2/h0AV7BZmnbUQKTRekP0WKh+UyDJ8SXzIVgPM
 xbAs1D4bPLbGSTjazBkXWF+9RL+qj5zEh/792usUuETmtRGtBdBx8SMHf8LqXvLjM2f6bQEv
 Cnl7N6jgvlQ1s7ROKhCEIIWuDSzue76a4PMXY9dmYaABDlt0LS1ILH
X-IronPort-AV: E=Sophos;i="5.97,245,1669093200"; 
   d="scan'208";a="93115270"
Date: Wed, 25 Jan 2023 15:45:55 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH v2 1/2] libxl: Fix guest kexec - skip cpuid policy
Message-ID: <Y9FOs1C4YETC7Lgu@perard.uk.xensource.com>
References: <20230124025939.6480-1-jandryuk@gmail.com>
 <20230124025939.6480-2-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230124025939.6480-2-jandryuk@gmail.com>

On Mon, Jan 23, 2023 at 09:59:38PM -0500, Jason Andryuk wrote:
> When a domain performs a kexec (soft reset), libxl__build_pre() is
> called with the existing domid.  Calling libxl__cpuid_legacy() on the
> existing domain fails since the cpuid policy has already been set, and
> the guest isn't rebuilt and doesn't kexec.
> 
> xc: error: Failed to set d1's policy (err leaf 0xffffffff, subleaf 0xffffffff, msr 0xffffffff) (17 = File exists): Internal error
> libxl: error: libxl_cpuid.c:494:libxl__cpuid_legacy: Domain 1:Failed to apply CPUID policy: File exists
> libxl: error: libxl_create.c:1641:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
> libxl: error: libxl_xshelp.c:201:libxl__xs_read_mandatory: xenstore read failed: `/libxl/1/type': No such file or directory
> libxl: warning: libxl_dom.c:49:libxl__domain_type: unable to get domain type for domid=1, assuming HVM
> 
> During a soft_reset, skip calling libxl__cpuid_legacy() to avoid the
> issue.  Before the fixes commit, the libxl__cpuid_legacy() failure would

s/fixes/fixed/ or maybe better just write: "before commit 34990446ca91".

> have been ignored, so kexec would continue.
> 
> Fixes: 34990446ca91 "libxl: don't ignore the return value from xc_cpuid_apply_policy"

FYI, the tags format is with () around the commit title:
    Fixes: 34990446ca91 ("libxl: don't ignore the return value from xc_cpuid_apply_policy")
I have this in my git config file to help generate those:
[alias]
    fixes = log -1 --abbrev=12 --format=tformat:'Fixes: %h (\"%s\")'


> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Probably a backport candidate since this has been broken for a while.
> 
> v2:
> Use soft_reset field in libxl__domain_build_state. - Juergen

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

