Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B91395259
	for <lists+xen-devel@lfdr.de>; Sun, 30 May 2021 19:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134300.249970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE6-00067x-L3; Sun, 30 May 2021 17:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134300.249970; Sun, 30 May 2021 17:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE6-0005xd-Bz; Sun, 30 May 2021 17:27:50 +0000
Received: by outflank-mailman (input) for mailman id 134300;
 Sun, 30 May 2021 15:07:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvOc=KZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lnN1s-0000PC-0k
 for xen-devel@lists.xenproject.org; Sun, 30 May 2021 15:07:04 +0000
Received: from mail-pj1-x1030.google.com (unknown [2607:f8b0:4864:20::1030])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f36adaac-9dab-42d3-8e39-a3f4c8e9df73;
 Sun, 30 May 2021 15:06:46 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so7198667pjp.4
 for <xen-devel@lists.xenproject.org>; Sun, 30 May 2021 08:06:46 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:9:dc2d:80ab:c3f3:1524])
 by smtp.gmail.com with ESMTPSA id b15sm8679688pfi.100.2021.05.30.08.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 08:06:44 -0700 (PDT)
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
X-Inumbo-ID: f36adaac-9dab-42d3-8e39-a3f4c8e9df73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z6S1GEUANkCSJDbGlD0AFfyq9MRalRtHEN/uug/GOu0=;
        b=bjkBFLIGpECWm12ZAUvidwjhy290SoG0X7BEjCajWvEiZptzu5I/ZT/UvY4n5d9vQK
         vTBSEZNwaH7n99NZzNVTQPnrt4hta7LrzuCGnHpiON9AUMkhumyiiozan8c/a5HWL8/Y
         MhU50l/wXGpatWp4kkoMPFXW5XREua8Ne8mEhC3qJtFrgXbkxzC7Xu3wI79epYQyGnHQ
         hv9OhB2IW6o2mfT96TOFoaY8GP/A/mlm3P19ebZlMOImyCrfxx7/c9J+oKIGXsseFTI2
         7eqK6e1F+iZOZgxUCpjNiMRUDE9IWIfbm4trwT0KL+Ea6sMa04paSo8i/kuyuz3ciGU2
         qirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z6S1GEUANkCSJDbGlD0AFfyq9MRalRtHEN/uug/GOu0=;
        b=dRzmTYZQ9361XVCpcxW5VBFbrgGH9pTTbplZW5+7xHBGT6MHj8cYY/BV2auogYi6LQ
         t0FrezhcuQJ2lLeudLTQ0cF6QLq/EXIXNR6aPxXNHeH0NuXv1ikqkQqeZaF5XLkYQ5TC
         arInUEND2QrwBy1YJvqNi7n1bEB2Bkt/zawf1tZUrMRXVS0ISiWWM6SQ5BnvM666S2CR
         1ht3ipCSiuUGeHUsQ14pkwgVc3Ku+KT7H4ksUdsYzT7gJ7Cu4w3tB8KWWLeOPM/vZSkG
         PFuBtRMBi/5EX2icLi+qXQTAm3ah7Umc29umFlwMr7Wz8hpJ7mtpgNT7MM4qBwY9JB+h
         Ad4g==
X-Gm-Message-State: AOAM533DwhZwXhVtprIvC++wcYVBShmCKEGTdbr3KDTbIecgHo/jLcbw
	mQdXw0y0IBIpCaMwRrrQ/sY=
X-Google-Smtp-Source: ABdhPJyBzi0D5XZ+1bVzKaDd93rKStOmEBliWJn7djh8UK0R2zDyliKB0crRLpyjBYOBktS3q/+xFg==
X-Received: by 2002:a17:90b:1b48:: with SMTP id nv8mr15017912pjb.39.1622387205419;
        Sun, 30 May 2021 08:06:45 -0700 (PDT)
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
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	cai@lca.pw,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	Tianyu.Lan@microsoft.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	xen-devel@lists.xenproject.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: [RFC PATCH V3 05/11] HV: Add ghcb hvcall support for SNP VM
Date: Sun, 30 May 2021 11:06:22 -0400
Message-Id: <20210530150628.2063957-6-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210530150628.2063957-1-ltykernel@gmail.com>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V provides ghcb hvcall to handle VMBus
HVCALL_SIGNAL_EVENT and HVCALL_POST_MESSAGE
msg in SNP Isolation VM. Add such support.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/hyperv/ivm.c           | 69 +++++++++++++++++++++++++++++++++
 arch/x86/include/asm/mshyperv.h |  1 +
 drivers/hv/connection.c         |  6 ++-
 drivers/hv/hv.c                 |  8 +++-
 4 files changed, 82 insertions(+), 2 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index fd6dd804beef..e687fca68ba3 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -18,8 +18,77 @@
 
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
 
+u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size)
+{
+	union hv_ghcb *hv_ghcb;
+	void **ghcb_base;
+	unsigned long flags;
+
+	if (!ms_hyperv.ghcb_base)
+		return -EFAULT;
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
index eec7f3357d51..51dfbd040930 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -259,6 +259,7 @@ void hv_sint_rdmsrl_ghcb(u64 msr, u64 *value);
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
index 28faa8364952..03bcc831b034 100644
--- a/drivers/hv/hv.c
+++ b/drivers/hv/hv.c
@@ -97,7 +97,13 @@ int hv_post_message(union hv_connection_id connection_id,
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
-- 
2.25.1


