Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL/dFSv+8WmElwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:48:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D6494439
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297363.1573432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI4L6-0000XD-Jj; Wed, 29 Apr 2026 12:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297363.1573432; Wed, 29 Apr 2026 12:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI4L6-0000VH-Ga; Wed, 29 Apr 2026 12:48:28 +0000
Received: by outflank-mailman (input) for mailman id 1297363;
 Wed, 29 Apr 2026 12:48:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd9487f12000f373@swg.vates.tech>)
 id 1wI4L4-0000V3-7u
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:48:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI4L3-008hlq-Ha
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:48:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd9487f12000f373@swg.vates.tech>)
 id 69f1fe16-bab6-0a2a0a5309dd-0a2a4503b75e-14
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:48:25 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd9487f12000f373@swg.vates.tech>)
 id 69f1fe18-672d-0a2a45030019-b9ff1c229613-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:48:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd9487f12000f373.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Apr 2026 12:48:20 +0000
Received: from l14.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8D7108076B;
 Wed, 29 Apr 2026 14:48:15 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=1YMqeE/bZBZtigC8s9LSwBudS50zC7eOueOUyPah3A4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=KS4kSNS+Lnpgj2C7lHJUVCSP/p0/5iYc8zaXEpll2QT5Xf/kulW1AUsRjpn3e+xtaCfLmJh8Z
 jfU+LeplQUb2AYCuQ5+3hn9JBS7qmh+J47ZluHPqMXrScVemfRTwhQQsbChtmyuD9vDuveHARLJ
 nQGhFUnQFS2FXlBlPnfbm16qFpie/c5rPTjhwtod5/3xbjop1oFxL1Y2bTpSxQ+kS8vIKXpA+6O
 VsJNXJWVB23KzGAV9RM8IzG1832eRKn6yOzjXnMiFM426t/KUqCAq9yIlRNuGJznWmuuFMQCTPE
 L0WwH6+Tkl9J2y7+ruDtdDAmTKGmcalh3Ufdf+R5lSuw==
X-Zone-Loop: 1d80ba4d319fc8bc850ee35a16f7f38b10d1c1a6ea4b
x-campaign-type: default
x-transaction-id: 0b08aa91-fe12-410f-94d5-abf24be20091
x-swg-uid: 01-c52ddfaf-d2f2-45f3-b171-e8fe60142a53
X-Mailer: Sweego
Message-ID:
 <1777466900.8631fc262581453bbf619ec5b2062170.19dd9487f12000f373@vates.tech>
x-swg-bid: 1777466900.8631fc262581453bbf619ec5b2062170.19dd9487f12000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Anthony PERARD <anthony.perard@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] CI: use --platform on `docker build` and `push`
Date: Wed, 29 Apr 2026 14:48:01 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1e6.370dca10e82feae9.19dd9486d4a.9123d17733a26d6f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777466895694
X-purgate-ID: tlsNG-33051d/1777466905-28F72938-4133C150/0/0
X-purgate-type: clean
X-purgate-size: 3376
X-Rspamd-Queue-Id: D77D6494439
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.18 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.1e6.370dca10e82feae9.19dd9486d4a.9123d17733a26d6f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Without --platform, it seems recent versions of docker ignores the
platform of the image when pushing, and it's pushed as the platform of
the runner=2E

If we happen to build an arm64 image on x86, with recent version of
docker, the image will be push as if it was an x86 image, then
`docker run --platform=3Dlinux/arm64 =2E=2E=2E` fails=2E Even if it would
work without --platform, gitlab-runner will not be able to use the
image=2E

To go back to the previous behavior, we will extract --platform from
the dockerfiles, and use it on the command line=2E

--platform=3D is needed on both docker-build and docker-push=2E The first
one so that the image is tagged with the right platform, and the
second one so that we can push a "generic" image without been tagged
to a particular platform=2E --platform on docker-push allow to easly use
the container on any arch, without having to use --platform on
docker-pull or docker-run=2E

`docker push --platform` seem to have been added to 1=2E46, according to
the [doc], and doesn't exist on Podman=2E So we need to check that we
are using `docker` and that the API version is new enough=2E

[doc] https://docs=2Edocker=2Ecom/reference/cli/docker/image/push/

Also, introduce the $img variable, to make the lines a bit shorter=2E

Signed-off-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>
---
 automation/build/Makefile | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/automation/build/Makefile b/automation/build/Makefile
index fedf7524dacd=2E=2Ed578cd347615 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -15,10 +15,28 @@ help:
=20
 include yocto/yocto=2Einc
=20
+# Find out if we are running Podman, if not is likely docker=2E
+is-docker =3D $(if $(filter Podman,$(shell $(DOCKER_CMD) version)),,1)
+
+# Find out the docker API version is at least 1=2E46=2E We exploit `sort =
-V` to
+# compare the versions at it can sort by version=2E
+docker-api-version =3D $(shell $(DOCKER_CMD) version -f '{{=2EClient=2EAP=
IVersion}}')
+docker-min-version =3D $(firstword $(shell printf "1=2E46\n$(docker-api-v=
ersion)" | sort -V))
+docker-have-push-platform =3D $(if $(filter 1=2E46,$(docker-min-version))=
,1)
+
+# check if we can use `X push --platform`=2E
+# `podman push` doesn't support --platform=2E
+# `docker` only have it on recent version=2E
+builder-have-push-platform =3D $(and $(is-docker),$(docker-have-push-plat=
form))
+
 %: %=2Edockerfile ## Builds containers
-	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
-	@if [ ! -z $${PUSH+x} ]; then \
-		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
+	set -xe; \
+	$(if $(builder-have-push-platform), \
+	    platform=3D$$(sed -n '/^FROM/{s/=2E*\(--platform=3D[^ ]*\) =2E*/\1/p=
;q}' $<); ) \
+	img=3D"$(REGISTRY)/$(@D):$(@F)"; \
+	$(DOCKER_CMD) build --pull $$platform -t $$img -f $< $(<D); \
+	if [ ! -z $${PUSH+x} ]; then \
+		$(DOCKER_CMD) push $$platform $$img; \
 	fi
=20
 =2EPHONY: all clean


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.1e6.370dca10e82feae9.19dd9486d4a.9123d17733a26d6f=---

