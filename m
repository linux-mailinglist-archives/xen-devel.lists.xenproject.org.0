Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9847AB4AFA
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 07:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982484.1368851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEiCW-0003qq-F5; Tue, 13 May 2025 05:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982484.1368851; Tue, 13 May 2025 05:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEiCW-0003na-CN; Tue, 13 May 2025 05:29:12 +0000
Received: by outflank-mailman (input) for mailman id 982484;
 Tue, 13 May 2025 05:29:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ws9y=X5=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uEiCU-0003NS-9W
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 05:29:10 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32272b4c-2fbb-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 07:29:09 +0200 (CEST)
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
X-Inumbo-ID: 32272b4c-2fbb-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747114148; x=1747373348;
	bh=YCgDTDVez6ZCTCaxfiAeOB8ToA5/qjmuvhZmiUgLns0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OywzkEZuk18Dnc7U00ZyCoodlYOlJFco2JisxlPAOK+rkHNwr9GmzpybwVBsmnwlc
	 PuDJq5/UWBu7CVjmcnwVeNsqpwfiFPDPWZ1GRGGYFvtUhgC7e65Yd93fVqyNe/0YQ+
	 0lY/nbzGs1NYzc2+a+Z9kQJ1qyDBc/2DOtuEKSX/mdK8oWpn5wc43bcCL4IIGbkLpz
	 hWguR3w2TqD3d8W6x/zfRqYQrsRFwCOUy4DHxFNGpjpXwSRMtVV5BagzlpQ8CQqR3g
	 BnJvuIADVthA01Ux1NfIB4v9DkUu6k8HQCn7h7C+xMCGae/hDrb7t9/VJX645PC9j0
	 fimj1TC5j/unA==
Date: Tue, 13 May 2025 05:28:58 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, nicola.vetrini@bugseng.com, consulting@bugseng.com, dmukhin@ford.com
Subject: [PATCH v5 2/2] x86/vmx: remove __vmread()
Message-ID: <20250513052809.3947164-3-dmukhin@ford.com>
In-Reply-To: <20250513052809.3947164-1-dmukhin@ford.com>
References: <20250513052809.3947164-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b585abc602fc0331c47ad42783e806eacff08c0f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Remove __vmread() and adjust ECLAIR configuration to account for the change=
.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 docs/misra/function-macro-properties.json | 9 ---------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h    | 5 -----
 2 files changed, 14 deletions(-)

diff --git a/docs/misra/function-macro-properties.json b/docs/misra/functio=
n-macro-properties.json
index 74058297b5..59ba63626e 100644
--- a/docs/misra/function-macro-properties.json
+++ b/docs/misra/function-macro-properties.json
@@ -152,15 +152,6 @@
             "taken": ""
          }
       },
-      {
-         "type": "function",
-         "value": "^__vmread.*$",
-         "properties":{
-            "pointee_write": "2=3Dalways",
-            "pointee_read": "2=3Dnever",
-            "taken": ""
-         }
-      },
       {
          "type": "function",
          "value": "^hvm_pci_decode_addr.*$",
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/=
asm/hvm/vmx/vmx.h
index d85b52b9d5..299e2eff6b 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -336,11 +336,6 @@ static always_inline unsigned long vmread(unsigned lon=
g field)
     return value;
 }
=20
-static always_inline void __vmread(unsigned long field, unsigned long *val=
ue)
-{
-    *value =3D vmread(field);
-}
-
 static always_inline void __vmwrite(unsigned long field, unsigned long val=
ue)
 {
     asm goto ( "vmwrite %[value], %[field]\n\t"
--=20
2.34.1



