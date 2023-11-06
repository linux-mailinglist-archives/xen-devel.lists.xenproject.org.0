Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4217E2820
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628134.979260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AE-0008Mz-TC; Mon, 06 Nov 2023 15:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628134.979260; Mon, 06 Nov 2023 15:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AE-0008JB-Og; Mon, 06 Nov 2023 15:05:18 +0000
Received: by outflank-mailman (input) for mailman id 628134;
 Mon, 06 Nov 2023 15:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r01AD-000893-1F
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:05:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e43a4f46-7cb5-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 16:05:15 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40850b244beso35235505e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:05:15 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0040776008abdsm12507392wmo.40.2023.11.06.07.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 07:05:14 -0800 (PST)
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
X-Inumbo-ID: e43a4f46-7cb5-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699283115; x=1699887915; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bWTMrd0hqyfKgRpoolH0LkMWSKATEK93JdgDRPa6nY=;
        b=KcOLb2EuKe8AfUg1uUOfXEXDUF8n22rFQ+2cQ94EDWlxhFh0+f9wxykLIsLbwV6hxz
         BNH323jCnxULB+I0BkZqI1lHQu7OFW74cDCsD0jKJ9QuIboORVPYhEWTtmV9KMz0Cqiu
         woD/pV/4aAcdZHcR6ML3o+sp+INsAPu0D/TYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283115; x=1699887915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bWTMrd0hqyfKgRpoolH0LkMWSKATEK93JdgDRPa6nY=;
        b=CRmR9WFxyvjofpzIsRVxdjEEaZpky/PvqSMRCoowhMSOPA5tJXbUGGqEOl6GnDm3eD
         nmcpPazYe+oOAPf3k39DmgpZ4w5cuDSCYQ4gZVA63+AP4dSL0ESeu6o1MZ6/uHQUo70o
         XPc8nSElA1ttPcpiQwYnD2OEsqqAojhGRi7bRStkM8T5NM8ETw1jHbJhSql7CT2QfwPW
         JL/fqKM2Se3c4b9UpaOa5cCKCdNfEEp5wP8REg8xj8ZdNzp5sQet8pRWBPwp8KUffnNf
         hVngp5IU2uLcQIF8Mkvn6llyaN7NLH8xiQqQ/xmgmE5ch6uTj4G7q+UgY1x54cVtH64w
         TDRw==
X-Gm-Message-State: AOJu0YxP6WJkvSD+Yw5At7iBeVy1BEvH+DF+UTZmGAOUsjdToYAEUJ5o
	JEOKhHBhMzRDk8WcxrhqVLlgiH4mkL6QxMyyZQw=
X-Google-Smtp-Source: AGHT+IE65AVWleH4U/Zc+SQDhA16L/LXkoWcrwzeBuSOUVeWDJlO6PAtQaDAVcEGIYTbLkXxOoJSpg==
X-Received: by 2002:a05:600c:1988:b0:409:19a0:d26f with SMTP id t8-20020a05600c198800b0040919a0d26fmr24529964wmq.23.1699283114818;
        Mon, 06 Nov 2023 07:05:14 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/6] tools/pygrub: Restrict depriv operation with RLIMIT_AS
Date: Mon,  6 Nov 2023 15:05:05 +0000
Message-Id: <20231106150508.22665-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevents the depriv pygrub from consuming more than a fixed amount of
memory.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/pygrub/src/pygrub | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index 327cf51774..b96bdfd849 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -39,6 +39,11 @@ SECTOR_SIZE = 512
 # pygrub
 LIMIT_FSIZE = 128 << 20
 
+# Unless provided through the env variable PYGRUB_MAX_RAM_USAGE_MB, then
+# this is the maximum amount of memory allowed to be used by the depriv
+# pygrub.
+LIMIT_AS = 2 * LIMIT_FSIZE
+
 CLONE_NEWNS = 0x00020000 # mount namespace
 CLONE_NEWNET = 0x40000000 # network namespace
 CLONE_NEWIPC = 0x08000000 # IPC namespace
@@ -75,6 +80,11 @@ def downgrade_rlimits():
     resource.setrlimit(resource.RLIMIT_CORE,     (0, 0))
     resource.setrlimit(resource.RLIMIT_MEMLOCK,  (0, 0))
 
+    max_ram_usage = LIMIT_AS
+    if "PYGRUB_MAX_RAM_USAGE_MB" in os.environ.keys():
+        max_ram_usage = int(os.environ["PYGRUB_MAX_RAM_USAGE_MB"]) << 20
+    resource.setrlimit(resource.RLIMIT_AS,  (max_ram_usage, max_ram_usage))
+
     # py2's resource module doesn't know about resource.RLIMIT_MSGQUEUE
     #
     # TODO: Use resource.RLIMIT_MSGQUEUE after python2 is deprecated
-- 
2.34.1


