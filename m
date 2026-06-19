Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BHYDKrE+NWqDpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2576A5F23
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dXImFdDF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342221.1602543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYub-0004JL-Du; Fri, 19 Jun 2026 13:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342221.1602543; Fri, 19 Jun 2026 13:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYua-0004Dt-Ua; Fri, 19 Jun 2026 13:05:32 +0000
Received: by outflank-mailman (input) for mailman id 1342221;
 Fri, 19 Jun 2026 13:05:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuY-0003mE-HX
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuX-005gIU-U0
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e99-e002-0a2a0a5209dd-0a2a4505c468-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:29 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e99-ef3d-0a2a45050019-d155dd36c15d-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:29 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4626fdc829aso1606309f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:29 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874329; x=1782479129; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=in4wc4RHuN4wnGlvZnYvNPCqhNJf+PX4+zFEttlP3cI=;
        b=dXImFdDFQuNiev9VsBsxGovO5HEkkliS+48AqyRwEQ/IZcbjzEQQZhdP+VWyfW03gv
         Xm8q6+xO+/2YChLTvYvTdQYr21yyZGZIo3dJiVsxvpKHFMU29hPEH4f2RDCQWB1k19N2
         fUEShwyiYx5Qd9ZcBAJ6NVU6VjYl8GkkT/cNos5HEH/enGef2ccrtK9c3I+7CApXngvw
         plE3WS1qfe0+8GvIW7gsG9kpRNCkrqqajn3Kz5mE/Jaib9ei8fp5HjhaCDii2lKq2A5H
         hJBEUZeoTo/bXDiKofh0ihoFH3IyhM0OnGCAvBsbgUH7+KHLbRRldCOelZzLavu6xcbo
         6x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874329; x=1782479129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=in4wc4RHuN4wnGlvZnYvNPCqhNJf+PX4+zFEttlP3cI=;
        b=AvXcwSX22UBLFMr2sjadPwkA1/0x1XmpF9IsXsLNbKmGgl4Bs1PaymOBj3lU3NjY3k
         rRTfIb9bUOD9bbXpnZPt/T4fEZD8IILfy7SP4GYz4nH6oNYZUEzuev/gXAYY3csppHno
         TzMItJL9PLevgCatdtBPKFyjHy1rpDlWBGy4arFu5zRfcfa3RzP0YZjSVrSE4FE1tOhi
         gZ51e2W5bWoucEX45fMsYbe306XdCdxP08bNnx261rnS0vF9tMKP7tIFXLJSyKS+aXWm
         aHCXJ7yOMM6i6qu+lFrIurt+Dr0Ati+TaxW6H7Grn+i/XxBlh4blRYGsnLwnHUcHTF6E
         v4xQ==
X-Gm-Message-State: AOJu0YxAhAYGsm7GamwO5FTPHYNqX7YSvRqhbFhzXiCqXjzmGPTfg+4O
	GOETafrsHq/BlZbKjXmhJv3UBKkIjpTUOXs+45GIHtYZutmN/yhkhiDc04Uh6K9w5OA=
X-Gm-Gg: AfdE7clCsAHT1kK05Uko6Aa5701JROmBmq1chYJmgejV6vsbkq7bHwM7joRU4e0fBTM
	b9kFreJFe1R2j/RBnO81b+/mWMr8wS6LdImi9LHi9fTfZyTZNHEf+mA5xvu7fGCAsjb15C1vtou
	Jzdwao1lYPHlH/vS7RBCm4t7UX3I5AZYFvUrUiE+Og5DRluHslF9ds8BeWckpCGyVzgaxyp3y9v
	n7owdX8+SbrNcZGOeI1URi7fThU+axplyz9pP5eQ9baE03rCLTZbq5tQl98kDIV0QYd2lhktk6O
	Ly16r5Uq6gr0yySbjx/eIF/6oCo5w6g/O4TKfaijxKTKIHd/6EGevjro/0ItXu5nv1i3UM5DEBt
	YvUQ1TyM9D6BjUcbY5YLIWktEQyZNAeHABevfw6xVG7ass2mE77jeD7FI7yVK6HJKj1dYVtJD52
	59Q3j6C6yfAL3vtWYxkNfshmbuMbT2tS0JSiYOjy3KSi9KNZrYtR4WV9vWCxesrq+y8PrfAoGOm
	GMz8znT
X-Received: by 2002:a5d:5d10:0:b0:462:4b98:3c83 with SMTP id ffacd0b85a97d-4656f4704a9mr3496293f8f.23.1781874329118;
        Fri, 19 Jun 2026 06:05:29 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH Linux v6 16/16] xen/privcmd: Add new ABI to allow copying foreign memory
Date: Fri, 19 Jun 2026 14:05:01 +0100
Message-ID: <20260619130501.272832-17-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781874329-9FFD2127-5BD508FC/0/0
X-purgate-type: clean
X-purgate-size: 5338
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: 5A2576A5F23

This new ABI allows to copy foreign domain memory to/from a buffer.
This avoids having to map/copy/unmap foreign memory which is
expensive.
This operation is done particularly when migrating VMs.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v4:
- fix wrong assign;
- use set_xen_guest_handle to set handle;
- wrap slow hypercall with xen_preemptible_hcall_{begin,end};
- use _IOWR for ioctl code to be more specific;
- use __copy_to_user if buffer already checked.

---
 arch/x86/include/asm/xen/interface.h |  1 +
 drivers/xen/privcmd.c                | 49 ++++++++++++++++++++++++++++
 include/uapi/xen/privcmd.h           | 10 ++++++
 include/xen/interface/memory.h       | 37 +++++++++++++++++++++
 4 files changed, 97 insertions(+)

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
index 725a49a0eee7..67bf085d91e1 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -1522,6 +1522,51 @@ static inline void privcmd_ioeventfd_exit(void)
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
+	if (copy.num >= U32_MAX >> PAGE_SHIFT)
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
+	set_xen_guest_handle(xcopy.frame_list,  (__force xen_pfn_t *)copy.pfns);
+	set_xen_guest_handle(xcopy.buffer, (__force uint8_t *)copy.buffer);
+
+	xen_preemptible_hcall_begin();
+	ret = HYPERVISOR_memory_op(XENMEM_foreigncopy, &xcopy);
+	xen_preemptible_hcall_end();
+
+	/* copy values back in case of error */
+	if (ret) {
+		copy.num = xcopy.nr_frames;
+		copy.pfns = xcopy.frame_list;
+		copy.buffer = xcopy.buffer;
+		if (__copy_to_user(udata, &copy, sizeof(copy)))
+			ret = -EFAULT;
+	}
+
+	return ret;
+}
+
 static long privcmd_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long data)
 {
@@ -1569,6 +1614,10 @@ static long privcmd_ioctl(struct file *file,
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
index 8e2c8fd44764..993b501e35bf 100644
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
+	_IOWR('P', 11, struct privcmd_foreigncopy)
 
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


