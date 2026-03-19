Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CLvCZUpvGkxtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:51:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0822CF26E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257426.1551829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GaI-0006p1-Or; Thu, 19 Mar 2026 16:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257426.1551829; Thu, 19 Mar 2026 16:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GaI-0006n2-MB; Thu, 19 Mar 2026 16:50:58 +0000
Received: by outflank-mailman (input) for mailman id 1257426;
 Thu, 19 Mar 2026 16:50:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Txee=BT=bounce.vates.tech=bounce-md_30504962.69bc296c.v1-f004f9ad8d764dd1b3acfc46a424355d@srs-se1.protection.inumbo.net>)
 id 1w3GaH-0006mw-5d
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:50:57 +0000
Received: from mail132-30.atl131.mandrillapp.com
 (mail132-30.atl131.mandrillapp.com [198.2.132.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca253ca6-23b3-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 17:50:53 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-30.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fcBXX0HqXzP0KP6g
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 16:50:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f004f9ad8d764dd1b3acfc46a424355d; Thu, 19 Mar 2026 16:50:52 +0000
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
X-Inumbo-ID: ca253ca6-23b3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773939052; x=1774209052;
	bh=PIgO7rkoPtEUkUwGeFYqwfIuh3XkY6pU47NTRzeqZDk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=bvB/PyTYNH29TSDSbw/VQTyAMKE1y/eQv9FVvV0Idq50OFTFInvaVu1l98Alc1ylG
	 uLI6ZfeU/0pgskShnRnQeXqmMTs815ikNTqF/Ry9lE027Lxn1IctskVyAh19kR1SVR
	 9CZcF3Vp2LuU5o09SHz8GdCfhLirFw6Fh8RbB9GXfWm7N80R79Jqvtw/eocPTIdBKA
	 zJWB3Ithan3z8aAN2Cf3VfN6jXY8BT5pD1Zg5Msvju274p4NJI8+bEcVY6ycX4tfR2
	 l13Boe83b9Aznn7jxzRrgdL7eiLPgSBd4DTii7J5Len94AEeXMh2Z8agCmaQfa0ZNV
	 E01UKBY5m3X8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773939052; x=1774199552; i=thierry.escande@vates.tech;
	bh=PIgO7rkoPtEUkUwGeFYqwfIuh3XkY6pU47NTRzeqZDk=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Em2QLVvH3ETKArd3L21/KpEMs/63nEySzSmYrR2RDWhgOmfv6qI+Fa01e8Zjk20NQ
	 IPGrptftlEYL0tUUoF6LZvRP5aY1WFlVOQXMgGwV9TJ9v0lDME6nGHMeXzyc+eQkZN
	 kKIv0eusr3NIeWWtl37mTXnsoS910bWhTX31ThSo2k8X4jkUH262KSLxnTRsHdBC9b
	 wF/0O7aDuQpBmwc+4aeG9Uzdp4IPVyTaopgmijYH67fa39tHd3Hh8GrbZw0+oovqzz
	 K9CCKjs4Fvh7p3wLhUlGrjOXi/Qvr7ibjvz0aYsPqcU/cu8P0c2sMxGx4x0mgbcHKG
	 DCmk/P/TnGmeA==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20install.sh:=20Preserve=20symlinks=20in=20destination=20file=20system?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773939051391
To: xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Jason Andryuk" <jason.andryuk@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Thierry Escande" <thierry.escande@vates.tech>
Message-Id: <20260319165047.900047-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f004f9ad8d764dd1b3acfc46a424355d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 16:50:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:thierry.escande@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.413];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9B0822CF26E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In various distros (i.e. Debian), /lib is a symbolic link. The tar
command in install.sh replaces the /lib symlink with a directory and
results in a non-functioning system. This has been introduced by the
installation of the systemd watchdog sleep script in /lib/systemd.

This patch adds the tar option --dereference (-h for short) to preserve
symlinks when extracting the dist archive.

Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on suspend/resume")
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
Changes in v2:
* Use more standard -h option instead of --keep-directory-symlink
* Update commit message

 install.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/install.sh b/install.sh
index 3e11c4d46f..1d74541320 100644
--- a/install.sh
+++ b/install.sh
@@ -27,7 +27,7 @@ tmp="`mktemp -d`"
 echo "Installing Xen from '$src' to '$dst'..."
 (cd $src; tar -cf - * ) | tar -C "$tmp" -xf -
 
-(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xf -
+(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xhf -
 rm -rf "$tmp"
 
 echo "All done."
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


