Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B7A123B8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872441.1283423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2V8-0007AG-Bo; Wed, 15 Jan 2025 12:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872441.1283423; Wed, 15 Jan 2025 12:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2V8-00077M-8R; Wed, 15 Jan 2025 12:28:02 +0000
Received: by outflank-mailman (input) for mailman id 872441;
 Wed, 15 Jan 2025 12:28:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=emy9=UH=bounce.vates.tech=bounce-md_30504962.6787a9cc.v1-01978c670a2740c9a2057090fc5bb0de@srs-se1.protection.inumbo.net>)
 id 1tY2V6-0006fA-Qs
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:28:00 +0000
Received: from mail178-22.suw51.mandrillapp.com
 (mail178-22.suw51.mandrillapp.com [198.2.178.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26b51770-d33c-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 13:27:58 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-22.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YY4yh6WpnzGlswDW
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 12:27:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 01978c670a2740c9a2057090fc5bb0de; Wed, 15 Jan 2025 12:27:56 +0000
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
X-Inumbo-ID: 26b51770-d33c-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736944076; x=1737204576;
	bh=UBbT0pa4mHPutb6jsuj67GiXKP61nGVqjVTJVp4vaoQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ExUCFpqeXMHcs8IjkSw8YmUBB8hpx8dfVEEThsgQ2MUYQAheOc2PrGfTpnHQRQHzf
	 cBwkhgDINtnMWW5TYTml473RCUESprwo2hmzGsd9SZvl8/fL46xrlREpatqPberhvu
	 5GekSukRGaqJyAEYT8BWxDffqUQxR5VzNXAGK/niScAjh/u7asVQB1Tw3R3I7WUtpa
	 fCuRdI9XjvISAbH3hgrLWEmufdE+x5/9CEz0prrBzarYe553i7OmrG81YbwHH8GxCx
	 V70Yc9urEwcuxAMHXB4US51xWM0ANL9t+L8x5U8cDBuOA25gj65W+uZNMzZQnUwg40
	 ueAhxD/u98beQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736944076; x=1737204576; i=yann.dirson@vates.tech;
	bh=UBbT0pa4mHPutb6jsuj67GiXKP61nGVqjVTJVp4vaoQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=s8waA4eO5T1PYMJlUDBDBxXKYpA2oL59YAV/jb4XWZtvD/LbdlDvinXquMuiWwzAM
	 2izaCSCfXAtHiPW+WoA4ceC/6LRmLBD6XZFLEEoChOHSKU9tGvEEatOJ1K3kFXbCUa
	 ta21s/kMoOKoZeNEz1QP7sn5LA3eIhc2SjQZXkJ1auVsCI0BjxV0cugf3HVQh/YCAZ
	 IpiPJ+sbK3ODNk6EIDTN63csBCHLhntU153pd4lHHEp+k7ht1KktCjmxFHrsiycKOD
	 FUdJDhOFCzma2Wtg+R2U+yfc2ep9dwqO2UkVovdcd0I326CVsBX/Fm2gbdgVDVtGKr
	 odb9pdlTFCm5g==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=203/3]=20docs/sphinx:=20gitignore=20generated=20files?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736944075627
To: xen-devel@lists.xenproject.org
Cc: "Yann Dirson" <yann.dirson@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <a2e4647d1e1a601dbeb4d59348815f7fd3935d67.1736943927.git.yann.dirson@vates.tech>
In-Reply-To: <cover.1736943927.git.yann.dirson@vates.tech>
References: <cover.1736943927.git.yann.dirson@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.01978c670a2740c9a2057090fc5bb0de?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 12:27:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
---
 docs/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/.gitignore b/docs/.gitignore
index 0727c6d7cf..e87b12890a 100644
--- a/docs/.gitignore
+++ b/docs/.gitignore
@@ -10,5 +10,6 @@
 /man7/
 /man8/
 /pdf/
+/sphinx/
 /tmp.*
 /txt/
-- 
2.39.5



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

