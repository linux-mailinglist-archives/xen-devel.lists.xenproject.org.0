Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLGhFJMFxGnOvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:56:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF596328847
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262711.1555126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Qa8-0003Mh-7Y; Wed, 25 Mar 2026 15:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262711.1555126; Wed, 25 Mar 2026 15:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5Qa8-0003Jd-3x; Wed, 25 Mar 2026 15:55:44 +0000
Received: by outflank-mailman (input) for mailman id 1262711;
 Wed, 25 Mar 2026 15:55:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1w5Qa6-0003JX-L6
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:55:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Qa5-0011j9-Iv
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:55:41 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69c40566-e002-0a2a0a5209dd-0a2a45069f7e-44
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:55:41 +0100
Received: from [74.125.224.46] (helo=mail-yx1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <freddy77@gmail.com>)
 id 69c4057c-3034-0a2a45060019-4a7de02ec58d-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:55:41 +0100
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-64ad79df972so12930d50.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 08:55:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Cc:To:Subject:Message-ID:Date:From:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1774454140; cv=none;
        d=google.com; s=arc-20240605;
        b=UJNmxF5iKjd83WnJDfa7pkA84QHySmwYZI9zl+POIvPsiIW+9+mAozREI2Tr6fcTbs
         2U7QCqoSAB2t+6XSJT0rht8rLInbigmlGw5yPTVV85PkEDRSkpFrDSOSEeKHUxW8KQJU
         ubAS4OIG1hyyNyQR0jnlA+4x++1qokw5ry/uwOr65NadhZeKpTFIHtZ8C3LdctVeWQOr
         BjDaugn7X6IHr06E9G6Ry4zljdaTQam94wN4k1ZUoHP8WCgLNnetelwH7HFmrN2MGyZL
         OsbNabZtiukyHjMTkpFZZH3uyRYvODuZ2o3OUK3LD6ZIZzmnEyT3+zbZGVnXDZ8Wan5K
         rZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JXxe0Bf9ieucpKIlOPKNVX99SDhdj0cpjSOTYoaFpqM=;
        fh=cjIMuHVtIOL7V2Eciq8yuGIhPX9boPZT09IYD4Kz7ZA=;
        b=KW0x99BBMkQBMRgVpRgQ8b5QOhVjxFMq1xqVhGBTCNk12wuM2KDlmSB0jHDwQoeT/1
         7FftTx48xmT+pVcfk6EvRhoAuu7r0jdYfkuHMcGYQJDIC8pK6tjJ490FdTvAJGcJxf0H
         7yXyzgkXlArWXNmu2EGBW2WQ0wttZcrmA7qPFmTEUmsMaxSyKrQYBCx4NMADLnnORIIO
         DhSnMtfiNkdCLirC8Lr3oIc+2Agu8m2EnoKvp4eX8Z2A0LkDipa+52LKM0Ju2zDNodW9
         3avXshOnTy3aus6ZFSJ638gaRGNlfvtg6+i/1W+uklbw6e8VceXevu5tWKvasgTEtrUo
         mkTg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774454140; x=1775058940; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JXxe0Bf9ieucpKIlOPKNVX99SDhdj0cpjSOTYoaFpqM=;
        b=U2K5unrG3MYf9OTQnPqobqlCScW925FkiZjtbDY6w6FMKdVfnufEqFUokzJH8/3fCd
         fDIAnolEGMz4Tav2c6wgT8l2/3t5pnKYHpuDQcgG2isxppyOlPeaRBLReRIA7uW72X2r
         7rfdtGcbjaBRGO7AjgOFnDwHnjDxjS4Di67mP/GpYIRPOIc82BMq2cWnTD0SCW8yemYo
         k5TcqIspa2+ZV37CuV72odwAyo9FS5d0zbxE7tQeuYE8/2M1xlBLct1XXSjPuYHruOy+
         TdEUNre4sbNi6wKcCD8678kTdzEH91y6S3JIV3PgJ4uUkySpDUs6x4wdTpvmU8ZqC847
         lKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454140; x=1775058940;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXxe0Bf9ieucpKIlOPKNVX99SDhdj0cpjSOTYoaFpqM=;
        b=Noab3c54yYdlAdeUs0LCPygo0yrP8CI1N4ZkkdVud5/f7dXSonYrgA9BJ0ZakD/ISI
         Uzz8ndNUOJp45WN1jTKCpDujKBL0TvOGb2SQovyou6fcRTP5VGhFk75ca7s8sSGmtxGb
         80Lil8GzQSHieLspCD48mUp/I7j91nrAhGNi0jaXpwKTEaOHd211bZE0ICAjDM4Tbcpu
         ai6wLKZz3f3yg25UccWL885sAgbTuvClfLYq/yR/2uUtiiWpHKsuDsjoI4V2o5+2nTBc
         5l5T7l3harI//8VDZ7SIe5hwZxPxWaxFJ0CnOBA8+zCmIxERc0KB9w1dMzQf5IZsUjnY
         Y5GA==
X-Gm-Message-State: AOJu0Ywqfj6p2vAahu+NkaElrDZM/MJmwHMvNJtDcHVD7fcmHaR+evkV
	V4qd54f5mCreVZwnEJ+rHolRLIsWFlsPsoLylt3r2pes+7Ie0lzYSM+818eYuCp3L6EQMOU5CrY
	G6pkoLceIQCNcp3sJLoun7HgDxrgcZMwF6Pq9
X-Gm-Gg: ATEYQzzeoDJpNn25w8r/6QyHIobcERmMZLXn+YJ3dBCmSR0aaG2tFbHRoMHXhddpCFg
	R8nzZyCyseGIksR9I9jI/MtBTCDt4OX313zP/XquF7Ku4AqMp598QICsT6iUc1MmLrSqohezmr7
	KV+FjvtJ9dynssxsa7+ASONNjQVjWQa//Ls9Geje2xtM/ncZvbYsMrdxeBN0Ftti4BYawYNFWcU
	RKYs3yczhlJBN1PSKlTyPiQ+mt2/QQTC+PgW7sKG2wcQmGYAfgmkjUF/ZHkAJNgkId4FxDnYK2o
	grtn9w==
X-Received: by 2002:a53:ac8b:0:b0:64e:dbbf:6a85 with SMTP id
 956f58d0204a3-64ee744a6c1mr3291195d50.44.1774454139815; Wed, 25 Mar 2026
 08:55:39 -0700 (PDT)
MIME-Version: 1.0
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 25 Mar 2026 15:55:28 +0000
X-Gm-Features: AQROBzAzLGkkUNrgLDxmBGA_0hxFBhvV_bOyRI2xwvh1kP9E6Lf8yDdMoMY0bN4
Message-ID: <CAHt6W4f0iSN5vqbPHTCv6dLdoxUFXivoPX8BYV+gurxxv9q66Q@mail.gmail.com>
Subject: [PATCH] xen/x86: Check supported features even for PHV dom0
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-16d1c6/1774454141-B3C9F1C2-8097FB2F/0/0
X-purgate-type: clean
X-purgate-size: 3135
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: AF596328847
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The supported features ELF note was tested only if the dom0 was
PV. Factor out a function to check ELF notes and reuse it even
for PVH.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 xen/arch/x86/dom0_build.c             | 16 ++++++++++++++++
 xen/arch/x86/hvm/dom0_build.c         |  3 +++
 xen/arch/x86/include/asm/dom0_build.h |  2 ++
 xen/arch/x86/pv/dom0_build.c          | 10 ++--------
 4 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 864dd9e53e..c6bb2f8067 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -321,6 +321,22 @@ unsigned long __init dom0_paging_pages(const
struct domain *d,
 }


+int __init dom0_check_parms(
+    const struct elf_dom_parms *parms, bool is_pv_shim)
+{
+    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type !=
XEN_ENT_NONE )
+    {
+        if ( !is_pv_shim && !test_bit(XENFEAT_dom0, parms->f_supported) )
+        {
+            printk("Kernel does not support Dom0 operation\n");
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
+
 /*
  * If allocation isn't specified, reserve 1/16th of available memory for
  * things like DMA buffers. This reservation is clamped to a maximum of 128MB.
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index d69a83b089..ca96f32acd 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -699,6 +699,9 @@ static int __init pvh_load_kernel(
     if ( !check_and_adjust_load_address(d, &elf, &parms) )
         return -ENOSPC;

+    if ( (rc = dom0_check_parms(&parms, false)) != 0 )
+        return rc;
+
     elf_set_vcpu(&elf, v);
     rc = elf_load_binary(&elf);
     if ( rc < 0 )
diff --git a/xen/arch/x86/include/asm/dom0_build.h
b/xen/arch/x86/include/asm/dom0_build.h
index ff021c24af..a322bf455c 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -8,6 +8,8 @@

 extern unsigned int dom0_memflags;

+int dom0_check_parms(const struct elf_dom_parms *parms,
+                     bool is_pv_shim);
 unsigned long dom0_compute_nr_pages(struct domain *d,
                                     struct elf_dom_parms *parms,
                                     unsigned long initrd_len);
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 075a3646c2..9d0310ad91 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -494,14 +494,8 @@ static int __init dom0_construct(const struct
boot_domain *bd)
         return -EINVAL;
     }

-    if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
-    {
-        if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
-        {
-            printk("Kernel does not support Dom0 operation\n");
-            return -EINVAL;
-        }
-    }
+    if ( (rc = dom0_check_parms(&parms, pv_shim)) != 0 )
+        goto out;

     nr_pages = dom0_compute_nr_pages(d, &parms, initrd_len);

-- 
2.43.0

