Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BC5jKtU9OmpY4gcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:03:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267CC6B5108
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:03:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=gnQ5dqaK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1344127.1603253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbw68-0004uG-8g; Tue, 23 Jun 2026 08:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344127.1603253; Tue, 23 Jun 2026 08:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbw68-0004rr-61; Tue, 23 Jun 2026 08:03:08 +0000
Received: by outflank-mailman (input) for mailman id 1344127;
 Tue, 23 Jun 2026 08:03:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef3811474000701b@swg.vates.tech>)
 id 1wbw66-0004rl-0I
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 08:03:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbw64-00EGSm-J3
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 10:03:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef3811474000701b@swg.vates.tech>)
 id 6a3a3db7-2eae-0a2a0a5409dd-0a2a4504d496-8
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:03:04 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ef3811474000701b@swg.vates.tech>)
 id 6a3a3db7-5f9f-0a2a45040019-b9ff1c129281-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:03:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ef3811474000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 23 Jun 2026 08:03:03 +0000
Received: from [192.168.1.115] (91-171-21-26.subs.proxad.net [91.171.21.26])
 (Authenticated sender: yann.sionneau)
 by mail2.vates.fr (Postfix) with ESMTPSA id 34C5D86101;
 Tue, 23 Jun 2026 10:02:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Se0pRPZ9KRUWJKvy/UYyanzzNfqpxrGn7XqQ82gckMA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gnQ5dqaKL8Ftq3XG8qeaCIzpmP9TP+ilTVghbn4iMr6zaGyA6VNYHcg1uOEDQCxi9rFOmlmSr
 KzZE5ruVXXy5gFt+VjV8Ei5gSxK6ZpHxBDaEH67HjJXoesNtMesph176LXLKBvXuYOX7Mk2JNmL
 svKUYkP9bOpz0a9tPQHDtZ4BWqDGD6cBZZRBr5y/apvkLx+R7zwRmLjxwZvR0SD91XGBobe+Rud
 Rw0WdoxB4BPESOYLZC0dDpL1mVA4gZvzYtMkLAaS0G9dxY3k4lwLbK4XhQExEBNMIeKJppp4l2M
 IlDpU3sJRZxfKAC5H8udTDUMQPuqRsxBnnGhMXGVvhMg==
X-Zone-Loop: e1e4a256ed57e3af718e261e95e7ccf41d3ad3c63457
x-campaign-type: default
x-transaction-id: c7bc1790-a51b-4083-9b71-f4901f91f39a
x-swg-uid: 01-daee7f93-2bd5-44a7-a28a-ba783af6e8fc
X-Mailer: Sweego
Message-ID:
 <1782201783.8631fc262581453bbf619ec5b2062170.19ef3811474000701b@vates.tech>
x-swg-bid: 1782201783.8631fc262581453bbf619ec5b2062170.19ef3811474000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 23 Jun 2026 10:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
Content-Language: en-US
From: Yann Sionneau <yann.sionneau@vates.tech>
In-Reply-To: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.48.dbfd9ad3582ba6a9.19ef38100f9.45c0eae79d3c40a7=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782201778429
X-purgate-ID: tlsNG-ebf023/1782201784-4C98B141-EE1EE54B/0/0
X-purgate-type: clean
X-purgate-size: 1214
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	FORGED_MUA_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,invisiblethingslab.com,apertussolutions.com,gmail.com];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[yann.sionneau@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUBJECT_HAS_QUESTION(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yann.sionneau@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 267CC6B5108

---=Part.48.dbfd9ad3582ba6a9.19ef38100f9.45c0eae79d3c40a7=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 6/16/26 18:20, Jan Beulich wrote:
> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such section=
s,
> yet we need to access it ourselves when switching out of "physical mode"=
=2E
> Leverage behavior new to GNU ld 2=2E46: Any contribution to =2Ereloc whi=
ch
> doesn't have the discardable flag set (which cannot even be expressed in
> ELF) will yield the output section also non-discardable=2E
>=20
> Since for intermediate binaries we don't care about section attributes,
> link in the new object only on the final linking pass=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>
Can I get a Reported-by tag on this one?
Since I reported the issue with a patch a few months ago:=20
https://lore=2Ekernel=2Eorg/xen-devel/20250724140731=2E1502774-1-yann=2Esi=
onneau@vates=2Etech/

Thanks and congratz for the binutils fixes integration!

Regards,


--=20


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech

---=Part.48.dbfd9ad3582ba6a9.19ef38100f9.45c0eae79d3c40a7=---

