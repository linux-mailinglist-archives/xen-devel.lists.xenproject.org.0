Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA958533C3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 15:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679963.1057761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuCj-0002HP-VV; Tue, 13 Feb 2024 14:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679963.1057761; Tue, 13 Feb 2024 14:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZuCj-0002FI-Sh; Tue, 13 Feb 2024 14:56:13 +0000
Received: by outflank-mailman (input) for mailman id 679963;
 Tue, 13 Feb 2024 14:56:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+jOn=JW=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rZuCi-0002FA-6D
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 14:56:12 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06add267-ca80-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 15:56:11 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-411d5dd7924so772675e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 06:56:11 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c468700b004105528c61fsm12158012wmo.35.2024.02.13.06.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 06:56:09 -0800 (PST)
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
X-Inumbo-ID: 06add267-ca80-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707836170; x=1708440970; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDTkZB2YzDAxv60jxW/Vmfom7fptyEEc7QTL/Z9bmnA=;
        b=JhLOVmhF36zlo0u/ZASQ0UkArLuCZimJyh5Rrlvn4ZqC7dTLYPyIOcwEhflag0tC+3
         7adUKMjLjHzERdbhzb/AGUDAP0gAD7arUDQxpnc7hyMcArYh+Ndx26eHdX336e+5cd6J
         zHgnmSDssR5Shz1HimzjXdS/4LksyllqQm7RQeP24Quht+phSwcozldX82PIWuWeedvF
         WnwJ2AakPm++qGlUMYEzvR6nJD4fnOoZIp+ALjV4SCwHvavAs0b+6zuKZ9VltxMf6G7J
         JX2K4ZEWMfk8Phk9n6NQ997aG0eHEGNQN6tne3L6RGrO3cdfTrWJVuqznfRZSQQYcsmp
         DN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836170; x=1708440970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDTkZB2YzDAxv60jxW/Vmfom7fptyEEc7QTL/Z9bmnA=;
        b=dPWND9szvBFVcMDcmLm3sJ2Fg8HKSF/gcPi0KXES3aPWDjF8NDr0kc3Trd7zrPFvbn
         cjH5FeePZLGP9p0+cFAS8tli+RIcBIBl8vJAZevRJIXxAMfW8ESrgBlRAxjLbSnccCkQ
         feeJ55UXLQSi3iXSKLEe+OQY3bDg00jEgABjSCb1SjJQw4o0Uqj7wVT8QzQrBiUNjasH
         ZnkIT7anzZRZlDNipeThRy+QHzBTNoK6rd5rcDeV1ZCfZRaX/QtDZk83VbwHA17w6Sb/
         Rmz84piQY7q5iFZ92lLiy/r1/Ksls9V7dK/HuilsMKyavcPJdHgBmLqYisalXuVasT9D
         /7ew==
X-Gm-Message-State: AOJu0YydlVY5MwrWCifZ6W28S/69alvsg7ywKFict3UHqn11aSRh0TmX
	e/Gg2WBR/5avvy3TDtiXBmupXGo9kESu+1SeDiSoDry3mvF6iA/bLWkqwDL3uDs=
X-Google-Smtp-Source: AGHT+IFoxvp/vvZFIi4rUaYqQSSRHJrvDLAu1xi6CHM/HjrhE2cuWAeP9FSkLEHBWtXnV7/qItXAfA==
X-Received: by 2002:a05:600c:46c9:b0:410:7980:72a3 with SMTP id q9-20020a05600c46c900b00410798072a3mr7612274wmo.35.1707836170269;
        Tue, 13 Feb 2024 06:56:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUf9ykDLhf1RWA3IqzPhQH2cYKl+8TF1tr1iCOim9kOsMnRpE8ss1yhdVWEv7KlRQzXHyHWI/qIzi+wGkSbNiLYTPKmSq6FvZcZ+U1MpkXwqQbzDxOZbxs9s3+VFS62OIBTDu9DJT4=
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] libxl: Fix comment for LIBXL_HAVE_VMTRACE_BUF_KB
Date: Tue, 13 Feb 2024 14:56:07 +0000
Message-Id: <4ced67935b2e1a2fc79ccda7624c0849bea6cd87.1707836102.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

It's located in libxl_domain_build_info, not libxl_domain_create_info.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f1652b1664..46bc774126 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -519,7 +519,7 @@
 #define LIBXL_HAVE_PHYSINFO_CAP_VMTRACE 1
 
 /*
- * LIBXL_HAVE_VMTRACE_BUF_KB indicates that libxl_domain_create_info has a
+ * LIBXL_HAVE_VMTRACE_BUF_KB indicates that libxl_domain_build_info has a
  * vmtrace_buf_kb parameter, which allows to enable pre-allocation of
  * processor tracing buffers of given size.
  */
-- 
2.34.1


