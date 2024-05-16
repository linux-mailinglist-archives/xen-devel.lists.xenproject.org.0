Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E517B8C74EC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723125.1127699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Yn5-00085a-19; Thu, 16 May 2024 10:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723125.1127699; Thu, 16 May 2024 10:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Yn4-0007xX-Ma; Thu, 16 May 2024 10:56:50 +0000
Received: by outflank-mailman (input) for mailman id 723125;
 Thu, 16 May 2024 10:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujgU=MT=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7Yn2-0007XN-ML
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:56:48 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdaeafff-1372-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:56:48 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 5B26B8009E;
 Thu, 16 May 2024 11:56:47 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 32D1520189; Thu, 16 May 2024 11:56:47 +0100 (BST)
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
X-Inumbo-ID: fdaeafff-1372-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715857007;
	bh=0RL/5syMYmKDu7gc+zffZXfng7BleYOM9Jn0BEO2t7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eryxgq4RS00dz0XWpf0ry83hU9EsoIJaowHO9dpyp+xEGYa6C9J2Ecl9oDNTtbwIo
	 P1U3pu3D62zCQ5M0OF1oMg5ooOavCYPITm9RDL5jsfvS36j3W6oYUQDRGajMGODqcf
	 8edB1TFYEXpuoPDcMs2HG7sjurrrUzaI7jfx/L1Y=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v3 2/4] tools/xl: add vlan keyword to vif option
Date: Thu, 16 May 2024 11:56:10 +0100
Message-Id: <20240516105612.15306-3-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516105612.15306-1-leigh@solinno.co.uk>
References: <20240516105612.15306-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update parse_nic_config() to support a new `vlan' keyword. This
keyword specifies the VLAN configuration to assign to the VIF when
attaching it to the bridge port, on operating systems that support
the capability (e.g. Linux). The vlan keyword will allow one or
more VLANs to be configured on the VIF when adding it to the bridge
port. This will be done by the vif-bridge script and functions.

Document the new `vlan' keyword in xl-network-configuration(5).

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

---
 docs/man/xl-network-configuration.5.pod.in | 38 ++++++++++++++++++++++
 tools/xl/xl_parse.c                        |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/docs/man/xl-network-configuration.5.pod.in b/docs/man/xl-network-configuration.5.pod.in
index f3e379bcf8..dfc35e72c6 100644
--- a/docs/man/xl-network-configuration.5.pod.in
+++ b/docs/man/xl-network-configuration.5.pod.in
@@ -259,6 +259,44 @@ Specifies the MTU (i.e. the maximum size of an IP payload, exclusing headers). T
 default value is 1500 but, if the VIF is attached to a bridge, it will be set to match
 unless overridden by this parameter.
 
+=head2 vlan
+
+Specifies the VLAN configuration. The format of this parameter is one or more
+VLAN IDs or ranges separated by forward slashes. Each term can be:
+
+=over
+
+=item *
+
+B<vlan> - a single VLAN ID in the range 1 to 4094. This can optionally followed
+by a B<p> to indicate the PVID or by a B<u> to indicate an untagged VLAN. C<p>
+implies B<u>.
+
+=item *
+
+B<vlan1>-B<vlan2> - a range of VLAN IDs from B<vlan1> to B<vlan2>, both between
+1 and 4094 and B<vlan1> being less than or equal to B<vlan2>. This can be
+optionally followed by a B<u> to indicate that the range of VLANs are untagged.
+
+=item *
+
+B<vlan>+B<offset>xB<count> - describing a range of VLAN IDs starting at B<vlan>
+with B<count> additional entries, each incremented by B<offset>. This can be 
+optionally followed by a B<u> to indicate that the range of VLANs are untagged.
+
+=back
+
+Note, one VLAN ID must be marked as the PVID. In the case of a vlan 
+specification consisting of a single VLAN ID (e.g. C<vlan=10>), the B<p> suffix
+may be omitted. Specifying more than one untagged VLAN ID is an advanced 
+configuration - use with caution.
+
+For example:
+
+        'vlan=10' -- meaning a single VLAN that is the PVID.
+        'vlan=10p/20' -- VLAN 10 is the PVID and VLAN 20 is tagged.
+        'vlan=10p/100+10x4' -- VLANs 10, 100, 110, 120, 130, 140, 150.
+
 =head2 trusted / untrusted
 
 An advisory setting for the frontend driver on whether the backend should be
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ed983200c3..7546fe7e7a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -565,6 +565,8 @@ int parse_nic_config(libxl_device_nic *nic, XLU_Config **config, char *token)
         nic->devid = parse_ulong(oparg);
     } else if (MATCH_OPTION("mtu", token, oparg)) {
         nic->mtu = parse_ulong(oparg);
+    } else if (MATCH_OPTION("vlan", token, oparg)) {
+        replace_string(&nic->vlan, oparg);
     } else if (!strcmp("trusted", token)) {
         libxl_defbool_set(&nic->trusted, true);
     } else if (!strcmp("untrusted", token)) {
-- 
2.39.2


