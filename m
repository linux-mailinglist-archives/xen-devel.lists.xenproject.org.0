Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC5249EB1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 14:51:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8NXq-0006LV-Ma; Wed, 19 Aug 2020 12:50:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP9Y=B5=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1k8NXp-0006LQ-7i
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 12:50:21 +0000
X-Inumbo-ID: 77c993d6-ef1d-425c-b0a6-934e4a0f5ab0
Received: from mail-qt1-x832.google.com (unknown [2607:f8b0:4864:20::832])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77c993d6-ef1d-425c-b0a6-934e4a0f5ab0;
 Wed, 19 Aug 2020 12:50:20 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id x12so17635470qtp.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2020 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=GGpNAGfCjoyNsgS0Vr8uTSWYtYBr6bxlh++rQSBnr5U=;
 b=iOQfKW2oS9bLVNxVm7zpL5SGxbEeJpJdWMx8J6Jv2nafk2YOdgOTI97UU1uYNeiXju
 ++77NOpvBCktTgUdgdURXCVVrTs2s4n85QOPKqrwZwi9OQ0x/ULW4y2+kJ77jebQEphw
 OU4NMy8aiA9nYo0QHFwzOWtJw9u50ih0RL5RDKfV74vXHvgXWn4oiF0VmOqtINpQrLkY
 ulyDvOivxxnfM6u3i39Y5Bz5LDmObV4ImmWQP7k8eRSMBMsu4HUA44VDcc+aqpa1t9WX
 3ZJxfhTlglZ/TKIWgn3j5RYje3i1DMmfvNaxz3J1OEWqNpLRtuwtOIuPoOtxKU0IoQR/
 RyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=GGpNAGfCjoyNsgS0Vr8uTSWYtYBr6bxlh++rQSBnr5U=;
 b=iLvy8Tf0G9HuLBssxVcaEzThcxWoeejGFXAQBsIbeQHVgMlCjplJIkM+VzYeKIm7Ls
 bchI31eUiNRZGUgg5+I7QVGenoW49/V2eqFOSj06l2uu0SL/+JImXrWYWYEMfezviicl
 hBtlwjg6FIMfxwdF8VY5Oe5kDvQ29oDyiPio5CrsVHUQJ8mI7za+7ano7KEby+M/BvGJ
 Bmyw95k8ovOJeF+8CJg32fv8dbX+8fZxjP9KOpXHETF99CcfVUWqqnYyvkDOOXf58QWA
 IUYy63i5xJhv3daqcLuzS0j3gsunVZyHg9+e+PVQVF8vUc3yL0JUZErmxHwtvNzpr2Fx
 2hAA==
X-Gm-Message-State: AOAM533LH8ObSzCQC9g553M2ABlTCaD0v2dQXidwBuJR/1WZJkXTkQqU
 BqmQvDagrCKoxTWNYh6ctzF4OU91JTWUHA==
X-Google-Smtp-Source: ABdhPJzBkbJWltxRVrh4+zlE5yIglyp/pu1OkAWCad8ZbFgL1BkRSt70hYKU9pZ/lgqV8oWKMxg91g==
X-Received: by 2002:ac8:5254:: with SMTP id y20mr22186806qtn.170.1597841419577; 
 Wed, 19 Aug 2020 05:50:19 -0700 (PDT)
Received: from [10.87.11.139] (pool-96-230-225-98.bstnma.fios.verizon.net.
 [96.230.225.98])
 by smtp.gmail.com with ESMTPSA id f92sm27987475qtd.9.2020.08.19.05.50.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 05:50:19 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Assertion,'hvmemul_cache_disabled(curr)' failed at vmx.c:4380
Message-ID: <81ab744a-c7af-ce4a-2cef-15fb8c2547e5@Gmail.com>
Date: Wed, 19 Aug 2020 08:50:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------1971497514C9916A273198D0"
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------1971497514C9916A273198D0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Currently I only know how to get this assert with debug=y and hvm_fep 
enabled.  The attached test code should reproduce this. This happens 
when any guest does the "ud2 xen" inl that uses QEMU.  Port 0x3f1 is 
what I use to reproduce this.

My understanding is that it is possible to get to the x86 instruction 
emulator for "inl" instruction without hvm_fep enabled. Here is more info:

(XEN) [2020-08-18 12:33:45.880] Assertion 'hvmemul_cache_disabled(curr)' 
failed at vmx.c:4380
(XEN) [2020-08-18 12:33:45.905] ----[ Xen-4.15-unstable  x86_64 
debug=y   Tainted:  C H ]----
(XEN) [2020-08-18 12:33:45.930] CPU:    3
(XEN) [2020-08-18 12:33:45.941] RIP: 
e008:[<ffff82d04029d565>]vmx_vmenter_helper+0x3d/0x45d
(XEN) [2020-08-18 12:33:45.966] RFLAGS: 0000000000010097 CONTEXT: 
hypervisor (d1v0)
...

I did track this to:

commit 2efbc2d446b1315de9c6441a4d535b1fb91e1767
Author:     Jan Beulich <jbeulich@suse.com>
AuthorDate: Thu Apr 23 09:55:00 2020 +0200
Commit:     Jan Beulich <jbeulich@suse.com>
CommitDate: Thu Apr 23 09:55:00 2020 +0200

     x86/HVM: implement memory read caching for insn emulation
...
     Signed-off-by: Jan Beulich <jbeulich@suse.com>
     Reviewed-by: Paul Durrant <pdurrant@amzn.com>
...

    -Don Slutz


--------------1971497514C9916A273198D0
Content-Type: text/plain; charset=UTF-8;
 name="hvm_fep_inl_test.c"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="hvm_fep_inl_test.c"

LyogaHZtX2ZlcF9pbmxfdGVzdCAkUmV2aXNpb246IDEuMTMgJAogKgogKiBnY2MgLWcgLVdh
bGwgLW02NCAtTzYgLW8gaHZtX2ZlcF9pbmxfdGVzdDY0IGh2bV9mZXBfaW5sX3Rlc3QuYwog
KgogKi8KCiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRl
IDxzdHJpbmcuaD4KI2luY2x1ZGUgPGxpbWl0cy5oPgojaW5jbHVkZSA8c2lnbmFsLmg+CiNp
bmNsdWRlIDxlcnJuby5oPgojaW5jbHVkZSA8dGltZS5oPgojaW5jbHVkZSA8c3lzL3RpbWUu
aD4KI2RlZmluZSBfX1VTRV9HTlUKI2luY2x1ZGUgPHN5cy91Y29udGV4dC5oPgojaW5jbHVk
ZSA8c2V0am1wLmg+CiNpbmNsdWRlIDxzeXMvaW8uaD4KCi8qIExvY2FsIHR5cGVzICovCnR5
cGVkZWYgc2hvcnQgdW5zaWduZWQgICAgICAgICAgdWludDE2X3Q7CnR5cGVkZWYgaW50IHVu
c2lnbmVkICAgICAgICAgICAgdWludDMyX3Q7CnR5cGVkZWYgbG9uZyBsb25nIHVuc2lnbmVk
ICAgICAgdWludDY0X3Q7CgovKiBGaWxlIHZhcnMgKi8Kc3RhdGljIGludCBkZWJ1ZyA9IDB4
MzgwMDAwOwpzdGF0aWMgaW50IHFlbXVfcG9ydCA9IDB4M2YxOwoKLyogVm1XYXJlIHN0dWZm
LiAqLwoKI2RlZmluZSBWTVdBUkVfUE9SVDMyeGluKGNtZCwgZWF4LCBlYngsIGVjeCwgZWR4
KSAgICAgICAgICAgICAgIFwKICAgIF9fYXNtX18oIi5ieXRlIDB4ZiwweGIsMHg3OCwweDY1
LDB4NmVcblx0aW5sICglJWR4KSIgOiAgICAgIFwKICAgICAgICAgICAgIj1hIihlYXgpLCAi
PWMiKGVjeCksICI9ZCIoZWR4KSwgIj1iIihlYngpIDogICAgICAgIFwKICAgICAgICAgICAg
IjAiKFZNV0FSRV9IWVBFUlZJU09SX01BR0lDKSwgICAgICAgICAgICAgICAgICAgICAgIFwK
ICAgICAgICAgICAgIjEiKFZNV0FSRV9QT1JUX0NNRF8jI2NtZCksICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKICAgICAgICAgICAgIjIiKHFlbXVfcG9ydCksICIzIihlYngpIDogICAg
ICAgICAgICAgXAogICAgICAgICAgICAibWVtb3J5Iik7CgovKiBTdGFydCBvZiBLZXJuZWwg
Y29weS4KICogMi42LjE4LTE5NC4zMi4xLmVsNSAqLwoKI2RlZmluZSBWTVdBUkVfSFlQRVJW
SVNPUl9NQUdJQyAgICAgICAgIDB4NTY0RDU4NjgKCiNkZWZpbmUgVk1XQVJFX1BPUlRfQ01E
X0dFVFZFUlNJT04gICAgICAxMAoKc3RhdGljIGlubGluZSBpbnQgdm13YXJlX3BsYXRmb3Jt
MzJ4aW4odm9pZCkKewogICAgdWludDMyX3QgZWF4LCBlYngsIGVjeCwgZWR4OwoKICAgIGVi
eCA9IFVJTlRfTUFYOwogICAgVk1XQVJFX1BPUlQzMnhpbihHRVRWRVJTSU9OLCBlYXgsIGVi
eCwgZWN4LCBlZHgpOwogICAgaWYgKCBkZWJ1ZyApIHsKICAgICAgICBmcHJpbnRmKHN0ZGVy
ciwgImh2bV9mZXBfaW5sX3Rlc3Q6IHZlcjMyeGluIGF4PSUwOHg/JTA4eCBieD0lMDh4PyUw
OHhcbiIsCiAgICAgICAgICAgICAgICBlYXgsIFZNV0FSRV9IWVBFUlZJU09SX01BR0lDLCBl
YngsIFVJTlRfTUFYKTsKICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImh2bV9mZXBfaW5sX3Rl
c3Q6IHZlcjMyeGluIGN4PSUwOHg/JTA4eCBkeD0lMDh4PyUwOHhcbiIsCiAgICAgICAgICAg
ICAgICBlY3gsIFZNV0FSRV9QT1JUX0NNRF9HRVRWRVJTSU9OLCBlZHgsIHFlbXVfcG9ydCk7
CiAgICAgICAgaWYgKCBlYXggIT0gVUlOVF9NQVggJiYgIShlYXggJiAweDgwMDAwMDAwKSAm
JiBlYnggPT0gVk1XQVJFX0hZUEVSVklTT1JfTUFHSUMgKQogICAgICAgICAgICBmcHJpbnRm
KHN0ZGVyciwgImh2bV9mZXBfaW5sX3Rlc3Q6IFZtV2FyZTMyeGluIFZlcnNpb24gJWQuJWRc
biIsIGVheCwgZWN4KTsKICAgIH0KICAgIHJldHVybiBlYXggIT0gVUlOVF9NQVggJiYgIShl
YXggJiAweDgwMDAwMDAwKSAmJiBlYnggPT0gVk1XQVJFX0hZUEVSVklTT1JfTUFHSUM7Cn0K
CmludAptYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKewogICAgY2hhciAgICAgICAgKnZl
cnNpb24gPSAiJFJldmlzaW9uOiAxLjEzICQiOwogICAgaW50ICAgICAgICAgIHZlckxlbiA9
IHN0cmxlbih2ZXJzaW9uKTsKCiAgICBpbnQgcmM7CgogICAgaWYgKCBhcmdjID4gMiApIHsK
ICAgICAgICBxZW11X3BvcnQgPSBzdHJ0b2woYXJndlsyXSwgTlVMTCwgMCk7CiAgICAgICAg
ZnByaW50ZihzdGRlcnIsICJodm1fZmVwX2lubF90ZXN0JS4qczogJWQgcWVtdV9wb3J0PTB4
JXgoJWQpXG4iLAogICAgICAgICAgICAgICAgdmVyTGVuIC0gMTIsIHZlcnNpb24gKyAxMCwg
YXJnYywKICAgICAgICAgICAgICAgIHFlbXVfcG9ydCwgcWVtdV9wb3J0KTsKCiAgICB9CiAg
ICBpZiAoIGFyZ2MgPiAxICkgewogICAgICAgIGRlYnVnID0gc3RydG9sKGFyZ3ZbMV0sIE5V
TEwsIDApOwogICAgICAgIGZwcmludGYoc3RkZXJyLCAiaHZtX2ZlcF9pbmxfdGVzdCUuKnM6
ICVkIGRlYnVnPTB4JXgoJWQpXG4iLAogICAgICAgICAgICAgICAgdmVyTGVuIC0gMTIsIHZl
cnNpb24gKyAxMCwgYXJnYywgZGVidWcsIGRlYnVnKTsKCiAgICB9CiAgICBpZiAoIGRlYnVn
ICYgMHg3MDAwMDAgKSB7CiAgICAgICAgcmMgPSBpb3BsKChkZWJ1ZyAmIDB4NzAwMDAwKSA+
PiAyMCk7CiAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAi
RmFpbGVkIHRvIGNhbGwgaW9wbCglZCkgZXJybm89JWQoJXMpXG4iLAogICAgICAgICAgICAg
ICAgICAgIChkZWJ1ZyAmIDB4NzAwMDAwKSA+PiAyMCwgZXJybm8sIHN0cmVycm9yKGVycm5v
KSk7CiAgICAgICAgZWxzZQogICAgICAgICAgICBmcHJpbnRmKHN0ZG91dCwgIkNhbGwgaW9w
bCglZClcbiIsIChkZWJ1ZyAmIDB4NzAwMDAwKSA+PiAyMCk7CiAgICB9CgogICAgaWYgKCBk
ZWJ1ZyAmIDB4ODAwMDAgKSB7CiAgICAgICAgaW50IGdvb2QgPSB2bXdhcmVfcGxhdGZvcm0z
MnhpbigpOwoKICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImh2bV9mZXBfaW5sX3Rlc3Q6IHZt
d2FyZV9wbGF0Zm9ybTMyeGluKCkgZ29vZD0lZFxuIiwgZ29vZCk7CiAgICB9CgogICAgcmV0
dXJuIDA7Cn0KCi8qCiAqIExvY2FsIHZhcmlhYmxlczoKICogbW9kZTogQwogKiBjLWZpbGUt
c3R5bGU6ICJCU0QiCiAqIGMtYmFzaWMtb2Zmc2V0OiA0CiAqIGluZGVudC10YWJzLW1vZGU6
IG5pbAogKiBFbmQ6CiAqLwo=
--------------1971497514C9916A273198D0--

