Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DVEZLtM0OWocogcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 15:12:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A516AFB67
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 15:12:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=kDCFLE7V;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1343719.1602945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbeRQ-0005mw-R2; Mon, 22 Jun 2026 13:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343719.1602945; Mon, 22 Jun 2026 13:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbeRQ-0005ls-O6; Mon, 22 Jun 2026 13:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1343719;
 Mon, 22 Jun 2026 13:11:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eef757354000701b@swg.vates.tech>)
 id 1wbeRO-0005lm-Nu
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:11:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbeRN-00AlZ0-Vb
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:11:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eef757354000701b@swg.vates.tech>)
 id 6a393493-e002-0a2a0a5209dd-0a2a450c9a3e-28
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:11:53 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eef757354000701b@swg.vates.tech>)
 id 6a393499-94a4-0a2a450c0019-b9ff1c129627-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 15:11:53 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eef757354000701b.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Jun 2026 13:11:52 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 85A1A86562;
 Mon, 22 Jun 2026 15:11:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=KJYDyPINznWZxXrW9v7ofKzDBtzGrj3LDhA+w+w1lfA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=kDCFLE7VgMVLe1MQCMyHIhmPXVIJRdpPrDO34Mh2ibw9G+8yPawTQRJTbZQ5b8zUeGaiacwVp
 d0wVbVmVzS2BX+Dwv9h+w2KzrbVoFAQtHmxT/5NIgWYABOHTQAGpeyuvJDXxsWb2U5IPE7RC6QO
 RH0aRSK0/OxYmNcF3wOaQEaPZkRAYNKmMKGnxgCxO9O8HITbkn6QUe9j31PjRJ7NXqy3kq92Bcu
 6Tvc/X8rJP82pwZu3H/gLn81HdSVcGydy4mBN7cWfrp3sOblJI08uiSCxwotb4NIeTtsfPNNemC
 oAPFkp8TcJlUWyh4cr5VIaLmzgYCxGrUIZ6OegW2/3+A==
X-Zone-Loop: 77e93e99ca1aedc373dc38bbf1868e5c17c41b4eee15
x-campaign-type: default
x-transaction-id: 3217cee0-b955-4c1c-83c4-afd8ba5f6ccd
x-swg-uid: 01-6fc1d0d2-5dd3-43b6-99fb-4034421e188b
X-Mailer: Sweego
Message-ID:
 <1782133912.8631fc262581453bbf619ec5b2062170.19eef757354000701b@vates.tech>
x-swg-bid: 1782133912.8631fc262581453bbf619ec5b2062170.19eef757354000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 22 Jun 2026 15:11:51 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v4 3/6] libxl: Add libxl__device_pci_get_qapi_json()
 internal API
References: <1776955586.8631fc262581453bbf619ec5b2062170.19dbace7684000f373@vates.tech>
 <1776955852.8631fc262581453bbf619ec5b2062170.19dbad285c5000f373@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1776955852.8631fc262581453bbf619ec5b2062170.19dbad285c5000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.931.16e9c9b44125b201.19eef757048.da0ac3fbdc25f4a2=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782133911625
X-purgate-ID: tlsNG-d25034/1782133913-D87F9ABF-F77BA3FC/0/0
X-purgate-type: clean
X-purgate-size: 1265
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49A516AFB67

---=Part.931.16e9c9b44125b201.19eef757048.da0ac3fbdc25f4a2=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 04:50:28PM +0200, Thierry Escande wrote:
> This function generates the qapi json object for a PCI device to be
> passthrough'd to a guest=2E
>=20
> With the new option hotplug=3D0 for PCI passthrough, device parameters
> will be passed using Qemu -device command line option=2E Since -device
> accepts qapi json string, this new function will be used to do so=2E

Here, instead of speaking about "hotplug=3D0" which I don't see a good
reason to exist, you can just say that this json object can be both used
via QMP or on QEMU's command line=2E

> The code that generates the json object comes from
> pci_add_qmp_device_add() which now also uses this new function=2E
>=20
> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>

With commit message reworded to remove the mention of "hotplog"
option: Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.931.16e9c9b44125b201.19eef757048.da0ac3fbdc25f4a2=---

