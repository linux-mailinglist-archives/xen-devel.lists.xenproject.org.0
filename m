Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F501C2112
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 01:04:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUeho-0001Bq-Fe; Fri, 01 May 2020 23:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUehn-0001BR-50
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 23:04:27 +0000
X-Inumbo-ID: 1a67054c-8c00-11ea-9b70-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a67054c-8c00-11ea-9b70-12813bfff9fa;
 Fri, 01 May 2020 23:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588374266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xNDjbEw11ojfVPqDcOxo4l2IKtjrw8Xz8xcuwlJlm7I=;
 b=eOVxo4n+9/viNDAsWhSpUoPBcSA59fnHUISp3LXnZfWKMoFNgl87Imud
 T76m4Z/2FwXqpTIKEIB76Kd1K0DumP8ZwZWBGayH4TRgwapFo6EWMKMdw
 JeM2v7SjYBZyB9x2dRltNYcvtrTXwIuAVyUuy//YWWhHwYLzpk8yx+ZNj 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RQO3kNgN7pqeaRKjD9Q7Gzk0acvKAER0HyP3NHfdCg9AB4epBxfWQjxpqYwfziLU6MdX16WBTJ
 m7hpKTIs/06zkqPrwoy3oS5boN20Wlm8uHuxFZDZcx8vQaXXvLB2NXEYjwYsiEZVOwvvLgtwGT
 9LV4M8CLgpvLmAljGbxKnZTLrcvmZLaS9N31HkYU3sWXcTzPB3wrcVwfKxrM9XG0x36zjjoDW4
 VBv/6wK9MncRLIlOKplp+a8VKMEnCrxKzzAeNz3FFmHDfCXM788JCNHWizvayskqdZeJwtXzUY
 4CA=
X-SBRS: 2.7
X-MesageID: 16906065
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16906065"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 12/16] x86/extable: Adjust extable handling to be shadow stack
 compatible
Date: Fri, 1 May 2020 23:58:34 +0100
Message-ID: <20200501225838.9866-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When adjusting an IRET frame to recover from a fault, and equivalent
adjustment needs making in the shadow IRET frame.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/traps.c        | 22 ++++++++++++++++++++++
 xen/arch/x86/x86_64/entry.S | 11 ++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 1cf00c1f4a..2354357cc1 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -778,6 +778,28 @@ static bool exception_fixup(struct cpu_user_regs *regs, bool print)
                vec_name(regs->entry_vector), regs->error_code,
                _p(regs->rip), _p(regs->rip), _p(fixup));
 
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+    {
+        unsigned long ssp;
+
+        asm ("rdsspq %0" : "=r" (ssp) : "0" (1) );
+        if ( ssp != 1 )
+        {
+            unsigned long *ptr = _p(ssp);
+
+            /* Search for %rip in the shadow stack, ... */
+            while ( *ptr != regs->rip )
+                ptr++;
+
+            ASSERT(ptr[1] == __HYPERVISOR_CS);
+
+            /* ... and adjust to the fixup location. */
+            asm ("wrssq %[fix], %[stk]"
+                 : [stk] "=m" (*ptr)
+                 : [fix] "r" (fixup));
+        }
+    }
+
     regs->rip = fixup;
 
     return true;
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 6403c0ab92..06da350ba0 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -708,7 +708,16 @@ exception_with_ints_disabled:
         call  search_pre_exception_table
         testq %rax,%rax                 # no fixup code for faulting EIP?
         jz    1b
-        movq  %rax,UREGS_rip(%rsp)
+        movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
+
+#ifdef CONFIG_XEN_SHSTK
+        mov    $1, %edi
+        rdsspq %rdi
+        cmp    $1, %edi
+        je     .L_exn_shstk_done
+        wrssq  %rax, (%rdi)             # fixup shadow stack
+.L_exn_shstk_done:
+#endif
         subq  $8,UREGS_rsp(%rsp)        # add ec/ev to previous stack frame
         testb $15,UREGS_rsp(%rsp)       # return %rsp is now aligned?
         jz    1f                        # then there is a pad quadword already
-- 
2.11.0


