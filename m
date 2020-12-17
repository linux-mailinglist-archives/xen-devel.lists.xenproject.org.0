Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79AE2DD44E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55964.97629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvLg-00031g-7N; Thu, 17 Dec 2020 15:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55964.97629; Thu, 17 Dec 2020 15:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvLg-00031H-4C; Thu, 17 Dec 2020 15:37:48 +0000
Received: by outflank-mailman (input) for mailman id 55964;
 Thu, 17 Dec 2020 15:37:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kpvLe-00031C-BF
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:37:46 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb212da8-73e2-461b-9f87-ddbc31422f42;
 Thu, 17 Dec 2020 15:37:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t16so27022849wra.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Dec 2020 07:37:45 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (5ec3281d.skybroadband.com.
 [94.195.40.29])
 by smtp.gmail.com with ESMTPSA id d9sm10008684wrc.87.2020.12.17.07.37.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 07:37:43 -0800 (PST)
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
X-Inumbo-ID: fb212da8-73e2-461b-9f87-ddbc31422f42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HifGYkonzOaa8e9gq3lwyEK5YpbFloCuVkFZZE//Dn8=;
        b=BJdq2+Gg6ucbV3e4puCHrkiW+r8sxPc9HXDsKD+SHx6ZheXXdbhiQtN7ZWtYITA/8n
         BpDeBMDmogmcj2l8aRgrbp5JRZUodpWuHDEkrDO2J6AbGVXx2aHI3MyPqj3Bp9F8cL9q
         ZdjMuQGRptlMgx3Ixx2/AYBgUDLSpTrnQ24Imn4xGk9B74C3I9nyPXuyfZyrKUxhysDv
         toTRx9DaJGyVGbkUuaWUxAbpmHp94sivrAGWqjw3d5S1sNpDqMXQHWYdgUdLtmMXXwBT
         T4vKui/VMgg7EZUNOzTvmfncokMHnBVmnwQlx3Fm79Xd+QN7XVcH5kVs43PRJi1v01ZX
         kuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HifGYkonzOaa8e9gq3lwyEK5YpbFloCuVkFZZE//Dn8=;
        b=Rk+JsknUv+rOnFkreOUJw3K54pkhPtbRNwRJKqi994IyhbdINNa6GaUNmUoXXUv5kr
         fpjBfIIJRzFBLXAE21ftsep1nDLAkfiFIwY+zQS+Z4zGLb+Pi8HfQNvERGN5n4k61iDV
         47mlwTclT/ksR4lUeaifnev5iRY+gsI+OKuCGN+6suHPcUKDEWJTaPHCaiKm7qTF3UEk
         5Mm1UVHDJfyKvw4f6Uln4wNkBADVWaxMMF29VcsdBSiUR6bVAcdmQG1W8RbU5EqUxdPB
         bNC51ueumBXo+987oSRfBODBNdeDuB8noX/owxHtRds8jOQwFQeFZ4wcd+60lTBT8KCR
         p52A==
X-Gm-Message-State: AOAM530gpEjKBp+X8RJDTikXrXJLfEE3pcWIbmh6paQuuUkIkiYvwf7g
	Q/x39DwUqb6XshumEh58Tdc=
X-Google-Smtp-Source: ABdhPJxwW3MrkDmrvh4uSwb9sFgw7sW2BzBK07zY2jWRiUh9rvrwTZ6+bMiO6Xk2M/sQ3ITTYzL0DA==
X-Received: by 2002:adf:9525:: with SMTP id 34mr45707362wrs.389.1608219464168;
        Thu, 17 Dec 2020 07:37:44 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: julien@xen.org
Cc: ash.j.wilding@gmail.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v2 00/15] xen/arm: port Linux LL/SC and LSE atomics helpers to Xen
Date: Thu, 17 Dec 2020 15:37:42 +0000
Message-Id: <20201217153742.14034-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cb0f7055-6d9a-5c39-6198-109593fd3424@xen.org>
References: <cb0f7055-6d9a-5c39-6198-109593fd3424@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Julien,

Thanks for taking a look at the patches and providing feedback. I've seen your
other comments and will reply to those separately when I get a chance (maybe at
the weekend or over the Christmas break).

RE the differences in ordering semantics between Xen's and Linux's atomics
helpers, please find my notes below.

Thoughts?

Cheers,
Ash.


The tables below use format AAA/BBB/CCC/DDD/EEE, where:

 - AAA is the memory barrier before the operation
 - BBB is the acquire semantics of the atomic operation
 - CCC is the release semantics of the atomic operation
 - DDD is whether the asm() block clobbers memory
 - EEE is the memory barrier after the operation

For example, ---/---/rel/mem/dmb would mean:

 - No memory barrier before the operation
 - The atomic does *not* have acquire semantics
 - The atomic *does* have release semantics
 - The asm() block clobbers memory
 - There is a DMB memory barrier after the atomic operation


    arm64 LL/SC
    ===========

        Xen Function            Xen                     Linux                   Inconsistent
        ============            ===                     =====                   ============

        atomic_add              ---/---/---/---/---     ---/---/---/---/---     ---
        atomic_add_return       ---/---/rel/mem/dmb     ---/---/rel/mem/dmb     --- (1)
        atomic_sub              ---/---/---/---/---     ---/---/---/---/---     ---
        atomic_sub_return       ---/---/rel/mem/dmb     ---/---/rel/mem/dmb     --- (1)        
        atomic_and              ---/---/---/---/---     ---/---/---/---/---     ---
        atomic_cmpxchg          dmb/---/---/---/dmb     ---/---/rel/mem/---     YES (2)
        atomic_xchg             ---/---/rel/mem/dmb     ---/acq/rel/mem/dmb     YES (3)

(1) It's actually interesting to me that Linux does it this way. As with the
    LSE atomics below, I'd have expected acq/rel semantics and ditch the DMB.
    Unless I'm missing something where there is a concern around taking an IRQ
    between the LDAXR and the STLXR, which can't happen in the LSE atomic case
    since it's a single instruction. But the exclusive monitor is cleared on
    exception return in AArch64 so I'm struggling to see what that potential
    issue may be. Regardless, Linux and Xen are consistent so we're OK ;-)

(2) The Linux version uses either STLXR with rel semantics if the comparison
    passes, or DMB if the comparison fails. This is weaker than Xen's version,
    which is quite blunt in always wrapping the operation between two DMBs. This
    may be a holdover from Xen's arm32 versions being ported to arm64, as we
    didn't support acq/rel semantics on LDREX and STREX in Armv7-A? Regardless,
    this is quite a big discrepancy and I've not yet given it enough thought to
    determine whether it would actually cause an issue. My feeling is that the
    Linux LL/SC atomic_cmpxchg() should have have acq semantics on the LL, but
    like you said these helpers are well tested so I'd be surprised if there
    is a bug. See (5) below though, where the Linux LSE atomic_cmpxchg() *does*
    have acq semantics.

(3) The Linux version just adds acq semantics to the LL, so we're OK here.


    arm64 LSE (comparison to Xen's LL/SC)
    =====================================

        Xen Function            Xen                     Linux                   Inconsistent
        ============            ===                     =====                   ============

        atomic_add              ---/---/---/---/---     ---/---/---/---/---     ---
        atomic_add_return       ---/---/rel/mem/dmb     ---/acq/rel/mem/---     YES (4)
        atomic_sub              ---/---/---/---/---     ---/---/---/---/---     ---
        atomic_sub_return       ---/---/rel/mem/dmb     ---/acq/rel/mem/---     YES (4)
        atomic_and              ---/---/---/---/---     ---/---/---/---/---     ---
        atomic_cmpxchg          dmb/---/---/---/dmb     ---/acq/rel/mem/---     YES (5)
        atomic_xchg             ---/---/rel/mem/dmb     ---/acq/rel/mem/---     YES (4)

(4) As noted in (1), this is how I would have expected Linux's LL/SC atomics to
    work too. I don't think this discrepancy will cause any issues.

(5) As with (2) above, this is quite a big discrepancy to Xen. However at least
    this version has acq semantics unlike the LL/SC version in (2), so I'm more
    confident that there won't be regressions going from Xen LL/SC to Linux LSE
    version of atomic_cmpxchg().


    arm32 LL/SC
    ===========

        Xen Function            Xen                     Linux                   Inconsistent
        ============            ===                     =====                   ============

        atomic_add              ---/---/---/---/---     ---/---/---/---/---     ---
        atomic_add_return       dmb/---/---/---/dmb     XXX/XXX/XXX/XXX/XXX     YES (6)
        atomic_sub              ---/---/---/---/---     ---/---/---/---/---     ---
        atomic_sub_return       dmb/---/---/---/dmb     XXX/XXX/XXX/XXX/XXX     YES (6)
        atomic_and              ---/---/---/---/---     ---/---/---/---/---     ---  
        atomic_cmpxchg          dmb/---/---/---/dmb     XXX/XXX/XXX/XXX/XXX     YES (6)
        atomic_xchg             dmb/---/---/---/dmb     XXX/XXX/XXX/XXX/XXX     YES (6)

(6) Linux only provides relaxed variants of these functions, such as
    atomic_add_return_relaxed() and atomic_xchg_relaxed(). Patches #13 and #14
    in the series add the stricter versions expected by Xen, wrapping calls to
    Linux's relaxed variants inbetween two calls to smb_mb(). This makes them
    consistent with Xen's existing helpers, though is quite blunt. It is worth
    noting that Armv8-A AArch32 does support acq/rel semantics on exclusive
    accesses, with LDAEX and STLEX, so I could imagine us introducing a new
    arm32 hwcap to detect whether we're on actual Armv7-A hardware or Armv8-A
    AArch32, then swap to lighterweight STLEX versions of these helpers rather
    than the heavyweight double DMB versions. Whether that would actually give
    measurable performance improvements is another story!

