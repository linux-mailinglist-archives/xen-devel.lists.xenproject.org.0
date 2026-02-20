Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEaFEc5PmGkBGAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 13:13:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B57167723
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 13:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237068.1539531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtPN4-0002Od-W5; Fri, 20 Feb 2026 12:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237068.1539531; Fri, 20 Feb 2026 12:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtPN4-0002ML-TR; Fri, 20 Feb 2026 12:12:34 +0000
Received: by outflank-mailman (input) for mailman id 1237068;
 Fri, 20 Feb 2026 12:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8OLq=AY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vtPN3-0002MF-7c
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 12:12:33 +0000
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d1fc496-0e55-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 13:12:30 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 227EB7A0068;
 Fri, 20 Feb 2026 07:12:28 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Fri, 20 Feb 2026 07:12:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Feb 2026 07:12:26 -0500 (EST)
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
X-Inumbo-ID: 6d1fc496-0e55-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1771589547; x=1771675947; bh=qtVpbKCQ3+bsYVw2O+QCWfNBAGnNce1p
	FTQ04TaAvzo=; b=f5AsRcpXT2oeNADDjIKmfhhvM92PAY3UzoNkuVtWCn1wWRmr
	3ZkHrgpmgCBHdUaT4TFfW0k4R7w6xbr2GA1RjkbenwOQ2w/I5Y3CdQQ1K3FSxxed
	A0OJyJE8jiV9brNoo0HL6W6OG6+jxM+yCchoroTYvVtNFpXvMOlCJ79FTrzGylUx
	tGsrOS56m4Kp9GvKFtQHeU2HE6WC0Ia3sOmWoO75guouVMsqomLuFswonnXqBqMT
	fSVcfaP4hMReYIwa8BEndtzLAomooX46QQ4S82uxLC8OCIBJ/4FRxlYdB67ycUWv
	83RVPCQzJArynyYFOTvvD/oUFlyS4rZdOW/ZAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1771589547; x=1771675947; bh=qtVpbKCQ3+bsYVw2O+QCWfNBAGnN
	ce1pFTQ04TaAvzo=; b=gKTu6MhnzSJcUZlO4z8bbBSpYrGywHzM+iOwD9S0bkFm
	Cnjm0OPFM4u5m4cAOXCnLb0fx/kT8Jrudv5KId+nk/5Edfe6x2uVYpFT2xYpCehE
	uER/zYyXanqT6Nev97k/27VplVECv7F0EirtHDnk5oFGQo/OFPhQZUTkoSbaHd4I
	Ohe47qNhLx9TNmO11LnOl9WVcaFHPhvMxOeyVLz8AsUzTKsvCtOXj12fHhxL73B/
	PnCDSGESvCAhprLG8wshjPz/qQ7YRONq16nuMGupveFze0teC+vFz/s8TJnam26V
	pr3eu7KNiR3vs5F4e6Zw8OrEL4w0dgNwTqhYDdR/fQ==
X-ME-Sender: <xms:q0-YacG6ETBB1EpAxKjtrFRZlDVlafH5I2G39GAjcFquzhvHUSH1jA>
    <xme:q0-YacWqcFA2KVLNpiPGjH6007A6J5Ma4bVrnLcWdTJOwJwdLaHAoNV17o2RlbWZl
    LkujqnIl5nMbewR_JH-9Bmb2akyqaYFZYWG7jO5a4UKtyAReQ>
X-ME-Received: <xmr:q0-YabLB6yq_PSpxiLjkngocHSN2u8EycGsOcdAExZYS7L-MtdzkTITtBP8E_Q5pYy61tJx4hf5FYi-665jpMGZdkoxDAl_lFR41MLxVPD0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdekgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefhudel
    teelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgv
    rhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehjghhrohhsshesshhushgvrd
    gtohhm
X-ME-Proxy: <xmx:q0-Yac9yn9tYDeFYmlhXFMGc6NHC45_WV4KZHI9uzqWDwEHVNEQtwg>
    <xmx:q0-YaeIRH8ol15lpkKuDRWY9jaxibR4SMQEhSpRarmDpXgiTONSfwg>
    <xmx:q0-YaRn3OcA6Gi_r378AR83wAhvM9z584iVZB_BXCHa9E1tT2LQxdg>
    <xmx:q0-YaSO_pe1uyHXfecJUO4Hy7wj8J5XUwE-t0U7kZ4D-6yZxSPd46w>
    <xmx:q0-YaWxTCiaLh8JyMyTUO4tUiRfgYUmLQ5ODnp8BN-rHCbIc4R3uM_Lu>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3] libxl: constify some local variables for building with glibc 2.43
Date: Fri, 20 Feb 2026 13:12:00 +0100
Message-ID: <20260220121220.52078-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 69B57167723
X-Rspamd-Action: no action

Archlinux just updated glibc to 2.43+r5+g856c426a7534-1 and that
causes libxl build failure:

    libxl_cpuid.c: In function ‘libxl_cpuid_parse_config_xend’:
    libxl_cpuid.c:447:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      447 |         endptr = strchr(str, '=');
          |                ^
    libxl_cpuid.c:452:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      452 |         endptr = strchr(str, ',');
          |                ^
    libxl_cpuid.c:454:20: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
      454 |             endptr = strchr(str, 0);
          |                    ^
    cc1: all warnings being treated as errors

Add missing consts. Note in libxl_cpuid_parse_config_xend() non-const
endptr still is needed, to be compatible with the second argument to
strtoul(). Add second variable for this reason.

And while at it, move semicolon to its own line

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- go back to adding consts, as it wasn't about GCC after all
- reduce variable scope, move semicolon
Changes in v2:
- revert to old standard (specify it explicitly now), instead of
  adjusting the code to the new standard - this way is more
  backport-friendly
---
 tools/libs/light/libxl_cpuid.c    | 21 ++++++++++++---------
 tools/libs/light/libxl_internal.c |  2 +-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 8420b2465f39..14f08df33a14 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -440,29 +440,32 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *policy,
     str = endptr + 1;
     entry = cpuid_find_match(policy, leaf, subleaf);
     for (str = endptr + 1; *str != 0;) {
+        const char *endptrc;
+
         if (str[0] != 'e' || str[2] != 'x') {
             return 4;
         }
         value = str[1] - 'a';
-        endptr = strchr(str, '=');
-        if (value > 3 || endptr == NULL) {
+        endptrc = strchr(str, '=');
+        if (value > 3 || endptrc == NULL) {
             return 4;
         }
-        str = endptr + 1;
-        endptr = strchr(str, ',');
-        if (endptr == NULL) {
-            endptr = strchr(str, 0);
+        str = endptrc + 1;
+        endptrc = strchr(str, ',');
+        if (endptrc == NULL) {
+            endptrc = strchr(str, 0);
         }
-        if (endptr - str != 32) {
+        if (endptrc - str != 32) {
             return 5;
         }
         entry->policy[value] = calloc(32 + 1, 1);
         strncpy(entry->policy[value], str, 32);
         entry->policy[value][32] = 0;
-        if (*endptr == 0) {
+        if (*endptrc == 0) {
             break;
         }
-        for (str = endptr + 1; *str == ' ' || *str == '\n'; str++);
+        for (str = endptrc + 1; *str == ' ' || *str == '\n'; str++)
+            ;
     }
     return 0;
 }
diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_internal.c
index 2941ca0bbd0e..d70cfed7d88f 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -204,7 +204,7 @@ char *libxl__strndup(libxl__gc *gc, const char *c, size_t n)
 
 char *libxl__dirname(libxl__gc *gc, const char *s)
 {
-    char *c = strrchr(s, '/');
+    const char *c = strrchr(s, '/');
 
     if (!c)
         return NULL;
-- 
2.52.0


