Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAED9495337
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 18:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259154.447121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAbDz-0006li-0G; Thu, 20 Jan 2022 17:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259154.447121; Thu, 20 Jan 2022 17:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAbDy-0006j7-TU; Thu, 20 Jan 2022 17:27:50 +0000
Received: by outflank-mailman (input) for mailman id 259154;
 Thu, 20 Jan 2022 17:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UD6j=SE=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nAbDx-0006iz-Gd
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 17:27:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47e0a611-7a16-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 18:27:47 +0100 (CET)
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
X-Inumbo-ID: 47e0a611-7a16-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642699667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ALNPjgI6B61PGByYAIwryWZcam88Y05WKfaOQG86H1M=;
  b=d07EmvWhOecel0affzcRJyCraYe0p52EZ5BwG6Xt0BldIClKOrEX0btb
   nMnTkttPrcy77SqcUPcWCz786dUaJ1ylOt9hGKZ6ZLoiD3T3t1apb9Rm3
   8trbcvzC7XrHf6pAljxlds7ozTXfkKVkKe2hIH1XCjTXYdeT1GqxZMuyv
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EuFOsLyC4TJCrekWjWtX/ovI1v3hydxXiSCLGO8jdzuzekuDhvowvY6L7wvgQZu6iMaYCKp6o2
 0pOuWwI4BZq0ZEy7+ay/pr6Of0q+B45X4oFmsGE4SyBuN2rk+e4QM8JPvF/NOYopAiia/Rtodp
 f35pb+6Yz+fguhKcZVHTtSKJ7rf7xprbcxropegyl/08ssJpAR5Go7ViYEfWjg7GcuH7P3LRFI
 ZePX7t9JzkLiH+pgJGrCMbLIdaJNOkDjbDrOsthZGdAoVliXG7RjnPHXH8X7gISQYNPlYG/SuI
 e1O7LkXhGWegXWOWPNZwJZAV
X-SBRS: 5.2
X-MesageID: 64577031
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FNL796JEMT29pfvVFE+RWpIlxSXFcZb7ZxGr2PjKsXjdYENSgjYEx
 mBKW2qOP6qJM2amfItyaN+woE0GsMTdyNFrT1FlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5w7Zi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2DvPlyw
 u1q7KXtEyMYHqfxqfk6UUZHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gls258RRa2HD
 yYfQQpMbDv/IDseAQ4eCK8SjNWZglrCUSIN/Tp5ooJoujOOnWSdyoPFK8HJc9aHQcFUmEewp
 W/c+Wn9RBYAO7S31j6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QW8Cczqak59GSwU8LwGRa/pRasvwEec8pdFfUg7wOAwbaS5ByWbkAGUzpAZdoOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqbwwtTgE9xIDa/dsXvzLFc+d+N6zqkYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBN/BFgHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vGAWyKRBaJ9sldrVj
 Kn74185CHh7ZirCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6xyhZ1zvFjZ
 8vCIa5A6Er274w9kFJaoM9GidcWKt0WnzuPFfgXMTz6uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikH1ivBnFSnCPq+Y7dAlSRVBiXMyeg5EJKoarf1Q3cEl8W6656e5wIORNwvUK/tokC
 1ngACe0PnKl2y2eQehLA1g+AI7SsWFX9CJiYnd0bA/2ghDOo++Htc8iSnf+RpF/nMQL8BK+Z
 6BtlxyoDqsdRzLZ1S4aaJWh/oVueA7y3VCFPja/YSh5dJllHlSb9tjhdwrp1S8PEivo6pdu/
 +z+jlvWEcgZWgBvLMfKc/bznVm/imcQxbBpVEzSL9gNJEi1qNp2Kzb8h+McKt0XLUmR3SOT0
 gubWE9KpeTEr4Iv3sPOgKSI89WgH+dkRxIIFGjH97emcyLd+zP7k4NHVe+JexHbVX/1p/r+N
 bkEkamkPaRezlhQsod6H7J69o4E5oPi9+1A0wBpPHTXdFD3WLluFWaLgJtUvapXy74H5QbvA
 hCT+sNXMKmiMd/+FAJDPxIsa+mO2K1GmjTW6vhpckz26DUuoeiCWERWeRKNlDZcPP1+N4Z8m
 bUtv8sf6gqejBs2M4nZ0nAIpjrUdnFQAb86spw6AZPwjlt5w15PVpXQFyvq7czdcN5LKEQrf
 meZiaeqa26wHaYen67fzUTw4Nc=
IronPort-HdrOrdr: A9a23:Au68cK8QlUxcwmN6TjRuk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,303,1635220800"; 
   d="scan'208";a="64577031"
Date: Thu, 20 Jan 2022 17:27:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 32/47] build: shuffle main Makefile
Message-ID: <YembjUV913dlzqBa@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-33-anthony.perard@citrix.com>
 <8b583cd0-216e-37a9-7f67-ec0e04123f54@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8b583cd0-216e-37a9-7f67-ec0e04123f54@suse.com>

On Tue, Dec 21, 2021 at 03:18:34PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> > Reorganize a bit the Makefile ahead of patch
> > "build: adding out-of-tree support to the xen build"
> 
> Without you saying so it's not clear why that's good of even
> necessary. Moving things around always has the potential of
> breaking subtle ordering requirements, so I'd prefer to see
> what good the movement does.

Some explanation about why most of the code movement is needed:


In Kbuild, *srctree and *objtree are been set after setting $(quiet),
$(Q), $(KBUILD_VERBOSE). We will do the same. Also, we need to set the
$(*tree) variables only on first execution of Makefile, not in sub-make,
the we need to move them. Been before or after $(KBUILD_VERBOSE) doesn't
seems to matter, but they needs to be in the area, in "root-make-done"
guard.

$(XEN_ROOT) as the same issue as $(*srctree), it will be set only after we
know the value of $(abs_srctree).

"Kbuild.include" needs to be included after $(srctree) is set.

We can't include "Config.mk" without knowing $(XEN_ROOT), it needs to move.

We can't calculate without $(TARGET_*ARCH) without $(XEN_TARGET_ARCH)
which is set if needed in "Config.mk".

$(ARCH) and $(SRCARCH) seems misplaced before the patch, Not moving them
might mean wrong value might be exported if "Config.mk" isn't included.
I think I have to investigate this one, and potentially produce a new patch.

So the code movement is just because we need to be careful when setting
the different $(*tree) variables, and $(XEN_ROOT).


I'll add something like that to the commit message.

Cheers,

-- 
Anthony PERARD

