Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lLvkCwEdRmrIKAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 10:10:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F606F49E9
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 10:10:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="Zr/oNT9X";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1351365.1608560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCVE-0007hG-Ar; Thu, 02 Jul 2026 08:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351365.1608560; Thu, 02 Jul 2026 08:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCVE-0007eW-8E; Thu, 02 Jul 2026 08:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1351365;
 Thu, 02 Jul 2026 08:10:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8@swg.vates.tech>)
 id 1wfCVD-0007eE-00
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 08:10:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfCVC-006YAq-24
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:10:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8@swg.vates.tech>)
 id 6a461cea-e002-0a2a0a5209dd-0a2a450b8880-44
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:10:26 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8@swg.vates.tech>)
 id 6a461cf1-ac48-0a2a450b0019-b9ff1c228991-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:10:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f21e0f0bb00080a8.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 08:10:17 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id EA49B81185;
 Thu,  2 Jul 2026 10:10:16 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=NzjTuiIjDTo1ZZYWkpiat2ZqEEL6x3BN/uhxJFF01R8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Zr/oNT9XlnRlOrgPaKUQf9FbSprIFnNkWwqEEHkDDGxQy2tmwZhWG3ys5HUQj7+p2HuV51TSj
 5yz9CjcPNftPUy6IQjz9EIyec+VcDoFYfuprjqiT+sfQiXiPDaKcci7MXF/gv/0CYNpIEwwNZGt
 c+k/ho+qEBhfIH8p7IRjqIsFCakfGXlHzK0O4Tf2FkjpwjIgHI8xFTesXcLA4Nv0eqineLtAXEe
 S/JdX7rtVhI5cHVeiiid11BXuR3xMsVdrxgGndWt42AnF/7dMCNUp5x3JF2qcST27IxjU/XqE6E
 1QeVHNaTfNv4vJ3V9YzqxYRNr6xa+mkH3lqZuPks96UQ==
X-Zone-Loop: ee71f1b68e5dcc06fe78d492b4692f29d182dab32c26
x-campaign-type: default
x-transaction-id: d87f70da-4587-4978-bfa8-d0bde2e2714a
x-swg-uid: 01-ba1883c0-31d7-4f8a-bd64-0c977363d851
X-Mailer: Sweego
Message-ID:
 <1782979817.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8@vates.tech>
x-swg-bid: 1782979817.8631fc262581453bbf619ec5b2062170.19f21e0f0bb00080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 2 Jul 2026 10:10:16 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 2/2] lib: make safe_copy_string_from_guest() validate
 input
References: <ba863889-b389-4264-824e-121a5daeba61@suse.com>
 <80bc4e83-b767-4692-9ce1-0ebf68d7ab26@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80bc4e83-b767-4692-9ce1-0ebf68d7ab26@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2f.704031f6a12d6c5e.19f21e0ee99.35cf2f2dae56525b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782979817114
X-purgate-ID: tlsNG-42698a/1782979826-A653B220-F8C34B4A/0/0
X-purgate-type: clean
X-purgate-size: 800
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.33 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_COUNT_ODD(1.00)[1];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,amd.com,apertussolutions.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7F606F49E9

---=Part.2f.704031f6a12d6c5e.19f21e0ee99.35cf2f2dae56525b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 04:48:33PM +0200, Jan Beulich wrote:
> =2E=2E=2E rather than papering over guest flaws: Strings passed ought to=
 be nul-
> terminated (yet sadly libxc hasn't been doing so thus far)=2E This way w=
e
> also avoid order-1 allocations, seeing that all present callers pass
> PAGE_SIZE for max_size=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2f.704031f6a12d6c5e.19f21e0ee99.35cf2f2dae56525b=---

