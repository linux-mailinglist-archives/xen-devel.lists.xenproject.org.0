Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A3AB98E3
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986622.1372200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPz-0000fq-6x; Fri, 16 May 2025 09:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986622.1372200; Fri, 16 May 2025 09:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPz-0000cD-2P; Fri, 16 May 2025 09:31:51 +0000
Received: by outflank-mailman (input) for mailman id 986622;
 Fri, 16 May 2025 09:31:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bfyI=YA=bounce.vates.tech=bounce-md_30504962.682705fa.v1-ae12c7e11c6b46ecaa70ec2e79b33b58@srs-se1.protection.inumbo.net>)
 id 1uFrPx-0007iv-Cq
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:31:49 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 968e0369-3238-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:31:47 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzMKQ4KDyzMQxf5q
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 09:31:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ae12c7e11c6b46ecaa70ec2e79b33b58; Fri, 16 May 2025 09:31:38 +0000
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
X-Inumbo-ID: 968e0369-3238-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747387898; x=1747657898;
	bh=Oox53sOqqEj7n70xDwRKrmCV5uYcvtps8LZ1Ru6v/p8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KvBJB/Xd7dfLSXDq+onoyyhu9vlIpJ01RPlAMHpUkNrDLHO0da6s8DXedToNtqJpF
	 edTWaKLH+gEtesih0q6wA4Y92cj6pRlwHphspzufgc0CZtU7n6YowIA3Kze6WQepZO
	 7AwOgQyu9pToah/qoWyKNhkEiS3JinE5ArVDRrxqIBM+aPoBUyVRJeSUA7uCx3MdGG
	 WjdkoKAV1UQWXlfOZIEqOTOj0iGWQoAhPxyGptKsQchptwtC2G5dNkvqlWkl5kJJ85
	 A4E7X7/g+qQI61ogN1W44V/glYLNnOSQOba/4ukF3bI6nlEPd+TxtLWsuKSf9IdY6v
	 y4XeMtPuyD66Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747387898; x=1747648398; i=teddy.astie@vates.tech;
	bh=Oox53sOqqEj7n70xDwRKrmCV5uYcvtps8LZ1Ru6v/p8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FsyVngK12yS6ADyP2czz7V2rFvDLbGfkTScNlU2qUivy+qC53e6LuVfsuCc/dtZ4X
	 D7sEw3lopvGxzjJWG6fVB5TZIfffKD/luCA2Sqn1i6GDLghUD5g7fZay+ACIt9hsvN
	 rnE/wVw2i0nHKpfdV/qLSjDR+dGUy60Mh17yJ00hXDQf/5wj0RSG7SqVtD3cgzDF/r
	 ioOvGv9ckejUdM2KKYL/fphQysef1kK+jzqR5sud5R3tAkORdLAq4yDzJrV8jV9YWb
	 F589qN9X3Wy+K8s6WonyYInbQ1rvRnrbAPRgBy07d2xWnRVTFQTGoBc2OHljRIFcsg
	 1Jn+cWMX6w2Vg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2005/16]=20docs/x86:=20Document=20HVM=20Physical=20Addresss=20ABI?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747387897417
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <a59bc38b9c16b74b15a2ee66f56e61785ce76d57.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ae12c7e11c6b46ecaa70ec2e79b33b58?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 09:31:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 docs/guest-guide/x86/hypercall-abi.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x86/hypercall-abi.rst
index e52ed453bc..710a02895b 100644
--- a/docs/guest-guide/x86/hypercall-abi.rst
+++ b/docs/guest-guide/x86/hypercall-abi.rst
@@ -35,6 +35,10 @@ The registers used for hypercalls depends on the operating mode of the guest.
 HVM guest depends on whether the vCPU is operating in a 64bit segment or not
 [#mode]_.
 
+If `XEN_HVM_CPUID_PHYS_ADDR_ABI` is supported, HVM guests can use a alternative
+ABI where physical addresses are used for hypercall parameters instead of
+linear addresses. This ABI can be used by tagging the hypercall index with
+0x40000000.
 
 Parameters
 ----------
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


