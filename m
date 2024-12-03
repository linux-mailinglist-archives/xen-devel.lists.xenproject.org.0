Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB09E1793
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847603.1262691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPEs-0001KI-39; Tue, 03 Dec 2024 09:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847603.1262691; Tue, 03 Dec 2024 09:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPEs-0001IQ-0N; Tue, 03 Dec 2024 09:30:38 +0000
Received: by outflank-mailman (input) for mailman id 847603;
 Tue, 03 Dec 2024 09:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzh2=S4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tIP76-0003Be-Dv
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:22:36 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21da1635-b158-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:22:35 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so314164266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 01:22:35 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d0bfa327dcsm4180475a12.83.2024.12.03.01.22.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Dec 2024 01:22:34 -0800 (PST)
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
X-Inumbo-ID: 21da1635-b158-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733217755; x=1733822555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLnillY0LwsA1bGIi96aGqNPMbJhHjhH+14EVXV96qM=;
        b=imUrguuRYGI3zY/PgAsSHrinryfCiJPIe6JSAI8oiLSlJC4i6U5ztiCxdXXQ6XziCB
         IVeR1KxT4Lta81ACKhd4Or0zKrVhrrDcESZFVL5iVwFoxgyBIHtrdQ8nk55LDYDws6nT
         t9+WRoshGfzJqOfHbO00G9Xm/ncH41f9JFeZDKWx2UIp038HBihIcig9aHCS41hxYGdW
         XIP/cs7Rj86WodLnZKlDX2zYGVd7gGv2jCcSjfBU+RZ1NipfsYONHLlaAv5cJ5SDqJgc
         hmmkC1Ondvc9mrgWEL8GbHqYjHkJj8ryboz6y7FsrMCpjXCODJA9wui1XG1D/hN3sIkK
         G5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733217755; x=1733822555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLnillY0LwsA1bGIi96aGqNPMbJhHjhH+14EVXV96qM=;
        b=c1GzdnUDRe9OvjBVzFv4yR3KLCg4lPlSFbt8tmiRGhS9bQGHonDAWNgw8MYPdaQP6p
         fOknaKwztq1U9U59Q7b0Zmh3HcPVZL079NisYmWSoXFMFhSDuz9kiGXh9JCOWgNuBYHR
         nudvfKrYHYOAm8gAgqsX7Ooe4OTNrfdvunu7CePbvO5pZ2FF8ENWGgftWTLvW1NI+2lK
         MDvPQvTBf/463iwUXwhGO5SCNIgMO7YHe+qymSfA9ReIx2HWPnELU7Bzf+nmuyJ2bmSC
         uViTy7e/KAyChJahbHsvE1dYM6hnymk7DwcgXKJgmy4yQsGHizGns2k0qcdPkmMgyKlY
         6QWw==
X-Forwarded-Encrypted: i=1; AJvYcCWxoqJfyQU44bbDN4HILYiqmxj9ixm4K39M/hwARfByN/xNcfornrykPAXtTLItJqTBR434UZN+MPU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3hsrnQpMXYX+Da6/p9FP6BMDSpoNMSIFA8juAsBiqUr/7t0ld
	lvvW6K6tSdxK7wqGjTaFAIQyCC9yROfWlgCCQMEYztl6h4G8aiK9wuCj40Ompmw=
X-Gm-Gg: ASbGncuec356kjmDZnhHJPf2vJTR9a4BkUwcbXSMEB8Ki+Au13xDkpVNEaD6jxGpSMo
	cfPZg9To7o84vwLVB0vQ9A3x0cXPNLzSCq0NYpuOPUvpIiVkL28plyAD0/M54VWss24pcExdIiS
	1Q2JHjIsQPG+sPnNURr5KNYdCJr27uPgGi6hbldOxE7HHjNUqqDD3Y9z+bRWBk29GhMB0dpOp7M
	fAmPT03hYU5tZbRWbwkoHlUI9sWb6gFcPXdxmVjCBlwrmtUHvnXYAk15+QyKA2qzihSwnUc
X-Google-Smtp-Source: AGHT+IF5ZHDt63zdyXLW6Zs/Jp904vDaPlOUCO3dMRciku/OnWILf9UyYpg15w7m7vgh9JrGFnoyKA==
X-Received: by 2002:a05:6402:34d5:b0:5d0:e9b7:170c with SMTP id 4fb4d7f45d1cf-5d10cb5c39fmr1604224a12.18.1733217755400;
        Tue, 03 Dec 2024 01:22:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/7] qemu-options: Remove mentions of legacy '-machine foo,accel=bar'
Date: Tue,  3 Dec 2024 10:21:53 +0100
Message-ID: <20241203092153.60590-8-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203092153.60590-1-philmd@linaro.org>
References: <20241203092153.60590-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
options") we prefer the '-accel bar' command line option.

The new form started to be documented in commit 8d4e9146b35 ("tcg:
add options for enabling MTTCG"); it is safe to remove the mentions
of the legacy option.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qemu-options.hx | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index dacc9790a4b..11f0aab1470 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -27,8 +27,6 @@ ERST
 DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "-machine [type=]name[,prop[=value][,...]]\n"
     "                selects emulated machine ('-machine help' for list)\n"
-    "                property accel=accel1[:accel2[:...]] selects accelerator\n"
-    "                supported accelerators are kvm, xen, hvf, nvmm, whpx or tcg (default: tcg)\n"
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
@@ -59,13 +57,6 @@ SRST
 
     Supported machine properties are:
 
-    ``accel=accels1[:accels2[:...]]``
-        This is used to enable an accelerator. Depending on the target
-        architecture, kvm, xen, hvf, nvmm, whpx or tcg can be available.
-        By default, tcg is used. If there is more than one accelerator
-        specified, the next one is used if the previous one fails to
-        initialize.
-
     ``vmport=on|off|auto``
         Enables emulation of VMWare IO port, for vmmouse etc. auto says
         to select the value based on accel and i8042. For accel=xen or
-- 
2.45.2


