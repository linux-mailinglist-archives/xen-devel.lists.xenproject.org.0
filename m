Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VfXWH0DQLWrxkQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B267FD1D
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VPEbClme;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337574.1598961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDN-0005Bn-MU; Sat, 13 Jun 2026 21:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337574.1598961; Sat, 13 Jun 2026 21:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDN-00052N-D1; Sat, 13 Jun 2026 21:48:29 +0000
Received: by outflank-mailman (input) for mailman id 1337574;
 Sat, 13 Jun 2026 21:48:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWDJ-0004IA-Bw
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWDI-008PGn-Ox
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd008-5cb7-0a2a0a5109dd-0a2a4503cafc-20
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:24 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd028-672d-0a2a45030019-d155802fe467-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:24 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490be03d47bso21011915e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:24 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387304; x=1781992104; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GO+OrmTMVGaC0OpwuAjvGTXKlxzTulJK0lDq0/wgpGg=;
        b=VPEbClme/eaWceGZUChmMmSgnNFkgAdbwnIrsDOqW9iWjZJARzL397oL83TlSlEcS/
         WF/erNkJvk567/4Ka/mYZYPLVXNhRNBDpVcM8SFyAsxFmZr56t0m1jm4c4dv5d4uIWjH
         Mr76L7wx4pEfvaAh1GcAikFS5PEHIvBtyAw/fVwzJISQPRYOLQHSx9deJ6n3MJyTfcle
         hLUgB2QgXyuoyd7pXWGf6DKQA6j1/87s/tT6RlNj4NnBHR+i3Z8TA/D2isGv8LZMVVgT
         ok61ukHWkJgbPwLsejIi6huX62TAIQ66oNWDJGz9gDKmBocP93MM71jrOJ7xu8YjdDMH
         zIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387304; x=1781992104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GO+OrmTMVGaC0OpwuAjvGTXKlxzTulJK0lDq0/wgpGg=;
        b=Kpv9KqZ7RCK5sDh0K+ooWiv6qAsVU+JLlH+LXfFJ07hLhnKzInZTiS31d+fxZ+k+YR
         gUVKR03v/u730x+OBLeLQ8mAAx/xbA/zFfHuiw/S5Qm50BxZOIM+L5ABjjJWG5AWQw8w
         1TMtGbRwgKXDJCFlT1PO4lrZvnsPjKGAUioL1xGm/sg6d/E/tgDSbMm14WQWtUdXmc8Y
         XZKv6yCmiMvqkOI4fIRO5d1GRObk95qz2gDwqALPo7PkG6bIJj9uDLrayNQIRkR551y6
         L4SkY+2uJGBzNjE0yXE4uCQMu5OYdZfV3y7Tym3Vv7OsJ441u9Yrhv4/8p8gnRoMME9S
         Gckw==
X-Gm-Message-State: AOJu0YwEVh9u69rjveOWdZyhUmtpTycYuMUSyupjtnZpE3hnb/olFcQQ
	0ORfV6et6IvMbNPJwHxbar1R1cB5JUKeWhvJI795fYB60DabXH/yAEYLm6vxq+uaKgs=
X-Gm-Gg: Acq92OHf6nLR4sQmP0FOvcPaMjAuLWrnY1mzxiDS+2eIEaCf1ntm3Vl3LroebUlcTu4
	1JthL/v0Fs49D/G5G6xvC5Fcgw0ixvBzCsQcTqzqLhl8AuhW7/tFeTyROkyzHL3RxWod5BYhBuh
	/Q/KFVkUurfEHM4xU2s7jpvroDl0GgkKsNgtNwbosvSJ8Upp/RRh0aXlMf3fln0EUf8s2oZUDIK
	CLhQ6lN/jt3A4ONWz3zcgSksuN/dAByA+fu0mWx1b7DoKhUSydRUc880l17uYHNHNNiAH4lgoqo
	8u/WGAOTUele1zjfOGr4eZo8KyVRnXCsLD8dVgVBWy7jqKGUNuWKvpRT6amcePzSe4aDwkptNcE
	ijBfDFm8Ugm0u0s7mmen272x0K9ZWkWQ0+UQS4QPUzwJnRVKy11RgjJf/jKGziMLBXU4jEtUwBK
	VE3cXQanTktf1ybF6/yLuh+P5mkKe1s7K+9uRhoWFS9Lxb8rRgaeDrJDxlbOax/zi+XX0iq87HT
	AqhxoJLzbO36qpIZgJZHYzsrA==
X-Received: by 2002:a05:600c:c177:b0:490:c2a3:3303 with SMTP id 5b1f17b1804b1-490ec51f18dmr104287785e9.34.1781387304042;
        Sat, 13 Jun 2026 14:48:24 -0700 (PDT)
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
Subject: [PATCH Linux v5 16/16] xen/privcmd: Add new ABI to allow copying foreign memory
Date: Sat, 13 Jun 2026 22:47:49 +0100
Message-ID: <20260613214749.20620-17-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781387304-38975938-0D1DB09A/0/0
X-purgate-type: clean
X-purgate-size: 5391
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:mid];
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
X-Rspamd-Queue-Id: 302B267FD1D

From: Frediano Ziglio <frediano.ziglio@citrix.com>

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
 include/xen/interface/memory.h       | 37 ++++++++++++++++++++
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
index 725a49a0eee7..4ae9138dd314 100644
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


