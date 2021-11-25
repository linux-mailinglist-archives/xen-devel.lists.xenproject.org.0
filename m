Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4AB45DB94
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231315.400371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6Y-0002dc-ED; Thu, 25 Nov 2021 13:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231315.400371; Thu, 25 Nov 2021 13:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6X-0002PB-Di; Thu, 25 Nov 2021 13:48:01 +0000
Received: by outflank-mailman (input) for mailman id 231315;
 Thu, 25 Nov 2021 13:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0Z-00076i-Go
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70706428-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:50 +0100 (CET)
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
X-Inumbo-ID: 70706428-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+5GlssNqzezOU4qfx2oQIRykHbCirnnHU6kOEffUfDw=;
  b=U3Ke+kHiIBtcVeKPXF7u2lZJKOX6HDX06BbfhNDRnOb+uByPdYk0y6KB
   KoCAkdx2Fl6ONjGcGuBlQcB4AQ7wU8kmaCa1kGscSOdWFxLeOhb3t7QTe
   Bnth5x0lSwi1+9L04VVVEqwgi2am5iMmoBJX0ypEYdAJLCfOKnuAHjWf1
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: roT4h0hXUysONDDGByW2I8X4yX2zQKPYQYLq90RMxZ1O0lcTeqIMkXmQ8Zsof3sdeRT4rUvyDq
 Mkm/KnU38wBlNCJxumT81tPVhLYySfWefyDrhPMQHgplYg5H6R4tHbPuox35nm0vC0NSMyc0Zu
 TOwZWNRE8qk+7ZwlAvU/kZgPxpypVDCU/dq6wBnOGIvJ4+XI7mNisNjj8ojw3Q4IuN37h/acMj
 kZJrcP6XZFMhB+dLaQnPgvrG4T3jUIrDnaaip6Sabq6j4shJCD46OdEexpbmpLacCX3ZBZPNeg
 GEJG0zbS4ikWFqVFuFLNlG65
X-SBRS: 5.1
X-MesageID: 59006050
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DRU4L6g1xBZ/0G24iuslO8GVX161nRcKZh0ujC45NGQN5FlHY01je
 htvWmuCPqnZZ2D8ct0lOYzgoE8FuJPQnN8wSAo5r3s9ECwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0T5YHzakADHZTtne4aAhADKX1bZfBZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauPP
 5JHMWc3BPjGSyFTHQYaJbsioMqh22KgTwxiplaqtbVitgA/yyQuieOwYbI5YOeiR9hRn0uej
 nLL+SL+GB5yHMeE1TOP/3aoh+nOtSD2QoQfEPu/7PECqEKX7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WsVSO/037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUtvYn+46J0pDH2b9NpF/+81eepPGmt3
 GXfxMQhvIk7gckO3qS92FnIhTOwu5TEJjIIChXrsnGNtV0gOtP8D2C8wR2CtKsbct7FJrWUl
 CFcw5D20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBbplsldzBO
 ha7VeZtCHh7ZibCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj62zxdzwPFva
 M3FIK5A6Er27ow9klKLqxo1i+d3lkjSO0uPLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5TPb9q
 L5i2z+x40wHCoXWO3CPmaZKdAxiBSVrVPje9p0MHsbec1UOJY3UI6KIqV/XU9c+xPo9eyah1
 izVZ3K0P3Kj3yCaclvTNSg4AF4tNL4mxU8G0eUXFQ7A8xAejUyHtc/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:I8/ecKilnECIIwrEl8fB6sU4uXBQX1913DAbv31ZSRFFG/FwyP
 re/sjzhCWE6wr5BktBpTnZAtj/fZoYz+8G3WBjB8bSYOCGggWVxe5ZnPHfKlHbakrDH6tmpN
 hdmstFeZLN5DpB/LvHCWCDer5KqrbngcXY4dsy100AcegpUdAd0+4QMHfZLqQcfng+OXNNLu
 vm2iMxnUvZRZ14VLXcOlA1G8LEqtH3ipSjRRIdHRYo5Cmi5AnYqYLSIlyz2BoTbi1I+Kwl+2
 TeiQD1j5/T881T/iWslVM7oq4mwOcIBbN4dYCxo/lQDg+pphejZYxnVbHHlDcpoNu34FJvq9
 XIqwdIBbU515uEFFvZnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzYBB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3NIiFXtuYcc99R/Bmdwa+a
 hVfZzhDc9tAAmnhqXizzZSKN/FZAV6Iv7JeDlNy5+oO/4/pgE986JS/r1uop46zuNId3Gfj9
 60dpiA3Is+PfP+TZgNQtvpEvHHU1Akt3r3QS+vyWqOLtBwB5o7w6SHqondotvaI6AgzJw8no
 nMWlIdtWNaQTOoNSS+5uwDzvmWehTJYd3E8LAo26RE
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="59006050"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 34/47] build: add %.E targets
Date: Thu, 25 Nov 2021 13:39:53 +0000
Message-ID: <20211125134006.1076646-35-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

I guess it's easier to remember that %.E does "$(CC) -E" or "$(CPP)".

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 4 ++--
 xen/Rules.mk | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 995815e82235..e39a6f82859a 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -609,10 +609,10 @@ cscope:
 _MAP:
 	$(NM) -n $(TARGET)-syms | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' > System.map
 
-%.o %.i %.s: %.c tools_fixdep FORCE
+%.o %.i %.s %.E: %.c tools_fixdep FORCE
 	$(Q)$(MAKE) $(build)=$(*D) $(*D)/$(@F)
 
-%.o %.s: %.S tools_fixdep FORCE
+%.o %.s %.E: %.S tools_fixdep FORCE
 	$(Q)$(MAKE) $(build)=$(*D) $(*D)/$(@F)
 
 %/: tools_fixdep FORCE
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 73d5b82ab2e7..745d892d0707 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -287,6 +287,11 @@ $(obj)/%.s: $(src)/%.c FORCE
 $(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
+$(obj)/%.E: $(src)/%.c FORCE
+	$(call if_changed_dep,cpp_i_c)
+$(obj)/%.E: $(src)/%.S FORCE
+	$(call if_changed_dep,cpp_s_S)
+
 # Linker scripts, .lds.S -> .lds
 quiet_cmd_cpp_lds_S = LDS     $@
 cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -DLINKER_SCRIPT -MQ $@ -o $@ $<
-- 
Anthony PERARD


