Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390940AF50
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 15:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186671.335445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8fT-0005k8-32; Tue, 14 Sep 2021 13:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186671.335445; Tue, 14 Sep 2021 13:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8fS-0005hg-UD; Tue, 14 Sep 2021 13:40:10 +0000
Received: by outflank-mailman (input) for mailman id 186671;
 Tue, 14 Sep 2021 13:40:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lzK=OE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mQ8fR-0001wz-SB
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 13:40:09 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25a0bd9d-8c5d-4bd4-8d96-9a0e7cc43ac6;
 Tue, 14 Sep 2021 13:39:40 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 lb1-20020a17090b4a4100b001993f863df2so2799919pjb.5
 for <xen-devel@lists.xenproject.org>; Tue, 14 Sep 2021 06:39:40 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:6ea2:a529:4af3:5057])
 by smtp.gmail.com with ESMTPSA id v13sm10461234pfm.16.2021.09.14.06.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:39:39 -0700 (PDT)
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
X-Inumbo-ID: 25a0bd9d-8c5d-4bd4-8d96-9a0e7cc43ac6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=azCewkuzRAkBZyiDOjmA0vSW/QH/3obR4Ytj+SPfQzQ=;
        b=YK5mVlypHJRSS7afMsq7DyxTNlQ/p9SKLwx+cOOkVvxOGeuM6eWoauMwXmPc1oqD+h
         8e/7mt+/7qYq08phSAIbvSPhlho5l6bHdYmjrjK0P59fIP9AAVx6da+9UhivbazZeao7
         hkI2XuYefI+84XSLv5sDvueSTlukH2kXJ0Bo0iKwh+5F/fDZNQK+wmNjmUUu8Uuiu0ht
         b+s3OSft1wHLaAepa21DDSmakrwSRefK8GEX0khdKFbF/DlzqOOFmYHIZBetHsCFHxn8
         r46AcAy8J11/ApUlIPT+c5gLWcT9l6OhimerwJRDl7pJyHQqUxUDREPhPiA5a1Miq6DQ
         Eslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azCewkuzRAkBZyiDOjmA0vSW/QH/3obR4Ytj+SPfQzQ=;
        b=V+HuCxcKoiIzqmMhXv6qTOn2IWoBbB3AcDqWD2yP3YGzcK1D8m18HTK9T3fFkkrwr4
         KrQfrxwEMxxS2VfN9wQv6ygr43TpKi8vZjJZGyfqCpfFUnxqVBJ+O+n1xSpyiAS3d0OL
         FnJr4DFVBmXa4Ka/9IwpMXyV9azqGzktQp/99L3Aw9nG8wfu+qrheEGrnB0GGVloAfVZ
         +5gdvQAfKVkLF6Fl8PZME6YSUF3udC0bOMKWk9/Zbz4VYTtJIC59atKJuDYy5jbCxbrE
         hzIBVP6e68A4RVj6wGatA39kq+Znxn3QWd6FZBNcjFKLBvX56evf1X9QK2brA8ESYZSl
         8O+w==
X-Gm-Message-State: AOAM533Z93PB4UOEX4Aab50Ri1eh4r7NKGDzFMNjoKa09vu2nGC78Spa
	l6kip0yXQsRFRda1UX2PoTs=
X-Google-Smtp-Source: ABdhPJztnF9gFB+MKR5DdaKIrIGDyLZ4ZBz+QRP7UkoIajfwGN+xMzTLqQUKzjlgKwa664+jV4M3Pw==
X-Received: by 2002:a17:903:1207:b0:138:e2f9:6c98 with SMTP id l7-20020a170903120700b00138e2f96c98mr15512885plh.11.1631626779382;
        Tue, 14 Sep 2021 06:39:39 -0700 (PDT)
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
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	brijesh.singh@amd.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	pgonda@google.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	aneesh.kumar@linux.ibm.com,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	xen-devel@lists.xenproject.org,
	tj@kernel.org,
	rientjes@google.com,
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
Subject: [PATCH V5 06/12] x86/hyperv: Add ghcb hvcall support for SNP VM
Date: Tue, 14 Sep 2021 09:39:07 -0400
Message-Id: <20210914133916.1440931-7-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914133916.1440931-1-ltykernel@gmail.com>
References: <20210914133916.1440931-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

hyperv provides ghcb hvcall to handle VMBus
HVCALL_SIGNAL_EVENT and HVCALL_POST_MESSAGE
msg in SNP Isolation VM. Add such support.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v3:
	* Add hv_ghcb_hypercall() stub function to avoid
	  compile error for ARM.
---
 arch/x86/hyperv/ivm.c          | 74 ++++++++++++++++++++++++++++++++++
 drivers/hv/connection.c        |  6 ++-
 drivers/hv/hv.c                |  8 +++-
 drivers/hv/hv_common.c         |  6 +++
 include/asm-generic/mshyperv.h |  1 +
 5 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 5439723446c9..dfdac3a40036 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -18,10 +18,84 @@
 #include <asm/mshyperv.h>
 #include <asm/hypervisor.h>
 
+#define GHCB_USAGE_HYPERV_CALL	1
+
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
 } __packed __aligned(HV_HYP_PAGE_SIZE);
 
+u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size)
+{
+	union hv_ghcb *hv_ghcb;
+	void **ghcb_base;
+	unsigned long flags;
+	u64 status;
+
+	if (!hv_ghcb_pg)
+		return -EFAULT;
+
+	WARN_ON(in_nmi());
+
+	local_irq_save(flags);
+	ghcb_base = (void **)this_cpu_ptr(hv_ghcb_pg);
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
+	status = hv_ghcb->hypercall.hypercalloutput.callstatus;
+
+	local_irq_restore(flags);
+
+	return status;
+}
+
 void hv_ghcb_msr_write(u64 msr, u64 value)
 {
 	union hv_ghcb *hv_ghcb;
diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index 5e479d54918c..8820ae68f20f 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -447,6 +447,10 @@ void vmbus_set_event(struct vmbus_channel *channel)
 
 	++channel->sig_events;
 
-	hv_do_fast_hypercall8(HVCALL_SIGNAL_EVENT, channel->sig_event);
+	if (hv_isolation_type_snp())
+		hv_ghcb_hypercall(HVCALL_SIGNAL_EVENT, &channel->sig_event,
+				NULL, sizeof(channel->sig_event));
+	else
+		hv_do_fast_hypercall8(HVCALL_SIGNAL_EVENT, channel->sig_event);
 }
 EXPORT_SYMBOL_GPL(vmbus_set_event);
diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
index dee1a96bc535..5644ba2bfa5c 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -98,7 +98,13 @@ int hv_post_message(union hv_connection_id connection_id,
 	aligned_msg->payload_size = payload_size;
 	memcpy((void *)aligned_msg->payload, payload, payload_size);
 
-	status = hv_do_hypercall(HVCALL_POST_MESSAGE, aligned_msg, NULL);
+	if (hv_isolation_type_snp())
+		status = hv_ghcb_hypercall(HVCALL_POST_MESSAGE,
+				(void *)aligned_msg, NULL,
+				sizeof(*aligned_msg));
+	else
+		status = hv_do_hypercall(HVCALL_POST_MESSAGE,
+				aligned_msg, NULL);
 
 	/* Preemption must remain disabled until after the hypercall
 	 * so some other thread can't get scheduled onto this cpu and
diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index 1fc82d237161..7be173a99f27 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -289,3 +289,9 @@ void __weak hyperv_cleanup(void)
 {
 }
 EXPORT_SYMBOL_GPL(hyperv_cleanup);
+
+u64 __weak hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size)
+{
+	return HV_STATUS_INVALID_PARAMETER;
+}
+EXPORT_SYMBOL_GPL(hv_ghcb_hypercall);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 94750bafd4cc..a0ec607a2fd6 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -250,6 +250,7 @@ bool hv_is_hibernation_supported(void);
 enum hv_isolation_type hv_get_isolation_type(void);
 bool hv_is_isolation_supported(void);
 bool hv_isolation_type_snp(void);
+u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size);
 void hyperv_cleanup(void);
 bool hv_query_ext_cap(u64 cap_query);
 #else /* CONFIG_HYPERV */
-- 
2.25.1


