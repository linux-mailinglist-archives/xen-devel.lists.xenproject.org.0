Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31625B2592B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 03:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080523.1440902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umMtx-0007Pu-KK; Thu, 14 Aug 2025 01:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080523.1440902; Thu, 14 Aug 2025 01:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umMtx-0007NY-Gc; Thu, 14 Aug 2025 01:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1080523;
 Thu, 14 Aug 2025 01:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7ku=22=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1umMtw-0006vN-52
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 01:37:08 +0000
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [2607:f8b0:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3002a262-78af-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 03:37:07 +0200 (CEST)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3e56ff95838so346165ab.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 18:37:07 -0700 (PDT)
Received: from kf-m2g5.. ([2607:fb91:1183:972:ee53:76c5:e875:9619])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-883f198db02sm467297239f.16.2025.08.13.18.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 18:37:05 -0700 (PDT)
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
X-Inumbo-ID: 3002a262-78af-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755135426; x=1755740226; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSq1DluxhGuJdHCz8UHBJovQfitqDO0ftgOR0z6jXHw=;
        b=ZacKDZ314n1sjjPayVIst8TYgZmSjwpf0P+4ur05pin4+DN3zUgvxQ2KwfRNe232T3
         yUs2xcv7xcQmQojkQBkCsqEuyGAwLWpqd3eQaHwNI+Np12skSt4jbtP9uXggSkzR2/CT
         RCnbrNPWRVZihfI/CWJaxT9w+PhWLgTaO9b062Xn2VAyLTXY1zaEv4IX4xqmGkjT9FnN
         5mG3AXdv3+cITqV3UasWJDAJnQDs1U02dU2TcDI6Uni03YA+kh0tTFheK8auZcqIbwnb
         hb9dGZgbYsZ01CEkDIHu9DAgj2Jniye9FtAWIhw6z58wA+n1OQVFVUGMC8ZG4j2YpJye
         XHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755135426; x=1755740226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSq1DluxhGuJdHCz8UHBJovQfitqDO0ftgOR0z6jXHw=;
        b=sW5ytnuC+t7uFwKk+AM2UDnCNe2grEl5rqqswZE3qUuJi4G39yb+DV5Pahev8Wg0Jq
         xvQbsp5WHceQKNFMQIRil09Ojq+izrWf+t6NMWccemJOsMlSpx42exgASCZINuidUfD4
         msPQnrI3MDfcyOgIpMRP83zOb3AOhkQoNdEQ+cmsinOTd6g3dwXaBXeBpa8ETNB3V1Hc
         NCZuSeNVqOwNf5GL8Pxui3EIrlDVeFnCV3AmXGDTYJAkQSj1dWpew71AM3SKwOQqy3ay
         Dr2YJlc3BU8skGmhbz83ex6JtghKjGASYUEdF1cY9YwrlsY+syg4pVjfPaBdVONFGM5g
         uG2A==
X-Forwarded-Encrypted: i=1; AJvYcCV/o0OpL9t/PecLiuT2l8gpJtwTTFDS57RF+frksVlCc8xt5EnjNv37dhEFeGfrJf8PwatMBxAsZZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOkpHZhpMFlE9XLHqOE5JfAXOu1It2KUG9H9cDrVPUkCFHbspN
	3GQCcw2BC+Ce4hAq87s5YXznKPa85iM7xl7Np/9L74c7BzQK9GA8mEJ9
X-Gm-Gg: ASbGncujX46dNYes+AsSfFstaiPkG1mYNyVUI60Rl43mUgeO9syNsBjhV1I1GhTVUZL
	4/JMuti+1bmuHvWwTLS/Lyrwvw6zFgxsFGzy8nC5p79i7mPrWLcujAMZ63wIBD1e+ntw3Qxm1Bi
	r2CsVPDowSKopwWsGHttiE6cjHRSNbPrN2hhCrxrHbXqWyHM6NbCxyMBacCeLOjFQwsyE3N7bjz
	VTQeus9jfjFz9XdgKbf/YdFLOdSnRaqoc86dCqlTyyHI2umI6Pu/Vvo6tKgiv6CiQR/FKzg7Cri
	fO/hXs6GhhpSeVXQPZJjy4jK9gT2kW8+50eD1bTouG4Tan8HVHGkFQi9TRk/ZQLeaoBzI0w+7/S
	ncwWzmW3kD2g7oabbO2BTSw==
X-Google-Smtp-Source: AGHT+IFXjpZLwIfry/EvzV7zQJCVKPxqe3UBzCy2m+yVfvZMxryZK8LOfJBC9UMmreq4Du/PO0zpew==
X-Received: by 2002:a05:6602:2dc9:b0:85d:9793:e0d8 with SMTP id ca18e2360f4ac-884334e045emr80901939f.0.1755135426238;
        Wed, 13 Aug 2025 18:37:06 -0700 (PDT)
From: arraybolt3@gmail.com
To: grub-devel@gnu.org,
	xen-devel@lists.xenproject.org
Cc: Aaron Rainbolt <arraybolt3@gmail.com>
Subject: [PATCH v5 2/3] include/xen: Add warning comment for cmd_line
Date: Wed, 13 Aug 2025 20:36:44 -0500
Message-ID: <20250814013645.2488043-3-arraybolt3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814013645.2488043-1-arraybolt3@gmail.com>
References: <20250814013645.2488043-1-arraybolt3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aaron Rainbolt <arraybolt3@gmail.com>

The cmd_line field of the start_info struct is not guaranteed to be
NUL-terminated, even though it is intended to contain a NUL-terminated
string. Add a warning about this in a comment so future consumers of
this field know to check it for a NUL terminator before using it.

Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>
---
 include/xen/xen.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/xen/xen.h b/include/xen/xen.h
index fdf0fc4..16f3fd7 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -823,6 +823,11 @@ struct start_info {
                                 /* (PFN of pre-loaded module if           */
                                 /*  SIF_MOD_START_PFN set in flags).      */
     unsigned long mod_len;      /* Size (bytes) of pre-loaded module.     */
+    /* 
+     * cmd_line will contain a NUL-termianted string if it contains valid
+     * data, but it MAY be invalid and not contain a NUL byte at all. Code
+     * that accesses cmd_line MUST NOT assume it is NUL-terminated.
+     */
 #define GRUB_XEN_MAX_GUEST_CMDLINE 1024
     int8_t cmd_line[GRUB_XEN_MAX_GUEST_CMDLINE];
     /* The pfn range here covers both page table and p->m table frames.   */
-- 
2.50.1


