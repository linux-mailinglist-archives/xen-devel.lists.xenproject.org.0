Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E11CF970285
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 15:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792269.1202230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smvnq-0000Hb-Kc; Sat, 07 Sep 2024 13:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792269.1202230; Sat, 07 Sep 2024 13:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smvnq-0000Ek-HW; Sat, 07 Sep 2024 13:48:38 +0000
Received: by outflank-mailman (input) for mailman id 792269;
 Sat, 07 Sep 2024 13:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AxRZ=QF=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1smvnp-0000Ee-CH
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2024 13:48:37 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e02fdc70-6d1f-11ef-99a1-01e77a169b0f;
 Sat, 07 Sep 2024 15:48:35 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4581923a808so10778991cf.1
 for <xen-devel@lists.xenproject.org>; Sat, 07 Sep 2024 06:48:35 -0700 (PDT)
Received: from shine.lan
 (216-15-0-36.s8994.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [216.15.0.36]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45822e655e1sm4447541cf.16.2024.09.07.06.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 06:48:32 -0700 (PDT)
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
X-Inumbo-ID: e02fdc70-6d1f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725716914; x=1726321714; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fS/OA3BsrI6pzbMDPFKPV5GdDCe3zSgljORI2lN/SEo=;
        b=YKjcE8gF/LJeM4V+0cTcf0va3OuASsgz1aO7YOhxKUN0lSE6uCHzJnHGuT6fSFbboC
         UmYall9DXlnTnv7B2d85+mKz/lqKgd2OBh2WRuiDOiJ0TWHnCMn0vMtFElxsCTCeMN9V
         HQTsxY2VnSw7sEyjge9Y4cipbVBcvoVAqSWXM49ALyY1SKgMTmt7EtLE/UWqQrk8lxFo
         VUYv08UnMXaGfXeKPlQdakTEPNtIXW7jvKU2tjLzXdLquWEcD9dxSsPhx1JfBvpAuSiD
         oRlLDKrjWmKhldsV9NJK7JT6iyJu9PvY85NUOPdur/o8GFPBz7P2pW55HMZKz1eUpyZg
         mXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725716914; x=1726321714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fS/OA3BsrI6pzbMDPFKPV5GdDCe3zSgljORI2lN/SEo=;
        b=lZwaxCi02ynsSKGZeBW4ZBIgc2EfD+LZ0hfMy0RoWI1YH59q+BvTB9E1KMAd6/d/bn
         L2wcrUKmRX23d1Ad4a1ypdUPzfW/0tiMcVN6tpa2iZc3hxCZKKLgGnEuPasjHoMgx4pz
         lq8/M0ibLBgwLIAfPl8VhYmbjm/jomf5EH60AemPbrH2MMXC8hdNKOWThluYhf60UBLm
         b9v71rQcUGlGAyeYMlyxJkGLDtVY0FlIiUFnM/iB9Bi6AvB1HdAXNXwKsW/zcUMbXNH4
         UPJYv976EhzbuH/CVw1ttyoIm+Wxp1GzrtCcMRaoQ4nhHOwxNT12rAtcftMtEVeEHpvV
         DcUA==
X-Forwarded-Encrypted: i=1; AJvYcCUoN9xWRBW75BbAjezHi72AmTgNv6o2ccgY4pok9L299h4uxOrW1veWVklTkv/sI7gXN598+yX4M6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiWcekTccDYov291GAvdRRwtABzWwSnaqm1PeeMiMzQBJ+OvHM
	qgrDro3jhDELTCrKDS/esfNAzPu9QqpjVWeMeGfqINA6vOoUGH5G
X-Google-Smtp-Source: AGHT+IFYAVjViso5yashKI1cy82Ue9rUvQKnhsWtdD2mCfjcDosLzieTwdV0ePLT0+92kcf05IErmg==
X-Received: by 2002:a05:622a:54a:b0:447:e003:ed8f with SMTP id d75a77b69052e-457f8c639b4mr197237141cf.19.1725716913773;
        Sat, 07 Sep 2024 06:48:33 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: arthurborsboom@gmail.com
Cc: oleksandr_andrushchenko@epam.com,
	xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>,
	stable@vger.kernel.org
Subject: [xen_fbfront] - Xen PVH VM: kernel upgrade 6.9.10 > 6.10.7 results in crash
Date: Sat,  7 Sep 2024 09:47:56 -0400
Message-ID: <20240907134756.46949-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com>
References: <CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

Hi Arthur,

Can you give the patch below a try?  If it works, please respond with a
Tested-by.  I'll then submit it with your Reported-by and Tested-by.

Thanks,
Jason

[PATCH] fbdev/xen-fbfront: Assign fb_info->device

Probing xen-fbfront faults in video_is_primary_device().  The passed-in
struct device is NULL since xen-fbfront doesn't assign it and the
memory is kzalloc()-ed.  Assign fb_info->device to avoid this.

This was exposed by the conversion of fb_is_primary_device() to
video_is_primary_device() which dropped a NULL check for struct device.

Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
CC: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
The other option would be to re-instate the NULL check in
video_is_primary_device()
---
 drivers/video/fbdev/xen-fbfront.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 66d4628a96ae..c90f48ebb15e 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -407,6 +407,7 @@ static int xenfb_probe(struct xenbus_device *dev,
 	/* complete the abuse: */
 	fb_info->pseudo_palette = fb_info->par;
 	fb_info->par = info;
+	fb_info->device = &dev->dev;
 
 	fb_info->screen_buffer = info->fb;
 
-- 
2.43.0


