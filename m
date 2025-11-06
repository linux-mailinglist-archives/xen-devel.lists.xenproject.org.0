Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4E0C3C35E
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 16:59:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157082.1486008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2Of-0007w0-4p; Thu, 06 Nov 2025 15:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157082.1486008; Thu, 06 Nov 2025 15:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2Of-0007su-01; Thu, 06 Nov 2025 15:59:37 +0000
Received: by outflank-mailman (input) for mailman id 1157082;
 Thu, 06 Nov 2025 15:58:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFS0=5O=suse.com=marco.crivellari@srs-se1.protection.inumbo.net>)
 id 1vH2Nn-0007GJ-TU
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 15:58:43 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f526fc-bb29-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 16:58:43 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477632d9326so7423455e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 07:58:43 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb403793sm5758966f8f.2.2025.11.06.07.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 07:58:42 -0800 (PST)
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
X-Inumbo-ID: 77f526fc-bb29-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762444722; x=1763049522; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53hexOkYyaqxhpOSn/nthNa2oVXwHIV4I+WyLFdMY9Y=;
        b=GrExudEKTjVcSpD+t1lJjHTK1UeHot11WbVvaxfJkMuEqebi2lFr6i88M+Fuhq2u3l
         GdOsFAW0YS+L3zhtTfEItSDslWub/+cVoe2MP8fY1GsorpKyHfXgEj9gfWH62i//xTqv
         MFrfNLrtueaEDSnrGhja8FI0X3BE+8n0PfOR6I2XuUrPGCvdegl4SwCP/1putRS6R9PX
         k3SiAdIYpv+3yo4LYozqYWJZPXqsfQk60xQfQOyNZVP1ZsKNGjCTXOgvRFl2nbFb5PO7
         FVOnIKhf8dWOOMGGv2Xw3uDIA2fnz8bUiBpPM5a231ga2GlqXaBjEvRffQoRGF12nJud
         A9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762444722; x=1763049522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53hexOkYyaqxhpOSn/nthNa2oVXwHIV4I+WyLFdMY9Y=;
        b=byUTyAS2TWyXgRNsTBEIUnzfCrZ3Ec76PlgPgneejeRHi1NjC1y1XWbP6MA95hJSkm
         GiCp4PBDRrlXDhM+fbRToIqdrbjW9SniMEHzBlq+UzUhQVRR7MgsbfpUz5sTMxTxKP09
         5nI0iyetpo+wLvnvZUjHoT4oMHeAINfLNV3ZJHNmLDS8o2f0miCn5LpqBGsFNPOB3wIf
         p6HK8pu8z1yf9pwwCZj9I0yXidWCLRa4OqPGgzxHZej6/Vtu54425v2O0FsEzq+9j+jl
         PZHONEcTX/yfJqWloEIT1qK7cNiebWxQfNGVfnz3nOrmYmhz/qzrvRHxK0d8C3orOxtv
         I6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV71w7wMxOGBDPFt4NLSuS8loVsN8IE7IbIB+hP/6JHQCsOCAIjAbjOVQ9hhTxsNtVAFF53KvFrByo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJnhSI1LpeElDQR6AFgiKZNya6fMMfsoSd1ghHLmCpTQu5ICwQ
	Oy71/b16WPbG9GZLS2vnlJrv38cpelBwY+Y3eg+ndJz5pasYE3Mx/vQmC+Jw+dM+KwE=
X-Gm-Gg: ASbGncuddznOT6asuI2Z3JVBMWfFnEZz5dPlUwzhEYhDP9fKNXdfMseelbBtG+7bR7i
	IxDt8l0H28fTsIUDOqa3W3Uu+q1zP41R7f6O5jkQ2PkwXWRn1O5V3fSizYr8HO9Km/e5We7xl+M
	9Hl8u/xB+gedNxTwXqu/7rZ8wStVwUzOaKuSBgPDskYmqi6FuAtdhPe3kqHYfBv5X2TrytWBPJk
	uz/yos337a9oiWYgti5A9qqJpAYlmwbREnhyi+v930jDfhMOIXuzYX7wkARszMRWeOCydBJWW2U
	HittJUABY0/WqZ9dLqhD4rFbGrnNR3LJTiIXu9WWOTO7Od2Yp5nRCwXuubJPFpfK5GvhNk5Ims1
	deR7b6+N17THU2gEcBIX8maBPIfAT9fT60vRxSUD96fj+Yr10LOxgL3Ac4IItMuC1VQW1tmSaaE
	aO8RGeFoXPqOCnJR22NnYm18Y=
X-Google-Smtp-Source: AGHT+IGsuM3JnBRPrLDis+cGJhcRI2m6z7HtbWMdfo50tweopR7jN9KNvup76xnxqkeK15q0yW/MHQ==
X-Received: by 2002:a05:600c:4e13:b0:475:dd53:6c06 with SMTP id 5b1f17b1804b1-4775ce3b380mr76738075e9.40.1762444722455;
        Thu, 06 Nov 2025 07:58:42 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH 2/2] xen: privcmd: WQ_PERCPU added to alloc_workqueue users
Date: Thu,  6 Nov 2025 16:58:31 +0100
Message-ID: <20251106155831.306248-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106155831.306248-1-marco.crivellari@suse.com>
References: <20251106155831.306248-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistentcy cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request alloc_workqueue()
to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/xen/privcmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index f52a457b302d..402be080ad2c 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -1091,7 +1091,8 @@ static long privcmd_ioctl_irqfd(struct file *file, void __user *udata)
 
 static int privcmd_irqfd_init(void)
 {
-	irqfd_cleanup_wq = alloc_workqueue("privcmd-irqfd-cleanup", 0, 0);
+	irqfd_cleanup_wq = alloc_workqueue("privcmd-irqfd-cleanup", WQ_PERCPU,
+					   0);
 	if (!irqfd_cleanup_wq)
 		return -ENOMEM;
 
-- 
2.51.1


