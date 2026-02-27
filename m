Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +In/AP3ToWlcwgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 18:27:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934DB1BB732
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 18:27:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242979.1543080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw1CI-0005Im-4c; Fri, 27 Feb 2026 17:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242979.1543080; Fri, 27 Feb 2026 17:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw1CI-0005HD-1c; Fri, 27 Feb 2026 17:00:14 +0000
Received: by outflank-mailman (input) for mailman id 1242979;
 Fri, 27 Feb 2026 17:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1wc=A7=bounce.vates.tech=bounce-md_30504962.69a1cd95.v1-182cc8d51744457299956a58e4276c59@srs-se1.protection.inumbo.net>)
 id 1vw1CG-0005Gc-Eu
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 17:00:12 +0000
Received: from mail178-23.suw51.mandrillapp.com
 (mail178-23.suw51.mandrillapp.com [198.2.178.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3f03532-13fd-11f1-9ccf-f158ae23cfc8;
 Fri, 27 Feb 2026 18:00:06 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-23.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4fMvhP14fQz35hfhB
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 17:00:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 182cc8d51744457299956a58e4276c59; Fri, 27 Feb 2026 17:00:05 +0000
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
X-Inumbo-ID: c3f03532-13fd-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772211605; x=1772481605;
	bh=nrZwECs8bOqQeYNSv33eeW45fB4l4JUdNYmvcTvImHE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=vzdMnd6Ja2yDkupZRQK9SzYhyDmqBBLQv5rZlsGGX2s2IgAs0YYYWqeHvx+O9ycLn
	 VwqfzLuAgz3bQTb94/F11ZcAdCO/dF+Klj+XmYItrSjYvxwlxUgurz9ay7g5iHzdOR
	 LIi/z3YS6V0ZFLl/eHBFVFLSVVYNk88o6RtM34aSQQeq6eiok0V7hgwybsGrUxVmv+
	 PP7c6kTyNl82EnZOlDFChZUPJtMUwVapIailWnPVLtqyIQ1O7r0mLEeLkOyhOYfTIT
	 x8g6RToYNTjtngt88liGmju5ZRNMvX2omv735YSF6mOjCgqRCYW8SmcVuNkNFo3PvI
	 mSmeX5DugFD5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772211605; x=1772472105; i=teddy.astie@vates.tech;
	bh=nrZwECs8bOqQeYNSv33eeW45fB4l4JUdNYmvcTvImHE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=EcP1DRpkU873ynvEMoJt5lI9ZZqce0msDmil5Xm19KsZXpTy6oxo6W8/XqAxBKsLQ
	 OFXBGosR0rqlr1PTuM1Ie8gald91ocIFppGeXMeUtuviAPZDj32m+MzNLQGktZoMaX
	 5mVtT8kNDo8XyzbX1GfaBn2HHsoviSMIzHRqPJTEKssvezqHTDIgXen8T92tSJN03q
	 IVhx8v6uvaU3+j46xYWGgGsRRTqZrH539cTsSlXYtkpOh7E7jpioGESSEM+ZkgpgjK
	 SsyyRjIawMOB1IpS1edjcq9yE6xHgg828cDGKMMgtuKJYTL9Mv/mOFuyBKvVvwjyNA
	 uTquLT773y6WA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v8=201/2]=20libxc:=20Report=20consistent=20errors=20in=20xc=5Fresource=5Fop?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772211604427
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
Message-Id: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.182cc8d51744457299956a58e4276c59?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260227:md
Date: Fri, 27 Feb 2026 17:00:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 934DB1BB732
X-Rspamd-Action: no action

xc_report_op doesn't update errno in some error conditions.
Make sure it reports -ENOMEM in out of memory errors and -EINVAL
in invalid usages errors.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v7: Introduced
v8: Use errno to report errors

 tools/libs/ctrl/xc_resource.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/libs/ctrl/xc_resource.c b/tools/libs/ctrl/xc_resource.c
index cb6a97202b..ac1524d1bd 100644
--- a/tools/libs/ctrl/xc_resource.c
+++ b/tools/libs/ctrl/xc_resource.c
@@ -28,7 +28,10 @@ static int xc_resource_op_one(xc_interface *xch, xc_resource_op_t *op)
                                 XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
 
     if ( xc_hypercall_bounce_pre(xch, entries) )
+    {
+        errno = ENOMEM;
         return -1;
+    }
 
     platform_op.cmd = XENPF_resource_op;
     platform_op.u.resource_op.nr_entries = op->nr_entries;
@@ -54,11 +57,15 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
     call_list = xc_hypercall_buffer_alloc(xch, call_list,
                                           sizeof(*call_list) * nr_ops);
     if ( !call_list )
+    {
+        errno = ENOMEM;
         return -1;
+    }
 
     platform_ops = xc_hypercall_buffer_array_create(xch, nr_ops);
     if ( !platform_ops )
     {
+        errno = ENOMEM;
         rc = -1;
         goto out;
     }
@@ -66,6 +73,7 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
     entries_list = xc_hypercall_buffer_array_create(xch, nr_ops);
     if ( !entries_list )
     {
+        errno = ENOMEM;
         rc = -1;
         goto out;
     }
@@ -81,6 +89,7 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
                         platform_op, sizeof(xen_platform_op_t));
         if ( !platform_op )
         {
+            errno = ENOMEM;
             rc = -1;
             goto out;
         }
@@ -90,6 +99,7 @@ static int xc_resource_op_multi(xc_interface *xch, uint32_t nr_ops, xc_resource_
                    entries, entries_size);
         if ( !entries)
         {
+            errno = ENOMEM;
             rc = -1;
             goto out;
         }
@@ -137,6 +147,7 @@ int xc_resource_op(xc_interface *xch, uint32_t nr_ops, xc_resource_op_t *ops)
     if ( nr_ops > 1 )
         return xc_resource_op_multi(xch, nr_ops, ops);
 
+    errno = EINVAL;
     return -1;
 }
 
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


