Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHrPEQlIjWlj0gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 04:24:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4B612A2A0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 04:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228371.1534568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqNIx-0003Zi-MN; Thu, 12 Feb 2026 03:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228371.1534568; Thu, 12 Feb 2026 03:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqNIx-0003XW-FQ; Thu, 12 Feb 2026 03:23:47 +0000
Received: by outflank-mailman (input) for mailman id 1228371;
 Thu, 12 Feb 2026 03:23:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHzL=AQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vqNIv-0003XQ-LD
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 03:23:45 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b252689-07c2-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 04:23:43 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id CDF5AEC0728;
 Wed, 11 Feb 2026 22:23:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 11 Feb 2026 22:23:41 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Feb 2026 22:23:40 -0500 (EST)
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
X-Inumbo-ID: 3b252689-07c2-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1770866621; x=1770953021; bh=4nBuasMp4wez6QdaFSI7hhv6Ad2Ix+lQ
	QS0JYwcUwYw=; b=meNN13aQFaYuGgxoVX4MAy7s3F0TA+K4lTkrdR3bLFC0I3wp
	+HmeS89FyZowV1cfuwdl5CXj5odUCA2lC9CTN2uYoU2B98cCkE/yShgD1EnrdH0J
	0LubKUzZFH5Dro4v/50Ywl+plpskQOkRwSJPYKrCJuWiUiHDxFab92BbyvVoc1vL
	3Nw6E4nhaYW66LmkAO1d4QoxNxgyGpBoG3ezzoLa3m79MT9Wg+YKsVyQxlqPXBmn
	dRcdPFWjhZ0s0EVBcyeVn1Yq51y8Bj6t/ekLdBULLe8/oIzjLoC1uTIImRRiQrEN
	kS8LXpPEk7I3YnTEZQQqyQiPSnvHnTH97NpMCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770866621; x=1770953021; bh=4nBuasMp4wez6QdaFSI7hhv6Ad2I
	x+lQQS0JYwcUwYw=; b=vAPaZbPl4YgySEGWl7tcW2c999PIidousiRP+MBck41c
	JZJl7SSFYaUlY0pxtJn7h97CYJhK3e5r5PEZIYqSjIMzHvuirqRkADKgWO6ACCYo
	BQ2XMTg9hP4q6BEy/DJrzhgzt0W92WQpWetZSd4ePT35htLN50N70fX69ZWFO1r9
	OkBkAs8xdTF0ZOtg6RHkg8g7i88F/4is5nPTTEhPqKF/hO4R+VbqCMO0dUMdLApn
	tgjGcanqaovs5gFKlC/j6DSFWwLS32dQlfdj7Ci1/hhGPVxUeaP3Nw65IJKe4/1s
	01P+NVz1doV+6RSSw+BMxpgjSFRGm5cf0L7lU/8Gdw==
X-ME-Sender: <xms:vUeNaXXmuiPGSJbkvvo2tmE0V2P8YnXSMWLvayFof1ytyAnwfay3Cg>
    <xme:vUeNaWn-q24jwjAe0x95KCpIsK_IGiK_IAv4dawX49-pbqYTz-k62kQJN2UDP7EsN
    MajTwr3t-Sk8yjM3AtBvTQL5kPwmQ4IePRRtobqmP6KCpKSxA>
X-ME-Received: <xmr:vUeNaYa2g6oH8LC2qRnFmRS4mfu1KIUCPinqGoKrwi0IjYq3XUZOqGd7cg5mNoDfVpxP4YJ_jR6e7R9sBl1jwpOrZHaPimyQKppkuZiCKDM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdegfedtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:vUeNaRMpuUCb9-cTSfjoPEebVZOf2N3wGUGV1fzxjLp8HxPsR7E7Kw>
    <xmx:vUeNadbEgu4r8SDOfC3zWOZTIGMg4ccMo3e7JKA3tthVkChWK_eXnw>
    <xmx:vUeNaf1gZGIL2m-IQv-qRMpz3Ku5fcuO1fv1lu2FDlHyGQ21JunEWA>
    <xmx:vUeNaTetB2tsfNKxnxdH5h-JjdIZ-H01s8_i4s2HDI70XHZbZmfcJg>
    <xmx:vUeNaUA8ZWni6oXYonKopKvK7uWJ-LqBXWQ36UZ4cw87Ih7LrRTVGQJN>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: constify some local variables to appease gcc 15.2.1
Date: Thu, 12 Feb 2026 04:23:00 +0100
Message-ID: <20260212032334.1696248-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:mid,invisiblethingslab.com:dkim,invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7C4B612A2A0
X-Rspamd-Action: no action

Archlinux just updated gcc to 15.2.1+r604+g0b99615a8aef-1 and that
complains about libxl:

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

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
When I say "just updated" I really mean it. The update hit me between my
CI saying "ok" and release build few hours later. I guess Xen's CI will
see that only after next refresh of the Arch container (next week?).
---
 tools/libs/light/libxl_cpuid.c    | 19 ++++++++++---------
 tools/libs/light/libxl_internal.c |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 8420b2465f39..5fb580113d80 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -415,6 +415,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *policy,
                                   const char* str)
 {
     char *endptr;
+    const char *endptrc;
     unsigned long value;
     uint32_t leaf, subleaf = XEN_CPUID_INPUT_UNUSED;
     struct xc_xend_cpuid *entry;
@@ -444,25 +445,25 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *policy,
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
+        for (str = endptrc + 1; *str == ' ' || *str == '\n'; str++);
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
2.51.0


