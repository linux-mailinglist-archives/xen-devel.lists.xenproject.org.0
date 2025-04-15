Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BEA8AC7A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 02:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954660.1348713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4qKY-0005TP-Jy; Wed, 16 Apr 2025 00:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954660.1348713; Wed, 16 Apr 2025 00:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4qKY-0005Rw-HK; Wed, 16 Apr 2025 00:08:42 +0000
Received: by outflank-mailman (input) for mailman id 954660;
 Tue, 15 Apr 2025 21:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6zj=XB=tum.de=manuel.andreas@srs-se1.protection.inumbo.net>)
 id 1u4oCW-0000LC-RL
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 21:52:19 +0000
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e324bace-1a43-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 23:52:13 +0200 (CEST)
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4ZcdDD2ymnzyWC
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 23:52:12 +0200 (CEST)
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id Cwlj-3_X8RcF for <xen-devel@lists.xenproject.org>;
 Tue, 15 Apr 2025 23:52:11 +0200 (CEST)
Received: from [192.168.0.140] (unknown [46.128.11.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4ZcdDC1cJnzyW9
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 23:52:11 +0200 (CEST)
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
X-Inumbo-ID: e324bace-1a43-11f0-9eae-5ba50f476ded
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	subject:subject:from:from:content-language:user-agent
	:mime-version:date:date:message-id:content-type:content-type
	:received:received; s=tu-postout21; t=1744753931; bh=zQeDeQ0W1y6
	wYnTX8FySKIhUdQH5ebIhmhLL6OmhJbc=; b=kXdmglTuGtQC0ujNlD+H410WduV
	xE0aeLVuUG6oUPJa7kYUfaVZDa5pp0kQnseDQTDAbd6U+FAfL/U4RLjQfBhd9QLZ
	o+zjur5zgQYKpip3DmsZ8OGEpl+oe4C96qRXY/ei7SXVHD1g+w4tD0JPv2UaHGGy
	8vM/wLIKerOoVFHKazA8DD8bUitSPPKOOvCM4b3sFhJ3wm+oQhIn3toBESs1Ceng
	pxL16Zc5ivxOfHBVsJWflH+jXFbZJe0a7CjWmwKvRByXrdGN/untMVD8+uDm7R3F
	4bLV9UmFhRZPnfpqZoXX2xe/5nCgVPLfFyRg6vTKUw0VYCrAPYunxxjWlOw==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.869
X-Spam-Level:
X-Spam-Status: No, score=-2.869 tagged_above=-999 required=5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
 DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001, LRZ_BND_M12_AN24=0.001,
 LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
 LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
 LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_MATCH=0.001,
 LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001,
 LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
 LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
 LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
 LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001, LRZ_HAS_BND=0.001,
 LRZ_HAS_CLANG=0.001, LRZ_HAS_CT=0.001, LRZ_HAS_MIME_VERSION=0.001,
 LRZ_HAS_SPF=0.001, LRZ_MIME_BND_SPAM_184=0.001,
 LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_TO_SHORT=0.001,
 LRZ_UA_MOZ=0.001] autolearn=no autolearn_force=no
Content-Type: multipart/mixed; boundary="------------YdYylOs7HoDWEUUYS4zhUrGa"
Message-ID: <e7347061-6dc6-44a3-ad41-270e705db2c5@tum.de>
Date: Tue, 15 Apr 2025 23:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
From: Manuel Andreas <manuel.andreas@tum.de>
Subject: Assert in x86_emulate_wrapper triggerable by HVM domain
Autocrypt: addr=manuel.andreas@tum.de; keydata=
 xjMEY9Zx/RYJKwYBBAHaRw8BAQdALWzRzW9a74DX4l6i8VzXGvv72Vz0qfvj9s7bjBD905nN
 Jk1hbnVlbCBBbmRyZWFzIDxtYW51ZWwuYW5kcmVhc0B0dW0uZGU+wokEExYIADEWIQQuSfNX
 11QV6exAUmOqZGwY4LuingUCY9Zx/QIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEKpkbBjgu6Ke
 McQBAPyP530S365I50I5rM2XjH5Hr9YcUQATD5dusZJMDgejAP9T/wUurwQSuRfm1rK8cNcf
 w4wP3+PLvL+J+kuVku93CM44BGPWcf0SCisGAQQBl1UBBQEBB0AmCAf31tLBD5tvtdZ0XX1B
 yGLUAxhgmFskGyPhY8wOKQMBCAfCeAQYFggAIBYhBC5J81fXVBXp7EBSY6pkbBjgu6KeBQJj
 1nH9AhsMAAoJEKpkbBjgu6Kej6YA/RvJdXMjsD5csifolLw53KX0/ElM22SvaGym1+KiiVND
 AQDy+y+bCXI+J713/AwLBsDxTEXmP7Cp49ZqbAu83NnpBQ==

This is a multi-part message in MIME format.
--------------YdYylOs7HoDWEUUYS4zhUrGa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear all,

my fuzzing infrastructure discovered that an assert in 
x86_emulate_wrapper is able to be triggered by an HVM domain executing a 
specially crafted repeating movs instruction.

Specifically, if the emulation of the rep movs instruction triggers an 
exception (e.g. by accessing invalid memory after some amount of 
iterations), the emulation will be halted at that point.
However, the instruction manual requires that _some_ register state 
(namely the updated value of rcx) shall be commited, whereas the 
instruction pointer needs to be rolled back to point to the address of 
the instruction itself. The assert checks for the latter. Problematic is 
the fact that for these type of repeating instructions, Xen seems to 
eventually just commit all register state when it encounters an exception:

    557  #define put_rep_prefix(reps_completed) 
({                               \
    558      if ( rep_prefix() 
)                                                 \
    559 { \
    560          __put_rep_prefix(&_regs, ctxt->regs, ad_bytes, 
reps_completed); \
    561          if ( unlikely(rc == X86EMUL_EXCEPTION) 
)                        \
    562              goto 
complete_insn;                                         \
    563 } \
    564  })

   8356   complete_insn: /* Commit shadow register state. */
   8357      put_fpu(fpu_type, false, state, ctxt, ops);
   8358      fpu_type = X86EMUL_FPU_none;
   8359
   8360      /* Zero the upper 32 bits of %rip if not in 64-bit mode. */
   8361      if ( !mode_64bit() )
   8362          _regs.r(ip) = (uint32_t)_regs.r(ip);
   8363
   8364      /* Should a singlestep #DB be raised? */
   8365      if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
   8366      {
   8367          ctxt->retire.singlestep = true;
   8368          ctxt->retire.sti = false;
   8369      }
   8370
   8371      if ( rc != X86EMUL_DONE )
   8372          *ctxt->regs = _regs; // <- Incorrect RIP is commited

I've attached an XTF test that should trigger the aforementioned assert 
on the latest release commit: 3ad5d648cda5add395f49fc3704b2552aae734f7

Best,
Manuel

--------------YdYylOs7HoDWEUUYS4zhUrGa
Content-Type: application/gzip; name="poc-x86emul-assert-orig-ip.tar.gz"
Content-Disposition: attachment; filename="poc-x86emul-assert-orig-ip.tar.gz"
Content-Transfer-Encoding: base64

H4sIAAAAAAAAA+2WXU/bMBSGe+1f4WVUallDkzZJURnTGFS74UOiZdLEEEpttzUkdha7pWja
f5/ttBobtN1EBUL4ufHXax/Hx+fEGUfudDsi6ThxYyFILl2e06FLs3ppXXiKVhjq0m+F3t1y
TskPwlYz8luNICp5fqjGSzBc2w6WMBYyziEsCXk7FUt0q8ZfKNli/6cxZVtoDTa0g6MgWOR/
P1TO9oNWFDXDVqOh/R811ZWA3hpsr+SV+7++uQngJvw4oAmBkggp6iuvhJmQk4HRu4vlSmek
WTwkq7Rw9TKSYw4POBJwwPN/tS3I/3xWHbylDCVjTOD7qRxsjT4AgDgTEqJRXNi8lFQm5PwC
7kKnp9pLNu7sADDhFBfztJGKblbBDwAVWU6ZvK44XXUBJWVDOM5gsQDUC1yqQ9ET33xjTlWt
pKfEIoUTnsRSe6sCTZ/GSfkEbnhTv1GD5XKOpjvOvbFtbzDDaDB9QEOw3yfY84xC/KEQEt9t
5iSDapL4rpRYtCtGX62Vy6RoYFq9I28/VIMOQk5N2SYpz291TW3cFJiaQtBihfnXzw/sjOUk
Vg7pq0O4oXIECdN1DDHpj4ezMxTFsel5ypOXYowQEaJyfHZ4qLp/AlA3F+SQoziBkzinegnR
1n0px6QN93UVuTowXBX8iepyPnUPnKK7HwuKXD4YCCLbMNCdMu67NxTL0axNGSZMuqpbuMWS
jCZ6oMNw21y25w7+0tL8T9mAb10Jzh5rw+R/z1v4/2/4zb/yf8vzGzb/PwVFKnJYnBJHXfAl
yaxWKFEsyVDHq1KLjCAaJ/MhwiY05yxVt16o4fPf2WI0SaOgCOaLmdiEnKQquWrphYrI5z6K
V8mS+D+Kr4nOfo+2seL95zWCe++/KPBt/D8F8+fORuX05KRXrffHNMF1xNOUs630GoDjvaPO
7Ie9u+yRtr/X63w+Of1qdLPEAHqdbs/tHH/p6k6TBADg/Ss3I7lKFvDdLjRPLw7Aw/sYErOJ
5z4ki8VisVgsFovFYrFYLBaLxWKxWCyWF8QvKyILuQAoAAA=

--------------YdYylOs7HoDWEUUYS4zhUrGa--

