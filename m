Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2869A91C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 11:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496990.767919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSy2A-0005Kt-9P; Fri, 17 Feb 2023 10:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496990.767919; Fri, 17 Feb 2023 10:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSy2A-0005HZ-6C; Fri, 17 Feb 2023 10:32:06 +0000
Received: by outflank-mailman (input) for mailman id 496990;
 Fri, 17 Feb 2023 10:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLKc=6N=citrix.com=prvs=405e6d4a1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSy29-0005HT-2q
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 10:32:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f90c803-aeae-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 11:32:01 +0100 (CET)
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
X-Inumbo-ID: 4f90c803-aeae-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676629921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0jeOrVtcwdhfCtoBJS7aO6anVTkScd2Z7HWOwKPjLHA=;
  b=fD4c//gM0Uw3rlNLlCFxHP+3QY0cg/DsUWPo0Hy/gS8svhewDFBLMsaK
   xtR4HPyIPBz1XoJ2/w2hugQ+zlUwRlrx5dAQFvp7EFA0JjwwSQY1n+kja
   HOFAlE24glJhmPOiRWAL/HH/tUrIJFnfIsZmfqM3rcaBFegNkJfBEs6yy
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97366394
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:yMIMY6ONPfINIZzvrR1ul8FynXyQoLVcMsEvi/4bfWQNrUohhTEHn
 TNKD2GGPfaOYzf2Lt8nO4m+pB4D65/Ty4VmTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5wNmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sBbWEdt8
 NMoEjMcLQ2Ghf+8wpGhbsA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3VHpsLxRfEz
 o7A12f8JB1CLe2v82K6qCu8ouj9oSyqG7tHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiIgrgwjGVNpLDK+/hdqzEjb1q
 w1mtwBn2e9V15RSkfzmoxae2WnESoX1ohAdwCmOeEGgwTNDZ5/meomq9FLZzuxkBdPMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1HsyDaJz9zq3+KTJrU3YE
 c7CGftA9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLFulYbwHSNrBit/PsTODpH
 zF3bZbi9vmieLemPnm/HXA7czjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9UNokihrc+Rp
 ivVchYBmDLCaYjvdV3ihoZLNOm+Av6SbBsTYUQRALpf8yNyO9j2vPxBLspfkHtO3LUL8MOYh
 sItI62oasmjgByek9jBRfERdLBfSSk=
IronPort-HdrOrdr: A9a23:eTwP6qgsePl44WPQnaVXdo3WM3BQXuUji2hC6mlwRA09TyVXrb
 HWoB17726NtN91YhsdcL+7Scy9qB/nhPxICMwqTNSftWrd2VdATrsSibcKqgeIc0bDH6xmtZ
 uIGJIOb+EYY2IK6/oSIzPVLz/j+rS6GWyT6ts2Bk0CcT1X
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="97366394"
Date: Fri, 17 Feb 2023 10:31:50 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] tools: Remove the use of K&R functions
Message-ID: <Y+9XlvlAtUfNFO1G@l14>
References: <20230216231636.714006-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230216231636.714006-1-andrew.cooper3@citrix.com>

On Thu, Feb 16, 2023 at 11:16:36PM +0000, Andrew Cooper wrote:
> Clang-15 (as seen in the FreeBSD 14 tests) complains:
> 
>   xg_main.c:1248 error: a function declaration without a
>   prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
>   xg_init()
>          ^
>           void
> 
> The error message is a bit confusing but appears to new as part of
> -Wdeprecated-non-prototype which is part of supporting C2x which formally
> removes K&R syntax.
> 
> Either way, fix the offending functions.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

