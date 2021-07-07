Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7243BEADD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:35:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152395.281594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19aG-0002rq-6s; Wed, 07 Jul 2021 15:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152395.281594; Wed, 07 Jul 2021 15:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19aG-0002no-3T; Wed, 07 Jul 2021 15:35:32 +0000
Received: by outflank-mailman (input) for mailman id 152395;
 Wed, 07 Jul 2021 15:35:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxnL=L7=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m19aE-0000vf-KA
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:35:30 +0000
Received: from mail-pg1-x534.google.com (unknown [2607:f8b0:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4a80eb2-0ebb-4ed2-baf2-cc2ed3f5eeaf;
 Wed, 07 Jul 2021 15:35:18 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id t9so2639011pgn.4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 08:35:18 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:6b7f:cf3e:bbf2:d229])
 by smtp.gmail.com with ESMTPSA id y11sm21096877pfo.160.2021.07.07.08.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:35:17 -0700 (PDT)
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
X-Inumbo-ID: a4a80eb2-0ebb-4ed2-baf2-cc2ed3f5eeaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XnnD+WKjmMaIcoxzXQeIqu3OOT9S8jIhhegPGmtXPps=;
        b=oaL0A1JtN7PBLGoV1YGeMFUgyp9SyUFco9uhf2pPj9nDoTX16X2ZY93jk5mSlH+DsN
         SvCLYXZI+R7feW0Jx0OMtXNb4f62D1NKXZBhVGBE//ZTEOLu6B147uN+5g6H2xL9diy5
         ufW4ucIzb9GScnOrnpTdTFdTQX2AYyQODtFUohD33rBRHrIipu1aU1jrbbynVzOeLZPr
         5hxECBpjjXTRzk23jlBCHvmcAXtPztCNhXumUoIHe4jBxeK8cDgUJZKiMEk8kLBBHCU6
         7G8klAIhGVfKVULa1RhqCfv0O34Au8CkmaWIXjZAzuWOdrG/V8D3KqnPCDtjK/EdzTix
         jn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XnnD+WKjmMaIcoxzXQeIqu3OOT9S8jIhhegPGmtXPps=;
        b=HgRWolNmj1kqWJV14o2x/lOJOXLpa+A80M4h4QQp34xZfTZt3jBnuko5E3G0aVrchy
         7UeNlb8HxVjhKBOCkl2vV+5+RJtmEARHvWuk0iGZ4M4wBfwD3ORPOtrOMyIumFMmrlMt
         +j9h3IoFwB+2a2W8RkVlLoIfd7W242ipuiUWCoq4bqVKn1kLLC7cj/WQdKPWXaITAONt
         q/zjdAm7hfV3YM4JpeGaCVOlqDzZhfgWVEP7lTac1VfhgRnUtLFqzWNkElN9GlxGQ/Us
         hZDKKgziH+wPoBqvRL5JGCKAfzw3h5JJdIAiW3C94rqi/23BWOr0tsgbUz2C7hcLlbpq
         SJYQ==
X-Gm-Message-State: AOAM531ZYMSk5X5ip7uFjyTRko3qLb7GTPWl1i1YQp3kni799hbWA0GB
	sUyze/jzGDM6k3DRClpOae0=
X-Google-Smtp-Source: ABdhPJxV6H7qeqYvuTG8QtTM4W1lsIpIcrJFKXi7bJYXvWIOKqZZzABLwFM0i62fKflJpqZul4Pglw==
X-Received: by 2002:a63:3dcb:: with SMTP id k194mr26633987pga.202.1625672118056;
        Wed, 07 Jul 2021 08:35:18 -0700 (PDT)
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
	rppt@kernel.org,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	ardb@kernel.org,
	nramas@linux.microsoft.com,
	robh@kernel.org,
	keescook@chromium.org,
	rientjes@google.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	hannes@cmpxchg.org,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	xen-devel@lists.xenproject.org,
	tj@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	anparri@microsoft.com
Subject: [RFC PATCH V4 05/12] HV: Add ghcb hvcall support for SNP VM
Date: Wed,  7 Jul 2021 11:34:46 -0400
Message-Id: <20210707153456.3976348-6-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707153456.3976348-1-ltykernel@gmail.com>
References: <20210707153456.3976348-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V provides ghcb hvcall to handle VMBus
HVCALL_SIGNAL_EVENT and HVCALL_POST_MESSAGE
msg in SNP Isolation VM. Add such support.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/hyperv/ivm.c           | 42 +++++++++++++++++++++++++++++++++
 arch/x86/include/asm/mshyperv.h |  1 +
 drivers/hv/connection.c         |  6 ++++-
 drivers/hv/hv.c                 |  8 ++++++-
 include/asm-generic/mshyperv.h  | 29 +++++++++++++++++++++++
 5 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index c7b54631ca0d..8a6f4e9e3d6c 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -15,6 +15,48 @@
 #include <asm/io.h>
 #include <asm/mshyperv.h>
 
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
+	memset(hv_ghcb, 0x00, HV_HYP_PAGE_SIZE);
+	hv_ghcb->ghcb.protocol_version = 1;
+	hv_ghcb->ghcb.ghcb_usage = 1;
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
index f9cc3753040a..fe03e3e833ac 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -258,6 +258,7 @@ void hv_sint_rdmsrl_ghcb(u64 msr, u64 *value);
 void hv_signal_eom_ghcb(void);
 void hv_ghcb_msr_write(u64 msr, u64 value);
 void hv_ghcb_msr_read(u64 msr, u64 *value);
+u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size);
 
 #define hv_get_synint_state_ghcb(int_num, val)			\
 	hv_sint_rdmsrl_ghcb(HV_X64_MSR_SINT0 + int_num, val)
diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index 311cd005b3be..186fd4c8acd4 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -445,6 +445,10 @@ void vmbus_set_event(struct vmbus_channel *channel)
 
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
index e6d6886faed1..8f6f283fb5b5 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -30,6 +30,35 @@
 
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


