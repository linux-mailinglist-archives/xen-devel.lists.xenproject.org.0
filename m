Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F1694956
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494617.764820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHY-0003op-PQ; Mon, 13 Feb 2023 14:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494617.764820; Mon, 13 Feb 2023 14:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHY-0003io-HC; Mon, 13 Feb 2023 14:58:16 +0000
Received: by outflank-mailman (input) for mailman id 494617;
 Mon, 13 Feb 2023 14:58:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHW-00012P-Lk
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:14 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6ef06c8-abae-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:58:13 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id s11so5549253edd.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:58:13 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:58:13 -0800 (PST)
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
X-Inumbo-ID: d6ef06c8-abae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy9MxG42u4Nv2Kmf3LwoFoiWXt3O4JC+9pElyhn6lpo=;
        b=g1GhuG7H3AgAo9I6Y1zdnMtEETZeI+HeHhmx99n/fL0O5qNoMAKeKwh7SzcG5XeR80
         ueYyHZx+ACWlx/FAa0jzJszlhNfrp61mgSapkQQgmQquZd8d33yBWw/twVDeBygdT4bf
         aS5MwAz1Y0l+gsOX5QzNWbtghjofy5Y549nK+mJHghFjnaUj4KMid5fjGgiHNBPMdfMa
         G4rk9LtJfht9pgMmF5KaMh+9c4kDqdn79hP/cYG691ES2z3XN4U7Fcc5fVUkAnfdmepL
         /2sPbV3otOOKGJWF2bFi8zP7sfXIzUhlm/fz6yrFyXyqHMFlAxyVtVOkJppDRkptfvyL
         2XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy9MxG42u4Nv2Kmf3LwoFoiWXt3O4JC+9pElyhn6lpo=;
        b=6bBm3S6JgWzMgFtK6hj/ktk8+NsX+mxmz/SYuDjJ118NNQ5umFdvxLozS1Q8E+pmLD
         4kgbIdMo8yUIQr225gVREQeJRNfKE6sDyrXdLD+IDR0wBGloOZz2kO9M434j4/rjiGTf
         S6bBmjwXOYafzo7h3F3zXsfN2gghFxC5xdpAakfEos97ScEiGCPpf+wfGp9kpMmNDqCP
         UrfcEcCVXWEm+0PBZi2sA1R8OYjpZJXaeVJI4u7CjkYYyuRzbRoIF5ZWKqMOOpJ9f4j9
         uwOByv7yX2Lf6t9zI4TiFeMXi7FEboSW2ZsPJxrq5fmKQQ0PahytwZoRDWam4SwsonDu
         RNOg==
X-Gm-Message-State: AO0yUKV4CabVj+Ab0hvys1tZyCkZVoVhGrRX8s/NXnxe7yJB72X4i/BZ
	DcdGtKVo1XhlG6z88qFCyXqUnHlb+HU=
X-Google-Smtp-Source: AK7set/sApjHPPTP1O6/z1JAvOV1iMnOSIJgco5nBsKflB+rmX5HgDRq3yl+57+4mm7+OY4MuOWzww==
X-Received: by 2002:a50:874a:0:b0:4ab:f6c:1a47 with SMTP id 10-20020a50874a000000b004ab0f6c1a47mr19075094edv.31.1676300293281;
        Mon, 13 Feb 2023 06:58:13 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 09/10] x86/ioreq: guard VIO_realmode_completion with INTEL_VMX
Date: Mon, 13 Feb 2023 16:57:50 +0200
Message-Id: <20230213145751.1047236-10-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VIO_realmode_completion is specific to vmx realmode, so guard the completion
handling code with INTEL_VMX.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/hvm/ioreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 0bdcca1e1a..1b0c0f1b12 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -44,6 +44,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
 {
     switch ( completion )
     {
+#ifdef CONFIG_INTEL_VMX
     case VIO_realmode_completion:
     {
         struct hvm_emulate_ctxt ctxt;
@@ -54,6 +55,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
 
         break;
     }
+#endif
 
     default:
         ASSERT_UNREACHABLE();
-- 
2.37.2


