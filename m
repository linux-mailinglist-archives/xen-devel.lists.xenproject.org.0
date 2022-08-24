Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13905A031F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 23:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392945.631595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQxYf-0001Fz-Kz; Wed, 24 Aug 2022 21:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392945.631595; Wed, 24 Aug 2022 21:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQxYf-0001D0-HV; Wed, 24 Aug 2022 21:05:05 +0000
Received: by outflank-mailman (input) for mailman id 392945;
 Wed, 24 Aug 2022 21:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YMFn=Y4=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oQxYd-0001Cu-UW
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 21:05:04 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69e17ddc-23f0-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 23:05:01 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C54143200959;
 Wed, 24 Aug 2022 17:04:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 24 Aug 2022 17:04:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Aug 2022 17:04:56 -0400 (EDT)
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
X-Inumbo-ID: 69e17ddc-23f0-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1661375097; x=1661461497; bh=yE/a49KCDC/wAg21Ynv+sCjtM31EEPC4C76
	5bis3j/g=; b=kZO7wjDNGYf9uWymjyupq6f+U+MYCAetEv9DeFYeLrHZ8eTJUhW
	vRY++HEiFm6EBVZxLaUJAZCAgiVolePolcDfXjnAiplGCgd5/LvbY24yGohR+tcn
	udM/C2fTHY0xVym2BiDJbc9v06hb8P2InGdsdbzOZC/9MC5N5aFCow9HMThAOpQx
	cGK7dycmN4m53ST2g1Guj82Kkl1jURUYqr8xGuZTo9zp0KRQHpmTVejPz/4Tt/ka
	LH0Zumd+zIhkSw5fAhY+a6VUqIoNsqzy8Y5o04JjOKtFmjtzascJn5iZHtG5kknK
	faAacLI9cP0J7UwsVA6B5B45X0LxL+cE+jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1661375097; x=1661461497; bh=yE/a49KCDC/wA
	g21Ynv+sCjtM31EEPC4C765bis3j/g=; b=WgpGHq4CuC7CJD6ShkOfng5Oozv7D
	8HtBkWEHeEVvb8364x84L3RN7iiHXK85bT+5jtM+qkKDqx6XjWImeWXYtWV1tbCI
	y75T2VgnnW4tTvdBMR8IQjzTaSO6Tj1WCQZJKRVIpIr1V/QX8YwtPQTMHxKP08jb
	/NHPlFZSlMqTsvrJLFMpkajfS1iurGzL+Zyi0Uj9YXHAhJ2bzZWg2m6JDrRAb2nQ
	3OSOeUaYwuPGZo5uEIqJDL8ElLOegrq3sgTHkKDZgaRbYnSMlK7/CLpH7LzyQdhE
	94I7CVYeXnhFEuY/5p1IuchAiebYQ9I4pdIDBY3LkS2QIFrZ55EYng3Yw==
X-ME-Sender: <xms:eZIGY6QXwd8BPKEqvr2qjVLLg-MMzICxM2h__-Aolcd2Y-xBqOwQoA>
    <xme:eZIGY_yEmguTJ8iP1xCIWRfp0X55-ib_LOmaTQoLmIj4yPgNZhqpzdZ8WDVf2RbpZ
    nKZ9STr0vb5igo>
X-ME-Received: <xmr:eZIGY31f9ds9o9gEyFp_nkr032QXXfL65rl9tyRYRJsRktGHz7WBnk5D9rTHANZovius_usQWl9M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfeggfeiiedtieejgedutdekgfet
    geehheegteekvefhfefgudehtdevleegueegnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:eZIGY2BiY81HHZXk8ujuFvGSjNZo9xp4CU6GTvlR7xJEFNbBXS3rrg>
    <xmx:eZIGYzjnduqudKkmN09PYUV_eM0Z5oM1b9mcsMIaR_vqabpNCLZCxw>
    <xmx:eZIGYypf4-BBOfwDLLpeauBrho49wp2OHttuaaPC0uAJ6nrpeWmIsQ>
    <xmx:eZIGY7ZZICd4H97seje80nyj8C4Cfw0QEE8va33gT94V4qKz6VtFmg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] Make XEN_FW_EFI_MEM_INFO easier to use
Date: Wed, 24 Aug 2022 17:04:52 -0400
Message-Id: <20220824210452.3089-1-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The XEN_FW_EFI_MEM_INFO platform op has very surprising behavior: it
only sets info->mem.size if the initial value was *larger* than the size
of the memory region.  This is not particularly useful and cost me most
of a day of debugging.  It also has some integer overflow problems,
though as the data comes from dom0 or the firmware (both of which are
trusted) these are not security issues.

Fix both of these problems by unconditionally setting the memory region
size and by computing it in a way that is immune to integer overflow.
The new code is slightly longer, but it is much easier to understand and
use.
---
 xen/common/efi/runtime.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index a8fc2b99ae098d74af1978bdf58212eb99cce70f..a086850c9b0bbb6e4dd3ccca647c09d346f87c55 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -269,19 +269,21 @@
     case XEN_FW_EFI_MEM_INFO:
         for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
         {
+            uint64_t len;
             EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
-            u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
+
+            if ( desc->NumberOfPages > (UINT64_MAX >> EFI_PAGE_SHIFT) )
+                len = UINT64_MAX;
+            else
+                len = desc->NumberOfPages << EFI_PAGE_SHIFT;
 
             if ( info->mem.addr >= desc->PhysicalStart &&
-                 info->mem.addr < desc->PhysicalStart + len )
+                 info->mem.addr - desc->PhysicalStart < len )
             {
                 info->mem.type = desc->Type;
                 info->mem.attr = desc->Attribute;
-                if ( info->mem.addr + info->mem.size < info->mem.addr ||
-                     info->mem.addr + info->mem.size >
-                     desc->PhysicalStart + len )
-                    info->mem.size = desc->PhysicalStart + len -
-                                     info->mem.addr;
+                info->mem.size = len - (info->mem.addr - desc->PhysicalStart);
+
                 return 0;
             }
         }
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

