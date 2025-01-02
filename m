Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE79FF70C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863729.1275092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpu-0004t7-6C; Thu, 02 Jan 2025 08:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863729.1275092; Thu, 02 Jan 2025 08:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGpu-0004rY-25; Thu, 02 Jan 2025 08:45:46 +0000
Received: by outflank-mailman (input) for mailman id 863729;
 Thu, 02 Jan 2025 08:45:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3rD=T2=bounce.vates.tech=bounce-md_30504962.67765233.v1-df1be6e558d14edfa793741efcf07dff@srs-se1.protection.inumbo.net>)
 id 1tTGps-0004rF-0c
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:44 +0000
Received: from mail180-50.suw31.mandrillapp.com
 (mail180-50.suw31.mandrillapp.com [198.2.180.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1f4674c-c8e5-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 09:45:41 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-50.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fC5pWxzCf9LdN
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 df1be6e558d14edfa793741efcf07dff; Thu, 02 Jan 2025 08:45:39 +0000
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
X-Inumbo-ID: f1f4674c-c8e5-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807539; x=1736068039;
	bh=BJl20UXfBA4BW0v81Q6NN4eicGukuW4vkuA5YVw5iK4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=R2HyN6daFUx7f/DGci4uyqP1DGfmGBFXYvMbr7UXaGvdwtiwsTbHFHiZsr0+GOXuF
	 A3D6aWyivUX/ukCkeRQ0FDzYPC4dgm7HP7TDgC3BLj0U1RU6tSMnItZV0xaOmrZu/Z
	 YWcYyW8EGIDmVz3kbo7y8YsEzvDH+kZzUmT8azr+mtYNcLOLSLbO/9lZ9ELTmiXNtn
	 tg5q8HyAr9KvN3rApou2nfV9Ao0jijvI27vuqqX0wv9MS6bAItYjpnBvPyLzZTEP4M
	 BSXHZq5VDWkkO3dinfIfbMwjqeFvGcwKJ5q6u2r+/pZ2PjfgPB903j5GRCzh06iUQF
	 kWIlfcmPg7IcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807539; x=1736068039; i=ngoc-tu.dinh@vates.tech;
	bh=BJl20UXfBA4BW0v81Q6NN4eicGukuW4vkuA5YVw5iK4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hEV/1FEFqKFnyK7Vu6MLCMxGqVFzDgIr9pq9Urh6J5V1TmqGYD5eipLawoj0SOstN
	 zMso3m0sQ6O+yWz697lo+CiTrHrXGmUxXGdkrvop3jB/2BIgwrXEvjSl+DqOVBbYHI
	 k7uWaUDxb9J1WZpn1s38hL0TsYwIYONUBW21dhfIE+cu+Z/4oD3IelqwCgbz23JMkw
	 US36Xt4nip40aaUwDtp4VTmHVkPRbcpuxVAbYR4iUyukz1SbERhDqJQ0qqy+SMyjf8
	 xQsQYvnQ2x72D3Pim1X+EzwWIFX2n0MkPLEhH1LcK2ABFuMeTKBJJuCkuaW7MjF3Q5
	 zu5h9TexRgPYA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2001/10]=20x86:=20Add=20architectural=20LBR=20definitions?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807538677
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-2-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.df1be6e558d14edfa793741efcf07dff?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/include/asm/msr-index.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 9cdb5b2625..97df740b04 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -112,6 +112,8 @@
 #define  MCU_OPT_CTRL_GDS_MIT_DIS           (_AC(1, ULL) <<  4)
 #define  MCU_OPT_CTRL_GDS_MIT_LOCK          (_AC(1, ULL) <<  5)
 
+#define MSR_LER_INFO                        0x000001e0
+
 #define MSR_RTIT_OUTPUT_BASE                0x00000560
 #define MSR_RTIT_OUTPUT_MASK                0x00000561
 #define MSR_RTIT_CTL                        0x00000570
@@ -193,6 +195,16 @@
 #define MSR_UARCH_MISC_CTRL                 0x00001b01
 #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
 
+/* Architectural LBR state MSRs */
+#define MSR_LBR_INFO(n)                     (0x00001200 + (n))
+#define MSR_LBR_CTL                         0x000014ce
+#define  LBR_CTL_VALID                      _AC(0x7f000f, ULL)
+#define MSR_LBR_DEPTH                       0x000014cf
+#define MSR_LBR_FROM_IP(n)                  (0x00001500 + (n))
+#define MSR_LBR_TO_IP(n)                    (0x00001600 + (n))
+/* Must be updated along with XSTATE LBR state size */
+#define NUM_MSR_ARCH_LBR_FROM_TO            32
+
 #define MSR_EFER                            _AC(0xc0000080, U) /* Extended Feature Enable Register */
 #define  EFER_SCE                           (_AC(1, ULL) <<  0) /* SYSCALL Enable */
 #define  EFER_LME                           (_AC(1, ULL) <<  8) /* Long Mode Enable */
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

