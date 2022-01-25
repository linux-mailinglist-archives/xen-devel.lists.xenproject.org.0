Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F249B2A4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260103.449313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfq-00005d-Nc; Tue, 25 Jan 2022 11:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260103.449313; Tue, 25 Jan 2022 11:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfp-0008As-P1; Tue, 25 Jan 2022 11:07:41 +0000
Received: by outflank-mailman (input) for mailman id 260103;
 Tue, 25 Jan 2022 11:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJa4-0006Mn-Pu
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e5775e1-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:43 +0100 (CET)
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
X-Inumbo-ID: 2e5775e1-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7KAr3KbJf7CWZ9Fur51Yu/oqVGxLt72Hj4OHnlxzeGM=;
  b=ZzeihZigZlU9NKUGweXw5FSG5N8UjYyYHw8VBWKm1QAV8oD9AberY11f
   QtCRxBIAytax32Fp/BFIqNVvF+P9m3fYZXi/gGvhhNSw2Of7Q4Vzh43Ij
   eeqZr2iCkxjsszkBmlWLddG0pyELrYgK3iS6A8jnUoajQiTdMDfiScMfd
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: McnHcUqrvVuBtNsy2nBmdrQC5F0zH3331/KGX+mWFR7FMMkEZ3Dll/UQ4mtoB/4ih9Pp+tA9ru
 kTk2pKYIPKF8UtpS43uSpY5ZR7PAhwCwL0Gzpp95Yr/QdVStxudk1g8FA7+BTwVhvsp5kcRWN1
 iYDlDCCekUFz3JaKiOV8M72kQwQZA2sxREblvOGmDB7oTfD+xCe9vRZG0WIk+euq39PdeQNARB
 TUxilvopxFODnNy/8RFM/bDijsxVImcK0XllW07Sf2cRSSXB0oxn1xIfhqUokODIR66O37Vo/K
 B2t2lRtJn9SFwvQOihQXDf6n
X-SBRS: 5.2
X-MesageID: 62618954
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YIdxmaLPEqQviv8iFE+RDJIlxSXFcZb7ZxGr2PjKsXjdYENSgWMHy
 zYYXWvUaPmMNmPze41yb4Wz8UNS68TWnNFnHAFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5xrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Ys/xr2
 uUK6qe6cgoAI7bDtMEQYzBhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Glq2JkeTKuCD
 yYfQR9iQgjrQg8IAWwsN7QnudqimUf7fzIN/Tp5ooJoujOOnWSdyoPFO9PPdtuHbc5chEqfq
 yTN+GGRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO7wWxBuf+u2L2AyiC0EZVTFtTdEWnfZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZT2AAcmVsnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1aZ5YKGC2P
 h6C4Wu9AaO/2lPwMcebhKrqU6wXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2lk3yPjOTPDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbaNmPT0FDr2nCsQWmKZORW03wY8TXMCv9JcPJ7fde2KL2ggJUpfs/F/oQKQ994w9qwsC1
 ijVtpZwxAWtiHvZBx+Nb3w/OrrjUYwm9SAwPDA2PEbu0H8mON794KAafpoxXL8m6O08kqIkE
 6hbI52NUqZVVzDK2zUBdp2h/oZsQwum2FCVNC2/bTlhI5M5H17V+sXpdxfE/TUVCnblrtM3p
 rCtj1uJQZcKSwl4ItzRbfajkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLCU8YEv8dTPiaSVlKuTErNzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8z6oe9p7JeyQg4TnzHY07yV+FlK3iCm8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4H4l9bWKZkxeIh2QhXEPN7ByKo4kn
 b8stcN+B9ZTUfb23gJqVhxpylk=
IronPort-HdrOrdr: A9a23:9Fo2Ra/tBkcVqw93FqNuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62618954"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v9 13/30] xen/tools/kconfig: fix build with -Wdeclaration-after-statement
Date: Tue, 25 Jan 2022 11:00:46 +0000
Message-ID: <20220125110103.3527686-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to start building kconfig with HOSTCFLAGS from Config.mk,
it has the flag "-Wdeclaration-after-statement".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v9:
    - reviewed

 xen/tools/kconfig/confdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/kconfig/confdata.c b/xen/tools/kconfig/confdata.c
index 3569d2dec37c..a69250c91355 100644
--- a/xen/tools/kconfig/confdata.c
+++ b/xen/tools/kconfig/confdata.c
@@ -1237,6 +1237,7 @@ void set_all_choice_values(struct symbol *csym)
 
 bool conf_set_all_new_symbols(enum conf_def_mode mode)
 {
+	bool has_changed = false;
 	struct symbol *sym, *csym;
 	int i, cnt, pby, pty, ptm;	/* pby: probability of bool     = y
 					 * pty: probability of tristate = y
@@ -1283,7 +1284,6 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 			exit( 1 );
 		}
 	}
-	bool has_changed = false;
 
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym) || (sym->flags & SYMBOL_VALID))
-- 
Anthony PERARD


