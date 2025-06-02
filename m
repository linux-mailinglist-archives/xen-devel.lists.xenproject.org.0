Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107CEACAF39
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003346.1382907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5Nn-00039X-6I; Mon, 02 Jun 2025 13:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003346.1382907; Mon, 02 Jun 2025 13:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5Nn-00037O-1y; Mon, 02 Jun 2025 13:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1003346;
 Mon, 02 Jun 2025 13:39:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xAfn=YR=tum.de=manuel.andreas@srs-se1.protection.inumbo.net>)
 id 1uM5Nj-00037I-Nv
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:39:18 +0000
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f93cb0e5-3fb6-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 15:39:14 +0200 (CEST)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
 by postout1.mail.lrz.de (Postfix) with ESMTP id 4b9w1G468hzySV
 for <xen-devel@lists.xenproject.org>; Mon,  2 Jun 2025 15:39:14 +0200 (CEST)
Received: from postout1.mail.lrz.de ([127.0.0.1])
 by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id ZlMNUrqWyXHe for <xen-devel@lists.xenproject.org>;
 Mon,  2 Jun 2025 15:39:13 +0200 (CEST)
Received: from [IPV6:2a02:2455:1858:e00:e0bb:e98d:8f46:dc66] (unknown
 [IPv6:2a02:2455:1858:e00:e0bb:e98d:8f46:dc66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4b9w1D6JC4zyVm
 for <xen-devel@lists.xenproject.org>; Mon,  2 Jun 2025 15:39:12 +0200 (CEST)
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
X-Inumbo-ID: f93cb0e5-3fb6-11f0-a300-13f23c93f187
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	in-reply-to:references:content-language:subject:subject:from
	:from:user-agent:mime-version:date:date:message-id:content-type
	:content-type:received:received; s=tu-postout21; t=1748871553;
	 bh=bfukpYZo80PMkfvoZk9FkrYpOY/fDD2jTTnWUQHlWZw=; b=PFohczUPpyQs
	7MhbiivoDShwyQUZZ86x2wIKgdlU6hWrTGtzjNtfb5Kbl3wdQX3HpxRz/caahJd9
	E1Sve6lQRsf7V8nDo8gqFqQfIy+ax3Pft09yxNIMfymM+qMLxd4NcEZBOOe6fury
	6atZRFmD7/uyfWKFckUhASbzKzMXV77ma1gixl32TVOQhn4keJ5bbLKIcN/zmpkq
	LMOJxkTsDznWueGn+WTQNDJeIi8EoJJcVUQO/inQeWJXy6bkjtn0A4uwlDHnuJeg
	jS2Tcp0mKpHVGioZzOcS/mIc4z5m+hEpqwAQoyVz+zprITWHKF6QucdlR++HPMR2
	ov5s1iz4nA==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.866
X-Spam-Level:
X-Spam-Status: No, score=-2.866 tagged_above=-999 required=5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
 DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001, HTML_MESSAGE=0.001,
 LRZ_BND_ANU8=0.001, LRZ_BND_M12_AN24=0.001, LRZ_DMARC_FAIL=0.001,
 LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
 LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
 LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
 LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001, LRZ_FROM_HAS_A=0.001,
 LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
 LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
 LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
 LRZ_FROM_TUM_S=0.001, LRZ_HAS_BND=0.001, LRZ_HAS_CLANG=0.001,
 LRZ_HAS_CT=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_MIME_VERSION=0.001,
 LRZ_HAS_SPF=0.001, LRZ_MIME_BND_SPAM_184=0.001,
 LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_TO_SHORT=0.001,
 LRZ_UA_MOZ=0.001] autolearn=no autolearn_force=no
Content-Type: multipart/mixed; boundary="------------7k0v5mQ5ROhNHfbSS6tpHkwi"
Message-ID: <6d28eb0c-caed-4c58-a6ac-cbf8da357d22@tum.de>
Date: Mon, 2 Jun 2025 15:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Manuel Andreas <manuel.andreas@tum.de>
Subject: Nullptr dereference in nested VMX when shadow VMCS support is
 available
Content-Language: en-US
References: <5f258e25-a4ed-4f9a-8ca6-9ea3400e2369@tum.de>
To: xen-devel@lists.xenproject.org
Autocrypt: addr=manuel.andreas@tum.de; keydata=
 xjMEY9Zx/RYJKwYBBAHaRw8BAQdALWzRzW9a74DX4l6i8VzXGvv72Vz0qfvj9s7bjBD905nN
 Jk1hbnVlbCBBbmRyZWFzIDxtYW51ZWwuYW5kcmVhc0B0dW0uZGU+wokEExYIADEWIQQuSfNX
 11QV6exAUmOqZGwY4LuingUCY9Zx/QIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEKpkbBjgu6Ke
 McQBAPyP530S365I50I5rM2XjH5Hr9YcUQATD5dusZJMDgejAP9T/wUurwQSuRfm1rK8cNcf
 w4wP3+PLvL+J+kuVku93CM44BGPWcf0SCisGAQQBl1UBBQEBB0AmCAf31tLBD5tvtdZ0XX1B
 yGLUAxhgmFskGyPhY8wOKQMBCAfCeAQYFggAIBYhBC5J81fXVBXp7EBSY6pkbBjgu6KeBQJj
 1nH9AhsMAAoJEKpkbBjgu6Kej6YA/RvJdXMjsD5csifolLw53KX0/ElM22SvaGym1+KiiVND
 AQDy+y+bCXI+J713/AwLBsDxTEXmP7Cp49ZqbAu83NnpBQ==
In-Reply-To: <5f258e25-a4ed-4f9a-8ca6-9ea3400e2369@tum.de>

This is a multi-part message in MIME format.
--------------7k0v5mQ5ROhNHfbSS6tpHkwi
Content-Type: multipart/alternative;
 boundary="------------5mUg0o6IZ2M7iPMMkaAxDZ0X"

--------------5mUg0o6IZ2M7iPMMkaAxDZ0X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear all,

I've discovered an issue in the nested VMX implementation, where an 
unprivileged domain is able to force Xen to dereference a NULL pointer, 
resulting in a panic.

This is possible when:

 1. The malicious domain has nested HVM capabilities.
 2. The CPU is running on top of VMX and supports shadow VMCS.

To trigger the bug, the domain must first enable VMX operation for 
itself, execute VMXON and then finally execute VMPTRLD on a guest 
physical address that is backed by a non-writable p2m mapping.
In `nvmx_handle_vmptrld`, after attempting to map the nested VMCS, Xen 
will check whether or not this mapping is suitable for writing and if 
not immediately unmap the nested VMCS again and abort the setup of 
`nvcpu->nv_vvmcx`. However, Xen at this point erroneously continues 
emulation of the VMPTRLD. In particular, if VMCS shadowing is available, 
Xen will nonetheless attempt to link up the nested VMCS to its own VMCS 
in `nvmx_set_vmcs_pointer`. Importantly, Xen here attempts to 
dereference the presumably mapped nested VMCS (which now is merely a 
NULL pointer) in order to mark it as a shadow VMCS by applying the 
`VMCS_RID_TYPE_MASK` to its revision identifier. Following, the page 
fault handler will panic Xen.

I've attached an XTF reproducer that triggers the bug. To setup such a 
non-writable p2m mapping for the malicious VMCS, I first setup an 
appropriate grant table entry. I've tested it on Xen version 4.20.0.

To fix the issue I believe the following patch should be suitable:

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1817,7 +1817,9 @@ static int nvmx_handle_vmptrld(struct 
cpu_user_regs *regs)
              else
              {
                  hvm_unmap_guest_frame(vvmcx, 1);
-                vvmcx = NULL;
+                vmfail(regs, VMX_INSN_VMPTRLD_INVALID_PHYADDR);
+
+                return X86EMUL_OKAY;
              }
          }
          else

The VMX error AFAICT does not strictly adhere to the Intel SDM, but 
providing the guest some indication on what went wrong is likely more 
sensible than silently failing.

Best,
Manuel

--------------5mUg0o6IZ2M7iPMMkaAxDZ0X
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear all,<br>
      <br>
      I've discovered an issue in the nested VMX implementation, where
      an unprivileged domain is able to force Xen to dereference a NULL
      pointer, resulting in a panic.</p>
    <p>This is possible when:</p>
    <ol>
      <li>The malicious domain has nested HVM capabilities.</li>
      <li>The CPU is running on top of VMX and supports shadow VMCS.</li>
    </ol>
    <p>To trigger the bug, the domain must first enable VMX operation
      for itself, execute VMXON and then finally execute VMPTRLD on a
      guest physical address that is backed by a non-writable p2m
      mapping.<br>
      In `nvmx_handle_vmptrld`, after attempting to map the nested VMCS,
      Xen will check whether or not this mapping is suitable for writing
      and if not immediately unmap the nested VMCS again and abort the
      setup of `nvcpu-&gt;nv_vvmcx`. However, Xen at this point
      erroneously continues emulation of the VMPTRLD. In particular, if
      VMCS shadowing is available, Xen will nonetheless attempt to link
      up the nested VMCS to its own VMCS in `nvmx_set_vmcs_pointer`.
      Importantly, Xen here attempts to dereference the presumably
      mapped nested VMCS (which now is merely a NULL pointer) in order
      to mark it as a shadow VMCS by applying the `VMCS_RID_TYPE_MASK`
      to its revision identifier. Following, the page fault handler will
      panic Xen.</p>
    <p>I've attached an XTF reproducer that triggers the bug. To setup
      such a non-writable p2m mapping for the malicious VMCS, I first
      setup an appropriate grant table entry. I've tested it on Xen
      version 4.20.0.</p>
    <p>To fix the issue I believe the following patch should be
      suitable:<br>
      <br>
      --- a/xen/arch/x86/hvm/vmx/vvmx.c<br>
      +++ b/xen/arch/x86/hvm/vmx/vvmx.c<br>
      @@ -1817,7 +1817,9 @@ static int nvmx_handle_vmptrld(struct
      cpu_user_regs *regs)<br>
                   else<br>
                   {<br>
                       hvm_unmap_guest_frame(vvmcx, 1);<br>
      -                vvmcx = NULL;<br>
      +                vmfail(regs, VMX_INSN_VMPTRLD_INVALID_PHYADDR);<br>
      +<br>
      +                return X86EMUL_OKAY;<br>
                   }<br>
               }<br>
               else</p>
    <p>The VMX error AFAICT does not strictly adhere to the Intel SDM,
      but providing the guest some indication on what went wrong is
      likely more sensible than silently failing.<br>
      <br>
      Best,<br>
      Manuel</p>
  </body>
</html>

--------------5mUg0o6IZ2M7iPMMkaAxDZ0X--
--------------7k0v5mQ5ROhNHfbSS6tpHkwi
Content-Type: application/gzip;
 name="poc-nested-vmx-shadow-vmcs-vmptrld-nullderef.tar.gz"
Content-Disposition: attachment;
 filename="poc-nested-vmx-shadow-vmcs-vmptrld-nullderef.tar.gz"
Content-Transfer-Encoding: base64

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

--------------7k0v5mQ5ROhNHfbSS6tpHkwi--

