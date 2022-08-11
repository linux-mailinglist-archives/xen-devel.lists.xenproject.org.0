Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574335906DC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 21:11:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385112.620657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMDZh-0004Pq-IU; Thu, 11 Aug 2022 19:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385112.620657; Thu, 11 Aug 2022 19:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMDZh-0004Nw-En; Thu, 11 Aug 2022 19:10:33 +0000
Received: by outflank-mailman (input) for mailman id 385112;
 Thu, 11 Aug 2022 19:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8gOk=YP=canonical.com=mfo@srs-se1.protection.inumbo.net>)
 id 1oMDZf-00047D-Ik
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 19:10:31 +0000
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43e533a2-19a9-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 21:10:30 +0200 (CEST)
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9AC7D3FB9A
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 19:10:29 +0000 (UTC)
Received: by mail-vk1-f199.google.com with SMTP id
 m198-20020a1f26cf000000b0037d0bb08ff0so542100vkm.22
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 12:10:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4e1:83a2:2ee9:2118:a2dc:3dd6])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a67ea07000000b00384b60a5160sm120094vso.12.2022.08.11.12.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 12:10:27 -0700 (PDT)
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
X-Inumbo-ID: 43e533a2-19a9-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660245029;
	bh=Bku1QWFjoN5ugmM4WYD4XEpuzkdpLBaIxy3t9egl2dU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=veFCjXNrgHwp7PlSgIkzJ1re+NvzmQA+5bK55VyPrRJu1741Kv9qZA4nWt48kicLO
	 xQrPFEYlXl+eblhmvpll7gZvsTjN+dUG8gELao8HH9V73nhzXtD47buRKu+O9Ww6yl
	 otyi14ZjS5VXKq+vhPeQNJ2FVCN4Q3wVsqwV9o8zAn7c7nlZU/hdo1vEDp9e9VeY8p
	 gi1AXSaOtPkhhO6F0e16UAXTa4THhlicoDpTnYx/NH5H/a0HI80ruPIzDLqP7qQhHO
	 uAawwc29Q2L7FgDb/xfeSqbLxcdHX2812vvfAfAqrYgKCltXVezny8eiRbYoU97/KC
	 zuY5JIfq7Gt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Bku1QWFjoN5ugmM4WYD4XEpuzkdpLBaIxy3t9egl2dU=;
        b=1xSo7VDmVqEHrBrcmQ4vyC1sDz6eQiOEkQNE9+7sqTgBC+nGqyMm3Nj43GkULVI+9m
         NrngfdNJ/7y5qdnxWqsSpHf45XIIBZBCB2QJ6uQ8bBQQ44xZIcIHSheh2k48Zk9yEQnl
         fKa6kh4TPz89azFCk4OdWqtg8gM8BgrVrWUZWpRR9wUChJPYoF1eKXpnaDONNV+nbrIF
         sh9PqXCcVHHKJ0TXraPCbXpv+RSLm3dNoD/QD+Kg1VunUeEWcJ/PAXzlH63cZuTs1AhD
         gKT3iiX3tdx809dNHYpy9InQXtx5m4U/YE9gnplrGQ0yg0mx7t98NutnVywO0KRUNWxD
         Llrg==
X-Gm-Message-State: ACgBeo0C2soPpIpHb+PeHYTWvFtJmf3Bo1szUUGv8sTGNsa409zTv6CI
	L5GFaaPfplOZ+ECtqyZL7J6DRUPfMKO/r7Q1SnrOn4uDaIhqjElMoDDfjmlNSEC3WSbRTdt+vaI
	GWiHJdVttwLxPBGp3dLKr/tCfE06NTdRXsJtT1ox2vFmd
X-Received: by 2002:a05:6102:238d:b0:388:b4aa:9f37 with SMTP id v13-20020a056102238d00b00388b4aa9f37mr343526vsr.31.1660245028264;
        Thu, 11 Aug 2022 12:10:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7sJF0r7Bab4TEClDzx3QZJkVijmAqmhpwSOj/n3f6ue0JTLlUNFDAzWPlrmv2No7ACNyKt7g==
X-Received: by 2002:a05:6102:238d:b0:388:b4aa:9f37 with SMTP id v13-20020a056102238d00b00388b4aa9f37mr343511vsr.31.1660245027975;
        Thu, 11 Aug 2022 12:10:27 -0700 (PDT)
From: Mauricio Faria de Oliveira <mfo@canonical.com>
To: xen-devel@lists.xenproject.org,
	grub-devel@gnu.org
Cc: Daniel Kiper <dkiper@net-space.pl>,
	=?UTF-8?q?Peter=20Gro=C3=9Fe?= <pegro@friiks.de>
Subject: [PATCH 2/2] templates/linux_xen: Properly order the multiple initrd files
Date: Thu, 11 Aug 2022 16:10:14 -0300
Message-Id: <20220811191014.139882-3-mfo@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811191014.139882-1-mfo@canonical.com>
References: <20220811191014.139882-1-mfo@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The linux_xen template orders the "early" initrd file(s) _first_
(i.e., before the "real" initrd files) and that seems reasonable,
as microcode updates usually come first.

However, this usually breaks Linux boot with initrd under Xen
because Xen assumes the real initrd is the first multiboot[2]
module after the kernel, passing its address over to Linux in
Xen's start_info struct.

So, if a microcode-only initrd (i.e., without init/userspace)
is found by grub-mkconfig, it ends up considered as a normal
initrd by the Linux kernel, which cannot do anything with it
(as it has no other files) and panic()s unable to mount root
if it depends on a initrd to do that (e.g., root=UUID=...).

...

Well, since Xen doesn't actually use the provided microcode
by default / unless the 'ucode=<module number|scan>' option
is enabled, this isn't used in the general case (and breaks).

Additionally, if an user enables the 'ucode=' option, that
either specifies which module is to be used for microcode,
or scans all modules (regardless of being first) for that.

Thus, for Xen:
- it is *not required* to have microcode first,
- but it is *required* to have real initrd first

So, fix it by ordering the real initrd before early initrd(s).

After:

    # touch /boot/xen /boot/microcode.cpio
    # grub-mkconfig 2>/dev/null | grep -P '^\t(multiboot|module)'
            multiboot      /boot/xen ...
            module  /boot/vmlinuz-5.4.0-122-generic ...
            module  --nounzip   /boot/initrd.img-5.4.0-122-generic
            module  --nounzip   /boot/microcode.cpio

...

Corner case specific to Xen implementation details:

It is actually _possible_ to have a microcode initrd first,
but that requires a non-default option (so can't rely on it),
and it turns out to be inconsistent with its counterpart
(really shouldn't rely on it, as it may get confusing; below).

'ucode=1' does manually specify the first module is microcode
_AND_ clears its bit in the module bitmap. The next module is
now the 'new first', and gets passed to Linux as initrd. Good.

'ucode=scan' checks all modules for microcode, but does _NOT_
clear a bit if it finds one (reasonable, as it can find that
prepended in a "real" initrd anyway, which needs to be used).
The first module still gets passed to Linux as initrd. Bad.

Fixes: e86f6aafb8de ("grub-mkconfig/20_linux_xen: Support multiple early initrd images")

Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
---
 util/grub.d/20_linux_xen.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
index 50c62562b730..626aed40cbfd 100644
--- a/util/grub.d/20_linux_xen.in
+++ b/util/grub.d/20_linux_xen.in
@@ -307,7 +307,10 @@ for current_xen in ${reverse_sorted_xen_list}; do
 
 	initrd=
 	if test -n "${initrd_early}" || test -n "${initrd_real}"; then
-	    initrd="${initrd_early} ${initrd_real}"
+	    # Xen assumes the real initrd is the first module after the kernel.
+	    # Additional (later) initrds can also be used for microcode update,
+	    # with Xen option 'ucode=<scan|module number> (non-default anyway).
+	    initrd="${initrd_real} ${initrd_early}"
 
 	    initrd_display=
 	    for i in ${initrd}; do
-- 
2.34.1


