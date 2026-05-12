Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zfDYOVFQA2qR4QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:07:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825025245AC
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307208.1578907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpdu-0002MP-Fl; Tue, 12 May 2026 16:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307208.1578907; Tue, 12 May 2026 16:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpdu-0002Jj-Cu; Tue, 12 May 2026 16:07:34 +0000
Received: by outflank-mailman (input) for mailman id 1307208;
 Tue, 12 May 2026 16:07:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e1cf17f96000f373@swg.vates.tech>)
 id 1wMpds-0002JY-24
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:07:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpdr-00ARDz-Ck
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 18:07:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e1cf17f96000f373@swg.vates.tech>)
 id 6a035023-e002-0a2a0a5209dd-0a2a450bcc6e-36
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:07:31 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e1cf17f96000f373@swg.vates.tech>)
 id 6a035042-212f-0a2a450b0019-b9ff1c2296a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:07:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e1cf17f96000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 12 May 2026 16:07:29 +0000
Received: from l14.. (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8768981617;
 Tue, 12 May 2026 18:07:28 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Api6dZu/kYwbQY6iMbeIAyrVF8cQmcaLDQnh0B2K++o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=TPJCNANsOxRaFsdRsZqF7gOcrk7PsQaX43Af5qC2t3N5EnKNwk1IUrEOE9B/oCFZNj4W6KLyW
 r/XZj7nr7xmzRfew+FCsu3ZscjDxl9IWSvqdRjWsG5ekNZwgmGh09PFtDhA8P0uNyIzWp94aMFA
 +klhS3bhZwxY4iZIhf4cejhyvS7jHaDHc0FiMy48xFICnF6qTo2iSq1a4IR8elQN3lBImhYy3U9
 daXN0zZoWocv6bxRn1pO6n5D82ExFeOvRlYsX9BbKWyvB7MatAnTDMb7ixKr3JDr8gRGi/tc/G3
 7zXCAuI7+6C29ZNNiFxBbI3JCWRvlujHwlnS2HNcxDsQ==
X-Zone-Loop: 961a7766eba627a5ddfde0227fce3ac0adcadf422438
x-campaign-type: default
x-transaction-id: 1d358507-51e9-4734-8ddd-062f1f3a7107
x-swg-uid: 01-28159fd6-ba5f-446b-acc9-bc7b6ec44ae6
X-Mailer: Sweego
Message-ID:
 <1778602049.8631fc262581453bbf619ec5b2062170.19e1cf17f96000f373@vates.tech>
x-swg-bid: 1778602049.8631fc262581453bbf619ec5b2062170.19e1cf17f96000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Anthony PERARD <anthony.perard@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair: Restrict where eclair jobs are auto-started
Date: Tue, 12 May 2026 18:07:22 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.abc.a9ca9332a5435f32.19e1cf17cb0.7336cce55c47b1f4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1778602048688
X-purgate-ID: tlsNG-42698a/1778602051-19165F3B-B2974F6D/0/0
X-purgate-type: clean
X-purgate-size: 1530
X-Rspamd-Queue-Id: 825025245AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[3];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:nicola.vetrini@bugseng.com,m:anthony.perard@vates.tech,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,vates.tech:email,vates.tech:mid,vates.tech:url,vates.tech:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

---=Part.abc.a9ca9332a5435f32.19e1cf17cb0.7336cce55c47b1f4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This will prevent eclair jobs from been started automatically
everywhere but in the main push repo, but still have the option to
start a jobs manually=2E

Signed-off-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>
---

Notes:
    eclair jobs are still manual under people:
        https://gitlab=2Ecom/xen-project/people/anthonyper/xen/-/pipelines=
/2519778881
   =20
    and they are still running in hardware repos:
        https://gitlab=2Ecom/xen-project/hardware/xen-staging/-/pipelines/=
2519784420

 automation/gitlab-ci/analyze=2Eyaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/analyze=2Eyaml b/automation/gitlab-ci/an=
alyze=2Eyaml
index b3f99f472d9e=2E=2Ed6b6cf3e548b 100644
--- a/automation/gitlab-ci/analyze=2Eyaml
+++ b/automation/gitlab-ci/analyze=2Eyaml
@@ -33,7 +33,7 @@
       when: never
     - if: $CI_JOB_NAME !~ $SELECTED_JOBS_ONLY
       when: never
-    - if: $WTOKEN && $CI_PROJECT_PATH =3D~ /^xen-project\/people\/=2E*$/
+    - if: $WTOKEN && $CI_PROJECT_PATH !~ /^xen-project\/hardware\//
       when: manual
       allow_failure: true
     - !reference [=2Eeclair-analysis, rules]


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.abc.a9ca9332a5435f32.19e1cf17cb0.7336cce55c47b1f4=---

