Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F551B1B890
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070745.1434375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaB-0002yH-MF; Tue, 05 Aug 2025 16:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070745.1434375; Tue, 05 Aug 2025 16:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKaB-0002vi-Iw; Tue, 05 Aug 2025 16:32:11 +0000
Received: by outflank-mailman (input) for mailman id 1070745;
 Tue, 05 Aug 2025 16:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQWd=2R=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ujKaA-0002gS-KN
 for xen-devel@lists.xen.org; Tue, 05 Aug 2025 16:32:10 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb473bf1-7219-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 18:32:09 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-af93c3bac8fso638381066b.2
 for <xen-devel@lists.xen.org>; Tue, 05 Aug 2025 09:32:09 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af928c84154sm842980766b.84.2025.08.05.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:32:07 -0700 (PDT)
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
X-Inumbo-ID: bb473bf1-7219-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754411528; x=1755016328; darn=lists.xen.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw+fp9ijqB07ybQ00T6Z+NAfGs8NSWdqqpiXyp8ErM4=;
        b=jWc64krrPGfNBbHLeiIe0zQ1vzurQmzf3HzVTUzjc6/7j39jL6U/2sgsVhyEyInCrT
         Gz67skHR5FWLLKKKAK68ttbdPKzd9v5OcrzkxBjKzDqopWxzMyfXb0VAP5etY51XFCO6
         lNOfsAJdSiOC1bOBqSGW+EHwhqEIgUl3n6kik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411528; x=1755016328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cw+fp9ijqB07ybQ00T6Z+NAfGs8NSWdqqpiXyp8ErM4=;
        b=KlYpVqs/Gf+RQ+XhL3kGG7Ahz0y2FQLfDuRdqXLWHbiif1DDB5usAZSn4nb8prcWzc
         6ST652g8HvY/PIqOYvHk6DPJ4uWhkExg4ryusjnyP/j/xfljE7ckIpOa+sOH736hUCeD
         kdewYLhW/C88kCUWsnXaYpQ0LmbUYV8Pt/JkpbBg9TohikuIsGiRj7P06w07A4VteXQ7
         y8bWPcjtG6wZnGfffqn+NIg664txGIe5lW+XEKEipKGsG3kj44roKmiVNCqC4RQrN0s7
         dYOjafgaKwNatbb5Pd6loINED9wuaS/z0kzIiVb/n3fN0dQgIpsfaL54ALDAe12K6kOp
         MXkg==
X-Gm-Message-State: AOJu0YyPmxWNj90JnK8Cd5vyQLMdO/7RrKHcIi8RproC/k7fjVzVpAKR
	fkW6thlTe6IJAU+hUQFSrG2rk5kzeS3QljoC/nby1J8b4NGJa0QafQzYRpuXCkgZNFRjTrexzBb
	Uf0U=
X-Gm-Gg: ASbGncty9d0n+3bkEvpxubZGcfdxeMg+y3H4bHdmFz1UeRgAX9T5Gny12BYdI69/R9E
	eac536jLF2DKtqs18Htj/OxuzWaHwZDJy4+Qoz8gOU3KHd2kLlTTsqFlvfbNQWsBb+KLvi6OMYe
	n2avkD1xnTu+f20bJPn8i923t6zdk9sU21DIp6KmY+5dCUpVh6viWgG7zH0G1piJDxW0YsUATxE
	zRJhBiqWgTmj8pNWShIrhbCeArAAyKG/aC+cpM7D6TtAeeWT6sED3YeVPA1aB4H3j8Hs+dKbmmE
	YGcVmb0PvyObPl+7sXhIQHZpOLjyMPwxhDdG+nu+9T0PEVmZfnlWw8K3h50QMIQMerPNdDYBoeE
	KnGpoabyRBRbjBb+yTirD/uWKE1NskeX/hV+QPOdDu3OXFQ==
X-Google-Smtp-Source: AGHT+IGa4GFLCDHDfvOak3r6zeET09jfJFrVEa7qKNQ3LiINiAKvfcR4Wn8Z3ypOhRbpZd4sqlkjAA==
X-Received: by 2002:a17:907:7fa8:b0:ae0:d798:2ebd with SMTP id a640c23a62f3a-af94017fa9amr1402524766b.35.1754411528077;
        Tue, 05 Aug 2025 09:32:08 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Xen-devel <xen-devel@lists.xen.org>,
	xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] Misc EFI boot fixes
Date: Tue,  5 Aug 2025 17:32:02 +0100
Message-ID: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes for a couple of annoyances when booting Xen using the native EFI
entry point.

Ross Lagerwall (2):
  efi: Call FreePages only if needed
  efi: Stop using StdErr

 xen/common/efi/boot.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

-- 
2.50.1


