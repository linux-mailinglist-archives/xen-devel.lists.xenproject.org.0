Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9984F1347
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 12:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298258.508026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKFL-0007nW-RF; Mon, 04 Apr 2022 10:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298258.508026; Mon, 04 Apr 2022 10:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbKFL-0007kF-Nb; Mon, 04 Apr 2022 10:47:43 +0000
Received: by outflank-mailman (input) for mailman id 298258;
 Mon, 04 Apr 2022 10:47:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Xnj=UO=citrix.com=prvs=086167401=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nbKFJ-0007k7-JU
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 10:47:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4fbb381-b404-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 12:47:40 +0200 (CEST)
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
X-Inumbo-ID: a4fbb381-b404-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649069259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/4MjAvIxt3HyhcIudSp3fr7j4stAeed9wQqncqYhGLM=;
  b=AHIgArF2ACEYPs7mRG3d140vkIeRKZ6PBdAyi05VgcZ5nLI4oLz7qDf6
   Pr1Bh0Fm2EdCQNDKGzr68fU4dG9UPrVILj5qhIQVFxlfWWzevnk8Vxaoc
   24GwkGEJJCxkGpIV+JEs2XIKLvFX58oWm5eXNRNPfVFnZ/C99fm372wq2
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67927137
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:33spQakoZh7gRSsv+IS3PGPo5gzpJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaCzjUMv3ZZjb2Ko0naIrnp0sDv5SBzt43QQNr/ihmRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW1/V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYbR12Lp3lhNonXhBpTid9PKptxbGdCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNms1M02bPHWjPH8ZS5IQ372YpUPlYgF2qnLJvqoeyHPqmVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3UruUCT+KfjzBTkApQGd
 hJSqnFGQbUOGFKDasOiTy2RvEC+sxctBtxTEuoR1Q/X4/+Bi+qGPVQsQjlEYd0gkcY5Qz02y
 1OE9+/U6SxTXK69EizEqOrNxd+mEW1MdDJZO3dYJecQy4O7yLzfmC4jWTqK/ESdqtTuUQ/9z
 DmRxMTVr+VC1JVbv0lXEL2uvt5NmnQrZlNujuk0djj8hu+cWGJDT9b1gbQ8xawdRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQ8h5rWzxpiL4Idw4DNRCyKFBaJtsldjBO
 hG7hO+szMULYCvCgVFfPepd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs+16Ko
 44GZ5LVk32ykoTWO0HqzGLaFnhSRVBTOHw8g5Y/mjKrSua+JFwcNg==
IronPort-HdrOrdr: A9a23:3/pTSazvcba6ysTV5641KrPwKr1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPHjP+VEssRAb6LW90ca7LE80maQY3WBVB8bFYOCEghrLEGgB1+vfKlTbckWUnNK1l5
 0QEJSWYOeAdGSS5vya3ODXKbkd/OU=
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67927137"
Date: Mon, 4 Apr 2022 11:47:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] tools/firmware: fix setting of fcf-protection=none
Message-ID: <YkrMxp66sCDKRN/Z@perard.uk.xensource.com>
References: <20220404104044.37652-1-roger.pau@citrix.com>
 <20220404104044.37652-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220404104044.37652-2-roger.pau@citrix.com>

On Mon, Apr 04, 2022 at 12:40:43PM +0200, Roger Pau Monne wrote:
> Setting the fcf-protection=none option in EMBEDDED_EXTRA_CFLAGS in the
> Makefile doesn't get it propagated to the subdirectories, so instead
> set the flag in firmware/Rules.mk, like it's done for other compiler
> flags.
> 
> Fixes: 3667f7f8f7 ('x86: Introduce support for CET-IBT')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

