Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A9C8C0658
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 23:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718969.1121585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4p0D-0004ry-Cq; Wed, 08 May 2024 21:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718969.1121585; Wed, 08 May 2024 21:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4p0D-0004oV-7u; Wed, 08 May 2024 21:39:05 +0000
Received: by outflank-mailman (input) for mailman id 718969;
 Wed, 08 May 2024 21:39:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nd4S=ML=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s4p0B-00044I-A9
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 21:39:03 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 611f7b26-0d83-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 23:38:59 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 292668009F;
 Wed,  8 May 2024 22:38:59 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 030132017E; Wed,  8 May 2024 22:38:59 +0100 (BST)
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
X-Inumbo-ID: 611f7b26-0d83-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715204339;
	bh=+Btd9KVZELds4IWrVvm32cKo9jGdEkoWQ7GZ1KHgtYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iHPObwfQZEAy1JyUCQI4BAtqbCaTT/dlCv37rO2Tt0tG39UPsSmaCC9mwPwyFt4IQ
	 +rimKjAj/Q+t6x+DEPJ27PJCTpSOZdmsPehguoNqyyneNPNuf2gvVcmRHkcrIvg8fC
	 q2CkZe+gi2jwfxPg+R2DcTX6MLSnk/wLidltzK4g=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [RFC PATCH v2 4/5] docs/man: document VIF vlan keyword
Date: Wed,  8 May 2024 22:38:23 +0100
Message-Id: <20240508213824.55824-5-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508213824.55824-1-leigh@solinno.co.uk>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new `vlan' keyword in xl-network-configuration(5).

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 docs/man/xl-network-configuration.5.pod.in | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/docs/man/xl-network-configuration.5.pod.in b/docs/man/xl-network-configuration.5.pod.in
index f3e379bcf8..c35c0922b3 100644
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
+	'vlan=10p/20' -- VLAN 10 is the PVID and VLAN 20 is tagged.
+	'vlan=10p/100+10x4' -- VLANs 10, 100, 110, 120, 130, 140, 150.
+
 =head2 trusted / untrusted
 
 An advisory setting for the frontend driver on whether the backend should be
-- 
2.39.2


