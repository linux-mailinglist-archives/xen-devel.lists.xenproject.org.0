Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35B67ADC4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 10:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483879.750532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKc3F-0001Vu-5w; Wed, 25 Jan 2023 09:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483879.750532; Wed, 25 Jan 2023 09:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKc3F-0001QA-0n; Wed, 25 Jan 2023 09:26:41 +0000
Received: by outflank-mailman (input) for mailman id 483879;
 Wed, 25 Jan 2023 08:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GHF1=5W=flex--surenb.bounces.google.com=3ourQYwYKCd8TVSFOCHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@srs-se1.protection.inumbo.net>)
 id 1pKbJ7-00083W-3Q
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:39:01 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b63d7c55-9c8b-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 09:38:59 +0100 (CET)
Received: by mail-yb1-xb4a.google.com with SMTP id
 x188-20020a2531c5000000b00716de19d76bso19183731ybx.19
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 00:38:59 -0800 (PST)
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
X-Inumbo-ID: b63d7c55-9c8b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ralp0YsbeintaJ1+3rV0BJxcsbdnu/jVKuNhvnt0T5Y=;
        b=FpW3ZfeoZ58NaZWfySIfB+f4+MM7GrKuq9uCXe+gfhjrC0bvKaL2kAypJ/pJdIrezU
         Ru0cU0KNklRfuYrJ3SKXkdPgNjMfodaxcsFUMH2z2VP+LqiGmmBZi4WNjYcaaYQLe2mC
         v6uAPWcErh2g6vXcpQB3pwh9XmkkPfWLDi2bI5mgZlrfFBGfjeQ9Wv8iIQeddGuuYJGy
         vGYSJIu//+24XGZjzB+Q3VYOxZ5pJZ/HCGoJ5h7l6e1K0sxINKIjiYRXApyFQ3GXR7xJ
         ZclVjCWVjm/7Pu3pZxJbkPLxrnDwpix1sMzuU+AEqB9vICm+UZCWtOUOt5GLju8+nccL
         rTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ralp0YsbeintaJ1+3rV0BJxcsbdnu/jVKuNhvnt0T5Y=;
        b=b0sr59lcMqogSZObj147Kf+cvhZr515XgFw0Q9R9h/KKb66ss1RD6RODLRkiLeRxY7
         uMcayOKPICG6MLt6ER4Q2N3rrzT9ibTMAcsNSfozPaiQlvUKLG73PLzcuVVPPuyTmqSK
         k8tcTsEaEKITKrE6uSbuLFI2RMNjVXHt903z82dbqIbQWpks58vcn2uBgRhD5oKQxawo
         hxFFq9LX7jJgUdXvnl15xUcaodwKJaRUAeOTMUcA6DSuIiO1SD4WKYYCD0k4IFMEW3VD
         DmQZ3Dx3vvDvzJDjl7nCsEkKVuhvvKIuXAmyDACyFMzAMiOeNb6y+c8vayzoJaQ3f2G4
         DbJg==
X-Gm-Message-State: AO0yUKUr8P6HCBIgnRYEOsTwDLEXZZ1c+qr6m5DcnOt0jiavQ/iHN5sn
	p2uNo5AL/FUbnUdMZ+iWzA6ADSAuT6c=
X-Google-Smtp-Source: AK7set8/stQqnGGz4OB/vqyDOBLoBX54VTTeagu3mMK0HzymWEEvjI0ujOzPLr/zvAsu1DJMDE0YK80W9/s=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f7b0:20e8:ce66:f98])
 (user=surenb job=sendgmr) by 2002:a81:3e07:0:b0:506:6185:4fad with SMTP id
 l7-20020a813e07000000b0050661854fadmr450398ywa.451.1674635938431; Wed, 25 Jan
 2023 00:38:58 -0800 (PST)
Date: Wed, 25 Jan 2023 00:38:46 -0800
In-Reply-To: <20230125083851.27759-1-surenb@google.com>
Mime-Version: 1.0
References: <20230125083851.27759-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
Message-ID: <20230125083851.27759-2-surenb@google.com>
Subject: [PATCH v2 1/6] mm: introduce vma->vm_flags modifier functions
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: michel@lespinasse.org, jglisse@google.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mgorman@techsingularity.net, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, peterz@infradead.org, 
	ldufour@linux.ibm.com, paulmck@kernel.org, luto@kernel.org, 
	songliubraving@fb.com, peterx@redhat.com, david@redhat.com, 
	dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de, 
	kent.overstreet@linux.dev, punit.agrawal@bytedance.com, lstoakes@gmail.com, 
	peterjung1337@gmail.com, rientjes@google.com, axelrasmussen@google.com, 
	joelaf@google.com, minchan@google.com, jannh@google.com, shakeelb@google.com, 
	tatashin@google.com, edumazet@google.com, gthelen@google.com, 
	gurua@google.com, arjunroy@google.com, soheil@google.com, 
	hughlynch@google.com, leewalsh@google.com, posk@google.com, will@kernel.org, 
	aneesh.kumar@linux.ibm.com, npiggin@gmail.com, chenhuacai@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, qianweili@huawei.com, wangzhou1@hisilicon.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, l.stach@pengutronix.de, 
	krzysztof.kozlowski@linaro.org, patrik.r.jakobsson@gmail.com, 
	matthias.bgg@gmail.com, robdclark@gmail.com, quic_abhinavk@quicinc.com, 
	dmitry.baryshkov@linaro.org, tomba@kernel.org, hjc@rock-chips.com, 
	heiko@sntech.de, ray.huang@amd.com, kraxel@redhat.com, sre@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, tfiga@chromium.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, dimitri.sivanich@hpe.com, 
	zhangfei.gao@linaro.org, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	dgilbert@interlog.com, hdegoede@redhat.com, mst@redhat.com, 
	jasowang@redhat.com, alex.williamson@redhat.com, deller@gmx.de, 
	jayalk@intworks.biz, viro@zeniv.linux.org.uk, nico@fluxnic.net, 
	xiang@kernel.org, chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca, 
	miklos@szeredi.hu, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	bhe@redhat.com, andrii@kernel.org, yoshfuji@linux-ipv6.org, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, perex@perex.cz, 
	tiwai@suse.com, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-graphics-maintainer@vmware.com, linux-ia64@vger.kernel.org, 
	linux-arch@vger.kernel.org, loongarch@lists.linux.dev, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-crypto@vger.kernel.org, nvdimm@lists.linux.dev, 
	dmaengine@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-accelerators@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev, 
	target-devel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-aio@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-ext4@vger.kernel.org, devel@lists.orangefs.org, 
	kexec@lists.infradead.org, linux-xfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, 
	selinux@vger.kernel.org, alsa-devel@alsa-project.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

vm_flags are among VMA attributes which affect decisions like VMA merging
and splitting. Therefore all vm_flags modifications are performed after
taking exclusive mmap_lock to prevent vm_flags updates racing with such
operations. Introduce modifier functions for vm_flags to be used whenever
flags are updated. This way we can better check and control correct
locking behavior during these updates.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h       | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/mm_types.h |  8 +++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c2f62bdce134..b71f2809caac 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -627,6 +627,43 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
 }
 
+/* Use when VMA is not part of the VMA tree and needs no locking */
+static inline void init_vm_flags(struct vm_area_struct *vma,
+				 unsigned long flags)
+{
+	vma->vm_flags = flags;
+}
+
+/* Use when VMA is part of the VMA tree and modifications need coordination */
+static inline void reset_vm_flags(struct vm_area_struct *vma,
+				  unsigned long flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	init_vm_flags(vma, flags);
+}
+
+static inline void set_vm_flags(struct vm_area_struct *vma,
+				unsigned long flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	vma->vm_flags |= flags;
+}
+
+static inline void clear_vm_flags(struct vm_area_struct *vma,
+				  unsigned long flags)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	vma->vm_flags &= ~flags;
+}
+
+static inline void mod_vm_flags(struct vm_area_struct *vma,
+				unsigned long set, unsigned long clear)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+	vma->vm_flags |= set;
+	vma->vm_flags &= ~clear;
+}
+
 static inline void vma_set_anonymous(struct vm_area_struct *vma)
 {
 	vma->vm_ops = NULL;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 2d6d790d9bed..6c7c70bf50dd 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -491,7 +491,13 @@ struct vm_area_struct {
 	 * See vmf_insert_mixed_prot() for discussion.
 	 */
 	pgprot_t vm_page_prot;
-	unsigned long vm_flags;		/* Flags, see mm.h. */
+
+	/*
+	 * Flags, see mm.h.
+	 * WARNING! Do not modify directly.
+	 * Use {init|reset|set|clear|mod}_vm_flags() functions instead.
+	 */
+	unsigned long vm_flags;
 
 	/*
 	 * For areas with an address space and backing store,
-- 
2.39.1


