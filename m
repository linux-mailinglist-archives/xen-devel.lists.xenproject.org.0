Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAC53F5CA4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170991.312199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBb-0007s9-FA; Tue, 24 Aug 2021 11:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170991.312199; Tue, 24 Aug 2021 11:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBb-0007o7-1x; Tue, 24 Aug 2021 11:01:43 +0000
Received: by outflank-mailman (input) for mailman id 170991;
 Tue, 24 Aug 2021 11:01:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU4X-0001EC-F8
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4d2f649-f41e-4578-908e-2618cdba78ae;
 Tue, 24 Aug 2021 10:52:20 +0000 (UTC)
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
X-Inumbo-ID: b4d2f649-f41e-4578-908e-2618cdba78ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FDnqHMoR0cH4CGhhkHf9+wr9hwq4IdoBCZrIirFvi5I=;
  b=W0x7J9SkHZWsKgTk3bS5eDzQs9sGJaAMc3iL/yOyZspWlK5t1X8apZBn
   unLtOF9YfrfLgiycGm5rIQMic2H60CfSozaxz7EY1Vt4oBGzy2DxPq89S
   x8ZiitSOMi9+D0iyImLFbzFDhXoadjVqQZWZyOshFmtu0zQSAfZ+jTXLN
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ubg3qgVyfvbrTwyewNxqT5RGvwVUhQ2qV4dJWl/Nl5iTvb9pIMdQIJtrQXJZp51z3g4ThjDVL1
 OR70pnT0QUZs6EqIq/km1xyqD6emaboy9jQaZCaaaO36qX9RlSMYLi39c0aQJ5WHV1cL3hcGxe
 altK5+1Pv5WfioqPTvVe5nUVr6tLC3azohMGif8p3bLgO5Fxaoq4Z7Q24kjSESatBCi4vBI2bV
 VrO5jxU6vvJ5pDkr5ccm4BiVEthMH6S6JSltusS62EDW3IwslkdqPNQCoSLjZYz3VdrPanBDVA
 ahZwzoYtVsmMVnO7fh8U0jD+
X-SBRS: 5.1
X-MesageID: 51166413
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SaWcj6NZFIw1HsBcT33155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE7gr4WBkb+exoS5PwOE80lKQFqrX5Uo3SODUO1FHHEGgA1/qp/9SDIVyYygc178
 4JH8dD4bbLfDtHZLPBkWyF+qEbsbu6Gc6T5Nv2/jNId0VHeqtg5wB2BkKwCUttXjRLApI/Cd
 61+tdHjyDIQwVaUu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmj2AsEWT8n+8ZszY
 GFqX222kyQiYD69vbu7R6R032Qoqqi9jJ3Pr3MtiHSEESotu/nXvUkZ1TIhkFMnAjm0idQrD
 CLmWZsAy070QKqQkil5RTqwAXuyzAo9jvrzkKZm2LqpYjjSCs9ENcpv/MuTvL10TtVgDhH6t
 M944tZjesnMTrQ2CDmo9TYXRBjkUS55XIkjO4IlnRaFY8TcqVYo4AT9F5cVM5oJlOz1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGclzJWgHd6xU0Fw9F3pAZIyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBdC6D2TcKCi8RV564W6XZp3vHki91aIfzI9FmN1CSaZ4v6fawq
 6xLW+wnVRCBH7GGImU2oFX/lTXXGCwNA6duv1j2w==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51166413"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 45/51] build: rework cloc recipe
Date: Tue, 24 Aug 2021 11:50:32 +0100
Message-ID: <20210824105038.1257926-46-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

After folowing patches, the recipe doesn't work anymore.
    - build: build everything from the root dir, use obj=$subdir
    - build: introduce if_changed_deps

First patch mean that $(names) already have $(path), and the second
one, the .*.d files are replaced by .*.cmd files which are much
simpler to parse here.

Also replace the makefile programming by a much simpler shell command.

This doesn't check anymore if the source file exist, but that can be
fixed by running `make clean`, and probably doesn't impact the
calculation. `cloc` just complain that some files don't exist.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 36a64118007b..b09584e33f9c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -490,14 +490,7 @@ _MAP:
 
 .PHONY: cloc
 cloc:
-	$(eval tmpfile := $(shell mktemp))
-	$(foreach f, $(shell find $(BASEDIR) -name *.o.d), \
-		$(eval path := $(dir $(f))) \
-		$(eval names := $(shell grep -o "[a-zA-Z0-9_/-]*\.[cS]" $(f))) \
-		$(foreach sf, $(names), \
-			$(shell if test -f $(path)/$(sf) ; then echo $(path)/$(sf) >> $(tmpfile); fi;)))
-	cloc --list-file=$(tmpfile)
-	rm $(tmpfile)
+	find . -name '*.o.cmd' -exec awk '/^source_/{print $$3;}' {} + | cloc --list-file=-
 
 endif #config-build
 
-- 
Anthony PERARD


