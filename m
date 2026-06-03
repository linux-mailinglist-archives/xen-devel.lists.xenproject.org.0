Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id isgqBegmIGqwxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB4637DE6
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rnmrL8LS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326247.1591785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIu-0000j7-Aj; Wed, 03 Jun 2026 13:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326247.1591785; Wed, 03 Jun 2026 13:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIt-0000X2-IE; Wed, 03 Jun 2026 13:06:39 +0000
Received: by outflank-mailman (input) for mailman id 1326247;
 Wed, 03 Jun 2026 13:06:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIq-0008Ok-GR
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIp-006lUv-T9
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d4-5cb7-0a2a0a5109dd-0a2a4507892e-46
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:35 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026db-229c-0a2a45070019-d155dd2ea5a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:35 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4600cbb06deso435021f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:35 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:34 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780491995; x=1781096795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwEW/VMKmm9UVqRykzUd/eww6iX340aEt+2QQIC/NsI=;
        b=rnmrL8LSOdnFSUD53twbT3zQUc9Q1d0nIhlhJzw67U4BB8VBtVGtBmLne+xiLL4v+i
         0MRKr0xpN3+46B29fyU9d1FC7WQDQhQ7Zm0Ubx8FmpJbHt/RvW4pJiKWWddxdEma3N+v
         TZdnnY6TxWZMDGJExsb9AebxdDpRXrc9KRSk2W/32C7SYYOSY4y952Pi260Vrv6LeVpd
         1JB5Jn8cg8XR1zGsUoH2okB2TbKrdbtA3Gk1jEiYtq+xifOKHxm/HxPov94sAByz3jdz
         SACQXl14+v039AHS7pl59VDxodWlNA7YNHh9fufIWKgNpuy7CKLx1KriMkSawA54roMg
         a9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491995; x=1781096795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwEW/VMKmm9UVqRykzUd/eww6iX340aEt+2QQIC/NsI=;
        b=LwZY+RfeQlZWNJYHLVf1FCqWI0cb/bbIm1j4HV2Dwr3ryAmNU9Od+i/i++GnFplpy/
         xnPlJyc+FT2aUT1hK7w+2Xqx575QNEB5pdYbKXWoLX8WSsGlLerTAsIIEbVGOijptbrx
         nlQouInhmeRpvCaP82SM9fGAN+vbi4hbptuv8iLUJfioSEUnj5ac0SkotNzxOIoc6Kbh
         cuiidQdod56Rj4EKPJxtB6TlMBtxmMcFkLGgNinv/HLUaevb3Y0G5lkpMj4G0A6BpcQd
         RyOqhdtNEtFbFOtAf4rqmlPYc0QioIH7KtzVA1S9k7r+ub87SuotwEPb+LnUl24DT0T3
         DtIA==
X-Gm-Message-State: AOJu0YwCN25UXAXO7DyrBfr6CXD2JWN7AZiWNQCiJPNpWru1qySwVS1R
	upDwoBK2NXheGa+tEGKJXt96rVExvxh+QUDA0956PwRor/dhjYViCFqASVsWBsLc
X-Gm-Gg: Acq92OEH7WrPnmzOopCwzt1KxqpzBelRqP+ovZwAmOMubdRGJqDLNms1Vtg4tMRbtIz
	YbzbrAD5wJU0ZU9QGOeLJ36cD6/dm2S9H43Fu4315Tvcuc7mUGcrYc3xBlSMMNYAWt5csg9igG0
	y5SUggFXnONRsEeR8Vyfl+vdR9tXdQ8SwxRELU5FZmIfiLwP74yBMLltHSPevToezqW4XQUPUzd
	UUfj41BpKVof/VMZ/DYoOlFIQQfiJ0b6A9nk3h0vmz7+55DO99rxuG4JQ2it+tb+MYZvV+ndCc9
	57bIgCB8f+fQgIdDwsHXl1LV/33eG5uuicekybj9Oqo+Jsri+P9CFM2q5Erc59uDumDGtefXc/c
	u/v3TbFRIFWdqysIvPKQVofXmaa6FEBh8GITPTGuS7k/PhRzmz0ogXhw2GYe9z+aztX3fDpaN5f
	gJH3Q81seZMjCzz33+qmGKWuG+aGJUYZwLzym+RsuwRRKXzWoqg5InpQEsJzvXEvcZWnn7GPvPo
	2zH2G7YwoIc3VGArRRRKLxfYApSOTtI6L+KPIaGE+/Z4Vo=
X-Received: by 2002:a5d:524f:0:b0:452:bc74:b129 with SMTP id ffacd0b85a97d-46021346390mr3198279f8f.16.1780491994917;
        Wed, 03 Jun 2026 06:06:34 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH Linux v4 16/16] xen/privcmd: Add new ABI to allow copying foreign memory
Date: Wed,  3 Jun 2026 14:06:03 +0100
Message-ID: <20260603130603.776452-17-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780491995-0B979C48-D518846D/0/0
X-purgate-type: clean
X-purgate-size: 5352
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADDB4637DE6

From: Frediano Ziglio <frediano.ziglio@citrix.com>

This new ABI allows to copy foreign domain memory to/from a buffer.
This avoids having to map/copy/unmap foreign memory which is
expensive.
This operation is done particularly when migrating VMs.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 arch/x86/include/asm/xen/interface.h |  1 +
 drivers/xen/privcmd.c                | 51 ++++++++++++++++++++++++++++
 include/uapi/xen/privcmd.h           | 10 ++++++
 include/xen/interface/memory.h       | 37 ++++++++++++++++++++
 4 files changed, 99 insertions(+)

diff --git a/arch/x86/include/asm/xen/interface.h b/arch/x86/include/asm/xen/interface.h
index a078a2b0f032..bac3c3bc60fd 100644
--- a/arch/x86/include/asm/xen/interface.h
+++ b/arch/x86/include/asm/xen/interface.h
@@ -91,6 +91,7 @@ DEFINE_GUEST_HANDLE(int);
 DEFINE_GUEST_HANDLE(void);
 DEFINE_GUEST_HANDLE(uint64_t);
 DEFINE_GUEST_HANDLE(uint32_t);
+DEFINE_GUEST_HANDLE(uint8_t);
 DEFINE_GUEST_HANDLE(xen_pfn_t);
 DEFINE_GUEST_HANDLE(xen_ulong_t);
 #endif
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 725a49a0eee7..4ae9138dd314 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -62,6 +62,10 @@ MODULE_LICENSE("GPL");
 
 #define PRIV_VMA_LOCKED ((void *)1)
 
+#ifndef UINT32_MAX
+#define UINT32_MAX ((uint32_t)~0U)
+#endif
+
 static unsigned int privcmd_dm_op_max_num = 16;
 module_param_named(dm_op_max_nr_bufs, privcmd_dm_op_max_num, uint, 0644);
 MODULE_PARM_DESC(dm_op_max_nr_bufs,
@@ -1522,6 +1526,49 @@ static inline void privcmd_ioeventfd_exit(void)
 }
 #endif /* CONFIG_XEN_PRIVCMD_EVENTFD */
 
+static long privcmd_ioctl_foreigncopy(
+	struct file *file, void __user *udata)
+{
+	const struct privcmd_data *const data = file->private_data;
+	long ret;
+	struct privcmd_foreigncopy copy;
+	struct xen_foreigncopy xcopy;
+
+	if (copy_from_user(&copy, udata, sizeof(copy)))
+		return -EFAULT;
+	if (copy.dir & ~1u)
+		return -EINVAL;
+	if (copy.num >= UINT32_MAX >> PAGE_SHIFT)
+		return -EINVAL;
+	if (!access_ok(copy.pfns, copy.num * sizeof(*copy.pfns)))
+		return -EFAULT;
+	if (!access_ok(copy.buffer, copy.num << PAGE_SHIFT))
+		return -EFAULT;
+
+	/* If restriction is in place, check the domid matches */
+	if (data->domid != DOMID_INVALID && data->domid != copy.dom)
+		return -EPERM;
+
+	xcopy.domid = copy.dom;
+	xcopy.flags = copy.dir;
+	xcopy.nr_frames = copy.num;
+	xcopy.frame_list = (void *) copy.pfns;
+	xcopy.buffer = copy.buffer;
+
+	ret = HYPERVISOR_memory_op(XENMEM_foreigncopy, &xcopy);
+
+	/* copy values back in case of error */
+	if (ret) {
+		copy.num = xcopy.nr_frames = copy.num;
+		copy.pfns = xcopy.frame_list;
+		copy.buffer = xcopy.buffer;
+		if (copy_to_user(udata, &copy, sizeof(copy)))
+			ret = -EFAULT;
+	}
+
+	return ret;
+}
+
 static long privcmd_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long data)
 {
@@ -1569,6 +1616,10 @@ static long privcmd_ioctl(struct file *file,
 		ret = privcmd_ioctl_pcidev_get_gsi(file, udata);
 		break;
 
+	case IOCTL_PRIVCMD_FOREIGNCOPY:
+		ret = privcmd_ioctl_foreigncopy(file, udata);
+		break;
+
 	default:
 		break;
 	}
diff --git a/include/uapi/xen/privcmd.h b/include/uapi/xen/privcmd.h
index 8e2c8fd44764..786d769ad4f8 100644
--- a/include/uapi/xen/privcmd.h
+++ b/include/uapi/xen/privcmd.h
@@ -131,6 +131,14 @@ struct privcmd_pcidev_get_gsi {
 	__u32 gsi;
 };
 
+struct privcmd_foreigncopy {
+	domid_t dom;		/* foreign domain */
+	__u16 dir;		/* direction,  0 from, 1 to */
+	__u32 num;		/* number of pages to copy */
+	const xen_pfn_t __user *pfns;	/* array of pfns */
+	void __user *buffer;	/* buffer to copy to/from */
+};
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -164,5 +172,7 @@ struct privcmd_pcidev_get_gsi {
 	_IOW('P', 9, struct privcmd_ioeventfd)
 #define IOCTL_PRIVCMD_PCIDEV_GET_GSI				\
 	_IOC(_IOC_NONE, 'P', 10, sizeof(struct privcmd_pcidev_get_gsi))
+#define IOCTL_PRIVCMD_FOREIGNCOPY				\
+	_IOC(_IOC_NONE, 'P', 11, sizeof(struct privcmd_foreigncopy))
 
 #endif /* __LINUX_PUBLIC_PRIVCMD_H__ */
diff --git a/include/xen/interface/memory.h b/include/xen/interface/memory.h
index 1a371a825c55..5981402fccde 100644
--- a/include/xen/interface/memory.h
+++ b/include/xen/interface/memory.h
@@ -325,4 +325,41 @@ struct xen_mem_acquire_resource {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xen_mem_acquire_resource);
 
+/*
+ * Copy memory from/to a given domain.
+ */
+#define XENMEM_foreigncopy 29
+struct xen_foreigncopy {
+    /* IN - The domain whose resource is to be copied */
+    domid_t domid;
+
+    /* IN - Flags */
+#define XENMEM_foreigncopy_from 0
+#define XENMEM_foreigncopy_to 1
+#define XENMEM_foreigncopy_direction 1
+    uint16_t flags;
+
+    /*
+     * IN
+     *
+     * As an IN parameter number of frames of the domain to be copied.
+     */
+    uint32_t nr_frames;
+
+    /*
+     * IN
+     *
+     * Frames to be copied.
+     */
+    GUEST_HANDLE(xen_pfn_t) frame_list;
+
+    /*
+     * IN/OUT
+     *
+     * Userspace buffer to read/write from.
+     */
+    GUEST_HANDLE(uint8_t) buffer;
+};
+DEFINE_GUEST_HANDLE_STRUCT(xen_foreigncopy);
+
 #endif /* __XEN_PUBLIC_MEMORY_H__ */
-- 
2.54.0


