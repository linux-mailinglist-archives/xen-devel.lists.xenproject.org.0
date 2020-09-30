Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B3527E9F8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.698.2323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcCJ-00030W-FF; Wed, 30 Sep 2020 13:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698.2323; Wed, 30 Sep 2020 13:31:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcCJ-000306-Bw; Wed, 30 Sep 2020 13:31:07 +0000
Received: by outflank-mailman (input) for mailman id 698;
 Wed, 30 Sep 2020 13:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNcCH-0002zv-NL
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:31:05 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f23c82a2-7ee9-44bd-8991-d130eae0873d;
 Wed, 30 Sep 2020 13:31:04 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNcCH-0002zv-NL
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:31:05 +0000
X-Inumbo-ID: f23c82a2-7ee9-44bd-8991-d130eae0873d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f23c82a2-7ee9-44bd-8991-d130eae0873d;
	Wed, 30 Sep 2020 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601472664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=beJITd6sysMpt7257kbyi6vde00dXcCDo68IICbs81Q=;
  b=NtOk2drqVzvPQW281SjKycR9q9/wl9QPF/llvVw1dHfobgCfwfCr7emD
   TvtfrYCXt1htUXdmW9mDSSwceyXq4/OtnmZFQawMYlWIlNislqv4/ck6D
   H+hIuLaTGJjT2e7DrMq5SdqkOH4oZso+O4gXe1RrqB2hKco4ISF7goXFw
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gRA5m8CFL7DRv0eigth1Mr3s1plX439IrgCnesV2v8ajxl+Qj4OSSEUR0EUMhviAmQ9269TixF
 iaghooQPQx44Ovcpai6PiFMwShTKRGYc5dYwl/Xn+FaV6PaY+foYi8Y4LVhxk7D2149gvi3mSx
 MlLQrETWOfqmXmuqTxxE1SVIhs3lQFFTuFMarNbq9tmWLD/tvTz6a9BJNB3cSwVaQ/3cXx67dd
 ObMoYJpi+Qp0G+0vYbg8EmvA0QUJWoeVx5dsV1tTpy/zqS68Nklt8Yfeqnk7Iy1JED6SxckIqz
 C1Y=
X-SBRS: None
X-MesageID: 28238230
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28238230"
Date: Wed, 30 Sep 2020 15:30:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 11/11] x86/vpt: introduce a per-vPT lock
Message-ID: <20200930133048.GV19254@Air-de-Roger>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-12-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930104108.35969-12-roger.pau@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 12:41:08PM +0200, Roger Pau Monne wrote:
> Introduce a per virtual timer lock that replaces the existing per-vCPU
> and per-domain vPT locks. Since virtual timers are no longer assigned
> or migrated between vCPUs the locking can be simplified to a
> in-structure spinlock that protects all the fields.
> 
> This requires introducing a helper to initialize the spinlock, and
> that could be used to initialize other virtual timer fields in the
> future.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Just realized I had the following uncommitted chunk that should have
been part of this patch, nothing critical but the tm_lock can now be
removed.

---8<---
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7cb4511b60..7daca3f85c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1554,8 +1554,6 @@ int hvm_vcpu_initialise(struct vcpu *v)
 
     hvm_asid_flush_vcpu(v);
 
-    spin_lock_init(&v->arch.hvm.tm_lock);
-
     rc = hvm_vcpu_cacheattr_init(v); /* teardown: vcpu_cacheattr_destroy */
     if ( rc != 0 )
         goto fail1;
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/include/asm-x86/hvm/vcpu.h
index 07a9890ed3..6e3bdef5bc 100644
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -166,9 +166,6 @@ struct hvm_vcpu {
     s64                 cache_tsc_offset;
     u64                 guest_time;
 
-    /* Lock for virtual platform timers. */
-    spinlock_t          tm_lock;
-
     bool                flag_dr_dirty;
     bool                debug_state_latch;
     bool                single_step;


