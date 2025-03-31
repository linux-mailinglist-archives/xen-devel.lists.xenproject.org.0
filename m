Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2904BA76174
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931998.1334232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARF-000347-K1; Mon, 31 Mar 2025 08:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931998.1334232; Mon, 31 Mar 2025 08:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzARF-0002wY-1s; Mon, 31 Mar 2025 08:24:09 +0000
Received: by outflank-mailman (input) for mailman id 931998;
 Mon, 31 Mar 2025 08:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=orDG=WS=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzARD-0001u1-0R
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:24:07 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80061ecd-0e09-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:24:02 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52V8Mp093171319
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 31 Mar 2025 01:23:16 -0700
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
X-Inumbo-ID: 80061ecd-0e09-11f0-9ea7-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52V8Mp093171319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743409398;
	bh=XaAm3SgdeuQpqxiLf3TgiBnvvEMb/sqRjazcaLW8DyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m3OGyhoJNr0Zsep5p1ViUs89IdqwpoEtbWuo2OsC8y9JAzzZbZXvjUjaRqzx5AUYK
	 lJcmsGoVuGakNOlQ489XYhpn7UoCG2qfRQMcP3vMYw+NnWAKYOXHRdzMSDVDxQLIJJ
	 kKOmdnvGQYVe7ioNqEmxq2m51haFE/snyyuHDZ7lhQTKPP3O+McTy73wS5FrEXpbEA
	 GSpcgMRq/tDS9ikpfmvoHA9qWJyh5e7k4bNtkTdyO72QoWkxhdrF5ZM+BjwqxGvb8o
	 Fxagag3lgbW6Apcxom4HGKuHb9Jh6FSWSc4zA4lH3CcX3khjRVDzEBBBmSENC1+wB9
	 70W8KGHT8R63g==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-edac@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org,
        acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
Subject: [RFC PATCH v1 09/15] x86/opcode: Add immediate form MSR instructions to x86-opcode-map
Date: Mon, 31 Mar 2025 01:22:45 -0700
Message-ID: <20250331082251.3171276-10-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331082251.3171276-1-xin@zytor.com>
References: <20250331082251.3171276-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the instruction opcodes used by the immediate form WRMSRNS/RDMSR
to x86-opcode-map.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 arch/x86/lib/x86-opcode-map.txt       | 5 +++--
 tools/arch/x86/lib/x86-opcode-map.txt | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
index caedb3ef6688..e64f52321d6d 100644
--- a/arch/x86/lib/x86-opcode-map.txt
+++ b/arch/x86/lib/x86-opcode-map.txt
@@ -839,7 +839,7 @@ f1: MOVBE My,Gy | MOVBE Mw,Gw (66) | CRC32 Gd,Ey (F2) | CRC32 Gd,Ew (66&F2)
 f2: ANDN Gy,By,Ey (v)
 f3: Grp17 (1A)
 f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey (F2),(v) | WRUSSD/Q My,Gy (66)
-f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSSD/Q My,Gy
+f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSSD/Q My,Gy | RDMSR Rq,Gq (F2),(11B) | WRMSRNS Gq,Rq (F3),(11B)
 f7: BEXTR Gy,Ey,By (v) | SHLX Gy,Ey,By (66),(v) | SARX Gy,Ey,By (F3),(v) | SHRX Gy,Ey,By (F2),(v)
 f8: MOVDIR64B Gv,Mdqq (66) | ENQCMD Gv,Mdqq (F2) | ENQCMDS Gv,Mdqq (F3) | URDMSR Rq,Gq (F2),(11B) | UWRMSR Gq,Rq (F3),(11B)
 f9: MOVDIRI My,Gy
@@ -1014,7 +1014,7 @@ f1: CRC32 Gy,Ey (es) | CRC32 Gy,Ey (66),(es) | INVVPID Gy,Mdq (F3),(ev)
 f2: INVPCID Gy,Mdq (F3),(ev)
 f4: TZCNT Gv,Ev (es) | TZCNT Gv,Ev (66),(es)
 f5: LZCNT Gv,Ev (es) | LZCNT Gv,Ev (66),(es)
-f6: Grp3_1 Eb (1A),(ev)
+f6: Grp3_1 Eb (1A),(ev) | RDMSR Rq,Gq (F2),(11B),(ev) | WRMSRNS Gq,Rq (F3),(11B),(ev)
 f7: Grp3_2 Ev (1A),(es)
 f8: MOVDIR64B Gv,Mdqq (66),(ev) | ENQCMD Gv,Mdqq (F2),(ev) | ENQCMDS Gv,Mdqq (F3),(ev) | URDMSR Rq,Gq (F2),(11B),(ev) | UWRMSR Gq,Rq (F3),(11B),(ev)
 f9: MOVDIRI My,Gy (ev)
@@ -1103,6 +1103,7 @@ EndTable
 Table: VEX map 7
 Referrer:
 AVXcode: 7
+f6: RDMSR Rq,Id (F2),(v1),(11B) | WRMSRNS Id,Rq (F3),(v1),(11B)
 f8: URDMSR Rq,Id (F2),(v1),(11B) | UWRMSR Id,Rq (F3),(v1),(11B)
 EndTable
 
diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
index caedb3ef6688..e64f52321d6d 100644
--- a/tools/arch/x86/lib/x86-opcode-map.txt
+++ b/tools/arch/x86/lib/x86-opcode-map.txt
@@ -839,7 +839,7 @@ f1: MOVBE My,Gy | MOVBE Mw,Gw (66) | CRC32 Gd,Ey (F2) | CRC32 Gd,Ew (66&F2)
 f2: ANDN Gy,By,Ey (v)
 f3: Grp17 (1A)
 f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey (F2),(v) | WRUSSD/Q My,Gy (66)
-f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSSD/Q My,Gy
+f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v) | WRSSD/Q My,Gy | RDMSR Rq,Gq (F2),(11B) | WRMSRNS Gq,Rq (F3),(11B)
 f7: BEXTR Gy,Ey,By (v) | SHLX Gy,Ey,By (66),(v) | SARX Gy,Ey,By (F3),(v) | SHRX Gy,Ey,By (F2),(v)
 f8: MOVDIR64B Gv,Mdqq (66) | ENQCMD Gv,Mdqq (F2) | ENQCMDS Gv,Mdqq (F3) | URDMSR Rq,Gq (F2),(11B) | UWRMSR Gq,Rq (F3),(11B)
 f9: MOVDIRI My,Gy
@@ -1014,7 +1014,7 @@ f1: CRC32 Gy,Ey (es) | CRC32 Gy,Ey (66),(es) | INVVPID Gy,Mdq (F3),(ev)
 f2: INVPCID Gy,Mdq (F3),(ev)
 f4: TZCNT Gv,Ev (es) | TZCNT Gv,Ev (66),(es)
 f5: LZCNT Gv,Ev (es) | LZCNT Gv,Ev (66),(es)
-f6: Grp3_1 Eb (1A),(ev)
+f6: Grp3_1 Eb (1A),(ev) | RDMSR Rq,Gq (F2),(11B),(ev) | WRMSRNS Gq,Rq (F3),(11B),(ev)
 f7: Grp3_2 Ev (1A),(es)
 f8: MOVDIR64B Gv,Mdqq (66),(ev) | ENQCMD Gv,Mdqq (F2),(ev) | ENQCMDS Gv,Mdqq (F3),(ev) | URDMSR Rq,Gq (F2),(11B),(ev) | UWRMSR Gq,Rq (F3),(11B),(ev)
 f9: MOVDIRI My,Gy (ev)
@@ -1103,6 +1103,7 @@ EndTable
 Table: VEX map 7
 Referrer:
 AVXcode: 7
+f6: RDMSR Rq,Id (F2),(v1),(11B) | WRMSRNS Id,Rq (F3),(v1),(11B)
 f8: URDMSR Rq,Id (F2),(v1),(11B) | UWRMSR Id,Rq (F3),(v1),(11B)
 EndTable
 
-- 
2.49.0


