Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579FF918382
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749018.1157071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA8-0003O2-JL; Wed, 26 Jun 2024 13:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749018.1157071; Wed, 26 Jun 2024 13:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA8-0003IP-7N; Wed, 26 Jun 2024 13:58:16 +0000
Received: by outflank-mailman (input) for mailman id 749018;
 Wed, 26 Jun 2024 13:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTA5-0000af-O4
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:13 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ffabbd8-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:58:12 +0200 (CEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6f855b2499cso3591964a34.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:12 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:10 -0700 (PDT)
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
X-Inumbo-ID: 1ffabbd8-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410291; x=1720015091; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNXebvkx1B3kPnk1v4QIpuUImYj6FwSyktzAJ/iZD9E=;
        b=GIvlIpDGcvMZSx7J6k2ZpG3O1lpc71ItbHGp24k3C+qUDO3zo3yTOWAHySwzvcLIny
         fcV+M8CJK+QCEdsUAveSJKMsxYsFpeUCAdcGJbVRoEEuJnbI/KUER3peHuGImo8H5FFg
         Hd0FTelINn3FQKbjYpBsM9Y5suTiVRmQ+jix4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410291; x=1720015091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNXebvkx1B3kPnk1v4QIpuUImYj6FwSyktzAJ/iZD9E=;
        b=r/lSUiEvrbwuRB5x3sQkF7MERwGcW4KdN4toJK19K65JLR8ZM5Oh7hqw6fIYR32JVS
         sgF8FPjqjvB5mrCosiaGPCj0zGdQr6oNp9bAr5holgEn0im9mfAbmwDe6wDiQgmZqF7z
         EgUekczEFMkdRtEUdU426WJkS3R96yMqB0kZGqvM6cLjHpV2ae1CGyouZ1kKEzKf0ttt
         STwMS2aAgR558mSSQuDsej00ai2n83EZFi+od08YBfLy/EWAyZ1tPSu7Nuc4qqhd49Mo
         /y3iSrsrzcJVGp6wUr+2UYX+8kyjsBmJM+kLPiBhAbP4p74JdFLkxMp/d4uktKSJN/wq
         Xm8g==
X-Gm-Message-State: AOJu0YwkL6DxBzn+g8q7fkiiVD7YR745IxZuKY5jNSUT2OY518IbN/Oa
	gDolJouFAcxYrseU7y0B775G8vAUX7Lk8M0sa9rrL0CzosSnQaYVe5iML5Yv4Lk0dOe730Zi3CW
	r6lA=
X-Google-Smtp-Source: AGHT+IEe5R8IsPa1WFXgoNQbI1tAaCHrwm2edK3lw3vpBp5ucsDlcV6zDqyFqTDgn390po2VCa/vVw==
X-Received: by 2002:a05:6830:4108:b0:6fa:11aa:e929 with SMTP id 46e09a7af769-700b11d614emr13128067a34.11.1719410290845;
        Wed, 26 Jun 2024 06:58:10 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 10/14] xenalyze: Quiet warnings about VMEXIT_IOIO
Date: Wed, 26 Jun 2024 14:38:49 +0100
Message-Id: <20240626133853.4150731-11-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a general issue with both PIO and MMIO reads (as detailed in
the comment); do a work-around for now.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 tools/xentrace/xenalyze.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 19b99dc66d..eb0e60e6ef 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -4650,6 +4650,24 @@ void hvm_generic_postprocess(struct hvm_data *h)
             case VMEXIT_EXCEPTION_AC:
             case VMEXIT_EXCEPTION_UD:
                 return;
+            case VMEXIT_IOIO:
+                /*
+                 * FIXME: Both IO and MMIO reads which have gone out
+                 * to the emulator and back typically have the
+                 * [mm]io_assist trace happen on resume, just before
+                 * the subsequent VMENTRY.
+                 *
+                 * However, when a VM has blocked, we call
+                 * hvm_vmexit_close() when it becomes RUNNABLE again,
+                 * rather than when it actually runs again; meaning
+                 * that when hvm_vmexit_close() is called, no HVM
+                 * handler has been seen.
+                 *
+                 * What we really need is some sort of intermediate
+                 * state for [mm]io reads; but for now just ignore
+                 * VMEXIT_IOIO exits without a handler.
+                 */
+                return;
             default:
                 break;
             }
-- 
2.25.1


