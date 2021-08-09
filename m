Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D48F3E4B7B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 19:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165124.301825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9WF-0002zZ-A1; Mon, 09 Aug 2021 17:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165124.301825; Mon, 09 Aug 2021 17:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9WF-0002ts-5C; Mon, 09 Aug 2021 17:56:59 +0000
Received: by outflank-mailman (input) for mailman id 165124;
 Mon, 09 Aug 2021 17:56:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD4O=NA=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mD9WD-0000Aq-1q
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 17:56:57 +0000
Received: from mail-pj1-x102c.google.com (unknown [2607:f8b0:4864:20::102c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90c37b74-38c8-44e2-bff4-9bc476e03eed;
 Mon, 09 Aug 2021 17:56:39 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so38266pji.5
 for <xen-devel@lists.xenproject.org>; Mon, 09 Aug 2021 10:56:39 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:2:106e:6ed1:5da1:2ac4])
 by smtp.gmail.com with ESMTPSA id x14sm20589708pfa.127.2021.08.09.10.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:56:39 -0700 (PDT)
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
X-Inumbo-ID: 90c37b74-38c8-44e2-bff4-9bc476e03eed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cBjjetB5scRrkX+A3+C6cOQnjDWDoYH3LrzmvOorAR4=;
        b=sPPE5pg+476PNmoE/TVK9YzFe951Z9jTppBWPcaFrZmVNeun3j9z8RbruIahTChh5N
         hEInDTDrNiP/I/niKkzacWs6OLLAsHmcla70CCGlIJ1HQV9LroNONp4sx+CMWy/eqqvg
         h5G5inu5ABmtLeo48Wcp43Khu9GMprPM75F66YBgTsOCYpxFGFLEosc/WLMs/Erm2O1e
         YcNPoQ8b8lQdggxH7XMskaKzBFuDbJ8YzPlavBLK5sRnDl9Fj2ZNAa+Msa4ednJS24ED
         5/zZg0s0B6Fz1VY7rV6Rio2ZEjpsAc8CQvNz1HGrOOEKtMbeB6z4xNpL74gadaGRvi5x
         5TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cBjjetB5scRrkX+A3+C6cOQnjDWDoYH3LrzmvOorAR4=;
        b=JsI3V8EGOE24+mXakjr3lHHJvct733de3evjaeY/XXOMpVjj0TJhhTiCJw2Ef78Vha
         seigOndfNTdPcMs3KouJTVRerv9y5CO/IRiQmB1a2sgTrwrpULfWBzwrjWu0cxSz4VmL
         9s/jADkuxobr3TZinu5wBsfjMEUDk52OKNON6w1v9/kpqJD53M22qdekT4GA1pg9er37
         mzAgDfsNmLHdUlmCvgd4MED5+iJJ4NizbsPV356TXeZTMxkaQhkzSZAnoARphgHUPHrV
         B+rgvthDCocpkse5e4iaJBgjDjJ26SP9B62eVDtQfU23bo1y67HDQmuTV/h+sbHOwBLH
         n/9w==
X-Gm-Message-State: AOAM531GMnceov3kp9Ep5HmaW180/iamx+qMSzDSz6eBNHmm22gvq671
	hk8gDXvy94yq8L5iFBhv/Y8=
X-Google-Smtp-Source: ABdhPJwaFTKcmp8xUnfNsloH8PrR5NG3CCvOenHxNhKVdulQOVvanqltOPnNZ4LLYIrcN3poiszICw==
X-Received: by 2002:a17:90b:1e05:: with SMTP id pg5mr365384pjb.12.1628531799300;
        Mon, 09 Aug 2021 10:56:39 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	ardb@kernel.org,
	Tianyu.Lan@microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	hannes@cmpxchg.org,
	tj@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V3 06/13] HV: Add ghcb hvcall support for SNP VM
Date: Mon,  9 Aug 2021 13:56:10 -0400
Message-Id: <20210809175620.720923-7-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809175620.720923-1-ltykernel@gmail.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V provides ghcb hvcall to handle VMBus
HVCALL_SIGNAL_EVENT and HVCALL_POST_MESSAGE
msg in SNP Isolation VM. Add such support.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/hyperv/ivm.c           | 43 +++++++++++++++++++++++++++++++++
 arch/x86/include/asm/mshyperv.h |  1 +
 drivers/hv/connection.c         |  6 ++++-
 drivers/hv/hv.c                 |  8 +++++-
 include/asm-generic/mshyperv.h  | 29 ++++++++++++++++++++++
 5 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index ec0e5c259740..c13ec5560d73 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -15,6 +15,49 @@
 #include <asm/io.h>
 #include <asm/mshyperv.h>
 
+#define GHCB_USAGE_HYPERV_CALL	1
+
+u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size)
+{
+	union hv_ghcb *hv_ghcb;
+	void **ghcb_base;
+	unsigned long flags;
+
+	if (!ms_hyperv.ghcb_base)
+		return -EFAULT;
+
+	WARN_ON(in_nmi());
+
+	local_irq_save(flags);
+	ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
+	hv_ghcb = (union hv_ghcb *)*ghcb_base;
+	if (!hv_ghcb) {
+		local_irq_restore(flags);
+		return -EFAULT;
+	}
+
+	hv_ghcb->ghcb.protocol_version = GHCB_PROTOCOL_MAX;
+	hv_ghcb->ghcb.ghcb_usage = GHCB_USAGE_HYPERV_CALL;
+
+	hv_ghcb->hypercall.outputgpa = (u64)output;
+	hv_ghcb->hypercall.hypercallinput.asuint64 = 0;
+	hv_ghcb->hypercall.hypercallinput.callcode = control;
+
+	if (input_size)
+		memcpy(hv_ghcb->hypercall.hypercalldata, input, input_size);
+
+	VMGEXIT();
+
+	hv_ghcb->ghcb.ghcb_usage = 0xffffffff;
+	memset(hv_ghcb->ghcb.save.valid_bitmap, 0,
+	       sizeof(hv_ghcb->ghcb.save.valid_bitmap));
+
+	local_irq_restore(flags);
+
+	return hv_ghcb->hypercall.hypercalloutput.callstatus;
+}
+EXPORT_SYMBOL_GPL(hv_ghcb_hypercall);
+
 void hv_ghcb_msr_write(u64 msr, u64 value)
 {
 	union hv_ghcb *hv_ghcb;
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index 730985676ea3..a30c60f189a3 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -255,6 +255,7 @@ void hv_sint_rdmsrl_ghcb(u64 msr, u64 *value);
 void hv_signal_eom_ghcb(void);
 void hv_ghcb_msr_write(u64 msr, u64 value);
 void hv_ghcb_msr_read(u64 msr, u64 *value);
+u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size);
 
 #define hv_get_synint_state_ghcb(int_num, val)			\
 	hv_sint_rdmsrl_ghcb(HV_X64_MSR_SINT0 + int_num, val)
diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index 5e479d54918c..6d315c1465e0 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -447,6 +447,10 @@ void vmbus_set_event(struct vmbus_channel *channel)
 
 	++channel->sig_events;
 
-	hv_do_fast_hypercall8(HVCALL_SIGNAL_EVENT, channel->sig_event);
+	if (hv_isolation_type_snp())
+		hv_ghcb_hypercall(HVCALL_SIGNAL_EVENT, &channel->sig_event,
+				NULL, sizeof(u64));
+	else
+		hv_do_fast_hypercall8(HVCALL_SIGNAL_EVENT, channel->sig_event);
 }
 EXPORT_SYMBOL_GPL(vmbus_set_event);
diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index 59f7173c4d9f..e5c9fc467893 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -98,7 +98,13 @@ int hv_post_message(union hv_connection_id connection_id,
 	aligned_msg->payload_size = payload_size;
 	memcpy((void *)aligned_msg->payload, payload, payload_size);
 
-	status = hv_do_hypercall(HVCALL_POST_MESSAGE, aligned_msg, NULL);
+	if (hv_isolation_type_snp())
+		status = hv_ghcb_hypercall(HVCALL_POST_MESSAGE,
+				(void *)aligned_msg, NULL,
+				sizeof(struct hv_input_post_message));
+	else
+		status = hv_do_hypercall(HVCALL_POST_MESSAGE,
+				aligned_msg, NULL);
 
 	/* Preemption must remain disabled until after the hypercall
 	 * so some other thread can't get scheduled onto this cpu and
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 90dac369a2dc..400181b855c1 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -31,6 +31,35 @@
 
 union hv_ghcb {
 	struct ghcb ghcb;
+	struct {
+		u64 hypercalldata[509];
+		u64 outputgpa;
+		union {
+			union {
+				struct {
+					u32 callcode        : 16;
+					u32 isfast          : 1;
+					u32 reserved1       : 14;
+					u32 isnested        : 1;
+					u32 countofelements : 12;
+					u32 reserved2       : 4;
+					u32 repstartindex   : 12;
+					u32 reserved3       : 4;
+				};
+				u64 asuint64;
+			} hypercallinput;
+			union {
+				struct {
+					u16 callstatus;
+					u16 reserved1;
+					u32 elementsprocessed : 12;
+					u32 reserved2         : 20;
+				};
+				u64 asunit64;
+			} hypercalloutput;
+		};
+		u64 reserved2;
+	} hypercall;
 } __packed __aligned(PAGE_SIZE);
 
 struct ms_hyperv_info {
-- 
2.25.1


