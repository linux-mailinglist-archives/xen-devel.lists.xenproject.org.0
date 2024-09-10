Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8F972707
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 04:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794953.1203997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snqKb-0001Ab-Bu; Tue, 10 Sep 2024 02:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794953.1203997; Tue, 10 Sep 2024 02:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snqKb-00018I-8y; Tue, 10 Sep 2024 02:10:13 +0000
Received: by outflank-mailman (input) for mailman id 794953;
 Tue, 10 Sep 2024 02:10:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jNQg=QI=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1snqKa-00018C-7u
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 02:10:12 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd583dd6-6f19-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 04:10:08 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-45826431d4bso13995341cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 19:10:08 -0700 (PDT)
Received: from shine.lan
 (216-15-0-36.s8994.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [216.15.0.36]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45822f6097fsm25377241cf.63.2024.09.09.19.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 19:10:06 -0700 (PDT)
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
X-Inumbo-ID: cd583dd6-6f19-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725934207; x=1726539007; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUxVq/uYkeEKFMBzDLEyObgx5MyTJN7izveNlmy8shU=;
        b=AVGZf8ygTAbHLYV50792WwPPHBNkWnDdpEpaKLZNWe5P43vcUy4G7fPjJ0GuppK+RI
         MP1e2LGU985+IUzSd/0QlWqGmV5oRxLgenWsJn7yVm5IcxEe99Ll8gUp3CMiNb3mNET/
         MZStTep7e48jJIB3rTMM4TOw8gGLKKuwJ1V5NJUSj9aYeHeXDz8GLy2kIy4AzY878zio
         4TwPArMw9jeuycLD7ei6FBZXhIl1LWsODbrcTsYBs9QbuiCfxhQSYJnK2q81dhJmJrWv
         IQyZHftWMfyHtKgtwBxZ359zlpxZUPtvEDC0dqenVQq+aW4x7BFzOFL8KhtbayWXxPVI
         hhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725934207; x=1726539007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUxVq/uYkeEKFMBzDLEyObgx5MyTJN7izveNlmy8shU=;
        b=jvprEkZP3UB6uLXquDBgFKESiiZWjQ4NrR66wpiywHb92Ir79S1tVwPPKJKJ4KUa5c
         HPEGwOSH8OFXXkCmONwMz6UDUxCl2BAcVZYH3BLhDPhiBK7xXYPAhfvgGHn9sl4e7gtg
         jcb1qcAslFATF+AfdGCMd2EqhQMz4W1+vEhiiQEzvCGwPa6nx05/UEZsVkeWM4Lu42SJ
         p0tNJIJPm0r+afY9ZjuIAxNOuwr0A0SsOPPem98xtkWKQwQ4ofLJQ9nQYEFkssiTLmto
         pyMa78v828IcCXtZGS92aYLAMNzfMzKOOIinvEPROezKOIHnRiZ+kyCrCMVWrySStvZz
         GZHw==
X-Gm-Message-State: AOJu0YxjznGrPH0WmF94rDPEZcdMKeTekBndFywRKsyQCUOySp5Sv4fJ
	TfsflF82S8b27+pUjkegNXAdqemu7/ZljCqvu3MPO6iYpPFCv/uo
X-Google-Smtp-Source: AGHT+IGmeDSS1xPUmyjEW8yUJFMAPO/V2CCsh6Yw95JK0OmbyicAdVkM/O8FfObtrVcamHw/ybV/0Q==
X-Received: by 2002:a05:622a:144c:b0:457:c776:e350 with SMTP id d75a77b69052e-4580c75a11dmr124180981cf.46.1725934207271;
        Mon, 09 Sep 2024 19:10:07 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>,
	Arthur Borsboom <arthurborsboom@gmail.com>,
	stable@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
Date: Mon,  9 Sep 2024 22:09:16 -0400
Message-ID: <20240910020919.5757-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

Probing xen-fbfront faults in video_is_primary_device().  The passed-in
struct device is NULL since xen-fbfront doesn't assign it and the
memory is kzalloc()-ed.  Assign fb_info->device to avoid this.

This was exposed by the conversion of fb_is_primary_device() to
video_is_primary_device() which dropped a NULL check for struct device.

Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
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


