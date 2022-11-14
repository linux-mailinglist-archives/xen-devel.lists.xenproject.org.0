Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10126286CD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 18:17:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443489.698030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oud4Q-0000Rr-EK; Mon, 14 Nov 2022 17:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443489.698030; Mon, 14 Nov 2022 17:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oud4Q-0000P7-AM; Mon, 14 Nov 2022 17:16:30 +0000
Received: by outflank-mailman (input) for mailman id 443489;
 Mon, 14 Nov 2022 17:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2807=3O=citrix.com=prvs=3102b0b57=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oud4O-0000P1-Rw
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 17:16:28 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11ae2f6d-6440-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 18:16:27 +0100 (CET)
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
X-Inumbo-ID: 11ae2f6d-6440-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668446187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Pa7ckpP04crPbBq5AT1U8z1zjmHFl9RNWVfkrdBaLXA=;
  b=Bhiw7RXmU77vr2AmMWxb3kE3qydyk+U6DpOIHI18twCXUBCh8Dy7jNy/
   LA/7IO9Fsrz2ES3t80Uz4bEGEyXWbBx1NIwzjGit6vS/gMrLetofh+xP+
   7+UxkNUfdsdjzh6/bxLxgTNH6Xgem+RnQyau6l90vFmW1uu4jIS94UlsL
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84785773
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7wTbW6m8ma9lv7OPXx7n5JXo5gxhJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZUTuHOKuJZGSkeNp1b9i/8U4OsJTXytRkSwJl+yw3RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5QOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fI8DxJdRBrAvuL166iDdfRlupwcIta+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zhrH9
 j+ZoD+R7hcyJeOOxmqc/HKQouL2tDOgYd4RSOWC+as/6LGU7jNKU0BHPbehmtG7l0q/VtR3O
 0ESvC00osAay0GqCPL9UhuQqWSB+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/v2ARR/vbvTTmiSnp+Wpz6vPSkeLUcZeDQJCwAC5rHLhJw4h1ThR9BoHaqxk/X8AzS2y
 DePxAAUiq8Pl8cN2+Oe9ErenjO3jpHTS0g+4QC/dnm+8gpzaYqhZoqpwVvW9/BNKMCeVFbpg
 ZQfs5HAtqZUV8jLzXHTBrVWdF202xqbGDP4pnw/NZNizjTu0GSbQp1Z3GlBKlg8Z67oZgTVS
 EPUvApQ4rpaM32rcbJ7buqNNig68UTzPY+7D66JN7KidrA0LVbap382OSZ8yki3yCARfbcD1
 YB3mCpGJVITEuxZwTW/XI/xOpd7l3lllQs/qX0WpilLMIZyhlbPGN/p03PUNIjVCZ9oRy2Lm
 +uzz+PQl31ivBTWO0E6Mec7dDjm10QTC5HssNBwfeWeOAdgE2xJI6aPn+N6JdA5wfgOzragE
 pSBtqhwkQeXuJE6AV/SNiALhE3HAP6TUk7XzQRzZA31ihDPkK6k7bsFdotfQFXU3LUL8BO1J
 tFbE/i97gNnE2SeomxEMcel9OSPtn2D3GqzAsZsWxBnF7YIeuAD0oSMktfHnMXWMheKiA==
IronPort-HdrOrdr: A9a23:xI9YcqsusgssYXJ86LweVMSq7skDTtV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVEqKRcdcLG7Sc29qBznmaKdjbN/AV7mZniehILKFvAG0WKB+UyCJ8SWzIc0vs
 0MT0E9MqyTMbETt7eD3ODSKbYdKbe8npyVuQ==
X-IronPort-AV: E=Sophos;i="5.96,164,1665460800"; 
   d="scan'208";a="84785773"
Date: Mon, 14 Nov 2022 17:16:20 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, "Wei
 Chen" <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Message-ID: <Y3J35CLd+JePuYon@perard.uk.xensource.com>
References: <7d56c33d-4b03-9aa1-6abc-45a8ad41caca@suse.com>
 <2E0BFEFC-5BEE-4F8B-BD9E-94CB9A5B2BC9@arm.com>
 <aa05f64b-fdc1-ab4e-e751-e19309f88eb8@suse.com>
 <9CE2A214-2D64-4BEC-A78B-393BF7AEDD9D@arm.com>
 <e8cae5b4-82db-cdb0-eccd-36337bc8ae5a@suse.com>
 <E9975528-1600-4F93-8C6E-263FF2A4A7F0@arm.com>
 <826eb0df-fb52-fa25-c908-977285a6ec8b@suse.com>
 <alpine.DEB.2.22.394.2211111245540.50442@ubuntu-linux-20-04-desktop>
 <e6c5d690-4df9-ccc1-6f33-bce8cc742703@suse.com>
 <282F1A51-D143-4F23-BEF6-43648505E7D9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <282F1A51-D143-4F23-BEF6-43648505E7D9@arm.com>

On Mon, Nov 14, 2022 at 12:30:39PM +0000, Luca Fancellu wrote:
> The cppcheck workflow instead is:
> 
> 1) call analysis-parse-tags-cppcheck
> 2) generate cppcheck suppression list
> 3) build Xen (and run cppcheck on built source files)
> 4) collect and generate report
> 5) call analysis-clean
> 
> So let’s think about detaching the build stage from the previous stages, I think it is not very convenient
> for the user, as during cppcheck analysis we build $(objtree)/include/generated/compiler-def.h, we build 
> $(objtree)/suppression-list.txt, so the user needs to build Xen where those files are created
> (in-tree or out-of-tree) otherwise the analysis won’t work and that’s the first user requirement (stage #3).
> 
> The most critical input to cppcheck is Xen’s $(CC), it comes from the build system in this serie, the user would
> need to pass the correct one to cppcheck wrapper, together with cppcheck flags, and pass to Xen build stage #3
> the wrapper as CC, second user requirement.

You could add something like that to Makefile:
    export-variables:
        @echo "CC='$(CC)'"

And if "the user" is a shell script, it could easily figure out what $CC
is, without having to duplicate the Makefile's logic for it.

> After the analysis, the user needs to run some scripts to put together the cppcheck report fragments
> after its analysis, this step requires also the knowledge of were Xen is built, in-tree or out-of-tree, so
> here the third user requirement (similar to the first one, but the stage is #4).

Don't support out-of-tree, that would make things easier. I don't see
how that would work anyway with the needed temporary changes to the
source code.

> In the end, we can see the user would not be able to call individually the targets if it is not mastering
> the system, it’s too complex to have something working, we could create a script to handle these requirements,
> but it would be complex as it would do the job of the make system, plus it needs to forward additional make arguments
> to it as well (CROSS_COMPILE, XEN_TARGET_ARCH, in-tree or Out-of-tree build, ... for example).

Well, instead of running `make X XEN_TARGET_ARCH=x86`, a script would be
run as `./script XEN_TARGET_ARCH=x86`, so not much change.
Then the script can easily run `make "$@"`.

Cheers,

-- 
Anthony PERARD

