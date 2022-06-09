Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC05544CB3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 14:55:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345446.571003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHhQ-0004Wp-KZ; Thu, 09 Jun 2022 12:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345446.571003; Thu, 09 Jun 2022 12:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzHhQ-0004UR-GL; Thu, 09 Jun 2022 12:55:44 +0000
Received: by outflank-mailman (input) for mailman id 345446;
 Thu, 09 Jun 2022 12:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pGOA=WQ=citrix.com=prvs=1525abdf4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nzHhO-0004UL-WF
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 12:55:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 770ab48a-e7f3-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 14:55:41 +0200 (CEST)
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
X-Inumbo-ID: 770ab48a-e7f3-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654779341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=An32kfb/a4ZZeopdzRTufgZnUzRsPAd2oqnosPKHT+Y=;
  b=PwCInauNT+t1PVr0OuRmkKs1ghHTYcs+OMNT1M1A8orK60ihsLRCxwgY
   aafEXQ45p4Q6eH/TB/8wXf7QT5Qe2tXTpcZaoersmSXA3ZRAN5/1N7bce
   i4xdig2nsFsLIMlP2V6dcCPNTtK7IuxSLNtsL4nWoNFoONOj4f3eaRqTi
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75780608
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QfMLaKluh8wU5BAcxp5fE77o5gyYJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbWW2GOfbcajH8fd91OYyy9EkFsZ/dmNNnGQBkrH1nESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DnW1PV4
 rsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYECIbPfDontshDBBXSwhbIYprwoL6CC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGNGU/NEqYM3WjPH8zVqoyo7yypkPjKTJgpnWr4vIO/1XqmVkZPL/Fb4OOJ43iqd9utkSFo
 mPL+UzpDxdcM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQMDDUGWF39puO24maUVshDM
 UUS9mwLpLIr6U2wZtDnWluzp3vslhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pEXFLdylYP3ZCFFZbpYm4yG0usv7RZo9GIq3oqtvKJW75z
 GijiTQZqo8usOdegs1X4mv7byKQSonhF1BouluKBD71sWuVd6b+OdX2tAGzAeJoad/AEwLf5
 CVsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iUsI2aBj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMUtK1bcpnEyOxXIt4wIrKTLufhnU
 ap3jO72VSpKYUiZ5GHeqxghPU8DmXllmDK7qWHTxBW7y7uODEOopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt4Itw8xP8Ny7eZl
 px/M2cBoGfCabT8AV3iQhhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:NRW1TaiofwuBzpXKcC1OeGAL8nBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.91,287,1647316800"; 
   d="scan'208";a="75780608"
Date: Thu, 9 Jun 2022 13:55:25 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Message-ID: <YqHtvZPQJOAFt/8K@perard.uk.xensource.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
 <6EE2C13C-7218-4063-8C73-88695C6BF4CE@arm.com>
 <0d85ad23-a232-eac3-416f-fff4d5ec1a93@suse.com>
 <258D1BE1-8E77-4748-A64C-6F080B9C1539@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <258D1BE1-8E77-4748-A64C-6F080B9C1539@arm.com>

On Thu, Jun 09, 2022 at 11:51:20AM +0000, Bertrand Marquis wrote:
> Hi,
> 
> > On 9 Jun 2022, at 11:26, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 09.06.2022 12:16, Bertrand Marquis wrote:
> >> With this change, compiling for x86 is now ending up in:
> >> CHK     include/headers99.chk
> >> make[9]: execvp: /bin/sh: Argument list too long
> >> make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
> >> 
> >> Not quite sure yet why but I wanted to signal it early as other might be impacted.
> >> 
> >> Arm and arm64 builds are not impacted.
> > 
> > Hmm, that patch has passed the smoke push gate already, so there likely is
> > more to it than there being an unconditional issue. I did build-test this
> > before pushing, and I've just re-tested on a 2nd system without seeing an
> > issue.
> 
> I have the problem only when building using Yocto, I did a normal build and the
> issue is not coming.
> 

Will the following patch help?


From 0f32f749304b233c0d5574dc6b14f66e8709feba Mon Sep 17 00:00:00 2001
From: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 9 Jun 2022 13:42:52 +0100
Subject: [XEN PATCH] build,include: rework shell script for headers++.chk

The command line generated for headers++.chk by make is quite long,
and in some environment it is too long. This issue have been seen in
Yocto build environment.

Error messages:
    make[9]: execvp: /bin/sh: Argument list too long
    make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127

Rework to that we do the foreach loop in shell rather that make to
reduce the command line size by a lot. We also need a way to get
headers prerequisite for some public headers so we use a switch "case"
in shell to be able to do some simple pattern matching. Variables
alone in POSIX shell don't allow to work with associative array or
variables with "/".

Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
Fixes: 28e13c7f43 ("build: xen/include: use if_changed")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/Makefile | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 6d9bcc19b0..ca5e868f38 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -158,13 +158,22 @@ define cmd_headerscxx_chk
 	    touch $@.new;                                                     \
 	    exit 0;                                                           \
 	fi;                                                                   \
-	$(foreach i, $(filter %.h,$^),                                        \
-	    echo "#include "\"$(i)\"                                          \
+	get_prereq() {                                                        \
+	    case $$1 in                                                       \
+	    $(foreach i, $(filter %.h,$^),                                    \
+	    $(if $($(patsubst $(srctree)/%,%,$i)-prereq),                     \
+		$(patsubst $(srctree)/%,%,$i)$(close)                         \
+		echo "$(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq),   \
+			-include c$(j))";;))                                  \
+	    esac;                                                             \
+	};                                                                    \
+	for i in $(filter %.h,$^); do                                         \
+	    echo "#include "\"$$i\"                                           \
 	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
 	      -include stdint.h -include $(srcdir)/public/xen.h               \
-	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) \
+	      `get_prereq $$i`                                                \
 	      -S -o /dev/null -                                               \
-	    || exit $$?; echo $(i) >> $@.new;) \
+	    || exit $$?; echo $$i >> $@.new; done;                            \
 	mv $@.new $@
 endef
 



-- 
Anthony PERARD

