Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15D38B5C3A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714131.1115214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SV0-0008AB-UJ; Mon, 29 Apr 2024 15:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714131.1115214; Mon, 29 Apr 2024 15:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1SV0-00087M-Qj; Mon, 29 Apr 2024 15:00:58 +0000
Received: by outflank-mailman (input) for mailman id 714131;
 Mon, 29 Apr 2024 15:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1SUy-0006Ve-Rp
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:00:56 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46fbe4fa-0639-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 17:00:55 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5ac8c73cf88so3212412eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:00:55 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d17-20020a0cf0d1000000b006a04769b5a7sm10441892qvl.110.2024.04.29.08.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:00:52 -0700 (PDT)
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
X-Inumbo-ID: 46fbe4fa-0639-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714402853; x=1715007653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFbDmju5IjTA9HMoPxU+gJubSBkYzhzZZat8pMJw8AU=;
        b=ckv782+AXekPtMhi+DR01PJTWQCWGOkV6os/hAANCqBmLRorqpcFu8mK6jg/QgHyKk
         tNXENyJ+cx6kq901C3aXjmXMlTkWfrUpVD7jculei/Olv/s5bj2Dg/sucCUVAfOMZRM9
         wAYaBwP3dLtbG+h6id1ySXwA/UIonqef70gG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402853; x=1715007653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFbDmju5IjTA9HMoPxU+gJubSBkYzhzZZat8pMJw8AU=;
        b=Rhd4/QqvUG1PmegseSJKeKmF7dZ0x55ZR0AqGnoLCCgBB5Hbean3cNd6w4JccfFWUL
         qnEV4WQXwIxwn99mqhLFicIGCmvB/BJT73X+hxJ386dJbi6iN+piu60UEyBm8u/GmEnX
         /WgjH75nsRrpY/C53UWWfojpdOfpdhF6rbNSj2Yu7GXEcIj3aAXyVykG1vKIzcQ8ZEYx
         wiKEVVlJkNqmoYS0CdYYlvLSqFiPFK/2jZhZvxLxsHYI269RJEOLk2460AFd/TICzczP
         xdgjHjrNc4nYBADPSDHponxii1xvtM2+L22KmXbg6BOx9drQKdJDftJZCrl/hwdzMKdm
         MlrQ==
X-Gm-Message-State: AOJu0YwdroKmz6L8yaLaQR1ejuchUV444+8TVmJcFOUiSTCba5YUyjUs
	GluQY+HIfBYn1uu5Vr/2B4IvShkb/xfH6Y0sWqAszRJFxEXub98/i7Q/JEAd7yQQjeQw4lep0P/
	n
X-Google-Smtp-Source: AGHT+IH61EQ/4nlaImXeAg5mlusaibvWGRzYoiVkr/DIS2WKP+Xnc4BLJE3V92IGdcm2d2Yz1gEuoA==
X-Received: by 2002:a05:6358:1913:b0:18e:3ec:94cb with SMTP id w19-20020a056358191300b0018e03ec94cbmr12307398rwm.14.1714402853326;
        Mon, 29 Apr 2024 08:00:53 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 7/9] create-diff-object: don't account for changes to .bug_frame.? sections
Date: Mon, 29 Apr 2024 16:56:52 +0200
Message-ID: <20240429145654.71669-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429145654.71669-1-roger.pau@citrix.com>
References: <20240429145654.71669-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bug_frame related sections exclusively contain addresses that reference back to
the address where the BUG_INSTR is executed.  As such, any change to the
contents of bug_frame sections (or it's relocations) will necessarily require a
change in the caller function, as the placement of the BUG_INSTR must have
changed.

Take advantage of this relocation, and unconditionally mark the bug_frame
sections themselves as not having changed, the logic in
kpatch_regenerate_special_section() will already take care of including any
bug_frame element group that references a function that has changed.

This should be a non functional change in the payload generated by
create-diff-object, but needs doing so that we can take into account changes to
.altinstructions and .ex_table sections themselves without unnecessarily also
pulling .bug_frame sections.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 create-diff-object.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/create-diff-object.c b/create-diff-object.c
index f4e4da063d0a..d1b1477be1cd 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1284,6 +1284,17 @@ static void kpatch_regenerate_special_section(struct kpatch_elf *kelf,
 		}
 	}
 
+	/*
+	 * For bug_frame sections don't care if the section itself or the
+	 * relocations have changed, as any change in the bug_frames will be
+	 * accompanied by a change in the caller function text, as the
+	 * BUG_INSTR will have a different placement in the caller.
+	 */
+	if (!strncmp(special->name, ".bug_frames.", strlen(".bug_frames."))) {
+		sec->status = SAME;
+		sec->base->status = SAME;
+	}
+
 	for ( ; src_offset < sec->base->sh.sh_size; src_offset += group_size) {
 
 		group_size = special->group_size(kelf, src_offset);
-- 
2.44.0


