Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755618C1D3B
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 05:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719465.1122234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM0-0007Mr-Bj; Fri, 10 May 2024 03:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719465.1122234; Fri, 10 May 2024 03:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5HM0-0007G8-7L; Fri, 10 May 2024 03:55:28 +0000
Received: by outflank-mailman (input) for mailman id 719465;
 Fri, 10 May 2024 03:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XugN=MN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s5HLy-00077u-DM
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 03:55:26 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ef14a55-0e81-11ef-909c-e314d9c70b13;
 Fri, 10 May 2024 05:55:23 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.west.internal (Postfix) with ESMTP id AD0A2180012B;
 Thu,  9 May 2024 23:55:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 09 May 2024 23:55:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 23:55:17 -0400 (EDT)
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
X-Inumbo-ID: 1ef14a55-0e81-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715313319; x=1715399719; bh=lLrdK6DtjD
	VUONkQTnGTL9QCNQzxUIg1GxNz3rQOZI8=; b=AUsaaCW7QioLA42ri0O7skyWj/
	fWkqCxJvUCjByVjhqLy1jHO5ixhSRIVXrFeV0wBHI16tzkoCvIcuKraxCTS4tMw5
	e9d1ehUovmDMvAyOLJ7fA0xjqDebh05vwdgHCF7BC86xuCsebnLOR7s4ui2hbwNK
	sZTAWsN8VWQdTb0PBSxEVwBPJEyP+RdHHPyi0D/sTmTeCNTVktLkDUmFvXYqQymq
	IjnpQj3/IhSGnpcoUCo4YNIqDsEOJtwLPwsY3SOwypRjpntJuanosgbVdTxL13Ct
	1m04c3ySEr21k3EYxZLRFdMQTE7bm7QwS72grZJNFrVfwn92ov5z2Bb9VzaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715313319; x=
	1715399719; bh=lLrdK6DtjDVUONkQTnGTL9QCNQzxUIg1GxNz3rQOZI8=; b=i
	fW+UsNFVioTzCLTlh9JVlL7RgOAtNEk+43D/Q10Mdfc3BoD0TEzLnajDpqQXoAQS
	c4Sk1Aa9AeZgdFCai3YlOTGNarum/uoDWLp1g36TK8vd8vqoLcHiC6mwsPd7IKhW
	UBra08s1zfNw/RLkUjX1Huz6W6VEfso2AerCpAR4ebxq5izlpJNRkKrpoUSdsgwg
	KU9ILfN5hBbxQF7q21sCf1ft3FQEXTIih5rARn9hJAgXnF3rn66rgLyoAL+90onI
	hN48UjJwCI+t9nCkLZllWfag3LpTnpgn3Iw6bK9w8E9JVUNTBBtt0hHRqfEofszJ
	rSyBGm+praXsuY1B3wTJg==
X-ME-Sender: <xms:p5o9ZlpplyMQXpPYa-bWL8uEoz1waabI6960Gf-64ioN0aYTizf0gQ>
    <xme:p5o9ZnrTDKOCt9-0XU2VoSZ_EKnUl2utTTopwTC8YlQ8PTqgRbx8rbPUiaEK3EFan
    7grGE5v1FUFSg>
X-ME-Received: <xmr:p5o9ZiP_TapxrJ1__ElR7APA_QPlnBed2rpBLUS0HCLbKhr9XxX9KRUaMG6cfXrP77k1yXaUoZ17DIvpml2Jef0mb7UK1m19nEF_wt5Z31v12PieF34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefhedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:p5o9Zg6AlmmswgKPDllOUrAkcQehgJ-SgQJYl_xQlAtgIQn7UYhALA>
    <xmx:p5o9Zk7eTJkHVkTtksw096GpJJjpSZOCg3VFZgcDymp0_ijaehNDgg>
    <xmx:p5o9ZohXQ2ppe4oqP_PIcSC8uMrElgFgpdwU6OHKM2eEqXsSTW8O6g>
    <xmx:p5o9Zm4GTtNpezbxXsxlbdwFSkgOIvLFigfgJVrB8z_m06xbP78jmg>
    <xmx:p5o9Zv205Ediz1ugEFg8_sGSeEttm_Mw1E2kumTY5cqgdgZdSDcrk9TB>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 1/6] x86/msi: Extend per-domain/device warning mechanism
Date: Fri, 10 May 2024 05:53:21 +0200
Message-ID: <0ff02aa7d6f78106a69158794d51c0b32a75431d.1715313192.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
References: <cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The arch_msix struct had a single "warned" field with a domid for which
warning was issued. Upcoming patch will need similar mechanism for few
more warnings, so change it to save a bit field of issued warnings.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
- add MSIX_CHECK_WARN macro (Jan)
- drop struct name from warned_kind union (Jan)

New in v5
---
 xen/arch/x86/include/asm/msi.h | 17 ++++++++++++++++-
 xen/arch/x86/msi.c             |  5 +----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 997ccb87be0c..bcfdfd35345d 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -208,6 +208,15 @@ struct msg_address {
                                        PCI_MSIX_ENTRY_SIZE + \
                                        (~PCI_MSIX_BIRMASK & (PAGE_SIZE - 1)))
 
+#define MSIX_CHECK_WARN(msix, domid, which) ({ \
+    if ( (msix)->warned_domid != (domid) ) \
+    { \
+        (msix)->warned_domid = (domid); \
+        (msix)->warned_kind.all = 0; \
+    } \
+    (msix)->warned_kind.which ? false : ((msix)->warned_kind.which = true); \
+})
+
 struct arch_msix {
     unsigned int nr_entries, used_entries;
     struct {
@@ -217,7 +226,13 @@ struct arch_msix {
     int table_idx[MAX_MSIX_TABLE_PAGES];
     spinlock_t table_lock;
     bool host_maskall, guest_maskall;
-    domid_t warned;
+    domid_t warned_domid;
+    union {
+        uint8_t all;
+        struct {
+            bool maskall                   : 1;
+        };
+    } warned_kind;
 };
 
 void early_msi_init(void);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index e721aaf5c001..42c793426da3 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -364,13 +364,10 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
             domid_t domid = pdev->domain->domain_id;
 
             maskall = true;
-            if ( pdev->msix->warned != domid )
-            {
-                pdev->msix->warned = domid;
+            if ( MSIX_CHECK_WARN(pdev->msix, domid, maskall) )
                 printk(XENLOG_G_WARNING
                        "cannot mask IRQ %d: masking MSI-X on Dom%d's %pp\n",
                        desc->irq, domid, &pdev->sbdf);
-            }
         }
         pdev->msix->host_maskall = maskall;
         if ( maskall || pdev->msix->guest_maskall )
-- 
git-series 0.9.1

