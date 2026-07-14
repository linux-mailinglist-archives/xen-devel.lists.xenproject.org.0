Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rH1KBIePVmrY9AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 21:35:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAA3758508
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 21:35:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=QuMdaAUm;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lucqK6n8;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=mailbox.org
Received: from list by lists.xenproject.org with outflank-mailman.1362519.1614347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjiuN-00067B-Kh; Tue, 14 Jul 2026 19:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362519.1614347; Tue, 14 Jul 2026 19:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjiuN-00065C-Hr; Tue, 14 Jul 2026 19:35:11 +0000
Received: by outflank-mailman (input) for mailman id 1362519;
 Tue, 14 Jul 2026 19:35:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mhi@mailbox.org>) id 1wjiuM-000656-AC
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 19:35:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjiuL-001xcx-45
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 21:35:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a568f69-e002-0a2a0a5209dd-0a2a4506ae36-10
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 21:35:08 +0200
Received: from [80.241.56.171] (helo=mout-p-201.mailbox.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mhi@mailbox.org>)
 id 6a568f6c-195a-0a2a45060019-50f138ab8f8a-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 21:35:08 +0200
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4h08f41257zMlGN;
 Tue, 14 Jul 2026 21:35:08 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784057708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6uxr+UunWeCr0jqc3uJLy4BoPjB01Cn7PPlmFpF9bQ=;
	b=QuMdaAUmzBQNS2NVKgfWWqTT7THLOeBAvDNUU+v/k26L7jVqNPyWAgwjLisRzYB8kFltiB
	6yfXjdnENmfZ5qR/2jjl3ngZCY/pw65d20MopbgI2mh5qIfPCqk+B2TtKUBa6yqFa0HCdq
	rdLd7Ye6DQFAsRxd+QGVf83/A6ZsXhzF6IYA0whTbP+2yvMAFMGioq/QzzAnpnWD34/Oon
	R307E7+1eb/jGOJsTIJGw4MkpwmeJ+tYrNi+ICRyw91pvchm9pPdFspmF4KDV8m1TV3Cyo
	UX6blVrjnIOCmNcQHaAyv65u4kKOqmTypE7oLyDblYVoo4nqA57K7wKRFEtZBA==
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784057706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6uxr+UunWeCr0jqc3uJLy4BoPjB01Cn7PPlmFpF9bQ=;
	b=lucqK6n8CkEfQ2vEfaJphbDANeuwE56/Z++FuFpnf7NvxqqxEM8R75w+XFselNZruYeSyJ
	2E++E1qBxf5JGQvP0er/p+FKtbJ6/Zfd0A62onSLk2QZNX6bfuQ68awTmvzoOf91NdKqKn
	rmPopbtKyRAosGiZ5enfDTyZ0VcU/TVUwgKFe4LM1OEx3QDhYqh2+LbSErwQWPbctj0n9S
	/M8PZ4YA1tvmLgQ4wNx3waZFxF2GfJY6NIiTj2Bo2gwmywYyKI6SUK1XHSZ6s8JSIfL+e7
	MNqas209UnyFOokBUeKxFf8e81pZvBIEV8Qlh1uZGkc5mDxdO7Jhqd7K1FxUPQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 21:34:56 +0200
Message-Id: <DJYJO745N6HZ.23EJ5DJ7I0BP5@mailbox.org>
Cc: "Edward Cree" <ecree.xilinx@gmail.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Justin
 Tee" <justin.tee@broadcom.com>, "Paul Ely" <paul.ely@broadcom.com>, "James
 E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko"
 <oleksandr_tyshchenko@epam.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Borislav Petkov"
 <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-net-drivers@amd.com>,
 <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-scsi@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-edac@vger.kernel.org>
Subject: Re: [PATCH 1/2] PCI: Replace pci_dev->is_busmaster with accessors
From: "Maurice Hieronymus" <mhi@mailbox.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Maurice Hieronymus" <mhi@mailbox.org>
References: <20260711-pci-dev-flags-v1-0-2fcf2811138c@mailbox.org>
 <20260711-pci-dev-flags-v1-1-2fcf2811138c@mailbox.org>
 <alOkgrK7Fm6opB4r@wunner.de>
In-Reply-To: <alOkgrK7Fm6opB4r@wunner.de>
X-MBO-RS-ID: 26cc25a0ec5af51ece5
X-MBO-RS-META: nfsfy951dumk6mo6odtrggnyqgfwzm9r
X-purgate-ID: tlsNG-16d1c6/1784057708-1FCCD77B-08F52DE8/0/0
X-purgate-type: clean
X-purgate-size: 331
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,broadcom.com,hansenpartnership.com,oracle.com,suse.com,epam.com,garyguo.net,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,alien8.de,intel.com,vger.kernel.org,amd.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[mhi@mailbox.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:ecree.xilinx@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:justin.tee@broadcom.com,m:paul.ely@broadcom.com,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:bp@alien8.de,m:tony.luck@intel.com,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-net-drivers@amd.com,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-edac@vger.kernel.org,m:lukas@wunner.de,m:mhi@mailbox.org,m:ecreexilinx@gmail.com,m:andrew@l
 unn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhi@mailbox.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BAA3758508

On Sun Jul 12, 2026 at 4:28 PM CEST, Lukas Wunner wrote:

> We already have the priv_flags member in struct pci_dev,
> please use that instead of adding another one for the same purpose.
>
v2 moves the bit into priv_flags and exposes accessor functions
for those drivers which needs to access the flags.

Best,

Maurice

