Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843EA69DD42
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 10:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498694.769573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPIm-0005fD-Iq; Tue, 21 Feb 2023 09:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498694.769573; Tue, 21 Feb 2023 09:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPIm-0005cY-G4; Tue, 21 Feb 2023 09:51:12 +0000
Received: by outflank-mailman (input) for mailman id 498694;
 Tue, 21 Feb 2023 09:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES0Q=6R=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pUPIl-00055b-SN
 for xen-devel@lists.xen.org; Tue, 21 Feb 2023 09:51:12 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aa5f70d-b1cd-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 10:50:28 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 na9-20020a17090b4c0900b0023058bbd7b2so4114919pjb.0
 for <xen-devel@lists.xen.org>; Tue, 21 Feb 2023 01:51:03 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902c21100b00199190b00efsm9493493pll.97.2023.02.21.01.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:51:01 -0800 (PST)
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
X-Inumbo-ID: 2aa5f70d-b1cd-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wNQkeraNsuw6hFISAboGasHi5jkq9Qw1lk2C7Y7QJNM=;
        b=Sp7J+0CTBva8aEj2O9RPa7/fe/vPPgO/x/0R35WMCIEt+K5/CuaIDpJV5pICjBM3i/
         7+YqI+uYKU28wB0J6rXEsxFspuixkueTtJC1QuHP618WlV+JcjMm7ok4BlQCOStrfpNM
         2yQVECM/gqB9R4OI372Uh0Ob8q/K1DnWn1311m8zKpRNAwuAVkwMdZXA366q40fR2nt8
         +kg02BiIzImPF1W3uJpLDlBacsl39TblpS4TdxtPbW5oVShvfF9GEySZukT2XuIVm+KG
         ppaGdIC0ARz6+iYjOoPQ3rYf6JzbmxSu+M/7nVry3YTqF5A1nug85vTy/hUml6ZvFuwm
         u/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNQkeraNsuw6hFISAboGasHi5jkq9Qw1lk2C7Y7QJNM=;
        b=K9YjHoc+WM16Zgg5848SXDmMov1LeSRlzR+4H0ajk58yC7qRjP9zgp+2OxQAOmhnm7
         mAn/68+kLKjRAYtueGiSp9EoEQhEq/Qlugo5NL3KBPdZWiCrcMQo12ArICgCYLSdXPqa
         PUQixpf0SxliFOHGtGYApTijL4bLOv5Lb6AQltLM0JNYp382EoatFCiE7NKodvvoqxZ2
         KrnGbcfFR4IR7G1Y1x8JxU8MO2a1Znp6ehNDoqfa5dg0GcReTRrsy+uzZaOh8BPI5F1N
         vKU9LTGL7gX5WXjb5uAhZX4VpOAOA22Z0lz2xiVTjWMnROy08L+gVPH9x9o7MhFkrgwc
         aedg==
X-Gm-Message-State: AO0yUKUAY7Ve2/FsmENXpJ71wIeKIddp3fvQCmi8gtx5F/D3kJ9LanDs
	DWf8IdpTBJtQe2YzPiaUR5+nMQ==
X-Google-Smtp-Source: AK7set/pSiw2S4PkO5YI37ejuDhSsbMg0prresPSYVtL1WK1e+9RTLesegPL247GZtqxm3Qr6U8vqw==
X-Received: by 2002:a17:902:ee91:b0:19a:b302:5158 with SMTP id a17-20020a170902ee9100b0019ab3025158mr4053751pld.29.1676973062371;
        Tue, 21 Feb 2023 01:51:02 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
	virtio-dev@lists.oasis-open.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [RFC QEMU] docs: vhost-user: Add custom memory mapping support
Date: Tue, 21 Feb 2023 15:20:41 +0530
Message-Id: <d9beee5f7b4a4acdb5f5eff8af55bed50b33d722.1676971686.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current model of memory mapping at the back-end works fine with
Qemu, where a standard call to mmap() for the respective file
descriptor, passed from front-end, is generally all we need to do before
the front-end can start accessing the guest memory.

There are other complex cases though, where we need more information at
the backend and need to do more than just an mmap() call. For example,
Xen, a type-1 hypervisor, currently supports memory mapping via two
different methods, foreign-mapping (via /dev/privcmd) and grant-dev (via
/dev/gntdev). In both these cases, the back-end needs to call mmap()
followed by an ioctl() (or vice-versa), and need to pass extra
information via the ioctl(), like the Xen domain-id of the guest whose
memory we are trying to map.

Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_CUSTOM_MMAP', which
lets the back-end know about the additional memory mapping requirements.
When this feature is negotiated, the front-end can send the
'VHOST_USER_CUSTOM_MMAP' message type to provide the additional
information to the back-end.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/interop/vhost-user.rst | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3f18ab424eb0..f2b1d705593a 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -258,6 +258,23 @@ Inflight description
 
 :queue size: a 16-bit size of virtqueues
 
+Custom mmap description
+^^^^^^^^^^^^^^^^^^^^^^^
+
++-------+-------+
+| flags | value |
++-------+-------+
+
+:flags: 64-bit bit field
+
+- Bit 0 is Xen foreign memory access flag - needs Xen foreign memory mapping.
+- Bit 1 is Xen grant memory access flag - needs Xen grant memory mapping.
+
+:value: a 64-bit hypervisor specific value.
+
+- For Xen foreign or grant memory access, this is set with guest's xen domain
+  id.
+
 C structure
 -----------
 
@@ -867,6 +884,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_CUSTOM_MMAP          17
 
 Front-end message types
 -----------------------
@@ -1422,6 +1440,20 @@ Front-end message types
   query the back-end for its device status as defined in the Virtio
   specification.
 
+``VHOST_USER_CUSTOM_MMAP``
+  :id: 41
+  :equivalent ioctl: N/A
+  :request payload: Custom mmap description
+  :reply payload: N/A
+
+  When the ``VHOST_USER_PROTOCOL_F_CUSTOM_MMAP`` protocol feature has been
+  successfully negotiated, this message is submitted by the front-end to
+  notify the back-end of the special memory mapping requirements, that the
+  back-end needs to take care of, while mapping any memory regions sent
+  over by the front-end. The front-end must send this message before
+  any memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_TABLE``
+  or ``VHOST_USER_ADD_MEM_REG`` message types.
+
 
 Back-end message types
 ----------------------
-- 
2.31.1.272.g89b43f80a514


