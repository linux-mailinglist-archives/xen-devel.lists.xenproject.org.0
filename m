Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9E581663
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375442.607828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMUW-0003es-6S; Tue, 26 Jul 2022 15:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375442.607828; Tue, 26 Jul 2022 15:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMUW-0003bO-3K; Tue, 26 Jul 2022 15:29:00 +0000
Received: by outflank-mailman (input) for mailman id 375442;
 Tue, 26 Jul 2022 15:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xzkj=X7=citrix.com=prvs=199529adf=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oGMUU-0003bI-6K
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:28:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8a26139-0cf7-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 17:28:56 +0200 (CEST)
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
X-Inumbo-ID: a8a26139-0cf7-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658849336;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=78DeRPXEX5Sq1wiXho6iKCVockOf/BEkWuFpqU82/Bk=;
  b=H6YE5uwaqnddfSZ7VRyvMPh3xTixL9aJi84HBx38cqheE1JneUHh3/6Q
   P7wdQGjxQhBYuTyOuiHd5C2DSZkC8wSTFx7z8NlLI/mYlGTLZEycwIRLR
   hMaZo9YfvFRRs0jS2VxC2BOzjYuF5ecyqz9atgqsVWvyRfTWFaDEC/JH+
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79229926
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jFBzxKr9w2S3WdSi4vLPy9qSbDheBmIFZRIvgKrLsJaIsI4StFCzt
 garIBmDaf+LMDH1fth3a9yz8EpUvZbVy4BnGgY4rns9QXwQpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q52lF5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUop+VKBzF2y
 cUoIQEkRAqigKWQ8KOCH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8aBIw/mqG0gWP4cBVTqU6PpLpx6G/WpOB0+Oe8aoCEK4bULSlTtkCVo
 yHE9Wj5OxAXEeSH7x6F7nClt/CayEsXX6pNTeblp5aGmma7xGYeFRkXXluTuuSihwi1XNc3A
 1MQ0jojq+417kPDZtrwQRy+5mKFtxg0WtxMHul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8PGSpDC7OykQJEcDYzMJSU0O5NyLnW0opkuRFJA5Svfz14CrX2Grq
 9yXkMQgr4VOjvMNh52HxGDOshuGvLnOCSgF9zyCCwpJ8ThFiJ6Zi52AsAaGvaYYdNzCFzFtr
 1BfxZHAsblm4YWl0XXUHb5TROzBC+OtamW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgUxfOdvZ5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/xvZ
 sjHKJb8UitEYUiC8NZRb75GuYLHOwhknT+DLXwF50/PPUWiiI69Fu5ebQrmghER56KYugTFm
 +ti2z+x40wGCIXWP3iImbP/2HhQchDX87iq9JEMHgNCSyI6cFwc5wj5mut7JdY6zvkEyY8lP
 BiVAydl9bY2vlWfQS3iV5ypQOm3NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:fxoSqKMUMPRQwsBcTs+jsMiBIKoaSvp037Eqv3oRdfUzSL3/qy
 nOpoV96faaskdzZJhNo7+90cq7MBfhHPxOkOss1N6ZNWGM0gbFEGgL1/qa/9SKIU3DH4Bmu5
 uIC5IObeHNMQ==
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="79229926"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2] x86/msr: fix X2APIC_LAST
Date: Tue, 26 Jul 2022 16:28:19 +0100
Message-ID: <f22ea4c14d8be5672c036076ecd5818c6ca1d06a.1658849010.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The latest Intel manual now says the X2APIC reserved range is only
0x800 to 0x8ff (NOT 0xbff).
This changed between SDM 68 (Nov 2018) and SDM 69 (Jan 2019).
The AMD manual documents 0x800-0x8ff too.

There are non-X2APIC MSRs in the 0x900-0xbff range now:
e.g. 0x981 is IA32_TME_CAPABILITY, an architectural MSR.

The new MSR in this range appears to have been introduced in Icelake,
so this commit should be backported to Xen versions supporting Icelake.

Backport: 4.13+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---

Notes:
    Changed since v1:
    * include version of Intel SDM where the change occured
    * remove opencoded MSR_X2APIC_FIRST + 0xff

 xen/arch/x86/hvm/vmx/vmx.c           | 4 ++--
 xen/arch/x86/include/asm/msr-index.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 47554cc004..17e103188a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3397,7 +3397,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
             if ( cpu_has_vmx_apic_reg_virt )
             {
                 for ( msr = MSR_X2APIC_FIRST;
-                      msr <= MSR_X2APIC_FIRST + 0xff; msr++ )
+                      msr <= MSR_X2APIC_LAST; msr++ )
                     vmx_clear_msr_intercept(v, msr, VMX_MSR_R);
 
                 vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
@@ -3418,7 +3418,7 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
     if ( !(v->arch.hvm.vmx.secondary_exec_control &
            SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE) )
         for ( msr = MSR_X2APIC_FIRST;
-              msr <= MSR_X2APIC_FIRST + 0xff; msr++ )
+              msr <= MSR_X2APIC_LAST; msr++ )
             vmx_set_msr_intercept(v, msr, VMX_MSR_RW);
 
     vmx_update_secondary_exec_control(v);
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 8cab8736d8..1a928ea6af 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -148,7 +148,7 @@
 #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
 
 #define MSR_X2APIC_FIRST                    0x00000800
-#define MSR_X2APIC_LAST                     0x00000bff
+#define MSR_X2APIC_LAST                     0x000008ff
 
 #define MSR_X2APIC_TPR                      0x00000808
 #define MSR_X2APIC_PPR                      0x0000080a
-- 
2.34.1


