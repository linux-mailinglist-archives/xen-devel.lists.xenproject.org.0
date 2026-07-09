Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0bkFCnL9T2pZrgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 21:58:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F573539E
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 21:58:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm2 header.b=f4QU7T4N;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="N DDsSuU";
	dmarc=pass (policy=none) header.from=invisiblethingslab.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358535.1612614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whusl-0007UI-3s; Thu, 09 Jul 2026 19:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358535.1612614; Thu, 09 Jul 2026 19:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whusl-0007PT-0R; Thu, 09 Jul 2026 19:58:03 +0000
Received: by outflank-mailman (input) for mailman id 1358535;
 Thu, 09 Jul 2026 19:58:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1whusk-0007EF-3J
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 19:58:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whusj-004lcy-GG
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 21:58:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a4ffd47-2eae-0a2a0a5409dd-0a2a450ba542-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 21:58:01 +0200
Received: from [103.168.172.147] (helo=fout-a4-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a4ffd48-b7da-0a2a450b0019-67a8ac939447-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 21:58:01 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 5CCEBEC011D;
 Thu,  9 Jul 2026 15:58:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 09 Jul 2026 15:58:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 15:57:59 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1783627080; x=1783713480; bh=6ACDJBO64g
	9UWeMz958s7JKcp/lJyrXxlQd2KMDhZ/I=; b=f4QU7T4NQ4p8pYyQuaifodxls9
	GLJP3YR54mUszRWns79dh9QZ++oTNCQdv6wHNx9vHZYr1rl4WYWO36GHEXxFuHbR
	AfeHm1jn+Ga55hUc+lPZSJ0YswX5MxrG6k82+OZwxAVgBRhA3b0XvzeUG6Omd+Ag
	vDMOXkd/4qqeSHJiHiGFTZTQNsx4iX4JlTYtlygG0g2l92dirs7abKpQ39oiSQle
	OuHnAml+/cGkBMd7nEa7tMsYrkINjmjAOmMVUpJU6oN7MJV032SpYWyfOO2zcMBf
	GLlqyQrLg4WFo30/XOnV0jTiAj3h2wLCqdp3UfDjn114+k8at2d8be2wAk8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783627080; x=
	1783713480; bh=6ACDJBO64g9UWeMz958s7JKcp/lJyrXxlQd2KMDhZ/I=; b=N
	DDsSuU1M6hEWOCVoRXin4XSZhb8m0G07zFtTlXwhdZNndjKZT43hjUbwr+YwK9Tb
	HZ0TJ7Xa0j3sOGoKGm/AndrOwFfgxB4twHHwh21JAcsOCBweFL1yhTMJv+PzAUL4
	n1Z+QFmP2oVpqfMth7VP1dunSieRR8IEdeUrOH94PLDUatJHZrFwb6LhB355IqIa
	jBIv4e3UA5LxFWQE8nHDUl58m+SuMFPh98kB7l+eZC18KCj2ut2pjBcIyFUiJFDp
	+/UtDQcFmbefc6jinVhUoJdNQIVwCn9d+fVC7JtrPeynY8pAVpjqd9iHE9lKI4tp
	eYv38BXU1Uz2z43JTP1og==
X-ME-Sender: <xms:SP1PatTncbwe3Jvp0R_cto_2oKoxI3XpHfSFjF5EbBUCEWSxgAcp3g>
    <xme:SP1PatoTZT2H3orPtBgzu_tDOSqYvIqqzTdit_4onQCjP4vl23gij0jAqzn1juC69
    7YYXECZeCTubgxyBpe0X8BoGunzaQve5zjrBgOrA3ocLDk0VFs>
X-ME-Received: <xmr:SP1ParLi6e_R9PDWE6AhMXaZkNGb1X36Qo17kmSRsfeV5v9yox3kwRgx3IXJL_NmKEGfbSdbITZTVLjveWXTQr-OX4hvwoN6yHYjxNZdVoQ>
X-ME-Proxy-Cause: dmFkZTFRLSDjVlMWvoMbVx0nM4cDzaIWz0Xhxwyc1yWZYMKXBp0C1psv8rNt+1E0DovHkF
    9gAtJF88udxbJlWMP2X2HBOszwrp9ABj8M/dprFDAGNPKQMDNbrx5XhFi6Yl3Al3P9t/ng
    qNoBIwQx60wYQ+bwWxCizUMGy+P2M3BCxnYEHAantv+iKUtCfay85jGIHyRmlpNee++SAj
    zC38qnmnPFPbwIT3sJhk6G6OAwsaSWmf6BxPuoRuYXuF2YsMqQ8YV58LVlSwCqKwOFmPmv
    p49yLZ1JYyW3DyZEsoLEUiaYxLVhJVflGiAdQ2rLte2jXY4llZ8nal5RLw2E7p+5xm++eq
    QU9t7ZLtj11KhVsN651EcdRa8Bo/2Ov0gPLaFMFlRpq7jxdTlFSWx4eKAfB/XYUj4NGfDW
    zS67ZsoLli312ouxPHmfrzXYGSkG5m8rxL+HGCqJ3KEGqKCHyAn/8NgA5HmhNrZW87IRLS
    omxlWTJ1dMxjBrkjXjfP6EUJT3H4JO51kVhPB/x8GhII8ivjVK+A6G+vnD3ZR/7SXt3w7A
    FHX9YSjgvVSrYTN+6CuWsCsnwC0fbrRHm1GBZQkU7R3fAItBmGMWlQa5ydIRrxPnKDccD1
    71e8NHJkuBdrlNuSuXrCSHqwc1omT8o1QK/lFuoCV1G99UVElmjsSszQp/Ow
X-ME-Proxy: <xmx:SP1Pagqc-iUuLngAta8CFJzvsroSxeKv4H0SBNNgeooZh091rMGaFg>
    <xmx:SP1PajwpMw4ESHyU-fowsriurN2GIJuAljltVyEumhK4Iwcgl3MqOQ>
    <xmx:SP1PakPQIBI2rCz2AqnxX7weNaPuXyCuMIocHpoWLe7nKWirpyAJUg>
    <xmx:SP1Pao4mEqE5yESpwCzNxDEI_H7AeeO3uszRpdTSBnce5ETyWpk2wA>
    <xmx:SP1PancPQFwkWtA1ltN7cgWBsn3VKAghrrh39Ar6KXEUkdcvoOSygCi6>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 2/2] CI: enable FRED on PTL runner
Date: Thu,  9 Jul 2026 21:57:05 +0200
Message-ID: <6f41b87651f282ac118c17b1562251f7d74c9496.1783626895.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
References: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1783627081-4A9699ED-6468D952/0/0
X-purgate-type: clean
X-purgate-size: 2049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:from_mime,invisiblethingslab.com:email,invisiblethingslab.com:mid,invisiblethingslab.com:dkim,messagingengine.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C65F573539E

Add new job-level EXTRA_XEN_OPTS variable, in addition to CONSOLE_OPTS.
For now, add "fred" to all jobs running on PTL, but separate variable
allows customizing it later on per-job basis.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml     | 1 +
 automation/scripts/qubes-x86_64.sh | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 7cc52146304e..61adc1baff30 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -177,6 +177,7 @@
     PCIDEV: "56:00.0"
     PCIDEV_INTR: "MSI-X"
     CONSOLE_OPTS: "console=com1 com1=115200,8n1"
+    EXTRA_XEN_OPTS: "fred"
     SUT_ADDR: test-22.testnet
   tags:
     - qubes-hw22
diff --git a/automation/scripts/qubes-x86_64.sh b/automation/scripts/qubes-x86_64.sh
index 7a59fa5f1116..065f03931bea 100755
--- a/automation/scripts/qubes-x86_64.sh
+++ b/automation/scripts/qubes-x86_64.sh
@@ -260,14 +260,14 @@ TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
 echo "
-multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog $extra_xen_opts
+multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 --nounzip (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
 echo "#!ipxe
 
-kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog $extra_xen_opts || reboot
+kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog ${EXTRA_XEN_OPTS-} $extra_xen_opts || reboot
 module /gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen || reboot
 module /gitlab-ci/initrd-dom0 || reboot
 boot
-- 
git-series 0.9.1

