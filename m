Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B3445EE7F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232751.403652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauO-0004em-Ov; Fri, 26 Nov 2021 13:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232751.403652; Fri, 26 Nov 2021 13:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauO-0004bI-K8; Fri, 26 Nov 2021 13:04:56 +0000
Received: by outflank-mailman (input) for mailman id 232751;
 Fri, 26 Nov 2021 13:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauM-0002zD-R0
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70e59a61-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:04:52 +0100 (CET)
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
X-Inumbo-ID: 70e59a61-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XPX2j3prxpqJwVaGqHu3muka5HpBzV+XeYCvn/fY7+U=;
  b=MKKqaR2DkJsBO02uBKIKM9xiOiWkNZYDTM/aitIIFZCDJGm+K00Ww6Ka
   YBV4iuomJF7zGpWB54JXuzc/FGi/H5LsOooVZVoPbvQ5BlMxoa5W4L+zp
   CISN2Lx55/xLyxu73DvEu6pVo+bmncIdyI8k/huwItwsy/zb46xd+Gnlw
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wZFVAOxcftvc5QFYyOSXyb9NyytxVzW/hd4h7fIAHTqenuWGoIRzVMVc9deLRWeD2n02VWNzp+
 /UYVXi7f5I/VXTGxkK5hUIWzUlZ3ysE6smbVUT5gYeOcv+WPXWoAs5/88Dii0MaPTCNtRv6OTv
 VrKB9XLJHn4KBHIU8O2jsCr6zxsvtLO01hwkr9DO5V91N0LZCN3SKs2LKphjkws5m7uaq0LlOO
 V8GNI4rsDO79iMPITcCv32vnPDU3iTflh5bhaElHriI4ujqRzjvfLV/c0ZcFzDQoPY63VFQrgK
 OaPp/Wsn79M4qPmyyGYBHWcJ
X-SBRS: 5.1
X-MesageID: 58193732
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kS2pRK4Gzt998JaZaD0suwxRtPTAchMFZxGqfqrLsTDasY5as4F+v
 mscCj2OaPmOMDb8KtEgaYvj9hsA65XXyoNiQFFrqilgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 Il0vJ+3Uh0TIbDBvMM/dyNHPDF9BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTa+PP
 JVCM1KDajycOkFMAEc2Ea47wtmSnHShXR9euG+88P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9oMKuQ57xqX8LXJ7iK+JEw+URFRa+Vz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CNf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxg5bJtbKGO3P
 BS7VeZtCHl7ZyDCgUhfOd/ZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6epxE2C8t6gKxOrO4
 F+nXUpUlAj2iXHdcF3YYXF/crL/G514qCtjbyArOF+p3VklYJqus/hDJ8dmI+F/+bwx1+NwQ
 tkEZ96EXqZFRAPY9mlPdpL6toFjKkim3FrcIyq/bTEjVJd8XAiVqMT8dw7i+XBWXCq6vMczu
 ZO60QbfTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRian2mUz
 QebBxsctNLhmY5t/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkVsW4YpxF7FnkfA369f1/uIIyw1lGDPAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoQAwLOQ4oTuWfzvVFyDDd4MM8LFj++CIqrqGMVl9fPkXUhSFQRFev3FjJH
 Qv1VBYq1jGC
IronPort-HdrOrdr: A9a23:/ZuFN6yCd0lGqTM+6gUFKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58193732"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 53/65] x86/misc: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:34 +0000
Message-ID: <20211126123446.32324-54-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/extable.c | 4 ++--
 xen/common/efi/boot.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index b6664264de31..4aa1ab4b2a45 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -23,7 +23,7 @@ static inline unsigned long ex_cont(const struct exception_table_entry *x)
 	return EX_FIELD(x, cont);
 }
 
-static int init_or_livepatch cmp_ex(const void *a, const void *b)
+static int init_or_livepatch cf_check cmp_ex(const void *a, const void *b)
 {
 	const struct exception_table_entry *l = a, *r = b;
 	unsigned long lip = ex_addr(l);
@@ -37,7 +37,7 @@ static int init_or_livepatch cmp_ex(const void *a, const void *b)
 	return 0;
 }
 
-static void init_or_livepatch swap_ex(void *a, void *b, size_t size)
+static void init_or_livepatch cf_check swap_ex(void *a, void *b, size_t size)
 {
 	struct exception_table_entry *l = a, *r = b, tmp;
 	long delta = b - a;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 56f44f86c2c4..f5af71837d5a 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1504,7 +1504,7 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
     unmap_domain_page(l3dst);
 }
 
-static bool __init ram_range_valid(unsigned long smfn, unsigned long emfn)
+static bool __init cf_check ram_range_valid(unsigned long smfn, unsigned long emfn)
 {
     unsigned long sz = pfn_to_pdx(emfn - 1) / PDX_GROUP_COUNT + 1;
 
@@ -1513,7 +1513,7 @@ static bool __init ram_range_valid(unsigned long smfn, unsigned long emfn)
                          pfn_to_pdx(smfn) / PDX_GROUP_COUNT) < sz;
 }
 
-static bool __init rt_range_valid(unsigned long smfn, unsigned long emfn)
+static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emfn)
 {
     return true;
 }
-- 
2.11.0


